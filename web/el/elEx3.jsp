<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EL에서 연산자 사용하기</title>
</head>
<body>
<h3>\${5 + 7} = ${5 + 7}</h3>
<h3>\${8 - 3} = ${8 - 3}</h3>
<hr>

<h3>\${8 / 3} = ${8 / 3}</h3>
<h3>\${8 div 3} = ${8 div 3}</h3>
<hr>

<h3>\${8 % 3} = ${8 % 3}</h3>
<h3>\${8 mod 3} = ${8 mod 3}</h3>
<hr>

<h3>\${10 == 9} = ${10 == 9}</h3>
<h3>\${10 eq 9} = ${10 eq 9}</h3>
<hr>

<h3>\${10 != 9} = ${10 != 9}</h3>
<h3>\${10 ne 9} = ${10 ne 9}</h3>
<hr>

<h3>\${10 >= 9} = ${10 >= 9}</h3>
<h3>\${10 ge 9} = ${10 ge 9}</h3>
<hr>

<h3>\${10 < 9} = ${10 < 9}</h3>
<h3>\${10 lt 9} = ${10 lt 9}</h3>
<hr>

<h3>\${10 > 9} = ${10 > 9}</h3>
<h3>\${10 gt 9} = ${10 gt 9}</h3>
<hr>

<h3>\${5 + 4 == 8 ? 8 : 10} = ${5 + 4 == 8 ? 8 : 10}</h3>
<h3>\${10} = ${10}</h3>
<h3>\${"test"} = ${"test"}</h3>
<h3>\${'test'} = ${'test'}</h3>
<h3>\${test} = ${test}</h3>
<hr>

<h1>Summary</h1>
. : 빈, 맵의 속성에 접근하기 위한 연산자 <br>
[] : 배열, 리스트의 요소 또는 빈, 맵의 속성에 접근 <br>
() : 연산의 우선순위 <br>
삼항연산자 <br>
empty : 값이 null, 컬렉션의 사이즈 0인 경우 true 반환 <br>
&& and / || or / ! not <br>
</body>
</html>