package com.taiji.fzb.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzcjApp;
import com.taiji.fzb.domain.XzcjInfo;
import com.taiji.webTemplate.domain.WtTemplate;

public interface XzcjService extends ICoreService {

	
	/**
	 * 获取模板列表
	 * 
	 * @param pageNumber
	 *            页码
	 * @param pageSize
	 *            每页显示条数
	 * @return 分页的列表
	 */
	public PaginationSupport getXzcjList(int pageNumber, int pageSize);
	//public PaginationSupport getUndertakerList(int pageNumber, int pageSize,String tempundertaker);
	/**
	 * 通过ID获取模板对象
	 * 
	 * @param entityId
	 *            模板对象ID
	 * @return 模板对象
	 */
	public XzcjInfo getXzcjById(String entityId);
	
	public void saveXzcjInfo(XzcjInfo xzcjInfo);
	public void saveXzcjApp(XzcjApp xzcjApp);
	public PaginationSupport getJieanList(int pageNumber, int pageSize, String tempuser, String tempstatus);
	public PaginationSupport getSearchList(int pageNumber, int pageSize, String receive_date, String undertaker_name, String fyundertaker_name, String app_type, String app_num, String jiguan_type, String jiguan, String agent, String request, String ismoney, String action_name, String action_id, String manage_type, String fuyijielun, String caijuejielun, String jieandate);
									
	
	public List getAppListById(String entityId,String protype) ;
	//public PaginationSupport getAppListById(String entityId,String protype);
	
	public XzcjApp getAppById(int entityId);
	
	
	//public void deleteXzssById(double entityId);


}
