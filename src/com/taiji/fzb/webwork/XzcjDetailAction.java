package com.taiji.fzb.webwork;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import slime.util.IOStream.IOStream;
import slime.util.file.FileDelete;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzcjApp;
import com.taiji.fzb.domain.XzcjInfo;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzcjService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.webTemplate.domain.WtTemplate;
import com.taiji.webTemplate.service.WtTemplateService;

@SuppressWarnings("unchecked")
public class XzcjDetailAction extends ProtectedDetailAction {

	private static final long serialVersionUID = 1L;
	// 类成员
	// 公共功能变量
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private Integer pageSize = 15; // 分页列表每页显示个数
	private Integer totalPage = 0; // 分页列表页面总数

	private XzcjService xzcjService = null; // 模板业务层方法
	public XzcjService getXzcjService() {
		return xzcjService;
	}
	public void setXzcjService(XzcjService xzcjService) {
		this.xzcjService = xzcjService;
	}
	
	private XzcjInfo xzcjInfo = new XzcjInfo();
	
	public XzcjInfo getXzcjInfo() {
		return this.xzcjInfo;
	}
	public void setXzcjInfo(XzcjInfo xzcjInfo) {
		this.xzcjInfo=xzcjInfo;
	}
	
	private XzcjApp xzcjApp;
	
	public XzcjApp getXzcjApp() {
		return xzcjApp;
	}
	public void setXzcjApp(XzcjApp xzcjApp) {
		this.xzcjApp = xzcjApp;
	}

	
	

	/**
	 * 进入创建新模板页面
	 */
	public String gotoCreate() {
		try {	
			String currentTime=new SimpleDateFormat("yyyyMMddHHmmssSSS") .format(new Date() );
			Random random = new Random();
			xzcjId=currentTime+random.nextInt(10000);
			Date dt = new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			todate = df.format(dt);
			user = new User();
			user = (User) ActionContext.getContext().getSession().get(
					"_USER_LOGIN_");
			admit_name=user.getName();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	
	public String showXzcjList() {
		try {
			listType="bumen";
			Org org=this.recordService.getOrg();
			this.pageList = this.xzcjService.getXzcjList(super.getPageNum(), this.pageSize, org.getLocbm());
			this.xzcjList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String showUndertakerList() {
		try {
			listType="banli";
			//Org org=this.recordService.getOrg();
			user = new User();
			user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
			if(userid.equals(""))
				userid = user.getId().toString();
			this.pageList = this.xzcjService.getUndertakerList(pNum, pageSize, userid);
			this.xzcjList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String saveFace(){
		
		if (this.upFileFileName!=null) {
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName = this.upFileFileName;
			String extension = upFileFileName.substring(upFileFileName.lastIndexOf("."));
			String fileName = Calendar.getInstance().getTimeInMillis() + extension;
			String fileFlod = webRootPath + "uploadfiles/xzcj/";
			File path = new File(fileFlod);
			if(!path.exists())
				path.mkdir();
			//System.out.println("ffffff" + fileFlod);
			File outFile = new File(fileFlod + fileName);
			this.getXzcjInfo().setDafutongzhi(realName);
			this.getXzcjInfo().setDafutongzhi1("../uploadfiles/xzcj/" + fileName);
			//System.out.println("ffffff" + fileFlod);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile, outFile);
			//System.out.println("ffffff" + fileFlod);
		}
		
		if (!"".equals(this.upFile1FileName)) {
			String webRootPath1 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName1 = this.upFile1FileName;
			String extension = upFile1FileName.substring(upFile1FileName.lastIndexOf("."));
			String fileName1 = Calendar.getInstance().getTimeInMillis() + extension;
			String fileFlod1 = webRootPath1 + "uploadfiles/xzcj/";
			File path = new File(fileFlod1);
			if(!path.exists())
				path.mkdir();
			//System.out.println("xxxxxxx" + fileFlod1);
			File outFile1 = new File(fileFlod1 + fileName1);
			this.getXzcjInfo().setFuyiwenshu(realName1);
			this.getXzcjInfo().setFuyiwenshu1("../uploadfiles/xzcj/" + fileName1);	
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile1, outFile1);
		}
		
		if (!"".equals(this.upFile2FileName)) {
			String webRootPath2 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName2 = this.upFile2FileName;
			String extension = upFile2FileName.substring(upFile2FileName.lastIndexOf("."));
			String fileName2 = Calendar.getInstance().getTimeInMillis() + extension;
			String fileFlod2 = webRootPath2 + "uploadfiles/xzcj/";
			File path = new File(fileFlod2);
			if(!path.exists())
				path.mkdir();
			//System.out.println("xxxxxxx" + fileFlod2);
			File outFile2 = new File(fileFlod2 + fileName2);
			this.getXzcjInfo().setCaijuewenshu(realName2);
			this.getXzcjInfo().setCaijuewenshu1("../uploadfiles/xzcj/" + fileName2);	
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile2, outFile2);
		}
		
		appList=xzcjService.getAppListById(xzcjId,this.protype);
		tempname="";
		for(int i=0;i<appList.size();i++){
			XzcjApp app=new XzcjApp();
			app=(XzcjApp)appList.get(i);
			tempname=tempname+app.getApp_name()+"";
			if(i==appList.size()-1)
				tempname=tempname+"";
			else
				tempname=tempname+",";
		}
		this.getXzcjInfo().setApp_name(tempname);
		Org org=this.recordService.getOrg();
		this.getXzcjInfo().setLocbm(org.getLocbm());
		
		xzcjService.saveXzcjInfo(xzcjInfo);
		return SUCCESS;
	}
		
	/**
	 * 进入app页面
	 */
	public String addApp(){
		appList=xzcjService.getAppListById(xzcjId,this.protype);
		System.out.println(appList.size());
		sendValue="";
		for(int i=0;i<appList.size();i++){
			XzcjApp app=new XzcjApp();
			app=(XzcjApp)appList.get(i);
			sendValue=sendValue+app.getApp_name()+"，";
			if(app.getSexy().equals("1"))
				sendValue=sendValue+"男，";
			else
				sendValue=sendValue+"女，";
			sendValue=sendValue+"身份证号："+app.getApp_id()+"，住所地："
			+app.getAddress()+"，邮编："+app.getPostcode()+"，电话："+app.getMobile();
			if(i==appList.size()-1)
				sendValue=sendValue+"。";
			else
				sendValue=sendValue+"；";
		}
		appCount="0";
		if(appList.size()>0)
			appCount=new Integer(appList.size()).toString();
		return SUCCESS;
	
	}
	
	/*public String addLegal(){
		appList=xzcjService.getAppListById(xzcjId,this.protype);  
		sendValue="";
		for(int i=0;i<appList.size();i++){
			XzcjApp app=new XzcjApp();
			app=(XzcjApp)appList.get(i);
			sendValue=sendValue+app.getApp_name()+"("+app.getOther_type()+")，";
			sendValue=sendValue+app.getDeputy_type()+"是："+app.getDeputy_name()+"，";
			sendValue=sendValue+"住所地"+app.getAddress()+"，邮编"+app.getPostcode()+
			"，电话"+app.getMobile();
			if(i==appList.size()-1)
				sendValue=sendValue+"。";
			else
				sendValue=sendValue+"；";
				}
		appCount="0";
		if(appList.size()>0)
			appCount=new Integer(appList.size()).toString();
		return SUCCESS;
	}*/
	
	/**
	 * 进入创建app页面
	 */
	public String createApp(){
	return SUCCESS;
	}

	public String saveNewApp(){
		//xzfyInfo=xzfyService.getXzfyById(xzfyId);
		//xzcjInfo=new XzcjInfo();
		//xzcjInfo.setId(xzcjId);
		xzcjApp.setXzcj_id(xzcjId);
		//System.out.println("xxxxxxxxxx" + xzcjId);
		//xzcjApp.setProxytype(protype);
		//xzcjApp.setXzcjInfo(xzcjInfo);
		xzcjService.saveXzcjApp(xzcjApp);
		return SUCCESS;
	}
	
	public String deletexzcj(){
		xzcjService.deleteXzcjById(tempid);
		return SUCCESS;
	}
	
 	public String deleteApp(){
		xzcjApp=new XzcjApp();
		xzcjApp=xzcjService.getAppById(appId);
		xzcjService.deleteAppById(appId);
		return SUCCESS;
	}
	
	public String updateApp(){
		//xzcjApp=new XzcjApp();
		//xzcjApp.setProxytype(protype);
		xzcjApp=xzcjService.getAppById(appId);
		return SUCCESS;
	}
	
	public String doUpdateApp(){
		/*xzcjInfo=new XzcjInfo();
		xzcjInfo.setId(xzcjId);
		xzcjApp.setXzcjInfo(xzcjInfo);*/
		xzcjService.update(xzcjApp);
		return SUCCESS;
	}
	
	public String showxzcj() {
		
		xzcjInfo=xzcjService.getXzcjById(tempid);
		return "success";
	}
	
	public String updatexzcj(){
		//xzssInfo=new XzssInfo();
		/*xzssInfo.setProxytype(protype);*/
		xzcjInfo=xzcjService.getXzcjById(tempid);
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		return SUCCESS;
	}
	
	
	public String doupdatexzcj(){
		//xzfyInfo=new XzfyInfo();
		//xzcjInfo.setId(tempid);
		//xzssInfo.setXzssInfo(xzssInfo);
		
		if (this.upFileFileName!=null) {
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName = this.upFileFileName;
			String extension = upFileFileName.substring(upFileFileName.lastIndexOf("."));
			String fileName = Calendar.getInstance().getTimeInMillis() + extension;
			String fileFlod = webRootPath + "uploadfiles/xzcj/";
			File path = new File(fileFlod);
			if(!path.exists())
				path.mkdir();
			File outFile = new File(fileFlod + fileName);
			this.getXzcjInfo().setDafutongzhi(realName);
			this.getXzcjInfo().setDafutongzhi1("../uploadfiles/xzcj/" + fileName);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile, outFile);
		}
		
		if (!"".equals(this.upFile1FileName)) {
			String webRootPath1 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName1 = this.upFile1FileName;
			String extension = upFile1FileName.substring(upFile1FileName.lastIndexOf("."));
			String fileName1 = Calendar.getInstance().getTimeInMillis() + extension;
			String fileFlod1 = webRootPath1 + "uploadfiles/xzcj/";
			File path = new File(fileFlod1);
			if(!path.exists())
				path.mkdir();
			File outFile1 = new File(fileFlod1 + fileName1);
			this.getXzcjInfo().setFuyiwenshu(realName1);
			this.getXzcjInfo().setFuyiwenshu1("../uploadfiles/xzcj/" + fileName1);	
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile1, outFile1);
		}
		
		if (!"".equals(this.upFile2FileName)) {
			String webRootPath2 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName2 = this.upFile2FileName;
			String extension = upFile2FileName.substring(upFile2FileName.lastIndexOf("."));
			String fileName2 = Calendar.getInstance().getTimeInMillis() + extension;
			String fileFlod2 = webRootPath2 + "uploadfiles/xzcj/";
			File path = new File(fileFlod2);
			if(!path.exists())
				path.mkdir();
			File outFile2 = new File(fileFlod2 + fileName2);
			this.getXzcjInfo().setCaijuewenshu(realName2);
			this.getXzcjInfo().setCaijuewenshu1("../uploadfiles/xzcj/" + fileName2);	
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile2, outFile2);
		}
		
		appList=xzcjService.getAppListById(xzcjId,this.protype);
		tempname="";
		for(int i=0;i<appList.size();i++){
			XzcjApp app=new XzcjApp();
			app=(XzcjApp)appList.get(i);
			tempname=tempname+app.getApp_name()+"";
			if(i==appList.size()-1)
				tempname=tempname+"";
			else
				tempname=tempname+",";
		}
		this.getXzcjInfo().setApp_name(tempname);
		
		xzcjService.update(xzcjInfo);
		return SUCCESS;
	}
	
	public String searchxzcj() {
		
		return "success";
	}
	
	
	public String dosearchxzcj() {
		
		try {
	
			this.pageList = this.xzcjService.getSearchList(super.getPageNum(), this.pageSize, this.receive_date, this.undertaker_name, this.fyundertaker_name, this.app_type, this.app_num, this.jiguan_type, this.jiguan, this.agent, this.request, this.ismoney, this.action_name, this.action_id, this.manage_type, this.fuyijielun, this.caijuejielun, this.jieandate);
			this.xzcjList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			//System.out.println("ffff"+undertaker_name);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	/*try {
			this.pageList = this.xzcjService.getXzcjList(super.getPageNum(), this.pageSize);
			this.xzcjList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}*/
	
	public String showjieanlist() {
		try {
			listType="jiean";
			user = new User();
			user = (User) ActionContext.getContext().getSession().get(
					"_USER_LOGIN_");
			admit_name=user.getName();
			String temp = "12";
			this.pageList = this.xzcjService.getJieanList(super.getPageNum(), this.pageSize, admit_name, temp);
			this.xzcjList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			//System.out.println("ffff"+undertaker);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	public String jiean(){
		xzcjInfo.setStatus("12");
		xzcjService.update(xzcjInfo);
		return SUCCESS;
	}
	
	
	
	
	private int appId;
	private String sendValue;
	private String protype="1";
	private String textId;
	private String todate;
	private String admit_name;
	private String countId;
	private String appCount;
	private User user;
	private File upFile = new File("upFile"); // 附件对象1
	private File upFile1 = new File("upFile1"); // 附件对象2
	private File upFile2 = new File("upFile2"); // 附件对象3
	private String upFileFileName; // 附件对象名称1
	private String upFile1FileName = ""; // 附件对象名称2
	private String upFile2FileName = ""; // 附件对象名称3
	private String tempid;
	private String tempname;
	private int isView = 1;
	private String panduanGL="";
	private String listType="";
	private String userid="";
	private int totalCount=0;
	private Integer pNum=1;
	private RecordService recordService = null;
	public RecordService getRecordService() {return recordService;	}
	public void setRecordService(RecordService recordService) {		this.recordService = recordService;	}
	private String locbm="";
	private List xzcjList = new ArrayList();
	
	public String getTempname() {
		return tempname;
	}
	public void setTempname(String tempname) {
		this.tempname = tempname;
	}
	public String getTempid() {
		return tempid;
	}
	public void setTempid(String tempid) {
		this.tempid = tempid;
	}
	public File getUpFile() {
		return upFile;
	}
	public void setUpFile(File upFile) {
		this.upFile = upFile;
	}
	public File getUpFile1() {
		return upFile1;
	}
	public void setUpFile1(File upFile1) {
		this.upFile1 = upFile1;
	}
	public File getUpFile2() {
		return upFile2;
	}
	public void setUpFile2(File upFile2) {
		this.upFile2 = upFile2;
	}
	public String getUpFileFileName() {
		return upFileFileName;
	}
	public void setUpFileFileName(String upFileFileName) {
		this.upFileFileName = upFileFileName;
	}
	public String getUpFile1FileName() {
		return upFile1FileName;
	}
	public void setUpFile1FileName(String upFile1FileName) {
		this.upFile1FileName = upFile1FileName;
	}
	public String getUpFile2FileName() {
		return upFile2FileName;
	}
	public void setUpFile2FileName(String upFile2FileName) {
		this.upFile2FileName = upFile2FileName;
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getAppCount() {
		return appCount;
	}

	public void setAppCount(String appCount) {
		this.appCount = appCount;
	}

	public String getCountId() {
		return countId;
	}

	public void setCountId(String countId) {
		this.countId = countId;
	}

	public String getAdmit_name() {
		return admit_name;
	}

	public void setAdmit_name(String admitName) {
		admit_name = admitName;
	}

	public String getTodate() {
		return todate;
	}

	public void setTodate(String todate) {
		this.todate = todate;
	}

	public String getTextId() {
		return textId;
	}

	public void setTextId(String textId) {
		this.textId = textId;
	}

	public String getProtype() {
		return protype;
	}

	public void setProtype(String protype) {
		this.protype = protype;
	}

	public String getSendValue() {
		return sendValue;
	}

	public void setSendValue(String sendValue) {
		this.sendValue = sendValue;
	}

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	

	private List appList;
	public List getAppList() {
		return appList;
	}

	public void setAppList(List appList) {
		this.appList = appList;
	}

	private String xzcjId;
	public String getXzcjId() {
		return xzcjId;
	}
	public void setXzcjId(String xzcjId) {
		this.xzcjId = xzcjId;
	}

	public PaginationSupport getPageList() {
		return pageList;
	}

	public void setPageList(PaginationSupport pageList) {
		this.pageList = pageList;
	}

	@Override
	public Class<XzcjInfo> getPersistentClass() {
		return XzcjInfo.class;
	}


	public String getReceive_date() {
		return receive_date;
	}
	public void setReceive_date(String receiveDate) {
		receive_date = receiveDate;
	}
	public String getUndertaker_name() {
		return undertaker_name;
	}
	public void setUndertaker_name(String undertakerName) {
		undertaker_name = undertakerName;
	}
	public String getFyundertaker_name() {
		return fyundertaker_name;
	}
	public void setFyundertaker_name(String fyundertakerName) {
		fyundertaker_name = fyundertakerName;
	}
	public String getApp_type() {
		return app_type;
	}
	public void setApp_type(String appType) {
		app_type = appType;
	}
	public String getApp_num() {
		return app_num;
	}
	public void setApp_num(String appNum) {
		app_num = appNum;
	}
	public String getJiguan_type() {
		return jiguan_type;
	}
	public void setJiguan_type(String jiguanType) {
		jiguan_type = jiguanType;
	}
	public String getJiguan() {
		return jiguan;
	}
	public void setJiguan(String jiguan) {
		this.jiguan = jiguan;
	}
	public String getAgent() {
		return agent;
	}
	public void setAgent(String agent) {
		this.agent = agent;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getIsmoney() {
		return ismoney;
	}
	public void setIsmoney(String ismoney) {
		this.ismoney = ismoney;
	}
	public String getAction_name() {
		return action_name;
	}
	public void setAction_name(String actionName) {
		action_name = actionName;
	}
	public String getAction_id() {
		return action_id;
	}
	public void setAction_id(String actionId) {
		action_id = actionId;
	}
	public String getManage_type() {
		return manage_type;
	}
	public void setManage_type(String manageType) {
		manage_type = manageType;
	}
	public String getFuyijielun() {
		return fuyijielun;
	}
	public void setFuyijielun(String fuyijielun) {
		this.fuyijielun = fuyijielun;
	}
	public String getCaijuejielun() {
		return caijuejielun;
	}
	public void setCaijuejielun(String caijuejielun) {
		this.caijuejielun = caijuejielun;
	}
	public String getJieandate() {
		return jieandate;
	}
	public void setJieandate(String jieandate) {
		this.jieandate = jieandate;
	}

	private String receive_date="";
	private String undertaker_name="";
	private String fyundertaker_name="";
	private String app_type="";
	private String app_num="";
	private String jiguan_type="";
	private String jiguan="";
	private String agent="";
	private String request="";
	private String ismoney="";
	private String action_name="";
	private String action_id="";
	private String manage_type="";
	private String fuyijielun="";
	private String caijuejielun="";
	private String jieandate="";
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
	public int getIsView() {
		return isView;
	}
	public void setIsView(int isView) {
		this.isView = isView;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getPanduanGL() {
		return panduanGL;
	}
	public void setPanduanGL(String panduanGL) {
		this.panduanGL = panduanGL;
	}
	public String getListType() {
		return listType;
	}
	public void setListType(String listType) {
		this.listType = listType;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getpNum() {
		return pNum;
	}
	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}
	public String getLocbm() {
		return locbm;
	}
	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}
	public List getXzcjList() {
		return xzcjList;
	}
	public void setXzcjList(List xzcjList) {
		this.xzcjList = xzcjList;
	}



}
