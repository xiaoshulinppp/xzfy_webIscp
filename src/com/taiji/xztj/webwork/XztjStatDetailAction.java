package com.taiji.xztj.webwork;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.sshtools.j2ssh.transport.Service;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.service.RecordService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.xztj.domain.XztjStat;
import com.taiji.xztj.service.XztjStatService;

public class XztjStatDetailAction extends ProtectedDetailAction{
	private static final long serialVersionUID = 1L;

	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}
	private PaginationSupport pageList;
	private Integer pNum = 1;
	private Integer pageSize = 15;
	private Integer totalPage = 0;
	private Integer totalCount = 0;
	
	private List<XztjStat> xztjList;//行政调解list
	private XztjStatService xztjStatService;
	
	private RecordService recordService;
	private String orgName;//单位
	private String sysDate;//系统日期
//	private String appUser;//用户名
	
	private XztjStat xztjStat;//行政调解统计实体
	private String id;//主键id
	
	private ArrayList<String> yearList;//初始化的年度列表
	private String currentYear = new SimpleDateFormat("yyyy").format(new Date());//系统当前年度
	
	private String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());//系统当前日期
	
	//初始化年度列表
	public void initialYearList(){
		yearList = new ArrayList<String>();
		int curYear = Integer.parseInt(currentYear);
		for (int i = curYear; i > curYear - 5; i--){
			yearList.add(String.valueOf(i));
		}
	}
	
	
	private String preXztjAuditCount;//本单位行政调解新增待审数量
	
	//进入行政调解统计初始页面
	public String gotoXztjStat(){
		String code=this.recordService.getOrg().getLocbm();//直接所属单位
		preXztjAuditCount = this.xztjStatService.findNewPreAuditXztjCountByLocbm(code);
		
		return SUCCESS;
	}
	
	//进入行政调解统计初始页面
	private String fillQuarter;//统计季度
	public String gotoOwnStatList(){		
		try{
			User user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
			userId = String.valueOf(user.getId());
			
			initialYearList();//初始化年度
			
			String code=this.recordService.getOrg().getLocbm();//直接所属单位		
			
			this.pageList = this.xztjStatService.obtainXztjStatList(this.pNum, this.pageSize,fillDate,fillPerson,xztjYear,fillQuarter,code,"","1");
			this.xztjList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();	
			this.totalCount = this.pageList.getTotalCount();

			return SUCCESS;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return ERROR;
		}
	}
	
	//进入填写行政调解统计页面
	private String locbm;//用户所属机构locbm
	private String orgId;//用户直属单位id
	
	private String orgTitle;//表头机构名称
	private String userId;//填报用户id
	
	public String gotoFillNewRecord(){
		User user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		userId = String.valueOf(user.getId());
				
		Org org=this.recordService.getOrg();//直接所属单位
		
		locbm = org.getLocbm();
		orgId = org.getId() + "";
		
		if(locbm.equals("0000")){
			orgName = "北京市人民政府法制办公室";
		}
		else{
			orgName = this.xztjStatService.getXztjFillOrg(locbm).getName();//所属法制办机构单位
		}
			sysDate = new SimpleDateFormat("yyy-MM-dd").format(new Date());
		
		orgTitle = this.xztjStatService.returnDeptNameBasedOnCode(locbm);
		
		
		initialYearList();
		
		
//		User user = new User();
//		user = (User) ActionContext.getContext().getSession().get(
//				"_USER_LOGIN_");
//		appUser = user.getName();
		
		id = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + new Random().nextInt(1000);
		
		
		return SUCCESS;
	}
	
	/*
	 * ajax查重
	 */
	public void judgeExistOrNot() throws Exception{
		String locbm=this.recordService.getOrg().getLocbm();
		
		String msg="0";//默认数据库无此记录
		if(fillQuarter!=null&&!fillQuarter.equals("")&&xztjYear!=null&&!xztjYear.equals("")){
			if(xztjStatService.checkExistsYon(locbm,xztjYear,fillQuarter)){
				msg="1";
			}
		}		
//		System.out.println(msg);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out =response.getWriter();
		out.print(msg);
		out.flush();
		out.close();	
		
	}
	
	public String saveXztjStatNew(){
//		xztjStat.setStatus("0");//待审
		
		this.coreService.saveOrUpdate(xztjStat);
		return SUCCESS;
	}
	
	public String gotoDisplayStat(){
		
		initialYearList();
		
		return SUCCESS;
	}
	
	//进入行政调解统计初始页面
	public String deleteMyXztjRecord(){
		xztjStatService.deleteXztjRecordById(id);		
		return SUCCESS;
	}
	
	//进入行政调解审核列表
	private String fillDate;//填报日期
	private String fillPerson;//填报人
	
	public String gotoAudit(){
		try {	
			initialYearList();//初始化年度
			
			User user = new User();
			user = (User) ActionContext.getContext().getSession().get(
					"_USER_LOGIN_");
			userId = String.valueOf(user.getId());
			
			String code=this.recordService.getOrg().getLocbm();//直接所属单位
			
			this.pageList = this.xztjStatService.obtainXztjStatList(this.pNum, this.pageSize,fillDate,fillPerson,xztjYear,fillQuarter,code,"","2");
			this.xztjList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();	
			this.totalCount = this.pageList.getTotalCount();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	
	//行政调解采集数据正式审核
	private String auditor;//审核人
	private String auditId;//审核人Id
	
	public String formalXztjAudit(){
		try{
			User user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
			auditor = user.getName();
			auditId = String.valueOf(user.getId());
			
			initialYearList();
			this.xztjStat = xztjStatService.findXztjStatById(id);
			
			orgTitle = this.xztjStatService.returnDeptNameBasedOnCode(xztjStat.getLocbm());
			
			return SUCCESS;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return ERROR;
		}
	}
	
	public String saveAuditResult(){
		try{
			xztjStatService.saveOrUpdate(xztjStat);
			return SUCCESS;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return ERROR;
		}
	}
	
	/*
	 * 创建者查看
	 */
	public String viewXztjAuditRlt(){
		try{
			initialYearList();
			this.xztjStat = xztjStatService.findXztjStatById(id);
			
			orgTitle = this.xztjStatService.returnDeptNameBasedOnCode(xztjStat.getLocbm());
						
			return SUCCESS;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return ERROR;
		}
	}
	
	//填报人修改源数据
	public String reviseSrcData(){
		try{
			initialYearList();
			this.xztjStat = xztjStatService.findXztjStatById(id);
			
			orgTitle = this.xztjStatService.returnDeptNameBasedOnCode(xztjStat.getLocbm());
			
			return SUCCESS;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return ERROR;
		}
	}
	
	//保存填报人修改源数据结果
	public String saveReviseResult(){
//		xztjStat.setStatus("0");//待审
		
		this.coreService.saveOrUpdate(xztjStat);
		return SUCCESS;
	}
	
	
	private List<List<String>>  tipsXztjList;//提示信息列表
	
	/*
	 * 市政府进入初始页面
	 */
	//进入行政调解统计初始页面
	public String gotoAllXztjCenterOnly(){
		tipsXztjList = this.xztjStatService.findAllRecordsByYearAndQuarterWithout3Totals(currentYear);
				
		return SUCCESS;
	}
	
	/*
	 * 市政府进入统计页面
	 */
	private String xztjYear;//统计年度
	
	public String gotoCenterStatList(){		
		try{
			initialYearList();//初始化年度
			
			totalXztjStatIntegration();//整合操作
			
			this.pageList = this.xztjStatService.obtainXztjStatList(this.pNum, this.pageSize,"","",xztjYear,fillQuarter,"","1","3");
			this.xztjList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();	
			this.totalCount = this.pageList.getTotalCount();

			return SUCCESS;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return ERROR;
		}
	}
	
	
	/*
	 * 16区县和市政府统计整合
	 */
	public void totalXztjStatIntegration(){
		for(int k = Integer.parseInt(currentYear);k > Integer.parseInt(currentYear)-5; k--){
			for(int i=1; i<6;i++){
				/***************************合计1、合计2操作********************************/
				boolean isPerfect1 = xztjStatService.yonPerfectRecord1(k,i);
					if(isPerfect1 == true){
						;
					}
					else{		
						xztjStat = xztjStatService.findXztjStatGatherOrNot1(k,i);
						if(xztjStat != null){
							xztjStatService.deleteXztjStatByYearAndQuarter1(k,i);
							
							xztjStatService.saveOrUpdate(xztjStat);
						}
					}
				
				boolean isPerfect2 = xztjStatService.yonPerfectRecord2(k,i);
					if(isPerfect2 == true){
						;
					}
					else{		
						xztjStat = xztjStatService.findXztjStatGatherOrNot2(k,i);
						if(xztjStat != null){
							xztjStatService.deleteXztjStatByYearAndQuarter2(k,i);
							
							xztjStatService.saveOrUpdate(xztjStat);
						}
					}
				
				
				/***********************************结束*********************************/
				
				/***************************总合计操作********************************/
				boolean isPerfect = xztjStatService.yonPerfectRecord(k,i);
					if(isPerfect == true){
						;
					}
					else{		
						xztjStat = xztjStatService.findXztjStatGatherOrNot(k,i);
						if(xztjStat != null){
							xztjStatService.deleteXztjStatByYearAndQuarter(k,i);
							
							xztjStatService.saveOrUpdate(xztjStat);
						}
					}
				/***********************************结束*********************************/
			}
		}
	}
	
	//显示所有区县及市政府行政调解统计列表
	private List<XztjStat> xztjDetailList;//行政调解详细列表
//	private String sizeOfCounty;//区县上报数
//	private String sizeOfWbj;//市委办局上报数
	
	public String showDetailListOneByOne(){
		try{
			this.xztjStat = xztjStatService.findXztjStatById(id);
			
			xztjDetailList = xztjStatService.findAllRecordsByYearAndQuarter(xztjStat.getStatYear(),xztjStat.getQuarterOfYear());
			
//			sizeOfCounty = xztjStatService.findCountyCountRecordsByYearAndQuarter(xztjStat.getStatYear(),xztjStat.getQuarterOfYear());
//
//			sizeOfWbj = xztjStatService.findWbjCountRecordsByYearAndQuarter(xztjStat.getStatYear(),xztjStat.getQuarterOfYear());

			return SUCCESS;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return ERROR;
		}
	}
	
	public RecordService getRecordService() {
		return recordService;
	}

	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getSysDate() {
		return sysDate;
	}

	public void setSysDate(String sysDate) {
		this.sysDate = sysDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public XztjStat getXztjStat() {
		return xztjStat;
	}

	public void setXztjStat(XztjStat xztjStat) {
		this.xztjStat = xztjStat;
	}


	public ArrayList<String> getYearList() {
		return yearList;
	}


	public void setYearList(ArrayList<String> yearList) {
		this.yearList = yearList;
	}


	public String getCurrentYear() {
		return currentYear;
	}


	public void setCurrentYear(String currentYear) {
		this.currentYear = currentYear;
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


	public List<XztjStat> getXztjList() {
		return xztjList;
	}


	public void setXztjList(List<XztjStat> xztjList) {
		this.xztjList = xztjList;
	}


	public XztjStatService getXztjStatService() {
		return xztjStatService;
	}


	public void setXztjStatService(XztjStatService xztjStatService) {
		this.xztjStatService = xztjStatService;
	}


	public String getLocbm() {
		return locbm;
	}


	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}


	public String getOrgId() {
		return orgId;
	}


	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}


	public Integer getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}


	public String getFillDate() {
		return fillDate;
	}


	public void setFillDate(String fillDate) {
		this.fillDate = fillDate;
	}


	public String getFillPerson() {
		return fillPerson;
	}


	public void setFillPerson(String fillPerson) {
		this.fillPerson = fillPerson;
	}


	public String getCurrentDate() {
		return currentDate;
	}


	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}


	public String getFillQuarter() {
		return fillQuarter;
	}


	public void setFillQuarter(String fillQuarter) {
		this.fillQuarter = fillQuarter;
	}


	public String getOrgTitle() {
		return orgTitle;
	}


	public void setOrgTitle(String orgTitle) {
		this.orgTitle = orgTitle;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getAuditor() {
		return auditor;
	}


	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}


	public String getAuditId() {
		return auditId;
	}


	public void setAuditId(String auditId) {
		this.auditId = auditId;
	}


	public String getXztjYear() {
		return xztjYear;
	}


	public void setXztjYear(String xztjYear) {
		this.xztjYear = xztjYear;
	}


	public List<XztjStat> getXztjDetailList() {
		return xztjDetailList;
	}


	public void setXztjDetailList(List<XztjStat> xztjDetailList) {
		this.xztjDetailList = xztjDetailList;
	}

	public String getPreXztjAuditCount() {
		return preXztjAuditCount;
	}

	public void setPreXztjAuditCount(String preXztjAuditCount) {
		this.preXztjAuditCount = preXztjAuditCount;
	}

	public List<List<String>> getTipsXztjList() {
		return tipsXztjList;
	}

	public void setTipsXztjList(List<List<String>> tipsXztjList) {
		this.tipsXztjList = tipsXztjList;
	}

//	public String getAppUser() {
//		return appUser;
//	}
//
//	public void setAppUser(String appUser) {
//		this.appUser = appUser;
//	}


	
	
	
	
	
	
	
	private XzfyApp xzfyApp;
	
	public String printComeTrue(){
		xzfyApp = xztjStatService.findXzfyAppById("37250219560216049x");
		
		
		return SUCCESS;
	}

	public XzfyApp getXzfyApp() {
		return xzfyApp;
	}

	public void setXzfyApp(XzfyApp xzfyApp) {
		this.xzfyApp = xzfyApp;
	}	
	
}
