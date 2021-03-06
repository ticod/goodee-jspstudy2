<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${board.subject}</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table class="table table-bordered">
    <tr>
        <th style="width: 20%" class="table-active">글쓴이</th>
        <td>${board.name}</td>
    </tr>
    <tr>
        <th>제목</th>
        <td>${board.subject}</td>
    </tr>
    <tr style="height: 30vh;">
        <th class="table-active">내용</th>
        <td style="border-width: 1px; vertical-align: top; text-align: left;">
            ${board.content}
        </td>
    </tr>
    <tr>
        <th>첨부파일</th>

        <td>
            <c:if test="${!empty board.file1}">
                <a href="./file/${board.file1}">
                    ${board.file1}
                </a>
            </c:if>
            &nbsp;
        </td>

    </tr>
    <tr class="table-active">
        <td colspan="2">
            <a class="btn btn-outline-dark" href="replyform.do?num=${board.num}">답변</a>
            <a class="btn btn-outline-dark" href="updateform.do?num=${board.num}">수정</a>
            <a class="btn btn-outline-dark" href="deleteform.do?num=${board.num}">삭제</a>
            <a class="btn btn-outline-dark" href="list.do">목록</a>
        </td>
    </tr>
</table>
</body>
</html>