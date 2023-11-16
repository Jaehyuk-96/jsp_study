<%@ page import="utils.CookieManger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    CookieManger.makeCookie(response, "ELCookie", "EL좋아요", 2);
%>
<html>
<head>
    <title>표현 언어(EL) - 그 외 내장객체</title>
</head>
<body>
<h3>쿠키값 읽기</h3>
<li>ELCookie값 : ${cookie.ELCookie.value }</li>
<h3>쿠키값 읽기</h3>
<ul>
    <li>host: ${header.host}</li>
    <li>user-agent ${header['user-agent']}</li>
    <li>cookie: ${header.cookie}</li>
</ul>

<h3>컨텍스트 초기화 매개변수 읽기</h3>
<li>MariaDB : ${initParam.Driver}</li>

<h3>컨텍스트 루트 경로 읽기</h3>
<li>${ pageContext.request.contextPath }</li>
</body>
</html>
