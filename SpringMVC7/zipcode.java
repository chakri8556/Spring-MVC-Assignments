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
