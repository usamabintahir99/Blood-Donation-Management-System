<html>
<head><title>Forgot Password</title>
<script type="text/javascript">
function validate()
{
var password=forgotpassword2.password.value;
var cpassword=forgotpassword2.cpassword.value;
if(password!=cpassword)
{
alert("Password and Confirm Password does not match");
forgotpassword2.cpassword.focus();
return false;
}
}
</script>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("email")==null)
{
	response.sendRedirect("forgotpassword.jsp");
}
%>
<%
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
<form action="forgotpassword2" method="post" name="forgotpassword2" onsubmit="return validate()">
<fieldset>
<!--Email:<input type ="email" name = "email" required><br><br>-->
New Password:<input type ="password" name = "password" required><br><br>
Confirm Password:<input type ="password" name = "cpassword" required><br><br>
<input type="submit" value="Submit">
</form>
</body>
</html>