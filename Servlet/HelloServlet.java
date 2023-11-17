package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HelloServlet extends HttpServlet {//HttpServlet 상속
  private static final long serialVersionUID = 1L;//직렬화된 클래스의 버전관리에 사용되는 식별자
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {//doget 메소드 오버라이딩

    req.setAttribute("message", "Hello Servlet..!!");//request영역에 message 라는 속성으로 데이터를 저장
    req.getRequestDispatcher("/12Servlet/HelloServlet.jsp").forward(req,resp);//HelloServlet.jsp로 포워드함

  }
}
