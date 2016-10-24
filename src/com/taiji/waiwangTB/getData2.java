package com.taiji.waiwangTB;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.waiwangTB.domain.XzfyInfo2;
import com.taiji.waiwangTB.domain.XzfyInfo_w;
import com.taiji.waiwangTB.domain.dogs;

import localhost.zxfy.services.datesent.DatesentProxy;
import net.sf.json.JSONObject;



public class getData2  {

//	private static final int  = 0;

	public static void main(String[] args) throws RemoteException {
	
		// JSONObject json = JSONObject.fromObject(dog33);//将java对象转换为json对象
		// String str = json.toString();//将json对象转换为字符串
		// list.add(str);
		
		DatesentProxy da =new DatesentProxy();  
	//   Dogs d=new Dogs();
	//    String ob=da.sendname("20160513134807639437");
		
		//String aa=da.test("neiwang");
		//String c3=da.updateStatus("20160614165852680965", "2","2");
		//System.out.println(c3);
		
		Object[] bb=da.sendname("20160614165852680965");
		
	List<dogs> ll=new  ArrayList();
		for(Object ob:bb ){
	String cc=(String)ob;
	// JSONObject json = JSONObject.fromObject(dog33);//将java对象转换为json对象
	//	 String str = json.toString();//将json对象转换为字符串
			
	//同样先将json字符串转换为json对象，再将json对象转换为java对象，如下所示。
	JSONObject obj = ((JSONObject) new JSONObject()).fromObject(cc);//将json字符串转换为json对象
	//将json对象转换为java对象
	XzfyInfo2 jb = (XzfyInfo2)JSONObject.toBean(obj,XzfyInfo2.class);//将建json对象转换为Person对象
	//System.out.println(jb.getAdmit1());		
	//ll.add(jb);
	System.out.println("jiehsu ");
	
	
	
	
	
		}
		//System.out.println(bb+"hhh");
	}

}
