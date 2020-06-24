<html>
<head><title>Edit Profile</title>
<script type="text/javascript">
function validate()
{
var password=changepassword.newpassword.value;
var cpassword=changepassword.confirmpassword.value;
if(password!=cpassword)
{
alert("Password and Confirm Password does not match");
changepassword.confirmpassword.focus();
return false;
}
}
</script>

</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("type")==null || (Integer)session.getAttribute("type")==0)
{
	response.sendRedirect("index.jsp");
}
%>
<%
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
<h1>Edit Profile</h1>
<div align="right">
<input type="button" value="Delete Profile" onclick="location.href='deleteprofile'">
<input type="button" value="Logout" onclick="location.href='logout'">
</div><br>
<fieldset>
<input type="button" value="Name" onclick="location.href='editprofile.jsp?button=name'">
<input type="button" value="City" onclick="location.href='editprofile.jsp?button=city'">
<input type="button" value="Phone Number" onclick="location.href='editprofile.jsp?button=phone'">
<input type="button" value="Password" onclick="location.href='editprofile.jsp?button=password'">
</fieldset>
<%
String btn=request.getParameter("button");
if(btn!=null && btn.equals("name"))
{
%>
<form action="editname">
<br>Name:<input type ="text" name = "name" required>
<input type="submit" value="Save">
</form>
<%
}
%>
<%
 btn=request.getParameter("button");
if(btn!=null && btn.equals("city"))
{
%>
<form action="editcity">
<br>City:<input type ="text" name = "city" required>
<input type="submit" value="Save">
</form>
<%
}
%>
<%
btn=request.getParameter("button");
if(btn!=null && btn.equals("phone"))
{
%>
<form action="editphone">
<br>Phone Number:<input type ="tel" name = "phone" required>
<input type="submit" value="Save">
</form>
<%
}
%>
<%
btn=request.getParameter("button");
if(btn!=null && btn.equals("password"))
{
%>
<form action="editpassword" name="changepassword" onsubmit="return validate()">
<br>New Password:<input type ="password" name = "newpassword" required>
<br><br>Confirm Password:<input type ="password" name = "confirmpassword" required>
<br><br><input type="submit" value="Save">
</form>
<%
}
%>
</form>
</body>
</html>