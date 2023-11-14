package model1.board;

import common.JDBConnect;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class BoardDAO extends JDBConnect {
  public BoardDAO(ServletContext application) {
    super(application);


  }

  public int selectCount(Map<String, Object> map) {


    int totalCount = 0;

    String query = "select count(*) from board";
    if (map.get("searchWord") != null) {
      query += "where " + map.get("searchField") + ""
              + " like'%" + map.get("searchWord") + "%'";
    }

    try {
      stmt = con.createStatement();
      rs = stmt.executeQuery(query);
      rs.next();
      totalCount = rs.getInt(1);

    } catch (Exception e) {
      System.out.println("게시물 수를 구하는 중 예외 발생");
      e.printStackTrace();
    }
    return totalCount;
  }

  public List<BoardDTO> selectList(Map<String, Object> map) {
    List<BoardDTO> bbs = new Vector<BoardDTO>();

    String query = "select * from board";
    if (map.get("serachWord") != null) {
      query += " where " + map.get("searchField") + ""
              + " Like '%" + map.get("searchWord") + "%' ";
    }query += " order by num desc ";
try{
  stmt = con.createStatement();
  rs= stmt.executeQuery(query);


  while(rs.next()){
    BoardDTO dto = new BoardDTO();
    dto.setNum(rs.getString("num"));
    dto.setTitle(rs.getString("title"));
    dto.setContent(rs.getString("content"));
    dto.setPostdate(rs.getDate("postdate"));
    dto.setId(rs.getString("id"));
    dto.setVisitcount(rs.getString("visitcount"));
    bbs.add(dto);
  }
}catch (Exception e){
  System.out.println("게시물 조회중 예외 발생");
  e.printStackTrace();
}
return bbs;
  }

  public int insertWrite(BoardDTO dto) {
    int result = 0;

    try {
      String query = "insert into board ( " + " title,content,id,visitcount) "
              + " values ( "
              + " ?, ?, ?, 0)";

      psmt = con.prepareStatement(query);
      psmt.setString(1, dto.getTitle());
      psmt.setString(2, dto.getContent());
      psmt.setString(3, dto.getId());

      result = psmt.executeUpdate();


    } catch (Exception e) {
      System.out.println("게시물 입력 중 예외 발생");
      e.printStackTrace();

    }
    return result;
  }
}
