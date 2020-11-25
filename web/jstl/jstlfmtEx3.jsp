<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>fmt 태그 : 인코딩</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="jobs" value="${fn:join(paramValues.job, ',')}" />
<form method="post" name="f">
    이름: <input type="text" name="name" value="${param.name}"> <br>
    입사일: <input type="text" name="hiredate" value="${param.hiredate}"> yyyy-MM-dd 형태로 입력 <br>
    급여: <input type="text" name="salary" value="${param.salary}"> <br>
    담당업무:
    <input type="checkbox" name="job" value="서무" <c:if test="${fn:contains(jobs, '서무')}"> checked </c:if>> 서무
    <input type="checkbox" name="job" value="개발" <c:if test="${fn:contains(jobs, '개발')}"> checked </c:if>> 개발
    <input type="checkbox" name="job" value="비서" <c:if test="${fn:contains(jobs, '비서')}"> checked </c:if>> 비서
    <input type="checkbox" name="job" value="운용" <c:if test="${fn:contains(jobs, '운용')}"> checked </c:if>> 운용 <br>
    <input type="submit" value="전송">
</form>
<hr>
이름: ${param.name} <br>
입사일: ${param.hiredate} <br>
급여: ${param.salary} <br>
담당업무: <c:forEach var="j" items="${paramValues.job}">${j} &nbsp;</c:forEach> <br>
<hr>
<h3>연봉과 입사일을 특정 포맷에 맞게 출력</h3>
<c:catch var="formatException">
    <fmt:parseDate value="${param.hiredate}" var="hiredate" pattern="yyyy-MM-dd"/>
</c:catch>
${formatException} <br>
<fmt:parseNumber value="${param.salary}" var="integerSalary"/>
이름: ${param.name} <br>
<c:choose>
    <c:when test="${formatException == null}">
        입사일: <fmt:formatDate value="${hiredate}" pattern="yyyy년 MM월 dd일 E요일" /> <br>
    </c:when>
    <c:otherwise>
        입사일은 yyyy-MM-dd 형태로 입력하세요 <br>
    </c:otherwise>
</c:choose>
급여: <fmt:formatNumber value="${integerSalary}" pattern="##,###" /> <br>
연봉: <fmt:formatNumber value="${integerSalary * 12}" pattern="##,###" /> <br>
담당업무: <c:forEach var="j" items="${paramValues.job}">${j} &nbsp;</c:forEach> <br>

<h1>Summary</h1>
<pre>
    catch : 그 지역에서 예외가 발생하면 해당 예외를 var 변수에 넣음
            만약 예외가 발생하지 않았다면 해당 변수는 null
    fn : 함수
    join : 배열을 특정 문자로 묶음 (js와 유사)
    contains : 문자열에 해당하는 문자가 있는지 체크
</pre>
</body>
</html>
