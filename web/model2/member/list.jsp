<%@ page import="model.member.Member" %>
<%@ page import="java.util.List" %>
<%@ page import="model.member.MemberDao" %>
<%--
  Date: 2020-11-18
--%>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- 로그인 아이디 검색 -->
<%
    String sessionId = (String)session.getAttribute("login");

    // 로그아웃 상태인 경우
    if (sessionId == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = "loginform.jsp";
</script>

<!-- 관리자가 아닌 경우-->
<% } else if (!sessionId.equals("admin")) { %>
<script>
    alert("관리자만 가능합니다.");
    location.href = "main.jsp";
</script>

<!-- 관리자인 경우 목록 출력 -->
<% } else { %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 목록 페이지</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<% List<Member> members = new MemberDao().selectAll(); %>
<table>
    <caption>회원 목록</caption>
    <tr>
        <th>아이디</th>
        <th>사진</th>
        <th>이름</th>
        <th>성별</th>
        <th>전화</th>
        <th style="background-color:#FFCC00;">관리</th>
    </tr>
    <% for (Member member : members) { %>
    <tr>
        <td>
            <a href="info.jsp?id=<%=member.getId()%>"><%=member.getId()%></a>
        </td>
        <td>
            <img src="/picture/sm_<%=member.getPicture()%>" width="40" height="45">
        </td>
        <td>
            <%=member.getName()%>
        </td>
        <td>
            <%=member.getGender() == 1 ? "남" : "여"%>
        </td>
        <td>
            <%=member.getTel()%>
        </td>
        <td>
            <a href="updateform.me?id=<%=member.getId()%>">[수정]</a>
            <% if (!member.getId().equals("admin")) { %>
            <a href="deleteform.me?id=<%=member.getId()%>">[강제 탈퇴]</a>
            <% } %>
        </td>
    </tr>
    <% } %>
    <tr>
        <td colspan="6">
            <a href="main.me" style="text-align: left">[돌아가기]</a>
        </td>
    </tr>
</table>
</body>
</html>
<% } %>
