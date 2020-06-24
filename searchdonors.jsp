<html>
<head><title>Search Donors</title>
</head>
<%@ page language = "java" import = "java.sql.Statement,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>
<body>
<h1>Donor Records</h1>
<%
String msg=(String)request.getParameter("msg");
if(msg!=null)
{
%>
<script>
alert('<%=msg%>');
</script>
<%
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
 query="Select name,gender,age,bloodgroup,city,phone,email from userinfo where bloodgroup='"+bloodgroup+"' and city='"+city+"'";	
}
else
{
 query="Select name,gender,age,bloodgroup,city,phone,email from userinfo";
}
	
%>
<form action="searchdonors.jsp" method="post" name="searchdonors">
<fieldset>
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
<table border="1">
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
	response.sendRedirect("searchdonors.jsp?msg=No Records Found.");  
}
else
{
	do
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
<td><a href="mail.jsp?e=<%=email%>">request</a><td>
</tr>
<%
 }while(rs.next());
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