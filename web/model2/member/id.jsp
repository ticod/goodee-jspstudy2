<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="../../css/main.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
    </style>
</head>
<body>
<table class="w3-table-all w3-centered w3-card-4" style="margin: 20px;">
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