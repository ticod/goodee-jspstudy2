<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="password.me" method="post" name="f" onsubmit="return inCheck(this)">
    <table>
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
