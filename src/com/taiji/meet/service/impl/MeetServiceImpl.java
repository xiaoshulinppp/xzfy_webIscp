package com.taiji.meet.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.taiji.common.ContextUtil;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyKeyword;
import com.taiji.fzb.domain.XzfyRecieve;
import com.taiji.meet.domin.Meet;
import com.taiji.meet.domin.Client;
import com.taiji.meet.service.MeetService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.util.JdbcUtil;
import java.sql.SQLException;

@SuppressWarnings("unchecked")
public class MeetServiceImpl extends CoreServiceImpl implements MeetService {

	
	
	@Override
	public void saveMeet(Meet meet) {
		super.saveOrUpdate(meet);
		
	}

	@Override
	public void saveClient(Client client) {
		super.saveOrUpdate(client);
		
	}
	
	
	
	
	
	/*
	 * 获取模板列表
	 * 
	 * @param pageNumber 页码
	 * 
	 * @param pageSize 每页显示条数
	 * 
	 * @return 分页的列表
	 */
	@Override
	public PaginationSupport getXzfyList(int pageNumber, int pageSize) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfy";
		HQL += " where 1 = 1";
		return super.find(HQL, pageNumber, pageSize);
	}

	
	
	
	
	
	
	
	
	
	

	/*
	 * 通过ID获取模板对象
	 * 
	 * @param entityId 模板对象ID
	 * 
	 * @return 模板对象
	 */

	public Meet getMeetById(String meetid) {
		String HQL = "";
		HQL += " from Meet meet";
		HQL += " where 1 = 1";
		HQL += " and meet.Main_id = '" + meetid+"'";
		List<Meet> dataList = super.find(HQL);
		Meet meet = new Meet();
		if (dataList.isEmpty()) {
			meet = new Meet();
		} else {
			meet = dataList.get(0);
		}
		return meet;
	}
	@Override
	public PaginationSupport getMeetList(int pageNumber, int pageSize) {
		String HQL = "";
		HQL += " from  Meet meet";
		HQL += " where 1 = 1";
		return super.find(HQL, pageNumber, pageSize);
	}
	@Override
	public List getAllList(){
		String HQL = "";
		HQL += " from  Meet meet";
		HQL += " where 1 = 1";
		return super.find(HQL);		
		
	}

	@Override
	public PaginationSupport getUnsetList(int pageNumber, int pageSize) {
		String HQL = "";
		HQL += " from  Meet meet";
		HQL += " where meet.Meet_type in (' ')";
		return super.find(HQL, pageNumber, pageSize);
	}

	@Override
	public List<Meet> getAllUnsetList() {
		String HQL = "";
		HQL += " from  Meet meet";
		HQL += " where meet.Meet_type in (' ')";
		return super.find(HQL);	
	}

	@Override
	public List<Meet> getAllSetupList() {
		String HQL = "";
		HQL += " from  Meet meet";
		HQL += " where meet.Meet_type not in (' ')";
		return super.find(HQL);	
	}

	@Override
	public PaginationSupport getSetupList(int pageNumber, int pageSize) {
		String HQL = "";
		HQL += " from  Meet meet";
		HQL += " where meet.Meet_type not in (' ')";
		return super.find(HQL, pageNumber, pageSize);
	}



	@Override
	public PaginationSupport FindList(int pageNumber,int pageSize,String title,String Face_time,String Admit1,String Admit2,String Meet_type) {
		String HQL = "";
		boolean isFirst = true;
		HQL += " from  Meet meet where 1=1 ";
		if(!title.equals("")){
			isFirst=false;
			HQL+="and meet.title like '%"+title+"%'";
		}

		return super.find(HQL, pageNumber, pageSize);

	}

	@Override
	public List<Meet> FindAllList(String title,String Face_time, String Admit1, String Admit2,String Meet_type) {
		String HQL = "";
		boolean isFirst = true;
		HQL += " from  Meet meet where 1=1 ";
		if(!title.equals("")){
			isFirst=false;
			HQL+="and meet.title like '%"+title+"%'";
		}


		return super.find(HQL);
	}

	
	
	
	
	
	


	
	
	
	
	
	
	
	
	
	
	public List getAppListById(String entityId,String protype) {
		String HQL = "";
		HQL += " from XzfyApp app";
		HQL += " where 1 = 1";
		HQL += " and app.xzfyInfo.id = '" + entityId+"' and app.proxytype="+protype;
		List<XzfyInfo> dataList = super.find(HQL);
		return dataList;
	}

	
	
	
	
	
	
	public void deleteAppById(int entityId){
		String hql="delete from  XzfyApp app where app.id="+entityId;
		super.deleteAll(hql);
		
	}

	
	
	
	
	
	public XzfyApp getAppById(int entityId) {
		String HQL = "";
		HQL += " from XzfyApp app";
		HQL += " where 1 = 1";
		HQL += " and app.id = " + entityId;
		List<XzfyApp> dataList = super.find(HQL);
		XzfyApp app = new XzfyApp();
		if (dataList.isEmpty()) {
			app = new XzfyApp();
		} else {
			app = dataList.get(0);
		}
		return app;
	}

	
	


	@Override
	public void deleteClientById(int clientid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Client getClientById(int clientid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getClientListById(int clientid, String protype) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveXzfyInfo(XzfyInfo xzfyInfo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void savexzfyApp(XzfyApp xzfyApp) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public PaginationSupport getBananListByPage(int pageNumber, int pageSize,XzfyInfo xzfyInfo,String locbm) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status>3 and xzfyInfo.status<12 and xzfyInfo.stadardResult=1 and xzfyInfo.caseorg = '"+locbm+"'";
		if(xzfyInfo!=null){
		if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
			HQL+=" and xzfyInfo.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
		if(xzfyInfo.getUser1_name()!=null && !xzfyInfo.getUser1_name().equals(""))
			HQL+=" and xzfyInfo.user1_name like '%"+xzfyInfo.getUser1_name()+"%'";
		if(xzfyInfo.getUser2_name()!=null && !xzfyInfo.getUser2_name().equals(""))
			HQL+=" and xzfyInfo.user2_name like '%"+xzfyInfo.getUser2_name()+"%'";
		if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
			HQL+=" and xzfyInfo.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
		if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
			HQL+=" and xzfyInfo.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
			HQL+=" and xzfyInfo.receive_date = '"+xzfyInfo.getReceive_date()+"'";

		}
		HQL +=" order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		System.out.println(HQL);
		return super.find(HQL, pageNumber, pageSize);
	}
	@Override
	public PaginationSupport getBananListByPage1(int pageNumber, int pageSize,XzfyInfo xzfyInfo,String locbm) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status>0 and xzfyInfo.status<13 and xzfyInfo.caseorg = '"+locbm+"'";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				HQL+=" and xzfyInfo.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getUser1_name()!=null && !xzfyInfo.getUser1_name().equals(""))
				HQL+=" and xzfyInfo.user1_name like '%"+xzfyInfo.getUser1_name()+"%'";
			if(xzfyInfo.getUser2_name()!=null && !xzfyInfo.getUser2_name().equals(""))
				HQL+=" and xzfyInfo.user2_name like '%"+xzfyInfo.getUser2_name()+"%'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				HQL+=" and xzfyInfo.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				HQL+=" and xzfyInfo.app_show like '%"+xzfyInfo.getApp_show()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				HQL+=" and xzfyInfo.receive_date = '"+xzfyInfo.getReceive_date()+"'";

			}
			HQL +=" order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
			System.out.println(HQL);
		return super.find(HQL, pageNumber, pageSize);
	}
	@Override
	public XzfyInfo getXzfyById(String entityId) {
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.id = '" + entityId+"'";
		List<XzfyInfo> dataList = super.find(HQL);
		XzfyInfo xzfyInfo = new XzfyInfo();
		if (dataList.isEmpty()) {
			xzfyInfo = new XzfyInfo();
		} else {
			xzfyInfo = dataList.get(0);
		}
		return xzfyInfo;
	}
	@Override
	public List getBananList(String locbm) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status>3 and xzfyInfo.status<12 and xzfyInfo.stadardResult=1 and xzfyInfo.caseorg = '"+locbm+"'  order by xzfyInfo.id desc";
		return super.find(HQL);
	}
	@Override
	public List getBananList1(String locbm) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status>0 and xzfyInfo.status<12 and xzfyInfo.caseorg = '"+locbm+"'  order by xzfyInfo.id desc";
		return super.find(HQL);
	}
	public PaginationSupport getYiBanJieDaiList(int pageNumber, int pageSize,Meet meet,User user){
		String orqSql="from Org org where org.id="+user.getOrg().getId();
		List orgList=super.find(orqSql);
		Org org=(Org)orgList.get(0);
		
		String HQL = "";
		HQL += " from Meet meet";
		HQL += " where 1 = 1";
		HQL += "and meet.Meet_type='一般接待'";
		
		if(meet!=null){
			if(meet.getClient_content()!=null && !meet.getClient_content().equals(""))
				HQL+=" and meet.Client_content like '%"+meet.getClient_content()+"%'";
			if(meet.getCaseOrg()!=null && !meet.getCaseOrg_name().equals(""))
				HQL+=" and meet.caseOrg_name like '%"+meet.getCaseOrg_name()+"%'";
			if(meet.getFace_date()!=null && !meet.getFace_date().equals(""))
				HQL+=" and meet.Face_date = '"+meet.getFace_date()+"'";
		}

		return super.find(HQL, pageNumber, pageSize);	
		
	}
	public PaginationSupport getYueJuanList(int pageNumber, int pageSize,Meet meet,User user){
		String orqSql="from Org org where org.id="+user.getOrg().getId();
		List orgList=super.find(orqSql);
		Org org=(Org)orgList.get(0);
		
		String HQL = "";
		HQL += " from Meet meet";
		HQL += " where 1 = 1";
		HQL += "and meet.Meet_type='阅卷'";
		
		if(meet!=null){
			if(meet.getClient_content()!=null && !meet.getClient_content().equals(""))
				HQL+=" and meet.Client_content like '%"+meet.getClient_content()+"%'";
			if(meet.getCaseOrg()!=null && !meet.getCaseOrg_name().equals(""))
				HQL+=" and meet.caseOrg_name like '%"+meet.getCaseOrg_name()+"%'";
			if(meet.getFace_date()!=null && !meet.getFace_date().equals(""))
				HQL+=" and meet.Face_date = '"+meet.getFace_date()+"'";
		}

		return super.find(HQL, pageNumber, pageSize);	
		
	}
	public PaginationSupport getSongDaList(int pageNumber, int pageSize,Meet meet,User user){
		String orqSql="from Org org where org.id="+user.getOrg().getId();
		List orgList=super.find(orqSql);
		Org org=(Org)orgList.get(0);
		
		String HQL = "";
		HQL += " from Meet meet";
		HQL += " where 1 = 1";
		HQL += "and meet.Meet_type='送达'";
		
		if(meet!=null){
			if(meet.getClient_content()!=null && !meet.getClient_content().equals(""))
				HQL+=" and meet.Client_content like '%"+meet.getClient_content()+"%'";
			if(meet.getCaseOrg()!=null && !meet.getCaseOrg_name().equals(""))
				HQL+=" and meet.caseOrg_name like '%"+meet.getCaseOrg_name()+"%'";
			if(meet.getFace_date()!=null && !meet.getFace_date().equals(""))
				HQL+=" and meet.Face_date = '"+meet.getFace_date()+"'";
		}

		return super.find(HQL, pageNumber, pageSize);	
		
	}
	public PaginationSupport getZhuanJiaoCaiLiaoList(int pageNumber, int pageSize,Meet meet,User user){
		String orqSql="from Org org where org.id="+user.getOrg().getId();
		List orgList=super.find(orqSql);
		Org org=(Org)orgList.get(0);
		
		String HQL = "";
		HQL += " from Meet meet";
		HQL += " where 1 = 1";
		HQL += "and meet.Meet_type='转交材料'";
		
		if(meet!=null){
			if(meet.getClient_content()!=null && !meet.getClient_content().equals(""))
				HQL+=" and meet.Client_content like '%"+meet.getClient_content()+"%'";
			if(meet.getCaseOrg()!=null && !meet.getCaseOrg_name().equals(""))
				HQL+=" and meet.caseOrg_name like '%"+meet.getCaseOrg_name()+"%'";
			if(meet.getFace_date()!=null && !meet.getFace_date().equals(""))
				HQL+=" and meet.Face_date = '"+meet.getFace_date()+"'";
		}

		return super.find(HQL, pageNumber, pageSize);	
		
	}
	public ArrayList<ArrayList<String>> getWeekLists(String startDate, String endDate) {
		Connection connection = JdbcUtil.getConnByHibernateConfig();

		String weekListsSql = "select t.lxt_mydate_mytime_year,t.lxt_mydate_mytime_month,t.lxt_mydate_mytime_weeks,t.lxt_mydate_mytime_startdate,t.lxt_mydate_mytime_enddate from lxt_mydate_mytime t where 1=1";

		if (null != startDate && !"".equals(startDate)) {
			weekListsSql = weekListsSql + "and t.lxt_mydate_mytime_startdate>='" + startDate + "'";
		}
		if (null != endDate && !"".equals(endDate)) {
			weekListsSql = weekListsSql + " and t.lxt_mydate_mytime_enddate<='" + endDate + "'";
		}
		weekListsSql = weekListsSql + " order by t.lxt_mydate_mytime_year,t.lxt_mydate_mytime_month,t.lxt_mydate_mytime_weeks";

		ArrayList<ArrayList<String>> weekLists = JdbcUtil.getListBySql(connection, weekListsSql);

		return weekLists;
	}
	
	public ArrayList<ArrayList<String>> getJieAnTongJiByWeekLists(ArrayList<ArrayList<String>> weekLists, String locbm) throws SQLException{
		ArrayList<ArrayList<String>> arrayLists = new ArrayList<ArrayList<String>>();
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement = connection.createStatement();
		ResultSet resultSet = null;
		try {
			String dataListsSql = "";
			for (int i = 0; i < weekLists.size(); i++) {
				ArrayList<String> arrayList = new ArrayList<String>();
				arrayList.add(weekLists.get(i).get(0));
				arrayList.add(weekLists.get(i).get(1));
				arrayList.add(weekLists.get(i).get(2));
				for (int j = 0; j < 18; j++) {
					arrayList.add("0");
				}
				dataListsSql = "";
				
				dataListsSql = "select sum(case when t.stadardresult=1 and t.status<=12 and t.status>0 then 1 else 0 end) as zongshu," +
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
				" from xzfy_info t ";
				
				
				//selectStatement = connection.createStatement();
				resultSet = selectStatement.executeQuery(dataListsSql);
				
				while (resultSet.next()){
					arrayList.set(3, resultSet.getString(1));
					arrayList.set(4, resultSet.getString(2));
					arrayList.set(5, resultSet.getString(3));
					arrayList.set(6, resultSet.getString(4));
					arrayList.set(7, resultSet.getString(5));
					arrayList.set(8, resultSet.getString(6));
					arrayList.set(9, resultSet.getString(7));
					arrayList.set(10, resultSet.getString(8));
					arrayList.set(11, resultSet.getString(9));
					arrayList.set(12, resultSet.getString(10));
					arrayList.set(13, resultSet.getString(11));
					arrayList.set(14, resultSet.getString(12));
					arrayList.set(15, resultSet.getString(13));
					arrayList.set(16, resultSet.getString(14));
					arrayList.set(17, resultSet.getString(15));
					arrayList.set(18, resultSet.getString(16));
					arrayList.set(19, resultSet.getString(17));
					arrayList.set(20, resultSet.getString(18));
				}
				arrayLists.add(arrayList);
			}

		} catch (SQLException e) {
			e.printStackTrace();
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
		return arrayLists;
	}
	public ArrayList<String> getJieAnTongJiTotalList(String startDate, String endDate, String locbm, ArrayList<ArrayList<String>> weekLists, Number searchpeid) throws SQLException{
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement2 = connection.createStatement();
		ResultSet resultSet = null;
		ArrayList<String> arrayList = new ArrayList<String>();
		try {
			String dataListsSql = "";		
				for (int j = 0; j < 18; j++) {
					arrayList.add("0");
				}
				dataListsSql = "";
				int m = weekLists.size();
				startDate = weekLists.get(0).get(3); 
				endDate = weekLists.get(m-1).get(4); 
				dataListsSql = "select sum(case when t.stadardresult=1 and t.status<=12 and t.status>0 then 1 else 0 end) as zongshu," +
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
				" from xzfy_info t ";
				
				//selectStatement2 = connection.createStatement();
				resultSet = selectStatement2.executeQuery(dataListsSql);
				
				while (resultSet.next()){
					arrayList.set(0, resultSet.getString(1));
					arrayList.set(1, resultSet.getString(2));
					arrayList.set(2, resultSet.getString(3));
					arrayList.set(3, resultSet.getString(4));
					arrayList.set(4, resultSet.getString(5));
					arrayList.set(5, resultSet.getString(6));
					arrayList.set(6, resultSet.getString(7));
					arrayList.set(7, resultSet.getString(8));
					arrayList.set(8, resultSet.getString(9));
					arrayList.set(9, resultSet.getString(10));
					arrayList.set(10, resultSet.getString(11));
					arrayList.set(11, resultSet.getString(12));
					arrayList.set(12, resultSet.getString(13));
					arrayList.set(13, resultSet.getString(14));
					arrayList.set(14, resultSet.getString(15));
					arrayList.set(15, resultSet.getString(16));
					arrayList.set(16, resultSet.getString(17));
				}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if (selectStatement2 != null) {

					selectStatement2.close();
					selectStatement2 = null;
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
		return arrayList;
	}
	public ArrayList<ArrayList<String>> getTongjiForm18(String startDate, String endDate,String locbm, String sljg) throws Exception{
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
				" from xzfy_info t where 1=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"'";
		if(locbm.equals("全部")){}else{
		if(locbm!=null&&!locbm.equals("")){
			HQL+=" and t.caseorg = '"+locbm+"'";
		}}
		if(sljg!=null&&!sljg.equals("")){
			HQL+=" and t.defendant_name = '"+sljg+"'";
		}
		System.out.println(HQL);
		ArrayList<String> arrayList = new ArrayList<String>();
 	
					arrayList.add("1");  
					arrayList.add("2"); 
					arrayList.add("3"); 	
					arrayList.add("4"); 
					arrayList.add("5"); 
					arrayList.add("6"); 
					arrayList.add("7"); 
					arrayList.add("8");   
					arrayList.add("9");

		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement = connection.createStatement();
		ResultSet resultSet = null;
			try {
				for(int j=0;j<arrayList.size();j++){
					ArrayList<String> tmp1 = new ArrayList<String>();for(int m=0;m<18;m++){tmp1.add("0");}
					String HQL1 = HQL;
					HQL1+=" and t.casetype ='"+arrayList.get(j)+"'";
					resultSet = selectStatement.executeQuery(HQL1);

					while(resultSet.next()){
						for(int x=1;x<18;x++)
						tmp1.set(x-1, resultSet.getString(x));
					}

					list.add(tmp1);
				}
				ArrayList<String> heji1 = new ArrayList<String>();for(int j=0;j<18;j++){heji1.add("0");}
				String HQL3 = " and (";
				for(int i=0;i<arrayList.size();i++){
					if(i==0){
						HQL3+="t.casetype = '"+arrayList.get(i)+"'";
					}else{
						HQL3+=" or t.casetype = '"+arrayList.get(i)+"'";
					}	
				}
				HQL3+=")";
				resultSet = selectStatement.executeQuery(HQL+HQL3);
				while(resultSet.next()){
					for(int x=1;x<18;x++)
						heji1.set(x-1, resultSet.getString(x));
				}
				list.add(heji1);
				}
				
				finally {
	
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
	public ArrayList<ArrayList<String>> getTongjiForm18_2(List<String> list1,String startDate, String endDate,String locbm, String sljg) throws Exception{

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
				" from xzfy_info t join xzfy_keyword p on t.id=p.xzfy_id where ";


		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement = connection.createStatement();
		ResultSet resultSet = null;
		if(list1.size()>0){
			try {
				for(int j=0;j<list1.size();j++){
					ArrayList<String> tmp1 = new ArrayList<String>();for(int m=0;m<18;m++){tmp1.add("0");}
					String HQL1 = HQL;
					HQL1+=" p.locbm='"+locbm+"' and p.keyword ='"+list1.get(j)+"'";
					resultSet = selectStatement.executeQuery(HQL1);

					while(resultSet.next()){
						for(int x=1;x<18;x++)
						tmp1.set(x-1, resultSet.getString(x));
					}

					list.add(tmp1);
				}
				ArrayList<String> heji1 = new ArrayList<String>();for(int j=0;j<18;j++){heji1.add("0");}
				String HQL3 = "(";
				for(int i=0;i<list1.size();i++){
					if(i==0){
						HQL3+="p.keyword = '"+list1.get(i)+"'";
					}else{
						HQL3+=" or p.keyword = '"+list1.get(i)+"'";
					}	
				}
				HQL3+=") and p.locbm='"+locbm+"'";
				HQL3+=" and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"'";
				String HQL4=HQL+HQL3;

				if(locbm!=null&&!locbm.equals("")){
					HQL4+=" and t.caseorg = '"+locbm+"'";
				};	
				if(sljg!=null&&!sljg.equals("")){
					HQL4+=" and t.defendant_name='"+sljg+"'";
				};	
				System.out.println(HQL4);
				resultSet = selectStatement.executeQuery(HQL+HQL3);
				while(resultSet.next()){
					for(int x=1;x<18;x++)
						heji1.set(x-1, resultSet.getString(x));
				}
				list.add(heji1);

				}
				
				finally {
	
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
		}
		return list;
	}	
	public List<XzfyKeyword> getXzfyKeywordListByLocbm(String locbm) {
		String HQL="";
		HQL += " from XzfyKeyword xzfyKeyword ";
		HQL += " where xzfyKeyword.status = '0' and xzfyKeyword.locbm = '"+locbm+"' ";
		HQL+=" order by xzfyKeyword.id";
		List<XzfyKeyword> dataList = super.find(HQL);
		return dataList;
	}
}
