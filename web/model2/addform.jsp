<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Model2 연습</title>
</head>
<body>
<form action="add.me" method="post">
    <input type="text" name="num1" value="${param.num1}">
    <input type="text" name="num2" value="${param.num2}">
    <input type="submit" value="=">
    <input type="text" name="result" value="${result}">
</form>
</body>
</html>
