package com.eduask.section;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

//开启注解的切面
@Component
@Aspect
public class UsersSection {

	//切点
	@Pointcut(value="execution(* com.eduask.service.impl.*.*(..))")
	public void pointcut(){}
	
	//参数放切点的方法名
	@Before("pointcut()")
	public void before(){
		System.out.println("在之后");
	}
	
}
