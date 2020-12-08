<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판 글쓰기</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="write.do" method="post" enctype="multipart/form-data" name="f">
    <table class="table table-bordered">
        <tr>
            <th style="width:20%" class="table-active">글쓴이</th>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th class="table-light">비밀번호</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <th class="table-active">제목</th>
            <td><input type="text" name="subject"></td>
        </tr>
        <tr>
            <th class="table-light">내용</th>
            <td><textarea rows="25"
                          name="content"
                          id="content1">
            </textarea></td>
        </tr>
        <script>CKEDITOR.replace("content1", {
            filebrowserImageUploadUrl: "imgupload.do",
        })</script>
        <tr>
            <th class="table-active">첨부파일</th>
            <td><input type="file" name="file1"></td>
        </tr>
        <tr>
            <td class="table-light" colspan="2">
                <a class="btn btn-success" href="javascript:inputCheck()">게시물 등록</a>
                <a class="btn btn-outline-dark" href="list.do">돌아가기</a>
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
