<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table>
    <tr>
        <th>
            아이디
        </th>
        <td>
            ${id}**
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <button onclick='idSubmit()'>아이디 전송</button>
        </td>
    </tr>
</table>
<script>
    function idSubmit() {
        const id = "${id}"
        const to = window.opener.document.f.id;
        to.value = id;
        window.close();
    }
</script>
</body>
</html>