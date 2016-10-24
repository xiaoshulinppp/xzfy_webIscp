package com.spring.task;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//   ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-mvc.xml"); 
	}
	
	private static ApplicationContext applicationContext = null;  
    
    public static ApplicationContext getApplicationContext() {  
        if(applicationContext == null){  
            applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");  
        }  
        return applicationContext; 
    }

}
