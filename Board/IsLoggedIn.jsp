<%@ page import="utils.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    if(session.getAttribute("UserId") == null){
        JSFunction.alertLocation("로그인 후 이용해주십시오.", "../05Session/LoginForm.jsp", out);
        return;
    }
    %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
