<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
[
<c:forEach var="map" items="${list}" varStatus="i">
        <c:forEach var="m" items="${map}">
            <c:if test="${m.key == 'regdate'}">{</c:if>
            <c:if test="${m.key != 'regdate'}">,</c:if>
            "${m.key}": "${m.value}"
            <c:if test="${m.key != 'regdate'}">}</c:if>
        </c:forEach>
    <c:if test="${i.count < list.size()}">,</c:if>
</c:forEach>
]
