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
<form action="mailform.me" method="post" name="f">
<table class="w3-table-all w3-centered w3-card-4" style="margin: 20px;">
    <tr class="w3-black">
        <th>아이디</th>
        <th>사진</th>
        <th>이름</th>
        <th>성별</th>
        <th>전화</th>
        <th>이메일</th>
        <th>관리</th>
        <th><input class="w3-check" type="checkbox" name="allchk" onchange="checkAll(this)"></th>
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
            ${member.email}
        </td>
        <td>
            <a class="w3-button w3-white w3-border" href="updateform.me?id=${member.id}">수정</a>
            <c:if test="${member.id != 'admin'}">
            <a class="w3-button w3-white w3-border" href="deleteform.me?id=${member.id}">강제 탈퇴</a>
            </c:if>
        </td>
        <td>
            <input class="w3-check" type="checkbox" name="mailchk" value="${member.email}">
        </td>
    </tr>
    </c:forEach>
    <tr>
        <td colspan="8">
            <a class="w3-button w3-white w3-border" href="main.me">돌아가기</a>
            <input type="submit" class="w3-button w3-white w3-border" value="메일 전송">
        </td>
    </tr>
</table>
</form>
<script>
    function checkAll(checkbox) {

        const isChecked = checkbox.checked;
        const form = document.f;
        const reg = /\d/;

        for (let i in form.mailchk) {
            if (reg.test(i) && !isNaN(i)) {
                form.mailchk[i].checked = isChecked;
            }
        }
    }
</script>
</body>
</html>
