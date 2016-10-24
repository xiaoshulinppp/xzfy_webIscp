package com.taiji.tongJi.action.tongJiService.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.tongJi.action.tongJiService.IndexTjService;
import com.util.JdbcUtil;

public class IndexTjServiceImpl extends CoreServiceImpl implements IndexTjService{	
	public ArrayList<ArrayList<String>> getFyjgLists(String type) {
		Connection connection = JdbcUtil.getConnByHibernateConfig();

        String sql="";

        /************市政府***********/
        if(type.equals("1")){
        	sql=" select t.org_name,t.org_locbm from u_org t";
        	sql+=" where t.org_parent=1 and t.org_locbm=0000";
        	sql+=" order by t.org_locbm";
        }        
        
        /************区县政府***********/
        else if(type.equals("2")){
        	sql=" select t.org_name,t.org_locbm from u_org t";
        	sql+=" where substr(org_locbm,-2)=00 and org_parent=1 and substr(org_locbm,0,2)>00 and substr(org_locbm,0,2)<19";
        	sql+=" order by t.org_locbm";
        }
        
        /************市政府部门***********/
        else if(type.equals("3")){
        	sql=" select t.org_name,t.org_locbm from u_org t";
        	sql+=" where substr(org_locbm,-2)=00 and org_parent=1 and substr(org_locbm,0,2)>18";
        	sql+=" order by t.org_locbm";
        }
        
		ArrayList<ArrayList<String>> quXianLists = JdbcUtil.getListBySql(connection, sql);

		return quXianLists;
	}

	/************************************************获取"区县"和"年度案件量"***********************************************/
	public ArrayList<ArrayList<String>> getYearlyCountLists(ArrayList<ArrayList<String>> doubleList,String year) throws SQLException{
		ArrayList<ArrayList<String>> arrayLists = new ArrayList<ArrayList<String>>();
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement statement = connection.createStatement();
		ResultSet resultSet = null;
		long radix=0;//总基数
		
		String sql="";
		try{
			for(int i=0;i<doubleList.size();i++){
				ArrayList<String> arrayList = new ArrayList<String>();
				
				arrayList.add(doubleList.get(i).get(0));//添加单位名称
				arrayList.add(doubleList.get(i).get(1));//添加单位locbm
				
				for (int j = 0; j < 3; j++) {// 初始化数据，默认为0
					arrayList.add("0");//
				}
				sql=" select count(t.id) from xzfy_info t ";
				sql+=" where 1=1";
				sql+=" and t.status>0";
				sql+=" and t.receive_date like '"+year+"%'";
				sql+=" and t.caseorg='"+(String)(doubleList.get(i).get(1))+"'";
				
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						arrayList.set(2,resultSet.getString(1));
					}
				}
				
				String sql1=sql+" and t.status>3 and t.stadardresult=1";
				resultSet = statement.executeQuery(sql1);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						arrayList.set(3,resultSet.getString(1));
						radix=Long.parseLong((String)(resultSet.getString(1)));
					}
				}
				
				String sql2=sql1+" and (t.finish_type=7 or t.finish_type=8 or t.finish_type=4 or t.finish_type=5 or t.finish_type=3 or t.finish_type=6)";
				
				resultSet = statement.executeQuery(sql2);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						if(radix!=0){
							String percent=String.valueOf(Math.round(((double)(Long.parseLong(  (String)(resultSet.getString(1)) ))/radix)*1000)/10.0);
							arrayList.set(4,percent);
						}
					}
				}
							
				arrayLists.add(arrayList);
				
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {

			try {
				if (statement != null) {

					statement.close();
					statement = null;
				}
				if (connection != null) {

					connection.close();
					connection = null;

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return arrayLists;
	}
	
	
	
	
	/**************************************************获取公正指标统计二维列表************************************************/
	public ArrayList<ArrayList<String>> getJustLists(ArrayList<ArrayList<String>> doubleList,String year) throws SQLException{
		ArrayList<ArrayList<String>> arrayLists = new ArrayList<ArrayList<String>>();
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement statement = connection.createStatement();
		ResultSet resultSet = null;		
		
        try{
	        for(int i=0;i<doubleList.size();i++){       	       	
	        	ArrayList<String> arrayList = new ArrayList<String>();
	        	arrayList.add(doubleList.get(i).get(0));
	        	arrayList.add(doubleList.get(i).get(2));
	        	arrayList.add(doubleList.get(i).get(3));
	        	arrayList.add(doubleList.get(i).get(4));
	        	
	        	long allRecCount=Long.parseLong((String)(doubleList.get(i).get(3)));//当前单位受理案件总件数
	        	double allRatio=Double.parseDouble( (String)(doubleList.get(i).get(4)) );
	        	long count=0;//临时变量，存各种类别"件数"
	    		double ratio=0.0;//临时变量，存各种类别"纠错率"
	    		
	        	for (int j = 0; j < 16; j++) {// 初始化数据，默认为0
					arrayList.add("0");
				}
	        	
	        	/******************************************经过实地调查*****************************************/
	        	String sqlBase_1=" select count(t.id) from xzfy_info t where 1=1 and t.status>0 and t.receive_date like '"+year+"%' and t.caseorg='"+(String)(doubleList.get(i).get(1))+"' and t.status>3 and t.stadardresult=1 and t.resarch=1";
	            
	        	resultSet = statement.executeQuery(sqlBase_1);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						arrayList.set(4,resultSet.getString(1));
						count=Long.parseLong((String)(resultSet.getString(1)));
					}
				}
					
				if(allRecCount!=0){
					arrayList.set(5, String.valueOf(Math.round(((double)count/allRecCount)*1000)/10.0)    );
				}
	        	
	        	String sql1=sqlBase_1+" and (t.finish_type=7 or t.finish_type=8 or t.finish_type=4 or t.finish_type=5 or t.finish_type=3 or t.finish_type=6)";
	        	
	        	resultSet = statement.executeQuery(sql1);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						if(count!=0){
							arrayList.set(6,  String.valueOf(Math.round(( (double)(Long.parseLong( (String)(resultSet.getString(1)) ))/count )*1000)/10.0)  );
							ratio=Math.round(( (double)(Long.parseLong( (String)(resultSet.getString(1)) ))/count )*1000)/10.0;
						}
					}
				}
	        	
	        	if(ratio>allRatio){
	        		arrayList.set(7,"↑");
	        	}
	        	else if(ratio<allRatio){
	        		arrayList.set(7,"↓");
	        	}
	        	else{
	        		arrayList.set(7,"-");
	        	}
	        	
	        	/*********************************************经过听证********************************************/
	            String sqlBase_2=" select count(t.id) from xzfy_info t where 1=1 and t.status>0 and t.receive_date like '"+year+"%' and t.caseorg='"+(String)(doubleList.get(i).get(1))+"' and t.status>3 and t.stadardresult=1 and t.hastingzheng=1";
	            
	        	resultSet = statement.executeQuery(sqlBase_2);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						arrayList.set(8,resultSet.getString(1));
						count=Long.parseLong((String)(resultSet.getString(1)));
					}
				}
					
				if(allRecCount!=0){
					arrayList.set(9, String.valueOf(Math.round(((double)count/allRecCount)*1000)/10.0)    );
				}
	        	
	        	String sql2=sqlBase_2+" and (t.finish_type=7 or t.finish_type=8 or t.finish_type=4 or t.finish_type=5 or t.finish_type=3 or t.finish_type=6)";
	        	
	        	resultSet = statement.executeQuery(sql2);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						if(count!=0){
							arrayList.set(10,  String.valueOf(Math.round(( (double)(Long.parseLong( (String)(resultSet.getString(1)) ))/count )*1000)/10.0)  );
							ratio=Math.round(( (double)(Long.parseLong( (String)(resultSet.getString(1)) ))/count )*1000)/10.0;
						}
					}
				}
	        	
				if(ratio>allRatio){
	        		arrayList.set(11,"↑");
	        	}
	        	else if(ratio<allRatio){
	        		arrayList.set(11,"↓");
	        	}
	        	else{
	        		arrayList.set(11,"-");
	        	}	
	        		
				/***************************************查阅案卷***************************************/
				String sqlBase_4=" select count(1) from xzfy_info t join cww_meet m on m.law_id=t.id and m.meet_type='阅卷' and t.status>0 and t.receive_date like '"+year+"%' and t.caseorg='"+(String)(doubleList.get(i).get(1))+"' and t.status>3 and t.stadardresult=1";
				
				resultSet = statement.executeQuery(sqlBase_4);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						arrayList.set(12,resultSet.getString(1));
						count=Long.parseLong((String)(resultSet.getString(1)));
					}
				}
				
				if(allRecCount!=0){
					arrayList.set(13, String.valueOf(Math.round(((double)count/allRecCount)*1000)/10.0)    );
				}
				
				String sql4=sqlBase_4+" and t.finish_type in (3,4,5,6,7,8)";
				
				resultSet = statement.executeQuery(sql4);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						if(count!=0){
							arrayList.set(14,  String.valueOf(Math.round(( (double)(Long.parseLong( (String)(resultSet.getString(1)) ))/count )*1000)/10.0)  );
							ratio=Math.round(( (double)(Long.parseLong( (String)(resultSet.getString(1)) ))/count )*1000)/10.0;
						}
					}
				}
	        		
				if(ratio>allRatio){
	        		arrayList.set(15,"↑");
	        	}
	        	else if(ratio<allRatio){
	        		arrayList.set(15,"↓");
	        	}
	        	else{
	        		arrayList.set(15,"-");
	        	}
	        	/***************************************召开复议委员会案审会***************************************/
	            String sqlBase_3=" select count(t.id) from xzfy_info t where 1=1 and t.status>0 and t.receive_date like '"+year+"%' and t.caseorg='"+(String)(doubleList.get(i).get(1))+"' and t.status>3 and t.stadardresult=1 and t.is_commit=1";
	            
	        	resultSet = statement.executeQuery(sqlBase_3);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						arrayList.set(16,resultSet.getString(1));
						count=Long.parseLong((String)(resultSet.getString(1)));
					}
				}
					
				if(allRecCount!=0){
					arrayList.set(17, String.valueOf(Math.round(((double)count/allRecCount)*1000)/10.0)    );
				}
	        	
	        	String sql3=sqlBase_3+" and (t.f" +"inish_type=7 or t.finish_type=8 or t.finish_type=4 or t.finish_type=5 or t.finish_type=3 or t.finish_type=6)";
	        	
	        	resultSet = statement.executeQuery(sql3);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						if(count!=0){
							arrayList.set(18,  String.valueOf(Math.round(( (double)(Long.parseLong( (String)(resultSet.getString(1)) ))/count )*1000)/10.0)  );
							ratio=Math.round(( (double)(Long.parseLong( (String)(resultSet.getString(1)) ))/count )*1000)/10.0;
						}
					}
				}
	        	
				if(ratio>allRatio){
	        		arrayList.set(19,"↑");
	        	}
	        	else if(ratio<allRatio){
	        		arrayList.set(19,"↓");
	        	}
	        	else{
	        		arrayList.set(19,"-");
	        	}
	        	   	
	        	arrayLists.add(arrayList);
	        }
        }
        catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {

			try {
				if (statement != null) {

					statement.close();
					statement = null;
				}
				if (connection != null) {

					connection.close();
					connection = null;

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return arrayLists;
	}
	
/**
 * @throws SQLException ***************************************************************************************************************/	
	/***************************************************获取效率指标统计二维列表****************************************************/	
	public ArrayList<ArrayList<String>> getEfficiencyLists(ArrayList<ArrayList<String>> doubleList,String date) throws SQLException{
		ArrayList<ArrayList<String>> arrayLists = new ArrayList<ArrayList<String>>();
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement statement = connection.createStatement();
		ResultSet resultSet = null;		
					
		/************************参数date转化为具体日期***************************/
		String startDate="";
		String endDate="";
		
		String year=date.substring(0, 4);//取年份
		
		/********全年*********/
		if(date.charAt(4)=='0'){
			 startDate=year+"-01-01";
			 endDate=year+"-12-31";	
		}
		
		/********上半年*********/		
		else if(date.charAt(4)=='1'){
			 startDate=year+"-01-01";
			 endDate=year+"-06-30";	
		}
		
		/*********下半年********/
        else if(date.charAt(4)=='2'){
        	 startDate=year+"-07-01";
			 endDate=year+"-12-31";	
		}		
		/********************************************************************/
		
		try{
			for(int i=0;i<doubleList.size();i++){
				ArrayList<String> arrayList = new ArrayList<String>();
				
				arrayList.add(doubleList.get(i).get(0));
				
				for (int j = 0; j < 12; j++) {// 初始化数据，默认为0
					arrayList.add("0");
				}
				
				int fopCount=0;//专兼职复议人员人数
				
				/*****************************************专兼职复议人员****************************************/
				String fopSql="";
				
				fopSql=" select t.num_full_xzfy_staff + t.num_part_xzfy_staff as total_count from xzfy_company t";
				fopSql+=" where 1=1";
				fopSql+=" and t.corp_code='"+doubleList.get(i).get(1)+"'";
				fopSql+=" and t.work_name='"+doubleList.get(i).get(0)+"'";
				
				resultSet = statement.executeQuery(fopSql);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						arrayList.set(1,resultSet.getString(1));
						fopCount=Integer.parseInt((String)(resultSet.getString(1)));
					}
				}
				
				/*****************************************受理数量****************************************/
				String acceptedSql="";
				long newly=0;
				long old=0;
				
				acceptedSql=" select sum(case when t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as newly_receive,";
			    acceptedSql+=" sum(case when t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as old_not";
			    acceptedSql+=" from xzfy_info t where 1=1 and t.status>0 and t.caseorg='"+(String)(doubleList.get(i).get(1))+"'";
				
			    resultSet = statement.executeQuery(acceptedSql);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						arrayList.set(2,resultSet.getString(1));
						  newly=Long.parseLong((String)(resultSet.getString(1)));
						arrayList.set(3,resultSet.getString(2));
						  old=Long.parseLong((String)(resultSet.getString(2)));
					}
				}
				
				
					long total=newly+old;
					arrayList.set(4, String.valueOf(total)  );
				
				//专兼职人数为0的情况，避免分母为0
				if(fopCount==0){
					arrayList.set(5,"-");
				}
				else if(fopCount==1){
					arrayList.set(5,String.valueOf(total));
				}									
				else{
					arrayList.set(5, String.valueOf(   Math.round(((double)total/fopCount)*10)/10.0  )      );
				}
				
				
				/*****************************************结案情况****************************************/
				
				String finishSql="";
				long unfinished=0;
				long finished=0;
				
				finishSql="select sum(case when t.stadardresult=1 and t.status<12 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as unfinished,";
				finishSql+=" sum(case when t.stadardresult=1 and t.status=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' then 1 else 0 end) as finished";
				finishSql+=" from xzfy_info t where 1=1 and t.status>0 and t.caseorg='"+(String)(doubleList.get(i).get(1))+"'";
				
				resultSet = statement.executeQuery(finishSql);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
						arrayList.set(6,resultSet.getString(1));
						 unfinished=Long.parseLong((String)(resultSet.getString(1)));
						arrayList.set(7,resultSet.getString(2));
						 finished=Long.parseLong((String)(resultSet.getString(2)));
					}
				}
				long allCase=unfinished+finished;
				
				if(allCase!=0){
					arrayList.set(8,  String.valueOf( Math.round(((double)finished/allCase)*1000)/10.0)) ;						
				}
				
				if(fopCount==0){
					arrayList.set(9,"-");
				}
				else if(fopCount==1){
					arrayList.set(9,String.valueOf(finished));
				}
				else{
					arrayList.set(9,  String.valueOf (Math.round( ((double)finished/fopCount)*10)/10.0)  );
				}
				/*****************************************办案效率****************************************/
				String eftSql="";
				long inTime=0;
				long outTime=0;
				long allCasesCount=0;
				long allDaysCount=0;
				
				eftSql=" select sum(case when t.stadardresult=1 and t.status=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' and ceil(To_date(t.finish_date,'yyyy-mm-dd')-To_date(t.receive_date,'yyyy-mm-dd')) <='60' then 1 else 0 end) as in_time,";
				eftSql+=" sum(case when t.stadardresult=1 and t.status=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' and ceil(To_date(t.finish_date,'yyyy-mm-dd')-To_date(t.receive_date,'yyyy-mm-dd')) >'60' then 1 else 0 end) as out_time,";
				eftSql+=" sum(case when t.stadardresult=1 and t.status=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' then ceil(To_date(t.finish_date,'yyyy-mm-dd')-To_date(t.receive_date,'yyyy-mm-dd')) else 0 end) as all_days";
				eftSql+=" from xzfy_info t";
				eftSql+=" where 1=1";
				eftSql+=" and t.isstop !=0 and t.isstop is not null";
				eftSql+=" and t.caseorg='"+(String)(doubleList.get(i).get(1))+"'";
				
				resultSet = statement.executeQuery(eftSql);
				while(resultSet.next()){
					if (resultSet.getString(1)!=null){
	
						inTime=Long.parseLong((String)(resultSet.getString(1)));

						outTime=Long.parseLong((String)(resultSet.getString(2)));
						allDaysCount=Long.parseLong((String)(resultSet.getString(3)));
					}
				}
				
				allCasesCount=inTime+outTime;
				
				if(allCasesCount!=0){
					arrayList.set(10,  String.valueOf(Math.round(  ((double)inTime/allCasesCount)*1000 )/10.0)  );
					arrayList.set(11,  String.valueOf(Math.round(  ((double)outTime/allCasesCount)*1000 )/10.0)  );
					
					arrayList.set(12,  String.valueOf(Math.round(  ((double)allDaysCount/allCasesCount)*10  )/10.0)  );
				}
												
				arrayLists.add(arrayList);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {

			try {
				if (statement != null) {

					statement.close();
					statement = null;
				}
				if (connection != null) {

					connection.close();
					connection = null;

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return arrayLists;
	}		

	
}
