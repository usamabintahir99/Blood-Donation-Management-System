import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;

public class forgotpassword2 extends HttpServlet{

 public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
 {
	 res.setContentType("text/html");
	 PrintWriter out = res.getWriter();
	 HttpSession session=req.getSession(false);
	 String email=(String)session.getAttribute("email");
	 String password=req.getParameter("password");
	 
try{

     Class.forName("com.mysql.jdbc.Driver");
     String url = "jdbc:mysql://localhost/bdms";
     Connection con=DriverManager.getConnection(url, "root", "root");
     Statement st=con.createStatement();

     String query = "Select * from userinfo where email like '"+email+"'";
	 ResultSet rs = st.executeQuery(query);
	 
	 if(rs.next())
	 {
		 query="UPDATE userinfo SET password='"+password+"' WHERE email='"+email+"' ";
		 int rs2 = st.executeUpdate(query);
		 if(rs2==1)
		 {
			session.setAttribute("msg","Password Changed.");
			res.sendRedirect("index.jsp"); 
		 }
		 else
		 {
			 res.sendRedirect("forgotpassword2.jsp?msg=Error!!!Password not changed. Try Again");
		 }
	 }
	 else
	 {
		 res.sendRedirect("forgotpassword2.jsp?msg=Error!!!Password not changed. Try Again");
	 }

      st.close();
      con.close();

    }catch(Exception e)
	{
      out.println(e);
    }
 }
}