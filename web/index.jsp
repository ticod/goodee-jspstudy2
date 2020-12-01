<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>MAIN</title>
  </head>
  <body>
  <%
    String currentPath = request.getParameter("path");
    File directory = new File("./");
    if (directory.isDirectory()) {

    }
  %>
  <script>
    location.href = "/model2/board/list.do";
  </script>
  </body>
</html>
