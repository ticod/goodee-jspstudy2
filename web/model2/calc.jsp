<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Model2 연습</title>
</head>
<body>
<form action="calc.me" method="post">
    <input type="text" name="num1" value="${param.num1}" size="5">
    <select name="op">
        <option>+</option>
        <option>-</option>
        <option>*</option>
        <option>/</option>
    </select>
    <script>
        let op = '${param.op}';
        if (op == '') op = "+";
        document.forms[0].op.value = op;
    </script>
    <input type="text" name="num2" value="${param.num2}" size="5">
    <input type="submit" value="=">
    <input type="text" name="result" value="${result}" size="5">
</form>
</body>
</html>
