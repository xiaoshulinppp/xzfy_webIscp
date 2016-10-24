package com.taiji.fzb.webwork;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;

import slime.util.IOStream.IOStream;
import slime.util.file.FileDelete;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.Member;
import com.taiji.fzb.domain.XzfyCompany;
import com.taiji.fzb.domain.XzfyKeyword;
import com.taiji.fzb.domain.XzfyOtherSuggest;
import com.taiji.fzb.domain.XzfyQuestionnaire;
import com.taiji.fzb.domain.XzfyWeiban;

import com.taiji.fzb.service.BananService;
import com.taiji.fzb.service.ComService;
import com.taiji.fzb.service.RecordService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.webTemplate.domain.WtTemplate;
import com.taiji.webTemplate.service.WtTemplateService;

public class ComAction extends ProtectedDetailAction {

	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}
	
	private User user;
	private String admit_name;
	private ComService comService;
	private PaginationSupport pageList;
	private Integer pageSize = 15; // 分页列表每页显示个数

	private Integer totalPage = 0; // 分页列表页面总数

//	private List allMemList;
	private Integer pNum=1;

	private List memberList;
	private Member member;
	private String comttId;
//	private String action;
	  private String tempName="";
	  private String sexy="";
	  private String phone="";

	  private String tempPosition="";

	  private String tempRecordDate="";
	  private String work="";
	  private String education="";
	  private String tempType="";
    private String toDate;
    
	private XzfyCompany xzfyCom;
	
	private Integer id;
	
	public String showMemList() {
		try {	
			user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		    Org org=this.recordService.getRootOrg(this.recordService.getOrg().getLocbm());
//			tempName = new String(tempName.getBytes("ISO8859-1"), "UTF-8");
//			tempPosition = new String(tempPosition.getBytes("ISO8859-1"), "UTF-8");
//			education = new String(education.getBytes("ISO8859-1"), "UTF-8");
//			tempType = new String(tempType.getBytes("ISO8859-1"), "UTF-8");

//			action="showMemList";
//			allMemList=comService.getAllMemList(tempName,sexy,tempPosition,tempType,phone,tempRecordDate,age,education,org.getLocbm());
			this.pageList = this.comService.getMemList(this.pNum, this.pageSize,tempName,sexy,tempPosition,tempType,phone,tempRecordDate,work,education,org.getLocbm());
			this.memberList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();	
			
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String createNewComt(){
		try {
			user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		    Org org=this.recordService.getRootOrg(this.recordService.getOrg().getLocbm());
		    locbm = org.getLocbm();
			toDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String saveNewComt(){
		try {
			comService.saveMem(member);	
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String updateComt(){
		member=comService.getMemById(comttId);
		return SUCCESS;
	}
	
	public String updateCommittee(){
		comService.updateMem(member);
		return SUCCESS;
	}
	
	public String deleteComt(){
		comService.deleteMemById(comttId);
		return SUCCESS;
	}
	
	
	
/*******************************************************当前用户所属单位*********************************************/	
	
	/*****************新增委办、关键字*******************/
	private String locbm;
	private String[] locbmwb;
	private List weibanList;
	private List keywordList;
	private RecordService recordService = null;
	private BananService bananService = null;
	private XzfyKeyword xzfyKeyword=new XzfyKeyword();
	private XzfyWeiban xzfyWeiban;
	private int keywordId;
	
	
	/***********************************全市所有单位列表****************************************/
	private List companyList;//单位列表
	private String specialFlag;//特殊标识
	
	public String gotoCompaniesIndex(){
		return SUCCESS;
	}
	
	public String gotoAllCompanyList(){
		try{
			pageList = comService.findAllCompanyList(this.pNum, this.pageSize,xzfyCom);
			companyList = pageList.getItems();
			totalPage = pageList.getTotalPage();
			totlPg = pageList.getTotalCount();
			
			return SUCCESS;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return ERROR;
		}
		
	}	
	
	
	
	public String getSpecialFlag() {
		return specialFlag;
	}

	public void setSpecialFlag(String specialFlag) {
		this.specialFlag = specialFlag;
	}

	/**********************查看单位详细信息**************************/
	public String viewCompanyDetail(){
		try{
			xzfyCom = comService.findXzfyCompanyByIdAndLocbm(id,locbm);
			
			weibanList=bananService.getXzfyWeibanListByLocbm(locbm);
			keywordList=bananService.getXzfyKeywordListByLocbm(locbm);
			
			return SUCCESS;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return ERROR;
		}
	}
	
	public List getCompanyList() {
		return companyList;
	}

	public void setCompanyList(List companyList) {
		this.companyList = companyList;
	}

	/**************************************************/
	
	public String showCorpInfo(){
		try{
		    user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		    Org org=this.recordService.getRootOrg(this.recordService.getOrg().getLocbm());
            xzfyCom=comService.getXzfyComById(org.getLocbm(),org.getName());
            
            locbm = org.getLocbm();
			weibanList=bananService.getXzfyWeibanListByLocbm(locbm);
			keywordList=bananService.getXzfyKeywordListByLocbm(locbm);
        
		    return SUCCESS;
		}
		catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String showImprovment(){
		try{
		   xzfyCom=comService.getXzfyById(id);
		   locbm = this.recordService.getOrg().getLocbm();
		   weibanList=bananService.getXzfyWeibanListByLocbm(locbm);
		   keywordList=bananService.getXzfyKeywordListByLocbm(locbm);
		   
		   return SUCCESS;
		}
		catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String saveKeyword(){
		try{
			xzfyKeyword.setLocbm(locbm);
			bananService.save(xzfyKeyword);
		}
		catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	public String deleteKeyword(){
		try{
			bananService.deleteKeyword(keywordId);
		}
		catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	public String gotoSaveInfo(){
		try{
			 String dateFlag = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss").format(new Date());
			 xzfyCom.setUpdateDateFlag(dateFlag);
			 
			 user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
			 xzfyCom.setCorpCode(this.recordService.getOrg().getLocbm());
			 
			 if(!(xzfyCom.getCar_Casing().equals("1"))){
				 xzfyCom.setQuantity_Casing("");
			 }
			 
			 if(!(xzfyCom.getPlaceSetUp().equals("1"))){
				 xzfyCom.setFullNameRect("");
				 xzfyCom.setDetailAddressRect("");
				 xzfyCom.setForeignPhoneRect("");
			 }
             comService.updateXzfyCom(xzfyCom);
             
             if(locbmwb==null){bananService.deleteWeiban(locbm);}
 			 else{
 			    bananService.deleteWeiban(locbm);
 				for(int i=0;i<locbmwb.length;i++){
 					xzfyWeiban = new XzfyWeiban();
 					xzfyWeiban.setLocbmdq(locbm);
 					xzfyWeiban.setLocbmwb(locbmwb[i]);
 					if(locbmwb[i].equals("0000")){xzfyWeiban.setOrgname("北京市人民政府");}
 					else if(locbmwb[i].equals("0100")){xzfyWeiban.setOrgname("东城区人民政府");}
 					else if(locbmwb[i].equals("0200")){xzfyWeiban.setOrgname("西城区人民政府");}
 					else if(locbmwb[i].equals("0500")){xzfyWeiban.setOrgname("朝阳区人民政府");}
 					else if(locbmwb[i].equals("0600")){xzfyWeiban.setOrgname("海淀区人民政府");}
 					else if(locbmwb[i].equals("0700")){xzfyWeiban.setOrgname("丰台区人民政府");}
 					else if(locbmwb[i].equals("0800")){xzfyWeiban.setOrgname("石景山区人民政府");}
 					else if(locbmwb[i].equals("0900")){xzfyWeiban.setOrgname("门头沟区人民政府");}
 					else if(locbmwb[i].equals("1000")){xzfyWeiban.setOrgname("房山区人民政府");}
 					else if(locbmwb[i].equals("1100")){xzfyWeiban.setOrgname("通州区人民政府");}
 					else if(locbmwb[i].equals("1200")){xzfyWeiban.setOrgname("顺义区人民政府");}
 					else if(locbmwb[i].equals("1300")){xzfyWeiban.setOrgname("大兴区人民政府");}
 					else if(locbmwb[i].equals("1400")){xzfyWeiban.setOrgname("昌平区人民政府");}
 					else if(locbmwb[i].equals("1500")){xzfyWeiban.setOrgname("平谷区人民政府");}
 					else if(locbmwb[i].equals("1600")){xzfyWeiban.setOrgname("怀柔区人民政府");}
 					else if(locbmwb[i].equals("1700")){xzfyWeiban.setOrgname("密云县人民政府");}
 					else if(locbmwb[i].equals("1800")){xzfyWeiban.setOrgname("延庆县人民政府");}
 					else{xzfyWeiban.setOrgname("错误");}
 					bananService.save(xzfyWeiban);
 			     }
 			}
		     return SUCCESS;
		}
		catch(Exception e){
			e.printStackTrace(); 
			return ERROR;
		}
	}
	
	
/********************************************************当前用户所属单位********************************************/

    public String getLocbm() {
		return locbm;
	}

	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}

	public String[] getLocbmwb() {
		return locbmwb;
	}

	public void setLocbmwb(String[] locbmwb) {
		this.locbmwb = locbmwb;
	}

	public List getWeibanList() {
		return weibanList;
	}

	public void setWeibanList(List weibanList) {
		this.weibanList = weibanList;
	}

	public List getKeywordList() {
		return keywordList;
	}

	public void setKeywordList(List keywordList) {
		this.keywordList = keywordList;
	}

	public RecordService getRecordService() {
		return recordService;
	}

	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	public BananService getBananService() {
		return bananService;
	}

	public void setBananService(BananService bananService) {
		this.bananService = bananService;
	}

	public XzfyKeyword getXzfyKeyword() {
		return xzfyKeyword;
	}

	public void setXzfyKeyword(XzfyKeyword xzfyKeyword) {
		this.xzfyKeyword = xzfyKeyword;
	}

	public XzfyWeiban getXzfyWeiban() {
		return xzfyWeiban;
	}

	public void setXzfyWeiban(XzfyWeiban xzfyWeiban) {
		this.xzfyWeiban = xzfyWeiban;
	}

	public int getKeywordId() {
		return keywordId;
	}

	public void setKeywordId(int keywordId) {
		this.keywordId = keywordId;
	}

/*************************************************************在线调查************************************************************/
	
	private String tempDate;
//	private User user;
	private XzfyQuestionnaire xzfyQuestionnaire;
	private String xmlString;
	
	private String tempDate0;
	private XzfyOtherSuggest xzfyOtherSuggest;
	
	public String showQustnPage(){
		try{
		     tempDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		     tempDate0=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	    }
		catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;	
	}
	
	
	public String saveQustnResult(){
		try{
//			 System.out.println("1");
			 user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
//			 System.out.println(user.getName());
			 xzfyQuestionnaire.setName(user.getName());
//			 System.out.println(xzfyQuestionnaire.getCommitDate());
//			 System.out.println(xzfyQuestionnaire.getName());
//			 System.out.println(xzfyQuestionnaire.getSelectValue());
			 comService.saveXzfyQustn(xzfyQuestionnaire);
//			 System.out.println("4");
	    }
		catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;	
	}
	
	public String showPieChart(){
		try{
			xmlString=comService.getXmlString();
		}
		catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String saveOtherSuggResult(){
		try{
			 user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");	 
			 xzfyOtherSuggest.setFullName(user.getName());
			 comService.saveXzfySuggest(xzfyOtherSuggest);
	    }
		catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;	
	}
	
	/**********************其它意见查看结果*************************/
	private PaginationSupport pglist;
	private Integer totlPg=0;
	private Integer pgSize=15;
	private Integer currentPgNo=1;
	
	private List opinionList;
//	private List allOtherList;
	private XzfyOtherSuggest reply;
	
	
	public XzfyOtherSuggest getReply() {
		return reply;
	}

	public void setReply(XzfyOtherSuggest reply) {
		this.reply = reply;
	}

	public String showOtherStatis(){
		try{
//			System.out.println("为啥1");
			pglist=comService.getOpinionList(currentPgNo,pgSize);
//			System.out.println("为啥2");
			opinionList=pglist.getItems();
//			System.out.println("为啥3"+opinionList.size());
			totlPg = this.pglist.getTotalPage();
//			System.out.println("为啥4");
//			allOtherList=comService.getAllOtherList();
			}

		catch(Exception e)
		{
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
	public String viewDetail(){
		xzfyOtherSuggest = comService.getSuggestById(id);
		opinionList = comService.getReplyList(id);
		return SUCCESS;
	}
	public String saveReply(){
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");	 
		 reply.setFullName(user.getName());
		 reply.setParentId(id);
		 tempDate0=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		 reply.setSubmitTime(tempDate0);
		 comService.saveXzfySuggest(reply);
		 return SUCCESS;
	}
	
	public PaginationSupport getPglist() {
		return pglist;
	}

	public void setPglist(PaginationSupport pglist) {
		this.pglist = pglist;
	}

	public Integer getTotlPg() {
		return totlPg;
	}

	public void setTotlPg(Integer totlPg) {
		this.totlPg = totlPg;
	}

	public Integer getPgSize() {
		return pgSize;
	}

	public void setPgSize(Integer pgSize) {
		this.pgSize = pgSize;
	}

	public Integer getCurrentPgNo() {
		return currentPgNo;
	}

	public void setCurrentPgNo(Integer currentPgNo) {
		this.currentPgNo = currentPgNo;
	}

	public List getOpinionList() {
		return opinionList;
	}

	public void setOpinionList(List opinionList) {
		this.opinionList = opinionList;
	}

	
//	public List getAllOtherList() {
//		return allOtherList;
//	}
//
//	public void setAllOtherList(List allOtherList) {
//		this.allOtherList = allOtherList;
//	}

	/**********************其它意见查看结果*************************/
	
	public String getTempDate() {
		return tempDate;
	}


	public void setTempDate(String tempDate) {
		this.tempDate = tempDate;
	}
  
	public XzfyQuestionnaire getXzfyQuestionnaire() {
		return xzfyQuestionnaire;
	}


	public void setXzfyQuestionnaire(XzfyQuestionnaire xzfyQuestionnaire) {
		this.xzfyQuestionnaire = xzfyQuestionnaire;
	}

    
	public String getXmlString() {
		return xmlString;
	}


	public void setXmlString(String xmlString) {
		this.xmlString = xmlString;
	}

    
    public String getTempDate0() {
		return tempDate0;
	}

	public void setTempDate0(String tempDate0) {
		this.tempDate0 = tempDate0;
	}

	public XzfyOtherSuggest getXzfyOtherSuggest() {
		return xzfyOtherSuggest;
	}

	public void setXzfyOtherSuggest(XzfyOtherSuggest xzfyOtherSuggest) {
		this.xzfyOtherSuggest = xzfyOtherSuggest;
	}

/*************************************************************在线调查************************************************************/
	


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getAdmit_name() {
		return admit_name;
	}


	public void setAdmit_name(String admitName) {
		admit_name = admitName;
	}


	public PaginationSupport getPageList() {
		return pageList;
	}

	public void setPageList(PaginationSupport pageList) {
		this.pageList = pageList;
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
	
	public String getSexy() {
		return sexy;
	}

	public void setSexy(String sexy) {
		this.sexy = sexy;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTempPosition() {
		return tempPosition;
	}

	public void setTempPosition(String tempPosition) {
		this.tempPosition = tempPosition;
	}

	public String getTempRecordDate() {
		return tempRecordDate;
	}

	public void setTempRecordDate(String tempRecordDate) {
		this.tempRecordDate = tempRecordDate;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getTempType() {
		return tempType;
	}

	public void setTempType(String tempType) {
		this.tempType = tempType;
	}

	public Integer getpNum() {
		return pNum;
	}

	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}

//	public List getAllMemList() {
//		return allMemList;
//	}
//
//	public void setAllMemList(List allMemList) {
//		this.allMemList = allMemList;
//	}

	public String getComttId() {
		return comttId;
	}

	public void setComttId(String comttId) {
		this.comttId = comttId;
	}

//	public String getAction() {
//		return action;
//	}
//
//	public void setAction(String action) {
//		this.action = action;
//	}

	public ComService getComService() {
		return comService;
	}

	public void setComService(ComService comService) {
		this.comService = comService;
	}

	public List getMemberList() {
		return memberList;
	}

	public void setMemberList(List memberList) {
		this.memberList = memberList;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getTempName() {
		return tempName;
	}

	public void setTempName(String tempName) {
		this.tempName = tempName;
	}

	public String getToDate() {
		return toDate;
	}


	public void setToDate(String toDate) {
		this.toDate = toDate;
	}


	public XzfyCompany getXzfyCom() {
		return xzfyCom;
	}


	public void setXzfyCom(XzfyCompany xzfyCom) {
		this.xzfyCom = xzfyCom;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}
    
}
