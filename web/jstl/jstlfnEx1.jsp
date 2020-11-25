<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL의 EL 함수 예제</title>
</head>
<body>
<c:set var="str1" value="Functions <태그>를 사용합니다." />
<c:set var="str2" value="사용" />
<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10" />
length(str1) = ${fn:length(str1)} : str1 문자열의 길이 return <br>
toUpperCase(str1) = ${fn:toUpperCase(str1)} : str1 모든 문자를 대문자로 <br>
toLowerCase(str1) =  ${fn:toLowerCase(str1)} : str1 모든 문자를 소문자로 <br>
substring(str1, 3, 6) = ${fn:substring(str1, 3, 6)} : str1의 3~5 부분문자열 return <br>
substringAfter(str1, str2) = ${fn:substringAfter(str1, str2)} : str1에서 str2 문자열 이후 문자열 return <br>
substringBefore(str1, str2) = ${fn:substringBefore(str1, str2)} : str1에서 str2 문자열 이전 문자열 return <br>
contains(str1, str2) = ${fn:contains(str1, str2)} : str1에 str2 문자열이 있는지? <br>
trim(str1) = ${fn:trim(str1)} : str1 공백 제거 <br>
replace(str1, " ", "-") = ${fn:replace(str1, " ", "-")} : replace <br>
split(tokens, ',') : split <br>
<c:set var="arr" value="${fn:split(tokens, ',')}" />
<c:forEach var="i" items="${arr}">
    ${i} &nbsp;
</c:forEach> <br>
join(arr, '-') = ${fn:join(arr, '-')} : join <br>
</body>
</html>
