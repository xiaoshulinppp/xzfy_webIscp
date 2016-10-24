package com.taiji.fzb.service.impl;

import java.util.List;

import com.taiji.common.ContextUtil;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzssInfo;
import com.taiji.fzb.service.XzssService;


@SuppressWarnings("unchecked")
public class XzssServiceImpl extends CoreServiceImpl implements XzssService {



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
	public PaginationSupport getXzssList(int pageNumber, int pageSize) {
		String HQL = "";
		HQL += " from  XzssInfo xzssInfo";
		HQL += " where 1 = 1";
		
		
		
		return super.find(HQL, pageNumber, pageSize);
	}
	
	@Override
	public PaginationSupport getUndertakerList(int pageNumber, int pageSize,String tempundertaker) {
		String HQL = "";
		HQL += " from  XzssInfo xzssInfo";
		HQL += " where 1 = 1";
		
	/*	if(!title.equals("")){
			isFirst=false;
			HQL+="and dxal.title like '%"+title+"%'";
		}*/
		

		HQL+="and xzssInfo.undertaker_name like '%"+tempundertaker+"%'";
		//System.out.println(tempundertaker);
		
		return super.find(HQL, pageNumber, pageSize);
	}
	
	//showJieanlist
	@Override
	public PaginationSupport getJieanList(int pageNumber, int pageSize,String tempuser ,String tempstatus) {
		String HQL = "";
		HQL += " from  XzssInfo xzssInfo";
		HQL += " where 1 = 1";
		HQL+="and xzssInfo.undertaker_name like '%"+tempuser+"%'";
		HQL+="and xzssInfo.status like '%"+tempstatus+"%'";
		//System.out.println(tempuser);
		
		
		return super.find(HQL, pageNumber, pageSize);
	}
	
	@Override
	public PaginationSupport getSearchList(int pageNumber, int pageSize, String receive_date, String undertaker_name, String fyundertaker_name, String app_name, String app_num, String app_type, String defendant, String agent, String jiguan_type, String jiguan_level, String jiguan, String request, String manage_type, String ismoney, String action_name, String action_id, String jieandate, String fuyi_id, String shen1, String shen2 ) {
		String HQL = "";
		HQL += " from  XzssInfo xzssInfo";
		HQL += " where 1 = 1";
		if(!receive_date.equals("")){
			HQL+="and xzssInfo.receive_date like '%"+receive_date+"%'";
		}
		if(!undertaker_name.equals("")){
			HQL+="and xzssInfo.undertaker_name like '%"+undertaker_name+"%'";
		}
		if(!fyundertaker_name.equals("")){
			HQL+="and xzssInfo.fyundertaker_name like '%"+fyundertaker_name+"%'";
		}
		if(!app_name.equals("")){
			HQL+="and xzssInfo.app_name like '%"+app_name+"%'";
		}
		if(!app_num.equals("")){
			HQL+="and xzssInfo.app_num like '%"+app_num+"%'";
		}
		if(!app_type.equals("")){
			HQL+="and xzssInfo.app_type like '%"+app_type+"%'";
		}
		if(!defendant.equals("")){
			HQL+="and xzssInfo.defendant like '%"+defendant+"%'";
		}
		if(!agent.equals("")){
			HQL+="and xzssInfo.agent like '%"+agent+"%'";
		}
		if(!jiguan_type.equals("")){
			HQL+="and xzssInfo.jiguan_type like '%"+jiguan_type+"%'";
		}
		if(!jiguan_level.equals("")){
			HQL+="and xzssInfo.jiguan_level like '%"+jiguan_level+"%'";
		}
		if(!jiguan.equals("")){
			HQL+="and xzssInfo.jiguan like '%"+jiguan+"%'";
		}
		if(!request.equals("")){
			HQL+="and xzssInfo.request like '%"+request+"%'";
		}
		if(!manage_type.equals("")){
			HQL+="and xzssInfo.manage_type like '%"+manage_type+"%'";
		}
		if(!ismoney.equals("")){
			HQL+="and xzssInfo.ismoney like '%"+ismoney+"%'";
		}
		if(!action_name.equals("")){
			HQL+="and xzssInfo.action_name like '%"+action_name+"%'";
		}
		if(!action_id.equals("")){
			HQL+="and xzssInfo.action_id like '%"+action_id+"%'";
		}
		if(!jieandate.equals("")){
			HQL+="and xzssInfo.jieandate like '%"+jieandate+"%'";
		}
		if(!fuyi_id.equals("")){
			HQL+="and xzssInfo.fuyi_id like '%"+fuyi_id+"%'";
		}
		if(!shen1.equals("")){
			HQL+="and xzssInfo.shen1 like '%"+shen1+"%'";
		}
		if(!shen2.equals("")){
			HQL+="and xzssInfo.shen2 like '%"+shen2+"%'";
		}

		
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
	public XzssInfo getXzssById(String entityId) {
		String HQL = "";
		HQL += " from XzssInfo xzssInfo";
		HQL += " where 1 = 1";
		HQL += " and xzssInfo.id = '" + entityId+"'";
		List<XzssInfo> dataList = super.find(HQL);
		XzssInfo xzssInfo = new XzssInfo();
		if (dataList.isEmpty()) {
			xzssInfo = new XzssInfo();
		} else {
			xzssInfo = dataList.get(0);
		}
		return xzssInfo;
	}
	
	public void deleteXzssById(double entityId){
		//double d = Double.parseDouble(entityId);
		String hql="delete from  XzssInfo xzssInfo where xzssInfo.id="+entityId;
		super.deleteAll(hql);
	}
	

	@Override
	public void saveXzssInfo(XzssInfo xzssInfo) {
		super.save(xzssInfo);
	}
	

	



}
