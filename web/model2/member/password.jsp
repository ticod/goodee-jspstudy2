<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<script>
    alert("${msg}");
    <c:choose>
        <c:when test="${opener}">
    opener.location.href = "${url}";
        </c:when>
        <c:otherwise>
    location.href = "${url}";
        </c:otherwise>
    </c:choose>
    <c:if test="${closer}">
    window.close();
    </c:if>
</script>