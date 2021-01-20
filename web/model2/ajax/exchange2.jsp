<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="w3-table-all">
    <caption>
        하나 은행: ${date}
    </caption>
    <tr>
        <th rowspan="2">통화명</th>
        <th rowspan="2">기준율</th>
        <th colspan="2">현찰</th>
    </tr>
    <tr>
        <th>사실 때</th>
        <th>파실 때</th>
    </tr>

        <c:forEach items="${map}" var="list">
        <tr>
            <td>${list.key}(${list.value[0]})</td>
            <c:forEach items="${list.value}" var="v" begin="1">
                <td>${v}</td>
            </c:forEach>
        </tr>
        </c:forEach>

</table>
