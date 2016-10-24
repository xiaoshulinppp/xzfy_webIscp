package com.taiji.fzb.webwork;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import slime.util.IOStream.IOStream;
import slime.util.calendar.CalendarUtil;
import slime.util.file.FileDelete;

import com.opensymphony.xwork.ActionContext;
import com.taiji.app.webTemplate.news.domain.NewsTemplate;
import com.taiji.app.webTemplate.news.service.NewsTemplateService;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyShenpi;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzfyService;
import com.taiji.user.domain.User;
import com.taiji.webTemplate.domain.WtClassify;


@SuppressWarnings("unchecked")
public class XzfyRecordAction extends ProtectedDetailAction {

	private static final long serialVersionUID = 1L;
	
	private RecordService recordService;
	
	private XzfyInfo xzfyInfo;
	
	private String xzfyId;
	
	private String appString;
	
	private User user;
	
	private String admit_name;
	
	private List userList;
	
	private String textId;
	
	private XzfyShenpi xzfyShenpi;
	
	private List xzfyCheckList;
	
	private List xzfyCheckList_la;
	
	private List xzfyCheckList_ja;
	
	private String checkDocType="0";
	
	private String isView="0";
	
	private String userId;
	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getIsView() {
		return isView;
	}

	public void setIsView(String isView) {
		this.isView = isView;
	}

	public String getCheckDocType() {
		return checkDocType;
	}

	public void setCheckDocType(String checkDocType) {
		this.checkDocType = checkDocType;
	}

	public List getXzfyCheckList_ja() {
		return xzfyCheckList_ja;
	}

	public void setXzfyCheckList_ja(List xzfyCheckList_ja) {
		this.xzfyCheckList_ja = xzfyCheckList_ja;
	}

	public List getXzfyCheckList_la() {
		return xzfyCheckList_la;
	}

	public void setXzfyCheckList_la(List xzfyCheckList_la) {
		this.xzfyCheckList_la = xzfyCheckList_la;
	}


	private int checkSize;
	
	private int la_checkSize;
	
	private int ja_checkSize;
	
	public int getJa_checkSize() {
		return ja_checkSize;
	}

	public void setJa_checkSize(int ja_checkSize) {
		this.ja_checkSize = ja_checkSize;
	}


	private int xzfyStatus;
	
	public int getXzfyStatus() {
		return xzfyStatus;
	}

	public void setXzfyStatus(int xzfyStatus) {
		this.xzfyStatus = xzfyStatus;
	}

	public int getLa_checkSize() {
		return la_checkSize;
	}

	public void setLa_checkSize(int la_checkSize) {
		this.la_checkSize = la_checkSize;
	}


	public int pageSize = 15;

	public int pageNum = 1;

	public int totalPage = 1;

	public int totalCount = 0;
	// 类成员

	// 公共功能变量
	


	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getCheckSize() {
		return checkSize;
	}

	public void setCheckSize(int checkSize) {
		this.checkSize = checkSize;
	}

	public List getXzfyCheckList() {
		return xzfyCheckList;
	}

	public void setXzfyCheckList(List xzfyCheckList) {
		this.xzfyCheckList = xzfyCheckList;
	}

	public XzfyShenpi getXzfyShenpi() {
		return xzfyShenpi;
	}

	public void setXzfyShenpi(XzfyShenpi xzfyShenpi) {
		this.xzfyShenpi = xzfyShenpi;
	}

	public String getTextId() {
		return textId;
	}

	public void setTextId(String textId) {
		this.textId = textId;
	}

	public List getUserList() {
		return userList;
	}

	public void setUserList(List userList) {
		this.userList = userList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getAdmit_name() {
		return admit_name;
	}

	public void setAdmit_name(String admit_name) {
		this.admit_name = admit_name;
	}

	public String getXzfyId() {
		return xzfyId;
	}

	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}

	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}

	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}



	public RecordService getRecordService() {
		return recordService;
	}

	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}
	
	public String saveToDoc(){
		if(xzfyInfo.getCheck_id()!=null && !xzfyInfo.getCheck_id().equals("0")){
			user=recordService.getUserById(xzfyInfo.getCheck_id());
			xzfyInfo.setCheck_name(user.getName());
			
		}
		XzfyInfo newXzfyInfo=recordService.getXzfyById(xzfyInfo.getId());
		checkInfo check=new checkInfo();
		newXzfyInfo=check.check_xzfyInfo(newXzfyInfo,xzfyInfo);
		String op="进行了保存并生成文书操作";
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),newXzfyInfo);
		recordService.update(newXzfyInfo);
		return SUCCESS;
	}

	public String addBzContent(){
		return SUCCESS;
	}
	
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	
	private List<XzfyInfo> shenpiList;
	
	public PaginationSupport getPageList() {
		return pageList;
	}

	public void setPageList(PaginationSupport pageList) {
		this.pageList = pageList;
	}

	public List<XzfyInfo> getShenpiList() {
		return shenpiList;
	}

	public void setShenpiList(List<XzfyInfo> shenpiList) {
		this.shenpiList = shenpiList;
	}

	public String getCheckListById(){
		try{
			xzfyInfo=new XzfyInfo();
			user = new User();
			user = (User) ActionContext.getContext().getSession().get(
					"_USER_LOGIN_");
			admit_name=user.getName();
			this.pageList = this.recordService.getShenpiListById(super.getPageNum(), this.pageSize,user.getId().toString());
			this.shenpiList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			return "success";

		} catch (Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	


	public String getCheckList(){

			user = new User();
			user = (User) ActionContext.getContext().getSession().get(
					"_USER_LOGIN_");
			admit_name=user.getName();
			this.pageList = this.recordService.getCheckList(super.getPageNum(), this.pageSize,xzfyInfo,user.getId().toString());
			this.shenpiList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			return "success";

	}
	
	private int totalCount1=1;
	private int totalCount2=1;
	private int totalCount3=1;
	private int totalCount4=1;
	
	private List totalList1;
	private List totalList2;
	private List totalList3;
	private List totalList4;
	
	private int pageNum1=1;
	private int pageNum2=1;
	private int pageNum3=1;
	private int pageNum4=1;
	
	private int totalPage1=1;
	public int getTotalPage1() {
		return totalPage1;
	}

	public void setTotalPage1(int totalPage1) {
		this.totalPage1 = totalPage1;
	}

	public int getTotalPage2() {
		return totalPage2;
	}

	public void setTotalPage2(int totalPage2) {
		this.totalPage2 = totalPage2;
	}

	public int getTotalPage3() {
		return totalPage3;
	}

	public void setTotalPage3(int totalPage3) {
		this.totalPage3 = totalPage3;
	}

	public int getTotalPage4() {
		return totalPage4;
	}

	public void setTotalPage4(int totalPage4) {
		this.totalPage4 = totalPage4;
	}


	private int totalPage2=1;
	private int totalPage3=1;
	private int totalPage4=1;
	
	public int getPageNum1() {
		return pageNum1;
	}

	public void setPageNum1(int pageNum1) {
		this.pageNum1 = pageNum1;
	}

	public int getPageNum2() {
		return pageNum2;
	}

	public void setPageNum2(int pageNum2) {
		this.pageNum2 = pageNum2;
	}

	public int getPageNum3() {
		return pageNum3;
	}

	public void setPageNum3(int pageNum3) {
		this.pageNum3 = pageNum3;
	}

	public int getPageNum4() {
		return pageNum4;
	}

	public void setPageNum4(int pageNum4) {
		this.pageNum4 = pageNum4;
	}
	
	public String totalPage_index1(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		if(xzfyInfo==null)
			xzfyInfo=new XzfyInfo();
		//获得本单位所有待办理案件
		PaginationSupport pageList1 = recordService.getTotalList(pageNum1, 5,xzfyInfo,user);
		totalList1 = pageList1.getItems();
		totalCount1=pageList1.getTotalCount();
		totalPage1=pageList1.getTotalPage();
		return "success";
	}
	public String returnTotalPage(){
		return "success";
	}
	
	public String showLogList(){
		totalList1 = recordService.getLogList(xzfyId);
		totalCount1=totalList1.size();
		return "success";
	}
	//主界面所有list对象获取方法
	public String showTotalPage(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		if(xzfyInfo==null)
			xzfyInfo=new XzfyInfo();
		//获得本单位所有待办理案件
		PaginationSupport pageList1 = recordService.getTotalList(1, 5,xzfyInfo,user);
		totalList1 = pageList1.getItems();
		totalCount1=pageList1.getTotalCount();
		totalPage1=pageList1.getTotalPage();
		
		//获得本人待审查案件
		PaginationSupport pageList2 = recordService.getUserShenChaList(1, 5,xzfyInfo,user.getId().toString());
		totalList2 = pageList2.getItems();
		totalCount2=pageList2.getTotalCount();
		
		//获得本人待办理案件
		PaginationSupport pageList3 = recordService.getUserBanLiList(1, 5,xzfyInfo,user.getId().toString());
		totalList3 = pageList3.getItems();
		totalCount3=pageList3.getTotalCount();
		
		//获得本人待审批案件
		PaginationSupport pageList4 = recordService.getCheckList(1, 5,xzfyInfo,user.getId().toString());
		totalList4 = pageList4.getItems();
		totalCount4=pageList4.getTotalCount();
		
		return "success";
	}
	
	public int getTotalCount1() {
		return totalCount1;
	}

	public void setTotalCount1(int totalCount1) {
		this.totalCount1 = totalCount1;
	}

	public int getTotalCount2() {
		return totalCount2;
	}

	public void setTotalCount2(int totalCount2) {
		this.totalCount2 = totalCount2;
	}

	public int getTotalCount3() {
		return totalCount3;
	}

	public void setTotalCount3(int totalCount3) {
		this.totalCount3 = totalCount3;
	}

	public int getTotalCount4() {
		return totalCount4;
	}

	public void setTotalCount4(int totalCount4) {
		this.totalCount4 = totalCount4;
	}

	public List getTotalList1() {
		return totalList1;
	}

	public void setTotalList1(List totalList1) {
		this.totalList1 = totalList1;
	}

	public List getTotalList2() {
		return totalList2;
	}

	public void setTotalList2(List totalList2) {
		this.totalList2 = totalList2;
	}

	public List getTotalList3() {
		return totalList3;
	}

	public void setTotalList3(List totalList3) {
		this.totalList3 = totalList3;
	}

	public List getTotalList4() {
		return totalList4;
	}

	public void setTotalList4(List totalList4) {
		this.totalList4 = totalList4;
	}

	public String 	showTotalList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		this.pageList = this.recordService.getTotalList(super.getPageNum(), pageSize,xzfyInfo,user);
		this.shenpiList = this.pageList.getItems();
		this.totalPage = this.pageList.getTotalPage();
		totalCount=pageList.getTotalCount();
		if(xzfyInfo==null)
			xzfyInfo=new XzfyInfo();
		return "success";
	}
	
	public String 	showUserShenChaList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		this.pageList = this.recordService.getUserShenChaList(super.getPageNum(), pageSize,xzfyInfo,user.getId().toString());
		this.shenpiList = this.pageList.getItems();
		this.totalPage = this.pageList.getTotalPage();
		totalCount=pageList.getTotalCount();
		if(xzfyInfo==null)
			xzfyInfo=new XzfyInfo();
		return "success";
	}
	
	public String viewlian(){
		xzfyInfo = recordService.getXzfyById(xzfyId);
		if(xzfyInfo.getIsBuzheng()==null)
			xzfyInfo.setIsBuzheng("0");
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		
		userList=recordService.getUserListById(user.getOrg().getId().toString());
		xzfyCheckList=recordService.getCheckListByXzfyID(xzfyId,"2");
		xzfyCheckList_la=recordService.getCheckListByXzfyID(xzfyId,"3");
		xzfyCheckList_ja=recordService.getCheckListByXzfyID(xzfyId,"11");
		checkSize=0;
		checkSize=xzfyCheckList.size();
		la_checkSize=0;
		la_checkSize=xzfyCheckList_la.size();
		ja_checkSize=0;
		ja_checkSize=xzfyCheckList_ja.size();
		if(xzfyInfo.getStatus()!=null && !xzfyInfo.getStatus().equals("") )
			xzfyStatus=Integer.parseInt(xzfyInfo.getStatus());
		return SUCCESS;
		
	}
			
	
	public String 	showUserBanLiList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		this.pageList = this.recordService.getUserBanLiList(super.getPageNum(), pageSize,xzfyInfo,user.getId().toString());
		this.shenpiList = this.pageList.getItems();
		this.totalPage = this.pageList.getTotalPage();
		totalCount=pageList.getTotalCount();
		if(xzfyInfo==null)
			xzfyInfo=new XzfyInfo();
		return "success";
	}
	
	public String handleOpreator(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		userList=recordService.getUserListById(user.getOrg().getId().toString());
		return SUCCESS;
	}	
	
	public String setHandleUser(){
		xzfyInfo=recordService.getXzfyById(xzfyId);
		if(typeId.equals("1")){
			user=recordService.getUserById(userId);
			xzfyInfo.setUser1_id(user.getId().toString());
			xzfyInfo.setUser1_name(user.getName());
			String op="指定立案审查人为："+user.getName();
			recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),recordService.getXzfyById(xzfyId));
			recordService.update(xzfyInfo);
		}else if(typeId.equals("2")){
			user=recordService.getUserById(userId);
			xzfyInfo.setUser2_id(user.getId().toString());
			xzfyInfo.setUser2_name(user.getName());
			String op="指定承办人为："+user.getName();
			recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),recordService.getXzfyById(xzfyId));
			recordService.update(xzfyInfo);
		}else if(typeId.equals("3")){
			user=recordService.getUserById(userId);
			xzfyInfo.setCheck_id(user.getId().toString());
			xzfyInfo.setCheck_name(user.getName());
			String op="指定审批人为："+user.getName();
			recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),recordService.getXzfyById(xzfyId));
			recordService.update(xzfyInfo);
		}
		return SUCCESS;
	}
	
	public String shenpiSubmit(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		xzfyInfo = recordService.getXzfyById(xzfyId);
		xzfyInfo.setCheck_id("0");
		xzfyInfo.setCheck_status("0");
		String op="执行审批操作";
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),xzfyInfo);
		recordService.update(xzfyInfo);
		Date date = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentTime=dateFormat.format(date);
		xzfyShenpi.setCheck_date(currentTime);
		xzfyShenpi.setXzfyInfo(xzfyInfo);
		xzfyShenpi.setCheck_type(xzfyInfo.getStatus());
		xzfyShenpi.setCheck_id(user.getId().toString());
		xzfyShenpi.setCheck_name(user.getName());
		recordService.save(xzfyShenpi);
		return "success";
	}
	
	public String lianTiqu(){
		xzfyInfo = recordService.getXzfyById(xzfyId);
		if(xzfyInfo.getIsBuzheng()==null)
			xzfyInfo.setIsBuzheng("0");
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		if(xzfyInfo.getUser1_id()==null || xzfyInfo.getUser1_id().equals("")){
			xzfyInfo.setUser1_name(user.getName());
			xzfyInfo.setUser1_id(user.getId().toString());
			recordService.save(xzfyInfo);	
		}else if(xzfyInfo.getUser1_name()==null || xzfyInfo.getUser1_name().equals("")){
			xzfyInfo.setUser1_name(user.getName());
			xzfyInfo.setUser1_id(user.getId().toString());
			recordService.save(xzfyInfo);
		}
		admit_name=user.getName();
		
		userList=recordService.getUserListById(user.getOrg().getId().toString());
		xzfyCheckList=recordService.getCheckListByXzfyID(xzfyId,"2");
		xzfyCheckList_la=recordService.getCheckListByXzfyID(xzfyId,"3");
		xzfyCheckList_ja=recordService.getCheckListByXzfyID(xzfyId,"11");
		checkSize=0;
		checkSize=xzfyCheckList.size();
		la_checkSize=0;
		la_checkSize=xzfyCheckList_la.size();
		ja_checkSize=0;
		ja_checkSize=xzfyCheckList_ja.size();
		if(xzfyInfo.getStatus()!=null && !xzfyInfo.getStatus().equals("") )
			xzfyStatus=Integer.parseInt(xzfyInfo.getStatus());
		return SUCCESS;
	}
	
	public String subCheckCase(){
		if(xzfyInfo.getCheck_id()!=null && !xzfyInfo.getCheck_id().equals("0")){
			user=recordService.getUserById(xzfyInfo.getCheck_id());
			xzfyInfo.setCheck_name(user.getName());
			
		}
		XzfyInfo newXzfyInfo=recordService.getXzfyById(xzfyInfo.getId());
		checkInfo check=new checkInfo();
		newXzfyInfo=check.check_xzfyInfo(newXzfyInfo,xzfyInfo);
		String op="提交审批";
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),newXzfyInfo);
		recordService.update(newXzfyInfo);
		
		return SUCCESS;
	}
	
	
	public String saveLianshencha1(){
		xzfyId=xzfyInfo.getId();
		XzfyInfo newXzfyInfo=recordService.getXzfyById(xzfyId);
		//XzfyInfo oldObject=recordService.getXzfyById(xzfyInfo.getId());
		checkInfo check=new checkInfo();
		newXzfyInfo=check.check_xzfyInfo(newXzfyInfo,xzfyInfo);
		String op="修改立案信息";
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),newXzfyInfo);
		recordService.update(newXzfyInfo);
		
		return SUCCESS;
	}
	
	private String shenpiren;
	private String shenpiyijian;
	
	public String getShenpiren() {
		return shenpiren;
	}

	public void setShenpiren(String shenpiren) {
		this.shenpiren = shenpiren;
	}

	public String getShenpiyijian() {
		return shenpiyijian;
	}

	public void setShenpiyijian(String shenpiyijian) {
		this.shenpiyijian = shenpiyijian;
	}

	
	private String typeId;// 1、立案审查人；2、承办人；3、审批人
	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}


	public String finishCheckCase(){
		XzfyShenpi shenpiModel=new XzfyShenpi();
		XzfyInfo newXzfyInfo=recordService.getXzfyById(xzfyInfo.getId());
		checkInfo check=new checkInfo();
		newXzfyInfo=check.check_xzfyInfo(newXzfyInfo,xzfyInfo);
		String op="执行完成补正操作";
		recordService.save_log("2",op,xzfyInfo.getId(),newXzfyInfo);
		recordService.update(newXzfyInfo);
		if(shenpiren!=null && !shenpiren.equals("")){
			shenpiModel.setCheck_name(shenpiren);
			shenpiModel.setCheck_result("1");
			shenpiModel.setCheck_type("2");
			shenpiModel.setCheck_advise(shenpiyijian);
			Date date = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime=dateFormat.format(date);
			shenpiModel.setCheck_date(currentTime);
			shenpiModel.setXzfyInfo(xzfyInfo);
			//recordService.save(shenpiModel);
		}
		
		
		return SUCCESS;
	}
	
	private String lashenpiren;
	private String lashenpiyijian;
	
	
	private String jashenpiren;
	public String getJashenpiren() {
		return jashenpiren;
	}

	public void setJashenpiren(String jashenpiren) {
		this.jashenpiren = jashenpiren;
	}


	private String jashenpiyijian;
	
	public String getJashenpiyijian() {
		return jashenpiyijian;
	}

	public void setJashenpiyijian(String jashenpiyijian) {
		this.jashenpiyijian = jashenpiyijian;
	}

	public String getLashenpiren() {
		return lashenpiren;
	}

	public void setLashenpiren(String lashenpiren) {
		this.lashenpiren = lashenpiren;
	}

	public String getLashenpiyijian() {
		return lashenpiyijian;
	}

	public void setLashenpiyijian(String lashenpiyijian) {
		this.lashenpiyijian = lashenpiyijian;
	}

	public String finishLianCase(){
		XzfyShenpi shenpiModel=new XzfyShenpi();
		XzfyInfo newXzfyInfo=recordService.getXzfyById(xzfyInfo.getId());
		checkInfo check=new checkInfo();
		newXzfyInfo=check.check_xzfyInfo(newXzfyInfo,xzfyInfo);
		String op="执行立案操作";
		recordService.save_log("2",op,xzfyInfo.getId(),newXzfyInfo);
		recordService.update(newXzfyInfo);
		if(lashenpiren!=null && !lashenpiren.equals("")){
			shenpiModel.setCheck_name(lashenpiren);
			shenpiModel.setCheck_result("1");
			shenpiModel.setCheck_type("3");
			shenpiModel.setCheck_advise(lashenpiyijian);
			Date date = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime=dateFormat.format(date);
			shenpiModel.setCheck_date(currentTime);
			shenpiModel.setXzfyInfo(xzfyInfo);
			recordService.save(shenpiModel);
		}
		
		
		return SUCCESS;
	}
	
	public String shenpiInfo(){
		xzfyInfo=recordService.getXzfyById(xzfyId);
		if(!checkDocType.equals("0"))
			xzfyInfo.setStatus(checkDocType);
		xzfyCheckList=recordService.getCheckListByXzfyID(xzfyId,xzfyInfo.getStatus());
		return SUCCESS;
	}
	
	public String finishJieanCase(){
		XzfyShenpi shenpiModel=new XzfyShenpi();
		XzfyInfo newXzfyInfo=recordService.getXzfyById(xzfyInfo.getId());
		checkInfo check=new checkInfo();
		newXzfyInfo=check.check_xzfyInfo(newXzfyInfo,xzfyInfo);
		String op="执行结案操作";
		recordService.save_log("11",op,xzfyInfo.getId(),newXzfyInfo);
		recordService.update(newXzfyInfo);
		if(jashenpiren!=null && !jashenpiren.equals("")){
			shenpiModel.setCheck_name(jashenpiren);
			shenpiModel.setCheck_result("1");
			shenpiModel.setCheck_type("11");
			shenpiModel.setCheck_advise(jashenpiyijian);
			Date date = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String currentTime=dateFormat.format(date);
			shenpiModel.setCheck_date(currentTime);
			shenpiModel.setXzfyInfo(xzfyInfo);
			recordService.save(shenpiModel);
		}
		
		
		return SUCCESS;
	}
	
	public PaginationSupport list = new PaginationSupport();

	private List<XzfyInfo> xzfyList = new ArrayList<XzfyInfo>();
	


	public PaginationSupport getList() {
		return list;
	}

	public void setList(PaginationSupport list) {
		this.list = list;
	}

	public List<XzfyInfo> getXzfyList() {
		return xzfyList;
	}

	public void setXzfyList(List<XzfyInfo> xzfyList) {
		this.xzfyList = xzfyList;
	}

	public String getCaseList() throws Exception {
		this.list = recordService.getXzfyListByStatus(pageNum,pageSize);
		this.totalPage = this.list.getTotalPage();
		this.setXzfyList(this.list.getItems());
		return SUCCESS;
	}
	
	
	public String appAnjuView(){
		xzfyInfo=recordService.getXzfyById(xzfyId);
		Set appSet=new HashSet();
		appSet=xzfyInfo.getXzfyApps();
		Iterator it=appSet.iterator();
		int i=0;
		while(it.hasNext()){
			XzfyApp xzfyApp=new XzfyApp();
			xzfyApp=(XzfyApp)it.next();
			if(i==0)
				appString=xzfyApp.getApp_name();
			else
				appString=appString+"、"+xzfyApp.getApp_name();
			i++;
		}

		return SUCCESS;
	}
	
	public String viewMulu(){
		xzfyInfo=recordService.getXzfyById(xzfyId);
		return SUCCESS;
	}

	public String getAppString() {
		return appString;
	}

	public void setAppString(String appString) {
		this.appString = appString;
	}

	@Override
	public Class <XzfyInfo>getPersistentClass() {
		// TODO Auto-generated method stub
		return XzfyInfo.class;
	}


}
