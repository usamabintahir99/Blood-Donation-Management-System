import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;

public class forgotpassword extends HttpServlet{

 public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
 {
	 res.setContentType("text/html");
	 boolean flag=false;
	 PrintWriter out = res.getWriter();
	 
	 String email=req.getParameter("email");
	 String sq1=req.getParameter("sq1");
     String sq2=req.getParameter("sq2");	 
	 
try{

     Class.forName("com.mysql.jdbc.Driver");
     String url = "jdbc:mysql://localhost/bdms";
     Connection con=DriverManager.getConnection(url, "root", "root");
     Statement st=con.createStatement();

     String query = "Select * from userinfo where email = '"+email+"' and sq1 = '"+sq1+"' and sq2 = '"+sq2+"'";
	 ResultSet rs = st.executeQuery(query);
	 
	 if(rs.next())
	 {
		 flag=true;
	 }
	 else
	 {
		 flag=false;
	 }


      st.close();
      con.close();

    }catch(Exception e)
	{
      out.println(e);
    }
	
	if(flag==true)
	{
		HttpSession session=req.getSession(true);
		session.setAttribute("email",email);
		res.sendRedirect("forgotpassword2.jsp");
	}
	else
	{
		res.sendRedirect("forgotpassword.jsp?msg=Email and Answers does not match. Error!!");
	}
 }
}