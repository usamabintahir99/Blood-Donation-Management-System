<html>
<head><title>Profile</title>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("type")==null || (Integer)session.getAttribute("type")==0)
{
	response.sendRedirect("index.jsp");
}
%>
<h1>Profile</h1>
Welcome User
<fieldset>
<!--<form action="deleteprofile"><input type="submit" value="Delete Profile"></form>-->
<input type="button" value="Edit Profile" onclick="location.href='editprofile.jsp'">
<input type="button" value="Delete Profile" onclick="location.href='deleteprofile'">
<input type="button" value="Logout" onclick="location.href='logout'">
</fieldset>
</form>
</body>
</html>