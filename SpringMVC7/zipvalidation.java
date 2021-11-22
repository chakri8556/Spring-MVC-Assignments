package com.practice.entities;



import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;



public class ZipValidation implements ConstraintValidator<ZipCode, LoginData>{



@Override
public boolean isValid(LoginData user, ConstraintValidatorContext context) {
if(user.getCity().equals("KKD")&& user.getZip().equals("533016")||
user.getCity().equals("Pune")&& user.getZip().equals("411000")||
user.getCity().equals("Gandhinagar")&& user.getZip().equals("382002"))
return true;

else {
return false;
}
}



}