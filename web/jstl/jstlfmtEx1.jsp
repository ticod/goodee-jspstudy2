<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL 형식화 태그</title>
</head>
<body>
<h3>숫자 관련 형식 지정하기</h3>
<fmt:formatNumber value="500000" type="currency" currencySymbol="￦" /> <br>
<fmt:formatNumber value="0.15" type="percent" /> <br>
<fmt:formatNumber value="50000.345" pattern="###,###.00" /> <br>
<hr>

<h3>지역 설정</h3>
<fmt:setLocale value="en_US" />
<fmt:formatNumber value="500000" type="currency" /> <br>
<fmt:setLocale value="ko_KR" />
<fmt:formatNumber value="500000" type="currency" /> <br>
<hr>

<h3>날짜 관련 형식 지정하기</h3>
<c:set var="today" value="<%=new java.util.Date()%>" />
년월일: <fmt:formatDate value="${today}" type="date" /> <br>
시분초: <fmt:formatDate value="${today}" type="time" /> <br>
년월일시분초(base): <fmt:formatDate value="${today}" type="both" /> <br>
년월일시분초(short/short): <fmt:formatDate value="${today}" type="both" timeStyle="short" dateStyle="short" /> <br>
년월일시분초(long/long): <fmt:formatDate value="${today}" type="both" timeStyle="long" dateStyle="long" /> <br>
년월일시분초(full/full): <fmt:formatDate value="${today}" type="both" timeStyle="full" dateStyle="full" /> <br>
년월일시분초(full/full/GMT): <fmt:formatDate value="${today}" type="both" timeStyle="full" dateStyle="full" timeZone="GMT" /> <br>
형식지정: <fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 HH:mm:ss a E" /> <br>
<hr>

<h1>SUMMARY</h1>
<pre>
    (foo)Format class
    - format() : 자료형 => 형식화된 문자열
    - parse    : 형식화된 문자열 => 자료형
</pre>
</body>
</html>
