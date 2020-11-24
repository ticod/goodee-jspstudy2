<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>core 태그: 반복문 예제</title>
</head>
<body>
<h3>반복문 관련 태그: forEach</h3>

<h3>step X</h3>
<c:forEach var="test" begin="1" end="10">
    ${test} &nbsp; &nbsp; &nbsp; &nbsp;
</c:forEach>

<h3>step 2</h3>
<c:forEach var="test" begin="1" end="10" step="2">
    ${test} &nbsp; &nbsp; &nbsp; &nbsp;
</c:forEach>

<h3>1 ~ 100까지의 합</h3>
<c:forEach var="i" begin="1" end="100">
    <c:set var="sum" value="${sum + i}"/>
</c:forEach>
1부터 100까지의 합: ${sum} <br>

<h3>1 ~ 100까지의 홀수 합</h3>
<c:set var="sum" value="${0}"/>
<c:forEach var="i" begin="1" end="100">
    <c:if test="${(i % 2) == 1}">
        <c:out value="${i}" />
        <c:set var="sum" value="${sum + i}"/>
    </c:if>
</c:forEach> <br>
1부터 100까지의 홀수 합: ${sum} <br>

<h3>1 ~ 100까지의 짝수 합</h3>
<c:set var="sum" value="${0}"/>
<c:forEach var="i" begin="2" end="100" step="2">
    <c:out value="${i}" />
    <c:set var="sum" value="${sum + i}"/>
</c:forEach> <br>
1부터 100까지의 짝수 합: ${sum} <br>

<h3>구구단 출력</h3>
<c:forEach var="i" begin="2" end="9">
    <h4>${i}단</h4>
    <c:forEach var="j" begin="2" end="9">
        ${i} * ${j} = ${i * j}
    </c:forEach>
    <br>
</c:forEach>

<h3>List 출력</h3>
<%
    List<Integer> list = new ArrayList<>();
    for(int i = 1; i <= 10; i++) list.add(i * 10);
    pageContext.setAttribute("list", list);
%>
<c:forEach var="l" items="${list}" varStatus="stat">
    ${stat.count}: ${l} <br>
</c:forEach>

<h3>Map 출력</h3>
<%
    Map<String, Object> map = new HashMap<>();
    map.put("string", "홍길동");
    map.put("today", new Date());
    map.put("list", list);
    pageContext.setAttribute("map", map);
%>
<c:forEach var="m" items="${map}">
    ${m.key} : ${m.value} <br>
</c:forEach>

<h3>Array 출력</h3>
<c:set var="arr" value="<%=new int[]{10, 20, 30, 40, 50}%>"/>
<c:forEach var="a" items="${arr}" varStatus="stat">
    arr[${stat.index}] = ${a} <br>
</c:forEach>
<hr>
<c:forEach var="a" items="${arr}" varStatus="stat">
    arr[${stat.index}] = ${arr[stat.index]} <br>
</c:forEach>

<h3>인덱스 범위로 출력</h3>
<c:set var="arr" value="<%=new int[]{10, 20, 30, 40, 50}%>"/>
<c:forEach var="a" items="${arr}" varStatus="stat" begin="1" end="2">
    arr[${stat.index}] = ${a} <br>
</c:forEach>
<c:forEach var="a" items="${list}" varStatus="stat" begin="1" end="2">
    list ${stat.index} = ${a} <br>
</c:forEach>

<h3>특정 인덱스 출력</h3>
arr[0] : ${arr[0]} <br>
list[9] : ${list[9]} <br>

<hr>
<h1>Summary</h1>
</body>
</html>
