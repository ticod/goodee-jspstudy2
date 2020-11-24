<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>문제: 두 개의 파라미터 값을 더하기</title>
</head>
<body>
<form method="post">
    x: <input type="text" name="x" value="${param.x}"> <br>
    y: <input type="text" name="y" value="${param.y}"> <br>
    <input type="submit" value="더하기">
</form>
<c:set var="result" value="${param.x + param.y}" />
<h3>결과: ${result}</h3>
<h2>if 태그</h2>
${result} =>
<c:if test="${result > 0}">양수</c:if>
<c:if test="${result < 0}">음수</c:if>
<c:if test="${result == 0}">ZERO</c:if>
<h2>choose when 태그</h2>
${result} =>
<c:choose>
    <c:when test="${result > 0}">양수</c:when>
    <c:when test="${result == 0}">ZERO</c:when>
    <c:otherwise>음수</c:otherwise>
</c:choose>
<h2>삼항 연산자</h2>
${result} => ${result > 0 ? "양수" : (result < 0) ? "음수" : "ZERO"}
</body>
</html>
