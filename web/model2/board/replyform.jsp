<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>답글 달기</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="reply.do" method="post" name="f" enctype="multipart/form-data">
    <input type="hidden" name="num" value="${board.num}">
    <input type="hidden" name="grp" value="${board.grp}">
    <input type="hidden" name="grplevel" value="${board.grplevel}">
    <input type="hidden" name="grpstep" value="${board.grpstep}">
    <table>
        <caption>답글 등록</caption>
        <tr>
            <th>글쓴이</th>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <th>제목</th>
            <td><input type="text" name="subject" value="RE:${board.subject}"></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea rows="15" name="content"></textarea></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td><input type="file" name="file1"></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="javascript:inputCheck()">[답글 등록]</a>
            </td>
        </tr>
    </table>
</form>
<script>
    function inputCheck() {
        const f = document.f;
        if (f.name.value === "") {
            alert("글쓴이를 입력하세요");
            f.name.focus();
            return false;
        }
        if (f.pass.value === "") {
            alert("비밀번호를 입력하세요");
            f.pass.focus();
            return false;
        }
        if (f.subject.value === "") {
            alert("제목을 입력하세요");
            f.subject.focus();
            return false;
        }
        if (f.content.value === "") {
            alert("내용을 입력하세요");
            f.content.focus();
            return false;
        }
        f.submit();
    }
</script>
</body>
</html>