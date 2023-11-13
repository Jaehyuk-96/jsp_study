<%@ page import="com.example.mytestone.common.JDBConnect" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-11-13
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>회원 추가 테스트(executeUpdate() 사용)</h2>
<%
    JDBConnect jdbc = new JDBConnect();

    String id = "tes1";
    String pass = "1111";
    String name = "테스트1회원";

    String sql = "insert into member values (?, ?, ?, default)";
    PreparedStatement psmt = jdbc.con.prepareStatement(sql);
    psmt.setString(1, id);
    psmt.setString(2, pass);
    psmt.setString(3,name);

    int inResult = psmt.executeUpdate();
    out.println(inResult + " 행이 입력 되었습니다.");

    jdbc.close();
    %>

</body>
</html>
