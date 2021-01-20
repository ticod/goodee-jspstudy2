<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="w3-table-all">
    <caption>
        수출입 은행: <fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm" />
    </caption>
    <tr>
        <th>기준율</th>
        <th>받을 때</th>
        <th>파실 때</th>
    </tr>
    <tr>
        <td>${list[3]}</td>
        <td>${list[1]}</td>
        <td>${list[2]}</td>
    </tr>
</table>
