package com.springmvc.usercontroller;

public class UserVerify {
	
	public boolean isValid(String user, String password) {
		return user.equals("chakri") && password.equals("tirumala");
	}
}