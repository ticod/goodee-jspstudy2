<%--
  Date: 2020-11-17
--%>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 화면</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="login.me" method="post" name="f" onsubmit="return inputCheck(this)">
    <table>
        <caption>로그인</caption>
        <tr>
            <th>아이디</th>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="로그인">
                <input type="button" value="회원가입" onclick="location.href='joinform.jsp'">
                <input type="button" value="아이디 찾기" onclick="winOpen('idform')">
                <input type="button" value="비밀번호 찾기" onclick="winOpen('pwform')">
            </td>
        </tr>
    </table>
</form>
<script>
    function inputCheck(f) {
        if (f.id.value === '') {
            alert('아이디를 입력하세요');
            f.id.focus();
            return false;
        }
        if (f.id.value.length < 4) {
            alert('아이디는 4자리 이상 입력하세요');
            f.id.focus();
            return false;
        }
        if (f.pass.value === '') {
            alert('비밀번호를 입력하세요');
            f.pass.focus();
            return false;
        }
        return true;
    }

    function winOpen(page) {
        const op = "width=500, height=350, left=50, top=150";
        open(page + ".jsp", "", op);
    }
</script>
</body>
</html>
