<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Date: 2020-11-17
--%>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 관리</title>
</head>
<body>
<div class="container w3-card-4" style="margin: 20px">
    <ul class="w3-ul">
        <li><h2>${sessionScope.login} 로그인 되었습니다.</h2></li>
        <li><h3><a href="logout.me">로그아웃</a></h3></li>
        <li><h3><a href="info.me?id=${sessionScope.login}">회원 정보 보기</a></h3></li>
        <c:if test="${sessionScope.login == 'admin'}">
        <li><h3><a href="list.me">회원 목록 보기</a></h3></li>
        </c:if>
    </ul>
</div>
</body>
</html>