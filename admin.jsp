<html>
<head><title>Search Donors</title>
</head>
<%@ page language = "java" import = "java.sql.Statement,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>
<body>
<h1>Donor Records</h1>
Welcome Admin
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("type")==null || (Integer)session.getAttribute("type")==1)
{
	response.sendRedirect("index.jsp");
}
String msg=(String)session.getAttribute("msg");
if(msg!=null)
{
%>
<script>
alert('<%=msg%>');
</script>
<%
session.removeAttribute("msg");
}
%>
<%
String city=(request.getParameter("city"));
if(city!=null)
{city=city.toLowerCase();}
String bloodgroup=request.getParameter("bloodgroup");
String query="";
if (city!=null && bloodgroup!=null)
{
 query="Select name,gender,age,bloodgroup,city,phone,email from userinfo where bloodgroup='"+bloodgroup+"' and city='"+city+"' and type="+1+"";	
}
else
{
 query="Select name,gender,age,bloodgroup,city,phone,email from userinfo where type="+1+"";
}
	
%>
<div align="right" ><input type="button" value="Logout" onclick="location.href='logout'"><div/><br>
<form action="admin.jsp" method="post" name="searchdonors" align="left">
<fieldset >
City:<input type ="text" name = "city" placeholder="city" required>
Blood Group:<select name="bloodgroup">
<option value="A+">A+
<option value="A-">A-
<option value="B+">B+
<option value="B+">B+
<option value="B-">B-
<option value="AB+">AB+
<option value="AB-">AB-
<option value="O+">O+
<option value="O-">O-
</select>
<input type="submit" value="Search">
</fieldset>
</form>
<table border="1" align="left">
<tr>
<td><b>Name</b></td>
<td><b>Gender</b></td>
<td><b>Age</b></td>
<td><b>Blood Group</b></td>
<td><b>City</b></td>
<td><b>Phone</b></td>
<td><b>Email</b></td>
<td><b>Request</b></td>
</tr>
<%
try
{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/bdms";
    Connection con=DriverManager.getConnection(url, "root", "root");

Statement st = con.createStatement();
ResultSet rs=st.executeQuery(query);
if(!rs.next())
{
	session.setAttribute("msg","No records found.");
	response.sendRedirect("admin.jsp");
}
else
{
	String name=rs.getString("name");
	String gender=rs.getString("gender");
	String age=rs.getString("age");
	String BloodGroup=rs.getString("bloodgroup");
	String City=rs.getString("city");
	String phone=rs.getString("phone");
	String email=rs.getString("email");	
 %>
 <tr>
<td><%=name%></td>
<td><%=gender%></td>
<td><%=age%></td>
<td><%=BloodGroup%></td>
<td><%=City%></td>
<td><%=phone%></td>
<td><%=email%></td>
<td><input type="button" value="Delete" onclick="location.href='deletebyadmin?email=<%=email%>'"><td>
</tr>
<%
}
while(rs.next())
{
	String name=rs.getString("name");
	String gender=rs.getString("gender");
	String age=rs.getString("age");
	String BloodGroup=rs.getString("bloodgroup");
	String City=rs.getString("city");
	String phone=rs.getString("phone");
	String email=rs.getString("email");	
 %>
 <tr>
<td><%=name%></td>
<td><%=gender%></td>
<td><%=age%></td>
<td><%=BloodGroup%></td>
<td><%=City%></td>
<td><%=phone%></td>
<td><%=email%></td>
<td><input type="button" value="Delete" onclick="location.href='deletebyadmin?email=<%=email%>'"><td>
</tr>
<%
}
st.close();
con.close();
}
catch(Exception e)
{System.out.println("Exception");}
%>
</table>
</body>
</html>