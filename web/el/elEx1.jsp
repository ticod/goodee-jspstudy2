<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EL (표현언어) 예제</title>
</head>
<body>
<%
    session.setAttribute("test", "session test 속성");
    session.setAttribute("today", new Date());
%>
<form action="elEx2.jsp" method="post">
    이름 <input type="text" name="name" value="홍길동">
    <input type="submit" value="전송">
</form>
</body>
</html>
