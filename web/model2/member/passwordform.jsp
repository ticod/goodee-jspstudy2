<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
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
<form action="password.me" method="post" name="f" onsubmit="return inCheck(this)">
    <table class="w3-table-all w3-centered w3-card-4" style="margin: 20px;">
        <caption>비밀번호 변경</caption>
        <tr>
            <th>현재 비밀번호</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <th>변경 비밀번호</th>
            <td><input type="password" name="chgpass"></td>
        </tr>
        <tr>
            <th>변경 비밀번호 확인</th>
            <td><input type="password" name="chgpass2"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="비밀번호 변경">
            </td>
        </tr>
    </table>
</form>
<script>
    function inCheck(f) {
        if (f.chgpass.value != f.chgpass2.value) {
            alert("변경 비밀번호와 재입력이 다릅니다");
            f.chgpass2.focus();
            return false;
        }
        return true;
    }
</script>
</body>
</html>
