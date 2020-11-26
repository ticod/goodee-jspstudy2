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
<h3>${sessionScope.login} 로그인 되었습니다.</h3>
<h3><a href="logout.me">로그아웃</a></h3>
<h3><a href="info.me?id=${sessionScope.login}">회원 정보 보기</a></h3>
<c:if test="${sessionScope.login == 'admin'}">
    <h3><a href="list.me">회원 목록 보기</a></h3>
</c:if>
</body>
</html>