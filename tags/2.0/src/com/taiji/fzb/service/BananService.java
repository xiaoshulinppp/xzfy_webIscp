package com.taiji.fzb.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyDftz;
import com.taiji.fzb.domain.XzfyShenpi;
import com.taiji.webTemplate.domain.WtTemplate;

public interface BananService extends ICoreService {

	
	/**
	 * 获取模板列表
	 * 
	 * @param pageNumber
	 *            页码
	 * @param pageSize
	 *            每页显示条数
	 * @return 分页的列表
	 */
	public PaginationSupport getBananListByPage(int pageNumber, int pageSize);
	public List getBananList();
	public List getXcdcListById(String entityId);
	public List getDftzListById(String entityId);
	public List getShenpiListById(String entityId);
	public List getShenpiListById1(String entityId);
	public List getShenpiListById2(String entityId);
	public List getShenpiListById3(String entityId);
	public XzfyInfo getXzfyById(String entityId);
	public void savebanan(XzfyInfo xzfyInfo);
	public void saveshenpi(XzfyShenpi xzfyShenpi);
	public PaginationSupport getDftzListByPage(int pageNumber, int pageSize,String id);
	public XzfyDftz getDftzById(int id);
	public List findBySQL(String hql);
	public PaginationSupport getWeibanjieListByPage(int pageNumber, int pageSize);
	public PaginationSupport getShenliqixian_20_ListByPage(int pageNumber, int pageSize, String locbm);
	public PaginationSupport getShenliqixian_10_ListByPage(int pageNumber, int pageSize, String locbm);
	public PaginationSupport getShenliqixian_chaoqi_ListByPage(int pageNumber, int pageSize, String locbm);
	public PaginationSupport getZhongzhiListByPage(int pageNumber, int pageSize, String locbm);
	public PaginationSupport getNewdaifenpeiListByPage(int pageNumber, int pageSize, String locbm);
	public PaginationSupport getWeizhidingListByPage(int pageNumber, int pageSize, String locbm);
	public PaginationSupport getDailianshenchaListByPage(int pageNumber, int pageSize, Number userid);
	public PaginationSupport getDaibanliListByPage(int pageNumber, int pageSize, Number userid);
	public PaginationSupport getDaishenpiListByPage(int pageNumber, int pageSize, Number userid);
	public PaginationSupport getDailianshenpiListByPage(int pageNumber, int pageSize, Number userid);
	public PaginationSupport getWeibanjie_sub_ListByPage(int pageNumber, int pageSize, Number orgid);
	public PaginationSupport getShenliqixian_sub40_ListByPage(int pageNumber, int pageSize, Number orgid);
	public PaginationSupport getShenliqixian_sub50_ListByPage(int pageNumber, int pageSize, Number orgid);
	public PaginationSupport getShenliqixian_subchaoqi_ListByPage(int pageNumber, int pageSize, Number orgid);
	
	public List<XzfyInfo> getWeibanjieList();
	public List<XzfyInfo> getShenliqixian_20_List(String locbm);
	public List<XzfyInfo> getShenliqixian_10_List(String locbm);
	public List<XzfyInfo> getShenliqixian_chaoqi_List(String locbm);
	public List<XzfyInfo> getZhongzhiList(String locbm);
	public List<XzfyInfo> getNewdaifenpeiList(String locbm);
	public List<XzfyInfo> getWeizhidingList(String locbm);
	public List<XzfyInfo> getDailianshenchaList(Number userid);
	public List<XzfyInfo> getDaibanliList(Number userid);
	public List<XzfyInfo> getDaishenpiList(Number userid);
	public List<XzfyInfo> getDailianshenpiList(Number userid);
	public List<XzfyInfo> getWeibanjie_sub_List(Number orgid);
	public List<XzfyInfo> getShenliqixian_sub40_List(Number orgid);
	public List<XzfyInfo> getShenliqixian_sub50_List(Number orgid);
	public List<XzfyInfo> getShenliqixian_subchaoqi_List(Number orgid);
	
	//public PaginationSupport getUndertakerList(int pageNumber, int pageSize,String tempundertaker);
	
	 /*public XzcjInfo getXzcjById(String entityId);
	
	public void saveXzcjInfo(XzcjInfo xzcjInfo);
	public void saveXzcjApp(XzcjApp xzcjApp);
	public PaginationSupport getJieanList(int pageNumber, int pageSize, String tempuser, String tempstatus);
	public PaginationSupport getSearchList(int pageNumber, int pageSize, String receive_date, String undertaker_name, String fyundertaker_name, String app_type, String app_num, String jiguan_type, String jiguan, String agent, String request, String ismoney, String action_name, String action_id, String manage_type, String fuyijielun, String caijuejielun, String jieandate);
									
	
	public List getAppListById(String entityId,String protype) ;
	//public PaginationSupport getAppListById(String entityId,String protype);
	
	public XzcjApp getAppById(int entityId);
	
	
	//public void deleteXzssById(double entityId);
*/

}
