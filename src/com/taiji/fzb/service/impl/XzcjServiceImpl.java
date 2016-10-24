package com.taiji.fzb.service.impl;

import java.util.List;

import com.taiji.common.ContextUtil;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzcjApp;
import com.taiji.fzb.domain.XzcjInfo;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.XzcjService;


@SuppressWarnings("unchecked")
public class XzcjServiceImpl extends CoreServiceImpl implements XzcjService {



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
	public PaginationSupport getXzcjList(int pageNumber, int pageSize, String locbm) {
		String HQL = "";
		HQL += " from  XzcjInfo xzcjInfo";
		HQL += " where 1 = 1";		
		HQL += " and xzcjInfo.locbm = '"+locbm+"'";
		HQL += " order by xzcjInfo.receive_date desc, xzcjInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	
	/*@Override
	public PaginationSupport getUndertakerList(int pageNumber, int pageSize,String tempundertaker) {
		String HQL = "";
		HQL += " from  XzssInfo xzssInfo";
		HQL += " where 1 = 1";
		HQL+="and xzssInfo.undertaker_name like '%"+tempundertaker+"%'";
		return super.find(HQL, pageNumber, pageSize);
	}*/
	@Override
	public PaginationSupport getUndertakerList(int pageNumber, int pageSize,String tempundertaker) {
		String HQL = "";
		HQL += " from  XzcjInfo xzcjInfo";
		HQL += " where 1 = 1";
		HQL += " and xzcjInfo.undertaker_id = '"+tempundertaker+"' and xzcjInfo.status = 4";
		HQL += " order by xzcjInfo.receive_date desc, xzcjInfo.id desc";
		System.out.println(tempundertaker);
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
			HQL+=" and xzcjInfo.receive_date = '"+receive_date+"' ";
		}
		if(!undertaker_name.equals("")){
			HQL+=" and xzcjInfo.undertaker_name like '%"+undertaker_name+"%' ";
		}
		if(!fyundertaker_name.equals("")){
			HQL+=" and xzcjInfo.fyundertaker_name like '%"+fyundertaker_name+"%' ";
		}
		if(!app_type.equals("")){
			HQL+=" and xzcjInfo.app_type = '"+app_type+"' ";
		}
		if(!app_num.equals("")){
			HQL+=" and xzcjInfo.app_num = '"+app_num+"' ";
		}
		if(!jiguan_type.equals("")){
			HQL+=" and xzcjInfo.jiguan_type like '%"+jiguan_type+"%' ";
		}
		if(!jiguan.equals("")){
			HQL+=" and xzcjInfo.jiguan like '%"+jiguan+"%' ";
		}
		if(!agent.equals("")){
			HQL+=" and xzcjInfo.agent like '%"+agent+"%' ";
		}
		if(!request.equals("")){
			HQL+=" and xzcjInfo.request like '%"+request+"%' ";
		}
		if(!ismoney.equals("")){
			HQL+=" and xzcjInfo.ismoney = '"+ismoney+"' ";
		}
		if(!action_name.equals("")){
			HQL+=" and xzcjInfo.action_name like '%"+action_name+"%' ";
		}
		if(!action_id.equals("")){
			HQL+=" and xzcjInfo.action_id like '%"+action_id+"%' ";
		}
		if(!manage_type.equals("")){
			HQL+=" and xzcjInfo.manage_type = '"+manage_type+"' ";
		}
		if(!fuyijielun.equals("")){
			HQL+=" and xzcjInfo.fuyijielun like '%"+fuyijielun+"%' ";
		}
		if(!caijuejielun.equals("")){
			HQL+=" and xzcjInfo.caijuejielun like '%"+caijuejielun+"%' ";
		}
		if(!jieandate.equals("")){
			HQL+=" and xzcjInfo.jieandate = '"+jieandate+"' ";
		}
		
		System.out.println(HQL);
		
		return super.find(HQL, pageNumber, pageSize);
	}
	
	
	
	/*
	 * 通过ID获取模板对象
	 * 
	 * @param entityId 模板对象ID
	 * 
	 * @return 模板对象
	 */
	@Override
	public XzcjInfo getXzcjById(String entityId) {
		String HQL = "";
		HQL += " from XzcjInfo xzcjInfo";
		HQL += " where 1 = 1";
		HQL += " and xzcjInfo.id = '" + entityId+"'";
		List<XzcjInfo> dataList = super.find(HQL);
		XzcjInfo xzcjInfo = new XzcjInfo();
		if (dataList.isEmpty()) {
			xzcjInfo = new XzcjInfo();
		} else {
			xzcjInfo = dataList.get(0);
		}
		return xzcjInfo;
	}
	
/*	public void deleteXzssById(double entityId){
		//double d = Double.parseDouble(entityId);
		String hql="delete from  XzssInfo xzssInfo where xzssInfo.id="+entityId;
		super.deleteAll(hql);
	}*/
	

	@Override
	public void saveXzcjInfo(XzcjInfo xzcjInfo) {
		super.saveOrUpdate(xzcjInfo);
	}
	
	@Override
	public void saveXzcjApp(XzcjApp xzcjApp) {
		super.saveOrUpdate(xzcjApp);
	}
	

	public List getAppListById(String entityId,String protype) {
		String HQL = "";
		HQL += " from XzcjApp xzcjApp";
		HQL += " where 1 = 1";
		HQL+="and xzcjApp.xzcj_id = '"+entityId+"'";
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
	}

	@Override
	public void deleteAppById(int id) {
		String HQL="delete from XzcjApp xzcjApp where xzcjApp.id="+id;
		super.deleteAll(HQL);
		
		
	}

	@Override
	public void deleteXzcjById(String id) {
		String HQL="delete from XzcjInfo xzcjInfo where xzcjInfo.id='"+id+"'";
		super.deleteAll(HQL);
	}

}
