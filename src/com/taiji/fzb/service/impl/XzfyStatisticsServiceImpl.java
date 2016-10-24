package com.taiji.fzb.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.fzb.service.XzfyStatisticsService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;

public class XzfyStatisticsServiceImpl extends CoreServiceImpl implements XzfyStatisticsService{
/*******************************************************************111111111111**********************************************************/
	/***************************************当日接待汇总*************************************/
	String date=getDate();
	/*********当面接收********/
	public String getFaceRecep(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy ";
		HQL+=" where 1=1";
		HQL+=" and xzfy.receive_type=1 and xzfy.status>0";
		HQL+=" and xzfy.receive_date = '"+date+"'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();		
	}
	
	/*********来信接收********/
	public String getLetterRecep(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy ";
		HQL+=" where 1=1";
		HQL+=" and xzfy.receive_type=2 and xzfy.status>0";
		HQL+=" and xzfy.receive_date = '"+date+"'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();		
	}
	
	/*********协助案件审理********/
	public String getTotalCurrent(){
		String HQL="";
		HQL+=" select count(*) from Meet meet";
		HQL+=" where 1=1";
		HQL+=" and (meet.Meet_type='阅卷' or meet.Meet_type='送达' or meet.Meet_type='转交材料' or meet.Meet_type='谈话调查')";
		HQL+=" and meet.Face_date = '"+date+"'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();		
	}
	
	/*********阅卷********/
	public String getScan(){
		String HQL="";
		HQL+=" select count(*) from Meet meet";
		HQL+=" where 1=1";
		HQL+=" and meet.Meet_type='阅卷'";
		HQL+=" and meet.Face_date = '"+date+"'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();		
	}
	
	/*********送达********/
	public String getDelivery(){
		String HQL="";
		HQL+=" select count(*) from Meet meet";
		HQL+=" where 1=1";
		HQL+=" and meet.Meet_type='送达'";
		HQL+=" and meet.Face_date = '"+date+"'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();	
	}
	
	/*********转接材料********/
	public String getTransfer(){
		String HQL="";
		HQL+=" select count(*) from Meet meet";
		HQL+=" where 1=1";
		HQL+=" and meet.Meet_type='转交材料'";
		HQL+=" and meet.Face_date = '"+date+"'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();	
	}
	
	/*********谈话调查********/
	public String getChat(){
		String HQL="";
		HQL+=" select count(*) from Meet meet";
		HQL+=" where 1=1";
		HQL+=" and meet.Meet_type='谈话调查'";
		HQL+=" and meet.Face_date = '"+date+"'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();	
	}
	
	
	
	/*****获取本年度全市各级行政复议机关已接待行政复议人次************/
	String year = this.getYear();
	public String getJieDaiRenShu(){
//		int count=0;
//		
//		String HQL="";
//		HQL+=" from XzfyRecieve xzfy";
//		HQL+=" where 1=1";
//		HQL+=" and xzfy.jdRenshu is not null";
//		HQL+=" and xzfy.receive_date like '2013%'";
//		
//		List dataList=super.find(HQL);
//		if (!dataList.isEmpty()){
//		for(int i=0;i<dataList.size();i++)
//		{
//			XzfyRecieve temp=(XzfyRecieve)(dataList.get(i));
//			count+=Integer.parseInt(temp.getJdRenshu());
//		}
//	}
//		return String.valueOf(count);
		String HQL="";
		HQL+=" select sum(renCount) from XzfyRecieve xzfy";
		HQL+=" where 1=1";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		String temp="";
		if (!dataList.isEmpty()){
		     temp=(String)dataList.get(0);
		}
		
	    if(temp==null||temp.equals(""))
	    	temp="0";
	    return temp;
	}
	
	/**********获取本年度全市各级行政复议机关已接待行政复议批次******************/
	public String getJieDaiPiCi(){

		String HQL="";
		HQL+=" select count(id) from XzfyRecieve xzfy";
		HQL+=" where 1=1";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();	
	}
/******************************************************************222222222222***********************************************************/
	
	/*************************共接收*****************************/
	
	private String getOrgBm(){
		User user = (User) ActionContext.getContext().getSession()
				.get("_USER_LOGIN_");
		
		String hql="from Org org where org.id="+user.getOrg().getId();
		Org org=(Org)super.find(hql).get(0);
		return org.getLocbm();
	}
	
	public String getTotalCases(){
		String HQL="";
		HQL+=" select count(id) from XzfyInfo xzfy";
		HQL+=" where 1=1 and xzfy.status>0 ";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();	
		
		
	}
	
	/*************************已立案*****************************/
	public String getTotalRegistered(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy ";
		HQL+=" where 1=1";
		HQL+=" and (xzfy.status>3 and xzfy.status<12)";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();
		
	}
	
	/********************************待处理****************************/
	public String getTotalPrepared(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy ";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=1 and xzfy.status>3 and status<12";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();
	}
	
	/*************************未受理*****************************/
	public String getUnReceived(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy ";
		HQL+=" where 1=1";
		HQL+=" and (xzfy.stadardResult=2 or xzfy.stadardResult=3 or xzfy.stadardResult=5)";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();
		
	}
	
	/*************************告知*****************************/
	public String getNotified(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy ";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=2";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();
		
	}
	
	/*************************不予受理*****************************/
	public String getRefused(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy ";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=3";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();
		
	}
	
	/*************************其它处理*****************************/
	public String getOthers(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy ";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=5";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();
		
	}
/***********************************************************************33333333**********************************************************/
	
	/********************已受理  *********************/
	public String getTotalAccepted(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=1 and xzfy.status>3";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();
		
		
	}
	
	/********************驳回  *********************/
	public String getTotalRefused(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=1";
		HQL+=" and xzfy.finish_type=1";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();
	}
	
	/********************维持  *********************/
	public String getTotalPreserved(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=1";
		HQL+=" and xzfy.finish_type=2";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();	
		
	}
	
	/********************确认违法  *********************/
	public String getTotalIllegal(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=1";
		HQL+=" and xzfy.finish_type=3";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();	
	}
	
	/********************撤销  *********************/
	public String getTotalRevo(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=1";
		HQL+=" and xzfy.finish_type=4";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();	
	}
	
	/********************变更  *********************/
	public String getTotalModified(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=1";
		HQL+=" and xzfy.finish_type=5";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();	
		
	}
	
	/********************责令履行  *********************/
	public String getTotalExecuted(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=1";
		HQL+=" and xzfy.finish_type=6";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();	
	}
	
	/********************调解*********************/
	public String getTotalRecon(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=1";
		HQL+=" and xzfy.finish_type=7";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();	
	}
	
	/********************终止*********************/
	public String getTotalTerminated(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=1";
		HQL+=" and xzfy.finish_type=8";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();	
	}
	
	/********************其它处理*********************/
	public String getTotalOthers(){
		String HQL="";
		HQL+=" select count(*) from XzfyInfo xzfy";
		HQL+=" where 1=1";
		HQL+=" and xzfy.stadardResult=1";
		HQL+=" and xzfy.finish_type=9";
		HQL+=" and xzfy.receive_date like '"+year+"%'";
		List dataList=super.find(HQL);
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		return temp.toString();	
	}
	/****************************************************************统计图*******************************************************************/
	
	/*	public String getXmlString(){
			String xAxisName="";
//			String xAxisName="本年度全市各区县人民政府受理情况统计";
			String xmlStr="";
		    xmlStr="<chart caption='"+xAxisName+"' xAxisName='"
		  	+"' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' " +
		  			"baseFontSize='14' outCnvBaseFontSize='14'>";
		    
		    String HQL1="";
		    HQL1=" from Org o";
		    HQL1+=" where substr(o.locbm,-2)='00'  and substr(o.locbm,0,2)>0 and substr(o.locbm,0,2)<17 order by o.locbm";
		  
		  	List dataList=super.find(HQL1);
		  	
//		  	System.out.println("Success!!");
//		  	for(int i=0;i<dataList.size();i++){
//		  		Org org=(Org)dataList.get(i);
//		  		System.out.print(org.getName()+": ");
//		  		System.out.print(org.getLocbm());
//		  		System.out.println();
//		  	}
		  	
		  	//select o.locbm, o.name 
		  	
			if(!dataList.isEmpty()){
			for(int i=0;i<dataList.size();i++){
				Org org=(Org)(dataList.get(i));
				
				String HQL2=" select count(*) from XzfyInfo x";
			    HQL2+=" where x.caseorg='"+org.getLocbm()+"'";
			    List list=super.find(HQL2);
//			    System.out.println("list.size() is "+list.size());
			    if(!list.isEmpty()){
//			    	System.out.println("被执行！");
			    	xmlStr+="<set label='"+org.getName()+"' value='";
			    	xmlStr+=((Long)(list.get(0))).toString()+"' />";
//			    	System.out.println(xmlStr);
			    }
			 }
				
			xmlStr+="</chart>";
//		    xmlStr+=xmlStr.replaceAll("<", "&lt;");
//		    xmlStr+=xmlStr.replaceAll(">", "&gt;");	
						
	      }
//		  System.out.println(xmlStr);
			return xmlStr;
		}
	*/
	/*******************************************************按区县**************************************************************/
		/*******************获取 "按区县" xmlString*******************************/
		public String getXmlString(String type){
			String xAxisName="2016年度接受案件情况(16个区)";
//			String xAxisName="本年度全市各区县人民政府受理情况统计";
			String linkString="link='../xzfy/showDetailChart1.action?funcCode=479'";
			
			String xmlStr="";
		    xmlStr="<chart caption='"+xAxisName+"' xAxisName='"
		  	+"' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' ";
		    if(type.equals("1"))
		    	{xmlStr+="baseFontSize='9' outCnvBaseFontSize='14'>";}	
		    else if(type.equals("2")){
		    	{xmlStr+="baseFontSize='14' outCnvBaseFontSize='14'>";}
		    }
			String[][] strArray=specialFunc(getQuXianStringArray());//调用排序方法specialFunc(String[][])(从大到小)
			if(type.equals("1")){
				for(int i=0;i<strArray.length;i++){			
					xmlStr+="<set label='"+strArray[i][1]+"' value='";
					xmlStr+=strArray[i][0]+"'";
					xmlStr+=" ";
					xmlStr+=linkString;
					xmlStr+=" />";			
				}
			}
			else if(type.equals("2")){
				for(int i=0;i<strArray.length;i++){			
					xmlStr+="<set label='"+strArray[i][1]+"' value='";
					xmlStr+=strArray[i][0]+"' />";			
				}
			}
			xmlStr+="</chart>";
			return xmlStr;
		}
		
		/*******************读取数据库，获取 "按区县" 二维数组*******************************/
		public String[][] getQuXianStringArray(){
			String[][] str=null;
//			String HQL1=" select replace(o.name,'北京市',''),o.locbm";
			String HQL1=" from Org o"; 
			HQL1+=" where substr(o.locbm,-2)='00' and o.parent='1' and substr(o.locbm,0,2)>0 and substr(o.locbm,0,2)<19 order by o.locbm";
			List dataList=new ArrayList();
			 dataList=super.find(HQL1);
//			System.out.println("dataList's size is "+dataList.size());
			str=new String[dataList.size()][2];
			
			if(dataList.size()>0){
				for(int i=0;i<dataList.size();i++){
					if(dataList.get(i)!=null){
						Org org=(Org)(dataList.get(i));					
						String HQL2=" select count(*) from XzfyInfo x";
					    HQL2+=" where x.caseorg='"+org.getLocbm()+"'";
					    HQL2+=" and x.status>0";
					    HQL2+=" and x.receive_date like '"+year+"%'";
					    List list=super.find(HQL2);
				        
					    if(!list.isEmpty()){
					    	str[i][0]=((Long)(list.get(0))).toString();
					    	str[i][1]=org.getName().substring(3,org.getName().indexOf("人"));
					    }
					}
		        }
		    }
		    
			return str;
	    }
	/******************************************************************************************************************************/	
		
	/***********************************************************按委办局***********************************************************/	
		/**********************************查询数据字典并转换为二维String数组*******************************************/
		public String[][] getWeiBanStringArray(){
//			String[][] str=new String[67][2];
			String[][] str=null;
			String HQL1="";
			HQL1=" from Org o"; 
			HQL1+=" where substr(o.locbm,-2)='00' and substr(o.locbm,0,2)>=19 and o.locbm <> '3000' and o.locbm <> '3100' order by o.locbm";
			List dataList=new ArrayList();
			 dataList=super.find(HQL1);
//			System.out.println("dataList's size is "+dataList.size());
			str=new String[dataList.size()][2];
			if(dataList.size()>0){
				for(int i=0;i<dataList.size();i++){
					if(dataList.get(i)!=null){
						Org org=(Org)(dataList.get(i));
						
						String HQL2=" select count(*) from XzfyInfo x";
					    HQL2+=" where x.caseorg='"+org.getLocbm()+"'";
					    HQL2+=" and x.status>0";
					    HQL2+=" and x.receive_date like '"+year+"%'";
					    List list=super.find(HQL2);
				        
					    if(!list.isEmpty()){
					    	str[i][0]=((Long)(list.get(0))).toString();
					    	str[i][1]=org.getName().substring(2,org.getName().length());
					    }
					}
		        }
		    }
			return str;
	    }
		
		/*************************获取"按委办局" xmlString, 取前10名***************************/
		public String getAnotherXmlString(String type){
			String xAxisName="2016年度接受案件情况(市政府委办局)";
//			String xAxisName="本年度市政府各委办局收案情况统计";
			String linkString="link='../xzfy/showDetailChart2.action?funcCode=479'";
			String xmlStr="";
		    xmlStr="<chart caption='"+xAxisName+"' xAxisName='"
		  	+"' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' ";
		    if(type.equals("1")){
		    	xmlStr+="baseFontSize='9' outCnvBaseFontSize='12'>";
		    }	
	        else if(type.equals("2")){
	        	xmlStr+="baseFontSize='14' outCnvBaseFontSize='14'>";
	        }
			String[][] strArray=specialFunc(getWeiBanStringArray());//调用排序方法specialFunc(String[][])(从大到小)
			if(type.equals("1")){
				for(int i=0;i<40;i++){			
					xmlStr+="<set label='"+strArray[i][1]+"' value='";
					xmlStr+=strArray[i][0]+"'";
					xmlStr+=" ";
					xmlStr+=linkString;
					xmlStr+=" />";
				}
			}
			else if(type.equals("2")){
				for(int i=0;i<10;i++){			
					xmlStr+="<set label='"+strArray[i][1]+"' value='";
					xmlStr+=strArray[i][0]+"' />";
				}
			}
			xmlStr+="</chart>";
			return xmlStr;
		}
		
		
		
		
		/******************************对org表中的委办局按收案总量进行排序的方法******************************/
		public String[][] specialFunc(String[][] param){
		    for(int i=0;i<param.length;i++){
		       for(int j=0;j<param.length-1-i;j++){
		          if(Integer.parseInt(param[j][0])<Integer.parseInt(param[j+1][0])){
		              String temp1=param[j][0];
		              param[j][0]=param[j+1][0];
		              param[j+1][0]=temp1;
		            
		              String temp2=param[j][1];
		              param[j][1]=param[j+1][1];
		              param[j+1][1]=temp2;
		           }
		       }

		    }
		    return param;
		}
	/**********************************************************************************************************************************/

	private String getYear(){
		return new SimpleDateFormat("yyyy").format(new Date());
	}
	
	private String getDate(){
		return new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	}
}
