<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><decorator:title /></title>
    <decorator:head />
    <link rel="stylesheet" href="${path}/css/main.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
    </style>
</head>
<body class="w3-light-grey">
<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
    <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i> &nbsp;Menu</button>
    <span class="w3-bar-item w3-right">회원 관리</span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row">
        <c:if test="${empty sessionScope.login}">
            <div class="w3-col s6 w3-button"
                 style="cursor:pointer; text-align: center;"
                 onclick="location.href = '${path}/model2/member/loginform.me';">
                <i class='fas fa-sign-in-alt'></i>&nbsp;&nbsp; 로그인&nbsp;
            </div>
            <div class="w3-col s6 w3-bar w3-button"
                 style="cursor:pointer; text-align: center;"
                 onclick="location.href = '${path}/model2/member/joinform.me';">
                <i class='fas fa-stamp'></i>&nbsp;&nbsp; 회원가입&nbsp;
            </div>
        </c:if>
        <c:if test="${!empty sessionScope.login}">
        <div class="w3-col s4">
            <i class="fa fa-user w3-jumbo"></i>
        </div>
        <div class="w3-col s8 w3-bar">
            <span>Welcome, <strong>${sessionScope.login}</strong></span><br>
            <a href="${path}/model2/member/main.me" class="w3-bar-item w3-button"><i class="fa fa-home"></i></a>
            <a href="${path}/model2/member/info.me?id=${sessionScope.login}" class="w3-bar-item w3-button"><i class="fa fa-search"></i></a>
            <a href="${path}/model2/member/logout.me" class="w3-bar-item w3-button"><i class="fa fa-close"></i></a>
        </div>
        </c:if>
    </div>
    <hr>
    <div class="w3-container">
        <h5>Dashboard</h5>
    </div>
    <div class="w3-bar-block">
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a>
        <a href="${path}/model2/member/main.me" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-users fa-fw"></i>&nbsp; 회원 관리</a>
        <a href="${path}/model2/board/list.do" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>&nbsp; 게시판</a>
        <a href="${path}/model2/chat/chatform.do" class="w3-bar-item w3-button w3-padding"><i class="fas fa-comments fa-fw"></i>&nbsp; 채팅</a>
    </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
    <decorator:body />

    <!-- Footer -->
    <footer class="w3-container w3-padding-16 w3-light-grey">
        <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
    </footer>

    <!-- End page content -->
</div>

<script>
    // Get the Sidebar
    var mySidebar = document.getElementById("mySidebar");

    // Get the DIV with overlay effect
    var overlayBg = document.getElementById("myOverlay");

    // Toggle between showing and hiding the sidebar, and add overlay effect
    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
            overlayBg.style.display = "none";
        } else {
            mySidebar.style.display = 'block';
            overlayBg.style.display = "block";
        }
    }

    // Close the sidebar with the close button
    function w3_close() {
        mySidebar.style.display = "none";
        overlayBg.style.display = "none";
    }
</script>

</body>
</html>