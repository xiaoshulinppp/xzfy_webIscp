package com.taiji.fzb.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.DxalInfo;
import com.taiji.fzb.domain.DxalComment;

public interface DxalService extends ICoreService{
	public PaginationSupport getDxalList(int pageNumber, int pageSize);
	public DxalInfo getDxalById(String entityId);
	public void saveDxalInfo(DxalInfo dxalinfo);
	public void saveDxalComment(DxalComment dxalcommet);
	public List<DxalInfo> getAllList();
	public PaginationSupport getSetupList(int pageNumber,int pageSize);
	public List<DxalInfo> getAllSetupList();
	public PaginationSupport FindList(int pageNumber,int pageSize,String title,String keyword,String case_type,int read_count,int comment_count);
	public List<DxalInfo> FindAllList(String title, String keyword, String case_type,int read_count,int comment_count);
	public void updateDxalInfo(DxalInfo dxalinfo);
	public void deleteDxal(String id);
	public void deleteComment(String id);

}
