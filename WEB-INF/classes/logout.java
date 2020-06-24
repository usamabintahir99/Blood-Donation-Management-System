import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;

public class logout extends HttpServlet{

 public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
 {
	 res.setContentType("text/html");
	 PrintWriter out = res.getWriter();
	 HttpSession session=req.getSession(false);
	 if(session!=null)
	 {
	 session.removeAttribute("email");
	 session.removeAttribute("type");
	 session.invalidate();
	 res.sendRedirect("index.jsp");
	 }
 }
}