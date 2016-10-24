package com.taiji.fzb.webwork;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import net.sf.cglib.beans.BeanCopier;

import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

import slime.util.IOStream.IOStream;
import slime.util.file.FileDelete;

import com.dataSync.Session1;
import com.jcraft.jsch.Session;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.sun.xml.xsom.impl.scd.Iterators.Map;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.webTemplate.domain.WtTemplate;
import com.taiji.webTemplate.service.WtTemplateService;

import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyRecieve;
import com.taiji.fzb.domain.XzssInfo;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzfyService;
import com.taiji.fzb.service.XzssService;



@SuppressWarnings("unchecked")
public class XzssAction extends ProtectedDetailAction  {


	
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
			xzfyInfo=xzssService.getXzfyById(xzfyId);
			//System.out.println("++++"+xzfyInfo.getCasetype());
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

	/*public String saveXzss(){
		
		if (this.upFileFileName!=null&&!"".equals(this.upFileFileName)) {
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName = this.upFileFileName;
			String fileName = Calendar.getInstance().getTimeInMillis() + this.upFileFileName;
			String fileFlod = webRootPath + "uploadfiles/xzss/";
			File path = new File(fileFlod);
			if(!path.exists())
				path.mkdir();
			File outFile = new File(fileFlod + fileName);
			this.getXzssInfo().setYingsutongzhi(realName);
			this.getXzssInfo().setYingsutongzhi1("../uploadfiles/xzss/" + fileName);
			//System.out.println("ffffff" + fileFlod);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile, outFile);
			//System.out.println("ffffff" + fileFlod);
		}
		
		if (this.upFile1FileName!=null&&!"".equals(this.upFile1FileName)) {
			String webRootPath1 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName1 = this.upFile1FileName;
			String fileName1 = Calendar.getInstance().getTimeInMillis() + this.upFile1FileName;
			String fileFlod1 = webRootPath1 + "uploadfiles/xzss/";
			File path = new File(fileFlod1);
			if(!path.exists())
				path.mkdir();
			File outFile1 = new File(fileFlod1 + fileName1);
			this.getXzssInfo().setJieanwenshu(realName1);
			this.getXzssInfo().setJieanwenshu1("../uploadfiles/xzss/" + fileName1);
			
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile1, outFile1);
		}
		
		Org org=this.recordService.getOrg();
		this.getXzssInfo().setShen3(org.getLocbm());
		
//		xzssService.saveXzssInfo(xzssInfo);
		xzssService.save(xzssInfo);
		return SUCCESS;
	}*/
	

	
	public String showXzssList() {
		try {
			listType="bumen";
			Org org=this.recordService.getOrg();
			this.pageList = this.xzssService.getXzssList(pNum, this.pageSize);
			this.xzssList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
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
			String userName1=user.getName().toString();
			String userOrg1=this.xzssService.getOrg().getName().toString();
			if (userName1.equals("庞雷")||userName1.equals("张虎")||userOrg1.equals("复议应诉指导调解处")) {
				isdeleteuser="1";
			}
			this.pageList = this.xzssService.getXzssList(pNum, pageSize);
			this.xzssList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			if (xzssInfo==null) {
				xzssInfo=new XzssInfo();
			}
			
			List<String> zhuanbaohaoList1 = this.xzssService.getZbh();
			String zhuanbaohaoIndex = "";
			zhuanbaohaoIndex = zhuanbaohaoList1.get(0);
			if (zhuanbaohaoIndex==null) {
				zhuanbaohao="1";
			}else{
				zhuanbaohao=Integer.toString(Integer.valueOf(zhuanbaohaoIndex)+1);
				}
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	//showJieanlist
	public String showJieanlist() {
		try {
			listType="jiean";
			user = new User();
			user = (User) ActionContext.getContext().getSession().get(
					"_USER_LOGIN_");
			admit_name=user.getName();
			String temp = "12";
			this.pageList = this.xzssService.getJieanList(pNum, this.pageSize, user.getId().toString(), temp);
			this.xzssList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			//System.out.println("ffff"+undertaker);
			totalCount=pageList.getTotalCount();
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
		
		//xzssInfo=xzssService.getXzssById(tempid);
		//double d = Double.parseDouble(tempid);
		//listType="banli";
		xzssService.deleteXzssById(tempid);
		return SUCCESS;
	}
	
	public String updatexzss(){
		//xzssInfo=new XzssInfo();
		/*xzssInfo.setProxytype(protype);*/
		xzssInfo=xzssService.getXzssById(tempid);
		
		return SUCCESS;
	}
	
	
	/*public String doUpdatexzss(){
		//xzfyInfo=new XzfyInfo();
		//xzssInfo.setId(xzssid);
		if (this.upFileFileName!=null&&!"".equals(this.upFileFileName)) {
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName = this.upFileFileName;
			String fileName = Calendar.getInstance().getTimeInMillis() + this.upFileFileName;
			String fileFlod = webRootPath + "uploadfiles/xzss/";
			File path = new File(fileFlod);
			if(!path.exists())
				path.mkdir();
			File outFile = new File(fileFlod + fileName);
			this.getXzssInfo().setYingsutongzhi(realName);
			this.getXzssInfo().setYingsutongzhi1("../uploadfiles/xzss/" + fileName);
			//System.out.println("ffffff" + fileFlod);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile, outFile);
			//System.out.println("ffffff" + fileFlod);
		}
		
		if (this.upFile1FileName!=null&&!"".equals(this.upFile1FileName)) {
			String webRootPath1 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName1 = this.upFile1FileName;
			String fileName1 = Calendar.getInstance().getTimeInMillis() + this.upFile1FileName;
			String fileFlod1 = webRootPath1 + "uploadfiles/xzss/";
			File path = new File(fileFlod1);
			if(!path.exists())
				path.mkdir();
			File outFile1 = new File(fileFlod1 + fileName1);
			this.getXzssInfo().setJieanwenshu(realName1);
			this.getXzssInfo().setJieanwenshu1("../uploadfiles/xzss/" + fileName1);
			
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile1, outFile1);
		}
		//xzssInfo.setXzssInfo(xzssInfo);
		xzssService.update(xzssInfo);
		return SUCCESS;
	}*/
	
	public String jiean(){
		tempStatus = "12";
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
			listType="chaxun";
			user = new User();
			user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
			if(userid.equals(""))
				userid = user.getId().toString();
			String userName1=user.getName().toString();
			String userOrg1=this.xzssService.getOrg().getName().toString();
			if (userName1.equals("庞雷")||userName1.equals("张虎")||userOrg1.equals("复议应诉指导调解处")) {
				isdeleteuser="1";
			}
			this.pageList = this.xzssService.getSearchList(pNum, this.pageSize,xzssInfo,receiveCaseDate1,receiveCaseDate2,jieanDate1,jieanDate2,tiaojie);
			this.xzssList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			//System.out.println("ffff"+undertaker_name);
			totalCount=pageList.getTotalCount();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
public String dosearchQuanShi() {
		
		try {
			listType="chaxunquanshi";
			user = new User();
			user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
			if(userid.equals(""))
				userid = user.getId().toString();
			String userName1=user.getName().toString();
			String userOrg1=this.xzssService.getOrg().getName().toString();
			if (userName1.equals("庞雷")||userName1.equals("张虎")||userOrg1.equals("复议应诉指导调解处")) {
				isdeleteuser="1";
			}
			this.pageList = this.xzssService.getSearchQuanShiList(pNum, this.pageSize,xzssInfo,receiveCaseDate1,receiveCaseDate2,jieanDate1,jieanDate2,tiaojie);
			this.xzssList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			//System.out.println("ffff"+undertaker_name);
			totalCount=pageList.getTotalCount();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String dosearchXzfy() {
		try {
			//System.out.println("super.getPageNum()="+super.getPageNum());
			//System.out.println("pNum="+pNum);
			//System.out.println("applicant="+this.applicant);
			this.pageList = this.xzssService.getXzfyList(pNum, pageSize,this.applicant, this.undertakerName, this.undertakerSecond, this.caseNo, this.representative, this.caseNumBFY, this.caseNameBFY, this.respondent);
			this.xzfyList = this.pageList.getItems();
//			//System.out.println(xzfyList.size());
			this.totalPage = this.pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	private int isView = 1;
	private String listType="";
	private String todate;
	private XzssInfo xzssInfo;
	private XzfyInfo xzfyInfo=new XzfyInfo();
	private String xzfyId="";
	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}

	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}
	
	public String getXzfyId() {
		return xzfyId;
	}

	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}
	private String admit_name;
	private User user;
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private Integer pageSize = 20; // 分页列表每页显示个数
	private Integer totalPage = 0; // 分页列表页面总数
	private Integer pNum=1;
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
	private String tempStatus="4";
	private String tempShen1 = "";
	private String tempShen2 = "";

	private String xzssid="";	
	private String receive_date=""; 
	private String undertaker_name="";
	private String fyundertaker_name=""; 
	
	private String agent="";
	private String jiguan_type=""; 
	private String jiguan_level=""; 
	private String jiguan="";
	private String request="";
	private String manage_type="";
	private String caseType="";
	private String ysfy="";
	private String beigao1="";
	private String beigao2="";
	public String getCaseType() {
		return caseType;
	}

	public void setCaseType(String caseType) {
		this.caseType = caseType;
	}
	private String ismoney=""; 
	private String action_name=""; 
	private String action_id=""; 
	private String jieandate=""; 
	private String fuyi_id=""; 
	private String shen1=""; 
	private String shen2="";
	private String shen1OrShen2="";
	private String panduanGL="";
	private String userid="";
	private RecordService recordService = null;
	public RecordService getRecordService() {return recordService;	}
	public void setRecordService(RecordService recordService) {		this.recordService = recordService;	}
	private int totalCount=0;
	private String applicant="";
    private String undertakerName="";
    private String undertakerSecond=""; 
    private String caseNo="";
    private String representative="";
    private String caseNumBFY="";
    private String caseNameBFY="";
    private String respondent="";
	private  List  xzfyList ;
	private String  isdeleteuser="";//标记用户是否有删除权限


	public String getIsdeleteuser() {
		return isdeleteuser;
	}

	public void setIsdeleteuser(String isdeleteuser) {
		this.isdeleteuser = isdeleteuser;
	}

	public List getXzfyList() {
		return xzfyList;
	}

	public void setXzfyList(List xzfyList) {
		this.xzfyList = xzfyList;
	}
	
	public String getApplicant() {
		return applicant;
	}

	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	public String getUndertakerName() {
		return undertakerName;
	}

	public void setUndertakerName(String undertakerName) {
		this.undertakerName = undertakerName;
	}

	public String getUndertakerSecond() {
		return undertakerSecond;
	}

	public void setUndertakerSecond(String undertakerSecond) {
		this.undertakerSecond = undertakerSecond;
	}

	public String getCaseNo() {
		return caseNo;
	}

	public void setCaseNo(String caseNo) {
		this.caseNo = caseNo;
	}

	public String getRepresentative() {
		return representative;
	}

	public void setRepresentative(String representative) {
		this.representative = representative;
	}

	public String getCaseNumBFY() {
		return caseNumBFY;
	}

	public void setCaseNumBFY(String caseNumBFY) {
		this.caseNumBFY = caseNumBFY;
	}

	public String getCaseNameBFY() {
		return caseNameBFY;
	}

	public void setCaseNameBFY(String caseNameBFY) {
		this.caseNameBFY = caseNameBFY;
	}

	public String getRespondent() {
		return respondent;
	}

	public void setRespondent(String respondent) {
		this.respondent = respondent;
	}

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
	
	
	public String getYsfy() {
		return ysfy;
	}

	public void setYsfy(String ysfy) {
		this.ysfy = ysfy;
	}

	public String getBeigao1() {
		return beigao1;
	}

	public void setBeigao1(String beigao1) {
		this.beigao1 = beigao1;
	}

	public String getBeigao2() {
		return beigao2;
	}

	public void setBeigao2(String beigao2) {
		this.beigao2 = beigao2;
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
	
	public String getShen1OrShen2() {
		return shen1OrShen2;
	}

	public void setShen1OrShen2(String shen1OrShen2) {
		this.shen1OrShen2 = shen1OrShen2;
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

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public Integer getpNum() {
		return pNum;
	}

	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
	}

	public int getIsView() {
		return isView;
	}

	public void setIsView(int isView) {
		this.isView = isView;
	}
	
	public String chooseShenHeLevel() {
		return SUCCESS;
	}
	public String chooseIsfuyi(){
		return SUCCESS;
	}
	//查询行政复议案件
	private String shenji="";
	private String fuyi="";
	private String shenhe1="";
	private String shenhe2="";
	private String xzfyOrg="";
	private String xzfyOrgName="";
	private List orgList;
	private String case_num="";
	private String case_numYear="";
	private String case_numType="";
	private String case_numNum="";
	private String app_name="";
	private String xzfyappName="";
	private String app_num="";
	private String app_type="";
	private String defendant="";
	private String xzssId="";
	private String isxinzeng="";//是否跳到新增页面，1是，0不是
	private String viewxzss="";//1查看xzssInfo,0编辑xzssInfo
	private List logList;
	private String beigao="";
	private String fuyiOrbeishen="";
	private String receiveCaseDate1;
	private String receiveCaseDate2;
	private String jieanDate1;
	private String jieanDate2;
	private String tiaojie="";
	private String userOrg="";
	private String fuyijiguan="";
	private ArrayList<String> casenumNumList=new ArrayList<String>();
	private ArrayList<String > zhuanbaohaoList=new ArrayList<String>();
	
	public ArrayList<String> getZhuanbaohaoList() {
		return zhuanbaohaoList;
	}

	public void setZhuanbaohaoList(ArrayList<String> zhuanbaohaoList) {
		this.zhuanbaohaoList = zhuanbaohaoList;
	}

	public String getFuyijiguan() {
		return fuyijiguan;
	}

	public void setFuyijiguan(String fuyijiguan) {
		this.fuyijiguan = fuyijiguan;
	}
	
	

	public ArrayList<String> getCasenumNumList() {
		return casenumNumList;
	}

	public void setCasenumNumList(ArrayList<String> casenumNumList) {
		this.casenumNumList = casenumNumList;
	}

	public String getUserOrg() {
		return userOrg;
	}

	public void setUserOrg(String userOrg) {
		this.userOrg = userOrg;
	}

	public String getTiaojie() {
		return tiaojie;
	}

	public void setTiaojie(String tiaojie) {
		this.tiaojie = tiaojie;
	}

	public String getReceiveCaseDate1() {
		return receiveCaseDate1;
	}

	public void setReceiveCaseDate1(String receiveCaseDate1) {
		this.receiveCaseDate1 = receiveCaseDate1;
	}

	public String getReceiveCaseDate2() {
		return receiveCaseDate2;
	}

	public void setReceiveCaseDate2(String receiveCaseDate2) {
		this.receiveCaseDate2 = receiveCaseDate2;
	}

	public String getJieanDate1() {
		return jieanDate1;
	}

	public void setJieanDate1(String jieanDate1) {
		this.jieanDate1 = jieanDate1;
	}

	public String getJieanDate2() {
		return jieanDate2;
	}

	public void setJieanDate2(String jieanDate2) {
		this.jieanDate2 = jieanDate2;
	}

	public String getShenji() {
		return shenji;
	}

	public void setShenji(String shenji) {
		this.shenji = shenji;
	}

	public String getFuyi() {
		return fuyi;
	}

	public void setFuyi(String fuyi) {
		this.fuyi = fuyi;
	}

	public String getShenhe1() {
		return shenhe1;
	}

	public void setShenhe1(String shenhe1) {
		this.shenhe1 = shenhe1;
	}

	public String getShenhe2() {
		return shenhe2;
	}

	public void setShenhe2(String shenhe2) {
		this.shenhe2 = shenhe2;
	}

	
	public String getXzfyOrg() {
		return xzfyOrg;
	}

	public void setXzfyOrg(String xzfyOrg) {
		this.xzfyOrg = xzfyOrg;
	}
	
	public String getXzfyOrgName() {
		return xzfyOrgName;
	}

	public void setXzfyOrgName(String xzfyOrgName) {
		this.xzfyOrgName = xzfyOrgName;
	}

	public List getOrgList() {
		return orgList;
	}

	public void setOrgList(List orgList) {
		this.orgList = orgList;
	}

	public String getCase_num() {
		return case_num;
	}

	public void setCase_num(String case_num) {
		this.case_num = case_num;
	}

	public String getCase_numYear() {
		return case_numYear;
	}

	public void setCase_numYear(String case_numYear) {
		this.case_numYear = case_numYear;
	}

	public String getCase_numType() {
		return case_numType;
	}

	public void setCase_numType(String case_numType) {
		this.case_numType = case_numType;
	}

	public String getCase_numNum() {
		return case_numNum;
	}

	public void setCase_numNum(String case_numNum) {
		this.case_numNum = case_numNum;
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
	
	public String getXzfyappName() {
		return xzfyappName;
	}

	public void setXzfyappName(String xzfyappName) {
		this.xzfyappName = xzfyappName;
	}


	public String getIsxinzeng() {
		return isxinzeng;
	}

	public void setIsxinzeng(String isxinzeng) {
		this.isxinzeng = isxinzeng;
	}

	public String getViewxzss() {
		return viewxzss;
	}

	public void setViewxzss(String viewxzss) {
		this.viewxzss = viewxzss;
	}

	public String getXzssId() {
		return xzssId;
	}

	public void setXzssId(String xzssId) {
		this.xzssId = xzssId;
	}

	

	public List getLogList() {
		return logList;
	}

	public void setLogList(List logList) {
		this.logList = logList;
	}

	public String getBeigao() {
		return beigao;
	}

	public void setBeigao(String beigao) {
		this.beigao = beigao;
	}

	public String getFuyiOrbeishen() {
		return fuyiOrbeishen;
	}

	public void setFuyiOrbeishen(String fuyiOrbeishen) {
		this.fuyiOrbeishen = fuyiOrbeishen;
	}

	public String searchXzfy() {
		try {
			//System.out.println("fuyi="+fuyi);
			if("1".equals(fuyiOrbeishen)){
			this.pageList = this.xzssService.getXzfyOrgList(pNum, pageSize,xzfyInfo);
			this.xzfyList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			if(xzfyInfo==null)
				xzfyInfo=new XzfyInfo();
			}
			if ("2".equals(fuyiOrbeishen)) {
				orgList=this.xzssService.getOrgFy();
				//System.out.println("复议机关："+xzfyInfo.getCaseorg());
				this.pageList = this.xzssService.getXzfyDefendantList(pNum, pageSize, xzfyInfo);
				this.xzfyList = this.pageList.getItems();
				this.totalPage = this.pageList.getTotalPage();
				totalCount=pageList.getTotalCount();
				if(xzfyInfo==null)
					xzfyInfo=new XzfyInfo();
			}
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	public String tiquXzss() {
		try {
			//System.out.println("shenhe1="+shenhe1);
			if("1".equals(shenhe1)){
			this.pageList = this.xzssService.getXzssShen1List(pNum, pageSize, xzssInfo);
			this.xzssList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			//System.out.println("ffff"+undertaker_name);
			totalCount=pageList.getTotalCount();
			}
			if("1".equals(shenhe2)){
				this.pageList = this.xzssService.getXzssShen2List(pNum, pageSize, xzssInfo);
				this.xzssList = this.pageList.getItems();
				this.totalPage = this.pageList.getTotalPage();
				//System.out.println("ffff"+undertaker_name);
				totalCount=pageList.getTotalCount();
			}
			user = new User();
			user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
			if(userid.equals(""))
				userid = user.getId().toString();
			String userName1=user.getName().toString();
			String userOrg1=this.xzssService.getOrg().getName().toString();
			if (userName1.equals("庞雷")||userName1.equals("张虎")||userOrg1.equals("复议应诉指导调解处")) {
				isdeleteuser="1";
			}
			if(xzssInfo==null)
				xzssInfo=new XzssInfo();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	public String xzssGuanLi(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		if(!"".equals(xzfyId)){
			xzfyInfo=xzssService.getXzfyById(xzfyId);
		}
		if (xzfyInfo==null) {
			xzfyInfo=new XzfyInfo();
		}
		if (!"".equals(xzssId)) {
			xzssInfo=xzssService.getXzssById(xzssId);
		}
		if (xzssInfo==null) {
			xzssInfo=new XzssInfo();
		}
		return SUCCESS;
	}
	public String xzssPiPanDan() {
		String currentTime=new SimpleDateFormat("yyyyMMddHHmmssSSS") .format(new Date() );
		Random random = new Random();
    	tempid = currentTime+random.nextInt(10000);
    	List<String> casenumNumList1 = this.xzssService.getCaseNumIndex();
		String casenumIndex = "";
		casenumIndex = casenumNumList1.get(0);
		if (casenumIndex==null) {
			case_numNum="1";
			casenumNumList.add("1");
		}else{
			case_numNum=Integer.toString(Integer.valueOf(casenumIndex)+1);
			for (int i = 1; i <=Integer.valueOf(casenumIndex)+1; i++) {
				//System.out.println(Integer.toString(i));
				String num=Integer.toString(i);
				casenumNumList.add(num);
			}
		}
		case_numYear=new SimpleDateFormat("yyyy") .format(new Date() );
		case_numType=xzssService.getYingSuNum();
		if(!"".equals(xzfyId)){
			xzfyInfo=xzssService.getXzfyById(xzfyId);
			List<XzfyApp> appList=this.xzssService.getXzfyApp(xzfyId);
			if (appList.size()==0) {
				xzfyappName="";
			}else{
			if (appList.size()<=5) {
				xzfyappName=appList.get(0).getApp_name();
				for (int i = 1; i < appList.size(); i++) {
					xzfyappName=xzfyappName+","+appList.get(i).getApp_name();
				}
			}else{
				xzfyappName=appList.get(1).getApp_name()+"等"+appList.size()+"人";
			}
			}
		}
		if (!"".equals(xzssId)) {
			xzssInfo=xzssService.getXzssById(xzssId);
		}else {
			xzssInfo=new XzssInfo();
		}
		userOrg=this.xzssService.getOrg().getLocbm().toString();
		return SUCCESS;
	}
	public String editpipandan(){
		//System.out.println("viewxzss="+viewxzss);
		xzssInfo=xzssService.getXzssById(xzssId);
		userOrg=this.xzssService.getOrg().getLocbm().toString();
		List<String> zhuanbaohaoList1 = this.xzssService.getZbh();
		String zhuanbaohaoIndex = "";
		zhuanbaohaoIndex = zhuanbaohaoList1.get(0);
		if (zhuanbaohaoIndex==null) {
			zhuanbaohaoList.add("0");
		}else{
			//zhuanbaohao=Integer.toString(Integer.valueOf(zhuanbaohaoIndex)+1);
			for (int i = 1; i <=Integer.valueOf(zhuanbaohaoIndex); i++) {
				String num=Integer.toString(i);
				zhuanbaohaoList.add(num);
			}
			}
		if (xzssInfo==null) {
			xzssInfo=new XzssInfo();
		}
	    if (viewxzss.equals("1")) {
			return "chakan";
		}
	    else if(viewxzss.equals("0")) {
			return "edit";
		}
	    else {
			return SUCCESS;
		}
	    
	}
    public String saveXzss() {
    	User user = null;
	    user = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
	    String locbm = getOrg().getLocbm();
	    xzssInfo.setCase_org(locbm);
    	xzssInfo.setCase_num(xzssInfo.getCase_numType()+"["+xzssInfo.getCase_numYear()+"]"+xzssInfo.getCase_numNum()+"号");
		if ("".equals(xzssInfo.getStatus())) {
			xzssInfo.setStatus("0");
		}
    	xzssService.save(xzssInfo);
		return SUCCESS;
	}
	public String editXzss() throws Exception, Throwable{
    	XzssInfo  oldInfo=xzssService.getXzssById(xzssId);
    	if (!(oldInfo.getManage_type()).equals(xzssInfo.getManage_type())) {
    		xzssService.save_log(xzssId, "行政类别", valueToView("manageType", oldInfo.getManage_type()), valueToView("manageType", xzssInfo.getManage_type()));
		}
    	if (oldInfo.getYstz()!=null&&xzssInfo.getYstz()!=null) {
    		if (!(oldInfo.getYstz()).equals(xzssInfo.getYstz())) {
    			xzssService.save_log(xzssId, "应诉通知书", oldInfo.getYstz(), xzssInfo.getYstz());
    		}
		}
    	if (oldInfo.getCase_type()!=null&&xzssInfo.getCase_type()!=null) {
    		if (!(oldInfo.getCase_type()).equals(xzssInfo.getCase_type())) {
    			xzssService.save_log(xzssId, "案件类别", valueToView("caseType", oldInfo.getCase_type()), valueToView("caseType", xzssInfo.getCase_type()));
    		}
		}
    	if (oldInfo.getCourt()!=null&&xzssInfo.getCourt()!=null) {
    		if (!(oldInfo.getCourt()).equals(xzssInfo.getCourt())) {
    			xzssService.save_log(xzssId, "受理法院", valueToView("court", oldInfo.getCourt()), valueToView("court", xzssInfo.getCourt()));
    		}
		}
    	if (oldInfo.getApp_type()!=null&&xzssInfo.getApp_type()!=null) {
    		if (!(oldInfo.getApp_type()).equals(xzssInfo.getApp_type())) {
    			xzssService.save_log(xzssId, "原告类型", valueToView("appType", oldInfo.getApp_type()), valueToView("appType", xzssInfo.getApp_type()));
    		}
		}
    	if (oldInfo.getApp_name()!=null&&xzssInfo.getApp_name()!=null) {
    		if (!(oldInfo.getApp_name()).equals(xzssInfo.getApp_name())) {
    			xzssService.save_log(xzssId, "原告", oldInfo.getApp_name(), xzssInfo.getApp_name());
    		}
		}
    	if (oldInfo.getDefendant()!=null&& xzssInfo.getDefendant()!=null) {
    		if (!(oldInfo.getDefendant()).equals(xzssInfo.getDefendant())) {
    			xzssService.save_log(xzssId, "被告", oldInfo.getDefendant(), xzssInfo.getDefendant());
    		}
		}
    	if (oldInfo.getCase_cause()!=null&&xzssInfo.getCase_cause()!=null) {
    		if (!(oldInfo.getCase_cause()).equals(xzssInfo.getCase_cause())) {
    			xzssService.save_log(xzssId, "案由", oldInfo.getCase_cause(), xzssInfo.getCase_cause());
    		}
		}
    	
		if (oldInfo.getIsmoney()!=null&&xzssInfo.getIsmoney()!=null) {
			if (!(oldInfo.getIsmoney()).equals(xzssInfo.getIsmoney())) {
				xzssService.save_log(xzssId, "行政赔偿", valueToView("peichang", oldInfo.getIsmoney()), valueToView("peichang", xzssInfo.getIsmoney()));
			}
		}
    	
		if (oldInfo.getNotice_receiptDate()!=null&&xzssInfo.getNotice_receiptDate()!=null) {
			if (!(oldInfo.getNotice_receiptDate()).equals(xzssInfo.getNotice_receiptDate())) {
				xzssService.save_log(xzssId, "应诉通知书签收日期", oldInfo.getNotice_receiptDate(), xzssInfo.getNotice_receiptDate());
			}
		}
    	
    	if (oldInfo.getDabian_endDate()!=null&&xzssInfo.getDabian_endDate()!=null) {
    		if (!(oldInfo.getDabian_endDate()).equals(xzssInfo.getDabian_endDate())) {
    			xzssService.save_log(xzssId, "书面答辩提交截止日期", oldInfo.getDabian_endDate(), xzssInfo.getDabian_endDate());
    		}
		}
    	
    	if (oldInfo.getDjbmyj()!=null&&xzssInfo.getDjbmyj()!=null) {
    		
    		if (!(oldInfo.getDjbmyj()).equals(xzssInfo.getDjbmyj())) {
    			if (userOrg.equals("0000")) {
    				xzssService.save_log(xzssId, "登记部门意见", "建议批请应诉工作小组"+valueToView("dengjiyijian", oldInfo.getDjbmyj())+"办理","建议批请"+valueToView("dengjiyijian", xzssInfo.getDjbmyj())+"办理" );
    			}
    			else {
    			xzssService.save_log(xzssId, "登记部门意见", "建议批请"+oldInfo.getDjbmyj()+"办理","建议批请"+xzssInfo.getDjbmyj()+"办理" );
    			}
    		}	
		}
    	if (oldInfo.getYsundertaker_name()!=null&&xzssInfo.getYsundertaker_name()!=null) {
    		if (!(oldInfo.getYsundertaker_name().toString().trim()).equals(xzssInfo.getYsundertaker_name().toString().trim())) {
    			xzssService.save_log(xzssId, "应诉承办人", oldInfo.getYsundertaker_name(), xzssInfo.getYsundertaker_name());
    		}
		}
    	
    	
    	if (oldInfo.getBeizhu()!=null&&xzssInfo.getBeizhu()!=null) {
    		if (!((oldInfo.getBeizhu().toString().trim()).equals(xzssInfo.getBeizhu().toString().trim()))) {
    			xzssService.save_log(xzssId, "备注", oldInfo.getBeizhu(),xzssInfo.getBeizhu());
    		}	
		}
    	BeanCopier bc = BeanCopier.create(XzssInfo.class, XzssInfo.class,false);
    	bc.copy(xzssInfo, oldInfo, null);
    	xzssService.update(oldInfo);
    	return SUCCESS;
    }
    public Org getOrg()
	  {
	    User user = 
	      (User)ActionContext.getContext().getSession().get
	      ("_USER_LOGIN_");
	    String hql = "from Org org where org.id=" + user.getOrg().getId();
	    Org org = (Org)this.coreService.find(hql).get(0);
	    return org;
	  }
    
    public String showLogList() {
		logList = xzssService.getLogList(xzssId);
		totalCount = logList.size();
		return SUCCESS;
	}
    private String jieanType="";
    private String panjue="";
    private String caiding="";
    private String issifajianyi="";
    
    public String getJieanType() {
		return jieanType;
	}

	public void setJieanType(String jieanType) {
		this.jieanType = jieanType;
	}

	public String getPanjue() {
		return panjue;
	}

	public void setPanjue(String panjue) {
		this.panjue = panjue;
	}

	public String getCaiding() {
		return caiding;
	}

	public void setCaiding(String caiding) {
		this.caiding = caiding;
	}

	public String getIssifajianyi() {
		return issifajianyi;
	}

	public void setIssifajianyi(String issifajianyi) {
		this.issifajianyi = issifajianyi;
	}

	public String editJieAn() {
		XzssInfo  oldInfo=xzssService.getXzssById(xzssId);
		if (oldInfo.getJieandate()!=null&&jieandate!=null) {
    		if (!(oldInfo.getJieandate()).equals(jieandate)) {
    			xzssService.save_log(xzssId, "结案时间", oldInfo.getJieandate(), jieandate);
    		}
		}
		if (oldInfo.getJieanType()!=null&&jieanType!=null) {
    		if (!(oldInfo.getJieanType()).equals(jieanType)) {
    			xzssService.save_log(xzssId, "结案类型", valueToView("jieanType", oldInfo.getJieanType()), valueToView("jieanType", jieanType));
    		}
		}
		if ("1".equals(jieanType)) {
			if (oldInfo.getPanjue()!=null&&jieanType!=null) {
				if (!(oldInfo.getPanjue()).equals(panjue)) {
				xzssService.save_log(xzssId, "判决方式", valueToView("panjue", oldInfo.getPanjue()), valueToView("jieanType", panjue));
				}
			}
		}
		if ("2".equals(jieanType)) {
			if (oldInfo.getCaiding()!=null&&caiding!=null) {
				if (!(oldInfo.getCaiding()).equals(caiding)) {
				xzssService.save_log(xzssId, "裁定方式", valueToView("caiding", oldInfo.getCaiding()), valueToView("caiding", caiding));
				}
			}
		}
		if ("3".equals(jieanType)) {
			if (oldInfo.getTiaojie()!=null&&tiaojie!=null) {
				if (!(oldInfo.getTiaojie()).equals(tiaojie)) {
				xzssService.save_log(xzssId, "其他结案方式", valueToView("tiaojie", oldInfo.getTiaojie()), valueToView("tiaojie", tiaojie));
				}
			}
		}
		if (oldInfo.getIssifajianyi()!=null&&issifajianyi!=null) {
    		if (!(oldInfo.getIssifajianyi()).equals(issifajianyi)) {
    			xzssService.save_log(xzssId, "是否有司法建议", valueToView("issifajianyi", oldInfo.getIssifajianyi()), valueToView("issifajianyi", issifajianyi));
    		}
		}
		xzssInfo=xzssService.getXzssById(xzssId);
		xzssInfo.setJieandate(jieandate);
		xzssInfo.setJieanType(jieanType);
		xzssInfo.setPanjue(panjue);
		xzssInfo.setCaiding(caiding);
		xzssInfo.setIssifajianyi(issifajianyi);
		xzssInfo.setTiaojie(tiaojie);
		xzssInfo.setStatus("1");
		xzssService.update(xzssInfo);
		return SUCCESS;
	}
	private String  caseNumType="";
	private String caseNumYear="";
	private String caseNumNO="";
	
	public String getCaseNumType() {
		return caseNumType;
	}

	public void setCaseNumType(String caseNumType) {
		this.caseNumType = caseNumType;
	}

	public String getCaseNumYear() {
		return caseNumYear;
	}

	public void setCaseNumYear(String caseNumYear) {
		this.caseNumYear = caseNumYear;
	}

	public String getCaseNumNO() {
		return caseNumNO;
	}

	public void setCaseNumNO(String caseNumNO) {
		this.caseNumNO = caseNumNO;
	}

	public void chachongCaseNum() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String caseName1=caseNumType+"["+caseNumYear+"]"+caseNumNO+"号";
		//System.out.println(caseName1);
		XzssInfo x=this.xzssService.getXzssInfoByCaseNum(caseName1);
		if(x!=null){
			out.print("false");
			out.flush();
			out.close();
		}else{
			out.print("true");
			out.flush();
			out.close();
		}
	}
	private String zhuanbaohao="";//专报号
	String[] xzssids={};
	private String zhuanbaoids;
	
	public String getZhuanbaoids() {
		return zhuanbaoids;
	}

	public void setZhuanbaoids(String zhuanbaoids) {
		this.zhuanbaoids = zhuanbaoids;
	}

	public String[] getXzssids() {
		return xzssids;
	}

	public void setXzssids(String[] xzssids) {
		this.xzssids = xzssids;
	}

	public String getZhuanbaohao() {
		return zhuanbaohao;
	}

	public void setZhuanbaohao(String zhuanbaohao) {
		this.zhuanbaohao = zhuanbaohao;
	}
	//保存专报号
	public String saveZhuanBaoHao(){
		//System.out.println(zhuanbaoids);
		xzssids=zhuanbaoids.replaceAll(" ", "").split(",");
		for(String id : xzssids){
			XzssInfo xzssInfo1=new XzssInfo();
			xzssInfo1=this.xzssService.getXzssById(id);
			xzssInfo1.setZhuanbaohao(zhuanbaohao);
			xzssService.update(xzssInfo1);
		}
		return SUCCESS;
	}
    //下拉菜单及单选按钮值与显示的转化
    public String valueToView(String type,String v) {
		if (type=="manageType") {
			//System.out.println(v);
			switch (Integer.valueOf(v)) {
			case 0: return "无"; 
			case 1:	return "公安";
			case 2: return "国家安全";
			case 3: return "劳动和社会保障";
			case 4: return "司法行政";
			case 5: return "民政";
			case 6: return "土地";
			case 7: return "地矿";
			case 8: return "环保";
			case 9: return "农业";
			case 10: return "水利";
			case 11: return "林业";
			case 12: return "城市规划";
			case 13: return "房屋拆迁";
			case 14: return "房屋登记";
			case 15: return "工商";
			case 16: return "质监";
			case 17: return "商务";
			case 18: return "物价";
			case 19: return "能源";
			case 20: return "交通";
			case 21: return "信息产业";
			case 22: return "邮政";
			case 23: return "烟草专卖";
			case 24: return "税务";
			case 25: return "人民银行";
			case 26: return "证监";
			case 27: return "保监";
			case 28: return "银监";
			case 29: return "外汇";
			case 30: return "财政";
			case 31: return "统计";
			case 32: return "审计";
			case 33: return "海关";
			case 34: return "商检";
			case 35: return "药监";
			case 36: return "卫生";
			case 37: return "计划生育";
			case 38: return "教育";
			case 39: return "文化";
			case 40: return "专利";
			case 41: return "商标";
			case 42: return "版权";
			case 43: return "旅游";
			case 44: return "其他";
			}
		}
		if(type=="caseType") {
			switch (Integer.valueOf(v)) {
			case 0: return "无"; 
			case 1:	return "行政处罚";
			case 2: return "行政强制措施";
			case 3: return "行政征收";
			case 4: return "行政许可";
			case 5: return "行政确权";
			case 6: return "干预经营自主权";
			case 7: return "信息公开";
			case 8: return "行政不作为";
			case 9: return "其他";
			}
		}
		if (type=="court") {
			switch (Integer.valueOf(v)) {
			case 0: return "无"; 
			case 1:	return "北京市高级人民法院";
			case 2: return "北京市第一中级人民法院 ";
			case 3: return "北京市第二中级人民法院 ";
			case 4: return "北京市第三中级人民法院";
			case 5: return "北京市第四中级人民法院（铁中院）";
			case 6: return "北京市东城区法院";
			case 7: return "北京市西城区法院";
			case 8: return "北京市朝阳区法院";
			case 9: return "北京市海淀区法院";
			case 10: return "北京市平谷区法院";
			case 11: return "北京市石景山区法院";
			case 12: return "北京市门头沟区法院";
			case 13: return "北京市房山区法院 ";
			case 14: return "北京市大兴区法院";
			case 15: return "北京市通州区法院";
			case 16: return "北京市昌平区法院";
			case 17: return "北京市顺义区法院";
			case 18: return "北京市怀柔区法院";
			case 19: return "北京市平谷区法院";
			case 20: return "北京市密云县法院";
			case 21: return "北京市延庆县法院";
			case 22: return "北京市铁路运输法院";
			}
		}
		if (type=="appType") {
			switch (Integer.valueOf(v)) {
			case 1:return "公民";
			case 2:return "法人、其他组织";
			}
		}
		if (type=="peichang") {
			switch (Integer.valueOf(v)) {
			case 0:return "未提起行政赔偿";
			case 1:return "提起行政赔偿";
			}
		}
		if (type=="jieanType") {
			switch (Integer.valueOf(v)) {
			case 1:return "判决";
			case 2:return "裁定";
			case 3:return "其他";
			}
		}
		if (type=="panjue") {
			switch (Integer.valueOf(v)) {
			case 0:return "无";
			case 1:return "驳回上诉，维持原判决";
			case 2:return "驳回诉讼请求";
			case 3:return "全部撤销";
			case 4:return "全部撤销并重作";
			case 5:return "部分撤销";
			case 6:return "部分撤销并重作";
			case 7:return "履行法定职责";
			case 8:return "履行给付义务";
			case 9:return "确认违法";
			case 10:return "确认无效";
			case 11:return "变更";
			case 12:return "行政协议履行";
			case 13:return "行政协议补偿";
			}
		}
		if (type=="caiding") {
			switch (Integer.valueOf(v)) {
			case 0:return "无";
			case 1:return "驳回上诉，维持原裁定";
			case 2:return "撤销原判，发回重审";
			case 3:return "驳回起诉";
			case 4:return "准许原告主动撤诉";
			case 5:return "准许原告因被告改变原行政行为撤诉";
			case 6:return "终结诉讼";
			case 7:return "其他";
			}
		}
		if (type=="调解") {
			switch (Integer.valueOf(v)) {
			case 0:return "无";
			case 1:return "调解";
			case 2:return "其他";
			}
		}
		if (type=="issifajianyi") {
			switch (Integer.valueOf(v)) {
			case 1:return "是";
			case 0:return "否";
			}
		}
		if(type=="dengjiyijian"){
			switch (Integer.valueOf(v)) {
			case 0:return "空";
			case 1:return "伊宏伟";
			case 2:return "谢波";
			case 3:return "史静";
			case 4:return "张童";
			}
		}
		return "0";
	}
}
