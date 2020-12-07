<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:if test="${empty sessionScope.login}">
    <script>
        alert("로그인 해주세요!");
        location.href = '../member/loginform.me';
    </script>
</c:if>
<c:if test="${!empty sessionScope.login}">
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채팅 화면</title>
</head>
<body>
<div style="width: 100%;">
    <textarea readonly="readonly"
              cols="50" rows="10"
              id="messageWindow"
              style="width: 96%;
                    resize: none;">
    </textarea> <br>
    <input type="text" id="inputMessage" style="width: 80%;" onkeydown="keyIn(event)">
    <input type="button" value="전송" style="width: 15%;" onclick="send()">
</div>
<script>
    const messageWindow = document.getElementById('messageWindow');
    const inputMessage = document.getElementById('inputMessage');
    const webSocket = new WebSocket("ws://172.30.1.59:8081${path}/chatting");

    webSocket.onerror = function(event) {
        onError(event);
    };

    webSocket.onopen = function(event) {
        onOpen(event);
        alert("즐거운 채팅, 비속어 금지!");
    };

    webSocket.onmessage = function(event) {
        onMessage(event);
    };

    function onMessage(event) {
        messageWindow.value += (event.data + "\n");
        messageWindow.scrollTop = messageWindow.scrollHeight;
    }

    function onOpen(event) {
        messageWindow.value += "연결 성공\n";
    }

    function onError(event) {
        alert("연결 실패..: " + event.data);
    }

    function keyIn(event) {
        if (event.keyCode == 13) {
            send();
        }
    }

    function send() {
        messageWindow.value += "${sessionScope.login} : " + inputMessage.value + "\n";
        webSocket.send("${sessionScope.login} : " + inputMessage.value);
        inputMessage.value = "";
        inputMessage.focus();
        messageWindow.scrollTop = messageWindow.scrollHeight;
    }
</script>
</body>
</html>
</c:if>