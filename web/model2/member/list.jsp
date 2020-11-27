<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 목록 페이지</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table>
    <caption>회원 목록</caption>
    <tr>
        <th>아이디</th>
        <th>사진</th>
        <th>이름</th>
        <th>성별</th>
        <th>전화</th>x
        <th style="background-color:#FFCC00;">관리</th>
    </tr>
    <c:forEach var="member" items="${members}">
    <tr>
        <td>
            <a href="info.me?id=${member.id}">${member.id}</a>
        </td>
        <td>
            <img src="picture/sm_${member.picture}" width="40" height="45" style="object-fit: contain;">
        </td>
        <td>
            ${member.name}
        </td>
        <td>
            ${(member.gender == 1) ? "남" : "여"}
        </td>
        <td>
            ${member.tel}
        </td>
        <td>
            <a href="updateform.me?id=${member.id}">[수정]</a>
            <c:if test="${member.id != 'admin'}">
            <a href="deleteform.me?id=${member.id}">[강제 탈퇴]</a>
            </c:if>
        </td>
    </tr>
    </c:forEach>
    <tr>
        <td colspan="6">
            <a href="main.me" style="text-align: left">[돌아가기]</a>
        </td>
    </tr>
</table>
</body>
</html>
