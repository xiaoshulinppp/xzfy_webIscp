package com.taiji.fzb.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.JtfyajslTongjiService;
import com.util.JdbcUtil;

public class JtfyajslTongjiServiceImpl extends CoreServiceImpl implements JtfyajslTongjiService {

	@Override
	public ArrayList<ArrayList<String>> getJtfyajslTongjiData(
			ArrayList<ArrayList<String>> monthList) {
		ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
		for(int i=0;i<monthList.size();i++){
			ArrayList<String> list1 = monthList.get(i);
			ArrayList<String> list2 = new ArrayList<String>();
			list2.add(list1.get(0));list2.add(list1.get(1));
			String HQL1="",HQL2="",HQL3="",HQL4="",HQL5="",HQL6="",HQL7="",HQL8="",HQL9="",HQL10="",HQL11="",HQL12="";
			HQL1+="select count(*) from XzfyInfo t where t.receive_date <= '"+list1.get(3)+"' and t.receive_date >= '"+list1.get(2)+"' and t.status>0";
			HQL2+="select count(*) from XzfyInfo t where t.receive_date <= '"+list1.get(3)+"' and t.receive_date >= '"+list1.get(2)+"' and t.app_type = '2' and t.status>0";
			HQL3+="select count(*) from XzfyInfo t where t.receive_date <= '"+list1.get(3)+"' and t.receive_date >= '"+list1.get(2)+"' and t.app_type = '1' and (t.renCount >= 1 and t.renCount<=3 or t.renCount is null) and t.status>0";
			HQL4+="select count(*) from XzfyInfo t where t.receive_date <= '"+list1.get(3)+"' and t.receive_date >= '"+list1.get(2)+"' and t.app_type = '1' and t.renCount >= 4 and t.renCount<=10 and t.status>0";
			HQL5+="select count(*) from XzfyInfo t where t.receive_date <= '"+list1.get(3)+"' and t.receive_date >= '"+list1.get(2)+"' and t.app_type = '1' and t.renCount >= 11 and t.renCount<=20 and t.status>0";
			HQL6+="select count(*) from XzfyInfo t where t.receive_date <= '"+list1.get(3)+"' and t.receive_date >= '"+list1.get(2)+"' and t.app_type = '1' and t.renCount >= 21 and t.renCount<=30 and t.status>0";
			HQL7+="select count(*) from XzfyInfo t where t.receive_date <= '"+list1.get(3)+"' and t.receive_date >= '"+list1.get(2)+"' and t.app_type = '1' and t.renCount >= 31 and t.renCount<=50 and t.status>0";
			HQL8+="select count(*) from XzfyInfo t where t.receive_date <= '"+list1.get(3)+"' and t.receive_date >= '"+list1.get(2)+"' and t.app_type = '1' and t.renCount >= 50 and t.renCount<=80 and t.status>0";
			HQL9+="select count(*) from XzfyInfo t where t.receive_date <= '"+list1.get(3)+"' and t.receive_date >= '"+list1.get(2)+"' and t.app_type = '1' and t.renCount >= 81 and t.renCount<=100 and t.status>0";
			HQL10+="select count(*) from XzfyInfo t where t.receive_date <= '"+list1.get(3)+"' and t.receive_date >= '"+list1.get(2)+"' and t.app_type = '1' and t.renCount > 100 and t.status>0";
			HQL11+="select count(*) from XzfyInfo t where t.receive_date <= '"+list1.get(3)+"' and t.receive_date >= '"+list1.get(2)+"' and t.app_type = '1' and t.status>0";
			HQL12+="select sum(renCount) from XzfyInfo t where t.receive_date <= '"+list1.get(3)+"' and t.receive_date >= '"+list1.get(2)+"' and t.app_type = '1' and t.status>0";
			list2.add(String.valueOf(super.find(HQL1).get(0)));
			list2.add(String.valueOf(super.find(HQL2).get(0)));
			list2.add(String.valueOf(super.find(HQL3).get(0)));
			list2.add(String.valueOf(super.find(HQL4).get(0)));
			list2.add(String.valueOf(super.find(HQL5).get(0)));
			list2.add(String.valueOf(super.find(HQL6).get(0)));
			list2.add(String.valueOf(super.find(HQL7).get(0)));
			list2.add(String.valueOf(super.find(HQL8).get(0)));
			list2.add(String.valueOf(super.find(HQL9).get(0)));
			list2.add(String.valueOf(super.find(HQL10).get(0)));
			list2.add(String.valueOf(super.find(HQL11).get(0)));
			if(super.find(HQL12).isEmpty())
				list2.add("0");
			else
				list2.add(String.valueOf(super.find(HQL12).get(0)));
			data.add(list2);
		}
		return data;
	}

	@Override
	public List getTongjiData1(String appName, String xwName,
			String xwNum, String defendantName) {
		String HQL="";
		HQL+="select distinct t.xwname,t.xwnum,t.defendant_name,count(t.id) as countid from XzfyInfo t where t.xwname is not null and t.xwname<>'无' and  t.xwnum is not null and t.xwnum<>'无' and length(t.xwnum)>3 and length(t.xwname)>3";
		if(xwName!=null&&!xwName.equals("")){
			HQL+=" and t.xwname = '"+xwName+"'";
		}
		if(xwNum!=null&&!xwNum.equals("")){
			HQL+=" and t.xwnum = '"+xwNum+"'";
		}
		if(defendantName!=null&&!defendantName.equals("")){
			HQL+=" and t.defendant_name = '"+defendantName+"'";
		}
		HQL+=" group by t.xwname,t.xwnum,t.defendant_name";
		return super.find(HQL);
	}
	
	public PaginationSupport getXzfyInfoList(int pageNum,int pageSize,String appName, String xwName,
			String xwNum, String defendantName){
		String HQL="";
		HQL+=" from XzfyInfo t where 1=1";
		if(appName!=null&&!appName.equals("")){
			HQL+=" and t.app_show = '"+appName+"'";
		}
		if(xwName!=null&&!xwName.equals("")){
			HQL+=" and t.xwname = '"+xwName+"'";
		}
		if(xwNum!=null&&!xwNum.equals("")){
			HQL+=" and t.xwnum = '"+xwNum+"'";
		}
		if(defendantName!=null&&!defendantName.equals("")){
			HQL+=" and t.defendant_name = '"+defendantName+"'";
		}
		return super.find(HQL,pageNum,pageSize);
	}

	public ArrayList<ArrayList<String>> getTongjiForm15(String locbm, String appName, String shixiang, String xwname,
			String keyword, String receiveYear, String status) throws SQLException {
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement = connection.createStatement();
		ResultSet resultSet = null;
		ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
		String sql="";
		//sql+="select t.receive_date,t.app_show,t.defendant_name,t.xwname,t.xwnum,t.keyword,t.casetype,t.status,t.finish_date,t.finish_type,(select count(*) from eWebOffice_T_Document where D_TYPE='xingzhengfuyiyijianshu' and caseId=t.id),(select count(*) from eWebOffice_T_Document where D_TYPE='xingzhengfuyijianyishu' and caseId=t.id),t.id,t.isstop,t.breakTo from xzfy_info t where 1=1";
		sql+="select t.receive_date,t.app_show,t.defendant_name,t.xwname,t.xwnum,t.keyword,t.casetype,t.status,t.finish_date,t.finish_type,yijian_file,jianyi_file,t.id,t.isstop,t.breakTo from xzfy_info t where 1=1";
		if(locbm!=null&&!locbm.equals("")){sql+=" and t.defendant_name = '"+locbm+"'";}
		if(appName!=null&&!appName.equals("")){sql+=" and t.app_show like '%"+appName+"%'";}
		if(shixiang!=null&&!shixiang.equals("")){sql+=" and t.casetype = '"+shixiang+"'";}
		if(xwname!=null&&!xwname.equals("")){sql+=" and t.xwname like '%"+xwname+"%'";}
		if(keyword!=null&&!keyword.equals("")){sql+=" and t.keyword = '"+keyword+"'";}
		if(receiveYear!=null&&!receiveYear.equals("")){sql+=" and t.receive_date like '"+receiveYear+"%'";}
		if(status!=null&&!status.equals("")){
			if(status.equals("1")){sql+=" and t.status<12 and (t.isstop = '0' or t.isstop is null)";}
			else if(status.equals("2")){sql+=" and (t.status=8 or t.status=4 and t.isstop=1 or t.breakTo is null and t.isstop=1)";}
			else if(status.equals("3")){sql+=" and t.status = 12";}
			else{sql+=" and t.status<12";}
		}
		try{
			resultSet = selectStatement.executeQuery(sql);
			while(resultSet.next()){
				ArrayList<String> tmp = new ArrayList<String>();
				for(int i=0;i<15;i++){
					tmp.add(resultSet.getString(i+1));
				}
				list.add(tmp);
			}
		} finally {
			try {
				if (selectStatement != null) {
					selectStatement.close();
					selectStatement = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
		return list;
	}
	public ArrayList<ArrayList<String>> getTongjiForm17(String locbm, String appName, String shixiang, String xwname,
			String keyword, String receiveYear, String status) throws SQLException {
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement = connection.createStatement();
		ResultSet resultSet = null;
		ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
		String sql="";
		//sql+="select t.receive_date,t.app_show,t.defendant_name,t.xwname,t.xwnum,t.keyword,t.casetype,t.status,t.finish_date,t.finish_type,(select count(*) from eWebOffice_T_Document where D_TYPE='xingzhengfuyiyijianshu' and caseId=t.id),(select count(*) from eWebOffice_T_Document where D_TYPE='xingzhengfuyijianyishu' and caseId=t.id),t.id,t.isstop,t.breakTo from xzfy_info t where 1=1";
		sql+="select t.receive_date,t.app_show,t.defendant_name,t.xwname,t.xwnum,t.keyword,t.casetype,t.status,t.finish_date,t.finish_type,yijian_file,jianyi_file,t.id,t.isstop,t.breakTo from xzfy_info t where 1=1";
		if(locbm!=null&&!locbm.equals("")){sql+=" and t.defendant_name = '"+locbm+"'";}
		if(appName!=null&&!appName.equals("")){sql+=" and t.app_show like '%"+appName+"%'";}
		if(shixiang!=null&&!shixiang.equals("")){sql+=" and t.casetype = '"+shixiang+"'";}
		if(xwname!=null&&!xwname.equals("")){sql+=" and t.xwname like '%"+xwname+"%'";}
		if(keyword!=null&&!keyword.equals("")){sql+=" and t.keyword = '"+keyword+"'";}
		if(receiveYear!=null&&!receiveYear.equals("")){sql+=" and t.receive_date like '"+receiveYear+"%'";}
		if(status!=null&&!status.equals("")){
			if(status.equals("1")){sql+=" and t.status<12 and (t.isstop = '0' or t.isstop is null)";}
			else if(status.equals("2")){sql+=" and (t.status=8 or t.status=4 and t.isstop=1 or t.breakTo is null and t.isstop=1)";}
			else if(status.equals("3")){sql+=" and t.status = 12";}
			else{sql+=" and t.status<12";}
		}
		try{
			resultSet = selectStatement.executeQuery(sql);
			while(resultSet.next()){
				ArrayList<String> tmp = new ArrayList<String>();
				for(int i=0;i<15;i++){
					tmp.add(resultSet.getString(i+1));
				}
				list.add(tmp);
			}
		} finally {
			try {
				if (selectStatement != null) {
					selectStatement.close();
					selectStatement = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
		return list;
	}
	@Override
	public ArrayList<ArrayList<String>> getTongjiForm19(List<String> list1,List<String> list2,String locbm, String shixiang,
			String startDate, String endDate) throws Exception{
		ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
		String HQL = "select sum(case when t.stadardresult=1 and t.status<=12 and t.status>0 then 1 else 0 end) as zongshu," +
				"sum(case when t.stadardresult=1 and t.status<12 and t.status>0 and (t.isstop = '0' or t.isstop is null)  then 1 else 0 end) as banlizhong," +
				"sum(case when t.stadardresult=1 and t.status>0 and t.status<12  and (t.status=8 or t.status=4 and t.isstop=1 or t.breakTo is null and t.isstop=1) then 1 else 0 end) as zhongzhi," +
				"sum(case when t.finish_type=2 and t.stadardresult=1 and t.status=12 then 1 else 0 end) as weichi," +
				"sum(case when t.finish_type=1 and t.finishBreakType=5 and t.stadardresult=1 and t.status=12 then 1 else 0 end) as bohui1," +
				"sum(case when t.finish_type=1 and t.finishBreakType=6 and t.stadardresult=1 and t.status=12 then 1 else 0 end) as bohui2," +
				"sum(case when t.finish_type=1 and (t.finishBreakType=7 or t.finishBreakType is null) and t.stadardresult=1 and t.status=12 then 1 else 0 end) as bohui3," +
				"sum(case when t.finish_type=4 and t.stadardresult=1 and t.status=12 then 1 else 0 end) as chexiao," +
				"sum(case when t.finish_type=5 and t.stadardresult=1 and t.status=12 then 1 else 0 end) as biangeng," +
				"sum(case when t.finish_type=3 and t.stadardresult=1 and t.status=12 then 1 else 0 end) as querenweifa," +
				"sum(case when t.finish_type=6 and t.stadardresult=1 and t.status=12 then 1 else 0 end) as zelinglvxing," +
				"sum(case when t.finish_type=8 and t.finishBreakType=1 and t.stadardresult=1 and t.status=12 then 1 else 0 end) as zhongzhi1," +
				"sum(case when t.finish_type=8 and t.finishBreakType=2 and t.stadardresult=1 and t.status=12 then 1 else 0 end) as zhongzhi2," +
				"sum(case when t.finish_type=8 and t.finishBreakType=3 and t.stadardresult=1 and t.status=12 then 1 else 0 end) as zhongzhi3," +
				"sum(case when t.finish_type=8 and (t.finishBreakType=4 or t.finishBreakType is null) and t.stadardresult=1 and t.status=12 then 1 else 0 end) as zhongzhi4," +
				"sum(case when t.finish_type=7 and t.stadardresult=1 and t.status=12 then 1 else 0 end) as tiaojie," +
				"sum(case when t.finish_type=9 and t.stadardresult=1 and t.status=12 then 1 else 0 end) as qita" +
				" from xzfy_info t where t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"'";
		if(shixiang!=null&&!shixiang.equals("")){
			HQL+=" and t.casetype = '"+shixiang+"'";
		};
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement = connection.createStatement();
		ResultSet resultSet = null;
		Connection connection1 = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement1 = connection.createStatement();
		ResultSet resultSet1 = null;
		if(list1.size()>0){
			try {
				for(int i=0;i<list1.size();i++){
					ArrayList<String> tmp1 = new ArrayList<String>();tmp1.add("本级政府");for(int j=1;j<18;j++){tmp1.add("0");}
					ArrayList<String> tmp2 = new ArrayList<String>();tmp2.add("上级部门");for(int j=1;j<18;j++){tmp2.add("0");}
					String HQL1 = HQL;String HQL2 = HQL;
					HQL1+=" and t.caseorg ='"+list1.get(i)+"' and t.tapplicationdeptid = '"+list2.get(i)+"'";
					HQL2+=" and t.caseorg ='"+locbm+"' and t.tapplicationdeptid = '"+list2.get(i)+"'";
					resultSet = selectStatement.executeQuery(HQL1);
					resultSet1 = selectStatement1.executeQuery(HQL2);
					while(resultSet.next()){
						for(int x=1;x<=17;x++)
						tmp1.set(x, resultSet.getString(x));
					}
					while(resultSet1.next()){
						for(int y=1;y<=17;y++)
						tmp2.set(y, resultSet1.getString(y));
					}
					list.add(tmp1);list.add(tmp2);
				}
				ArrayList<String> heji1 = new ArrayList<String>();heji1.add("本级政府");for(int j=1;j<18;j++){heji1.add("0");}
				ArrayList<String> heji2 = new ArrayList<String>();heji2.add("上级部门");for(int j=1;j<18;j++){heji2.add("0");}
				String HQL3 = " and (",HQL4=" and (";
				for(int i=0;i<list1.size();i++){
					if(i==0){
						HQL3+="t.tapplicationdeptid = '"+list2.get(i)+"'";
						HQL4+="t.caseorg ='"+list1.get(i)+"'";
					}else{
						HQL3+=" or t.tapplicationdeptid = '"+list2.get(i)+"'";
						HQL4+=" or t.caseorg ='"+list1.get(i)+"'";
					}	
				}
				HQL3+=")";HQL4+=")";
				resultSet = selectStatement.executeQuery(HQL+HQL3+HQL4);
				resultSet1 = selectStatement1.executeQuery(HQL+HQL3+" and t.caseorg ='"+locbm+"'");
				while(resultSet.next()){
					for(int x=1;x<=17;x++)
						heji1.set(x, resultSet.getString(x));
				}
				while(resultSet1.next()){
					for(int y=1;y<=17;y++)
						heji2.set(y, resultSet1.getString(y));
				}
				list.add(heji1);list.add(heji2);
			} finally {
	
				try {
					if (selectStatement != null) {
						selectStatement.close();
						selectStatement = null;
					}
					if (connection != null) {
						connection.close();
						connection = null;
					}
					if (selectStatement1 != null) {
						selectStatement1.close();
						selectStatement1 = null;
					}
					if (connection1 != null) {
						connection1.close();
						connection1 = null;
					}
				} catch (SQLException e) {
					System.out.println(e.getMessage());
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	public String form23jk1(Connection conn,String jktype,String hengxiangtype,String startDate,String endDate) throws Exception{
		List<Map<String,String>> locbmList = new ArrayList<Map<String,String>>();
		String xmlStr = "<chart caption='' xAxisName='"
		  	+"' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' baseFontSize='14' outCnvBaseFontSize='14' showLimits='1' yAxisMaxValue='100' numberSuffix='%'>";
		locbmList = getXml(conn, hengxiangtype,startDate,endDate);
		for(int i=0;i<locbmList.size();i++){
			/*if(i==0){
				xmlStr+="<set label='北京市政府' value='"+locbmList.get(i).get("value")
				+"'/>";
			}else{*/
			if(!locbmList.get(i).get("value").equals("0"))
				xmlStr+="<set label='"+locbmList.get(i).get("orgname")+"' value='"+locbmList.get(i).get("value")
				+"'/>";
			//}
		}
		xmlStr+="</chart>";
		return xmlStr;
	}
	
	public List<Map<String,String>> getQuxian(Connection conn) throws Exception{       //获取北京市政府和区县政府编码
		String sql="select t.org_locbm,t.org_name from u_org t where t.org_parent='1' and t.org_locbm like '__00' and to_number(substr(t.org_locbm,0,2))<=18 order by to_number(t.org_locbm)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		Map<String,String> map = null;
		while(rs.next()){
			map = new HashMap<String,String>();
			map.put("locbm",rs.getString(1));
			map.put("orgname",rs.getString(2));
			list.add(map);
		}
		rs.close();
		pstmt.close();
		return list;
	}
	public List<Map<String,String>> getBumen(Connection conn)throws Exception{       //获取政府部门编码
		String sql="select t.org_locbm,t.org_name from u_org t where t.org_parent='1' and t.org_locbm like '__00' and to_number(substr(t.org_locbm,0,2))>18 order by to_number(t.org_locbm)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		Map<String,String> map = null;
		while(rs.next()){
			map = new HashMap<String,String>();
			map.put("locbm",rs.getString(1));
			map.put("orgname",rs.getString(2));
			list.add(map);
		}
		rs.close();
		pstmt.close();
		return list;
	}
	public List<Map<String,String>> getXml(Connection conn,String hengxiangtype,String startDate,String endDate) throws Exception{
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		List<Map<String,String>> locbmList = new ArrayList<Map<String,String>>();
		Map<String,String> map = new HashMap<String, String>();
		if(hengxiangtype.equals("1")){
			locbmList = getQuxian(conn);
		}else{
			locbmList = getBumen(conn);
		}
		for(int i=0;i<locbmList.size();i++){
			map = new HashMap<String, String>();
			//map.put("orgname", locbmList.get(i).get("orgname"));
			String sql = "select count(*) from xzfy_info x "
				+"where x.finish_real_date is not null and to_char(x.finish_real_date)>=to_char('"+startDate+"') and to_char(x.finish_real_date)<=to_char('"+endDate+"') and  x.status>0 and "
				+"((x.isdelay=0 or x.isdelay is null) and (to_date(x.finish_real_date,'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd')<=60)"
				+"or x.isdelay=1 and (to_date(x.finish_real_date,'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd')<=90)"
				+") and x.caseorg = '"+locbmList.get(i).get("locbm")+"'";
			String sql1 = "select count(*) from xzfy_info x "
				+"where x.finish_real_date is not null and to_char(x.finish_real_date)>=to_char('"+startDate+"') and to_char(x.finish_real_date)<=to_char('"+endDate+"') and  x.status>0 and x.caseorg = '"+locbmList.get(i).get("locbm")+"'";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			ResultSet rs1 = pstmt1.executeQuery();
			String a="",b="";
			while(rs.next()){
				a=rs.getString(1);
			}
			while(rs1.next()){
				b=rs1.getString(1);
			}
			rs.close();
			pstmt.close();
			rs1.close();
			pstmt1.close();
			//String a=JdbcUtil.getSingleValBySql(conn, sql);
			//String b=JdbcUtil.getSingleValBySql(conn, sql1);
			if(!b.equals("0")){
				int c=(int)(Float.parseFloat(a)/Float.parseFloat(b)*100);
				map.put("orgname", locbmList.get(i).get("orgname"));
				map.put("value", c+"");
				list.add(map);
			}
		}
		return list;
		
	}//finish_real_date
	public String form23jk2(Connection conn,String locbm,String startDate,String endDate) throws Exception{
		String sql="select count(id) from xzfy_info x where x.finish_real_date is not null and to_char(x.finish_real_date)>=to_char('"+startDate+"') and to_char(x.finish_real_date)<=to_char('"+endDate+"') and x.status>0 and "
			+"((x.isdelay=0 or x.isdelay is null) and (to_date(x.finish_real_date,'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd')<=60) "
			+"or x.isdelay=1 and (to_date(x.finish_real_date,'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd')<=90) "
			+") and x.caseorg = '"+locbm+"'"
			+"union all	"
			+"select count(id) from xzfy_info x where x.finish_real_date is not null and to_char(x.finish_real_date)>=to_char('"+startDate+"') and to_char(x.finish_real_date)<=to_char('"+endDate+"') and x.status>0 and "
			+"((x.isdelay=0 or x.isdelay is null) and (to_date(x.finish_real_date,'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd') between 61 and 63) "
			+"or x.isdelay=1 and (to_date(x.finish_real_date,'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd') between 91 and 93)) and x.caseorg =  '"+locbm+"'"
			+"union all "
			+"select count(id) from xzfy_info x " 
			+"where x.finish_real_date is not null and to_char(x.finish_real_date)>=to_char('"+startDate+"') and to_char(x.finish_real_date)<=to_char('"+endDate+"') and x.status>0 and "
			+"((x.isdelay=0 or x.isdelay is null) and (to_date(x.finish_real_date,'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd') between 64 and 70) "
			+"or x.isdelay=1 and (to_date(x.finish_real_date,'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd') between 94 and 100)) and x.caseorg ='"+locbm+"'"
			+"union all "
			+"select count(id) from xzfy_info x "
			+"where x.finish_real_date is not null and to_char(x.finish_real_date)>=to_char('"+startDate+"') and to_char(x.finish_real_date)<=to_char('"+endDate+"') and x.status>0 and "
			+"((x.isdelay=0 or x.isdelay is null) and (to_date(x.finish_real_date,'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd')>70) "
			+"or x.isdelay=1 and (to_date(x.finish_real_date,'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd')>100)) and x.caseorg = '"+locbm+"'";
		String xmlStr = "<chart caption='' xAxisName='"
		  	+"' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' baseFontSize='14' outCnvBaseFontSize='14'>";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int i=0;
		while(rs.next()){
			i++;
			if(i==1)
				xmlStr+="<set label='及时结案' value='"+rs.getInt(1)
				+"'/>";
			else if(i==2)
				xmlStr+="<set label='超时1-3天' value='"+rs.getInt(1)
				+"'/>";
			else if(i==3)
				xmlStr+="<set label='超时4-10天' value='"+rs.getInt(1)
				+"'/>";
			else if(i==4)
				xmlStr+="<set label='超过10天' value='"+rs.getInt(1)
				+"'/>";
		}
		rs.close();
		pstmt.close();
		xmlStr+="</chart>";
		return xmlStr;
	}

}
