<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.member.Member" %>
<%@ page import="model.member.MemberDao" %><%--
  Date: 2020-11-18
--%>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="update.me" name="f" method="post" onsubmit="return inputCheck(this)">
    <table>
        <tr>
            <td rowspan="4">
                <input type="hidden" name="picture" value="${member.picture}">
                <img src="/picture/${member.picture}" width="100" height="120" id="pic"> <br>
                <font size="1"><a href="javascript:winUpload()">사진 수정</a></font>
            </td>
            <th>아이디</th>
            <td><input type="text" name="id" value="${member.id}" readonly></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><input type="text" name="name" value="${member.name}"></td>
        </tr>
        <tr>
            <th>성별</th>
            <td>
                <input type="radio" value="1" name="gender" ${member.gender == 1 ? "checked" : ""}> 남
                <input type="radio" value="2" name="gender" ${member.gender == 2 ? "checked" : ""}> 여
            </td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td colspan="2"><input type="text" name="tel" value="${member.tel}"></td>
        </tr>
        <tr>
            <th>이메일</th>
            <td colspan="2"><input type="text" name="email" value="${member.email}"></td>
        </tr>
        <tr>
            <td colspan="3">
                <input type="submit" value="회원정보 수정">
            <c:if test="${sessionScope.login != 'admin' || member.id == 'admin'}">
                <input type="button" value="비밀번호 수정" onclick="winPasswordChange()">
            </c:if>
                <input type="button" value="돌아가기" onclick="history.go(-1)">
            </td>
        </tr>
    </table>
</form>
<script>
function inputCheck(f) {
    if (f.pass.value === "") {
        alert("비밀번호를 입력하세요");
        f.pass.focus();
        return false;
    }
}

function winPasswordChange() {
    const op = "width=500, height=250, left=50, top=150";
    window.open("passwordform.me", "", op);
}

function winUpload() {
    const op = "width=500, height=500, left=50, top=150";
    window.open("pictureform.me", "", op);
}
</script>
</body>
</html>
