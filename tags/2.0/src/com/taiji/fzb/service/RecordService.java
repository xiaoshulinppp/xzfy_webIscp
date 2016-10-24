package com.taiji.fzb.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyDftz;
import com.taiji.fzb.domain.XzfyShenpi;
import com.taiji.user.domain.User;
import com.taiji.webTemplate.domain.WtTemplate;

public interface RecordService extends ICoreService {


	public XzfyInfo getXzfyById(String entityId);

	public List getUserListById(String orgId);
	
	public List getCheckListByXzfyID(String xzfyId,String type);
	
	public User getUserById(String userId);
	
	public PaginationSupport getXzfyListByStatus(int pageNumber, int pageSize);
	
	public PaginationSupport getShenpiListById(int pageNumber, int pageSize,String user_id);

	public PaginationSupport getCheckList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,String user_id);
	
	public PaginationSupport getUserShenChaList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,String user_id);
	
	public PaginationSupport getUserBanLiList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,String user_id);
	
	public PaginationSupport getTotalList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,User user);
		
	public int getTotaCount(XzfyInfo xzfyInfo,User user);
	
	public List getLogList(String xzfyId);

	public int getTotalPage(int count,int pageSize,int pageNumber);
	
	public void  save_log(String status,String caozuo,String xzfyId,Object objNew);
}
