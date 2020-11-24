<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>elEx1.jsp의 결과 화면</title>
</head>
<body>
<p>EL(Expression Language, 표현언어) : 표현식을 대체할 수 있는 언어</p>
<%
    request.setCharacterEncoding("utf-8");
    String tel = "010-1111-2222";
    pageContext.setAttribute("tel", tel);
    pageContext.setAttribute("test", "pageContext test 속성");
    request.setAttribute("test", "request test 속성");
    application.setAttribute("test", "application test 속성");
%>
<h3>JSP의 스크립트릿을 이용하여 파라미터와 속성 값 출력</h3>
pageContext test 속성 값: <%=pageContext.getAttribute("test")%> <br>
session test 속성 값: <%=session.getAttribute("test")%> <br>
today 속성 값: <%=session.getAttribute("today")%> <br>
name 파라미터 값: <%=request.getParameter("name")%> <br>
tel 변수 값: <%=tel%> <br>
tel 속성 값: <%=pageContext.getAttribute("tel")%> <br>
noAttr 속성 값: <%=pageContext.getAttribute("noAttr")%> <br>
noParam 속성 값: <%=request.getAttribute("noParam")%> <br> <br>

<h3>JSP의 EL을 이용하여 파라미터와 속성 값 출력</h3>
pageContext test 속성 값: ${test} <br>
session test 속성 값: ${sessionScope.test} <br>
today 속성 값: ${today} <br>
name 파라미터 값: ${param.name} <br>
tel 변수 값 (EL로 표현 불가): <%=tel%> <br>
tel 속성 값: ${tel} <br>
noAttr 속성 값: ${noAttr} <br>
noParam 속성 값: ${param.noparam} <br> <br>

<h3>영역을 설정하여 test 속성 값 출력하기</h3>
\${test} = ${test} <br>
\${pageScope.test} = ${pageScope.test} <br>
\${requestScope.test} = ${requestScope.test} <br>
\${sessionScope.test} = ${sessionScope.test} <br>
\${applicationScope.test} = ${applicationScope.test} <br>
\${tel} = ${tel} <br>
\${requestScope.tel} = ${requestScope.tel} <br> <!-- 빈 값 출력 (없음) -->
\${today} = ${today} <br>
\${sessionScope.today} = ${sessionScope.today} <br>

<h1> Summary </h1>
EL : JSP의 스트립트 태그를 대신하여 좀 더 편리하고, 가독성 좋게 출력하기 위해 제공 <br>
1. null은 빈 값으로 출력된다. <br>
2. 기본적으로 큰 범위에서 작은 범위로 속성을 찾는다. <br>
3. 특정 범위의 속성을 정해주는 경우 (범위)Scope.(속성)으로 찾는다. <br>
ex) pageContextScope.example / sessionScope.example <br>
4. param : 파라미터 값을 얻어올 때, paramValues : 파라미터 값을 배열로 얻어올 때 (request.getParameterValues)
5. header : header 정보를 얻어올 때, headerValues : header 정보를 배열로 얻어올 때
6. cookie : 쿠키 객체 참조
7. initParam : 컨텍스트의 초기화 파라미터
8. pageContext : pageContext 객체 참조 == jsp의 pageContext와 동일한 객체

<h3>큰 범위 -> 작은 범위</h3>
pageContext -> request -> session -> application -> 빈 값 (null이 아님) <br>

</body>
</html>
