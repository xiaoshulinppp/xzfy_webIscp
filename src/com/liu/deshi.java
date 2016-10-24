package com.liu;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

import com.runqian.report4.model.expression.function.datetime.Month;
import com.sun.java_cup.internal.runtime.Symbol;

public class deshi {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String a3="333<br/>bb";
		String b3=a3.replace("<br/>", "");
		String b4=a3.replaceAll("<br/>", "");
		int a=100 ,b=200;
		boolean c=a>0||b++>200;
		double c1=6.0;
		double c2=4.9;

	SimpleDateFormat c11= new SimpleDateFormat("yyyy年期中高考时-MM-dd号 HH的-mm-ss");
	
	Date date=new Date();

	String datess=c11.format(date);
	System.out.println(datess);
	
	Calendar calendar=Calendar.getInstance();
	
	calendar.setTime(date);
	int year=calendar.get(calendar.YEAR);
	
	calendar.set(calendar.YEAR, 2066);
 
	Date bbb=calendar.getTime();
	System.out.println(c11.format(bbb));
	Long lllLong=date.getTime();
	System.out.println(lllLong);
	
	}
	@Override
	public String toString(){
		
		return null;}

}
