<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><decorator:title /></title>
    <decorator:head />
    <link rel="stylesheet" href="${path}/css/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<!-- Header -->
<div class="row">
    <div class="col">
        자바/스프링 기반 빅데이터 플랫폼 개발자 양성과정 모델2 프로그램 연습
    </div>
    <div class="col">
        <c:if test="${empty sessionScope.login}">
            <a href="${path}/model2/member/loginform.me">로그인</a>
            <a href="${path}/model2/member/joinform.me">회원가입</a>
        </c:if>
        <c:if test="${!empty sessionScope.login}">
            ${sessionScope.login}님이 로그인하셨습니다. &nbsp; &nbsp;
            <a href="${path}/model2/member/logout.me">로그아웃</a>
        </c:if>
    </div>
</div>

<!-- Side Bar & Contents -->
<div class="row">

    <!-- Side Bar -->
    <div class="col-sm-2">
        <div class="list-group">
            <a href="${path}/model2/member/main.me"
               class="list-group-item list-group-item-action">
                회원관리
            </a>
            <a href="${path}/model2/board/list.do"
               class="list-group-item list-group-item-action">
                게시판
            </a>
            <a href="${path}/model2/chat/chatform.do"
               class="list-group-item list-group-item-action">
                채팅
            </a>
        </div>
    </div>

    <!-- Contents -->
    <div class="col-sm-10">
        <decorator:body />
    </div>

</div>

<!-- Footer -->
<div class="row">
    <div class="col">
        <td colspan="3">구디아카데미 Since 2016</td>
    </div>
</div>
</body>
</html>
