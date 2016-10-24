package com.taiji.fzb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.taiji.common.ContextUtil;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
//import com.taiji.fzb.domain.XzcjApp;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyDftz;
import com.taiji.fzb.domain.XzfyShenpi;
import com.taiji.fzb.domain.XzfyXcdc;
import com.taiji.fzb.service.BananService;
import com.util.HibernateSessionFactory;


@SuppressWarnings("unchecked")
public class BananServiceImpl extends CoreServiceImpl implements BananService {



	@Override
	public PaginationSupport getBananListByPage(int pageNumber, int pageSize) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL+=" and xzfyInfo.status > 3 ";
		return super.find(HQL, pageNumber, pageSize);
	}
	
	public List getXcdcListById(String entityId) {
		String HQL = "";
		HQL += " from XzfyXcdc xzfyXcdc";
		HQL += " where 1 = 1";
		HQL+=" and xzfyXcdc.xzfyInfo.id = '"+entityId+"'";
		List<XzfyXcdc> dataList = super.find(HQL);
		return dataList;
	}
	
	public List getShenpiListById(String entityId) {
		String HQL = "";
		HQL += " from XzfyShenpi xzfyShenpi";
		HQL += " where 1 = 1";
		HQL+=" and xzfyShenpi.xzfyInfo.id = '"+entityId+"'";
		HQL+=" and xzfyShenpi.check_result in(1,2)";
		HQL+=" and xzfyShenpi.check_type in(5,6)";
		List<XzfyShenpi> dataList = super.find(HQL);
		return dataList;
	}
	public List getShenpiListById1(String entityId) {
		String HQL = "";
		HQL += " from XzfyShenpi xzfyShenpi";
		HQL += " where 1 = 1";
		HQL+=" and xzfyShenpi.xzfyInfo.id = '"+entityId+"'";
		HQL+=" and xzfyShenpi.check_result in(1,2)";
		HQL+= " and xzfyShenpi.check_type in(7,8)";
		List<XzfyShenpi> dataList = super.find(HQL);
		return dataList;
	}
	public List getShenpiListById2(String entityId) {
		String HQL = "";
		HQL += " from XzfyShenpi xzfyShenpi";
		HQL += " where 1 = 1";
		HQL+=" and xzfyShenpi.xzfyInfo.id = '"+entityId+"'";
		HQL+=" and xzfyShenpi.check_result in(1,2)";
		HQL+=" and xzfyShenpi.check_type in(9,10)";

		List<XzfyShenpi> dataList = super.find(HQL);
		return dataList;
	}
	public List getShenpiListById3(String entityId) {
		String HQL = "";
		HQL += " from XzfyShenpi xzfyShenpi";
		HQL += " where 1 = 1";
		HQL+=" and xzfyShenpi.xzfyInfo.id = '"+entityId+"'";
		HQL+=" and xzfyShenpi.check_result in(1,2)";
		HQL+=" and xzfyShenpi.check_type in(11,12)";

		List<XzfyShenpi> dataList = super.find(HQL);
		return dataList;
	}
	

	public List getDftzListById(String entityId) {
		String HQL = "";
		HQL += " from XzfyDftz xzfyDftz";
		HQL += " where 1 = 1";
		HQL+=" and xzfyDftz.xzfyInfo.id = '"+entityId+"' order by xzfyDftz.id";
		List<XzfyDftz> dataList = super.find(HQL);
		return dataList;
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
	public void savebanan(XzfyInfo xzfyInfo) {
		super.saveOrUpdate(xzfyInfo);
	}
	
	public void saveshenpi(XzfyShenpi xzfyShenpi) {
		super.saveOrUpdate(xzfyShenpi);
	}

	@Override
	public PaginationSupport getDftzListByPage(int pageNumber, int pageSize,
			String id) {
		String HQL = "";
		HQL += " from  XzfyDftz xzfyDftz";
		HQL += " where 1 = 1";	
		HQL+=" and xzfyDftz.xzfyInfo.id = '" + id+"'";
		return super.find(HQL, pageNumber, pageSize);
	}

	@Override
	public List getBananList() {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL+=" and xzfyInfo.status > 3 ";
		return super.find(HQL);
	}

	@Override
	public XzfyDftz getDftzById(int id) {
		String HQL="";
		HQL+=" from XzfyDftz t where t.id = "+id;
		List<XzfyDftz> list = super.find(HQL);
		XzfyDftz xzfyDftz = new XzfyDftz();
		if (list.isEmpty()) {
			xzfyDftz = new XzfyDftz();
		} else {
			xzfyDftz = list.get(0);
		}
		return xzfyDftz;
	}
	
	
	public List findBySQL(String hql) {
		Session session;
		Query query = null;
		session = null;
		List<XzfyInfo> list = new ArrayList<XzfyInfo>();
		try {
		session = HibernateSessionFactory.getSession();
		query = session.createSQLQuery(hql);
		list = query.list();
		} catch (Exception exception) {
		}
		if (session != null && session.isOpen()) {
		session.close();
		}
		return list;
		}
	
		/*select count(1) from xzfyInfo where stutus=3 and caseOrg=0000
		List list=findBySQL(sql)
		list.get(0).toString()*/

	@Override
	public PaginationSupport getWeibanjieListByPage(int pageNumber, int pageSize) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status < 12 ";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getWeibanjieList() {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status < 12 ";
		return super.find(HQL);
	}
	//shenliqixian_20
	public PaginationSupport getShenliqixian_20_ListByPage(int pageNumber, int pageSize, String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.stadardResult=1 and xzfyInfo.status>3 and xzfyInfo.status<12 and xzfyInfo.caseorg = "+locbm+"";
		//String qtime = floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'));
		HQL += " and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'))>40";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getShenliqixian_20_List(String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.stadardResult=1 and xzfyInfo.status>3 and xzfyInfo.status<12 and xzfyInfo.caseorg = "+locbm+"";
		//String qtime = floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'));
		HQL += " and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'))>40";
		return super.find(HQL);
	}
	
	public PaginationSupport getShenliqixian_10_ListByPage(int pageNumber, int pageSize, String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.stadardResult='1' and xzfyInfo.status>'3' and xzfyInfo.status<'12' and xzfyInfo.caseorg = '"+locbm+"'";
		HQL += " and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'))>'50'";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getShenliqixian_10_List(String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.stadardResult='1' and xzfyInfo.status>'3' and xzfyInfo.status<'12' and xzfyInfo.caseorg = '"+locbm+"'";
		HQL += " and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'))>'50'";
		return super.find(HQL);
	}
	
	public PaginationSupport getShenliqixian_chaoqi_ListByPage(int pageNumber, int pageSize, String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.stadardResult='1' and xzfyInfo.status>'3' and xzfyInfo.status<'12' and xzfyInfo.caseorg = '"+locbm+"'";
		HQL += " and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'))>'60'";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getShenliqixian_chaoqi_List(String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.stadardResult='1' and xzfyInfo.status>'3' and xzfyInfo.status<'12' and xzfyInfo.caseorg = '"+locbm+"'";
		HQL += " and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'))>'60'";
		return super.find(HQL);
	}
	
	public PaginationSupport getZhongzhiListByPage(int pageNumber, int pageSize, String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status='8' and xzfyInfo.caseorg = '"+locbm+"'";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getZhongzhiList(String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status='8' and xzfyInfo.caseorg = '"+locbm+"'";
		return super.find(HQL);
	}
	
	public PaginationSupport getNewdaifenpeiListByPage(int pageNumber, int pageSize, String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status='1' and xzfyInfo.user1_id=null and xzfyInfo.caseorg = '"+locbm+"'";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getNewdaifenpeiList(String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status='1' and xzfyInfo.user1_id=null and xzfyInfo.caseorg = '"+locbm+"'";
		return super.find(HQL);
	}
	
	public PaginationSupport getWeizhidingListByPage(int pageNumber, int pageSize, String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status='4' and xzfyInfo.user2_id=null and xzfyInfo.caseorg = '"+locbm+"'";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getWeizhidingList(String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status='4' and xzfyInfo.user2_id=null and xzfyInfo.caseorg = '"+locbm+"'";
		return super.find(HQL);
	}
	
	public PaginationSupport getDailianshenchaListByPage(int pageNumber, int pageSize, Number userid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status = 1 and xzfyInfo.user2_id= '"+userid+"'";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getDailianshenchaList(Number userid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status = 1 and xzfyInfo.user2_id= '"+userid+"'";
		return super.find(HQL);
	}
	
	public PaginationSupport getDaibanliListByPage(int pageNumber, int pageSize, Number userid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status = 4 and xzfyInfo.user2_id= '"+userid+"'";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getDaibanliList(Number userid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status = 4 and xzfyInfo.user2_id= '"+userid+"'";
		return super.find(HQL);
	}
	
	public PaginationSupport getDaishenpiListByPage(int pageNumber, int pageSize, Number userid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.check_status = '1' and xzfyInfo.user2_id= '"+userid+"'";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getDaishenpiList(Number userid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.check_status = '1' and xzfyInfo.user2_id= '"+userid+"'";
		return super.find(HQL);
	}
	
	public PaginationSupport getDailianshenpiListByPage(int pageNumber, int pageSize, Number userid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status = '3' and xzfyInfo.user2_id= '"+userid+"'";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getDailianshenpiList(Number userid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status = '3' and xzfyInfo.user2_id= '"+userid+"'";
		return super.find(HQL);
	}
	
	public PaginationSupport getWeibanjie_sub_ListByPage(int pageNumber, int pageSize, Number orgid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status < '12'";
		HQL+=" and (xzfyInfo.user1_id in (select user.id from User user where user.org.id = '"+orgid+"') or xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"'))";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getWeibanjie_sub_List(Number orgid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status < '12'";
		HQL+=" and (xzfyInfo.user1_id in (select user.id from User user where user.org.id = '"+orgid+"') or xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"'))";
		return super.find(HQL);
	}
	
	public PaginationSupport getShenliqixian_sub40_ListByPage(int pageNumber, int pageSize, Number orgid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status > '3' and xzfyInfo.status < '12' and xzfyInfo.stadardResult = '1' ";
		HQL += " and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'))>'40'";
		HQL+=" and (xzfyInfo.user1_id in (select user.id from User user where user.org.id = '"+orgid+"') or xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"'))";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getShenliqixian_sub40_List(Number orgid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status > '3' and xzfyInfo.status < '12' and xzfyInfo.stadardResult = '1' ";
		HQL += " and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'))>'40'";
		HQL+=" and (xzfyInfo.user1_id in (select user.id from User user where user.org.id = '"+orgid+"') or xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"'))";
		return super.find(HQL);
	}
	
	public PaginationSupport getShenliqixian_sub50_ListByPage(int pageNumber, int pageSize, Number orgid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status > '3' and xzfyInfo.status < '12' and xzfyInfo.stadardResult = '1' ";
		HQL += " and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'))>'50'";
		HQL+=" and (xzfyInfo.user1_id in (select user.id from User user where user.org.id = '"+orgid+"') or xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"'))";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getShenliqixian_sub50_List(Number orgid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status > '3' and xzfyInfo.status < '12' and xzfyInfo.stadardResult = '1' ";
		HQL += " and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'))>'50'";
		HQL+=" and (xzfyInfo.user1_id in (select user.id from User user where user.org.id = '"+orgid+"') or xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"'))";
		return super.find(HQL);
	}
	
	public PaginationSupport getShenliqixian_subchaoqi_ListByPage(int pageNumber, int pageSize, Number orgid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status > '3' and xzfyInfo.status < '12' and xzfyInfo.stadardResult = '1' ";
		HQL += " and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'))>'60'";
		HQL+=" and (xzfyInfo.user1_id in (select user.id from User user where user.org.id = '"+orgid+"') or xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"'))";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getShenliqixian_subchaoqi_List(Number orgid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status > '3' and xzfyInfo.status < '12' and xzfyInfo.stadardResult = '1' ";
		HQL += " and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'))>'60'";
		HQL+=" and (xzfyInfo.user1_id in (select user.id from User user where user.org.id = '"+orgid+"') or xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"'))";
		return super.find(HQL);
	}
	
	/*
	@Override
	public PaginationSupport getUndertakerList(int pageNumber, int pageSize,String tempundertaker) {
		String HQL = "";
		HQL += " from  XzssInfo xzssInfo";
		HQL += " where 1 = 1";
		HQL+="and xzssInfo.undertaker_name like '%"+tempundertaker+"%'";
		return super.find(HQL, pageNumber, pageSize);
	}
	
	//showJieanlist
	@Override
	public PaginationSupport getJieanList(int pageNumber, int pageSize,String tempuser ,String tempstatus) {
		String HQL = "";
		HQL += " from  XzcjInfo xzcjInfo";
		HQL += " where 1 = 1";
		HQL+="and xzcjInfo.undertaker_name like '%"+tempuser+"%'";
		HQL+="and xzcjInfo.status like '%"+tempstatus+"%'";
		//System.out.println(tempuser);
		
		
		return super.find(HQL, pageNumber, pageSize);
	}
	
	@Override
	public PaginationSupport getSearchList(int pageNumber, int pageSize, String receive_date, String undertaker_name, String fyundertaker_name, String app_type, String app_num, String jiguan_type, String jiguan, String agent, String request, String ismoney, String action_name, String action_id, String manage_type, String fuyijielun, String caijuejielun, String jieandate) {
		String HQL = "";
		HQL += " from  XzcjInfo xzcjInfo";
		HQL += " where 1 = 1";
		if(!receive_date.equals("")){
			HQL+="and xzcjInfo.receive_date like '%"+receive_date+"%'";
		}
		if(!undertaker_name.equals("")){
			HQL+="and xzcjInfo.undertaker_name like '%"+undertaker_name+"%'";
		}
		if(!fyundertaker_name.equals("")){
			HQL+="and xzcjInfo.fyundertaker_name like '%"+fyundertaker_name+"%'";
		}
		if(!app_type.equals("")){
			HQL+="and xzcjInfo.app_type like '%"+app_type+"%'";
		}
		if(!app_num.equals("")){
			HQL+="and xzcjInfo.app_num like '%"+app_num+"%'";
		}
		if(!jiguan_type.equals("")){
			HQL+="and xzcjInfo.jiguan_type like '%"+jiguan_type+"%'";
		}
		if(!jiguan.equals("")){
			HQL+="and xzcjInfo.jiguan like '%"+jiguan+"%'";
		}
		if(!agent.equals("")){
			HQL+="and xzcjInfo.agent like '%"+agent+"%'";
		}
		if(!request.equals("")){
			HQL+="and xzcjInfo.request like '%"+request+"%'";
		}
		if(!ismoney.equals("")){
			HQL+="and xzcjInfo.ismoney like '%"+ismoney+"%'";
		}
		if(!action_name.equals("")){
			HQL+="and xzcjInfo.action_name like '%"+action_name+"%'";
		}
		if(!action_id.equals("")){
			HQL+="and xzcjInfo.action_id like '%"+action_id+"%'";
		}
		if(!manage_type.equals("")){
			HQL+="and xzcjInfo.manage_type like '%"+manage_type+"%'";
		}
		if(!fuyijielun.equals("")){
			HQL+="and xzcjInfo.fuyijielun like '%"+fuyijielun+"%'";
		}
		if(!caijuejielun.equals("")){
			HQL+="and xzcjInfo.caijuejielun like '%"+caijuejielun+"%'";
		}
		if(!jieandate.equals("")){
			HQL+="and xzcjInfo.jieandate like '%"+jieandate+"%'";
		}
		

		
		return super.find(HQL, pageNumber, pageSize);
	}
	
	
	
	
	 * 通过ID获取模板对象
	 * 
	 * @param entityId 模板对象ID
	 * 
	 * @return 模板对象
	 

	
	public void deleteXzssById(double entityId){
		//double d = Double.parseDouble(entityId);
		String hql="delete from  XzssInfo xzssInfo where xzssInfo.id="+entityId;
		super.deleteAll(hql);
	}
	

	
	
	@Override
	public void saveXzcjApp(XzcjApp xzcjApp) {
		super.saveOrUpdate(xzcjApp);
	}
	

	public List getAppListById(String entityId,String protype) {
		String HQL = "";
		HQL += " from XzcjApp xzcjApp";
		HQL += " where 1 = 1";
		HQL+="and xzcjApp.xzcjInfo.id = '"+entityId+"'";
		//HQL += " and app.xzcjInfo.id = '" + entityId+"' and app.proxytype="+protype;
		List<XzcjApp> dataList = super.find(HQL);
		return dataList;
	}

	public XzcjApp getAppById(int entityId) {
		String HQL = "";
		HQL += " from XzcjApp app";
		HQL += " where 1 = 1";
		HQL += " and app.id = " + entityId;
		List<XzcjApp> dataList = super.find(HQL);
		XzcjApp app = new XzcjApp();
		if (dataList.isEmpty()) {
			app = new XzcjApp();
		} else {
			app = dataList.get(0);
		}
		return app;
	}*/

}
