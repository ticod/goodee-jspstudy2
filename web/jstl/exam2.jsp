<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>문제: 입력된 수까지의 합 구하기</title>
</head>
<body>
<form method="post">
    숫자: <input type="text" name="num" value="${param.num}">
    <input type="submit" value="숫자까지의 합 구하기">
</form>
<c:set var="sum" value="${0}"/>
<c:forEach var="i" begin="1" end="${param.num}">
    <c:set var="sum" value="${sum + i}"/>
</c:forEach>
<h3>if 태그</h3>
<c:if test="${sum % 2 == 0}">${sum} : 짝수</c:if>
<c:if test="${sum % 2 != 0}">${sum} : 홀수</c:if>
<h3>choose when 태그</h3>
<c:choose>
    <c:when test="${sum % 2 == 0}">${sum} : 짝수</c:when>
    <c:otherwise>${sum} : 홀수</c:otherwise>
</c:choose>
<h3>삼항 연산자</h3>
${sum} : ${sum % 2 == 0 ? "짝수" : "홀수"}
</body>
</html>
