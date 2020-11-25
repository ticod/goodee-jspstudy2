<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TEST 2</title>
</head>
<body>
<c:choose>
    <c:when test="${paramValues.size() == 0}">
        <form method="post">
            이름: <input type="text" name="name"> <br>
            나이: <input type="text" name="age"> <br>
            성별: <input type="radio" name="gender" value="male" checked> 남
            <input type="radio" name="gender" value="female"> 여 <br>
            출생년도: <select name="birth">
            <c:forEach var="i" begin="1980" end="2010">
                <option value="${i}">${i}</option>
            </c:forEach>
            </select> <br>
            <input type="submit" value="전송">
        </form>
    </c:when>
    <c:otherwise>
        <fmt:parseDate var="paramBirth" value="${param.birth}" pattern="yyyy"/>
        <fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyy"/>
        이름: ${param.name} <br>
        나이: ${param.age} <br>
        성별: ${param.gender.equals("male") ? "남" : "여"} <br>
        출생년도: ${param.birth} <br>
        나이(만): 만 ${today - param.birth} <br>
    </c:otherwise>
</c:choose>
</body>
</html>
