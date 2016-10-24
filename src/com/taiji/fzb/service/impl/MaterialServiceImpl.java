package com.taiji.fzb.service.impl;

import java.util.List;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.MaterialSharing;
import com.taiji.fzb.service.MaterialService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.fzb.service.RecordService;

public class MaterialServiceImpl extends CoreServiceImpl implements MaterialService{
	private RecordService recordService = null;
	public RecordService getRecordService() {
		return recordService;
	}

	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	@Override
	public PaginationSupport getMaterialList(int pageNumber, int pageSize, MaterialSharing materialSharing, User user) {
		String HQL = "";
		HQL += " from MaterialSharing materialSharing";
		HQL += " where 1 = 1";
		HQL += " and materialSharing.isshare = 1";
		HQL += " or materialSharing.isshare = 0 and materialSharing.locbm = '"+this.recordService.getOrg().getLocbm()+"'" +
				" order by materialSharing.uploadingdate desc";
		return super.find(HQL, pageNumber, pageSize);
	}

	@Override
	public PaginationSupport getMyMaterialList(int pageNumber, int pageSize, MaterialSharing materialSharing, User user) {
		String HQL = "";
		HQL += " from MaterialSharing materialSharing";
		HQL += " where 1 = 1";
		HQL += " and materialSharing.userid = '"+user.getId()+"' order by materialSharing.uploadingdate desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	

	@Override
	public MaterialSharing getMaterialById(int id) {
		String HQL="";
		HQL += " from MaterialSharing materialSharing";
		HQL += " where 1 = 1";
		HQL += " and materialSharing.id = '"+id+"'";
		List<MaterialSharing> dataList = super.find(HQL);
		MaterialSharing materialSharing = new MaterialSharing();
		if(dataList.isEmpty())
			materialSharing = new MaterialSharing();
		else
			materialSharing = dataList.get(0);
		return materialSharing;
	}

	@Override
	public PaginationSupport getMyOrgMaterialList(int pageNumber, int pageSize, MaterialSharing materialSharing) {
		String HQL = "";
		HQL += " from MaterialSharing materialSharing";
		HQL += " where 1 = 1";
		HQL += " and materialSharing.isshare = 0 and materialSharing.locbm = '"+this.recordService.getOrg().getLocbm()+"'" +
				" order by materialSharing.uploadingdate desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	
	
	/*public PaginationSupport getTotalList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,User user){
		String orqSql="from Org org where org.id="+user.getOrg().getId();
		List orgList=super.find(orqSql);
		Org org=(Org)orgList.get(0);
		
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.status between 1 and 11   and xzfy.caseorg='"+org.getLocbm()+"'";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				HQL+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				HQL+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				HQL+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				HQL+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		}

		return super.find(HQL, pageNumber, pageSize);	
		
	}*/
	
}