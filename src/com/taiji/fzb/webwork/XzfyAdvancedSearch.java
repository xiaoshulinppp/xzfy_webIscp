package com.taiji.fzb.webwork;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzfySearchService;
import com.taiji.fzb.service.XzfyService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.waiwangTB.domain.XzfyInfo2;
import com.taiji.waiwangTB.domain.XzfyInfo_w;
import com.util.DateUtil;

import localhost.zxfy.services.datesent.DatesentProxy;

public class XzfyAdvancedSearch extends ProtectedDetailAction{

	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}

	private PaginationSupport pageList;
	private XzfySearchService xzfySearchService=null;
	
	private Integer totalPage=0;
	private Integer pageSize=15;
	private Integer pNum=1;
	
	private List currentSearchList;
	private List<XzfyInfo2> currentSearchList2=new ArrayList<XzfyInfo2>();
	private List allSearchList;
	
	private String workName="";//单位名称caseorg
	private String applicant="";//申请人app_show
	
	private String receiveCaseDate1="";//收案日期1receive_date
	private String receiveCaseDate2="";//收案日期2
	
	private String finishCaseDate1="";//结案日期1finish_date
	private String finishCaseDate2="";//结案日期2
	
	private String undertaker="";//承办人user2_name
	private String undertakerSecond="";//第二承办人user3_name
	private String caseNo="";//案件号casenum
	private String representative="";//代表人名称deputy_show
	
	private String caseNumBFY="";//被复议的具体行为：案号xwnum
	private String caseNameBFY="";//被复议的具体行为：名称xwname
	private String respondent="";//被申请人defendant_real_name
	
	private String applicantType="";//申请人类别app_type
	private String fyByMultis="";//多人复议isMany
	
	private String itemsFyApp="";//申请复议事项app_type1
	private String subOfSqfy="";//申请复议子选项app_type2
	private String agent="";//代理人agent
	
	private String adminManageType="";//行政管理类别guanli1
	private String subOfXzgl="";//行政管理子选项guanli2
	private String fyPrepose="";//复议前置isfront
	
	private String adminCompen="";//是否行政赔偿ismoney
	private String complement="";//是否补证bztz_flag
	
	private String checkFile="";//对规范性文件审查ischeck
	private String dealWithFile="";//来件处理stadardResult
	
	private String delay="";//是否延期isdelay
	private String terminate="";//是否中止isstop
	
//	private String wayOfTrial="";//审理方式trailMode
	private String wayOfFinish="";//结案方式finish_type
	
	private String opinionOfXzfy="";//行政复议意见书opinionFile
	private String adviceOfXzfy="";//行政复议建议书adviseFile
	
	private XzfyInfo xzfyInfo;
	
	private String queryType;//查询类别,值："1"——全部;"2"——单个
	
	private String xzgl;//新增管理类别
	
	private String fysx;//案件类型
	
	private String fyjg;//复议机关
	
	
	
	public List<XzfyInfo2> getCurrentSearchList2() {
		return currentSearchList2;
	}
	public void setCurrentSearchList2(List<XzfyInfo2> currentSearchList2) {
		this.currentSearchList2 = currentSearchList2;
	}
	public String getFyjg() {
		return fyjg;
	}
	public void setFyjg(String fyjg) {
		this.fyjg = fyjg;
	}
	public String getXzgl() {
		return xzgl;
	}
	public void setXzgl(String xzgl) {
		this.xzgl = xzgl;
	}
	public String getFysx() {
		return fysx;
	}
	public void setFysx(String fysx) {
		this.fysx = fysx;
	}

	private String id;
	private RecordService recordService = null;
	public RecordService getRecordService() {return recordService;	}
	public void setRecordService(RecordService recordService) {		this.recordService = recordService;	}
	public String showQueryRequirement(){
		 return SUCCESS;	
	}
	
	private String locbm;
	public String getLocbm() {
		return locbm;
	}
	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}
	
	private String count_type1;
	public String getCount_type1() {
		return count_type1;
	}
	public void setCount_type1(String count_type1) {
		this.count_type1 = count_type1;
	}
	
	public String getAnjianma() {
		return anjianma;
	}
	public void setAnjianma(String anjianma) {
		this.anjianma = anjianma;
	}

	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	

	public String getG_cxm() {
		return g_cxm;
	}
	public void setG_cxm(String g_cxm) {
		this.g_cxm = g_cxm;
	}
	public String getG_sljg() {
		return g_sljg;
	}
	public void setG_sljg(String g_sljg) {
		this.g_sljg = g_sljg;
	}
	public String getG_sqname() {
		return g_sqname;
	}
	public void setG_sqname(String g_sqname) {
		this.g_sqname = g_sqname;
	}
	public String getG_phone() {
		return g_phone;
	}
	public void setG_phone(String g_phone) {
		this.g_phone = g_phone;
	}
	public String getG_Datefrom() {
		return g_Datefrom;
	}
	public void setG_Datefrom(String g_Datefrom) {
		this.g_Datefrom = g_Datefrom;
	}
	public String getG_Dateto() {
		return g_Dateto;
	}
	public void setG_Dateto(String g_Dateto) {
		this.g_Dateto = g_Dateto;
	}

	public String getG_caseorg() {
		return g_caseorg;
	}
	public void setG_caseorg(String g_caseorg) {
		this.g_caseorg = g_caseorg;
	}

	public String getW_queryType() {
		return w_queryType;
	}
	public void setW_queryType(String w_queryType) {
		this.w_queryType = w_queryType;
	}

	private String queryStr="";  //页面返回的全文检索关键词,页面返回的全文检索关键词,页面返回的全文检索关键词,页面返回的全文检索关键词
	
	private String anjianma=""; 
	private String name1="";//在线查询为1来信查询为2
	
	
	private String g_cxm=""; 
	private String g_sljg="";
	private String g_sqname="";
	private String g_phone="";
	private String g_Datefrom="";
	private String g_Dateto="";
	
	private String g_caseorg="";//查询本部门
	private String w_queryType="";//查询本部门
	
	
	
	public String  anjiancx(){
		
		name1=name1.trim();//复议方式
		g_cxm=g_cxm.trim();
		g_sljg=g_sljg.trim();
		g_sqname=g_sqname.trim();
		g_phone=g_phone.trim();
		g_Datefrom=g_Datefrom.trim();
		g_Dateto=g_Dateto.trim();
		
		anjianma=anjianma.trim();
          String g_sljg2="";		
		  if ((g_sljg != null) && (!(g_sljg.equals("")))) {
			  
			  Org org=this.recordService.getRootOrg_locName(g_sljg);  
			  g_sljg2=org.getLocbm();
			  
			  if(g_sljg2==null){
				  
				  g_sljg2="nnn";
			  }
		  }
		
		//1为当面 ，2为来信
		// queryType="1";
		  if(pNum==null){
			  pNum=1;
		  }
		  
		  pageList=xzfySearchService.getCurrentList_w(anjianma,g_caseorg,w_queryType,pNum,pageSize,name1,g_cxm,g_sljg2,g_sqname,g_phone,g_Datefrom,g_Dateto);
		
		 
		 // allSearchList=xzfySearchService.getAllList(queryType,applicant,receiveCaseDate1,receiveCaseDate2,finishCaseDate1,finishCaseDate2,undertaker,undertakerSecond,caseNo,representative,caseNumBFY,caseNameBFY,respondent,applicantType,fyByMultis,itemsFyApp,subOfSqfy,agent,adminManageType,subOfXzgl,fyPrepose,adminCompen,complement,checkFile,dealWithFile,delay,terminate,wayOfFinish,opinionOfXzfy,adviceOfXzfy,xzgl,fysx,fyjg);
		 currentSearchList=pageList.getItems();
		// currentSearchList2=pageList.getItems();
		 for (int  i=0;i<currentSearchList.size();i++)
			{
			 XzfyInfo2 xzfyInfo2=new XzfyInfo2();
			
			// xzfyInfo2=(XzfyInfo2) currentSearchList.get(i);
			
			 xzfyInfo2.setId(((XzfyInfo2)currentSearchList.get(i)).getId());
			 xzfyInfo2.setJiansuom(((XzfyInfo2)currentSearchList.get(i)).getJiansuom());
			 xzfyInfo2.setApp_show(((XzfyInfo2)currentSearchList.get(i)).getApp_show());
			 //采用这种麻烦的做饭的原因是前台显示需要将手里单位的编码转换为单位名称，如果直接查询更改元对象的值会引起自动更新的，导致数据库的编码变成单位名称。
			 xzfyInfo2.setCaseorg(this.recordService.getRootOrg(((XzfyInfo2)currentSearchList.get(i)).getCaseorg()).getName());
			 xzfyInfo2.setYanzhengsj(((XzfyInfo2)currentSearchList.get(i)).getYanzhengsj());
			 xzfyInfo2.setReceive_real_date(((XzfyInfo2)currentSearchList.get(i)).getReceive_real_date());
			 
			 xzfyInfo2.setZl_time((((XzfyInfo2)currentSearchList.get(i)).getZl_time()));;
			 
		//	 xzfyInfo2.setCaseorg(this.recordService.getRootOrg(xzfyInfo2.getCaseorg()).getName());;
			   
			 currentSearchList2.add(xzfyInfo2);
			 //  currentSearchList2.get(0).getCaseorg()
			}
		 
		 totalPage=pageList.getTotalPage();
		
		  return SUCCESS;
	}
	
	
	
	public String showQueryResult(){
		try{
//			 undertaker = new String(undertaker.getBytes("ISO8859-1"), "UTF-8");
			 queryType="1";
			 pageList=xzfySearchService.getCurrentList(queryType,pNum,pageSize,applicant,receiveCaseDate1,receiveCaseDate2,finishCaseDate1,finishCaseDate2,undertaker,undertakerSecond,caseNo,representative,caseNumBFY,caseNameBFY,respondent,applicantType,fyByMultis,itemsFyApp,subOfSqfy,agent,adminManageType,subOfXzgl,fyPrepose,adminCompen,complement,checkFile,dealWithFile,delay,terminate,wayOfFinish,opinionOfXzfy,adviceOfXzfy,xzgl,fysx,fyjg,locbm,count_type1,queryStr);
			// allSearchList=xzfySearchService.getAllList(queryType,applicant,receiveCaseDate1,receiveCaseDate2,finishCaseDate1,finishCaseDate2,undertaker,undertakerSecond,caseNo,representative,caseNumBFY,caseNameBFY,respondent,applicantType,fyByMultis,itemsFyApp,subOfSqfy,agent,adminManageType,subOfXzgl,fyPrepose,adminCompen,complement,checkFile,dealWithFile,delay,terminate,wayOfFinish,opinionOfXzfy,adviceOfXzfy,xzgl,fysx,fyjg);
			 currentSearchList=pageList.getItems();
			 totalPage=pageList.getTotalPage();
		}
		catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;	
	}
	
	public String showSeparateRequirement(){
		 return SUCCESS;	
	}
	
	public String showSeparateQueryResult(){
		try{
//			 undertaker = new String(undertaker.getBytes("ISO8859-1"), "UTF-8");
			 queryType="2";
			 pageList=xzfySearchService.getCurrentList(queryType,pNum,pageSize,applicant,receiveCaseDate1,receiveCaseDate2,finishCaseDate1,finishCaseDate2,undertaker,undertakerSecond,caseNo,representative,caseNumBFY,caseNameBFY,respondent,applicantType,fyByMultis,itemsFyApp,subOfSqfy,agent,adminManageType,subOfXzgl,fyPrepose,adminCompen,complement,checkFile,dealWithFile,delay,terminate,wayOfFinish,opinionOfXzfy,adviceOfXzfy,xzgl,fysx,fyjg,locbm,count_type1,queryStr);
			 //allSearchList=xzfySearchService.getAllList(queryType,applicant,receiveCaseDate1,receiveCaseDate2,finishCaseDate1,finishCaseDate2,undertaker,undertakerSecond,caseNo,representative,caseNumBFY,caseNameBFY,respondent,applicantType,fyByMultis,itemsFyApp,subOfSqfy,agent,adminManageType,subOfXzgl,fyPrepose,adminCompen,complement,checkFile,dealWithFile,delay,terminate,wayOfFinish,opinionOfXzfy,adviceOfXzfy,xzgl,fysx,fyjg);
			 currentSearchList=pageList.getItems();
			 totalPage=pageList.getTotalPage();
		}
		catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;	
	}
	public String showSeparateQueryResult_2()throws ParseException, SQLException, UnsupportedEncodingException{
		/*try{
//			 undertaker = new String(undertaker.getBytes("ISO8859-1"), "UTF-8");
			 queryType="2";
			 pageList=xzfySearchService.getCurrentList(queryType,pNum,pageSize,applicant,receiveCaseDate1,receiveCaseDate2,finishCaseDate1,finishCaseDate2,undertaker,undertakerSecond,caseNo,representative,caseNumBFY,caseNameBFY,respondent,applicantType,fyByMultis,itemsFyApp,subOfSqfy,agent,adminManageType,subOfXzgl,fyPrepose,adminCompen,complement,checkFile,dealWithFile,delay,terminate,wayOfFinish,opinionOfXzfy,adviceOfXzfy,xzgl,fysx,fyjg,locbm,count_type1,queryStr);
			 //allSearchList=xzfySearchService.getAllList(queryType,applicant,receiveCaseDate1,receiveCaseDate2,finishCaseDate1,finishCaseDate2,undertaker,undertakerSecond,caseNo,representative,caseNumBFY,caseNameBFY,respondent,applicantType,fyByMultis,itemsFyApp,subOfSqfy,agent,adminManageType,subOfXzgl,fyPrepose,adminCompen,complement,checkFile,dealWithFile,delay,terminate,wayOfFinish,opinionOfXzfy,adviceOfXzfy,xzgl,fysx,fyjg);
			 currentSearchList=pageList.getItems();
			 totalPage=pageList.getTotalPage();
		}
		catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;*/
		user = new User();
		user = (User) ActionContext.getContext().getSession()
				.get("_USER_LOGIN_");
		admit_name = user.getName();
		startDateShow =DateUtil.getDateByFormat(startDate2, "yyyy-MM-dd", "yyyy年MM月dd日");
		endDateShow =DateUtil.getDateByFormat(endDate2, "yyyy-MM-dd", "yyyy年MM月dd日");
		Date today = new Date();
		DateFormat f = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String t = f.format(today);
		todayShow =DateUtil.getDateByFormat(t, "yyyy-MM-dd-HH-mm-ss", "yyyy年MM月dd日HH小时mm分ss秒");
		List<User> userList=recordService.getUserListById(us2,"");
		String users="";
		for(int i=0;i<userList.size();i++){
			User u = userList.get(i);
			if (i==userList.size()-1){
				users=users+"'"+u.getName()+"'";
			} else {
				users=users+"'"+u.getName()+"',";
			}
		}
		
		 undertaker = new String(undertaker.getBytes("ISO8859-1"), "UTF-8");
		// queryType="2";
		// pageList=xzfySearchService.getCurrentList(pNum,pageSize,applicant,receiveCaseDate1,receiveCaseDate2,finishCaseDate1,finishCaseDate2,undertaker,undertakerSecond,caseNo,representative,caseNumBFY,caseNameBFY,respondent,applicantType,fyByMultis,itemsFyApp,subOfSqfy,agent,adminManageType,subOfXzgl,fyPrepose,adminCompen,complement,checkFile,dealWithFile,delay,terminate,wayOfFinish,opinionOfXzfy,adviceOfXzfy,xzgl,fysx,fyjg,locbm,count_type1,queryStr);
		 //allSearchList=xzfySearchService.getAllList(queryType,applicant,receiveCaseDate1,receiveCaseDate2,finishCaseDate1,finishCaseDate2,undertaker,undertakerSecond,caseNo,representative,caseNumBFY,caseNameBFY,respondent,applicantType,fyByMultis,itemsFyApp,subOfSqfy,agent,adminManageType,subOfXzgl,fyPrepose,adminCompen,complement,checkFile,dealWithFile,delay,terminate,wayOfFinish,opinionOfXzfy,adviceOfXzfy,xzgl,fysx,fyjg);
		
		
		 pageList = this.xzfyService.getDiv52List_2(pNum,pageSize,startDate2,endDate2,us2);
		 currentSearchList=pageList.getItems(); 
		 totalPage=pageList.getTotalPage();
		
		return SUCCESS;
	}
	private User user;
	private String admit_name;
	private String startDate2="";
	private String endDate2="";
	private String todayShow="";
	private String startDateShow="";
	private String endDateShow="";
	private String us2="";
	private PaginationSupport div52List;
	private XzfyService xzfyService = null; // 模板业务层方法
	
	
	
	
	
	
	
	
	
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
	public String getStartDate2() {
		return startDate2;
	}
	public void setStartDate2(String startDate2) {
		this.startDate2 = startDate2;
	}
	public String getEndDate2() {
		return endDate2;
	}
	public void setEndDate2(String endDate2) {
		this.endDate2 = endDate2;
	}
	public String getTodayShow() {
		return todayShow;
	}
	public void setTodayShow(String todayShow) {
		this.todayShow = todayShow;
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
	public String getUs2() {
		return us2;
	}
	public void setUs2(String us2) {
		this.us2 = us2;
	}
	
	public XzfyService getXzfyService() {
		return xzfyService;
	}
	public void setXzfyService(XzfyService xzfyService) {
		this.xzfyService = xzfyService;
	}
	public String deleteInfo(){
		try{
			xzfyInfo=recordService.getXzfyById(id);
			if(!xzfyInfo.getXzfyInfo2jsm().equals("")){
				
				XzfyInfo2	xzfyInfo2=xzfyService.getXzfyInfo2ById(xzfyInfo.getXzfyInfo2id());
				xzfyInfo2.setZl_time("");
				xzfyService.update(xzfyInfo2);
			}
			xzfyInfo.setStatus("0");
			
			//加入案件识别及状态推送代码
			/*if(xzfyInfo.getXzfyInfo2id()!=null&&!xzfyInfo.getXzfyInfo2id().equals("")){
				//判断是否有外网ID，如果有则为外网案件，进行状态为推送。  改变状态为的地方很多，不能只靠在外网保存方法中加
				try{
					DatesentProxy da =new DatesentProxy();  
					String c3=da.updateStatus(xzfyInfo.getXzfyInfo2id(), xzfyInfo.getStatus(),xzfyInfo.getCheck_status());
					//返回值全部用大写“SUCCESS”
					if(c3.equals("SUCCESS")){
						//行政复议表增加同步标志位字段。statechange
						xzfyInfo.setStatechange("1");
					}else{
						xzfyInfo.setStatechange("0");
					}
				}catch(Exception e){
					System.out.println(e);
					xzfyInfo.setStatechange("0");//服务端有问题同步失败
				}
				//同步标志位，外网的改自己的表tb_flag，内网的改自己的xzfyInfo表的tb_flag，不该同一张表，消除影响。
			}*/
			
			
			recordService.update(xzfyInfo);
			//xzfySearchService.deleteInfoById(id);
            /****************XzfyInfo删除记录到日志中*************/
			String op="删除案件";
			recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),xzfyInfo);
			return SUCCESS;
		}
		catch(Exception e){
			return ERROR;
		}
		 	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public XzfySearchService getXzfySearchService() {
		return xzfySearchService;
	}

	public void setXzfySearchService(XzfySearchService xzfySearchService) {
		this.xzfySearchService = xzfySearchService;
	}

	public String getRespondent() {
		return respondent;
	}

	public void setRespondent(String respondent) {
		this.respondent = respondent;
	}

	public String getSubOfSqfy() {
		return subOfSqfy;
	}

	public void setSubOfSqfy(String subOfSqfy) {
		this.subOfSqfy = subOfSqfy;
	}

	public String getSubOfXzgl() {
		return subOfXzgl;
	}

	public void setSubOfXzgl(String subOfXzgl) {
		this.subOfXzgl = subOfXzgl;
	}

	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}

	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}

	public PaginationSupport getPageList() {
		return pageList;
	}
	public void setPageList(PaginationSupport pageList) {
		this.pageList = pageList;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getpNum() {
		return pNum;
	}
	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}
	public List getCurrentSearchList() {
		return currentSearchList;
	}
	public void setCurrentSearchList(List currentSearchList) {
		this.currentSearchList = currentSearchList;
	}
	public List getAllSearchList() {
		return allSearchList;
	}
	public void setAllSearchList(List allSearchList) {
		this.allSearchList = allSearchList;
	}
	public String getWorkName() {
		return workName;
	}
	public void setWorkName(String workName) {
		this.workName = workName;
	}
	public String getApplicant() {
		return applicant;
	}
	public void setApplicant(String applicant) {
		this.applicant = applicant;
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
	public String getFinishCaseDate1() {
		return finishCaseDate1;
	}
	public void setFinishCaseDate1(String finishCaseDate1) {
		this.finishCaseDate1 = finishCaseDate1;
	}
	public String getFinishCaseDate2() {
		return finishCaseDate2;
	}
	public void setFinishCaseDate2(String finishCaseDate2) {
		this.finishCaseDate2 = finishCaseDate2;
	}
	public String getUndertaker() {
		return undertaker;
	}
	public void setUndertaker(String undertaker) {
		this.undertaker = undertaker;
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
	public String getApplicantType() {
		return applicantType;
	}
	public void setApplicantType(String applicantType) {
		this.applicantType = applicantType;
	}
	public String getFyByMultis() {
		return fyByMultis;
	}
	public void setFyByMultis(String fyByMultis) {
		this.fyByMultis = fyByMultis;
	}
	public String getItemsFyApp() {
		return itemsFyApp;
	}
	public void setItemsFyApp(String itemsFyApp) {
		this.itemsFyApp = itemsFyApp;
	}
	public String getAgent() {
		return agent;
	}
	public void setAgent(String agent) {
		this.agent = agent;
	}
	public String getAdminManageType() {
		return adminManageType;
	}
	public void setAdminManageType(String adminManageType) {
		this.adminManageType = adminManageType;
	}
	public String getFyPrepose() {
		return fyPrepose;
	}
	public void setFyPrepose(String fyPrepose) {
		this.fyPrepose = fyPrepose;
	}
	public String getAdminCompen() {
		return adminCompen;
	}
	public void setAdminCompen(String adminCompen) {
		this.adminCompen = adminCompen;
	}
	
	public String getComplement() {
		return complement;
	}

	public void setComplement(String complement) {
		this.complement = complement;
	}

	public String getCheckFile() {
		return checkFile;
	}
	public void setCheckFile(String checkFile) {
		this.checkFile = checkFile;
	}
	public String getDealWithFile() {
		return dealWithFile;
	}
	public void setDealWithFile(String dealWithFile) {
		this.dealWithFile = dealWithFile;
	}
	public String getDelay() {
		return delay;
	}
	public void setDelay(String delay) {
		this.delay = delay;
	}
	public String getTerminate() {
		return terminate;
	}
	public void setTerminate(String terminate) {
		this.terminate = terminate;
	}
	public String getWayOfFinish() {
		return wayOfFinish;
	}
	public void setWayOfFinish(String wayOfFinish) {
		this.wayOfFinish = wayOfFinish;
	}
	public String getOpinionOfXzfy() {
		return opinionOfXzfy;
	}
	public void setOpinionOfXzfy(String opinionOfXzfy) {
		this.opinionOfXzfy = opinionOfXzfy;
	}
	public String getAdviceOfXzfy() {
		return adviceOfXzfy;
	}
	public void setAdviceOfXzfy(String adviceOfXzfy) {
		this.adviceOfXzfy = adviceOfXzfy;
	}
	public String getQueryStr() {
		return queryStr;
	}
	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}
}
