<html>
<head><title>Forgot Password</title>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
String msg =(String)request.getParameter("msg");
if(msg!=null)
{
%>
<script>
alert('<%=msg%>');
</script>	
<%
}
%>
<h1>Forgot Password</h1>
<form action="forgotpassword" method="post" name="forgotpassword">
<fieldset>
Email:<input type ="email" name = "email" required><br><br>
Security Questions (In case you forgot your password):<br><br>
Q1: What was your childhood nickname?
<input type ="text" name = "sq1" required><br><br>
Q2: What is your favoruite color?
<input type ="text" name = "sq2" required><br><br>
<input type="submit" value="Submit">
</form>
</body>
</html>