<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 삭제</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table class="table table-bordered">
    <form action="delete.do" name="f" method="post">
        <input type="hidden" name="num" value="${param.num}">
        <tr>
            <th>비밀번호 입력</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="게시글 삭제">
            </td>
        </tr>
    </form>
</table>
</body>
</html>
