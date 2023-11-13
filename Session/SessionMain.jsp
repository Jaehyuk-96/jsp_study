<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

    long creationTime = session.getCreationTime();
    String creationTimestr = dateFormat.format(new Date(creationTime));

    long lastTime = session.getLastAccessedTime();
    String lastTimestr = dateFormat.format(new Date(lastTime));
    %>
%
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Session 설정 확인</h2>
<ul>
    <li>세션 유지 시간 : <%= session.getMaxInactiveInterval() %></li>
    <li>세션 아이디 : <%= session.getId()%></li>
    <li>최초 요청 시각 : <%= creationTimestr %></li>
    <li>마지막 요청 시각 : <%= lastTimestr%></li>
</ul>

</body>
</html>
