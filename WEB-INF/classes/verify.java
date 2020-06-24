import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;

public class verify extends HttpServlet{

 public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
 {
	 res.setContentType("text/html");
	 HttpSession session=req.getSession(false);
	 PrintWriter out = res.getWriter();
	 
	 if(session!=null)
	 {
		 int type=(Integer)session.getAttribute("type");
		 if(type==0)
		 {
			 out.println("<html><head><title>Success</title></head><body>Admin Successfully Logged In BDMS.</body></html>");
			 //res.sendRedirect("adminsuccessful.html");
		 }
		 else
		 {
			 out.println("<html><head><title>Success</title></head><body>Successfully Logged In BDMS.</body></html>");
			 //res.sendRedirect("successful.html");
		 }
	 }
	 else
	 {
		 res.sendRedirect("login.html");
	 }
 }
}