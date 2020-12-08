<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판</title>
<%--    <link rel="stylesheet" href="../../css/main.css">--%>
</head>
<body>
<form class="form-group" action="list.do" method="post" name="sf">
    <div style="display: flex; justify-content: center;">
        <input type="hidden" name="pageNum" value="1" style="width: 10%">
        <select class="form-control" name="column">
            <option value="">분류</option>
            <option value="subject">제목</option>
            <option value="name">작성자</option>
            <option value="content">내용</option>
            <option value="subject,name">제목 + 작성자</option>
            <option value="subject,content">제목 + 내용</option>
            <option value="name, content">작성자 + 내용</option>
            <option value="subject,name,content">제목 + 작성자 + 내용</option>
        </select>
        <script>document.sf.column.value = "${param.column}";</script>
        <input class="form-control" type="text" name="find" value="${param.find}" style="width: 50%;">
        <input class="btn btn-success" type="submit" value="검색">
    </div>
<table class="table table-striped table-hover text-center">
    <c:choose>
        <c:when test="${boardCount <= 0}">
        <thead class="thead-dark">
            <tr><td colspan="5">등록된 게시글이 없습니다</td></tr>
        </thead>
        </c:when>
        <c:otherwise>
        <thead class="thead-dark">
            <tr><td colspan="5" style="text-align: right">글 개수: ${boardCount}</td></tr>
            <tr></tr>
            <tr>
                <th width="8%">번호</th>
                <th width="50%">제목</th>
                <th width="14%">작성자</th>
                <th width="17%">등록일</th>
                <th width="11%">조회수</th>
            </tr>
        </thead>
            <c:forEach var="board" items="${boardList}">
            <tr>
                <td>${boardNum}</td><c:set var="boardNum" value="${boardNum - 1}"/>
                <td style="text-align: left">
                    <!-- 파일 -->
                    <span>
                    <c:if test="${empty board.file1}">
                        &nbsp;&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${!empty board.file1}">
                        <a style="text-decoration: none;" href="file/${board.file1}">@</a>
                    </c:if>
                    </span>

                    <!-- 답글 들여쓰기 -->
                    <span>
                        <c:if test="${board.grplevel > 0}">
                            <c:forEach begin="2" end="${board.grplevel}">
                            &nbsp;&nbsp;
                            </c:forEach>
                        └
                        </c:if>
                        <a href="info.do?num=${board.num}" class="text-dark"> ${board.subject} </a>
                    </span>
                </td>
                <td>${board.name}</td>
                <td>
                    <fmt:formatDate var="rDate" value="${board.regdate}"
                                    pattern="yyyy-MM-dd"/>
                    <c:choose>
                        <c:when test="${today == rDate}">
                            <fmt:formatDate value="${board.regdate}"
                                            pattern="HH:mm:ss"/>
                        </c:when>
                        <c:otherwise>
                            <fmt:formatDate value="${board.regdate}"
                                            pattern="yyyy-MM-dd HH:mm"/>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${board.readcnt}</td>
            </tr>
            </c:forEach>

            <tr>
                <td colspan="5">
                    <div class="d-flex justify-content-center">
                    <ul class="pagination">

                        <!-- 이전 페이지 -->
                        <c:choose>
                            <c:when test="${pageNum <= 1}">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#">
                                        Previous
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" href="#" onclick="movePage(${pageNum - 1})">
                                    Previous
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>

                        <!-- 페이지 목록 -->
                        <c:forEach var="i" begin="${startPage}" end="${endPage}">
                            <c:choose>
                                <c:when test="${i == pageNum}">
                                    <li class="page-item active">
                                        <a class="page-link" href="#">
                                                ${i}
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link" href="#" onclick="movePage(${i})">
                                                ${i}
                                        </a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <!-- 다음 페이지 -->
                        <c:choose>
                            <c:when test="${pageNum >= maxPage}">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#">
                                        Next
                                    </a>
                                </li>
                                </c:when>
                                <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" href="#" onclick="movePage(${pageNum + 1})">
                                        Next
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>

                    </ul>
                    </div>
                    </form>
                </td>
            </tr>
            <tr>
                <td colspan="5" style="text-align: right;">
                    <a href="writeform.do" class="btn btn-success">글쓰기</a>
                </td>
            </tr>
        </table>
        </c:otherwise>
    </c:choose>
<script>
    function movePage(pageNum) {
        document.sf.pageNum.value = pageNum;
        document.sf.submit();
    }
</script>
</body>
</html>