<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>

	Enter your username and password
	
	<form action="/springmvc/login" method="post">
		Username: <input type=" text" name="name"><br>
		Password: <input type="text" name="password"><br> 
		<input type="submit"><br>
		<br>
	</form>


</body>
</html>