package com.taiji.jdaj.service.impl;

import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.jdaj.domain.JdajApp;
import com.taiji.jdaj.domain.JdajInfo;
import com.taiji.jdaj.service.JdajService;

public class JdajServiceImpl extends CoreServiceImpl implements JdajService  {
	@Override
	public void saveJdajApp(JdajApp jdajApp) {
		super.save(jdajApp);		
	}
	@Override
	public void saveJdajInfo(JdajInfo jdajInfo) {
		super.saveOrUpdate(jdajInfo);		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<JdajApp> getAppListById(String id) {
		String HQL = "";
		HQL += " from JdajApp app";
		HQL += " where 1 = 1";
		HQL += " and app.jdajInfo.id = '" + id+"'";
		List<JdajApp> appList = super.find(HQL);
		return appList;
	}
	@SuppressWarnings("unchecked")
	@Override
	public JdajInfo getJdajInfoById(String id) {
		String HQL = "";
		HQL += " from JdajInfo jdaj where 1 = 1";
		HQL += " and jdaj.id = '"+id+"'";
		List<JdajInfo> list=super.find(HQL);
		JdajInfo jdajInfo = new JdajInfo();
		if (list.isEmpty()) {
			jdajInfo = new JdajInfo();
		} else {
			jdajInfo = list.get(0);
		}
		return jdajInfo;
	}
	@Override
	public void deleteAppById(int id) {
		String HQL = "";
		HQL +="delete from JdajApp app where app.id = "+id;
		super.deleteAll(HQL);
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public JdajApp getAppById(int id) {
		String HQL = "";
		HQL+="from JdajApp app where app.id = "+id;
		List<JdajApp> list=super.find(HQL);
		JdajApp app = new JdajApp();
		if (list.isEmpty()) {
			app = new JdajApp();
		} else {
			app = list.get(0);
		}
		return app;
	}
	@Override
	public void updateApp(JdajApp jdajApp) {
		super.update(jdajApp);	
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<JdajInfo> getList(String date, String num, String appName,
			String undertaker) {
		String HQL="";
		HQL+="from JdajInfo jdaj where 1=1";
		if(!date.equals("")&&date!=null){
			HQL+=" and jdaj.receiveDate = '"+date+"'";
		}
		if(num!=null&&!num.equals("")){
			HQL+=" and jdaj.documentNumber = '"+num+"'";
		}
		if(!appName.equals("")&&appName!=null){
			HQL+=" and jdaj.appNames like '%"+appName+"%' ";
		}
		if(!undertaker.equals("")&&undertaker!=null){
			HQL+=" and jdaj.undertaker = '"+undertaker+"' ";
		}
		return super.find(HQL);
	}
	public PaginationSupport getListByPage(int pNum, int pageSize,
			String date, String num, String appName,
			String undertaker) {
		String HQL="";
		HQL+=" from JdajInfo jdaj where 1=1";
		if(!date.equals("")&&date!=null){
			HQL+=" and jdaj.receiveDate = '"+date+"'";
		}
		if(num!=null&&!num.equals("")){
			HQL+=" and jdaj.documentNumber = '"+num+"'";
		}
		if(!appName.equals("")&&appName!=null){
			HQL+=" and jdaj.appNames like '%"+appName+"%' ";
		}
		if(!undertaker.equals("")&&undertaker!=null){
			HQL+=" and jdaj.undertaker = '"+undertaker+"' ";
		}
		return super.find(HQL, pNum, pageSize);
	}
	@Override
	public void deleteJdajInfo(String id) {
		String HQL="";
		HQL+="delete from JdajInfo jdaj where jdaj.id='"+id+"'";
		super.deleteAll(HQL);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<JdajInfo> searchJdajInfo(String date, String num, String appName,
			String undertaker) {
		String HQL="";
		HQL+=" from JdajInfo jdaj where 1=1 ";
		if(!date.equals("")&&date!=null){
			HQL+="and jdaj.receiveDate = '"+date+"' ";
		}
		if(num!=null&&!num.equals("")){
			HQL+=" and jdaj.documentNumber = '"+num+"'";
		}
		if(!appName.equals("")&&appName!=null){
			HQL+="and jdaj.appNames like '%"+appName+"%' ";
		}
		if(!undertaker.equals("")&&undertaker!=null){
			HQL+="and jdaj.undertaker = '"+undertaker+"' ";
		}
		return super.find(HQL);
	}
	@Override
	public void deleteRelatedApp(String id) {
		String HQL="";
		HQL+="delete from JdajApp app where app.jdajInfo.id= '"+id+"'";
		super.deleteAll(HQL);
	}
	@Override
	public PaginationSupport searchJdajInfoByPage(int pNum, int pageSize,
			String date, String num, String appName, String undertaker) {
		String HQL="";
		HQL+=" from JdajInfo jdaj where 1=1 ";
		if(!date.equals("")&&date!=null){
			HQL+="and jdaj.receiveDate = '"+date+"' ";
		}
		if(num!=null&&!num.equals("")){
			HQL+=" and jdaj.documentNumber = '"+num+"'";
		}
		if(!appName.equals("")&&appName!=null){
			HQL+="and jdaj.appNames like '%"+appName+"%' ";
		}
		if(!undertaker.equals("")&&undertaker!=null){
			HQL+="and jdaj.undertaker = '"+undertaker+"' ";
		}
		return super.find(HQL,pNum,pageSize);
	}

}
