<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>core 태그: 조건문 예제</title>
</head>
<body>
<h3>조건문 관련 태그 : if, choose</h3>
<c:if test="${5 < 10}">
    <h4>5는 10보다 작다</h4>
</c:if>
<% if (5 < 10) { %>
    <h4>5는 10보다 작다</h4>
<% } %>
<c:if test="${6 + 3 != 9}">
    <h4>6 + 3은 9가 아니다</h4>
</c:if>
<c:choose>
    <c:when test="${5 + 10 == 25}">
        <h4>5 + 10은 25다</h4>
    </c:when>
    <c:when test="${5 + 10 == 150}">
        <h4>5 + 10은 150이다</h4>
    </c:when>
    <c:when test="${5 + 10 == 510}">
        <h4>5 + 10은 510이다</h4>
    </c:when>
    <c:otherwise>
        <h4>5 + 10은 모른다</h4>
    </c:otherwise>
</c:choose>

<h1>Summary</h1>
<p>1. else 태그는 없음 -> choose 태그의 otherwise를 이용해야한다.</p>
<p>2. 스크립트릿에는 모든 자바 소스가 올 수 있기 때문에 </p>
<p>무슨 코드가 올지 예측할 수 없고, 이 부분에서 jstl은 가독성이 확실히 좋다.</p>
</body>
</html>
