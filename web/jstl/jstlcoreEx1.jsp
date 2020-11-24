<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>JSTL core 태그</title>
</head>
<body>
<h3>속성 설정 태그: set, remove, out 태그</h3>
<c:set var="test" value="${'Hello JSTL'}" scope="session" />
test 속성: ${sessionScope.test} <br>
test 속성: <c:out value="${test}" /> <br>
test 속성: ${test} <br>
<c:remove var="test" />
test 속성: ${test} <br>

<c:set var="test" value="<%=new Date()%>" scope="session" />
test 속성: ${sessionScope.test} <br>
test 속성: <c:out value="${test}" /> <br>
test 속성: ${test} <br>
<c:remove var="test" />
test 속성: ${test} <br>

<hr>
<h1>Summary</h1>
1. c:set으로 setAttribute가 가능하다. <br>
이 때, 스크립트태그, EL, 그냥 문자열 다 가능하다. <br> <br>
2. c:out으로 출력이 가능하다. <br>
기본적으로 그냥 EL로도 출력이 가능하다. <br>
c:out의 경우 XSS escape 처리를 알아서 해준다는 장점이 있다 <br> <br>
(< -> gt; 와 같은 방식으로) <br>
3. c:remove로 removeAttribute가 가능하다. <br> <br>
</body>
</html>
