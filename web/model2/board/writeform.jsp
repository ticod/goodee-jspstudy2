<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판 글쓰기</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="write.do" method="post" enctype="multipart/form-data" name="f">
    <table>
        <caption>게시판 글쓰기</caption>
        <tr>
            <th style="width:20%">글쓴이</th>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <th>제목</th>
            <td><input type="text" name="subject"></td>
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
                <a href="javascript:inputCheck()">[게시물 등록]</a>
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
