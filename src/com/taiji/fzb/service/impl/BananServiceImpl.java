package com.taiji.fzb.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.taiji.common.ContextUtil;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
//import com.taiji.fzb.domain.XzcjApp;
import com.taiji.fzb.domain.*;
import com.taiji.fzb.service.BananService;
import com.taiji.meet.domin.Meet;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.util.HibernateSessionFactory;
import com.util.JdbcUtil;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import com.taiji.tongJi.action.tongJiService.IndexTjService;


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
		HQL += " and xzfyShenpi.xzfyInfo.id = '"+entityId+"'";
		HQL += " and xzfyShenpi.check_result in(1,2)";
		HQL += " and xzfyShenpi.check_type in(5,6)";
		HQL += " and (xzfyShenpi.sqspren_id is null or xzfyShenpi.sqspren_id < 1) order by xzfyShenpi.id asc";
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
		HQL += " and (xzfyShenpi.sqspren_id is null or xzfyShenpi.sqspren_id < 1) order by xzfyShenpi.id asc";
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
		HQL += " and (xzfyShenpi.sqspren_id is null or xzfyShenpi.sqspren_id < 1) order by xzfyShenpi.id asc";
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
		HQL += " and (xzfyShenpi.sqspren_id is null or xzfyShenpi.sqspren_id < 1) order by xzfyShenpi.id asc";
		List<XzfyShenpi> dataList = super.find(HQL);
		return dataList;
	}
	

	public List getDftzListById(String entityId) {
		String HQL = "";
		HQL += " from XzfyDftz xzfyDftz";
		HQL += " where 1 = 1";
		HQL+=" and xzfyDftz.xzfy_id = '"+entityId+"' order by xzfyDftz.id desc";
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
		HQL+=" and xzfyDftz.xzfy_id = '" + id+"'";
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
	public XzfyDftz getDftzById(String id) {
		String HQL="";
		HQL+=" from XzfyDftz t where t.xzfy_id = '"+id+"'";
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
	public PaginationSupport getWeibanjieListByPage(int pageNumber, int pageSize, String locbm) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status < 12 and xzfyInfo.status > 0  and xzfyInfo.caseorg = '"+locbm+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getWeibanjieList(String locbm) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status < 12 and xzfyInfo.status > 0  and xzfyInfo.caseorg = '"+locbm+"' ";
		return super.find(HQL);
	}
	//shenliqixian_20
	//String qtime = floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd'));
	public PaginationSupport getShenliqixian_20_ListByPage(int pageNumber, int pageSize, String locbm){
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.stadardResult=1 and xzfyInfo.status>3 and xzfyInfo.status<12 and xzfyInfo.caseorg = '"+locbm+"' ";
		HQL += " and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 40 and 50 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 40 and 50)";
		//HQL += " or xzfyInfo.stadardResult!=1 and xzfyInfo.status!=12 and xzfyInfo.caseorg = '"+locbm+"' ";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getShenliqixian_20_List(String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.stadardResult=1 and xzfyInfo.status>3 and xzfyInfo.status<12 and xzfyInfo.caseorg = '"+locbm+"' ";
		HQL += " and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 40 and 50 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 40 and 50)";
		//HQL += " or xzfyInfo.stadardResult!=1 and xzfyInfo.status!=12 and xzfyInfo.caseorg = '"+locbm+"' ";
		return super.find(HQL);
	}
	
	public PaginationSupport getShenliqixian_10_ListByPage(int pageNumber, int pageSize, String locbm){
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.stadardResult=1 and xzfyInfo.status>3 and xzfyInfo.status<12 and xzfyInfo.caseorg = '"+locbm+"' ";
		HQL += " and ((xzfyInfo.isdelay=0 or xzfyInfo.isdelay is null) and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 50 and 60 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 50 and 60)";
		HQL += " or xzfyInfo.isdelay=1 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 80 and 90 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 80 and 90))";
		//HQL += " or xzfyInfo.stadardResult!=1 and xzfyInfo.status!=12 and xzfyInfo.caseorg = '"+locbm+"' ";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getShenliqixian_10_List(String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.stadardResult=1 and xzfyInfo.status>3 and xzfyInfo.status<12 and xzfyInfo.caseorg = '"+locbm+"' ";
		HQL += " and ((xzfyInfo.isdelay=0 or xzfyInfo.isdelay is null) and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 50 and 60 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 50 and 60)";
		HQL += " or xzfyInfo.isdelay=1 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 80 and 90 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 80 and 90))";
		//HQL += " or xzfyInfo.stadardResult!=1 and xzfyInfo.status!=12 and xzfyInfo.caseorg = '"+locbm+"' ";
		return super.find(HQL);
	}
	
	public PaginationSupport getShenliqixian_chaoqi_ListByPage(int pageNumber, int pageSize, String locbm){
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status>3 and xzfyInfo.status<12  and xzfyInfo.stadardResult = 1 and xzfyInfo.caseorg = '"+locbm+"' ";
		HQL += " and ((xzfyInfo.isdelay=0 or xzfyInfo.isdelay is null) and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >60 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>60)";
		HQL += " or xzfyInfo.isdelay=1 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >90 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>90))";
		HQL += " or xzfyInfo.stadardResult!=1 and xzfyInfo.status!=12 and xzfyInfo.status>0 and xzfyInfo.caseorg = '"+locbm+"' and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >5 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>5) ";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getShenliqixian_chaoqi_List(String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status>3 and xzfyInfo.status<12  and xzfyInfo.stadardResult = 1 and xzfyInfo.caseorg = '"+locbm+"'";
		HQL += " and ((xzfyInfo.isdelay=0 or xzfyInfo.isdelay is null) and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >60 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>60)";
		HQL += " or xzfyInfo.isdelay=1 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >90 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>90))";
		HQL += " or xzfyInfo.stadardResult!=1 and xzfyInfo.status!=12 and xzfyInfo.status>0 and xzfyInfo.caseorg = '"+locbm+"' and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >5 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>5) ";
		return super.find(HQL);
	}
	
	public PaginationSupport getZhongzhiListByPage(int pageNumber, int pageSize, String locbm){
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and (xzfyInfo.status=8 or (xzfyInfo.status=4 and xzfyInfo.isstop=1) " +
				"or (xzfyInfo.breakTo is null and xzfyInfo.isstop=1)) and xzfyInfo.status<12 and xzfyInfo.caseorg = '"+locbm+"'";
		HQL += " and xzfyInfo.status>0 order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getZhongzhiList(String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and (xzfyInfo.status=8 or (xzfyInfo.status=4 and xzfyInfo.isstop=1 )" +
				" or (xzfyInfo.breakTo is null and xzfyInfo.isstop=1)) " +
				" and xzfyInfo.status<12 and xzfyInfo.caseorg = '"+locbm+"' and xzfyInfo.status>0";
		return super.find(HQL);
	}
	
	public PaginationSupport getNewdaifenpeiListByPage(int pageNumber, int pageSize, String locbm){
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail,xzfyInfo.shouju_flag ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status=1 and xzfyInfo.user1_id is null and xzfyInfo.caseorg = '"+locbm+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getNewdaifenpeiList(String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status=1 and xzfyInfo.user1_id is null and xzfyInfo.caseorg = '"+locbm+"'";
		return super.find(HQL);
	}
	
	public PaginationSupport getWeizhidingListByPage(int pageNumber, int pageSize, String locbm){
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status=4 and xzfyInfo.user2_id is null and xzfyInfo.caseorg = '"+locbm+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getWeizhidingList(String locbm){
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status=4 and xzfyInfo.user2_id is null and xzfyInfo.caseorg = '"+locbm+"'";
		return super.find(HQL);
	}
	
	/*
	 * 您目前有 0件案件待立案审查
status=1 or status =2 or status=3 or(status=11 and stadardresult>1) and check_status=0
应该是这个条件，改一下*/
	public PaginationSupport getDailianshenchaListByPage(int pageNumber, int pageSize, Number userid) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.status=1 or xzfyInfo.status =2 or xzfyInfo.status=3 or(xzfyInfo.status=11 and xzfyInfo.stadardResult>1)) ";
		//HQL += " and xzfyInfo.check_status= '0'";
		HQL += " and xzfyInfo.user1_id= '"+userid+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getDailianshenchaList(Number userid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.status=1 or xzfyInfo.status =2 or xzfyInfo.status=3 or(xzfyInfo.status=11 and xzfyInfo.stadardResult>1)) ";
		HQL += " and xzfyInfo.user1_id= '"+userid+"'";
		return super.find(HQL);
	}
	/*
	 *0件案件待办理
(status>3 and status<11) or (status=11 and stadardresult=1) */
	public PaginationSupport getDaibanliListByPage(int pageNumber, int pageSize, Number userid) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and ((xzfyInfo.status>3 and xzfyInfo.status<11) or (xzfyInfo.status=11 and xzfyInfo.stadardResult=1)) and xzfyInfo.user2_id= '"+userid+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		//System.out.println(HQL);
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getDaibanliList(Number userid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and ((xzfyInfo.status>3 and xzfyInfo.status<11) or (xzfyInfo.status=11 and xzfyInfo.stadardResult=1)) and xzfyInfo.user2_id= '"+userid+"'";
		return super.find(HQL);
	}
	/*
	 * 您目前有 0件案件待审批
(status in (5,7,9) or (status=11 and stadardresult=1)) and check_status=1 and check_id=userId*/
	public PaginationSupport getDaishenpiListByPage(int pageNumber, int pageSize, Number userid) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.status in ('5','7','9') or (xzfyInfo.status=11 and xzfyInfo.stadardResult=1)) and xzfyInfo.check_status=1 and xzfyInfo.check_id='"+userid+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getDaishenpiList(Number userid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.status in ('5','7','9') or (xzfyInfo.status=11 and xzfyInfo.stadardResult=1)) and xzfyInfo.check_status=1 and xzfyInfo.check_id='"+userid+"'";
		return super.find(HQL);
	}
	/*
	 * 有 0 件案件待立案审批
(status in (2,3) or (status=11 and stadardresult>1)) and check_status=1 and check_id=userId
 */
	public PaginationSupport getDailianshenpiListByPage(int pageNumber, int pageSize, Number userid) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.status in ('2','3') or (xzfyInfo.status=11 and xzfyInfo.stadardResult>1)) and xzfyInfo.check_status=1 and xzfyInfo.check_id= '"+userid+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getDailianshenpiList(Number userid) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.status in ('2','3') or (xzfyInfo.status=11 and xzfyInfo.stadardResult>1)) and xzfyInfo.check_status=1 and xzfyInfo.check_id= '"+userid+"'";
		return super.find(HQL);
	}
	
	public PaginationSupport getWeibanjie_sub_ListByPage(int pageNumber, int pageSize, Number orgid) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status > 3 and xzfyInfo.status < 12";
		//HQL+=" and xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')";
		HQL+="and xzfyInfo.app_type2 = '"+orgid+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getWeibanjie_sub_List(Number orgid) {
		String HQL = "";
		HQL += " select count(*)";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status > 3 and xzfyInfo.status < 12";
		//HQL+=" and xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')";
		HQL+="and xzfyInfo.app_type2 = '"+orgid+"'";
		return super.find(HQL);
	}
	
	public PaginationSupport getWeifenpei_sub_ListByPage(int pageNumber, int pageSize, Number orgid) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status = 4 and xzfyInfo.user2_id is null and app_type2 = '"+orgid+"' ";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getWeifenpei_sub_List(Number orgid) {
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status = 4 and xzfyInfo.user2_id is null and app_type2 = '"+orgid+"' ";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL);
	}
	
	public PaginationSupport getShenliqixian_sub40_ListByPage(int pageNumber, int pageSize, Number orgid) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status > 3 and xzfyInfo.status < 12 and xzfyInfo.stadardResult = 1 ";
		HQL += " and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 40 and 50 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 40 and 50)";
		//HQL+=" and xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')";
		HQL += "and xzfyInfo.app_type2 = '"+orgid+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getShenliqixian_sub40_List(Number orgid) {
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status > 3 and xzfyInfo.status < 12 and xzfyInfo.stadardResult = 1 ";
		HQL += " and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 40 and 50 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 40 and 50)";
		//HQL+=" and xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')";
		HQL += "and xzfyInfo.app_type2 = '"+orgid+"'";
		return super.find(HQL);
	}
	
	public PaginationSupport getShenliqixian_sub50_ListByPage(int pageNumber, int pageSize, Number orgid) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status > 3 and xzfyInfo.status < 12 and xzfyInfo.stadardResult = 1 ";
		HQL += " and ((xzfyInfo.isdelay=0 or xzfyInfo.isdelay is null) and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 50 and 60 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 50 and 60)";
		HQL += " or xzfyInfo.isdelay=1 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 80 and 90 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 80 and 90))";
		//HQL+=" and xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')";
		HQL += "and xzfyInfo.app_type2 = '"+orgid+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getShenliqixian_sub50_List(Number orgid) {
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status > 3 and xzfyInfo.status < 12 and xzfyInfo.stadardResult = 1 ";
		HQL += " and ((xzfyInfo.isdelay=0 or xzfyInfo.isdelay is null) and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 50 and 60 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 50 and 60)";
		HQL += " or xzfyInfo.isdelay=1 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 80 and 90 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 80 and 90))";
		//HQL+=" and xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')";
		HQL += "and xzfyInfo.app_type2 = '"+orgid+"'";
		return super.find(HQL);
	}
	
	public PaginationSupport getShenliqixian_subchaoqi_ListByPage(int pageNumber, int pageSize, Number orgid) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status > 3 and xzfyInfo.status < 12 and xzfyInfo.stadardResult = 1 ";
		HQL += " and ((xzfyInfo.isdelay=0 or xzfyInfo.isdelay is null) and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >60 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>60)";
		HQL += " or xzfyInfo.isdelay=1 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >90 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>90))";
		//HQL+=" and xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"') ";
		HQL += "and xzfyInfo.app_type2 = '"+orgid+"'";
		HQL += " or xzfyInfo.stadardResult!=1 and xzfyInfo.status!=12 and xzfyInfo.status>3 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >5 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>5) ";
		//HQL+=" and xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')";
		HQL += "and xzfyInfo.app_type2 = '"+orgid+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getShenliqixian_subchaoqi_List(Number orgid) {
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status > 3 and xzfyInfo.status < 12 and xzfyInfo.stadardResult = 1 ";
		HQL += " and ((xzfyInfo.isdelay=0 or xzfyInfo.isdelay is null) and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >60 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>60)";
		HQL += " or xzfyInfo.isdelay=1 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >90 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>90))";
		//HQL +=" and xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')";
		HQL += "and xzfyInfo.app_type2 = '"+orgid+"'";
		HQL += " or xzfyInfo.stadardResult!=1 and xzfyInfo.status!=12 and xzfyInfo.status>3 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >5 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>5) ";
		//HQL+=" and xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')";
		HQL += "and xzfyInfo.app_type2 = '"+orgid+"'";
		return super.find(HQL);
	}
	public PaginationSupport getsubZhongzhiListByPage(int pageNumber, int pageSize, Number orgid){
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and (xzfyInfo.status=8 or xzfyInfo.status=4 and xzfyInfo.isstop=1 or xzfyInfo.breakTo is null and xzfyInfo.isstop=1)";
		//HQL += " and xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')";
		HQL += "and xzfyInfo.app_type2 = '"+orgid+"'";
		HQL += " and xzfyInfo.status>3 order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getsubZhongzhiList(Number orgid){
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and (xzfyInfo.status=8 or xzfyInfo.status=4 and xzfyInfo.isstop=1 or xzfyInfo.breakTo is null and xzfyInfo.isstop=1)";
		//HQL += " and xzfyInfo.status>0 and xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')";
		HQL += " and xzfyInfo.status>3 and xzfyInfo.app_type2 = '"+orgid+"'";
		return super.find(HQL);
	}
	public PaginationSupport getsubDailianshenchaListByPage(int pageNumber, int pageSize, String locbm) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.status=1 or xzfyInfo.status =2 or xzfyInfo.status=3 or(xzfyInfo.status=11 and xzfyInfo.stadardResult>1)) ";
		HQL += " and xzfyInfo.caseorg = '"+locbm+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getsubDailianshenchaList(String locbm) {
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.status=1 or xzfyInfo.status =2 or xzfyInfo.status=3 or(xzfyInfo.status=11 and xzfyInfo.stadardResult>1)) ";
		HQL += " and xzfyInfo.caseorg = '"+locbm+"'";
		return super.find(HQL);
	}
	public PaginationSupport getsub35ListByPage(int pageNumber, int pageSize, String locbm) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.status=1 or xzfyInfo.status =2 or xzfyInfo.status=3 or(xzfyInfo.status=11 and xzfyInfo.stadardResult>1)) ";
		HQL += " and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 3 and 5 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 3 and 5) ";
		HQL += " and xzfyInfo.caseorg = '"+locbm+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getsub35List(String locbm) {
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.status=1 or xzfyInfo.status =2 or xzfyInfo.status=3 or(xzfyInfo.status=11 and xzfyInfo.stadardResult>1)) ";
		HQL += " and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 3 and 5 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 3 and 5) ";
		HQL += " and xzfyInfo.caseorg = '"+locbm+"'";
		return super.find(HQL);
	}
	public PaginationSupport getsub5ListByPage(int pageNumber, int pageSize, String locbm) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.status=1 or xzfyInfo.status =2 or xzfyInfo.status=3 or(xzfyInfo.status=11 and xzfyInfo.stadardResult>1)) ";
		HQL += " and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) > 5 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) > 5) ";
		HQL += " and xzfyInfo.caseorg = '"+locbm+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getsub5List(String locbm) {
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and (xzfyInfo.status=1 or xzfyInfo.status =2 or xzfyInfo.status=3 or(xzfyInfo.status=11 and xzfyInfo.stadardResult>1)) ";
		HQL += " and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) > 5 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) > 5) ";
		HQL += " and xzfyInfo.caseorg = '"+locbm+"'";
		return super.find(HQL);
	}
	public PaginationSupport getsubBuzhengListByPage(int pageNumber, int pageSize, String locbm) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status =2 ";
		HQL += " and xzfyInfo.caseorg = '"+locbm+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getsubBuzhengList(String locbm) {
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";		
		HQL += " and xzfyInfo.status =2 ";
		HQL += " and xzfyInfo.caseorg = '"+locbm+"'";
		return super.find(HQL);
	}
	public PaginationSupport getsbBuzhengListByPage(int pageNumber, int pageSize,  Number userid) {
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		HQL += " and xzfyInfo.status =2 ";
		HQL += " and xzfyInfo.user1_id= '"+userid+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getsbBuzhengList( Number userid) {
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";		
		HQL += " and xzfyInfo.status =2 ";
		HQL += " and xzfyInfo.user1_id= '"+userid+"'";
		return super.find(HQL);
	}
	public PaginationSupport getsbZhongzhiListByPage(int pageNumber, int pageSize, Number userid){
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and (xzfyInfo.status=8 or (xzfyInfo.status=4 and xzfyInfo.isstop=1) " +
				"or (xzfyInfo.breakTo is null and xzfyInfo.isstop=1)) and xzfyInfo.status<12 and (xzfyInfo.user2_id = '"+userid+"' or xzfyInfo.user3_id = '"+userid+"')";
		HQL += " and xzfyInfo.status>0 order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getsbZhongzhiList(Number userid){
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and (xzfyInfo.status=8 or (xzfyInfo.status=4 and xzfyInfo.isstop=1 )" +
				" or (xzfyInfo.breakTo is null and xzfyInfo.isstop=1)) " +
				" and xzfyInfo.status<12 and (xzfyInfo.user2_id = '"+userid+"' or xzfyInfo.user3_id = '"+userid+"') and xzfyInfo.status>0";
		return super.find(HQL);
	}
	public PaginationSupport getsbBanjieListByPage(int pageNumber, int pageSize, Number userid){
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status>=12 and xzfyInfo.user2_id = '"+userid+"'  ";//or xzfyInfo.user3_id = '"+userid+"')
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getsbBanjieList(Number userid){
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status>=12 and xzfyInfo.user2_id = '"+userid+"'  ";//or xzfyInfo.user3_id = '"+userid+"')
		return super.find(HQL);
	}
	public PaginationSupport getsbYishenchaListByPage(int pageNumber, int pageSize, Number userid){
		String HQL = "";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status>=4 and xzfyInfo.user1_id = '"+userid+"' ";// or xzfyInfo.user4_id = '"+userid+"')
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getsbYishenchaList(Number userid){
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.status>=4 and xzfyInfo.user1_id = '"+userid+"'  ";//or xzfyInfo.user4_id = '"+userid+"')
		return super.find(HQL);
	}
	public PaginationSupport getsbGuoqiListByPage(int pageNumber,int pageSize,Number userid){
		String HQL="";
		HQL+=" select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.appdetail,xzfyInfo.agentDetail ";
		HQL+=" from XzfyInfo xzfyInfo";
		HQL+=" where 1=1";
		HQL += " and xzfyInfo.status =6 ";
		HQL += " and xzfyInfo.user1_id= '"+userid+"'";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	public List getsbGuoqiList(Number userid){
		String HQL = "";
		HQL += " select count(xzfyInfo.id)";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";		
		HQL += " and xzfyInfo.status =6 ";
		HQL += " and xzfyInfo.user1_id= '"+userid+"'";
		return super.find(HQL);
	}
	

	@Override
	public void deleteWeiban(String locbm) {
		String HQL="";
		HQL+="delete from XzfyWeiban xzfyWeiban where xzfyWeiban.locbmdq = '"+locbm+"'";
		super.deleteAll(HQL);
	}
	
	public List<XzfyWeiban> getXzfyWeibanListByLocbm(String locbm){
		String HQL = "";
		HQL += " from  XzfyWeiban xzfyWeiban";
		HQL += " where 1 = 1";	
		HQL += " and xzfyWeiban.locbmdq = '"+locbm+"' ";
		HQL+=" order by xzfyWeiban.id";
		List<XzfyWeiban> dataList = super.find(HQL);
		return dataList;
	}
	
	@Override
	public List<XzfyKeyword> getXzfyKeywordListByLocbm(String locbm) {
		String HQL="";
		HQL += " from XzfyKeyword xzfyKeyword ";
		HQL += " where xzfyKeyword.status = '0' and xzfyKeyword.locbm = '"+locbm+"' ";
		HQL+=" order by xzfyKeyword.id";
		List<XzfyKeyword> dataList = super.find(HQL);
		return dataList;
	}

	@Override
	public void deleteKeyword(int id) {
		String HQL="";
		HQL += "delete from XzfyKeyword xzfyKeyword where xzfyKeyword.id = '"+id+"' ";
		super.deleteAll(HQL);
	}

	@Override
	public List<XzfyKeyword> getXzfyKeywordListByxzfyId(String xzfyid) {
		String HQL="";
		HQL += " from XzfyKeyword xzfyKeyword";
		HQL += " where 1 = 1";
		HQL += " and xzfyKeyword.xzfy_id = '"+xzfyid+"'";
		return super.find(HQL);
	}

	@Override
	public void deleteBananKeyword(String id) {
		String HQL="";
		HQL+="delete from XzfyKeyword xzfyKeyword where xzfyKeyword.xzfy_id = '"+id+"'";
		super.deleteAll(HQL);
	}

	@Override
	public List getUserListBytAppDeptId(String locbm) {
		/*String HQL = "";
		HQL += " from User user";
		HQL += " where 1 = 1";
		HQL+=" and user.locbm = '"+entityId+"' order by xzfyDftz.id desc";
		List<XzfyDftz> dataList = super.find(HQL);
		return dataList;*/
		
		/*List list=super.find("from Org org where org.id="+orgId);		
		Org org=new Org();
		org=(Org)list.get(0);*/
		String hql="from Org org where org.locbm='"+locbm+"' order by org.id desc";
		List<Org> orgList=super.find(hql);
		String whereSql="";
		for(int i=0;i<orgList.size();i++){
			Org orgTmp=(Org)orgList.get(i);
			if(i==0)
				whereSql=whereSql+"("+orgTmp.getId();
			else
				whereSql=whereSql+","+orgTmp.getId();
			if(i==orgList.size()-1)
				whereSql=whereSql+")";	
		}
		String getUserSql="from User u where 1=1 and  u.org.id in"+whereSql+" order by u.userSeq";
		List<User> userList=super.find(getUserSql);
		return userList;
	}

	@Override
	public PaginationSupport getSamexwListByPage(int pageNumber, int pageSize, String xwnum, String xwname, String id) {
		String HQL="";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.xwnum = '"+xwnum+"' and xzfyInfo.id != '"+id+"' and xzfyInfo.status>0";
		return super.find(HQL, pageNumber, pageSize);
	}
	
	@Override
	public PaginationSupport getSameKindxwListByPage(int pageNumber, int pageSize, String defendantname, String xwname, String id) {
		String HQL="";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.defendant_name like '%"+defendantname+"%' and xzfyInfo.xwname like  '%"+xwname+"%' and xzfyInfo.id != '"+id+"' and xzfyInfo.status>0 ";
		return super.find(HQL, pageNumber, pageSize);
	}
	
	
	//统计表10
	@Override
	public List getDengjiForm10List(String locbm, String startDate, String endDate, String finish_type) {
		String a="";
		if(finish_type.equals("1"))//全市案件
			a="1=1";
		else if(finish_type.equals("2"))//所有区县政府案件
			a="substr(xzfyInfo.caseorg,-2)='00' and substr(xzfyInfo.caseorg,1,2)>'00' and substr(xzfyInfo.caseorg,1,2)<'19'";
		else if(finish_type.equals("3"))//指定复议机关
			a="xzfyInfo.caseorg='"+locbm+"'";	
		else if(finish_type.equals("4"))//所有市政府部门案件
			a="substr(xzfyInfo.caseorg,-2)='00' and substr(xzfyInfo.caseorg,1,2)>'18'";
		String HQL = "";
		//HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name,xzfyInfo.receive_real_date,xzfyInfo.receive_type,xzfyInfo.content_abstract,xzfyInfo.refer,xzfyInfo.casetype,xzfyInfo.require_fy,xzfyInfo.user4_name,xzfyInfo.lian_date,xzfyInfo.finish_date,xzfyInfo.finish_type ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and " + a + "";
		HQL += " and xzfyInfo.receive_date <= '"+endDate+"'";
		HQL += " and xzfyInfo.receive_date >= '"+startDate+"' and xzfyInfo.status>0";
		HQL += " order by xzfyInfo.receive_date desc, xzfyInfo.id desc";
		List<XzfyShenpi> dataList = super.find(HQL);
		return dataList;
	}
	
	//统计表11
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
	
	public ArrayList<ArrayList<String>> getJieAnTongJiByWeekLists(ArrayList<ArrayList<String>> weekLists, String locbm, String finish_type) throws SQLException{
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
				for (int j = 0; j < 36; j++) {
					arrayList.add("0");
				}
				dataListsSql = "";
				
				dataListsSql = "select " +
							  "sum(case when t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as zongshuA, " +
							  "sum(case when t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as zongshuB, " +		  
							  "sum(case when (t.stadardresult!=1 or t.stadardresult is null) " +
							  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as weishouliA, " +
							  "sum(case when (t.stadardresult!=1 or t.stadardresult is null) " +
							  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as weishouliB, " +
							  "sum(case when t.status>3 and t.status<12 and t.isstop is null and t.stadardresult=1 " +
							  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as banliA, " +
							  "sum(case when t.status>3 and t.status<12 and t.isstop is null and t.stadardresult=1 " +
							  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as banliB, " +
			  				  "sum(case when t.status>3 and t.status<12 and t.isstop=1 and t.stadardresult=1 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as zhongzhiA, " +
			  				  "sum(case when t.status>3 and t.status<12 and t.isstop=1 and t.stadardresult=1 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as zhongzhiB, " +
			  				  "sum(case when t.finish_type=2 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as weichiA, " +
			  				  "sum(case when t.finish_type=2 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as weichiB, " +
			  				  "sum(case when t.finishbreaktype=5 and t.finish_type=1 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as yijinglvzeA, " +
			  				  "sum(case when t.finishbreaktype=5 and t.finish_type=1 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as yijinglvzeB, " +
			  				  "sum(case when t.finishbreaktype=6 and t.finish_type=1 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as buyingdangshouliA, " +
			  				  "sum(case when t.finishbreaktype=6 and t.finish_type=1 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as buyingdangshouliB, " +
			  				  "sum(case when t.finishbreaktype=7 and t.finish_type=1 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as bohuiqitaA, " +
			  				  "sum(case when t.finishbreaktype=7 and t.finish_type=1 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as bohuiqitaB, " +
			  				  "sum(case when t.finish_type=4 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as chexiaoA, " +
			  				  "sum(case when t.finish_type=4 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as chexiaoB, " +
			  				  "sum(case when t.finish_type=5 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as biangengA, " +
			  				  "sum(case when t.finish_type=5 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as biangengB, " +
			  				  "sum(case when t.finish_type=3 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as querenweifaA, " +
			  				  "sum(case when t.finish_type=3 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as querenweifaB, " +
			  				  "sum(case when t.finish_type=6 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as zelinglvzeA, " +
			  				  "sum(case when t.finish_type=6 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as zelinglvzeB, " +
			  				  "sum(case when t.finishbreaktype=1 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as hejiexieyiA, " +
			  				  "sum(case when t.finishbreaktype=1 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as hejiexieyiB, " +
			  				  "sum(case when t.finishbreaktype=2 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as ziyuanchehuiA, " +
			  				  "sum(case when t.finishbreaktype=2 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as ziyuanchehuiB, " +
			  				  "sum(case when t.finishbreaktype=3 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as gaibianchehuiA, " +
			  				  "sum(case when t.finishbreaktype=3 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as gaibianchehuiB, " +
			  				  "sum(case when t.finishbreaktype=4 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as zhongzhiqitaA, " +
			  				  "sum(case when t.finishbreaktype=4 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as zhongzhiqitaB, " +
			  				  "sum(case when t.finish_type=7 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as tiaojieA, " +
			  				  "sum(case when t.finish_type=7 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as tiaojieB, " +
			  				  "sum(case when t.finish_type=9 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+weekLists.get(i).get(3)+"' and t.receive_date<='"+weekLists.get(i).get(4)+"' then 1 else 0 end) as qitachuliA, " +
			  				  "sum(case when t.finish_type=9 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+weekLists.get(i).get(3)+"' and (t.finish_date>='"+weekLists.get(i).get(3)+"' or t.finish_date is null) then 1 else 0 end) as qitachuliB " +			
							  "from xzfy_info t " +
							  "where t.caseorg='"+locbm+"' and t.status>0";
				
				//System.out.println(dataListsSql);
				
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
					arrayList.set(21, resultSet.getString(19));
					arrayList.set(22, resultSet.getString(20));
					arrayList.set(23, resultSet.getString(21));
					arrayList.set(24, resultSet.getString(22));
					arrayList.set(25, resultSet.getString(23));
					arrayList.set(26, resultSet.getString(24));
					arrayList.set(27, resultSet.getString(25));
					arrayList.set(28, resultSet.getString(26));
					arrayList.set(29, resultSet.getString(27));
					arrayList.set(30, resultSet.getString(28));
					arrayList.set(31, resultSet.getString(29));
					arrayList.set(32, resultSet.getString(30));
					arrayList.set(33, resultSet.getString(31));
					arrayList.set(34, resultSet.getString(32));
					arrayList.set(35, resultSet.getString(33));
					arrayList.set(36, resultSet.getString(34));
					arrayList.set(37, resultSet.getString(35));
					arrayList.set(38, resultSet.getString(36));
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
	public ArrayList<String> getJieAnTongJiTotalList(String startDate, String endDate, String locbm, ArrayList<ArrayList<String>> weekLists, String finish_type) throws SQLException{
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement2 = connection.createStatement();
		ResultSet resultSet = null;
		ArrayList<String> arrayList = new ArrayList<String>();
		try {
			String dataListsSql = "";		
				for (int j = 0; j < 36; j++) {
					arrayList.add("0");
				}
				dataListsSql = "";
				int m = weekLists.size();
				startDate = weekLists.get(0).get(3); 
				endDate = weekLists.get(m-1).get(4);
				String a="";
				if(finish_type.equals("1"))//全市案件
					a="1=1";
				else if(finish_type.equals("2"))//所有区县政府案件
					a="substr(t.caseorg,-2)='00' and substr(t.caseorg,1,2)>'00' and substr(t.caseorg,1,2)<'19'";
				else if(finish_type.equals("3"))//指定复议机关
					a="t.caseorg='"+locbm+"'";	
				else if(finish_type.equals("4"))//所有市政府部门案件
					a="substr(t.caseorg,-2)='00' and substr(t.caseorg,1,2)>'18'";
				dataListsSql = "select " +
							  "sum(case when t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as zongshuA, " +
				  			  "sum(case when t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as zongshuB, " +
							  "sum(case when (t.stadardresult!=1 or t.stadardresult is null) " +
							  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as weishouliA, " +
							  "sum(case when (t.stadardresult!=1 or t.stadardresult is null) " +
							  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as weishouliB, " +
							  "sum(case when t.status<12 and (t.isstop is null or t.isstop=0) and t.stadardresult=1 " +
							  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as banliA, " +
							  "sum(case when t.status<12 and (t.isstop is null or t.isstop=0) and t.stadardresult=1 " +
							  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as banliB, " +
			  				  "sum(case when t.status>3 and t.status<12 and t.isstop=1 and t.stadardresult=1 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as zhongzhiA, " +
			  				  "sum(case when t.status>3 and t.status<12 and t.isstop=1 and t.stadardresult=1 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as zhongzhiB, " +
			  				  "sum(case when t.finish_type=2 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as weichiA, " +
			  				  "sum(case when t.finish_type=2 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as weichiB, " +
			  				  "sum(case when t.finishbreaktype=5 and t.finish_type=1 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as yijinglvzeA, " +
			  				  "sum(case when t.finishbreaktype=5 and t.finish_type=1 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as yijinglvzeB, " +
			  				  "sum(case when t.finishbreaktype=6 and t.finish_type=1 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as buyingdangshouliA, " +
			  				  "sum(case when t.finishbreaktype=6 and t.finish_type=1 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as buyingdangshouliB, " +
			  				  "sum(case when t.finishbreaktype=7 and t.finish_type=1 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as bohuiqitaA, " +
			  				  "sum(case when t.finishbreaktype=7 and t.finish_type=1 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as bohuiqitaB, " +
			  				  "sum(case when t.finish_type=4 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as chexiaoA, " +
			  				  "sum(case when t.finish_type=4 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as chexiaoB, " +
			  				  "sum(case when t.finish_type=5 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as biangengA, " +
			  				  "sum(case when t.finish_type=5 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as biangengB, " +
			  				  "sum(case when t.finish_type=3 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as querenweifaA, " +
			  				  "sum(case when t.finish_type=3 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as querenweifaB, " +
			  				  "sum(case when t.finish_type=6 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as zelinglvzeA, " +
			  				  "sum(case when t.finish_type=6 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as zelinglvzeB, " +
			  				  "sum(case when t.finishbreaktype=1 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as hejiexieyiA, " +
			  				  "sum(case when t.finishbreaktype=1 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as hejiexieyiB, " +
			  				  "sum(case when t.finishbreaktype=2 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as ziyuanchehuiA, " +
			  				  "sum(case when t.finishbreaktype=2 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as ziyuanchehuiB, " +
			  				  "sum(case when t.finishbreaktype=3 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as gaibianchehuiA, " +
			  				  "sum(case when t.finishbreaktype=3 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as gaibianchehuiB, " +
			  				  "sum(case when t.finishbreaktype=4 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as zhongzhiqitaA, " +
			  				  "sum(case when t.finishbreaktype=4 and t.finish_type=8 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as zhongzhiqitaB, " +
			  				  "sum(case when t.finish_type=7 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as tiaojieA, " +
			  				  "sum(case when t.finish_type=7 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as tiaojieB, " +
			  				  "sum(case when t.finish_type=9 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as qitachuliA, " +
			  				  "sum(case when t.finish_type=9 and t.stadardresult=1 and t.status>=12 " +
			  				  		"and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as qitachuliB " +			
							  "from xzfy_info t " +
							  "where " + a + " and t.status>0" ;
				
				//System.out.println(dataListsSql);
				
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
					arrayList.set(17, resultSet.getString(18));
					arrayList.set(18, resultSet.getString(19));
					arrayList.set(19, resultSet.getString(20));
					arrayList.set(20, resultSet.getString(21));
					arrayList.set(21, resultSet.getString(22));
					arrayList.set(22, resultSet.getString(23));
					arrayList.set(23, resultSet.getString(24));
					arrayList.set(24, resultSet.getString(25));
					arrayList.set(25, resultSet.getString(26));
					arrayList.set(26, resultSet.getString(27));
					arrayList.set(27, resultSet.getString(28));
					arrayList.set(28, resultSet.getString(29));
					arrayList.set(29, resultSet.getString(30));
					arrayList.set(30, resultSet.getString(31));
					arrayList.set(31, resultSet.getString(32));
					arrayList.set(32, resultSet.getString(33));
					arrayList.set(33, resultSet.getString(34));
					arrayList.set(34, resultSet.getString(35));
					arrayList.set(35, resultSet.getString(36));
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

	@Override
	public List<XzfyInfo> getAnjianTongJiList(String startDate, String endDate,String locbm) {
		String HQL = "";
		HQL += " select ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		for(int i=1;i<=44;i++){
			
		}
		List<XzfyInfo> dataList = super.find(HQL);
		return dataList;
	}

	@Override
	public List<XzfyInfo> getAnjianTongJiTotalList(String startDate,String endDate, String locbm) {
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";	
		
		List<XzfyInfo> dataList = super.find(HQL);
		return dataList;
	}

	public ArrayList<ArrayList<String>> getxzfyAnjianTongJiList(String startDate, String endDate, String locbm, String finish_type) throws SQLException {
		ArrayList<ArrayList<String>> arrayLists = new ArrayList<ArrayList<String>>();			
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Connection connection1 = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement = connection.createStatement();
		Statement selectStatement1 = connection1.createStatement();
		Statement selectStatement2 = connection1.createStatement();
		ResultSet resultSet = null;
		ResultSet resultSet1 = null;
		ResultSet resultSet2 = null;
		int num = 0;
		try {
			String dataListsSql = "";
			String dataListsSql1 = "";
			String dataListsSql2 = "";
		//	int ax [] ={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44};
			
			for (int i=1;i<=46;i++) {
				ArrayList<String> arrayList = new ArrayList<String>();
				switch(i){
					case 1:	 	
						arrayList.add("公安"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 2:		
						arrayList.add("国家安全"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 3:	
						arrayList.add("劳动和社会保障"); 
						arrayList.add(Integer.toString(i));
						break;
					case 4:		
						arrayList.add("司法行政"); 
						arrayList.add(Integer.toString(i));
						break;
					case 5:		
						arrayList.add("民政"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 6:		
						arrayList.add("土地"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 7:		
						arrayList.add("地矿"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 8:		
						arrayList.add("环保"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 9:	    
						arrayList.add("农业");
						arrayList.add(Integer.toString(i)); 
						break;
					case 10:	
						arrayList.add("水利");
						arrayList.add(Integer.toString(i)); 
						break;
					case 11:	
						arrayList.add("林业"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 12:	
						arrayList.add("城乡规划"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 13:	
						arrayList.add("房屋征补(拆迁)"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 14:	
						arrayList.add("不动产登记"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 15:	
						arrayList.add("工商");
						arrayList.add(Integer.toString(i)); 
						break;
						
					case 16:	//编号45
						arrayList.add("安监");
						arrayList.add(Integer.toString(i)); 
						break;
						
						
				/*	case 16:	
						arrayList.add("质监"); 质检 与商检合并  16,34， 46
						arrayList.add(Integer.toString(i)); 
						break;*/
					case 17:	
						arrayList.add("商务"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 18:	
						arrayList.add("物价");
						arrayList.add(Integer.toString(i)); 
						break;
					case 19:	
						arrayList.add("能源"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 20:	
						arrayList.add("交通运输"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 21:	
						arrayList.add("信息产业"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 22:	
						arrayList.add("邮政"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 23:	
						arrayList.add("烟草专卖"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 24:	
						arrayList.add("税务"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 25:	
						arrayList.add("人民银行"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 26:	
						arrayList.add("证监"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 27:	
						arrayList.add("保监"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 28:	
						arrayList.add("银监"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 29:	
						arrayList.add("外汇"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 30:	
						arrayList.add("财政"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 31:	
						arrayList.add("统计"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 32:	
						arrayList.add("审计"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 33:	
						arrayList.add("海关"); 
						arrayList.add(Integer.toString(i)); 
						break;
					case 34:	//质检 与商检合并  16,34， 46
						arrayList.add("质检");  //商检和质监合并为 质检
						arrayList.add(Integer.toString(i)); 
						break;
					case 35:	
						arrayList.add("食品安全");
						arrayList.add(Integer.toString(i)); 
						break;
					case 36:	//卫生和计划生育合并   36,37,47
						arrayList.add("卫生计生"); 
						arrayList.add(Integer.toString(i)); 
						break;
				/*	case 37:	
						arrayList.add("计划生育"); 
						arrayList.add(Integer.toString(i)); 
						break;
*/					case 37:	
						arrayList.add("教育"); //38
						arrayList.add(Integer.toString(i)); 
						break;
					case 38:	
						arrayList.add("文化"); //39
						arrayList.add(Integer.toString(i)); 
						break;
					case 39:	
						arrayList.add("专利"); //40
						arrayList.add(Integer.toString(i)); 
						break;
					case 40:	
						arrayList.add("商标"); //41
						arrayList.add(Integer.toString(i)); 
						break;
					case 41:	
						arrayList.add("版权");//42
						arrayList.add(Integer.toString(i)); 
						break;
					case 42:	
						arrayList.add("旅游"); //43
						arrayList.add(Integer.toString(i)); 
						break;
					case 43:	
						arrayList.add("新闻出版广电"); //48
						arrayList.add(Integer.toString(i)); 
						break;
					case 44:	
						arrayList.add("发展改革"); //49
						arrayList.add(Integer.toString(i)); 
						break;
					case 45:	
						arrayList.add("科技"); //50
						arrayList.add(Integer.toString(i)); 
						break;
						
						
					case 46:	
						arrayList.add("其他"); //44
						arrayList.add(Integer.toString(i)); 
						break;
				
		/*	case 45:	
				arrayList.add("其他"); 
				arrayList.add(Integer.toString(i)); 
				break;
		
		case 46:	
			arrayList.add("其他"); 
			arrayList.add(Integer.toString(i)); 
			break;
	
	case 47:	
		arrayList.add("其他"); 
		arrayList.add(Integer.toString(i)); 
		break;

case 48:	
	arrayList.add("其他"); 
	arrayList.add(Integer.toString(i)); 

case 49:	
	arrayList.add("其他"); 
	arrayList.add(Integer.toString(i)); 
	break;

case 50:	
	arrayList.add("其他"); 
	arrayList.add(Integer.toString(i)); 
	break;*/

}	
				for (int j = 1; j <= 46; j++) {
					arrayList.add("0");
				}
				dataListsSql = "";
				dataListsSql1 = "";
				dataListsSql2 = "";
				String a="";
				if(finish_type.equals("1"))//全市案件
					a="1=1";
				else if(finish_type.equals("2"))//所有区县政府案件
					a="substr(t.caseorg,-2)='00' and substr(t.caseorg,1,2)>'00' and substr(t.caseorg,1,2)<'19'";
				else if(finish_type.equals("3"))//指定复议机关
					a="t.caseorg='"+locbm+"'";	
				else if(finish_type.equals("4"))//所有市政府部门案件
					a="substr(t.caseorg,-2)='00' and substr(t.caseorg,1,2)>'18'";

				
/*dataListsSql = "select " +
"sum(case when t.receive_date<'"+startDate+"' and t.finish_date>='"+startDate+"' and t.stadardresult=1 and t.finish_date<='"+endDate+"' and t.status=12 then 1 else 0 end) as jiezhuan, " +
"sum(case when t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as benqixinshou, " +
"sum(case when t.stadardresult=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shouli, " +
"sum(case when t.stadardresult=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as sqrzongshu, " +  //申请人总数
//被申请人种类
"sum(case when t.defendant_type=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xiangzhen, " +
"sum(case when t.defendant_type=2 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xianjibumen, " +
"sum(case when t.defendant_type=3 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xianjizhengfu, " +          
"sum(case when t.defendant_type=4 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidibumen, " +
"sum(case when t.defendant_type=5 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidizhengfu, " +
"sum(case when t.defendant_type=7 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengji, " +
"sum(case when t.defendant_type=6 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengbuji, " +
"sum(case when t.defendant_type between 8 and 9 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as qita, " +
//，6级复议机关，没有没有两县级，默认值0
"sum(case when length(t.caseorg)=4 and substr(t.caseorg,3)<>'00' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidibumen1, " +
"sum(case when length(t.caseorg)=4 and substr(t.caseorg,3)='00' and substr(t.caseorg,1,2)<'19' and t.caseorg<>'0000' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidizhengfu1, " +
"sum(case when length(t.caseorg)=4 and substr(t.caseorg,3)='00' and substr(t.caseorg,1,2)>'18' and t.caseorg<>'0000' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengji1, " +
"sum(case when t.caseorg='0000' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengbuji1, " +

"sum(case when t.casetype=1 and t.casetype2=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as juliu, " +
"sum(case when t.casetype=1 and t.casetype2=2 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as moshou, " +
"sum(case when t.casetype=1 and t.casetype2=3 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as fakuan, " +
"sum(case when t.casetype=1 and (t.casetype2=4 or t.casetype2=0) and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as chufaqita, " +
"sum(case when t.casetype=2 and t.casetype2=5 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as duirenshen, " +
"sum(case when t.casetype=2 and t.casetype2 between 6 and 7 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as duicaichan, " +
"sum(case when t.casetype=3 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xzzhengshou, " +
"sum(case when t.casetype=4 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xzxuke, " +
"sum(case when t.casetype=5 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xzquequan, " +
"sum(case when t.casetype=6 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xzqueren, " +
"sum(case when t.casetype=7 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xinxigongkai, " +
"sum(case when t.casetype=8 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as buzuowei, " +
"sum(case when (t.casetype=9 or t.casetype is null or t.casetype=0) and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as sqfysxqita, " +
"sum(case when t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as yishenjiezongji, " +  
"sum(case when t.finish_type=1 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as bohui, " +
"sum(case when t.finish_type=2 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as weichi, " +
"sum(case when t.finish_type=3 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as querenweifa, " +
"sum(case when t.finish_type=4 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as chexiao, " +
"sum(case when t.finish_type=5 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as biangeng, " +
"sum(case when t.finish_type=6 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zelinglvxing, " +
"sum(case when t.finish_type=7 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as tiaojie, " +
"sum(case when t.finish_type=8 and t.finishBreakType=1 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zhongzhi1, " +
"sum(case when t.finish_type=8 and t.finishBreakType=2 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zhongzhi2, " +
"sum(case when t.finish_type=8 and t.finishBreakType=3 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zhongzhi3, " +
"sum(case when t.finish_type=8 and t.finishBreakType=4 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zhongzhi4, " +
"sum(case when t.finish_type=9 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as yishenjieqita, " +
"sum(case when t.stadardresult=1  and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' and (t.finish_date>'"+endDate+"' or t.finish_date is null or (t.finish_date<='"+endDate+"' and t.status<12)) and t.status>=1 then 1 else 0 end) as weishenjie, " +
"sum(case when t.nationMoney=1 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as jianshu " +
"from xzfy_info t " +
"where " + a + " and t.refer='"+i+"' and t.status>0 and t.caseorg is not null ";
*/

/*dataListsSql = "select " +
		"sum(case when t.stadardresult=1 and t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as jiezhuan, " +
		"sum(case when t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as benqixinshou, " +
		"sum(case when t.stadardresult=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shouli, " +
		"sum(case when t.stadardresult=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as sqrzongshu, " +  //申请人总数
		//被申请人种类
		"sum(case when t.defendant_type=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xiangzhen, " +
		"sum(case when t.defendant_type=2 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xianjibumen, " +
		"sum(case when t.defendant_type=3 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xianjizhengfu, " +          
		"sum(case when t.defendant_type=4 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidibumen, " +
		"sum(case when t.defendant_type=5 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidizhengfu, " +
		"sum(case when t.defendant_type=7 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengji, " +
		"sum(case when t.defendant_type=6 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengbuji, " +
		
		"sum(case when t.defendant_type=11 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as guowuybm, " +
		
		"sum(case when t.defendant_type between 8 and 9 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as qita, " +
		//，6级复议机关，没有没有两县级，默认值0
		"sum(case when length(t.caseorg)=4 and substr(t.caseorg,3)<>'00' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidibumen1, " +
		"sum(case when length(t.caseorg)=4 and substr(t.caseorg,3)='00' and substr(t.caseorg,1,2)<'19' and t.caseorg<>'0000' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidizhengfu1, " +
		"sum(case when length(t.caseorg)=4 and substr(t.caseorg,3)='00' and substr(t.caseorg,1,2)>'18' and t.caseorg<>'0000' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengji1, " +
		"sum(case when t.caseorg='0000' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengbuji1, " +
		//此处加入国务院部门默认为0
		"sum(case when t.casetype=1 and (t.casetype2=1 or t.casetype2=2 or  t.casetype2=3 or t.casetype2=4 ) and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xingzhengchufa, " +
		//"sum(case when t.casetype=1 and t.casetype2=2 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as moshou, " +
		//"sum(case when t.casetype=1 and t.casetype2=3 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as fakuan, " +
		//"sum(case when t.casetype=1 and (t.casetype2=4 or t.casetype2=0) and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as chufaqita, " +
	
		//"sum(case when t.casetype=2 and t.casetype2=5 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as duirenshen, " +
		"sum(case when t.casetype=2 and t.casetype2 between 5 and 7 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as duicaichan, " +

		"sum(case when t.casetype=3 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xzzhengshou, " +
		"sum(case when t.casetype=4 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xzxuke, " +
		"sum(case when t.casetype=5 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xzquequan, " +
		//"sum(case when t.casetype=6 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as ganyujyzzquan, " +
		"sum(case when t.casetype=10 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xingzhengqueren, " +
		"sum(case when t.casetype=7 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xinxigongkai, " +

		"sum(case when t.casetype=11 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as jubaotousu, " +

		"sum(case when t.casetype=8 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as buzuowei, " +
		"sum(case when (t.casetype=9 or  t.casetype=6 or t.casetype   is null or t.casetype=0) and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as sqfysxqita, " +
		"sum(case when t.stadardresult=1 and t.status>=12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as yishenjiezongji, " +  
		"sum(case when t.finish_type=1 and t.stadardresult=1 and t.status>=12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as bohui, " +
		"sum(case when t.finish_type=2 and t.stadardresult=1 and t.status>=12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as weichi, " +
		"sum(case when t.finish_type=3 and t.stadardresult=1 and t.status>=12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as querenweifa, " +
		"sum(case when t.finish_type=4 and t.stadardresult=1 and t.status>=12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as chexiao, " +
		"sum(case when t.finish_type=5 and t.stadardresult=1 and t.status>=12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as biangeng, " +
		"sum(case when t.finish_type=6 and t.stadardresult=1 and t.status>=12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as zelinglvxing, " +
		"sum(case when t.finish_type=7 and t.stadardresult=1 and t.status>=12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as tiaojie, " +
		"sum(case when t.finish_type=8 and t.finishBreakType=1 and t.stadardresult=1 and t.status>=12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as zhongzhi1, " +
		"sum(case when t.finish_type=8 and ( t.finishBreakType=2 or  t.finishBreakType=3 or  t.finishBreakType=5)and t.stadardresult=1 and t.status>=12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as zhongzhi2, " +
		//"sum(case when t.finish_type=8 and t.finishBreakType=3 and t.stadardresult=1 and t.status>=12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as zhongzhi3, " +
		"sum(case when t.finish_type=8 and t.finishBreakType=4 and t.stadardresult=1 and t.status>=12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as zhongzhi4, " +
		"sum(case when t.finish_type=9 and t.stadardresult=1 and t.status>=12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as yishenjieqita, " +
		"sum(case when t.stadardresult=1 and t.status<12 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as weishenjie, " +
		"sum(case when t.nationMoney=1 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as jianshu " +
		"from xzfy_info t " +
		"where " + a + " and t.refer='"+i+"' and t.status>0";

*/
				int ax2[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,45,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,38,39,40,41,42,43,48,49,50,44};
				String leibie="";
				if(i==34){
					leibie="(t.refer='16' or t.refer='34' or t.refer='46'  )";
					
				}else if(i==36){
					
					leibie="(t.refer='36' or t.refer='37' or t.refer='47'  )";
					
				}else if(i==46){
					
					leibie="(t.refer='44' or t.refer is null or t.refer='0' )";
					
				}
				
				else{
					leibie="t.refer='"+ax2[i]+"'";
				}
				
dataListsSql = "select " +
		"sum(case when t.receive_date<'"+startDate+"' and t.finish_date>='"+startDate+"' and t.stadardresult=1 and t.finish_date<='"+endDate+"' and t.status=12 then 1 else 0 end) as jiezhuan, " +
		"sum(case when t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as benqixinshou, " +
		"sum(case when t.stadardresult=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shouli, " +
		//"sum(case when t.stadardresult=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as sqrzongshu, " +  //申请人总数
		//被申请人种类
		"sum(case when t.stadardresult=1 and t.defendant_type=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xiangzhen, " +
		"sum(case when t.stadardresult=1 and t.defendant_type=2 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xianjibumen, " +
		"sum(case when t.stadardresult=1 and t.defendant_type=3 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xianjizhengfu, " +          
		"sum(case when t.stadardresult=1 and t.defendant_type=4 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidibumen, " +
		"sum(case when t.stadardresult=1 and t.defendant_type=5 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidizhengfu, " +
		"sum(case when t.stadardresult=1 and t.defendant_type=7 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengji, " +
		"sum(case when t.stadardresult=1 and t.defendant_type=6 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengbuji, " +
		
        "sum(case when t.stadardresult=1 and t.defendant_type=11 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as guowuyuanbumen, " +//gai--1

		
		"sum(case when t.stadardresult=1 and t.defendant_type between 8 and 9 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as qita, " +
		//，6级复议机关，没有没有两县级，默认值0
		"sum(case when t.stadardresult=1 and length(t.caseorg)=4 and substr(t.caseorg,3)<>'00' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidibumen1, " +
		"sum(case when t.stadardresult=1 and length(t.caseorg)=4 and substr(t.caseorg,3)='00' and substr(t.caseorg,1,2)<'19' and t.caseorg<>'0000' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidizhengfu1, " +
		"sum(case when t.stadardresult=1 and length(t.caseorg)=4 and substr(t.caseorg,3)='00' and substr(t.caseorg,1,2)>'18' and t.caseorg<>'0000' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengji1, " +
		"sum(case when t.stadardresult=1 and t.caseorg='0000' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengbuji1, " +

        "sum(case when t.stadardresult=1 and t.casetype=1 and (t.casetype2=1 or t.casetype2=2 or t.casetype2=3 or t.casetype2=4)and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as juliu, " +

		//"sum(case when t.casetype=1 and t.casetype2=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as juliu, " +
		//"sum(case when t.casetype=1 and t.casetype2=2 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as moshou, " +
		//"sum(case when t.casetype=1 and t.casetype2=3 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as fakuan, " +
		//"sum(case when t.casetype=1 and (t.casetype2=4 or t.casetype2=0) and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as chufaqita, " +
		
		//"sum(case when t.casetype=2 and t.casetype2=5 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as duirenshen, " +
		"sum(case when t.stadardresult=1 and t.casetype=2 and t.casetype2 between 5 and 7 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as duicaichan, " +
		"sum(case when t.stadardresult=1 and t.casetype=3 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xzzhengshou, " +
		"sum(case when t.stadardresult=1 and t.casetype=4 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xzxuke, " +
		"sum(case when t.stadardresult=1 and t.casetype=5 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xzquequan, " +
		//"sum(case when t.casetype=6 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as ganyujingyingzizhuquan, " +
		"sum(case when t.stadardresult=1 and t.casetype=10 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xingzhengqueren, " +
		
		
		"sum(case when t.stadardresult=1 and t.casetype=7 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xinxigongkai, " +
		
        "sum(case when t.stadardresult=1 and t.casetype=11 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as jubaotousu, " +

		
		"sum(case when t.stadardresult=1 and t.casetype=8 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as buzuowei, " +
		"sum(case when t.stadardresult=1 and (t.casetype=9 or t.casetype=6 or t.casetype is null or t.casetype=0) and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as sqfysxqita, " +
		"sum(case when t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as yishenjiezongji, " +  
		"sum(case when t.finish_type=1 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as bohui, " +
		"sum(case when t.finish_type=2 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as weichi, " +
		"sum(case when t.finish_type=3 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as querenweifa, " +
		"sum(case when t.finish_type=4 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as chexiao, " +
		"sum(case when t.finish_type=5 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as biangeng, " +
		"sum(case when t.finish_type=6 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zelinglvxing, " +
		"sum(case when t.finish_type=7 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as tiaojie, " +
		"sum(case when t.finish_type=8 and (t.finishBreakType=2 or t.finishBreakType=3 or t.finishBreakType=5)and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zhongzhi2, " +
		"sum(case when t.finish_type=8 and t.finishBreakType=1 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zhongzhi1, " +
		
		//"sum(case when t.finish_type=8 and t.finishBreakType=3 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zhongzhi3, " +
		
		"sum(case when t.finish_type=8 and t.finishBreakType=4 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zhongzhi4, " +
		"sum(case when t.finish_type=9 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as yishenjieqita, " +
		"sum(case when t.stadardresult=1  and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' and (t.finish_date>'"+endDate+"' or t.finish_date is null or (t.finish_date<='"+endDate+"' and t.status<12)) and t.status>=1 then 1 else 0 end) as weishenjie, " +
		"sum(case when t.nationMoney=1 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as jianshu " +
		"from xzfy_info t " +
		"where " + a + " and  "+leibie +"  and t.status>0 and t.caseorg is not null ";

dataListsSql1="select sum(t.nationMoneyDetail) from xzfy_info t " +
	"where " + a + " and t.status>0 and "+leibie +" and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' " +
	"or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null))  ";	



dataListsSql2="select sum(t.renCount) from xzfy_info t " +
	"where " + a + " and t.status>0 and "+leibie +"   " +
	"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"'  ";	
//System.out.println(dataListsSql1);
              //  System.out.println("11111");
				resultSet = selectStatement.executeQuery(dataListsSql);//大查询
			//	System.out.println("2222");
				resultSet1 = selectStatement1.executeQuery(dataListsSql1);
			//	System.out.println("3333");
				resultSet2 = selectStatement2.executeQuery(dataListsSql2);
			//	System.out.println("4444");
				
				
				ArrayList<String> numList = new ArrayList<String>();
				ArrayList<String> renList = new ArrayList<String>();
				numList.add("0");
				renList.add("0");
				while (resultSet1.next()) {
					Object[] objects = new Object[resultSet1.getMetaData().getColumnCount()];
					for (int j = 1; j < resultSet1.getMetaData().getColumnCount() + 1; j++) {
						objects[j - 1] = resultSet1.getObject(j);
						if (null == objects[j - 1]) {
							numList.set(0,"0");
						} else {
							numList.set(0,objects[j - 1].toString());
						}
					}
					break;
				}
				while (resultSet2.next()) {
					Object[] objects = new Object[resultSet2.getMetaData().getColumnCount()];
					for (int j = 1; j < resultSet2.getMetaData().getColumnCount() + 1; j++) {
						objects[j - 1] = resultSet2.getObject(j);
						if (null == objects[j - 1]) {
							renList.set(0,"0");
						} else {
							renList.set(0,objects[j - 1].toString());
						}
					}
					break;
				}
				while (resultSet.next()){
					//System.out.println("41---"+resultSet.getString(41));
					
					int m=1,n=13;
					for(int x=2;x<46;x++){
						if(x==5)
							arrayList.set(x, renList.get(0));
						else if(x==15 ||x==16 ||x==21){
							arrayList.set(x, "0");
							//System.out.println("aaaa--b"+m);
						}else
							{arrayList.set(x, resultSet.getString(m));
							System.out.println("a "+m+"--"+resultSet.getString(m));
							m++;
							}
							
						
						
					}
					//arrayList.set(46, numList.get(0));
					arrayList.set(46, numList.get(0));
					num++;									
				}
				
			/*	while (resultSet.next()){					
					int m=1,n=13;
					for(int x=2;x<14;x++){
						if(x==5)
							arrayList.set(x, renList.get(0));
						else
							arrayList.set(x, resultSet.getString(m));
						m++;
					}
					for(int x=16;x<48;x++){
						arrayList.set(x, resultSet.getString(n));
						n++;
					}
				}
				arrayList.set(48, "888");
				num++;
				*/
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
				if (selectStatement1 != null) {
					selectStatement1.close();
					selectStatement1 = null;
				}
				if (selectStatement2 != null) {
					selectStatement2.close();
					selectStatement2 = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
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
		return arrayLists;
}

	@Override
	public ArrayList<String> getxzfyAnjianTongJiTotalList(String startDate, String endDate, String locbm, String finish_type) throws SQLException {
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Connection connection1 = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement = connection.createStatement();
		Statement selectStatement1 = connection.createStatement();
		Statement selectStatement2 = connection.createStatement();
		ResultSet resultSet = null;
		ResultSet resultSet1 = null;
		ResultSet resultSet2 = null;
		ArrayList<String> arrayList = new ArrayList<String>();
		ArrayList<String> numList = new ArrayList<String>();
		ArrayList<String> renList = new ArrayList<String>();
		try {
			String dataListsSql = "";	
			String dataListsSql1 = "";
			String dataListsSql2 = "";
				arrayList.add("合计");
				arrayList.add("47");
				for (int j = 0; j < 45; j++) {
					arrayList.add("0");
				}
				String a="";
				
			//	int ax2[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,  45,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,38,39,40,41,42,43,48,49,50,44};
				String leibie="";
				
					//leibie="(t.refer>='1' and  t.refer<='50' )";
			//	leibie="(t.refer between 1 and 50 )";
				
				leibie="1=1";
				
				if(finish_type.equals("1"))//全市案件
					a="1=1";
				else if(finish_type.equals("2"))//所有区县政府案件
					a="substr(t.caseorg,-2)='00' and substr(t.caseorg,1,2)>'00' and substr(t.caseorg,1,2)<'19'";
				else if(finish_type.equals("3"))//指定复议机关
					a="t.caseorg='"+locbm+"'";	
				else if(finish_type.equals("4"))//所有市政府部门案件
					a="substr(t.caseorg,-2)='00' and substr(t.caseorg,1,2)>'18'";
				dataListsSql = "select " +
				"sum(case when t.receive_date<'"+startDate+"' and t.stadardresult=1 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') and t.status=12 then 1 else 0 end) as jiezhuan, " +
				"sum(case when t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as benqixinshou, " +
				"sum(case when t.stadardresult=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shouli, " +
				//"sum(case when t.stadardresult=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as sqrzongshu, " +  //申请人总数
				//被申请人种类
				"sum(case when t.stadardresult=1 and t.defendant_type=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xiangzhen, " +
				"sum(case when t.stadardresult=1 and t.defendant_type=2 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xianjibumen, " +
				"sum(case when t.stadardresult=1 and t.defendant_type=3 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xianjizhengfu, " +          
				"sum(case when t.stadardresult=1 and t.defendant_type=4 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidibumen, " +
				"sum(case when t.stadardresult=1 and t.defendant_type=5 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidizhengfu, " +
				"sum(case when t.stadardresult=1 and t.defendant_type=7 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengji, " +
				"sum(case when t.stadardresult=1 and t.defendant_type=6 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengbuji, " +
				"sum(case when t.stadardresult=1 and t.defendant_type=11 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as guowuybm, " +
				
				"sum(case when t.stadardresult=1 and t.defendant_type between 8 and 9 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as qita, " +
				//，6级复议机关，没有没有两县级，默认值0
				"sum(case when t.stadardresult=1 and length(t.caseorg)=4 and substr(t.caseorg,3)<>'00' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidibumen1, " +
				"sum(case when t.stadardresult=1 and length(t.caseorg)=4 and substr(t.caseorg,3)='00' and substr(t.caseorg,1,2)<'19' and t.caseorg<>'0000' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shidizhengfu1, " +
				"sum(case when t.stadardresult=1 and length(t.caseorg)=4 and substr(t.caseorg,3)='00' and substr(t.caseorg,1,2)>'18' and t.caseorg<>'0000' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengji1, " +
				"sum(case when t.stadardresult=1 and t.caseorg='0000' and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as shengbuji1, " +

				//"sum(case when t.casetype=1 and t.casetype2=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as juliu, " +
				//"sum(case when t.casetype=1 and t.casetype2=2 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as moshou, " +
				//"sum(case when t.casetype=1 and t.casetype2=3 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as fakuan, " +
				"sum(case when t.stadardresult=1 and t.casetype=1 and (t.casetype2=4 or t.casetype2=0 or t.casetype2=1 or t.casetype2=2 or t.casetype2=3) and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as chufaqita, " +
				//"sum(case when t.casetype=2 and t.casetype2=5 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as duirenshen, " +
				"sum(case when t.stadardresult=1 and t.casetype=2 and t.casetype2 between 5 and 7 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as duicaichan, " +
				"sum(case when t.stadardresult=1 and t.casetype=3 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xzzhengshou, " +
				"sum(case when t.stadardresult=1 and t.casetype=4 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xzxuke, " +
				"sum(case when t.stadardresult=1 and t.casetype=5 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xzquequan, " +
				"sum(case when t.stadardresult=1 and t.casetype=10 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xingzhengqueren, " +
				//"sum(case when t.casetype=6 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as ganyujingyingzzq, " +
				"sum(case when t.stadardresult=1 and t.casetype=7 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as xinxigongkai, " +
				
                "sum(case when t.stadardresult=1 and t.casetype=11 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as jubaotscl, " +

				
				"sum(case when t.stadardresult=1 and t.casetype=8 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as buzuowei, " +
				"sum(case when t.stadardresult=1 and (t.casetype=9 or t.casetype=6 or t.casetype is null or t.casetype=0) and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as sqfysxqita, " +
				"sum(case when t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as yishenjiezongji, " +  
				"sum(case when t.finish_type=1 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as bohui, " +
				"sum(case when t.finish_type=2 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as weichi, " +
				"sum(case when t.finish_type=3 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as querenweifa, " +
				"sum(case when t.finish_type=4 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as chexiao, " +
				"sum(case when t.finish_type=5 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' ) then 1 else 0 end) as biangeng, " +
				"sum(case when t.finish_type=6 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zelinglvxing, " +
				"sum(case when t.finish_type=7 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as tiaojie, " +
				"sum(case when t.finish_type=8 and (t.finishBreakType=3 or t.finishBreakType=2 or t.finishBreakType=5) and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zhongzhi3, " +
				"sum(case when t.finish_type=8 and t.finishBreakType=1 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zhongzhi1, " +
				//"sum(case when t.finish_type=8 and t.finishBreakType=2 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zhongzhi2, " +
				"sum(case when t.finish_type=8 and t.finishBreakType=4 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as zhongzhi4, " +
				"sum(case when t.finish_type=9 and t.stadardresult=1 and t.status>=12 and (t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"') then 1 else 0 end) as yishenjieqita, " +
				"sum(case when t.stadardresult=1  and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' and (t.finish_date>'"+endDate+"' or t.finish_date is null  or (t.finish_date<='"+endDate+"' and t.status<12)) and t.status>=1 then 1 else 0 end) as weishenjie, " +
				"sum(case when t.nationMoney=1 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) then 1 else 0 end) as jianshu " +
				"from xzfy_info t " +
				"where " + a + " and   "+leibie +"  and  t.status>0 and t.caseorg is not null ";
				
//				dataListsSql1="select sum(t.nationMoneyDetail) from xzfy_info t " +
//				"where " + a + "  and  "+leibie +"  and t.status>0 and t.refer between 1 and 50 and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' " +
//						"or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) ";	
//				dataListsSql2="select sum(t.renCount) from xzfy_info t " +
//				"where " + a + " and   t.status>0 and (t.refer between 1 and 50 )" +
//				"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' " ;	
//				dataListsSql1="select sum(t.nationMoneyDetail) from xzfy_info t " +
//				"where " + a + "  and  "+leibie +"  and t.status>0  and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' " +
//						"or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) ";	
//				dataListsSql2="select sum(t.renCount) from xzfy_info t " +
//				"where " + a + " and   t.status>0 " +
//				"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' " ;	
//			
				dataListsSql1="select sum(t.nationMoneyDetail) from xzfy_info t " +
						"where " + a + "  and  "+leibie +"  and t.status>0  and (t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' " +
								"or t.receive_date<'"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null)) ";	
						dataListsSql2="select sum(t.renCount) from xzfy_info t " +
						"where " + a + " and   t.status>0 " +
						"and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' " ;	
					
			
				resultSet = selectStatement.executeQuery(dataListsSql);//jg  ---jg 
				resultSet1 = selectStatement1.executeQuery(dataListsSql1);
				resultSet2 = selectStatement2.executeQuery(dataListsSql2);
				numList.add("0");
				renList.add("0");
				while (resultSet1.next()) {
					Object[] objects = new Object[resultSet1.getMetaData().getColumnCount()];
					for (int j = 1; j < resultSet1.getMetaData().getColumnCount() + 1; j++) {
						objects[j - 1] = resultSet1.getObject(j);
						if (null == objects[j - 1]) {
							numList.set(0,"");
						} else {
							numList.set(0,objects[j - 1].toString());
						}
					}
					break;
				}
				while (resultSet2.next()) {
					Object[] objects = new Object[resultSet2.getMetaData().getColumnCount()];
					for (int j = 1; j < resultSet2.getMetaData().getColumnCount() + 1; j++) {
						objects[j - 1] = resultSet2.getObject(j);
						if (null == objects[j - 1]) {
							renList.set(0,"");
						} else {
							renList.set(0,objects[j - 1].toString());
						}
					}
					break;
				}
				/*while (resultSet.next()){					
					int m=1,n=13;
					for(int x=2;x<14;x++){
						if(x==5)
							arrayList.set(x, renList.get(0));
						else
							arrayList.set(x, resultSet.getString(m));
						m++;
					}
					for(int x=16;x<48;x++){
						arrayList.set(x, resultSet.getString(n));
						n++;
					}
					arrayList.set(48, numList.get(0));				
				}*/
				while (resultSet.next()){
				//	System.out.println("41---"+resultSet.getString(41));
					
					int m=1,n=13;
					for(int x=2;x<46;x++){
						if(x==5)
							arrayList.set(x, renList.get(0));
						else if(x==15 ||x==16 ||x==21){
							arrayList.set(x, "0");
							//System.out.println("aaaa--b"+m);
						}else
							{arrayList.set(x, resultSet.getString(m));
						//	System.out.println("jg  "+m+"--"+resultSet.getString(m));
							m++;
							}
						}
					arrayList.set(46, numList.get(0));
					//arrayList.set(46, "999");
					System.out.println("a");
					//num++;									
				}
				
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (selectStatement != null) {
					selectStatement.close();
					selectStatement = null;
				}
				if (selectStatement1 != null) {
					selectStatement1.close();
					selectStatement1 = null;
				}
				if (selectStatement2 != null) {
					selectStatement2.close();
					selectStatement2 = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
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
		return arrayList;
	}

	
	//当面接待
	public PaginationSupport getDmjiedaiList(int pageNumber, int pageSize,XzfyRecieve xzfyRecieve,User user, String locbm){
		String orqSql="from Org org where org.id="+user.getOrg().getId();
		List orgList=super.find(orqSql);
		Org org=(Org)orgList.get(0);
		
		String HQL = "";
		HQL += " from XzfyRecieve xzfyRecieve";
		HQL += " where 1 = 1";
		HQL+=" and xzfyRecieve.status=1 ";
		if(xzfyRecieve!=null){			
			HQL+=" and (xzfyRecieve.app_type1=1 or xzfyRecieve.app_type1=2) and xzfyRecieve.break_right='"+locbm+"' ";
			if(xzfyRecieve.getApp_show()!=null && !xzfyRecieve.getApp_show().equals(""))
				HQL+=" and xzfyRecieve.app_show like '%"+xzfyRecieve.getApp_show()+"%'";
			if(xzfyRecieve.getDefendant_name()!=null && !xzfyRecieve.getDefendant_name().equals(""))
				HQL+=" and xzfyRecieve.defendant_name like '%"+xzfyRecieve.getDefendant_name()+"%'";
			if(xzfyRecieve.getReceive_date()!=null && !xzfyRecieve.getReceive_date().equals(""))
				HQL+=" and xzfyRecieve.receive_date = '"+xzfyRecieve.getReceive_date()+"'";
			if(xzfyRecieve.getXwname()!=null && !xzfyRecieve.getXwname().equals(""))
				HQL+=" and xzfyRecieve.xwname like '%"+xzfyRecieve.getXwname()+"%'";
			if(xzfyRecieve.getBreak_right()!=null && !xzfyRecieve.getBreak_right().equals(""))
				HQL+=" and xzfyRecieve.break_right like '%"+xzfyRecieve.getBreak_right()+"%'";
		}
		//System.out.println(HQL);
		return super.find(HQL, pageNumber, pageSize);			
	}
	
	
	//日接待统计
	@Override
	public ArrayList<ArrayList<String>> getRijiedaiList(String searchDate,String locbm, String finish_type) {
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		String a="",a1="",a2="";
		if(finish_type.equals("1")){//全市案件
			a="1=1";
			a1="1=1";
			a2="1=1";
		}else if(finish_type.equals("2")){//所有区县政府案件
			a="substr(t.caseorg,-2)='00' and substr(t.caseorg,1,2)>'00' and substr(t.caseorg,1,2)<'19'";
			a1="substr(t1.case_Org,-2)='00' and substr(t1.case_Org,1,2)>'00' and substr(t1.case_Org,1,2)<'19'";
			a2="substr(t2.caseorg,-2)='00' and substr(t2.caseorg,1,2)>'00' and substr(t2.caseorg,1,2)<'19'";
		}else if(finish_type.equals("3")){//指定复议机关
			a="t.caseorg='"+locbm+"'";	
			a1="t1.case_Org='"+locbm+"'";
			a2="t2.caseorg='"+locbm+"'";
		}else if(finish_type.equals("4")){//所有市政府部门案件
			a="substr(t.caseorg,-2)='00' and substr(t.caseorg,1,2)>'18'";
			a1="substr(t1.case_Org,-2)='00' and substr(t1.case_Org,1,2)>'18'";
			a2="substr(t2.caseorg,-2)='00' and substr(t2.caseorg,1,2)>'18'";
		}
		String dataListsSql = "select t.receive_date,t.app_type,t.app_show,t.admit1,t.admit2,'接收复议申请',t.defendant_name,t.user1_name,t.user2_name,t.user3_name,t.finish_date,t.finish_type,'1',t.id from xzfy_info t where t.app_type1 is null and t.receive_date='"+searchDate+"' and " + a + " and t.status>0 " +
				"union all " +
				"select t1.face_date,t1.meet_type,t1.client_content,t1.admit1,t1.admit2,'复议案件审理','','','','','','','2',t1.main_id from cww_meet t1 where t1.face_date='"+searchDate+"' and " + a1 +
				"union all " +
				"select t2.receive_date,t2.app_type,t2.app_show,t2.admit1,t2.admit2,'已接收材料当面补正',t2.defendant_name,t2.user1_name,t2.user2_name,t2.user3_name,t2.finish_date,t2.finish_type,'3',t2.jaadvice from xzfy_recieve t2 where t2.app_type1=2 and t2.receive_date='"+searchDate+"' and " + a2 + " and t2.status>0 ";
		//System.out.println(dataListsSql);
		ArrayList<ArrayList<String>> dataList = JdbcUtil.getListBySql(connection, dataListsSql);
		return dataList;
		
		
		/*String weekListsSql = "select t.lxt_mydate_mytime_year,t.lxt_mydate_mytime_month,t.lxt_mydate_mytime_weeks,t.lxt_mydate_mytime_startdate,t.lxt_mydate_mytime_enddate from lxt_mydate_mytime t where 1=1";

		if (null != startDate && !"".equals(startDate)) {
			weekListsSql = weekListsSql + "and t.lxt_mydate_mytime_startdate>='" + startDate + "'";
		}
		if (null != endDate && !"".equals(endDate)) {
			weekListsSql = weekListsSql + " and t.lxt_mydate_mytime_enddate<='" + endDate + "'";
		}
		weekListsSql = weekListsSql + " order by t.lxt_mydate_mytime_year,t.lxt_mydate_mytime_month,t.lxt_mydate_mytime_weeks";

		ArrayList<ArrayList<String>> weekLists = JdbcUtil.getListBySql(connection, weekListsSql);

		return weekLists;*/
		
	}

	@Override
	public ArrayList<String> getHomeCaseNum(String locbm, Number userid,Number orgid) {
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Connection connection1 = JdbcUtil.getConnByHibernateConfig();
		String numListsSql = "select " +
				"sum(case when (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status < 12 and xzfyInfo.status > 0  and xzfyInfo.caseorg = '"+locbm+"' then 1 else 0 end) as weibanjie, " +
				"sum(case when (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.stadardResult=1 and xzfyInfo.status>3 and xzfyInfo.status<12 and xzfyInfo.caseorg = '"+locbm+"' and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 40 and 50 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 40 and 50) then 1 else 0 end) as shenliqixian20, " +
				"sum(case when (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.stadardResult=1 and xzfyInfo.status>3 and xzfyInfo.status<12 and xzfyInfo.caseorg = '"+locbm+"' and ((xzfyInfo.isdelay=0 or xzfyInfo.isdelay is null) and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 50 and 60 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 50 and 60) or xzfyInfo.isdelay=1 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) between 80 and 90 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd'))) between 80 and 90)) then 1 else 0 end) as shenliqixian10, " +
				"sum(case when (xzfyInfo.isstop=0 or xzfyInfo.isstop is null) and xzfyInfo.status>3 and xzfyInfo.status<12  and xzfyInfo.stadardResult = 1 and xzfyInfo.caseorg = '"+locbm+"' and ((xzfyInfo.isdelay=0 or xzfyInfo.isdelay is null) and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >60 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>60) or xzfyInfo.isdelay=1 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >90 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>90)) or xzfyInfo.stadardResult!=1 and xzfyInfo.status!=12 and xzfyInfo.status>0 and xzfyInfo.caseorg = '"+locbm+"' and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >5 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>5) then 1 else 0 end) as chaoqi, " +
				"sum(case when (xzfyInfo.status=8 or (xzfyInfo.status=4 and xzfyInfo.isstop=1) or (xzfyInfo.breakTo is null and xzfyInfo.isstop=1)) and xzfyInfo.status<12 and xzfyInfo.caseorg = '"+locbm+"' and xzfyInfo.status>0 then 1 else 0 end) as zhongzhi, " +
				"sum(case when xzfyInfo.status=1 and xzfyInfo.user1_id is null and xzfyInfo.caseorg = '"+locbm+"' then 1 else 0 end) as newdaifenpei, " +
				"sum(case when xzfyInfo.status=4 and xzfyInfo.user2_id is null and xzfyInfo.caseorg = '"+locbm+"' then 1 else 0 end) as weizhiding, " +
				"sum(case when (xzfyInfo.status=1 or xzfyInfo.status =2 or xzfyInfo.status=3 or(xzfyInfo.status=11 and xzfyInfo.stadardResult>1)) and xzfyInfo.user1_id= '"+userid+"' then 1 else 0 end) as dailianshencha, " +
				"sum(case when ((xzfyInfo.status>3 and xzfyInfo.status<11) or (xzfyInfo.status=11 and xzfyInfo.stadardResult=1)) and xzfyInfo.user2_id= '"+userid+"' then 1 else 0 end) as daibanli " +
				//"sum(case when (xzfyInfo.status in ('5','7','9') or (xzfyInfo.status=11 and xzfyInfo.stadardResult=1)) and xzfyInfo.check_status=1 and xzfyInfo.check_id='"+userid+"' then 1 else 0 end) as daishenpi, " +
				//"sum(case when (xzfyInfo.status in ('2','3') or (xzfyInfo.status=11 and xzfyInfo.stadardResult>1)) and xzfyInfo.check_status=1 and xzfyInfo.check_id= '"+userid+"' then 1 else 0 end) as dailianshenpi, " +
				//"sum(case when xzfyInfo.status > 0 and xzfyInfo.status < 12 and (xzfyInfo.user1_id in (select user.id from User user where user.org.id = '"+orgid+"') or xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')) then 1 else 0 end) as subweibanjie, " +
				//"sum(case when xzfyInfo.status > 3 and xzfyInfo.status < 12 and xzfyInfo.stadardResult = 1 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >40 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>40) and (xzfyInfo.user1_id in (select user.id from User user where user.org.id = '"+orgid+"') or xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')) then 1 else 0 end) as sub40, " +
				//"sum(case when xzfyInfo.status > 3 and xzfyInfo.status < 12 and xzfyInfo.stadardResult = 1 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >50 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>50) and (xzfyInfo.user1_id in (select user.id from User user where user.org.id = '"+orgid+"') or xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')) then 1 else 0 end) as sub50, " +
				//"sum(case when xzfyInfo.status > 3 and xzfyInfo.status < 12 and xzfyInfo.stadardResult = 1 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >60 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>60) and (xzfyInfo.user1_id in (select user.id from User user where user.org.id = '"+orgid+"') or xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')) or xzfyInfo.stadardResult!=1 and xzfyInfo.status!=12 and (xzfyInfo.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) >5 or (floor(sysdate - to_date(xzfyInfo.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo.bzTongzhiriqi,'yyyy-mm-dd')))>5) and (xzfyInfo.user1_id in (select user.id from User user where user.org.id = '"+orgid+"') or xzfyInfo.user2_id in (select user.id from User user where user.org.id = '"+orgid+"')) then 1 else 0 end) as subchaoqi " +
				"from xzfy_info xzfyInfo " +
				"where 1 = 1";
		String numListsSql2 = "select " +
				"(select count(1) from xzfy_info xzfyInfo1 where (xzfyInfo1.status in ('5','7','9') or (xzfyInfo1.status=11 and xzfyInfo1.stadardResult=1)) and xzfyInfo1.check_status=1 and xzfyInfo1.check_id='"+userid+"' ) as daishenpi, " +
				"(select count(1) from xzfy_info xzfyInfo2 where (xzfyInfo2.status in ('2','3') or (xzfyInfo2.status=11 and xzfyInfo2.stadardResult>1)) and xzfyInfo2.check_status=1 and xzfyInfo2.check_id= '"+userid+"' ) as dailianshenpi " +
				//"(select count(1) from xzfy_info xzfyInfo3 where xzfyInfo3.status > 0 and xzfyInfo3.status < 12 and (xzfyInfo3.user1_id in (select user.user_id from u_User user where user.org_id = '"+orgid+"') or xzfyInfo3.user2_id in (select user.user_id from u_User user where user.org_id = '"+orgid+"')) ) as subweibanjie " +
				//"(select count(1) from xzfy_info xzfyInfo4 where xzfyInfo4.status > 3 and xzfyInfo4.status < 12 and xzfyInfo4.stadardResult = 1 and (xzfyInfo4.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo4.receive_date,'yyyy-mm-dd')) >40 or (floor(sysdate - to_date(xzfyInfo4.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo4.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo4.bzTongzhiriqi,'yyyy-mm-dd')))>40) and (xzfyInfo4.user1_id in (select user.user_id from u_User user where user.org_id = '"+orgid+"') or xzfyInfo4.user2_id in (select user.user_id from u_User user where user.org_id = '"+orgid+"')) ) as sub40, " +
				//"(select count(1) from xzfy_info xzfyInfo5 where xzfyInfo5.status > 3 and xzfyInfo5.status < 12 and xzfyInfo5.stadardResult = 1 and (xzfyInfo5.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo5.receive_date,'yyyy-mm-dd')) >50 or (floor(sysdate - to_date(xzfyInfo5.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo5.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo5.bzTongzhiriqi,'yyyy-mm-dd')))>50) and (xzfyInfo5.user1_id in (select user.user_id from u_User user where user.org_id = '"+orgid+"') or xzfyInfo5.user2_id in (select user.user_id from u_User user where user.org_id = '"+orgid+"')) ) as sub50, " +
				//"(select count(1) from xzfy_info xzfyInfo6 where xzfyInfo6.status > 3 and xzfyInfo6.status < 12 and xzfyInfo6.stadardResult = 1 and (xzfyInfo6.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo6.receive_date,'yyyy-mm-dd')) >60 or (floor(sysdate - to_date(xzfyInfo6.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo6.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo6.bzTongzhiriqi,'yyyy-mm-dd')))>60) and (xzfyInfo6.user1_id in (select user.user_id from u_User user where user.org_id = '"+orgid+"') or xzfyInfo6.user2_id in (select user.user_id from u_User user where user.org_id = '"+orgid+"')) or xzfyInfo6.stadardResult!=1 and xzfyInfo6.status!=12 and (xzfyInfo6.bzBuqiriqi is null and floor(sysdate - to_date(xzfyInfo6.receive_date,'yyyy-mm-dd')) >5 or (floor(sysdate - to_date(xzfyInfo6.receive_date,'yyyy-mm-dd')) - floor(to_date(xzfyInfo6.bzBuqiriqi,'yyyy-mm-dd') - to_date(xzfyInfo6.bzTongzhiriqi,'yyyy-mm-dd')))>5) and (xzfyInfo6.user1_id in (select user.user_id from u_User user where user.org_id = '"+orgid+"') or xzfyInfo6.user2_id in (select user.user_id from u_User user where user.org_id = '"+orgid+"')) ) as subchaoqi " +
				"from xzfy_info xzfyInfo " +
				"where 1 = 1";
		//System.out.println(numListsSql);
		//System.out.println(numListsSql2);
		//"sum(case when t.receive_date<='"+startDate+"'  then 1 else 0 end) as shangqijiezhuan, " +
		//ArrayList<String> numList = JdbcUtil.getListBySql(connection, numListsSql);
		ArrayList<String> numList = JdbcUtil.getSingleListBySql(connection, numListsSql);
		ArrayList<String> numList2 = JdbcUtil.getSingleListBySql(connection1, numListsSql2);
		numList.add("0");
		numList.add("0");
		numList.set(9, numList2.get(0));
		numList.set(10, numList2.get(1));
		return numList;
	}
	
	
	//统计表22：行政复议机关办案效果指标统计
	public ArrayList<ArrayList<String>> getFyjgLists(String type) {
		Connection connection = JdbcUtil.getConnByHibernateConfig();

        String sql="";

        /************市政府***********/
        if(type.equals("1")){
        	sql=" select t.org_name,t.org_locbm from u_org t";
        	sql+=" where t.org_parent=1 and t.org_locbm='0000'";
        	sql+=" order by t.org_locbm";
        }        
        
        /************区县政府***********/
        else if(type.equals("2")){
        	sql=" select t.org_name,t.org_locbm from u_org t";
        	sql+=" where substr(org_locbm,-2)='00' and t.org_parent=1 and substr(org_locbm,1,2)>'00' and substr(org_locbm,1,2)<'19'";
        	sql+=" order by t.org_locbm";
        }
        
        /************市政府部门***********/
        else if(type.equals("3")){
        	sql=" select t.org_name,t.org_locbm from u_org t";
        	sql+=" where substr(org_locbm,-2)='00' and t.org_parent=1 and substr(org_locbm,1,2)>'18'";
        	sql+=" order by t.org_locbm";
        }
        
		ArrayList<ArrayList<String>> fyjgLists = JdbcUtil.getListBySql(connection, sql);

		return fyjgLists;
	}
	
	
	private IndexTjService indexTjService;
	ArrayList<ArrayList<String>> xiaolvLists = new ArrayList<ArrayList<String>>();
	public ArrayList<ArrayList<String>> getXiaolvLists() {
		return xiaolvLists;
	}

	public void setXiaolvLists(ArrayList<ArrayList<String>> xiaolvLists) {
		this.xiaolvLists = xiaolvLists;
	}

	public IndexTjService getIndexTjService() {
		return indexTjService;
	}

	public void setIndexTjService(IndexTjService indexTjService) {
		this.indexTjService = indexTjService;
	}

	public ArrayList<ArrayList<String>> getBananxgLists(ArrayList<ArrayList<String>> fyjgLists, String startDate, String endDate, String date) throws SQLException{
		ArrayList<ArrayList<String>> arrayLists = new ArrayList<ArrayList<String>>();
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement = connection.createStatement();
		ResultSet resultSet = null;
		try {
			String dataListsSql = "";
			for (int i = 0; i < fyjgLists.size(); i++) {
				ArrayList<String> arrayList = new ArrayList<String>();
				arrayList.add(fyjgLists.get(i).get(0));				
				for (int j = 0; j < 16; j++) {
					arrayList.add("0");
				}
				dataListsSql = "";
				dataListsSql = "select " +
				//本期新收
				"sum(case when t.caseorg='"+fyjgLists.get(i).get(1)+"' and t.stadardresult=1 and t.receive_date>='"+startDate+"' and t.receive_date<='"+endDate+"' then 1 else 0 end) as benqixinshou, " +
				//上期结转
				"sum(case when t.caseorg='"+fyjgLists.get(i).get(1)+"' and t.stadardresult=1 and t.receive_date<='"+startDate+"' and (t.finish_date>='"+startDate+"' or t.finish_date is null) then 1 else 0 end) as jiezhuan, " +
				//结案总数
				"sum(case when t.caseorg='"+fyjgLists.get(i).get(1)+"' and t.stadardresult=1 and t.status>=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' then 1 else 0 end) as jieanshu, " +
				//调解终止结案
				"sum(case when t.caseorg='"+fyjgLists.get(i).get(1)+"' and (t.finish_type=7 or t.finish_type=8) and t.stadardresult=1 and t.status>=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' then 1 else 0 end) as tjzz, " +
				//和解结案
				"sum(case when t.caseorg='"+fyjgLists.get(i).get(1)+"' and t.finish_type=8 and t.finishBreakType=1 and t.stadardresult=1 and t.status>=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' then 1 else 0 end) as hejie, " +
				//撤销结案
				"sum(case when t.caseorg='"+fyjgLists.get(i).get(1)+"' and t.finish_type=4 and t.stadardresult=1 and t.status>=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' then 1 else 0 end) as chexiao, " +
				//变更结案
				"sum(case when t.caseorg='"+fyjgLists.get(i).get(1)+"' and t.finish_type=5 and t.stadardresult=1 and t.status>=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' then 1 else 0 end) as biangeng, " +
				//确认违法结案
				"sum(case when t.caseorg='"+fyjgLists.get(i).get(1)+"' and t.finish_type=3 and t.stadardresult=1 and t.status>=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' then 1 else 0 end) as querenweifa, " +
				//责令履责结案
				"sum(case when t.caseorg='"+fyjgLists.get(i).get(1)+"' and t.finish_type=6 and t.stadardresult=1 and t.status>=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' then 1 else 0 end) as zelinglvze, " +
				//60日内办结数
				"sum(case when t.caseorg='"+fyjgLists.get(i).get(1)+"' and t.stadardresult=1 and t.status>=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' and floor(To_date(t.finish_date,'yyyy-mm-dd')-To_date(t.receive_date,'yyyy-mm-dd')) <='60' then 1 else 0 end) as in_time, " +
				//延期办结数
				"sum(case when t.caseorg='"+fyjgLists.get(i).get(1)+"' and t.stadardresult=1 and t.status>=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' and t.isdelay=1 then 1 else 0 end) as out_time, " +
				//总时间
				"sum(case when t.caseorg='"+fyjgLists.get(i).get(1)+"' and t.stadardresult=1 and t.status>=12 and t.finish_date>='"+startDate+"' and t.finish_date<='"+endDate+"' then floor(To_date(t.finish_date,'yyyy-mm-dd')-To_date(t.receive_date,'yyyy-mm-dd')) else 0 end) as all_days " +
		
				"from xzfy_info t " +
				 "where t.status>0";
				
				//System.out.println(dataListsSql);
				
				resultSet = selectStatement.executeQuery(dataListsSql);
				DecimalFormat df = new DecimalFormat("##.##");
				while (resultSet.next()){
					arrayList.set(1, resultSet.getString(1));
					arrayList.set(2, resultSet.getString(2));
					long slzs = Long.valueOf(resultSet.getString(1))+Long.valueOf(resultSet.getString(2));
					arrayList.set(3, String.valueOf(slzs));
					arrayList.set(4, resultSet.getString(4));
					float jiean = Float.parseFloat(resultSet.getString(3));
					float tjzz = Float.parseFloat(resultSet.getString(4));
					float bilv1;
					if(slzs != 0)
						bilv1 = (tjzz/slzs)*100;
					else
						bilv1 = 0;
					arrayList.set(5, String.valueOf(df.format(bilv1)));
					arrayList.set(6, resultSet.getString(5));
					float hjja = Float.parseFloat(resultSet.getString(5));
					float bilv2;
					if(slzs != 0)
						bilv2 = (hjja/slzs)*100;
					else
						bilv2 = 0;
					arrayList.set(7, String.valueOf(df.format(bilv2)));
					//System.out.println(String.valueOf(df.format(bilv1)));
					arrayList.set(8, resultSet.getString(6));
					arrayList.set(9, resultSet.getString(7));
					arrayList.set(10, resultSet.getString(8));
					arrayList.set(11, resultSet.getString(9));
					float cbqz = Float.parseFloat(resultSet.getString(6))+Float.parseFloat(resultSet.getString(7))+Float.parseFloat(resultSet.getString(8))+Float.parseFloat(resultSet.getString(9));
					float bilv3;
					if(slzs != 0)
						bilv3 = (cbqz/slzs)*100;
					else
						bilv3 = 0;
					arrayList.set(12, String.valueOf(df.format(bilv3)));
					arrayList.set(13, String.valueOf(df.format(bilv1+bilv2+bilv3)));
					float banjie60 = Float.parseFloat(resultSet.getString(10));
					float bilv5;
					if(slzs != 0)
						bilv5 = (banjie60/slzs)*100;
					else
						bilv5 = 0;
					arrayList.set(14, String.valueOf(df.format(bilv5)));
					float yanqibanjie = Float.parseFloat(resultSet.getString(11));
					float bilv6;
					if(slzs != 0)
						bilv6 = (yanqibanjie/slzs)*100;
					else
						bilv6 = 0;
					arrayList.set(15, String.valueOf(df.format(bilv6)));
					float pingjun = Float.parseFloat(resultSet.getString(12));
					float bilv7;
					if(slzs != 0)
						bilv7 = pingjun/slzs;
					else
						bilv7 = 0;
					arrayList.set(16, String.valueOf(Math.floor(bilv7)));
				}
				arrayLists.add(arrayList);
			}
			/*xiaolvLists = indexTjService.getEfficiencyLists(fyjgLists, date);	
			for (int i = 0; i < fyjgLists.size(); i++){
				arrayLists.get(i).set(14, xiaolvLists.get(i).get(10));
				arrayLists.get(i).set(15, xiaolvLists.get(i).get(11));
				arrayLists.get(i).set(16, xiaolvLists.get(i).get(12));
			}*/
			
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

	
	//查重
	@Override
	public boolean checkAnhao(String anhao,String id) {
		String HQL="";
		HQL+="from XzfyInfo xzfyInfo where xzfyInfo.tjzfzh='"+anhao+"' and xzfyInfo.status>0 and xzfyInfo.id!='"+id+"'";
		List dataList = super.find(HQL);
		if(!dataList.isEmpty())
			return true;
		return false;
	}
	@Override
	public boolean checkXwnum(String xwnum,String id) {
		String HQL="";
		HQL+="from XzfyInfo xzfyInfo where xzfyInfo.xwnum='"+xwnum+"' and xzfyInfo.status>0 and xzfyInfo.id!='"+id+"'";
		List dataList = super.find(HQL);
		if(!dataList.isEmpty())
			return true;
		return false;
	}
	@Override
	public PaginationSupport getcheckXwnumListByPage(int pageNumber, int pageSize, String xwnum, String id) {
		String HQL="";
		HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name ";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.xwnum = '"+xwnum+"' and xzfyInfo.id != '"+id+"' and xzfyInfo.status>0";
		return super.find(HQL, pageNumber, pageSize);
	}

	@Override
	public boolean checkAppnum(String appnum, String id) {
		String HQL="";
		HQL+="select xzfyApp.id from XzfyApp xzfyApp, XzfyInfo xzfyInfo1 where xzfyApp.app_id='"+appnum+"' and xzfyApp.xzfyInfo.id=xzfyInfo1.id and xzfyInfo1.id!='"+id+"' and xzfyInfo1.status>0";
		List dataList = super.find(HQL);
		if(!dataList.isEmpty())
			return true;
		return false;
	}
	@Override
	public PaginationSupport getCheckAppnumListByPage(int pageNumber, int pageSize, String appnum, String id) {
		String HQL="";
		//HQL += " select xzfyInfo.tjzfzh,xzfyInfo.receive_date,xzfyInfo.defendant_name,xzfyInfo.app_show,xzfyInfo.status,xzfyInfo.id,xzfyInfo.check_status,xzfyInfo.stadardResult,xzfyInfo.user1_name,xzfyInfo.user2_name,xzfyInfo.user3_name,xzfyInfo.check_name ";
		//HQL += " from XzfyInfo xzfyInfo ";
		//HQL += " where xzfyInfo.status>0 and xzfyInfo.id in (select xzfyApp.xzfyInfo.id from XzfyApp xzfyApp where xzfyApp.app_id='"+appnum+"' and xzfyApp.xzfyInfo.id!='"+id+"' )";
		HQL += " select xzfyInfo1.tjzfzh,xzfyInfo1.receive_date,xzfyInfo1.defendant_name,xzfyInfo1.app_show,xzfyInfo1.status,xzfyInfo1.id,xzfyInfo1.check_status,xzfyInfo1.stadardResult,xzfyInfo1.user1_name,xzfyInfo1.user2_name,xzfyInfo1.user3_name,xzfyInfo1.check_name ";
		HQL += " from XzfyApp xzfyApp, XzfyInfo xzfyInfo1 ";
		HQL += " where xzfyApp.app_id='"+appnum+"' and xzfyApp.xzfyInfo.id=xzfyInfo1.id and xzfyInfo1.id!='"+id+"' and xzfyInfo1.status>0";
		return super.find(HQL, pageNumber, pageSize);
	}
	//and xzfyInfo.id!='"+id+"'    and xzfyApp.xzfyInfo.id!='"+id+"'
	
	
	
	public ArrayList<ArrayList<ArrayList<String>>> getInformList(String userId, String locbm){
		Connection conn = JdbcUtil.getConnByHibernateConfig();
		Connection conn1 = JdbcUtil.getConnByHibernateConfig();
		String sql = "";
		ArrayList<ArrayList<String>> dataLists = new ArrayList<ArrayList<String>>();
		ArrayList<ArrayList<String>> dataLists1 = new ArrayList<ArrayList<String>>();
		/*String[] meetType = {"阅卷","送达","转交材料"};	
		for(int i=0;i<meetType.length;i++){
			ArrayList<ArrayList<String>> lists = new ArrayList<ArrayList<String>>();
			sql = "select t.id,t.app_show from xzfy_info t where " +
					"t.caseorg = '"+locbm+"' and t.user2_id= '"+userId+"' and " +
							"((t.status>3 and t.status<11) or (t.status=11 and t.stadardResult=1)) and t.id in " +
									"(select m.law_id from cww_meet m where m.face_time = '1' and m.meet_type = '"+meetType[i]+"') ";
			
			lists = JdbcUtil.getListBySql(conn, sql);
			for(int j=0;j<dataLists.size();j++){
				lists.get(j).add(meetType[i]);
			}
			dataLists.addAll(lists);
		}*/
		sql = "select t.id,t.app_show,m.face_date,m.client_content,m.meet_type,m.main_id from xzfy_info t inner join cww_meet m " +
					"on t.id=m.law_id and m.face_time='1' " +
						"where t.caseorg = '"+locbm+"' and (t.user2_id= '"+userId+"' or t.user2_id is null and t.user1_id='"+userId+"') and " +
							"((t.status>3 and t.status<11) or (t.status=11 and t.stadardResult=1)) ";
		dataLists = JdbcUtil.getListBySql(conn, sql);
		String sql1 = "select r.id,r.app_show,r.receive_date from xzfy_info t inner join xzfy_recieve r " +
				"on t.id=r.jaAdvice and r.finish_date='1' " +
				"where t.caseorg = '"+locbm+"' and t.user1_id='"+userId+"' and t.status>0";
		dataLists1 = JdbcUtil.getListBySql(conn1, sql1);
		ArrayList dataLists2 = new ArrayList();
		dataLists2.add(dataLists);
		dataLists2.add(dataLists1);
		return dataLists2;
	}
	
	public Meet getMeetById(String entityId){
		String HQL = "";
		HQL += " from Meet meet";
		HQL += " where 1 = 1";
		HQL += " and meet.Main_id = '" + entityId+"'";
		List<Meet> dataList = super.find(HQL);
		Meet meet = new Meet();
		if (dataList.isEmpty()) {
			meet = new Meet();
		} else {
			meet = dataList.get(0);
		}
		return meet;
	}
	
	//meet表，根据xzfyId取最后一个阅卷、送达、转交材料组成list
	public List<Meet> getNewestMeetList(String xzfyId){
		String HQL1="from Meet meet where meet.Law_id='"+xzfyId+"' and meet.Meet_type='阅卷' order by meet.id desc";
		List<Meet> dataList1=super.find(HQL1);
		String HQL2="from Meet meet where meet.Law_id='"+xzfyId+"' and meet.Meet_type='送达' order by meet.id desc";
		List<Meet> dataList2=super.find(HQL2);
		String HQL3="from Meet meet where meet.Law_id='"+xzfyId+"' and meet.Meet_type='转交材料' order by meet.id desc";
		List<Meet> dataList3=super.find(HQL3);
		List<Meet> dataList=new ArrayList<Meet>();
		if(!dataList1.isEmpty())
			dataList.add(dataList1.get(0));
		if(!dataList2.isEmpty())
			dataList.add(dataList2.get(0));
		if(!dataList3.isEmpty())
			dataList.add(dataList3.get(0));
		return dataList;
	}
	
	
	//通过infoId在receive表里根据jaadvice拿最新当面补正接待记录
	public XzfyRecieve getDmbzByInfoid(String id){
		String HQL = "";
		HQL += " from XzfyRecieve receive where receive.jaAdvice = '"+id+"' order by receive.id desc ";
		List<XzfyRecieve> dataList = super.find(HQL);
		XzfyRecieve receive = new XzfyRecieve();
		if (!dataList.isEmpty()) {
			receive = dataList.get(0);
		}
		return receive;
	}
	//查看当面补正页面
	public XzfyRecieve getDmbzById(String id){
		String HQL = "";
		HQL += " from XzfyRecieve receive where receive.id = '"+id+"' order by receive.id desc ";
		List<XzfyRecieve> dataList = super.find(HQL);
		XzfyRecieve receive = new XzfyRecieve();
		if (!dataList.isEmpty()) {
			receive = dataList.get(0);
		}
		return receive;
	}

	
	
	//是否及时登记案件监控统计
	String year = this.getYear();
	public String getXmlString(String jktype, String hengxiangtype, String locbm, String startDate, String endDate){
		String xAxisName="";
		String xmlStr="";
	    xmlStr="<chart caption='"+xAxisName+"' xAxisName='"
	  	+"' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' ";
	    xmlStr+="baseFontSize='11' outCnvBaseFontSize='11' showLimits='1' yAxisMaxValue='100' ";
	    String[][] strArray = null;
	    
	    if(jktype.equals("1")){
	    	//strArray=specialFunc(getHengxiangStringArray(hengxiangtype,startDate,endDate));
	    	strArray=getHengxiangStringArray(hengxiangtype,startDate,endDate);
	    	xmlStr+="numberSuffix='%'>";
	    }
	    else if(jktype.equals("2")){
	    	//strArray=specialFunc(getZhidingStringArray(locbm,startDate,endDate));
	    	strArray=getZhidingStringArray(locbm,startDate,endDate);
	    	xmlStr+=">";
	    }
	    
	    int count=0;
	    count=strArray.length;
	    /*if(jktype.equals("1")&&hengxiangtype.equals("2"))
	    	count=10;*/
		for(int i=0;i<count;i++){	
			if(strArray[i][1]!=null){
				xmlStr+="<set label='"+strArray[i][1]+"' value='";
				xmlStr+=strArray[i][0]+"' />";	
			}
		}
		xmlStr+="</chart>";
		return xmlStr;
	}
	public String[][] getHengxiangStringArray(String hengxiangtype, String startDate, String endDate){
		String[][] str=null;
		String HQL1=" from Org o"; 
		if(hengxiangtype.equals("1"))
			HQL1+=" where o.locbm='0000' and o.id='1' or substr(o.locbm,-2)='00' and substr(o.locbm,0,2)>0 and substr(o.locbm,0,2)<19 and o.parent='1' order by o.locbm";
		else if(hengxiangtype.equals("2"))
			HQL1+=" where substr(o.locbm,-2)='00' and substr(o.locbm,0,2)>=19 order by o.locbm";
		List dataList=new ArrayList();
		dataList=super.find(HQL1);
		str=new String[dataList.size()][2];
		
		if(dataList.size()>0){
			for(int i=0;i<dataList.size();i++){
				if(dataList.get(i)!=null){
					Org org=(Org)(dataList.get(i));		
					
					String HQL2="select count(id) from XzfyInfo x " +
							"where x.receive_date is not null and x.receive_real_date is not null and x.status>0 " +
							"and x.receive_date>='"+startDate+"' and x.receive_date<='"+endDate+"' " +
							"and floor(to_date(substr(x.receive_real_date,0,10),'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd'))=0 " +
							"and x.caseorg = '"+org.getLocbm()+"'";
					String HQL3="select count(id) from XzfyInfo x " +
							"where x.receive_date is not null and x.receive_real_date is not null and x.status>0 " +
							"and x.receive_date>='"+startDate+"' and x.receive_date<='"+endDate+"' " +
							"and x.caseorg = '"+org.getLocbm()+"'";
				    
				    List list2=super.find(HQL2);
				    List list3=super.find(HQL3);
			        
				    if(!list2.isEmpty()&&!list3.isEmpty()){
				    	java.text.DecimalFormat  df = new java.text.DecimalFormat("#.00");
				    	Float a = Float.parseFloat(list2.get(0).toString());
				    	Float b = Float.parseFloat(list3.get(0).toString());
				    	
				    	int c=0;
				    	if(b!=0){
				    		//System.out.println(a+","+b);
				    		c = (int) (Float.parseFloat(df.format(a/b))*100);
					    	str[i][0]=c+"";
					    	if(org.getLocbm().equals("0000"))
					    		str[i][1]=org.getName();
					    	else
					    		str[i][1]=org.getName();
				    			//str[i][1]=org.getName().substring(3,org.getName().indexOf("人"));
				    	}
				    }
				}
	        }
	    }
	    
		return str;
    }
	public String[][] getZhidingStringArray(String locbm, String startDate, String endDate){
		String[][] str = new String[5][2];
		Connection connection = JdbcUtil.getConnByHibernateConfig();
			String HQL2="select count(id) from Xzfy_Info x " +
					"where x.receive_date is not null and x.receive_real_date is not null and x.status>0 " +
					"and x.receive_date>='"+startDate+"' and x.receive_date<='"+endDate+"' " +
					"and floor(to_date(substr(x.receive_real_date,0,10),'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd'))=0 " +
					"and x.caseorg = '"+locbm+"'" +
							" union all " +
					"select count(id) from Xzfy_Info x " +
					"where x.receive_date is not null and x.receive_real_date is not null and x.status>0 " +
					"and x.receive_date>='"+startDate+"' and x.receive_date<='"+endDate+"' " +
					"and floor(to_date(substr(x.receive_real_date,0,10),'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd'))<>0 " +
					"and x.caseorg = '"+locbm+"'" +
							" union all " +
					"select count(id) from Xzfy_Info x " +
					"where x.receive_date is not null and x.receive_real_date is not null and x.status>0 " +
					"and x.receive_date>='"+startDate+"' and x.receive_date<='"+endDate+"' " +
					"and floor(to_date(substr(x.receive_real_date,0,10),'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd')) between 1 and 3 " +
					"and x.caseorg = '"+locbm+"'" +
							" union all " +
					"select count(id) from Xzfy_Info x " +
					"where x.receive_date is not null and x.receive_real_date is not null and x.status>0 " +
					"and x.receive_date>='"+startDate+"' and x.receive_date<='"+endDate+"' " +
					"and floor(to_date(substr(x.receive_real_date,0,10),'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd')) between 4 and 10 " +
					"and x.caseorg = '"+locbm+"'" +
							" union all " +
					"select count(id) from Xzfy_Info x " +
					"where x.receive_date is not null and x.receive_real_date is not null and x.status>0 " +
					"and x.receive_date>='"+startDate+"' and x.receive_date<='"+endDate+"' " +
					"and floor(to_date(substr(x.receive_real_date,0,10),'yyyy-mm-dd')-to_date(x.receive_date,'yyyy-mm-dd')) >10 " +
					"and x.caseorg = '"+locbm+"'" ;
			ArrayList<ArrayList<String>> dataList = JdbcUtil.getListBySql(connection, HQL2);
		   // List<List<String>> list=super.find(HQL2);
	        
		    if(!dataList.isEmpty()){
		    	
		    		
			    	str[0][0]=dataList.get(0).get(0);
			    	str[1][0]=dataList.get(1).get(0);
			    	str[2][0]=dataList.get(2).get(0);
			    	str[3][0]=dataList.get(3).get(0);
			    	str[4][0]=dataList.get(4).get(0);
			    	str[0][1]="按时总数";
			    	str[1][1]="不按时总数";
			    	str[2][1]="超时[1,3]天";
			    	str[3][1]="超时[4,10]天";
			    	str[4][1]="超时[11,∞)天";
		    }
	    
		return str;
    }
	
	public String[][] specialFunc(String[][] param){
	    for(int i=0;i<param.length;i++){
	       for(int j=0;j<param.length-1-i;j++){
	          if(Float.parseFloat(param[j][0])<Float.parseFloat(param[j+1][0])){
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
	
	private String getYear(){
		return new SimpleDateFormat("yyyy").format(new Date());
	}
	
	private String getDate(){
		return new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	}
	
	
	
	
	
	

}
