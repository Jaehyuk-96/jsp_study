<%@ page import="el.MyELClass" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    MyELClass myclass = new MyELClass();
    pageContext.setAttribute("myClass", myclass);
%>
<html>
<head>
    <title>표현 언어(EL) - 메서드 호출</title>
</head>
<body>
<h3>영역에 저장 후 메서드 호출하기</h3>
001225-3000000 => ${myClass.getGender("001225-3000000")} <br/>
001225-3000000 => ${myClass.getGender("001225-2000000")} <br/>

<h3>클래스 명을 통해 정적 메서드 호출하기</h3>
${MyELClass.showGugudan(7)}
</body>
</html>
