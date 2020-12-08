<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>삭제 페이지</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="delete.me" method="post" name="f" onsubmit="return inputCheck(this)">
    <input type="hidden" name="id" value="${param.id}">
    <table class="w3-table-all w3-centered w3-card-4" style="margin: 20px;">
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="탈퇴하기">
            </td>
        </tr>
    </table>
</form>
<script>
function inputCheck(f) {
    if (f.pass.value === "") {
        alert("비밀번호를 입력하세요");
        f.pass.focus();
        return false;
    }
}
</script>
</body>
</html>