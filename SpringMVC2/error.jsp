q1
pom .xml 



<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>com.sun</groupId>
	<artifactId>ToDoApo</artifactId>
	<packaging>war</packaging>
	<version>0.0.1-SNAPSHOT</version>
	<name>ToDoApo Maven Webapp</name>
	<url>http://maven.apache.org</url>
	<dependencies>

		<!-- https://mvnrepository.com/artifact/org.springframework/spring-webmvc -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>5.3.12</version>
		</dependency>

		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>3.8.1</version>
			<scope>test</scope>
		</dependency>

	</dependencies>
	<build>

		<finalName>ToDoApo</finalName>
		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-war-plugin</artifactId>
				<version>3.3.1</version>
			</plugin>
		</plugins>
	</build>
</project>

-----------------------------------------------------------------------------------------------------------------------------
helloController



package com.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/home")
public String home()
{
	return "home";
}

}

-------------------------------------------------------------------------------------------------------------

todo servlet


<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:ctx="http://www.springframework.org/schema/context"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="http://www.springframework.org/schema/beans 
	http://www.springframework.org/schema/beans/spring-beans.xsd
	http://www.springframework.org/schema/mvc
	http://www.springframework.org/schema/mvc/spring-mvc.xsd
	http://www.springframework.org/schema/context
	http://www.springframework.org/schema/context/spring-context.xsd ">
	
	
	<ctx:annotation-config></ctx:annotation-config>
	<ctx:component-scan base-package="com.ctrl"></ctx:component-scan>
</beans>
----------------------------------------------------------------------------------------------------------------------
index jsp

<html>
<body>
<h2>Hello World!</h2>
<h1>This is my homepage</h1>
</body>
</html>
-----------------------------------------------------------------------------------------------
web xml


<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >

<web-app>
  <display-name>Archetype Created Web Application</display-name>

 <servlet>
        <servlet-name>todo</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <servlet-mapping>
        <servlet-name>todo</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>

</web-app>

=========================================================
q2
UserController. java


package com.springmvc.usercontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class UserController {
	
	UserVerify check= new UserVerify();
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginUser() {
		
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String handlelogin(@RequestParam String name, 
							  @RequestParam String password, ModelMap model) {
		if(check.isValid(name, password)) {
			model.put("name", name);
			model.put(password,model );
			return "success";
		}
		else {
			//model.put("error", "Try again");
			return "error";
		}
		
	}
}

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
UserVerify.java

package com.springmvc.usercontroller;

public class UserVerify {
	
	public boolean isValid(String user, String password) {
		return user.equals("Pranab") && password.equals("Mohanta");
	}
}

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
success.jsp
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
</head>
<body>
	<h1><font color ="green"> SUCCESS</h1>
</body>
</html>

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
login.jsp
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
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
error.jsp
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<font color="red">Invalid Username and Password 
	</h1>
</body>
</html>
======================================================================================
q3
SIController.java


package spring.mvc.sicontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SIController {

	@RequestMapping(value = "/si", method = RequestMethod.GET)
	public String si(Model model) {
		return "si";
	}
	
	@RequestMapping(path="/psi", method = RequestMethod.POST)
	public String processSi(@RequestParam("principal") int p, 
							@RequestParam("time") int t, 
							@RequestParam("rate") int r, Model model) {
		
		int SI=(p*t*r)/100;
		
		System.out.println("Simple Interest = "+ (p*t*r)/100);
		model.addAttribute("SI", SI);
		return "result";
	}

}
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
result.jsp

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Simple Interest</title>
</head>
<body>
	<h1>Simple Interest = ${SI }</h1>
</body>
</html>

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
===============================================================================================
q6
MyController.java


package com.practice.controller;



import javax.validation.Valid;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;



import com.practice.entities.LoginData;



@Controller
public class MyController {



@GetMapping("/form")
public String openForm(Model model) {
model.addAttribute("loginData", new LoginData());
return "form";
}


//handler for processing form
@PostMapping("/process")
public String processForm(@Valid @ModelAttribute("loginData") LoginData loginData, BindingResult result) {
if(result.hasErrors()) {
System.out.println(result);
return "form";
}


System.out.println(loginData);
return "success";
}
}
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
LoginData.java

package com.practice.entities;



import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;




@ZipCode(message="Zipcode and city doesnt match")
public class LoginData {

@NotBlank(message="User name cannot be empty")
@Size(min=8, max=20, message="Username should be between 8-20 characters")
@Pattern(regexp="^[A-Za-z][A-Za-z0-9]+$",message="Username should be alpha numberic")
private String userName;


@Pattern(regexp="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$", message="Invalid email")
private String email;

@NotBlank(message="Password cannot be blank")
@Size(min=8, max=20, message="Password should be between 8-20 characters")
@Pattern(regexp="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$", message="Password should contain at least one upper-case, one lower-case, a digit and a special character")
private String password;

@NotNull(message="Contact cannot be null")
@Pattern(regexp="^[0-9]+$", message="Contact can only contain numbers")
@Size(min=10,max=10, message="Enter only 10 digits")
private String contact;

@NotNull(message="Zip cannot be null")
@Pattern(regexp="^[0-9]+$", message="Contact can only contain numbers")
@Size(min=6,max=6, message="Enter 6 digits")
private String zip;



@NotBlank(message="Select the city")
private String city;
public String getCity() {
return city;
}

public String getZip() {
return zip;
}
public void setZip(String zip) {
this.zip = zip;
}
public String getContact() {
return contact;
}
public void setContact(String contact) {
this.contact = contact;
}



public void setCity(String city) {
this.city = city;
}

public String getPassword() {
return password;
}
public void setPassword(String password) {
this.password = password;
}
public String getUserName() {
return userName;
}
public void setUserName(String userName) {
this.userName = userName;
}
public String getEmail() {
return email;
}
public void setEmail(String email) {
this.email = email;
}
@Override
public String toString() {
return "LoginData [userName=" + userName + ", email=" + email + "]";
}


}
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
form.html

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeLeaf.org">
<head>
<meta charset="UTF-8" />
<title>Login Here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"></head>
<body style="background-color: #DBE6FD;">
<div class="container">
<div class="row mt-5">
<div class="col-md-6 offset-md-3">
<form th:action="@{/process}" method="post" th:object="${loginData}" class="bg-white p-3">
<h1 class="text-center" style="color:darkblue">Enter your details</h1 >
<div class="mb-3">
<label for="exampleInputEmail1" class="form-label">Username</label>
<input type="text" name="userName" class="form-control" th:value="${loginData.userName}" th:classappend="${#fields.hasErrors('userName')? 'is-invalid':''}"
id="exampleInputEmail1" aria-describedby="emailHelp">
<div th:each="e:${#fields.errors('userName')}" th:text="${e}"
id="validationServerUsernameFeedback" class="invalid-feedback">
</div>
</div>
<div class="mb-3">
<label for="exampleInputEmail1" class="form-label">Password</label>
<input type="text" name="password" class="form-control" th:value="${loginData.password}" th:classappend="${#fields.hasErrors('password')? 'is-invalid':''}"
aria-describedby="emailHelp">
<div th:each="e:${#fields.errors('password')}" th:text="${e}"
id="validationServerUsernameFeedback" class="invalid-feedback">
</div>
</div>
<div class="mb-3">
<label for="exampleInputPassword1" class="form-label">Email</label>
<input type="email" name="email" class="form-control" th:value="${loginData.email}" th:classappend="${#fields.hasErrors('email')? 'is-invalid':''}"id="exampleInputPassword1">
<div th:each="e:${#fields.errors('email')}" th:text="${e}"
id="validationServerUsernameFeedback" class="invalid-feedback">
</div>
</div>
<div class="mb-3">
<label for="exampleInputEmail1" class="form-label">Contact</label>
<input type="text" name="contact" class="form-control" th:value="${loginData.contact}" th:classappend="${#fields.hasErrors('contact')? 'is-invalid':''}"
aria-describedby="emailHelp">
<div th:each="e:${#fields.errors('contact')}" th:text="${e}"
id="validationServerUsernameFeedback" class="invalid-feedback">
</div>
</div>
<div class="col-md-6">
<label for="validationCustom04" class="form-label">City</label>
<select name="city" class="form-select" aria-label="Default select example"
th:value="${loginData.city}" th:classappend="${#fields.hasErrors('city')? 'is-invalid':''}">
<option selected value="">--Select a city--</option>
<option value="Mumbai">Mumbai</option>
<option value="Pune">Pune</option>
<option value="Gandhinagar">Gandhinagar</option>
</select>
<div th:each="e:${#fields.errors('city')}" th:text="${e}"
id="validationServerUsernameFeedback" class="invalid-feedback">
</div>
</div>
<div class="mb-3">
<label for="exampleInputEmail1" class="form-label">Zip</label>
<input type="text" name="zip" class="form-control" th:value="${loginData.zip}" th:classappend="${#fields.hasErrors('zip')? 'is-invalid':''}"
aria-describedby="emailHelp">
<div th:each="e:${#fields.errors('zip')}" th:text="${e}"
id="validationServerUsernameFeedback" class="invalid-feedback">
</div>
</div>
<!--<div class="mb-3 form-check">
<input type="checkbox" class="form-check-input" id="exampleCheck1">
<label class="form-check-label" for="exampleCheck1">Check me out</label>
</div>-->
<div class="container text-center m-2">
<button type="submit" class="btn btn-primary">Register</button>
</div>
</form >
</div>
</div>
</div>
</body >
</html>

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
success.html

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeLeaf.org">
<head>
<meta charset="UTF-8" />
<title>Login Here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"></head>
<body>
<h1 style="color: green;">Success!!</h1 >
<h3 th:text="${loginData.userName}"></h3>
<h3 th:text="${loginData.email}"></h3>
</body>
</html>

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
pom.xml

<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
<modelVersion>4.0.0</modelVersion>
<parent>
<groupId>org.springframework.boot</groupId>
<artifactId>spring-boot-starter-parent</artifactId>
<version>2.6.0</version>
<relativePath/> <!-- lookup parent from repository -->
</parent>
<groupId>com.validate</groupId>
<artifactId>springvalidation</artifactId>
<version>0.0.1-SNAPSHOT</version>
<name>springvalidation</name>
<description>learning spring validation on mvc</description>
<properties>
<java.version>11</java.version>
</properties>
<dependencies>
<dependency>
<groupId>org.springframework.boot</groupId>
<artifactId>spring-boot-starter-web</artifactId>
</dependency>



<dependency>
<groupId>org.springframework.boot</groupId>
<artifactId>spring-boot-starter-test</artifactId>
<scope>test</scope>
</dependency>

<!-- https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-thymeleaf -->
<dependency>
<groupId>org.springframework.boot</groupId>
<artifactId>spring-boot-starter-thymeleaf</artifactId>
<version>2.6.0</version>
</dependency>

<!-- https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-devtools -->
<dependency>
<groupId>org.springframework.boot</groupId>
<artifactId>spring-boot-devtools</artifactId>

</dependency>

<!-- https://mvnrepository.com/artifact/javax.validation/validation-api -->
<dependency>
<groupId>javax.validation</groupId>
<artifactId>validation-api</artifactId>
</dependency>


<!-- https://mvnrepository.com/artifact/org.hibernate/hibernate-validator -->
<dependency>
<groupId>org.hibernate</groupId>
<artifactId>hibernate-validator</artifactId>
<version>6.1.5.Final</version>
</dependency>




</dependencies>



<build>
<plugins>
<plugin>
<groupId>org.springframework.boot</groupId>
<artifactId>spring-boot-maven-plugin</artifactId>
</plugin>
</plugins>
</build>



</project>
=========================================================================================================
q7
ZipCode.java

package com.practice.entities;import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ZipValidation.class)
public @interface ZipCode {
String message() default "Zip code and City doesn't match";
Class<?>[] groups() default {};
Class<? extends Payload>[] payload() default {};
}

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ZipValidation.java

package com.practice.entities;



import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;



public class ZipValidation implements ConstraintValidator<ZipCode, LoginData>{



@Override
public boolean isValid(LoginData user, ConstraintValidatorContext context) {
if(user.getCity().equals("Mumbai")&& user.getZip().equals("400001")||
user.getCity().equals("Pune")&& user.getZip().equals("411000")||
user.getCity().equals("Gandhinagar")&& user.getZip().equals("382002"))
return true;

else {
return false;
}
}



}
==================================================================================================


