<%@ page import="com.example.mytestone.common.JDBConnect" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>JDBC</title>
</head>
<body>
<h2>회원 목록 조회 테스트 (executeQuery()사용 )</h2>
<%
    JDBConnect jdbc = new JDBConnect();

    String sql = "select id, pass, name, register from member";
    Statement stmt = jdbc.con.createStatement();

    ResultSet rs = stmt.executeQuery(sql);
    while(rs.next()){
      String id = rs.getString(1);
      String pw = rs.getString(2);
      String name = rs.getString("name");
      java.sql.Date regitdate = rs.getDate("register");

      out.println(String.format("%s %s %s %s", id, pw, name, regitdate) + "<br/>");
    }

    jdbc.close();
%>
</body>
</html>
