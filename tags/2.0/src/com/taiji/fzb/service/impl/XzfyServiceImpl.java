package com.taiji.fzb.service.impl;

import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyAgent;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyRecieve;
import com.taiji.fzb.domain.XzfyShenpi;
import com.taiji.fzb.service.XzfyService;

@SuppressWarnings("unchecked")
public class XzfyServiceImpl extends CoreServiceImpl implements XzfyService {

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
	@Override
	public XzfyInfo getXzfyById(String entityId) {
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.id = '" + entityId+"'";
		List<XzfyInfo> dataList = super.find(HQL);
		XzfyInfo xzfy = new XzfyInfo();
		if (dataList.isEmpty()) {
			xzfy = new XzfyInfo();
		} else {
			xzfy = dataList.get(0);
		}
		return xzfy;
	}


	public XzfyRecieve getRecieveById(String entityId){
		String HQL = "";
		HQL += " from XzfyRecieve xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.id = '" + entityId+"'";
		List<XzfyRecieve> dataList = super.find(HQL);
		XzfyRecieve xzfy = new XzfyRecieve();
		if (dataList.isEmpty()) {
			xzfy = new XzfyRecieve();
		} else {
			xzfy = dataList.get(0);
		}
		return xzfy;
	}
	
	
	public List getShenpiById(String xzfyId,String status){
		String sql = " from XzfyShenpi shenpi where 1=1 and shenpi.xzfyInfo.id='"+xzfyId+"'";
		sql += " and shenpi.check_type='"+status+"'"+" and shenpi.check_result in ('1','2')";
		List<XzfyShenpi> shenpiList = super.find(sql);
		return shenpiList;
	}
	
	public List getAgentListById(String entityId) {
		String HQL = "";
		HQL += " from XzfyAgent agent";
		HQL += " where 1 = 1";
		HQL += " and agent.xzfyInfo.id = '" + entityId + "'";
		List<XzfyInfo> dataList = super.find(HQL);
		return dataList;
	}
	
	
	@Override
	public void saveXzfyInfo(XzfyInfo xzfyInfo) {
		super.save(xzfyInfo);
	}
	
	public List getAppListById(String entityId,String protype) {
		String HQL = "";
		HQL += " from XzfyApp app";
		HQL += " where 1 = 1";
		HQL += " and app.xzfyInfo.id = '" + entityId+"' and app.proxytype="+protype;
		List<XzfyInfo> dataList = super.find(HQL);
		return dataList;
	}

	public List getAppListById(String entityId) {
		String HQL = "";
		HQL += " from XzfyApp app";
		HQL += " where 1 = 1";
		HQL += " and app.xzfyInfo.id = '" + entityId+"'";
		List<XzfyInfo> dataList = super.find(HQL);
		return dataList;
	}
	
	public void deleteAppById(int entityId){
		String hql="delete from  XzfyApp app where app.id="+entityId;
		super.deleteAll(hql);
	}

	public void deleteAppById(String xzfyId){
		String hql="delete from  xzfy_app app where app.xzfy_id="+xzfyId;
		super.deleteAllBySQL(hql);
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

	public XzfyAgent getAgentById(int entityId) {
		String HQL = "";
		HQL += " from XzfyAgent agent";
		HQL += " where 1 = 1";
		HQL += " and agent.id = " + entityId;
		List<XzfyAgent> dataList = super.find(HQL);
		XzfyAgent agent = new XzfyAgent();
		if (dataList.isEmpty()) {
			agent = new XzfyAgent();
		} else {
			agent = dataList.get(0);
		}
		return agent;
	}
	
	public void deleteAgentById(int entityId){
		String hql="delete from  XzfyAgent agent where agent.id="+entityId;
		super.deleteAll(hql);
	}
	
	public PaginationSupport getXzfyListByStatus(String status,int pageNumber, int pageSize) {
		String hql = "from XzfyInfo where STATUS = '" + status +"' order by id desc";
		return super.find(hql, pageNumber, pageSize);
	}
	
	public PaginationSupport getXzfyListNoEnd(int pageNumber, int pageSize) {
		String hql = "from XzfyInfo where STATUS < '" + 10 +"' order by id desc";
		return super.find(hql, pageNumber, pageSize);
	}
	/*
	public XzfyShenpi getShenpiById(int entityId){
		String HQL = "";
		HQL += " from XzfyShenpi shenpi";
		HQL += " where 1 = 1";
		HQL += " and shenpi.id = " + entityId;
		List<XzfyShenpi> dataList = super.find(HQL);
		XzfyShenpi shenpi = new XzfyShenpi();
		if (dataList.isEmpty()) {
			shenpi = new XzfyShenpi();
		} else {
			shenpi = dataList.get(0);
		}
		return shenpi;
    }
    */
	   public PaginationSupport getShenpiListById(int pageNumber, int pageSize,String entityId,String user_id){
			String HQL = "";
			HQL += " from XzfyInfo xzfy";
			HQL += " where 1 = 1";
			HQL += " and xzfy.check_status=1 ";
			return super.find(HQL, pageNumber, pageSize);
	    }
	   
	    public XzfyShenpi getShenpiById(int entityId){
			String HQL = "";
			HQL += " from XzfyShenpi shenpi";
			HQL += " where 1 = 1";
			HQL += " and shenpi.id = " + entityId;
			List<XzfyShenpi> dataList = super.find(HQL);
			XzfyShenpi shenpi = new XzfyShenpi();
			if (dataList.isEmpty()) {
				shenpi = new XzfyShenpi();
			} else {
				shenpi = dataList.get(0);
			}
			return shenpi;
	    }


}
