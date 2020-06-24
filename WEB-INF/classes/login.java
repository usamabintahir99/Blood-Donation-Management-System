import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;

public class login extends HttpServlet{

 public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
 {
	 res.setContentType("text/html");
	 PrintWriter out = res.getWriter();
	 
	 String email=req.getParameter("email");
	 String password=req.getParameter("password");
	 boolean flag=false;
	 int type=-1;
	 
try{

     Class.forName("com.mysql.jdbc.Driver");
     String url = "jdbc:mysql://localhost/bdms";
     Connection con=DriverManager.getConnection(url, "root", "root");
     Statement st=con.createStatement();

     String query = "Select * from userinfo where email like '"+email+"' and  password like '"+password+"'";
	 ResultSet rs = st.executeQuery(query);
	 
	 if(rs.next())
	 {
		 flag=true;
		 type=rs.getInt("type");
	 }
	 else
	 {
		 res.sendRedirect("index.jsp?msg=Email or Password Error.");
	 }


      st.close();
      con.close();

    }catch(Exception e)
	{
      out.println(e);
    }
	
	if(flag==true && type==1)
	{
		HttpSession session=req.getSession(true);
		session.setAttribute("email",email);
		session.setAttribute("type",type);
		res.sendRedirect("profile.jsp");
	}
	else if(flag==true && type==0)
	{
		HttpSession session=req.getSession(true);
		session.setAttribute("email",email);
		session.setAttribute("type",type);
		res.sendRedirect("admin.jsp");
	}
 }
}