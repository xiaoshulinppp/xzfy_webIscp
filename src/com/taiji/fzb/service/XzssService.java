package com.taiji.fzb.service;

import java.util.List;

import com.taiji.archive.domain.Archive;
import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyCompany;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzssFile;
import com.taiji.fzb.domain.XzssInfo;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
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
	public PaginationSupport getSearchList(int pageNumber, int pageSize,XzssInfo xzssInfo,String receiveCaseDate1,String receiveCaseDate2,String jieanDate1,String jieanDate2,String tiaojie);
	public PaginationSupport getSearchQuanShiList(int pageNumber, int pageSize,XzssInfo xzssInfo,String receiveCaseDate1,String receiveCaseDate2,String jieanDate1,String jieanDate2,String tiaojie );
	
	public PaginationSupport getXzfyList(int pageNumber, int pageSize,String applicant, String undertaker, String undertakerSecond,String caseNo, String representative, String caseNumBFY,String caseNameBFY, String respondent);
	public PaginationSupport getXzfyOrgList(int pageNumber, int pageSize,XzfyInfo xzfyInfo);
	public PaginationSupport getXzfyDefendantList(int pageNumber, int pageSize,XzfyInfo xzfyInfo);
	public PaginationSupport getXzfyPageList(int pageNumber, int pageSize,User user);
	public PaginationSupport getXzssShen1List(int pageNumber,int pageSize,XzssInfo xzssInfo);
	public PaginationSupport getXzssShen2List(int pageNumber,int pageSize,XzssInfo xzssInfo);
	public List getOrgFy();
	public List<String> getCaseNumIndex();
	public List getXzfyApp(String xzfyId);
/*	public List getAppListById(String entityId,String protype) ;
	
	public XzfyApp getAppById(int entityId);
	*/
	
	public void deleteXzssById(String entityId);
	public XzfyInfo getXzfyById(String xzfyId);
	
	//案卷管理
	public XzssFile getXzssFileById(String id);
	public List<XzssFile> getXzssFileByXzssId(String xzssId);
	public void deleteXzssFile(String xzssId);
	//修改日志
	public void  save_log(String xzssId,String objName, String oldString,String newString);
	public List getLogList(String xzssId);
	public Org getOrg();
	public String getYingSuNum();
	//案号查重
	public XzssInfo getXzssInfoByCaseNum(String caseName);
	//获取专报号流水号
	public List<String> getZbh();

}
