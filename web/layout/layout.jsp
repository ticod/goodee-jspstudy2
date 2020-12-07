<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><decorator:title /></title>
    <decorator:head />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<!-- Header -->
<div class="jumbotron" style="margin-bottom: 0">
    <div class="container text-center">
        <h2>자바 / 스프링 기반 빅데이터 플랫폼 개발자 양성과정 모델2 프로그램 연습</h2>
    </div>
</div>

<!-- Nav Bar -->
<nav class="navbar navbar-expand-md bg-dark navbar-dark">

    <!-- Toggler/collapsibe Button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar links -->
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="navbar-brand">
                목록
            </li>
            <li class="nav-item">
                <a href="${path}/model2/member/main.me"
                   class="nav-link">
                    회원관리
                </a>
            </li>
            <li class="nav-item">
                <a href="${path}/model2/board/list.do"
                   class="nav-link">
                    게시판
                </a>
            </li>
            <li class="nav-item">
                <a href="${path}/model2/chat/chatform.do"
                   class="nav-link">
                    채팅
                </a>
            </li>
        </ul>
    </div>

    <c:if test="${empty sessionScope.login}">
        <ul class="navbar-nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link"
                   href="${path}/model2/member/loginform.me">로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${path}/model2/member/joinform.me">회원가입</a>
            </li>
        </ul>
    </c:if>
    <c:if test="${!empty sessionScope.login}">
        <ul class="navbar-nav justify-content-end">
            <li class="nav-item">
                <div class="navbar-brand">${sessionScope.login}님이 로그인하셨습니다. &nbsp; &nbsp;</div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${path}/model2/member/logout.me">로그아웃</a>
            </li>
        </ul>
    </c:if>
</nav>

<!-- Side Bar & Contents -->
<div class="jumbotron jumbotron-fluid bg-white">
    <div class="container">
        <decorator:body />
    </div>
</div>

<!-- Footer -->
<div class="jumbotron jumbotron-fluid bg-dark text-white">
    <div class="container text-right">
        <h5>구디아카데미 Since 2016</h5>
        <p>email: asdf@asdf.com</p>
    </div>
</div>
</body>
</html>
