package com.taiji.meet.webwork;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;
import slime.util.IOStream.IOStream;
import com.opensymphony.xwork.ActionContext;
import com.taiji.ashjl.service.AshjlService;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.EvidenceAttachment;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyCompany;
import com.taiji.fzb.domain.XzfyDftz;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyKeyword;
import com.taiji.fzb.domain.XzfyRecieve;
import com.taiji.fzb.domain.XzfyShenpi;
import com.taiji.fzb.domain.XzfyWeiban;
import com.taiji.fzb.domain.XzfyXcdc;
import com.taiji.fzb.service.BananService;
import com.taiji.fzb.service.BsqrService;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzfyService;
import com.taiji.tzjl.service.TzjlService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.webTemplate.domain.WtTemplate;
import com.taiji.webTemplate.service.WtTemplateService;
import com.taiji.meet.domin.Client;
import com.taiji.meet.domin.Meet;
import com.taiji.meet.service.MeetService;
import com.util.DateUtil;
import com.taiji.fzb.service.BananService;

import java.sql.*;
public class MeetAction extends ProtectedDetailAction {
	private static final long serialVersionUID = 1L;
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private Integer pageSize = 12; // 分页列表每页显示个数
	private Integer totalPage = 0; // 分页列表页面总数
	private MeetService meetService = null; // 模板业务层方法
	private BananService bananService = null;
	private String startDateShow; 
	private String endDateShow; 
	public BananService getBananService() {
		return bananService;
	}



	public void setBananService(BananService bananService) {
		this.bananService = bananService;
	}




	private String tempid;
	private List<String> fileContentList=new ArrayList<String>();
    private String Main_id;
    public String getMain_id() {
		return Main_id;
	}



	public void setMain_id(String mainId) {
		Main_id = mainId;
	}









	public String getTempid() {
		return tempid;
	}



	public void setTempid(String tempid) {
		this.tempid = tempid;
	}



	public List<String> getFileContentList() {
		return fileContentList;
	}



	public void setFileContentList(List<String> fileContentList) {
		this.fileContentList = fileContentList;
	}




	private String filepath;
    private String realfilepath;
    private List<Meet> allUnsetList;
    private List<Meet> allSetupList;
	private List<Meet> meetList;
	private List<Meet> allList;
	private int pNum=1;
	private int clientid;
	private String Client_name;
	private String action;
	private String stitle;
	private String sMeet_type;
	private Set<Client> allClients;
	private List<Client> allClientsList;
	private List appList;

	private String xzfyId;
	private User user;
	private XzfyInfo xzfyInfo;
	private XzfyApp xzfyApp;
	private int appId;
	private String sendValue;
	private String protype="1";
	private String textId;
	private String todate;
	private String admit_name;
	private Integer admitid;
	private String countId;
	private String appCount;
	private String face_allnumber;
	private Client client;
	private Meet meet;
	private XzfyKeyword xzfyKeyword;
	public XzfyKeyword getXzfyKeyword() {
		return xzfyKeyword;
	}



	public void setXzfyKeyword(XzfyKeyword xzfyKeyword) {
		this.xzfyKeyword = xzfyKeyword;
	}




	private String facetime;
	private String admit1;
	private String admit2;
	private String faceaddress;
	private String mainidd;
	private String caseorgname;
	private String meet_type;
	private String orgName;

	private List arrayList = new ArrayList();
	private List keywordList = new ArrayList();
	private List keywordListname = new ArrayList();
	public List getKeywordListname() {
		return keywordListname;
	}



	public void setKeywordListname(List keywordListname) {
		this.keywordListname = keywordListname;
	}




	private String sljg="";
	private String locbm="";






	public String getLocbm() {
		return locbm;
	}



	public void setLocbm(String locbm) {
		this.locbm = locbm;
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



	public MeetService getMeetService() {
		return meetService;
	}



	public void setMeetService(MeetService meetService) {
		this.meetService = meetService;
	}







	public String getFilepath() {
		return filepath;
	}



	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}



	public String getRealfilepath() {
		return realfilepath;
	}



	public void setRealfilepath(String realfilepath) {
		this.realfilepath = realfilepath;
	}



	public List<Meet> getAllUnsetList() {
		return allUnsetList;
	}



	public void setAllUnsetList(List<Meet> allUnsetList) {
		this.allUnsetList = allUnsetList;
	}



	public List<Meet> getAllSetupList() {
		return allSetupList;
	}



	public void setAllSetupList(List<Meet> allSetupList) {
		this.allSetupList = allSetupList;
	}



	public List<Meet> getMeetList() {
		return meetList;
	}



	public void setMeetList(List<Meet> meetList) {
		this.meetList = meetList;
	}



	public List<Meet> getAllList() {
		return allList;
	}



	public void setAllList(List<Meet> allList) {
		this.allList = allList;
	}



	public int getpNum() {
		return pNum;
	}



	public void setpNum(int pNum) {
		this.pNum = pNum;
	}



	public int getClientid() {
		return clientid;
	}



	public void setClientid(int clientid) {
		this.clientid = clientid;
	}



	public String getClient_name() {
		return Client_name;
	}



	public void setClient_name(String clientName) {
		Client_name = clientName;
	}

	public String getStitle() {
		return stitle;
	}



	public void setStitle(String stitle) {
		this.stitle = stitle;
	}



	public String getsMeet_type() {
		return sMeet_type;
	}



	public void setsMeet_type(String sMeetType) {
		sMeet_type = sMeetType;
	}



	public Set<Client> getAllClients() {
		return allClients;
	}



	public void setAllClients(Set<Client> allClients) {
		this.allClients = allClients;
	}











	public String getXzfyId() {
		return xzfyId;
	}



	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}



	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}



	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}



	public XzfyApp getXzfyApp() {
		return xzfyApp;
	}



	public void setXzfyApp(XzfyApp xzfyApp) {
		this.xzfyApp = xzfyApp;
	}



	public int getAppId() {
		return appId;
	}



	public void setAppId(int appId) {
		this.appId = appId;
	}



	public String getSendValue() {
		return sendValue;
	}



	public void setSendValue(String sendValue) {
		this.sendValue = sendValue;
	}



	public String getProtype() {
		return protype;
	}



	public void setProtype(String protype) {
		this.protype = protype;
	}



	public String getTextId() {
		return textId;
	}



	public void setTextId(String textId) {
		this.textId = textId;
	}



	public String getTodate() {
		return todate;
	}



	public void setTodate(String todate) {
		this.todate = todate;
	}



	public String getAdmit_name() {
		return admit_name;
	}



	public void setAdmit_name(String admitName) {
		admit_name = admitName;
	}



	public String getCountId() {
		return countId;
	}



	public void setCountId(String countId) {
		this.countId = countId;
	}



	public String getAppCount() {
		return appCount;
	}



	public void setAppCount(String appCount) {
		this.appCount = appCount;
	}



	public String getFace_allnumber() {
		return face_allnumber;
	}



	public void setFace_allnumber(String faceAllnumber) {
		face_allnumber = faceAllnumber;
	}



	public Client getClient() {
		return client;
	}



	public void setClient(Client client) {
		this.client = client;
	}



	public Meet getMeet() {
		return meet;
	}



	public void setMeet(Meet meet) {
		this.meet = meet;
	}
	@Override
	public Class<Meet> getPersistentClass() {
		return Meet.class;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getAction() {
		return action;
	}

	public String getFacetime() {
		return facetime;
	}



	public void setFacetime(String facetime) {
		this.facetime = facetime;
	}



	public String getAdmit1() {
		return admit1;
	}



	public void setAdmit1(String admit1) {
		this.admit1 = admit1;
	}



	public String getAdmit2() {
		return admit2;
	}



	public void setAdmit2(String admit2) {
		this.admit2 = admit2;
	}



	public void setFaceaddress(String faceaddress) {
		this.faceaddress = faceaddress;
	}



	public String getFaceaddress() {
		return faceaddress;
	}



	public void setAppList(List appList) {
		this.appList = appList;
	}



	public List getAppList() {
		return appList;
	}



	public void setAllClientsList(List<Client> allClientsList) {
		this.allClientsList = allClientsList;
	}



	public List<Client> getAllClientsList() {
		return allClientsList;
	}






	private List<Client> clientList;
	private List bananList;

	public void setClientList(List<Client> clientList) {
		this.clientList = clientList;
	}



	public List<Client> getClientList() {
		return clientList;
	}



	@SuppressWarnings("unchecked")
	public String showMeetList() {
		try {
			action = "meet_face";
			this.allList = this.meetService.getAllList();
			this.pageList = this.meetService.getMeetList(pNum, this.pageSize);
			this.meetList = this.pageList.getItems();
			this.setTotalPage(this.pageList.getTotalPage());
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@SuppressWarnings("unchecked")
	public String showSearchList() {
		try {
			action = "meet_SearchList";
			this.allList = this.meetService.FindAllList(stitle,facetime,admit1,admit2,sMeet_type);
			this.pageList = this.meetService.FindList(pNum, this.pageSize,stitle,facetime,admit1,admit2,sMeet_type);
			this.meetList = this.pageList.getItems();			
			this.totalPage = this.pageList.getTotalPage();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}	
	public String showMeet() {                            
		try {
			meet = new Meet();
			meet = meetService.getMeetById(Main_id);
			//allClients=meet.getClient();
			setAllClientsList(new ArrayList<Client>(allClients));
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	public String getMeetById() {
		meet = this.meetService.getMeetById(Main_id);

		return SUCCESS;
	}
	
	private RecordService recordService = null; 
	private XzfyCompany xzfyCom;
	
	public XzfyCompany getXzfyCom() {
		return xzfyCom;
	}



	public void setXzfyCom(XzfyCompany xzfyCom) {
		this.xzfyCom = xzfyCom;
	}



	public RecordService getRecordService() {
		return recordService;
	}



	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	String localBm;

	public String gotoCreate1() {
		try {	
			String bumen=recordService.getOrg().getLocbm();
			Org org1=this.recordService.getRootOrg(bumen);
			localBm = org1.getLocbm();
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS")
			.format(new Date());
			Random random = new Random();
			mainidd = currentTime + random.nextInt(10000);
			Org org=this.recordService.getOrg();
			xzfyCom=this.recordService.getXzfyComById(org.getLocbm(),org.getName());
			Date dt = new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			todate = df.format(dt);

			user = new User();
			user = (User) ActionContext.getContext().getSession().get(
					"_USER_LOGIN_");
			admit_name=user.getName();
			admitid=user.getId();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	public String saveMeet(){   //保存阅卷meet表
            //保存
		Org org=recordService.getOrg();
		System.out.println(org.getLocbm());
		caseorgname=recordService.getRootOrg(org.getLocbm()).getName();
		meet.setMain_id(mainidd);
		meet.setCaseOrg(org.getLocbm());
		meet.setCaseOrg_name(caseorgname);
		meet.setFace_time("1");
		meetService.saveOrUpdate(meet);
		//mainidd=meet.getMain_id();
		return SUCCESS;
	}







	public String createClient(){
		return SUCCESS;
	}



	public String deleteClient(){
		client=new Client();
		client=meetService.getClientById(clientid);
		meetService.deleteClientById(clientid);
		return SUCCESS;
	}
	

	public String updateClient(){
		client=new Client();
		client=meetService.getClientById(clientid);
		return SUCCESS;
	}
	

	public String doUpdateClient(){
		meet=new Meet();
		meet.setMain_id(Main_id);
		client.setMeet(meet);
		meetService.update(client);
		return SUCCESS;
	}

	public String showDaibanList() {
		/*user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		locbm = this.recordService.getOrg().getLocbm();
		admit_name=user.getName();
		admitid=user.getId();
		//System.out.println(admit_name);
		try {
			//System.out.println(super.getPageNum());
			//System.out.println(pageSize);
			this.pageList = this.meetService.getBananListByPage(super.getPageNum(), pageSize,xzfyInfo,locbm);
			
			this.setBananList(this.pageList.getItems());
			this.totalPage = this.pageList.getTotalPage();
			allList = meetService.getBananList(locbm);
			
			XzfyInfo x = new XzfyInfo();
			Set a =  x.getXzfyApps();
			Iterator i =  a.iterator();
			while (i.hasNext()){
				XzfyApp app = (XzfyApp) i.next();
				tempname = "";
				tempname=tempname+app.getApp_name()+" ";
			}
			if(xzfyInfo==null){
				xzfyInfo=new XzfyInfo();
			}
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}*/
		this.user = new User();
	    this.user = ((User)ActionContext.getContext().getSession().get("_USER_LOGIN_"));
	    this.locbm = this.recordService.getOrg().getLocbm();
	    this.admit_name = this.user.getName();
	    this.admitid = this.user.getId();
	    try
	    {
	      this.pageList = this.meetService.getBananListByPage(super.getPageNum(), this.pageSize.intValue(), this.xzfyInfo, this.locbm);

	      setBananList(this.pageList.getItems());
	      this.totalPage = Integer.valueOf(this.pageList.getTotalPage());

	      if (this.xzfyInfo == null)
	        this.xzfyInfo = new XzfyInfo();

	      return "success";
	    } catch (Exception e) {
	      e.printStackTrace(); }
	    return "error";
	}
	public String showDaibanList1() {
		/*user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		locbm = this.recordService.getOrg().getLocbm();
		admit_name=user.getName();
		admitid=user.getId();
		//System.out.println(admit_name);
		try {
			//System.out.println(super.getPageNum());
			//System.out.println(pageSize);
			this.pageList = this.meetService.getBananListByPage1(super.getPageNum(), pageSize,xzfyInfo,locbm);
			this.setBananList(this.pageList.getItems());
			this.totalPage = this.pageList.getTotalPage();
			allList = meetService.getBananList1(locbm);
			XzfyInfo x = new XzfyInfo();
			Set a =  x.getXzfyApps();
			Iterator i =  a.iterator();
			while (i.hasNext()){
				XzfyApp app = (XzfyApp) i.next();
				tempname = "";
				tempname=tempname+app.getApp_name()+" ";
			}
			if(xzfyInfo==null){
				xzfyInfo=new XzfyInfo();
			}
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}*/
		this.user = new User();
	    this.user = ((User)ActionContext.getContext().getSession().get("_USER_LOGIN_"));
	    this.locbm = this.recordService.getOrg().getLocbm();
	    this.admit_name = this.user.getName();
	    this.admitid = this.user.getId();
	    try
	    {
	      this.pageList = this.meetService.getBananListByPage1(super.getPageNum(), this.pageSize.intValue(), this.xzfyInfo, this.locbm);
	      setBananList(this.pageList.getItems());
	      this.totalPage = Integer.valueOf(this.pageList.getTotalPage());

	      if (this.xzfyInfo == null)
	        this.xzfyInfo = new XzfyInfo();

	      return "success";
	    } catch (Exception e) {
	      e.printStackTrace(); }
	    return "error";
	}
	public String updatezhuanjiaocailiao() {
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS")
		.format(new Date());
		Random random = new Random();
		mainidd = currentTime + random.nextInt(10000);
		Org org=this.recordService.getOrg();
		xzfyCom=this.recordService.getXzfyComById(org.getLocbm(),org.getName());
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		todate = df.format(dt);		
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		admitid=user.getId();
		xzfyInfo=meetService.getXzfyById(tempid);
		String[] str = xzfyInfo.getJdFileContent().split("\n");
		for(int i=1;i<str.length-1;i++)
			fileContentList.add(str[i]);
		return "success";
}
	
	
	public String updateyuejuan() {
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS")
		.format(new Date());
		Random random = new Random();
		mainidd = currentTime + random.nextInt(10000);
		Org org=this.recordService.getOrg();
		xzfyCom=this.recordService.getXzfyComById(org.getLocbm(),org.getName());
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		todate = df.format(dt);
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		admitid=user.getId();
		xzfyInfo=meetService.getXzfyById(tempid);
		//System.out.println(xzfyInfo.getId());
		return "success";
}



	public void setBananList(List bananList) {
		this.bananList = bananList;
	}



	public List getBananList() {
		return bananList;
	}



	public void setMainidd(String mainidd) {
		this.mainidd = mainidd;
	}



	public String getMainidd() {
		return mainidd;
	}
	private List jiedaiList;
	private int totalCount=0;
	public String 	showYiBanJieDaiList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		admitid=user.getId();
		this.pageList = this.meetService.getYiBanJieDaiList(pNum,pageSize,meet,user);
		this.setJiedaiList(this.pageList.getItems());
		this.totalPage = this.pageList.getTotalPage();
		setTotalCount(pageList.getTotalCount());
		if(meet==null){
			meet=new Meet();}
		return "success";
	}
	public String 	showYueJuanList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		admitid=user.getId();
		
		this.pageList = this.meetService.getYueJuanList(pNum,pageSize,meet,user);
		this.setJiedaiList(this.pageList.getItems());
		this.totalPage = this.pageList.getTotalPage();
		setTotalCount(pageList.getTotalCount());
		if(meet==null)
			meet=new Meet();
		return "success";
	}
	public String 	showSongDaList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		admitid=user.getId();
		
		this.pageList = this.meetService.getSongDaList(pNum,pageSize,meet,user);
		this.setJiedaiList(this.pageList.getItems());
		this.totalPage = this.pageList.getTotalPage();
		setTotalCount(pageList.getTotalCount());
		if(meet==null)
			meet=new Meet();
		return "success";
	}
	public String 	showZhuanJiaoCaiLiaoList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		admitid=user.getId();
		
		
		this.pageList = this.meetService.getZhuanJiaoCaiLiaoList(pNum,pageSize,meet,user);
		this.setJiedaiList(this.pageList.getItems());
		this.totalPage = this.pageList.getTotalPage();
		setTotalCount(pageList.getTotalCount());
		if(meet==null)
			meet=new Meet();
		return "success";
	}

	public void setJiedaiList(List jiedaiList) {
		this.jiedaiList = jiedaiList;
	}



	public List getJiedaiList() {
		return jiedaiList;
	}



	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}



	public int getTotalCount() {
		return totalCount;
	}



	public void setCaseorgname(String caseorgname) {
		this.caseorgname = caseorgname;
	}



	public String getCaseorgname() {
		return caseorgname;
	}



private String bumen="";
private String startDate="";
private String endDate="";
private String startDate1="";
private String endDate1="";	
public String sysDate="";
private List totalList = new ArrayList();
private int searchpeid;	
ArrayList<ArrayList<String>> dataList = new ArrayList<ArrayList<String>>();	




public String tongJi() throws Exception { 
		Date date=new Date();
		sysDate=DateUtil.getDatestrByDateFormat(date,"yyyy年MM月dd日 HH时mm分");
		arrayList.add("行政处罚");
		arrayList.add("行政强制措施");
		arrayList.add("行政征收");
		arrayList.add("行政许可");
		arrayList.add("行政确权");
		arrayList.add("干预经营自主权");
		arrayList.add("信息公开");
		arrayList.add("行政不作为");
		arrayList.add("其他");
		arrayList.add("总计");
		System.out.println(orgName);
		if(orgName.equals("全部")){
			ArrayList<ArrayList<String>> weekLists = meetService.getWeekLists(startDate, endDate);
			setTotalList(meetService.getTongjiForm18(startDate1, endDate1,orgName,sljg));
		}else{
		ArrayList<ArrayList<String>> weekLists = meetService.getWeekLists(startDate, endDate);
		setTotalList(meetService.getTongjiForm18(startDate1, endDate1,locbm,sljg));
		}
		startDateShow = DateUtil.getDateByFormat(startDate1, "yyyy-MM-dd", "yyyy年MM月dd日");
		endDateShow = DateUtil.getDateByFormat(endDate1, "yyyy-MM-dd", "yyyy年MM月dd日");
		return SUCCESS;		
	}
public String tongJi_2() throws Exception {
	Date date=new Date();
	sysDate=DateUtil.getDatestrByDateFormat(date,"yyyy年MM月dd日 HH时mm分");
	keywordList=bananService.getXzfyKeywordListByLocbm(locbm);
	for (int i=0;i<keywordList.size();i++){

		xzfyKeyword = new XzfyKeyword();
		xzfyKeyword=(XzfyKeyword)keywordList.get(i);
		keywordListname.add(xzfyKeyword.getKeyword());
	}
		ArrayList<ArrayList<String>> weekLists = meetService.getWeekLists(startDate, endDate);
		setTotalList(meetService.getTongjiForm18_2(keywordListname,startDate1, endDate1,locbm,sljg));
		startDateShow = DateUtil.getDateByFormat(startDate1, "yyyy-MM-dd", "yyyy年MM月dd日");
		endDateShow = DateUtil.getDateByFormat(endDate1, "yyyy-MM-dd", "yyyy年MM月dd日");
	return SUCCESS;		
}
public String tongJi_3() throws Exception {

	return SUCCESS;		
}

	public ArrayList<ArrayList<String>> getJieAnTongJiByWeekLists(String startDate, String endDate, String locbm) throws SQLException {
		if (null != startDate && !"".equals(startDate)) {
			startDate = DateUtil.getMonDayByDate(startDate, "yyyy-MM-dd");
		}
		if (null != endDate && !"".equals(endDate)) {
			endDate = DateUtil.getSunDayByDate(endDate, "yyyy-MM-dd");
		}
		ArrayList<ArrayList<String>> weekLists = meetService.getWeekLists(startDate, endDate);
		return meetService.getJieAnTongJiByWeekLists(weekLists, locbm);
	}
	public ArrayList<String> getJieAnTongJiTotalList(String startDate, String endDate, String locbm, Number searchpeid) throws SQLException {
		if (null != startDate && !"".equals(startDate)) {
			startDate = DateUtil.getMonDayByDate(startDate, "yyyy-MM-dd");
		}
		if (null != endDate && !"".equals(endDate)) {
			endDate = DateUtil.getSunDayByDate(endDate, "yyyy-MM-dd");
		}
		ArrayList<ArrayList<String>> weekLists = meetService.getWeekLists(startDate, endDate);
		return meetService.getJieAnTongJiTotalList(startDate, endDate, locbm, weekLists,searchpeid);
	}



	public void setBumen(String bumen) {
		this.bumen = bumen;
	}



	public String getBumen() {
		return bumen;
	}



	public void setTotalList(List totalList) {
		this.totalList = totalList;
	}



	public List getTotalList() {
		return totalList;
	}
	public String getStartDate() {
		return startDate;
	}



	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}



	public String getEndDate() {
		return endDate;
	}



	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}



	public String getSysDate() {
		return sysDate;
	}



	public void setSysDate(String sysDate) {
		this.sysDate = sysDate;
	}



	public int getSearchpeid() {
		return searchpeid;
	}



	public void setSearchpeid(int searchpeid) {
		this.searchpeid = searchpeid;
	}
	public ArrayList<ArrayList<String>> getDataList() {
		return dataList;
	}



	public void setDataList(ArrayList<ArrayList<String>> dataList) {
		this.dataList = dataList;
	}
	public void setArrayList(List arrayList) {
		this.arrayList = arrayList;
	}



	public List getArrayList() {
		return arrayList;
	}




	public void setKeywordList(List keywordList) {
		this.keywordList = keywordList;
	}



	public List getKeywordList() {
		return keywordList;
	}




	public void setSljg(String sljg) {
		this.sljg = sljg;
	}



	public String getSljg() {
		return sljg;
	}



	public void setAdmitid(Integer admitid) {
		this.admitid = admitid;
	}



	public Integer getAdmitid() {
		return admitid;
	}



	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}



	public String getOrgName() {
		return orgName;
	}



	public String getStartDate1() {
		return startDate1;
	}



	public void setStartDate1(String startDate1) {
		this.startDate1 = startDate1;
	}



	public String getEndDate1() {
		return endDate1;
	}



	public void setEndDate1(String endDate1) {
		this.endDate1 = endDate1;
	}



	public String getStartDateShow() {
		return startDateShow;
	}



	public void setStartDateShow(String startDateShow) {
		this.startDateShow = startDateShow;
	}



	public String getEndDateShow() {
		return endDateShow;
	}



	public void setEndDateShow(String endDateShow) {
		this.endDateShow = endDateShow;
	}



	public String getLocalBm() {
		return localBm;
	}



	public void setLocalBm(String localBm) {
		this.localBm = localBm;
	}





}
