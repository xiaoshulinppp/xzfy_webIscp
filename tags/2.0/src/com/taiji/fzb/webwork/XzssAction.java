package com.taiji.fzb.webwork;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

import slime.util.IOStream.IOStream;
import slime.util.file.FileDelete;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.user.domain.User;
import com.taiji.webTemplate.domain.WtTemplate;
import com.taiji.webTemplate.service.WtTemplateService;

import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzssInfo;
import com.taiji.fzb.service.XzfyService;
import com.taiji.fzb.service.XzssService;



@SuppressWarnings("unchecked")
public class XzssAction extends ProtectedDetailAction {


	
	/**
	 * 进入创建新模板页面
	 */
	public String gotoCreate() {
		try {	
			
			String currentTime=new SimpleDateFormat("yyyyMMddHHmmssSSS") .format(new Date() );
			Random random = new Random();
			
			tempid = currentTime+random.nextInt(10000);
			

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

	public String saveXzss(){
		
		if (this.upFileFileName!=null) {
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName = this.upFileFileName;
			String fileName = Calendar.getInstance().getTimeInMillis() + this.upFileFileName;
			String fileFlod = webRootPath + "uploadfiles/xzss/";
			System.out.println("ffffff" + fileFlod);
			File outFile = new File(fileFlod + fileName);
			this.getXzssInfo().setYingsutongzhi(realName);
			this.getXzssInfo().setYingsutongzhi1("../uploadfiles/xzss/" + fileName);
			System.out.println("ffffff" + fileFlod);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile, outFile);
			System.out.println("ffffff" + fileFlod);
		}
		
		if (!"".equals(this.upFile1FileName)) {
			String webRootPath1 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName1 = this.upFile1FileName;
			String fileName1 = Calendar.getInstance().getTimeInMillis() + this.upFile1FileName;
			String fileFlod1 = webRootPath1 + "uploadfiles/xzss/";
			System.out.println("xxxxxxx" + fileFlod1);
			File outFile1 = new File(fileFlod1 + fileName1);
			this.getXzssInfo().setJieanwenshu(realName1);
			this.getXzssInfo().setJieanwenshu1("../uploadfiles/xzss/" + fileName1);
			
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile1, outFile1);
		}
		
		
		
//		xzssService.saveXzssInfo(xzssInfo);
		xzssService.save(xzssInfo);
		return SUCCESS;
	}
	

	
	public String showXzssList() {
		try {
			this.pageList = this.xzssService.getXzssList(super.getPageNum(), this.pageSize);
			this.xzssList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String showUndertakerList() {
		try {
			this.pageList = this.xzssService.getUndertakerList(super.getPageNum(), this.pageSize, this.undertaker);
			this.xzssList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			System.out.println("ffff"+undertaker);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	//showJieanlist
	public String showJieanlist() {
		try {
			user = new User();
			user = (User) ActionContext.getContext().getSession().get(
					"_USER_LOGIN_");
			admit_name=user.getName();
			String temp = "已结案";
			this.pageList = this.xzssService.getJieanList(super.getPageNum(), this.pageSize, admit_name, temp);
			this.xzssList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			System.out.println("ffff"+undertaker);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String showxzss() {
		
			xzssInfo=xzssService.getXzssById(tempid);
			return "success";
	}
	
	public String connect() {
		
		
		return "success";
	}
	
	public String deletexzss(){
		
		xzssInfo=xzssService.getXzssById(tempid);
		double d = Double.parseDouble(tempid);
		xzssService.deleteXzssById(d);
		return SUCCESS;
	}
	
	public String updatexzss(){
		//xzssInfo=new XzssInfo();
		/*xzssInfo.setProxytype(protype);*/
		xzssInfo=xzssService.getXzssById(tempid);
		
		return SUCCESS;
	}
	
	
	public String doUpdatexzss(){
		//xzfyInfo=new XzfyInfo();
		xzssInfo.setId(xzssid);
		//xzssInfo.setXzssInfo(xzssInfo);
		xzssService.update(xzssInfo);
		return SUCCESS;
	}
	
	public String jiean(){
		tempStatus = "已结案";
		xzssInfo.setStatus(tempStatus);
		xzssInfo.setId(xzssid);
		xzssService.update(xzssInfo);
		return SUCCESS;
	}
	
	
	public String search() {
		
		return "success";
	}
	public String dosearch() {
		
		try {
			this.pageList = this.xzssService.getSearchList(super.getPageNum(), this.pageSize, this.receive_date, this.undertaker_name, this.fyundertaker_name, this.app_name, this.app_num, this.app_type, this.defendant, this.agent, this.jiguan_type, this.jiguan_level, this.jiguan, this.request, this.manage_type, this.ismoney, this.action_name, this.action_id, this.jieandate, this.fuyi_id, this.shen1, this.shen2);
			this.xzssList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			System.out.println("ffff"+undertaker_name);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	
	
	private String todate;
	private XzssInfo xzssInfo = new XzssInfo();
	private String admit_name;
	private User user;
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private Integer pageSize = 50; // 分页列表每页显示个数
	private Integer totalPage = 0; // 分页列表页面总数
	private List xzssList;
	private List undertakerList;
	private XzssService xzssService;
	private String tempid;
	private String protype="1";
	private File upFile = new File("upFile"); // 附件对象1
	private File upFile1 = new File("upFile1"); // 附件对象2
	private String upFileFileName; // 附件对象名称1
	private String upFile1FileName = ""; // 附件对象名称2
	private String tempundertaker;
	private String undertaker;
	private String under = "";
	private String realName;
	private String realName1;
	private String tempStatus="待办理";
	private String tempShen1 = "";
	private String tempShen2 = "";

	private String xzssid="";	
	private String receive_date=""; 
	private String undertaker_name="";
	private String fyundertaker_name=""; 
	private String app_name="";
	private String app_num="";
	private String app_type="";
	private String defendant="";
	private String agent="";
	private String jiguan_type=""; 
	private String jiguan_level=""; 
	private String jiguan="";
	private String request="";
	private String manage_type=""; 
	private String ismoney=""; 
	private String action_name=""; 
	private String action_id=""; 
	private String jieandate=""; 
	private String fuyi_id=""; 
	private String shen1=""; 
	private String shen2="";
	private String panduanGL="";
	
	
	public String getPanduanGL() {
		return panduanGL;
	}

	public void setPanduanGL(String panduanGL) {
		this.panduanGL = panduanGL;
	}

	public String getTempShen1() {
		return tempShen1;
	}

	public void setTempShen1(String tempShen1) {
		this.tempShen1 = tempShen1;
	}

	public String getTempShen2() {
		return tempShen2;
	}

	public void setTempShen2(String tempShen2) {
		this.tempShen2 = tempShen2;
	}
	public String getTempStatus() {
		return tempStatus;
	}

	public void setTempStatus(String tempStatus) {
		this.tempStatus = tempStatus;
	}
	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getRealName1() {
		return realName1;
	}

	public void setRealName1(String realName1) {
		this.realName1 = realName1;
	}

	public String getXzssid() {
		return xzssid;
	}

	public void setXzssid(String xzssid) {
		this.xzssid = xzssid;
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

	public String getApp_name() {
		return app_name;
	}

	public void setApp_name(String appName) {
		app_name = appName;
	}

	public String getApp_num() {
		return app_num;
	}

	public void setApp_num(String appNum) {
		app_num = appNum;
	}

	public String getApp_type() {
		return app_type;
	}

	public void setApp_type(String appType) {
		app_type = appType;
	}

	public String getDefendant() {
		return defendant;
	}

	public void setDefendant(String defendant) {
		this.defendant = defendant;
	}

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}

	public String getJiguan_type() {
		return jiguan_type;
	}

	public void setJiguan_type(String jiguanType) {
		jiguan_type = jiguanType;
	}

	public String getJiguan_level() {
		return jiguan_level;
	}

	public void setJiguan_level(String jiguanLevel) {
		jiguan_level = jiguanLevel;
	}

	public String getJiguan() {
		return jiguan;
	}

	public void setJiguan(String jiguan) {
		this.jiguan = jiguan;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getManage_type() {
		return manage_type;
	}

	public void setManage_type(String manageType) {
		manage_type = manageType;
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

	public String getJieandate() {
		return jieandate;
	}

	public void setJieandate(String jieandate) {
		this.jieandate = jieandate;
	}

	public String getFuyi_id() {
		return fuyi_id;
	}

	public void setFuyi_id(String fuyiId) {
		fuyi_id = fuyiId;
	}

	public String getShen1() {
		return shen1;
	}

	public void setShen1(String shen1) {
		this.shen1 = shen1;
	}

	public String getShen2() {
		return shen2;
	}

	public void setShen2(String shen2) {
		this.shen2 = shen2;
	}

	public String getUnder() {
		return under;
	}

	public void setUnder(String under) {
		this.under = under;
	}

	public String getUndertaker() {
		return undertaker;
	}

	public void setUndertaker(String undertaker) {
		this.undertaker = undertaker;
	}

	public String getTempundertaker() {
		return tempundertaker;
	}

	public void setTempundertaker(String tempundertaker) {
		this.tempundertaker = tempundertaker;
	}

	public List getUndertakerList() {
		return undertakerList;
	}

	public void setUndertakerList(List undertakerList) {
		this.undertakerList = undertakerList;
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
	public String getProtype() {
		return protype;
	}

	public void setProtype(String protype) {
		this.protype = protype;
	}

	public String getTempid() {
		return tempid;
	}
	public void setTempid(String tempid) {
		this.tempid = tempid;
	}
	public List getXzssList() {
		return xzssList;
	}
	public void setXzssList(List xzssList) {
		this.xzssList = xzssList;
	}
	public XzssInfo getXzssInfo() {
		return this.xzssInfo;
	}
	public void setXzssInfo(XzssInfo xzssInfo) {
		this.xzssInfo=xzssInfo;
	}
	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}
	public String getAdmit_name() {
		return admit_name;
	}
	public void setAdmit_name(String admitName) {
		admit_name = admitName;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public XzssService getXzssService() {
		return xzssService;
	}
	public void setXzssService(XzssService xzssService) {
		this.xzssService = xzssService;
	}	
	public PaginationSupport getPageList() {
		return pageList;
	}
	public void setPageList(PaginationSupport pageList) {
		this.pageList = pageList;
	}

}
