<html>
<head><title>Mail</title>
</head>
<body>
<h1>Mail</h1>
<form action="sendmail" method="post" name="mail">
<fieldset>
Fill the fields below:<br><br>
Name:<input type ="text" name = "name" required><br><br>
Contact:<input type ="tel" name = "contact" required><br><br>
Email:<input type ="email" name = "email" required><br><br>
<input type="hidden" name="e" value="<%=request.getParameter("e")%>">
<input type="submit" value="Send Request to donor">
</fieldset>
</form>
</body>
</html>