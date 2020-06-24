<html>
<head><title>login</title>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
%>
<h1>Log In</h1>
<form action="login" method="post" name="login">
<fieldset>
Email:<input type ="email" name = "email" required><br><br>
Password:<input type ="password" name = "password" required><br><br>
<input type="submit" value="Log In">
<input type="button" value="Sign Up" onclick="location.href='signup.html'">
<a href="forgotpassword.jsp">Forgot Password</a>
</fieldset>
</form>
<a href="searchdonors.jsp">Search Donors</a>
</body>
</html>