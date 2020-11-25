<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TEST 1</title>
</head>
<body>
<form method="post">
    x: <input type="text" name="num1" value="${param.num1}" size="5">
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
    <label>y: <input type="text" name="num2" value="${param.num2}" size="5"></label>
    <input type="submit" value="="> <br>

    <c:if test="${paramValues.size() == 3}">
    <h3>${param.num1} ${param.op} ${param.num2} = <span id="result"></span></h3>
    <script>
        document.getElementById('result').innerText = eval("${param.num1}${param.op}${param.num2}");
    </script>
    </c:if>
</form>
</body>
</html>
