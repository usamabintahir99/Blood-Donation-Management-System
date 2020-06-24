import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;

public class editpassword extends HttpServlet{

 public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
 {
	 res.setContentType("text/html");
	 PrintWriter out = res.getWriter();
	 HttpSession session=req.getSession(false);
	 String email=(String)session.getAttribute("email");
	 String password=req.getParameter("newpassword");
try{

     Class.forName("com.mysql.jdbc.Driver");
     String url = "jdbc:mysql://localhost/bdms";
     Connection con=DriverManager.getConnection(url, "root", "root");
     Statement st=con.createStatement();

     String query="UPDATE userinfo SET password='"+password+"' WHERE email='"+email+"' ";
	 
		 int rs = st.executeUpdate(query);
		 if(rs==1)
		 {
			session.setAttribute("msg","Password has been changed.");
			res.sendRedirect("editprofile.jsp"); 
		 }
		 else
		 {
			 out.println("Error");
		 }

      st.close();
      con.close();

    }catch(Exception e)
	{
      out.println(e);
    }
 }
}