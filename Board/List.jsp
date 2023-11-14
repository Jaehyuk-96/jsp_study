<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ page import="java.util.List" %>

<%
    BoardDAO dao = new BoardDAO(application);

    Map<String, Object> param = new HashMap<String, Object>();

    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");
    if(searchWord != null){
      param.put("SearchField", searchField);
      param.put("SearchWord", searchWord);

    }
    int totalCount = dao.selectCount(param);//게시물수 확인
    List<BoardDTO> boardLists = dao.selectList(param);//게시물 목록 받기
    dao.close();
%>


<html>
<head>
    <title>회원제 게시판</title>
</head>
<body>
<jsp:include page="../05Session/Link.jsp" />
<h2>목록보기(List)</h2>
<!-- 검색폼 -->
<form method="get">
    <table border="1" width="90%">
        <tr>
            <td align="center">
                <select name="searchField">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" name="searchWord"/>
                <input type="submit" value="검색하기"/>

            </td>
        </tr>
    </table>
</form>
<!-- 게시물 목록 테이블(표) -->
<table border = "1" width="90%">
    <!-- 각 컬럼의 이름 -->
    <tr>
        <th width = "10%">번호</th>
        <th width = "50%">제목</th>
        <th width = "15%">작성자</th>
        <th width = "10%">조회수</th>
        <th width = "15%">작성일</th>
    </tr>

    <%
        if(boardLists.isEmpty()){
    %>
    <tr>
        <td colspan="5" align="center">
            등록된게시물이 없습니다.^^*
        </td>
    </tr>
    <%
        }
        else{
          int virtualNum = 0;//화면창에서 게시물 번호
          for (BoardDTO dto : boardLists)
          {
            virtualNum = totalCount--;// 전체 게시물 수에서 시작해 1씩 감소
    %>
    <tr align="center">
        <td><%= virtualNum %></td><!--게시물번호-->
        <td align="left"><!--제목(+하이퍼링크)-->
            <a href="View.jsp?num=<%= dto.getNum()%>"><%=dto.getTitle()%>
        </a>
        </td>
        <td align="center"><%= dto.getId()%></td><!-- 작성자 아이디-->
        <td align="center"><%= dto.getVisitcount()%></td> <!-- 조회수 -->
        <td align="center"><%= dto.getPostdate()%></td><!--작성일 -->
    </tr>
    <%
            }
        }
        %>
</table>
<!-- 목록 하단의 [글쓰기] 버튼 -->
<table border="1" width="90%">
    <tr align="right">
        <td><button type = "button" onclick="location.href='Write.jsp';">글쓰기</button></td>


    </tr>

</table>

</body>
</html>
