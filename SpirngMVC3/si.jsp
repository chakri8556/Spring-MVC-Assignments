si.jsp
<html>
<head>
<meta charset="ISO-8859-1">
<title>Accept the value</title>

</head>
<body>
	<h1>Simple Interest</h1>
	
	<form name="myForm" onsubmit ="return validateForm()" action="psi" method ="post">
		<h2>
			Principal: <input type=" text" name="principal"><br>
			Time: <input type="text" name="time"><br> 
			Rate: <input type="text" name="rate"><br><br>
			
			<input type="submit" value="submit"><br><br>
		</h2>
	</form>


</body>
</html>