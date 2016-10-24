package com.taiji.tongJi.action;

import java.util.List;

import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzfyRecieve;
import com.taiji.tongJi.action.tongJiService.SearchToReceivingService;


public class AdvancedSearchToReceivingAction extends ProtectedDetailAction{

	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}
    
	private SearchToReceivingService searchToReceivingService;
	
	private PaginationSupport pageList=null;
	private Integer pNum=1;
	private Integer pageSize=15;
	private Integer totalPage=0;
	
	private List<XzfyRecieve> currentList=null;
//	private List<XzfyRecieve> allList=null;
	
	private XzfyRecieve xzfyReceive=null;
	
	/****************************************页面查询所用到的字段*************************************/
	private String behaviorName="";//被复议的具体行为-名称（接待事项）
	private String behaviorNum="";//被复议的具体行为-案号（接待事项）
	
//	private String appName="";//申请人姓名
	
	private String appType="";//申请人类别
	private String civilKeyword;//公民关键字
	private String legalKeyword;//法人关键字
	
	private String fyjgName;//复议机关名称（代号）
    private String respondent;//被申请人名称
    
    private String startJieDaiDate;//接待日期（起）
    private String endJieDaiDate;//接待日期（止）
    /************************************************************************************************/
    
    public String showJieDaiKeys(){
    	try{
    		
    	}
    	catch(Exception e){
    		e.printStackTrace();
    		return ERROR;
    	}
    	return SUCCESS;
    }
    
    public String showSearchResult(){
        try{       	       	
    		pageList=searchToReceivingService.getCurrentList(pNum,pageSize,appType,civilKeyword,legalKeyword,behaviorName,behaviorNum,fyjgName,respondent,startJieDaiDate,endJieDaiDate);
//    		allList=searchToReceivingService.getAllList(appType,civilKeyword,legalKeyword,behaviorName,behaviorNum,fyjgName,respondent,startJieDaiDate,endJieDaiDate);
    		currentList=pageList.getItems();
    		totalPage=pageList.getTotalPage();
    	}
    	catch(Exception e){
    		e.printStackTrace();
    		return ERROR;
    	}
    	return SUCCESS;
    }
    

    
	public PaginationSupport getPageList() {
		return pageList;
	}

	public void setPageList(PaginationSupport pageList) {
		this.pageList = pageList;
	}

	public Integer getpNum() {
		return pNum;
	}

	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public List<XzfyRecieve> getCurrentList() {
		return currentList;
	}

	public void setCurrentList(List<XzfyRecieve> currentList) {
		this.currentList = currentList;
	}

//	public List<XzfyRecieve> getAllList() {
//		return allList;
//	}
//
//	public void setAllList(List<XzfyRecieve> allList) {
//		this.allList = allList;
//	}

	public XzfyRecieve getXzfyReceive() {
		return xzfyReceive;
	}

	public void setXzfyReceive(XzfyRecieve xzfyReceive) {
		this.xzfyReceive = xzfyReceive;
	}

	public SearchToReceivingService getSearchToReceivingService() {
		return searchToReceivingService;
	}

	public void setSearchToReceivingService(
			SearchToReceivingService searchToReceivingService) {
		this.searchToReceivingService = searchToReceivingService;
	}

	public String getAppType() {
		return appType;
	}

	public void setAppType(String appType) {
		this.appType = appType;
	}

	public String getBehaviorName() {
		return behaviorName;
	}

	public void setBehaviorName(String behaviorName) {
		this.behaviorName = behaviorName;
	}

	public String getBehaviorNum() {
		return behaviorNum;
	}

	public void setBehaviorNum(String behaviorNum) {
		this.behaviorNum = behaviorNum;
	}

	public String getFyjgName() {
		return fyjgName;
	}

	public void setFyjgName(String fyjgName) {
		this.fyjgName = fyjgName;
	}

	public String getRespondent() {
		return respondent;
	}

	public String getCivilKeyword() {
		return civilKeyword;
	}

	public void setCivilKeyword(String civilKeyword) {
		this.civilKeyword = civilKeyword;
	}

	public String getLegalKeyword() {
		return legalKeyword;
	}

	public void setLegalKeyword(String legalKeyword) {
		this.legalKeyword = legalKeyword;
	}

	public void setRespondent(String respondent) {
		this.respondent = respondent;
	}

	public String getStartJieDaiDate() {
		return startJieDaiDate;
	}

	public void setStartJieDaiDate(String startJieDaiDate) {
		this.startJieDaiDate = startJieDaiDate;
	}

	public String getEndJieDaiDate() {
		return endJieDaiDate;
	}

	public void setEndJieDaiDate(String endJieDaiDate) {
		this.endJieDaiDate = endJieDaiDate;
	}
}