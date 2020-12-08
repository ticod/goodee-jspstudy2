<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>메일 보내기</title>
    <script>
        function checkInputId(f) {
            if (f.naverId.value == "") {
                alert("네이버 아이디를 입력하세요");
                f.naverId.focus();
                return false;
            }
            if (f.naverPw.value == "") {
                alert("네이버 비밀번호를 입력하세요");
                f.naverPw.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="container w3-card-4" style="margin: 20px; padding: 20px">
<h2><i class='far fa-envelope-open' style='font-size:36px;'></i>&nbsp; 메일 보내기 </h2>
<form action="mail.me" name="mailform" method="post" onsubmit="return checkInputId(this)">

    <div class="w3-row w3-section">
        <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
        <div class="w3-rest">
            <input class="w3-input w3-border w3-hover-light-green"
                   type="text" name="naverId" id="naverId" placeholder="본인 네이버 ID">
        </div>
    </div>

    <div class="w3-row w3-section">
        <div class="w3-col" style="width:50px"><i class='fas fa-key' style='font-size:34px'></i></div>
        <div class="w3-rest">
            <input class="w3-input w3-border w3-hover-light-green"
                   type="password" name="naverPw" id="naverPw" placeholder="본인 네이버 비밀번호">
        </div>
    </div>

    <table class="w3-table-all w3-centered" style="margin-top: 30px">
        <tr>
            <td style="padding-top: 16px">받는 사람</td>
            <td>
                <input class="w3-input w3-border w3-hover-light-green" type="text" name="recipient" size="100"
                       value='<c:forEach items="${list}" var="mail">${mail},</c:forEach>'>
            </td>
        </tr>
        <tr class="table-active">
            <td style="padding-top: 16px">제목</td>
            <td><input class="w3-input w3-border w3-hover-light-green" type="text" name="title" size="100"></td>
        </tr>
        <tr>
            <td style="padding-top: 16px">메시지 형식</td>
            <td>
                <select class="w3-select w3-border" name="mtype">
                    <option value="text/html; charset=UTF-8">HTML</option>
                    <option value="text/plain; charset=UTF-8">TEXT</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <textarea class="w3-input w3-border w3-hover-light-green"
                          name="contents" id="" cols="120" rows="10" style="resize:none;"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input class="w3-button w3-white w3-border" type="submit" value="메일 보내기">
                <a class="w3-button w3-white w3-border" href="list.me">돌아가기</a>
            </td>
        </tr>
    </table>
</form>
</div>
</body>
</html>
