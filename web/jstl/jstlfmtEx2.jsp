<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL 형식 태그 예제 2</title>
</head>
<body>
<h3>format된 숫자를 일반 숫자로 변경</h3>
<fmt:parseNumber value="20,000" var="num1" pattern="##,###" />
<fmt:parseNumber value="10,000" var="num2" pattern="##,###" />
합: ${num1} + ${num2} = ${num1 + num2} <br>
<hr>

<h3>20,000 + 10,000 = 30,000 출력하기</h3>
합:
<fmt:formatNumber value="${num1}" pattern="##,###" /> +
<fmt:formatNumber value="${num2}" pattern="##,###" /> =
<fmt:formatNumber value="${num1 + num2}" pattern="##,###" /> <br>

<h3>20,000 + 10,000 = 30,000 출력하기 2</h3>
<fmt:formatNumber value="${num1}" var="snum1" pattern="##,###" />
<fmt:formatNumber value="${num2}" var="snum2" pattern="##,###" />
<fmt:formatNumber value="${num1 + num2}" var="sum" pattern="##,###" />
합: ${snum1} + ${snum2} = ${sum} <br>
<hr>

<h3>Format화된 날짜를 날짜 형으로 변경</h3>
<fmt:parseDate value="2020-12-25 12:00:00" pattern="yyyy-MM-dd HH:mm:ss" var="day" />
${day} <br>

<h3>2020-12-25 날짜의 요일 출력하기</h3>
<fmt:formatDate value="${day}" pattern="E" /> <br>

<h1>Summary</h1>
<pre>
    1. formatNumber에 변수를 지정해주지 않으면 바로 출력, 지정해주면 그 변수명에 저장된다.
</pre>
</body>
</html>
