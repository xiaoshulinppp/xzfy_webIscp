package com.taiji.fzb.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyAgent;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyRecieve;
import com.taiji.fzb.domain.XzfyShenpi;

public interface XzfyService extends ICoreService {

	/**
	 * 获取模板列表
	 * 
	 * @param pageNumber
	 *            页码
	 * @param pageSize
	 *            每页显示条数
	 * @return 分页的列表
	 */
	public PaginationSupport getXzfyList(int pageNumber, int pageSize);

	/**
	 * 通过ID获取模板对象
	 * 
	 * @param entityId
	 *            模板对象ID
	 * @return 模板对象
	 */
	public XzfyInfo getXzfyById(String entityId);
	
	public XzfyRecieve getRecieveById(String entityId);
	
	public void saveXzfyInfo(XzfyInfo xzfyInfo);
	
	public List<XzfyApp> getAppListById(String entityId,String protype) ;

	public List<XzfyApp> getAppListById(String entityId) ;
	
	public List<XzfyAgent> getAgentListById(String entityId);
	
	public PaginationSupport getXzfyListByStatus(String status,int pageNumber, int pageSize);

	public PaginationSupport getXzfyListNoEnd(int pageNumber, int pageSize);
	
	public XzfyApp getAppById(int entityId);
	
	public void deleteAppById(int entityId);
	public void deleteAppById(String entityId);

	public XzfyAgent getAgentById(int entityId);

	public void deleteAgentById(int entityId);
	
	public List<XzfyShenpi> getShenpiById(String entityId,String status);
    public XzfyShenpi getShenpiById(int entityId);

    public PaginationSupport getShenpiListById(int pageNumber, int pageSize,String entityId,String user_id);
    
}
