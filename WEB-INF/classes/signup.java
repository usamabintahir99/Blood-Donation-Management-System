import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;

public class signup extends HttpServlet{

 public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
 {
	 res.setContentType("text/html");
	 PrintWriter out = res.getWriter();
	 
	 String name=req.getParameter("name");
	 String gender=req.getParameter("gender");
	 String sage=req.getParameter("age");
	 String bloodgroup=req.getParameter("bloodgroup");
	 String city=req.getParameter("city");
	 city=city.toLowerCase();
	 String phone=req.getParameter("phone");
	 String email=req.getParameter("email");
	 String password=req.getParameter("password");
	 int age=Integer.parseInt(sage);
     String sq1=req.getParameter("sq1");
     String sq2=req.getParameter("sq2");	 
	 
try{

     Class.forName("com.mysql.jdbc.Driver");
     String url = "jdbc:mysql://localhost/bdms";
     Connection con=DriverManager.getConnection(url, "root", "root");
     Statement st=con.createStatement();

     String query = "Select * from userinfo where email like '"+email+"'";
	 ResultSet rs = st.executeQuery(query);
	 
	 if(rs.next())
	 {
		 out.println("Email already exists");
	 }
	 else
	 {
		 query = "insert into userinfo(name,gender,age,bloodgroup,city,phone,email,password,type,sq1,sq2) values('"+name+"', '"+gender+"', "+age+", '"+bloodgroup+"' , '"+city+"', '"+phone+"', '"+email+"', '"+password+"',"+1+",'"+sq1+"', '"+sq2+"' )";
	     int rs2 = st.executeUpdate(query);
		 
		 if(rs2 == 1)
		  {	
	       res.sendRedirect("index.jsp?msg=Successfully Signed Up."); 		
	      }
		 else
		 {	
		   res.sendRedirect("index.jsp?msg=Error in Signing Up."); 		
		 }
	 }


      st.close();
      con.close();

    }catch(Exception e)
	{
      out.println(e);
    }
 }
}