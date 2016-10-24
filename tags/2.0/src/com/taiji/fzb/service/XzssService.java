package com.taiji.fzb.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzssInfo;
import com.taiji.webTemplate.domain.WtTemplate;

public interface XzssService extends ICoreService {

	
	/**
	 * 获取模板列表
	 * 
	 * @param pageNumber
	 *            页码
	 * @param pageSize
	 *            每页显示条数
	 * @return 分页的列表
	 */
	public PaginationSupport getXzssList(int pageNumber, int pageSize);
	public PaginationSupport getUndertakerList(int pageNumber, int pageSize,String tempundertaker);
	/**
	 * 通过ID获取模板对象
	 * 
	 * @param entityId
	 *            模板对象ID
	 * @return 模板对象
	 */
	public XzssInfo getXzssById(String entityId);
	
	public void saveXzssInfo(XzssInfo xzssInfo);
	
	public PaginationSupport getJieanList(int pageNumber, int pageSize, String tempuser, String tempstatus);
	public PaginationSupport getSearchList(int pageNumber, int pageSize, String receive_date, String undertaker_name, String fyundertaker_name, String app_name, String app_num, String app_type, String defendant, String agent, String jiguan_type, String jiguan_level, String jiguan, String request, String manage_type, String ismoney, String action_name, String action_id, String jieandate, String fuyi_id, String shen1, String shen2 );
	
	
/*	public List getAppListById(String entityId,String protype) ;
	
	public XzfyApp getAppById(int entityId);
	*/
	
	public void deleteXzssById(double entityId);


}
