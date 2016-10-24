package com.taiji.fzb.service.impl;

import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.DxalComment;
import com.taiji.fzb.domain.DxalInfo;
import com.taiji.fzb.service.DxalService;

public class DxalServiceImpl extends CoreServiceImpl implements DxalService{

	@Override
	public void saveDxalComment(DxalComment dxalcommet) {
		super.save(dxalcommet);
		
	}

	@Override
	public void saveDxalInfo(DxalInfo dxalinfo) {
		super.save(dxalinfo);
		
	}

	@Override
	public DxalInfo getDxalById(String entityId) {
		String HQL = "";
		HQL += " from DxalInfo dxal";
		HQL += " where 1 = 1";
		HQL += " and dxal.id = '" + entityId+"'";
		List<DxalInfo> dataList = super.find(HQL);
		DxalInfo dxal = new DxalInfo();
		if (dataList.isEmpty()) {
			dxal = new DxalInfo();
		} else {
			dxal = dataList.get(0);
		}
		return dxal;
	}

	@Override
	public PaginationSupport getDxalList(int pageNumber, int pageSize) {
		String HQL = "";
		HQL += " from  DxalInfo dxal";
		HQL += " where dxal.case_type not in (' ')";
		return super.find(HQL, pageNumber, pageSize);
	}
	@Override
	public List getAllList(){
		String HQL = "";
		HQL += " from  DxalInfo dxal";
		HQL += " where dxal.case_type not in (' ')";
		return super.find(HQL);		
		
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<DxalInfo> getAllSetupList() {
		String HQL = "";
		HQL += " from  DxalInfo dxal";
		HQL += " where 1 = 1";
		return super.find(HQL);	
	}

	@Override
	public PaginationSupport getSetupList(int pageNumber, int pageSize) {
		String HQL = "";
		HQL += " from  DxalInfo dxal";
		HQL += " where 1 = 1";
		return super.find(HQL, pageNumber, pageSize);
	}



	@Override
	public PaginationSupport FindList(int pageNumber, int pageSize,
			String title, String keyword, String case_type,int read_count,int comment_count) {
		String HQL = "";
		HQL += " from  DxalInfo dxal where 1=1 ";
		if(!title.equals("")&&title!=null){
			HQL+="and dxal.title like '%"+title+"%' ";
		}
		if(!keyword.equals("")&&keyword!=null){
			HQL+="and dxal.keyword like '%"+keyword+"%' ";			
		}
		if(!case_type.equals("")&&case_type!=null){
			HQL+="and dxal.case_type like '%"+case_type+"%' ";			
		}
		if(read_count!=0){
			HQL+="and dxal.read_count >= "+read_count+" ";
		}
		if(comment_count!=0){
			HQL+="and dxal.comment_count >= "+comment_count;
		}
		return super.find(HQL, pageNumber, pageSize);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DxalInfo> FindAllList(String title, String keyword, String case_type,int read_count,int comment_count) {
		String HQL = "";
		HQL += " from  DxalInfo dxal where 1=1 ";
		if(!title.equals("")&&title!=null){
			HQL+="and dxal.title like '%"+title+"%' ";
		}
		if(!keyword.equals("")&&keyword!=null){
			HQL+="and dxal.keyword like '%"+keyword+"%' ";			
		}
		if(!case_type.equals("")&&case_type!=null){
			HQL+="and dxal.case_type like '%"+case_type+"%' ";			
		}
		if(read_count!=0){
			HQL+="and dxal.read_count >= "+read_count+" ";
		}
		if(comment_count!=0){
			HQL+="and dxal.comment_count >= "+comment_count;
		}
		return super.find(HQL);
	}

	@Override
	public void updateDxalInfo(DxalInfo dxalinfo) {
		super.update(dxalinfo);
		
	}

	@Override
	public void deleteDxal(String id) {
		String HQL="";
		HQL+="delete from DxalInfo info where info.id ='"+id+"'";
		super.deleteAll(HQL);
		
	}

	@Override
	public void deleteComment(String id) {
		String HQL="";
		HQL+="delete from DxalComment c where c.dxalInfo.id = '"+id+"'";
		super.deleteAll(HQL);
	}

}
