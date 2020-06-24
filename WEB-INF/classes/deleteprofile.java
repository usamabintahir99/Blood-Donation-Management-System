import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;

public class deleteprofile extends HttpServlet{

 public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
 {
	 res.setContentType("text/html");
	 PrintWriter out = res.getWriter();
	 HttpSession session=req.getSession(false);
	 String email=(String)session.getAttribute("email");
	try{

     Class.forName("com.mysql.jdbc.Driver");
     String url = "jdbc:mysql://localhost/bdms";
     Connection con=DriverManager.getConnection(url, "root", "root");
     Statement st=con.createStatement();

     String query = "DELETE FROM userinfo WHERE email='"+email+"'";
	 int rs = st.executeUpdate(query);
	 if(rs==1)
	 {
		 session.setAttribute("msg","Profile has been deleted.");
		 res.sendRedirect("index.jsp");
	 }
	 else
	 {
		 out.println("error");
	 }


      st.close();
      con.close();

    }catch(Exception e)
	{
      out.println(e);
    }
 }
}