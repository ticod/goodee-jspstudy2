<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 보기</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
    <table class="w3-table-all w3-centered w3-card-4" style="margin: 20px;">
        <tr>
            <td rowspan="7" width="30%"><img src="picture/${member.picture}" width="200" height="210" style="object-fit: contain;"></td>
            <th width="20%">아이디</th>
            <td>${member.id}</td>
        </tr>
        <tr>
            <th>이름</th>
            <td>${member.name}</td>
        </tr>
        <tr>
            <th>성별</th>
            <td>${member.gender == 1 ? "남" : "여"}</td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td>${member.tel}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${member.email}</td>
        </tr>
        <tr>
            <td colspan="2">
                <a class="w3-button w3-white w3-border" href="updateform.me?id=${member.id}">수정</a>
            <c:if test="${member.id != 'admin' && sessionScope.login != 'admin'}">
                <a class="w3-button w3-white w3-border" href="deleteform.me?id=${member.id}">탈퇴</a>
            </c:if>
                <a class="w3-button w3-white w3-border" href="main.me">돌아가기</a>
            </td>
        </tr>
    </table>
</body>
</html>
