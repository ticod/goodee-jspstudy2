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
        <div class="w3-col s5">
            <c:if test="${empty sessionScope.profile}">
                <i class="fa fa-user w3-jumbo"></i>
            </c:if>
            <c:if test="${!empty sessionScope.profile}">
                <img src="/model2/member/picture/${sessionScope.profile}"
                     class="w3-round"
                     alt="Alps"
                     width="100" height="105" style="object-fit: contain;">
            </c:if>
        </div>
        <div class="w3-col s7 w3-bar">
            <span style="text-align: right;">Welcome, <strong>${sessionScope.login}</strong></span><br>
            <a href="${path}/model2/member/main.me" class="w3-bar-item w3-button"><i class="fa fa-home"></i></a>
            <a href="${path}/model2/member/info.me?id=${sessionScope.login}" class="w3-bar-item w3-button"><i class="fa fa-search"></i></a>
            <a href="${path}/model2/member/logout.me" class="w3-bar-item w3-button"><i class="fa fa-close"></i></a>
        </div>
        </c:if>
    </div>
    <hr>
    <div class="w3-bar-block">
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a>
        <a href="${path}/model2/member/main.me" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-users fa-fw"></i>&nbsp; 회원 관리</a>
        <a href="${path}/model2/board/list.do" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>&nbsp; 게시판</a>
        <a href="${path}/model2/chat/chatform.do" class="w3-bar-item w3-button w3-padding"><i class="fas fa-comments fa-fw"></i>&nbsp; 채팅</a>
    </div>
    <hr>
    <div class="w3-container">
        <h5>Dashboard</h5>
    </div>
    <div class="w3-container w3-padding-16" style="">
        <div id="pie-container" style="height: 20vh; width:80%; border:1px solid black;">
            <canvas id="canvas1" style="width: 100%; height: 100%;"></canvas>
        </div>
    </div>
    <div class="w3-container w3-padding-16">
        <div id="bar-container" style="height: 20vh; width:80%; border:1px solid black;">
            <canvas id="canvas2" style="width:100%; height: 100%;"></canvas>
        </div>
    </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
    <decorator:body />

    <!-- Footer -->
    <footer class="w3-container w3-padding-16 w3-light-grey">
        <div id="exchange"></div>
        <div id="exchange2"></div>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<!-- chart.js -->
<script>
    const randomColorFactor = function() {
        return Math.round(Math.random() * 255);
    };

    const randomColor = function(opacity) {
        return "rgba(" + randomColorFactor() + ","
            + randomColorFactor() + ","
            + randomColorFactor() + ","
            + (opacity || '.3') + ")";
    };

    const pieGraph = function() {
        $.ajax("${path}/model2/ajax/piegraph.do", {
            success: function(data) {
                pieGraphPrint(data);
            },
            error: function(e) {
                alert("서버 오류: " + e.status);
            }
        })
    };

    const barGraph = function() {
        $.ajax("${path}/model2/ajax/bargraph.do", {
            success: function(data) {
                barGraphPrint(data);
            },
            error: function(e) {
                alert("서버 오류: " + e.status);
            }
        })
    }

    const pieGraphPrint = function(data) {
        const rows = JSON.parse(data);
        let names = [];
        let datas = [];
        let colors = [];

        $.each(rows, function(index, item) {
            names[index] = item.name;
            datas[index] = item.cnt;
            colors[index] = randomColor(0.7);
        });

        const config = {
            type: "pie",
            data: {
                labels: names,
                datasets: [{
                    data: datas,
                    backgroundColor: colors
                }]
            },
            options: {
                responsive: true,
                legend: {
                    display: false,
                    position: "top"
                },
                title: {
                    display: true,
                    text: "글쓴이 별 게시판 등록 건수",
                    position: "bottom"
                }
            }
        };
        const ctx = document.getElementById("canvas1").getContext("2d");
        new Chart(ctx, config);
    }

    const barGraphPrint = function(data) {
        console.log(data);
        const rows = JSON.parse(data);
        let regdates = [];
        let datas = [];
        let colors = [];

        $.each(rows, function(index, item) {
            regdates[index] = item.regdate;
            datas[index] = item.cnt;
            colors[index] = randomColor(0.7);
        })
        const config = {
            type: "bar",
            labels: regdates,
            data: {
                labels: regdates,
                datasets: [
                    {
                        type: "bar",
                        label: "건수",
                        backgroundColor: colors,
                        data: datas
                    },
                    {
                        type: "line",
                        borderWidth: 2,
                        borderColor: colors,
                        label: "건수",
                        fill: false,
                        data: datas
                    }
                ]
            },
            options: {
                responsive: true,
                legend: {
                    display: false
                },
                title: {
                    display: true,
                    text: "최근 7일 게시판 등록 일수",
                    position: "bottom"
                },
                scales: {
                    xAxes: [{
                        display: false,
                        stacked: true,
                    }],
                    yAxes: [{
                        display: true,
                        stacked: true
                    }]
                }
            }
        };
        const ctx = document.getElementById("canvas2").getContext("2d");
        new Chart(ctx, config);
    }

    function exchangeRate() {
        $.ajax("${path}/model2/ajax/exchange.do", {
            success: function(data) {
                $("#exchange").html(data);
            },
            error: function(e) {
                alert("환율 조회 서버 오류: " + e.status);
            }
        })
    }

    function exchangeRate2() {
        $.ajax("${path}/model2/ajax/exchange2.do", {
            success: function(data) {
                $("#exchange2").html(data);
            },
            error: function(e) {
                alert("환율 조회 서버 오류: " + e.status);
            }
        })
    }

    $(function() {
        pieGraph();
        barGraph();
        exchangeRate();
        exchangeRate2();
    })
</script>

</body>
</html>