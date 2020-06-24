import java.io.IOException;  
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.swing.*;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
  
public class sendmail extends HttpServlet {  
public void doPost(HttpServletRequest request,  
 HttpServletResponse response)  
    throws ServletException, IOException {  
  
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
    //HttpSession session=request.getSession(false);  
    String to=(String)request.getParameter("e");	
    String subject="Request for Blood (BDMS)";
    String email=request.getParameter("email");
    String contact=request.getParameter("contact");
    String name=request.getParameter("name");	
    String msg="Blood Donation Society\n"+" A person has requested for blood\n Name: "+name+"\n Contact: "+contact+"\n Email: "+email+"";  
          
    Mailer.send(to, subject, msg);
    response.sendRedirect("searchdonors.jsp?msg=Message has been sent successfully.");  
    out.close();  
    }  
  
}