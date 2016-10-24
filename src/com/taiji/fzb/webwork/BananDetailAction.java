package com.taiji.fzb.webwork;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableCell;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import localhost.zxfy.services.datesent.DatesentProxy;
import slime.util.IOStream.IOStream;

import com.opensymphony.oscache.base.EntryRefreshPolicy;
import com.opensymphony.oscache.general.GeneralCacheAdministrator;
import com.opensymphony.oscache.web.filter.ExpiresRefreshPolicy;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.taiji.archive.domain.Archive;
import com.taiji.ashjl.domain.AshjlInfo;
import com.taiji.ashjl.domain.AshjlWypj;
import com.taiji.ashjl.service.AshjlService;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.EvidenceAttachment;
import com.taiji.fzb.domain.Sms;
import com.taiji.fzb.domain.XzfyApp;
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
import com.taiji.meet.domin.Meet;
import com.taiji.tzjl.domain.TzjlInfo;
import com.taiji.tzjl.service.TzjlService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.waiwangTB.domain.XzfyInfo2;
import com.util.DateUtil;
import com.util.FileUtil;

@SuppressWarnings("unchecked")
public class BananDetailAction extends ProtectedDetailAction {

	private static final long serialVersionUID = 1L;
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private PaginationSupport pageList1 = new PaginationSupport();
	private PaginationSupport pageList2 = new PaginationSupport();
	private String guofabanFN="";
	private Integer pageSize = 12; // 分页列表每页显示个数
	private Integer totalPage = 0; // 分页列表页面总数
	private Integer pNum=1;
	private List allList=new ArrayList();
	private BananService bananService; // 模板业务层方法
	public BananService getBananService() {return bananService;}
	public void setBananService(BananService bananService) {this.bananService = bananService;}
	private RecordService recordService = null;
	public RecordService getRecordService() {return recordService;	}
	public void setRecordService(RecordService recordService) {		this.recordService = recordService;	}
	private TzjlService tzjlService = null;	
	public TzjlService getTzjlService() {		return tzjlService;	}
	public void setTzjlService(TzjlService tzjlService) {		this.tzjlService = tzjlService;	}
	private AshjlService ashjlService = null;
	public AshjlService getAshjlService() {		return ashjlService;	}
	public void setAshjlService(AshjlService ashjlService) {		this.ashjlService = ashjlService;	}
	private BsqrService bsqrService=null;
	public BsqrService getBsqrService() {return bsqrService;}
	public void setBsqrService(BsqrService bsqrService) {this.bsqrService = bsqrService;}
	private List<EvidenceAttachment> attchmentList=new ArrayList();
	public List<EvidenceAttachment> getAttchmentList() {return attchmentList;}
	public void setAttchmentList(List<EvidenceAttachment> attchmentList) {this.attchmentList = attchmentList;}
	private List shenpirenList=new ArrayList();
	public List getShenpirenList() {		return shenpirenList;	}
	public void setShenpirenList(List shenpirenList) {		this.shenpirenList = shenpirenList;	}
	
	private List bananList=new ArrayList();
	public List getBananList() {	return bananList;	}
	public void setBananList(List bananList) {	this.bananList = bananList;	}
	
	private List xcdcList=new ArrayList();	
	public List getXcdcList() {return xcdcList;	}
	public void setXcdcList(List xcdcList) {		this.xcdcList = xcdcList;	}
	
	private List tzjlList=new ArrayList();
	public List getTzjlList() {		return tzjlList;	}
	public void setTzjlList(List tzjlList) {		this.tzjlList = tzjlList;	}
	private List ashjlList=new ArrayList();
	public List getAshjlList() {		return ashjlList;	}
	public void setAshjlList(List ashjlList) {		this.ashjlList = ashjlList;	}
	
	private List shenpiList=new ArrayList();
	public List getShenpiList() {return shenpiList;}
	public void setShenpiList(List shenpiList) {this.shenpiList = shenpiList;}
	private List shenpiList1=new ArrayList();


	private List shenpiList2=new ArrayList();
	public List getShenpiList2() {return shenpiList2;}
	public void setShenpiList2(List shenpiList2) {this.shenpiList2 = shenpiList2;}
	private List shenpiList3=new ArrayList();
	public List getShenpiList3() {return shenpiList3;}
	public void setShenpiList3(List shenpiList3) {this.shenpiList3 = shenpiList3;}

	private XzfyInfo xzfyInfo;	
	public XzfyInfo getXzfyInfo() {	return this.xzfyInfo;	}
	public void setXzfyInfo(XzfyInfo xzfyInfo) {	this.xzfyInfo=xzfyInfo;	}
	
	private XzfyInfo xzfyInfoold;	
	public XzfyInfo getXzfyInfoold() {		return xzfyInfoold;	}
	public void setXzfyInfoold(XzfyInfo xzfyInfoold) {		this.xzfyInfoold = xzfyInfoold;	}
	
	private XzfyApp xzfyApp;
	public XzfyApp getXzfyApp() {	return xzfyApp;	}
	public void setXzfyApp(XzfyApp xzfyApp) {	this.xzfyApp = xzfyApp;	}
	
	private XzfyDftz xzfyDftz;
	public XzfyDftz getXzfyDftz() {	return xzfyDftz;}
	public void setXzfyDftz(XzfyDftz xzfyDftz) {this.xzfyDftz = xzfyDftz;}
	
	private Sms sms;
	
	private XzfyShenpi xzfyShenpi;
	public XzfyShenpi getXzfyShenpi() {	return xzfyShenpi;}
	public void setXzfyShenpi(XzfyShenpi xzfyShenpi) {this.xzfyShenpi = xzfyShenpi;}
	
	private XzfyXcdc xzfyXcdc;
	public XzfyXcdc getXzfyXcdc() {return xzfyXcdc;}
	public void setXzfyXcdc(XzfyXcdc xzfyXcdc) {this.xzfyXcdc = xzfyXcdc;}
	
	@Override
	public Class<XzfyInfo> getPersistentClass() {
		return XzfyInfo.class;
	}
	
	private List dftzList=new ArrayList();
	public List getDftzList() {
		return dftzList;
	}
	public void setDftzList(List dftzList) {
		this.dftzList = dftzList;
	}
	private List smsReceiverList=new ArrayList();
	


	
	public String showDaibanList() {
		try {
			//System.out.println(super.getPageNum());
			//System.out.println(pageSize);
			this.pageList = this.bananService.getBananListByPage(super.getPageNum(), pageSize);
			
			this.bananList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			allList = bananService.getBananList();
			/*XzfyInfo x = new XzfyInfo();
			Set a =  x.getXzfyApps();
			Iterator i =  a.iterator();
			while (i.hasNext()){
				XzfyApp app = (XzfyApp) i.next();
				tempname = "";
				tempname=tempname+app.getApp_name()+" ";
			}*/
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	private List dateList = new ArrayList();	
	private String dateCheck="60";
	private String docdftzSql;
	private String docdfdftzSql;
	public List docdftzList = new ArrayList();
	public List docdfdftzList = new ArrayList();
	private List xzfyCheckList=new ArrayList();
	public String banan() {	
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		locbm = this.recordService.getOrg().getLocbm();
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		xzfyInfo=bananService.getXzfyById(tempid);
		shenpiList=bananService.getShenpiListById(tempid);
		shenpiList1=bananService.getShenpiListById1(tempid);
		shenpiList2=bananService.getShenpiListById2(tempid);
		shenpiList3=bananService.getShenpiListById3(tempid);
		xcdcList=bananService.getXcdcListById(tempid);
		shenpirenList=recordService.getUserListById(user.getOrg().getId().toString());
		//xzfyCheckList=recordService.getCheckListByXzfyID(tempid,"2");
		tzjlList=tzjlService.getTzjlList(tempid,"","","","");
		ashjlList=ashjlService.getAshjlList(tempid,"","","","");
		keywordList=bananService.getXzfyKeywordListByLocbm(locbm);
		keywordCheckedList=bananService.getXzfyKeywordListByxzfyId(tempid);
		//dftzList= bananService.getDftzListById(tempid);
		xzfyDftz = bananService.getDftzById(tempid);
		smsReceiverList = bananService.getUserListBytAppDeptId(locbm);
		pageList1 = bananService.getSamexwListByPage(pNum, pageSize, xzfyInfo.getXwnum(), xzfyInfo.getXwname(), xzfyInfo.getId());
		samexwList = pageList1.getItems();
		totalCount1 = pageList1.getTotalCount();
		pageList2 = bananService.getSameKindxwListByPage(pNum, pageSize, xzfyInfo.getDefendant_name(), xzfyInfo.getXwname(), xzfyInfo.getId());  
		samekindxwList = pageList2.getItems();
		totalCount2 = pageList2.getTotalCount();
		docdftzSql="select * from (select * from eweboffice_t_document where caseid='"+tempid+"' and d_type='dafudafutongzhishu' order by d_id desc ) where rownum=1";
		docdfdftzList=recordService.findListBySQL(docdftzSql);	
		if(xzfyInfo.getUser2_id()==null){
			xzfyInfo.setUser2_id(user.getId().toString());
			xzfyInfo.setUser2_name(user.getName());
			bananService.update(xzfyInfo);
		}
			
		ashjlInfo = ashjlService.getAshjlInfo(tempid);
		wyList = ashjlService.getWypjList(ashjlInfo.getId());
		return SUCCESS;
	}
	

	public String getDateCheck() {
		return dateCheck;
	}
	public void setDateCheck(String dateCheck) {
		this.dateCheck = dateCheck;
	}

	public String bananform(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		admit_name=user.getName();
		locbm = this.recordService.getOrg().getLocbm();
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);

		xzfyInfo=bananService.getXzfyById(tempid);
		String sql="select 60-floor(sysdate - to_date(receive_date,'yyyy-mm-dd')) from xzfy_info t where t.id='"+tempid+"'";
		if(xzfyInfo.getBzBuqiriqi()!=null && !xzfyInfo.getBzBuqiriqi().equals(""))
				sql="select 60-floor(sysdate - to_date(receive_date,'yyyy-mm-dd'))+floor(to_date(bzbuqiriqi,'yyyy-mm-dd')-to_date(bztongzhiriqi,'yyyy-mm-dd')) from xzfy_info t " +
						"where t.id='"+tempid+"' and bzbuqiriqi is not null";
		dateList=this.recordService.findListBySQL(sql);
		dateCheck="60";
		if(dateList.get(0)!=null)
			dateCheck=dateList.get(0).toString();
		if(dateCheck!=null && !dateCheck.equals("")){
			if(xzfyInfo.getIsdelay()!=null){
				if(xzfyInfo.getIsdelay().equals("1")){
					dateCheck=new Integer(Integer.parseInt(dateCheck)+30).toString();
				}
			}
				
		}
		if(xzfyInfo.getIsstop()!=null){
			if(xzfyInfo.getIsstop().equals("1")){
				dateCheck="break";
			}
		}
		pageList1 = bananService.getSamexwListByPage(pNum, pageSize, xzfyInfo.getXwnum(), xzfyInfo.getXwname(), xzfyInfo.getId());
		samexwList = pageList1.getItems();
		totalCount1 = pageList1.getTotalCount();
		pageList2 = bananService.getSameKindxwListByPage(pNum, pageSize, xzfyInfo.getDefendant_name(), xzfyInfo.getXwname(), xzfyInfo.getId());  
		samekindxwList = pageList2.getItems();
		totalCount2 = pageList2.getTotalCount();
		/*if(xzfyInfo.getUser2_id()==null){
			xzfyInfo.setUser2_id(user.getId().toString());
			xzfyInfo.setUser2_name(user.getName());
			bananService.update(xzfyInfo);
		}*/
		return SUCCESS;
	}
	public String anjianbanliform(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		admit_name=user.getName();
		locbm = this.recordService.getOrg().getLocbm();
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		xzfyInfo=bananService.getXzfyById(tempid);
		xcdcList=bananService.getXcdcListById(tempid);
		tzjlList=tzjlService.getTzjlList(tempid,"","","","");
		ashjlList=ashjlService.getAshjlList(tempid,"","","","");
		keywordList=bananService.getXzfyKeywordListByLocbm(locbm);
		keywordCheckedList=bananService.getXzfyKeywordListByxzfyId(tempid);
		ashjlInfo = ashjlService.getAshjlInfo(tempid);
		wyList = ashjlService.getWypjList(ashjlInfo.getId());
		return SUCCESS;
	}
	private int dfdftzNum=0;
	private int dftzNum=0;
	
	private List<Archive> archiveList = new ArrayList<Archive>();
	private List<Archive> archiveList1 = new ArrayList<Archive>();//申请书
	public List<Archive> getArchiveList() {
		return archiveList;
	}
	public void setArchiveList(List<Archive> archiveList) {
		this.archiveList = archiveList;
	}
	public List<Archive> getArchiveList1() {
		return archiveList1;
	}
	public void setArchiveList1(List<Archive> archiveList1) {
		this.archiveList1 = archiveList1;
	}
	public List<Archive> getArchiveList3() {
		return archiveList3;
	}
	public void setArchiveList3(List<Archive> archiveList3) {
		this.archiveList3 = archiveList3;
	}
	private List<Archive> archiveList3 = new ArrayList<Archive>();//申请人提交的其他材料
	
	public int isPermission=0;
	public List user1List = new ArrayList();
	public List user2List = new ArrayList();
	public List user3List = new ArrayList();
	public List user4List = new ArrayList(); //答复通知中取四个单位的收信人名单
	private String[] fasong;
	private String fasongdanwei1="";
	private String fasongdanwei2="";
	private String fasongdanwei3="";
	private String fasongdanwei4="";
	private String fasongren1="";
	private String fasongren2="";
	private String fasongren3="";
	private String fasongren4="";
	
	private String bsqrFlag = "0";//被申请人是否是北京市人民政府
	private String bsqrAttached;//附加的3个答复通知发送单位
		
	public String getBsqrFlag() {
		return bsqrFlag;
	}
	public void setBsqrFlag(String bsqrFlag) {
		this.bsqrFlag = bsqrFlag;
	}
	public String getBsqrAttached() {
		return bsqrAttached;
	}
	public void setBsqrAttached(String bsqrAttached) {
		this.bsqrAttached = bsqrAttached;
	}
	
	/*
	 * 进入答复通知页面
	 */
	public String dftzform(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		admit_name=user.getName();
		locbm = this.recordService.getOrg().getLocbm();
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		xzfyInfo=bananService.getXzfyById(tempid);
		if(xzfyInfo.getCaseorg().equals(locbm))
			isPermission=1;
		
		/****************************/
		if(xzfyInfo.gettAppDeptId() != null && !xzfyInfo.gettAppDeptId().equals("")){
			if(xzfyInfo.gettAppDeptId().equals("0000")){
				bsqrFlag = "1";//被申请人为北京市人民政府
			}
		}
		/****************************/
		
		xzfyDftz = bananService.getDftzById(tempid);
		smsReceiverList = bananService.getUserListBytAppDeptId(locbm);//当前登录用户所属根机构下所有用户
		docdfdftzSql="select * from (select * from eweboffice_t_document where caseid='"+tempid+"' and d_type='dafudafutongzhishu' order by d_id desc ) where rownum=1";
		docdftzSql="select * from (select * from eweboffice_t_document where caseid='"+tempid+"' and d_type='dafutongzhi' order by d_id desc ) where rownum=1";
		docdfdftzList=recordService.findListBySQL(docdfdftzSql);
		dfdftzNum=docdfdftzList.size();
		docdftzList=recordService.findListBySQL(docdftzSql);
		dftzNum=docdftzList.size();
		
		
		archiveList = recordService.getArchivesByXzfyId(tempid);
		for(int i=0;i<archiveList.size();i++){
			switch(Integer.parseInt(archiveList.get(i).getType())){
			case 1:
				archiveList1.add(archiveList.get(i));
				break;
			case 3:
				archiveList3.add(archiveList.get(i));
				break;
			}
		}
		
		user1List = bananService.getUserListBytAppDeptId("0000");//北京市人民政府
		user2List = bananService.getUserListBytAppDeptId("1900");//发改委
		user3List = bananService.getUserListBytAppDeptId("3000");//国土局
		user4List = bananService.getUserListBytAppDeptId("3200");//建委
		
//		user1List = bananService.getUserListBytAppDeptId("0000");//市政府办公厅信息公开一处
//		user2List = bananService.getUserListBytAppDeptId("3000");//市国土局
//		user3List = bananService.getUserListBytAppDeptId("3100");//市规划委
		
		
		return SUCCESS;
	}
	private String docyanqiSql;
	private int docyanqiNum=0;
	private String doczhongzhiSql;
	private int doczhongzhiNum=0;
	private String dochuifuSql;
	private int dochuifuNum=0;
	private String docjieanSql;
	private int docjieanNum=0;
	private String docjieanSql1;
	private int docjieanNum1=0;
	private String docjieanSql2;
	private int docjieanNum2=0;
	private String docjieanSql3;
	private int docjieanNum3=0;
	private String docyijianSql;
	private int docyijianNum=0;
	private String docjianyiSql;
	private int docjianyiNum=0;
	public String yanqiform(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		admit_name=user.getName();
		locbm = this.recordService.getOrg().getLocbm();
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		xzfyInfo=bananService.getXzfyById(tempid);
		shenpiList=bananService.getShenpiListById(tempid);
		shenpirenList=recordService.getUserListById(user.getOrg().getId().toString());
		docyanqiSql="select * from (select * from eweboffice_t_document where caseid='"+tempid+"' and d_type='yanqishenlitongzhishu' order by d_id desc ) where rownum=1";
		docyanqiNum=recordService.findListBySQL(docyanqiSql).size();
		return SUCCESS;
	}
	public String zhongzhiform(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		admit_name=user.getName();
		locbm = this.recordService.getOrg().getLocbm();
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		xzfyInfo=bananService.getXzfyById(tempid);
		shenpiList1=bananService.getShenpiListById1(tempid);
		shenpirenList=recordService.getUserListById(user.getOrg().getId().toString());
		doczhongzhiSql="select * from (select * from eweboffice_t_document where caseid='"+tempid+"' and d_type='zhongzhishenlitongzhishu' order by d_id desc ) where rownum=1";
		doczhongzhiNum=recordService.findListBySQL(doczhongzhiSql).size();
		return SUCCESS;
	}
	public String huifuform(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		admit_name=user.getName();
		locbm = this.recordService.getOrg().getLocbm();
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		xzfyInfo=bananService.getXzfyById(tempid);
		shenpiList2=bananService.getShenpiListById2(tempid);
		shenpirenList=recordService.getUserListById(user.getOrg().getId().toString());
		dochuifuSql="select * from (select * from eweboffice_t_document where caseid='"+tempid+"' and d_type='huifushenlitongzhishu' order by d_id desc ) where rownum=1";
		dochuifuNum=recordService.findListBySQL(dochuifuSql).size();
		return SUCCESS;
	}
	public String jieanform(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		admit_name=user.getName();
		locbm = this.recordService.getOrg().getLocbm();
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		xzfyInfo=bananService.getXzfyById(tempid);
		shenpiList3=bananService.getShenpiListById3(tempid);
		shenpirenList=recordService.getUserListById(user.getOrg().getId().toString());		
		docyijianSql="select * from (select * from eweboffice_t_document where caseid='"+tempid+"' and d_type='xingzhengfuyiyijianshu' order by d_id desc ) where rownum=1";
		docyijianNum=recordService.findListBySQL(docyijianSql).size();
		docjianyiSql="select * from (select * from eweboffice_t_document where caseid='"+tempid+"' and d_type='xingzhengfuyijianyishu' order by d_id desc ) where rownum=1";
		docjianyiNum=recordService.findListBySQL(docjianyiSql).size();
		
		docjieanSql="select * from (select * from eweboffice_t_document where caseid='"+tempid+"' and d_type='xingzhengfuyijuedingshu' order by d_id desc ) where rownum=1";
		docjieanNum=recordService.findListBySQL(docjieanSql).size();
		docjieanSql1="select * from (select * from eweboffice_t_document where caseid='"+tempid+"' and d_type='xingzhengfuyitiaojie' order by d_id desc ) where rownum=1";
		docjieanNum1=recordService.findListBySQL(docjieanSql1).size();
		docjieanSql2="select * from (select * from eweboffice_t_document where caseid='"+tempid+"' and d_type='xingzhengfuyizhongzhi' order by d_id desc ) where rownum=1";
		docjieanNum2=recordService.findListBySQL(docjieanSql2).size();
		docjieanSql3="select * from (select * from eweboffice_t_document where caseid='"+tempid+"' and d_type='xingzhengfuyizelinglvxing' order by d_id desc ) where rownum=1";
		docjieanNum3=recordService.findListBySQL(docjieanSql3).size();
		return SUCCESS;
	}
	

	public String showsamexwList(){
		xzfyInfo=bananService.getXzfyById(tempid);
		pageList1 = bananService.getSamexwListByPage(pNum, pageSize, xzfyInfo.getXwnum(), xzfyInfo.getXwname(), xzfyInfo.getId());
		case0List = pageList1.getItems();
		for (int i=0;i<case0List.size();i++){
			XzfyInfo x = new XzfyInfo();
			Object[] o = (Object[]) case0List.get(i);
			for(int j=0;j<12;j++){
				if (o[j] != null){
					if(j==0){
						x.setTjzfzh((String) o[j]);
					}else if (j==1){
						x.setReceive_date((String) o[j]);
					}else if (j==2){
						x.setDefendant_name((String) o[j]);
					}else if (j==3){
						x.setApp_show((String) o[j]);
					}else if (j==4){
						x.setStatus((String) o[j]);
					}else if (j==5){
						x.setId((String) o[j]);
					}else if (j==6){
						x.setCheck_status((String) o[j]);
					}else if (j==7){
						x.setStadardResult((String) o[j]);
					}else if (j==8){
						x.setUser1_name((String) o[j]);
					}else if (j==9){
						x.setUser2_name((String) o[j]);
					}else if (j==10){
						x.setUser3_name((String) o[j]);
					}else if (j==11){
						x.setCheck_name((String) o[j]);
					}
				}
			}
			caseList.add(x);
		}
		//caseList = pageList1.getItems();
		totalCount = pageList1.getTotalCount();
		totalPage = pageList1.getTotalPage();
		return SUCCESS;
	}
	public String showsamekindxwList(){
		xzfyInfo=bananService.getXzfyById(tempid);
		
		pageList2 = bananService.getSameKindxwListByPage(pNum, pageSize, xzfyInfo.getDefendant_name(), xzfyInfo.getXwname(), xzfyInfo.getId());  
		case0List = pageList2.getItems();
		for (int i=0;i<case0List.size();i++){
			XzfyInfo x = new XzfyInfo();
			Object[] o = (Object[]) case0List.get(i);
			for(int j=0;j<12;j++){
				if (o[j] != null){
					if(j==0){
						x.setTjzfzh((String) o[j]);
					}else if (j==1){
						x.setReceive_date((String) o[j]);
					}else if (j==2){
						x.setDefendant_name((String) o[j]);
					}else if (j==3){
						x.setApp_show((String) o[j]);
					}else if (j==4){
						x.setStatus((String) o[j]);
					}else if (j==5){
						x.setId((String) o[j]);
					}else if (j==6){
						x.setCheck_status((String) o[j]);
					}else if (j==7){
						x.setStadardResult((String) o[j]);
					}else if (j==8){
						x.setUser1_name((String) o[j]);
					}else if (j==9){
						x.setUser2_name((String) o[j]);
					}else if (j==10){
						x.setUser3_name((String) o[j]);
					}else if (j==11){
						x.setCheck_name((String) o[j]);
					}
				}
			}
			caseList.add(x);
		}
		//caseList = pageList2.getItems();
		totalCount = pageList2.getTotalCount();
		totalPage = pageList2.getTotalPage();
		return SUCCESS;
	}


	
	
	
	public String savebanan(){
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		xzfyInfoold=bananService.getXzfyById(tempid);
		xzfyInfo=bananService.getXzfyById(tempid);
		if(tempstatus=="8")
			xzfyInfo.setIsstop_from(todate);
		if(tempstatus=="10")
			xzfyInfo.setBreakTo(todate);
		//!"".equals(this.upFile1FileName)
		//上传调解记录
		if (this.upFile1FileName != null&&!"".equals(this.upFile1FileName) ){
			String webRootPath1 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName1 = this.upFile1FileName;
			//String a = this.upFile1FileName.split("\\.")[1];
			String extension = upFile1FileName.substring(upFile1FileName.lastIndexOf("."));
			String fileName1 = Calendar.getInstance().getTimeInMillis()+extension;
			String fileFlod1 = webRootPath1 + "uploadfiles/banan/";
			File path = new File(fileFlod1);
			if(!path.exists())
				path.mkdir();
			File outFile1 = new File(fileFlod1 + fileName1);
			xzfyInfo.setTiaojiejilu(realName1);
			xzfyInfo.setTiaojiejilu1("../uploadfiles/banan/" + fileName1);	
			xzfyInfo.setHastiaojie("1");
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile1, outFile1);
		}		
		if(tempstatus != null && !"0".equals(tempstatus) && !"".equals(tempstatus)){xzfyInfo.setStatus(tempstatus);}
		if(!"".equals(tempcheckstatus)){	xzfyInfo.setCheck_status(tempcheckstatus);	}
		if(checkid != null&&!"0".equals(checkid)&&!"".equals(checkid)){xzfyInfo.setCheck_id(checkid);}	
		if(!"".equals(tiaojiejilu)){	xzfyInfo.setTiaojiejilu(tiaojiejilu);	}
		if(!"".equals(tiaojiejilu1)){	xzfyInfo.setTiaojiejilu1(tiaojiejilu1);	}
		if(!"".equals(pizhunren)){	xzfyInfo.setPizhunren(pizhunren);	}
		if(!"".equals(pizhunren1)){	xzfyInfo.setPizhunren1(pizhunren1);	}
		if(!"".equals(pizhunren2)){	xzfyInfo.setPizhunren2(pizhunren2);	}
		if(!"".equals(pizhunren3)){	xzfyInfo.setPizhunren3(pizhunren3);	}
		if(!"".equals(pizhunriqi)){	xzfyInfo.setPizhunriqi(pizhunriqi);	}
		if(!"".equals(pizhunriqi1)){	xzfyInfo.setPizhunriqi1(pizhunriqi1);	}
		if(!"".equals(pizhunriqi2)){	xzfyInfo.setPizhunriqi2(pizhunriqi2);	}
		if(!"".equals(pifuyijian)){	xzfyInfo.setPifuyijian(pifuyijian);	}
		if(!"".equals(pifuyijian1)){	xzfyInfo.setPifuyijian1(pifuyijian1);	}
		if(!"".equals(pifuyijian2)){	xzfyInfo.setPifuyijian2(pifuyijian2);	}
		if(!"".equals(pifuyijian3)){	xzfyInfo.setPifuyijian3(pifuyijian3);	}
		if(!"".equals(finish_date)){	xzfyInfo.setFinish_date(finish_date);	}
		if(!"".equals(finish_type)){	xzfyInfo.setFinish_type(finish_type);	}
		if(!"".equals(finishBreakType)){	xzfyInfo.setFinishBreakType(finishBreakType);	}
		if(!"".equals(nationMoney)){	xzfyInfo.setNationMoney(nationMoney);	}
		if(!"".equals(nationMoneyDetail)){	xzfyInfo.setNationMoneyDetail(nationMoneyDetail);	}		
		if(!"".equals(isdelay)){	xzfyInfo.setIsdelay(isdelay);	}
		if(!"".equals(isstop)){	xzfyInfo.setIsstop(isstop);	}
		if(!"".equals(delay_detail)){	xzfyInfo.setDelay_detail(delay_detail);	}
		if(!"".equals(stop_detail)){	xzfyInfo.setStop_detail(stop_detail);		}	
		if(!"".equals(delay_reason)){	xzfyInfo.setDelay_reason(delay_reason);	}
		if(!"".equals(stop_reason)){	xzfyInfo.setStop_reason(stop_reason);	}
		if(!"".equals(isstop_from)){	xzfyInfo.setIsstop_from(isstop_from);	}
		if(!"".equals(breakTo)){	xzfyInfo.setBreakTo(breakTo);			}
		if(!"".equals(jaAdvice)){	xzfyInfo.setJaAdvice(jaAdvice);	}	
		if(!"".equals(trailMode)){	xzfyInfo.setTrailMode(trailMode);	}	
		if (this.upFileFileName.length!=0) {
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");		
			for (int i=0;i<upFileFileName.length;i++) {
				String a = upFileFileName[i];
				XzfyXcdc xzfyXcdc= new XzfyXcdc();				
			String realName = a;
			String extension = upFileFileName[i].substring(upFileFileName[i].lastIndexOf("."));
			String fileName = Calendar.getInstance().getTimeInMillis() + extension;
			String fileFlod = webRootPath + "uploadfiles/banan/";
			File path = new File(fileFlod);
			if(!path.exists())
				path.mkdir();
			File outFile = new File(fileFlod + fileName);
			//this.getXzfyXcdc().setXcdcfile(realName);
			//this.getXzfyXcdc().setXcdcfile1("../uploadfiles/banan/" + fileName);
			xzfyXcdc.setXcdcfile(realName);
			xzfyXcdc.setXcdcfile1("../uploadfiles/banan/" + fileName);
			xzfyInfo.setHasdiaocha("1");
			xzfyXcdc.setXzfyInfo(xzfyInfo);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile[i], outFile);
			bananService.save(xzfyXcdc);
			}
		}	
		if(keyword!= null&&!"".equals(keyword)){
			user = new User();
			user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
			locbm = this.recordService.getOrg().getLocbm();
			bananService.deleteBananKeyword(xzfyInfo.getId());
			for(int i=0;i<keyword.length;i++){
				xzfyKeyword = new XzfyKeyword();
				xzfyKeyword.setKeyword(keyword[i]);
				xzfyKeyword.setXzfy_id(tempid);
				xzfyKeyword.setStatus("1");
				xzfyKeyword.setLocbm(locbm);
				bananService.save(xzfyKeyword);
			}
		}
		//听证
		if (upFileTzjlFileName!= null&&!"".equals(upFileTzjlFileName) ){
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName = upFileTzjlFileName;
			//String a = this.upFile1FileName.split("\\.")[1];
			String extension = upFileTzjlFileName.substring(upFileTzjlFileName.lastIndexOf("."));
			String fileName = Calendar.getInstance().getTimeInMillis()+extension;
			String fileFlod = webRootPath+ "uploadfiles/Tzjl/";
			File path = new File(fileFlod);
			if(!path.exists())
				path.mkdir();
			File outFile1 = new File(fileFlod + fileName);
			tzjlInfo.setFileName(realName);
			tzjlInfo.setRealFilePath("../uploadfiles/Tzjl/" + fileName);
			xzfyInfo.setHastingzheng("1");
			tzjlInfo.setXzfyId(tempid);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFileTzjl, outFile1);
			tzjlService.saveTzjlInfo(tzjlInfo);
		}
		
		String op="保存案件信息";
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),xzfyInfo);
		
		    //加入案件识别及状态推送代码(新)
		 if(xzfyInfo.getXzfyInfo2id()!=null&&!xzfyInfo.getXzfyInfo2id().equals("")){
				//判断是否有外网ID，如果有则为外网案件，进行状态为推送。  改变状态为的地方很多，不能只靠在外网保存方法中加
				try{
					
					 XzfyInfo2 newXzfyInfo2 = this.recordService.getXzfyById_w(xzfyInfo.getXzfyInfo2id());
					DatesentProxy da =new DatesentProxy();  
					String c3=da.updateStatus(
							xzfyInfo.getXzfyInfo2id(),        //1案件id
							newXzfyInfo2.getReceive_real_date(), //2保存时间
							xzfyInfo.getReceive_date(),//3收案时间
							xzfyInfo.getIsBuzheng(),//4是否补正
							xzfyInfo.getBzTongzhiriqi(),//5通知补正时间
							xzfyInfo.getBzBuqiriqi(),//6补正时间
							xzfyInfo.getLian_date(),//7立案时间
							xzfyInfo.getTjzfzh(),//8案件号
							xzfyInfo.getIsstop(),// 9是否中止
							xzfyInfo.getIsstop_from(),//10中止时间
							xzfyInfo.getBreakTo(),//11恢复审理日期
							
							xzfyInfo.getIsdelay(),//12延期审理时间
						
							xzfyInfo.getFinish_date(),//13结案日期
							xzfyInfo.getFinish_type());//14审理结果
							//finish_type
							//finish_date
							//newXzfyInfo.getStatus(),
							//newXzfyInfo.getCheck_status()
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
			}
		
		
		bananService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}
	
	
	public String saveshenpi(){
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		xzfyInfoold=bananService.getXzfyById(tempid);
		xzfyInfo=bananService.getXzfyById(tempid);		
		if(!"".equals(delay_detail)){	xzfyInfo.setDelay_detail(delay_detail);	}
		if(!"".equals(stop_detail)){	xzfyInfo.setStop_detail(stop_detail);		}	
		if(!"".equals(delay_reason)){	xzfyInfo.setDelay_reason(delay_reason);	}
		if(!"".equals(stop_reason)){	xzfyInfo.setStop_reason(stop_reason);	}
		if(!"".equals(isstop_from)){	xzfyInfo.setIsstop_from(isstop_from);	}
		if(!"".equals(breakTo)){	xzfyInfo.setBreakTo(breakTo);			}
		if(!"".equals(finish_date)){	xzfyInfo.setFinish_date(finish_date);	}
		if(!"".equals(finish_type)){	xzfyInfo.setFinish_type(finish_type);	}
		if(!"".equals(finishBreakType)){	xzfyInfo.setFinishBreakType(finishBreakType);	}
		if(!"".equals(nationMoney)){	xzfyInfo.setNationMoney(nationMoney);	}
		if(!"".equals(nationMoneyDetail)){	xzfyInfo.setNationMoneyDetail(nationMoneyDetail);	}
		if(!"".equals(jaAdvice)){	xzfyInfo.setJaAdvice(jaAdvice);	}		
		if(checkid!=null && !checkid.equals("")&& !checkid.equals("0")){
			user=recordService.getUserById(checkid);
			xzfyInfo.setCheck_name(user.getName());			
		}
		if(!"".equals(checkid)){	xzfyInfo.setCheck_id(checkid);	}
		if(!pifuyijian.equals("")){	xzfyInfo.setPifuyijian(pifuyijian);	}
		if(!pifuyijian1.equals("")){	xzfyInfo.setPifuyijian1(pifuyijian1);	}
		if(!pifuyijian2.equals("")){	xzfyInfo.setPifuyijian2(pifuyijian2);	}
		if(!pifuyijian3.equals("")){	xzfyInfo.setPifuyijian3(pifuyijian3);	}
		if(!"".equals(tempstatus)){	xzfyInfo.setStatus(tempstatus);	}
		if("8".equals(tempstatus))
			xzfyInfo.setIsstop_from(todate);
		if("10".equals(tempstatus))
			xzfyInfo.setBreakTo(todate);
		if(!"".equals(tempcheckstatus)){	xzfyInfo.setCheck_status(tempcheckstatus);	}	
		if("6".equals(xzfyInfo.getStatus())||"5".equals(xzfyInfo.getStatus())){	xzfyInfo.setYanqispdate(shenpiDate);	}
		if("8".equals(xzfyInfo.getStatus())||"7".equals(xzfyInfo.getStatus())){	xzfyInfo.setZhongzhispdate(shenpiDate);	}
		if("10".equals(xzfyInfo.getStatus())||"9".equals(xzfyInfo.getStatus())){	xzfyInfo.setHuifuspdate(shenpiDate);	}
		if("12".equals(xzfyInfo.getStatus())||"11".equals(xzfyInfo.getStatus())){	xzfyInfo.setJieanspdate(shenpiDate);	}
		String hql="update XzfyShenpi sp set sp.sqspren_id=1 where sp.xzfyInfo.id='"+tempid+"' and sp.check_type='"+tempstatus+"'";
		recordService.updateAll(hql);
		
		String op="提交审批";
		
		//加入案件识别及状态推送代码(新)
		if(xzfyInfo.getXzfyInfo2id()!=null&&!xzfyInfo.getXzfyInfo2id().equals("")){
			//判断是否有外网ID，如果有则为外网案件，进行状态为推送。  改变状态为的地方很多，不能只靠在外网保存方法中加
			try{
				
				 XzfyInfo2 newXzfyInfo2 = this.recordService.getXzfyById_w(xzfyInfo.getXzfyInfo2id());
				DatesentProxy da =new DatesentProxy();  
				String c3=da.updateStatus(
						xzfyInfo.getXzfyInfo2id(),        //1案件id
						newXzfyInfo2.getReceive_real_date(), //2保存时间
						xzfyInfo.getReceive_date(),//3收案时间
						xzfyInfo.getIsBuzheng(),//4是否补正
						xzfyInfo.getBzTongzhiriqi(),//5通知补正时间
						xzfyInfo.getBzBuqiriqi(),//6补正时间
						xzfyInfo.getLian_date(),//7立案时间
						xzfyInfo.getTjzfzh(),//8案件号
						xzfyInfo.getIsstop(),// 9是否中止
						xzfyInfo.getIsstop_from(),//10中止时间
						xzfyInfo.getBreakTo(),//11恢复审理日期
						
						xzfyInfo.getIsdelay(),//12延期审理时间
					
						xzfyInfo.getFinish_date(),//13结案日期
						xzfyInfo.getFinish_type());//14审理结果
						//finish_type
						//finish_date
						//newXzfyInfo.getStatus(),
						//newXzfyInfo.getCheck_status()
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
		}
		
		
		
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),xzfyInfo);
		bananService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}
	
	public String savechengbaobiao(){
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		xzfyInfoold=bananService.getXzfyById(tempid);
		xzfyInfo=bananService.getXzfyById(tempid);		
		if(!"".equals(delay_detail)){	xzfyInfo.setDelay_detail(delay_detail);	}
		if(!"".equals(stop_detail)){	xzfyInfo.setStop_detail(stop_detail);		}	
		if(!"".equals(delay_reason)){	xzfyInfo.setDelay_reason(delay_reason);	}
		if(!"".equals(stop_reason)){	xzfyInfo.setStop_reason(stop_reason);	}
		if(!"".equals(isstop_from)){	xzfyInfo.setIsstop_from(isstop_from);	}
		if(!"".equals(breakTo)){	xzfyInfo.setBreakTo(breakTo);			}
		if(!"".equals(finish_date)){	xzfyInfo.setFinish_date(finish_date);	}
		if(!"".equals(finish_type)){	xzfyInfo.setFinish_type(finish_type);	}
		if(!"".equals(finishBreakType)){	xzfyInfo.setFinishBreakType(finishBreakType);	}
		if(!"".equals(nationMoney)){	xzfyInfo.setNationMoney(nationMoney);	}
		if(!"".equals(nationMoneyDetail)){	xzfyInfo.setNationMoneyDetail(nationMoneyDetail);	}
		if(!"".equals(jaAdvice)){	xzfyInfo.setJaAdvice(jaAdvice);	}		

		if(!"".equals(checkid)){	xzfyInfo.setCheck_id(checkid);	}
		if("6".equals(xzfyInfo.getStatus())||"5".equals(xzfyInfo.getStatus())){	xzfyInfo.setYanqispdate(todate);	}
		if("8".equals(xzfyInfo.getStatus())||"7".equals(xzfyInfo.getStatus())){	xzfyInfo.setZhongzhispdate(todate);	}
		if("10".equals(xzfyInfo.getStatus())||"9".equals(xzfyInfo.getStatus())){	xzfyInfo.setHuifuspdate(todate);	}
		if("12".equals(xzfyInfo.getStatus())||"11".equals(xzfyInfo.getStatus())){	xzfyInfo.setJieanspdate(todate);	}
		if(checkid != null&&!"0".equals(checkid)&&!"".equals(checkid)){xzfyInfo.setCheck_id(checkid);}	
		if(!"".equals(tiaojiejilu)){	xzfyInfo.setTiaojiejilu(tiaojiejilu);	}
		if(!"".equals(tiaojiejilu1)){	xzfyInfo.setTiaojiejilu1(tiaojiejilu1);	}
		if(!"".equals(pizhunren)){	xzfyInfo.setPizhunren(pizhunren);	}
		if(!"".equals(pizhunren1)){	xzfyInfo.setPizhunren1(pizhunren1);	}
		if(!"".equals(pizhunren2)){	xzfyInfo.setPizhunren2(pizhunren2);	}
		if(!"".equals(pizhunren3)){	xzfyInfo.setPizhunren3(pizhunren3);	}
		if(!"".equals(pizhunriqi)){	xzfyInfo.setPizhunriqi(pizhunriqi);	}
		if(!"".equals(pizhunriqi1)){	xzfyInfo.setPizhunriqi1(pizhunriqi1);	}
		if(!"".equals(pizhunriqi2)){	xzfyInfo.setPizhunriqi2(pizhunriqi2);	}
		if(!"".equals(pifuyijian)){	xzfyInfo.setPifuyijian(pifuyijian);	}
		if(!"".equals(pifuyijian1)){	xzfyInfo.setPifuyijian1(pifuyijian1);	}
		if(!"".equals(pifuyijian2)){	xzfyInfo.setPifuyijian2(pifuyijian2);	}
		if(!"".equals(pifuyijian3)){	xzfyInfo.setPifuyijian3(pifuyijian3);	}
		if(!"".equals(finish_date)){	xzfyInfo.setFinish_date(finish_date);	}
		if(!"".equals(finish_type)){	xzfyInfo.setFinish_type(finish_type);	}
		if(!"".equals(finishBreakType)){	xzfyInfo.setFinishBreakType(finishBreakType);	}
		if(!"".equals(nationMoney)){	xzfyInfo.setNationMoney(nationMoney);	}
		if(!"".equals(nationMoneyDetail)){	xzfyInfo.setNationMoneyDetail(nationMoneyDetail);	}		
		if(!"".equals(isdelay)){	xzfyInfo.setIsdelay(isdelay);	}
		if(!"".equals(isstop)){	xzfyInfo.setIsstop(isstop);	}
		if(!"".equals(trailMode)){	xzfyInfo.setTrailMode(trailMode);	}
		
		String op="暂存呈报表";
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),xzfyInfo);
		bananService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}
	
	private int tempDftzId;
	public String showDftzList(){
		dftzList= bananService.getDftzListById(tempid);

		return SUCCESS;
	}
	
	private String[] receiverid={};
	private String[] receivername={};
	private String message="";
	public String smsReceiver(){
		locbm = this.recordService.getOrg().getLocbm();
		smsReceiverList = bananService.getUserListBytAppDeptId(locbm);
		return SUCCESS;
	}
	
	public String saveSms(){
		
		/*if(!"".equals(keyword)&&keyword!= null){
			user = new User();
			user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
			locbm = this.recordService.getOrg().getLocbm();
			bananService.deleteBananKeyword(xzfyInfo.getId());
			for(int i=0;i<keyword.length;i++){
				xzfyKeyword = new XzfyKeyword();
				xzfyKeyword.setKeyword(keyword[i]);
				xzfyKeyword.setXzfy_id(tempid);
				xzfyKeyword.setStatus("1");
				xzfyKeyword.setLocbm(locbm);
				bananService.save(xzfyKeyword);
			}
		}*/
		if(receiverid!= null&&!"".equals(receiverid)){
			for(int i=0;i<receiverid.length;i++){
				sms = new Sms();
				sms.setUserid(receiverid[i]);
				sms.setXzfy_id(tempid);
				sms.setMessage(message);
				bananService.save(sms);
			}
		}
		
		
		return SUCCESS;
	}
	
	/*
	 * 撤销答复通知
	 */
	public String withdrawDftz(){
		//xzfyDftz = bananService.getDftzById(xzfyDftz.getId()); 
		xzfyInfo=bananService.getXzfyById(tempid);
		xzfyInfo.setDftzstatus("0");
		
		String op="撤回答复通知";
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),xzfyInfo);
		bananService.saveOrUpdate(xzfyInfo);
		xzfyDftz = bananService.getDftzById(tempid);
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		xzfyDftz.setUserName1(user.getName());
		bananService.update(xzfyDftz);
		return SUCCESS;
	}
	
	public String savedftz(){
		xzfyInfoold=bananService.getXzfyById(tempid);
		xzfyInfo=bananService.getXzfyById(tempid);
		xzfyDftz = bananService.getDftzById(tempid);
		if (this.upFile2FileName != null&&!"".equals(this.upFile2FileName) ){
			String webRootPath2 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName2 = this.upFile2FileName;
			String extension = upFile2FileName.substring(upFile2FileName.lastIndexOf("."));
			String fileName2 = Calendar.getInstance().getTimeInMillis()+extension;
			String fileFlod2 = webRootPath2 + "uploadfiles/banan/";
			File path = new File(fileFlod2);
			if(!path.exists())
				path.mkdir();
			File outFile2 = new File(fileFlod2 + fileName2);
			xzfyDftz.setContent("../uploadfiles/banan/" + fileName2);	
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile2, outFile2);
		}	
		xzfyDftz.setXzfy_id(tempid);
		//xzfyDftz.setXzfyInfo(xzfyInfo);
		//xzfyInfo.setDftzstatus("1");
		//xzfyInfo.getXzfyDftzs().add(xzfyDftz);
		bananService.saveOrUpdate(xzfyDftz);
		String op="保存答复通知";
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),xzfyInfo);
		//bananService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}
	private File upFilesqs;
	private String upFilesqsFileName = "";
	private File upFilebccl;
	private String upFilebcclFileName = "";
	private String dftzbeizhu="";
	private int deldftztype=0;
	public String deldftzElem(){
		user = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
		xzfyDftz = bananService.getDftzById(tempid);
		if(deldftztype==1){
			xzfyDftz.setContent(null);
			xzfyDftz.setUserName1(user.getName());
			bananService.update(xzfyDftz);
		}
		else if(deldftztype==2){
			xzfyDftz.setFujian4(null);
			xzfyDftz.setFujian44(null);
			xzfyDftz.setUserName1(user.getName());
			bananService.update(xzfyDftz);
		}
		return SUCCESS;
	}
	
	/*
	 * 新增答复通知附件上传
	 */
	private File dftzStampedFile;//答复通知附件
	private String dftzStampedFileFileName;//答复通知附件名称
	
	
	public File getDftzStampedFile() {
		return dftzStampedFile;
	}
	public void setDftzStampedFile(File dftzStampedFile) {
		this.dftzStampedFile = dftzStampedFile;
	}
	public String getDftzStampedFileFileName() {
		return dftzStampedFileFileName;
	}
	public void setDftzStampedFileFileName(String dftzStampedFileFileName) {
		this.dftzStampedFileFileName = dftzStampedFileFileName;
	}
	
	/*
	 * 保存答复通知发送结果
	 */
	public String commitdftz(){
		xzfyInfoold=bananService.getXzfyById(tempid);
		xzfyInfo=bananService.getXzfyById(tempid);
		xzfyDftz = bananService.getDftzById(tempid);
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		todate = df.format(dt);
		if (this.upFile2FileName != null&&!"".equals(this.upFile2FileName) ){
			String webRootPath2 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName2 = this.upFile2FileName;
			String extension = upFile2FileName.substring(upFile2FileName.lastIndexOf("."));
			String fileName2 = Calendar.getInstance().getTimeInMillis()+extension;
			String fileFlod2 = webRootPath2 + "uploadfiles/banan/";
			File path = new File(fileFlod2);
			if(!path.exists())
				path.mkdir();
			File outFile2 = new File(fileFlod2 + fileName2);
			xzfyDftz.setContent("../uploadfiles/banan/" + fileName2);	
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile2, outFile2);
		}	
		if (this.upFilesqsFileName != null&&!"".equals(this.upFilesqsFileName) ){
			String webRootPath2 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName2 = this.upFilesqsFileName;
			String extension = upFilesqsFileName.substring(upFilesqsFileName.lastIndexOf("."));
			String fileName2 = Calendar.getInstance().getTimeInMillis()+extension;
			String fileFlod2 = webRootPath2 + "uploadfiles/banan/";
			File path = new File(fileFlod2);
			if(!path.exists())
				path.mkdir();
			File outFile2 = new File(fileFlod2 + fileName2);
			xzfyDftz.setFujian4(realName2);
			xzfyDftz.setFujian44("../uploadfiles/banan/" + fileName2);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFilesqs, outFile2);
		}	
		if (this.upFilebcclFileName != null&&!"".equals(this.upFilebcclFileName) ){
			String webRootPath2 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName2 = this.upFilebcclFileName;
			String extension = upFilebcclFileName.substring(upFilebcclFileName.lastIndexOf("."));
			String fileName2 = Calendar.getInstance().getTimeInMillis()+extension;
			String fileFlod2 = webRootPath2 + "uploadfiles/banan/";
			File path = new File(fileFlod2);
			if(!path.exists())
				path.mkdir();
			File outFile2 = new File(fileFlod2 + fileName2);
			xzfyDftz.setFujian5("../uploadfiles/banan/" + fileName2);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFilebccl, outFile2);
		}	
		/*
		 * 答复通知书附件上传
		 */
		if (this.dftzStampedFileFileName != null&&!"".equals(this.dftzStampedFileFileName) ){
			String webRootPath2 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName2 = this.dftzStampedFileFileName;
			String extension = dftzStampedFileFileName.substring(dftzStampedFileFileName.lastIndexOf("."));
			String fileName2 = Calendar.getInstance().getTimeInMillis()+extension;
			String fileFlod2 = webRootPath2 + "uploadfiles/banan/";
			File path = new File(fileFlod2);
			if(!path.exists())
				path.mkdir();
			File outFile2 = new File(fileFlod2 + fileName2);
			xzfyDftz.setContent("../uploadfiles/banan/" + fileName2);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.dftzStampedFile, outFile2);
		}
		xzfyDftz.setXzfy_id(tempid);
		xzfyDftz.setSentanswerdate(todate);
		xzfyDftz.setReceiveanswerdate(null);
		xzfyDftz.setContent1(null);
		xzfyDftz.setFujian55(dftzbeizhu);
		//xzfyDftz.setXzfyInfo(xzfyInfo);
		xzfyInfo.setDftzstatus("1");
		
		xzfyInfo.setBsqrSpecial(bsqrAttached);//设置特殊的3个被申请人
		
		//xzfyInfo.getXzfyDftzs().add(xzfyDftz);
		user = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
		xzfyDftz.setUserName1(user.getName());
		
		
		if(!this.fasongdanwei1.equals("")){
			xzfyDftz.setFasongdanwei1("1");
			xzfyDftz.setFasongren1(fasongdanwei1.split(",")[0]);
			xzfyDftz.setFasongren1Name(fasongdanwei1.split(",")[1]);
		}
		if(!this.fasongdanwei2.equals("")){
			xzfyDftz.setFasongdanwei2("1");
			xzfyDftz.setFasongren2(fasongdanwei2.split(",")[0]);
			xzfyDftz.setFasongren2Name(fasongdanwei2.split(",")[1]);
		}
		if(!"".equals(fasongdanwei3)){
			xzfyDftz.setFasongdanwei3("1");
			xzfyDftz.setFasongren3(fasongdanwei3.split(",")[0]);
			xzfyDftz.setFasongren3Name(fasongdanwei3.split(",")[1]);
		}
		if(!"".equals(this.fasongdanwei4)){
			xzfyDftz.setFasongdanwei4("1");
			xzfyDftz.setFasongren4(fasongdanwei4.split(",")[0]);
			xzfyDftz.setFasongren4Name(fasongdanwei4.split(",")[1]);
		}
			
		
		bananService.saveOrUpdate(xzfyDftz);
		String op="提交答复通知";
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),xzfyInfo);
		bananService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}
	
	
	
	public String withdrawsp(){
		xzfyInfoold=bananService.getXzfyById(tempid);
		xzfyInfo=bananService.getXzfyById(tempid);
		xzfyInfo.setCheck_status("0");
		
		String op="取消审批";
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),xzfyInfo);
		bananService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}
	
	
	
	private List orgList=new ArrayList();	
	private List suborgList=new ArrayList();
	private List<XzfyInfo> weibanjieList=new ArrayList();   			//案件未办结
	private List dailianshenchaList=new ArrayList();		//案件待立案审查
	private List daibanliList=new ArrayList();			//案件待办理
	private List daishenpiList=new ArrayList();   //案件待审批
	private List dailianshenpiList=new ArrayList();			//案件待立案审批
	private List shenliqixian_20_List=new ArrayList();  //审理期限不满20天的
	private List shenliqixian_10_List=new ArrayList();  //审理期限不满10天的
	private List shenliqixian_chaoqi_List=new ArrayList();  //案件已超期
	private List zhongzhiList=new ArrayList();		//案件处于中止状态
	private List weibanjie_sub_List=new ArrayList();   			//子部门案件未办结
	private List shenliqixian_sub40_List=new ArrayList();		//子部门案件审理时间已满40天
	private List shenliqixian_sub50_List=new ArrayList();		//子部门案件审理时间已满50天
	private List shenliqixian_subchaoqi_List=new ArrayList();  //子部门案件已超期
	private List newdaifenpeiList=new ArrayList(); 		//新收案件待分配
	private List weizhidingList=new ArrayList();			//已受理案件未指定承办人
	private int listkeyword = 1;     //辨识显示哪个List
	private int isView = 0;
	private List caseList=new ArrayList();
	private List caseAllList=new ArrayList();
	private String locbm="";
	private int userid;
	private int orgid;
	private List homeCaseNumList=new ArrayList();
	private String orgBm = "";
	private int bsqrListSize;
	private String subweibanjie;
	private String sub40;
	private String sub50;
	private String subchaoqi;
	private String subzhongzhi;
	private List weifenpei_sub_List=new ArrayList();
	private String subweifenpei;
	private String subDailianshencha;
	private String sub35;
	private String sub5;
	private String subBuzheng;
	private String sbBuzheng;
	private String sbzhongzhi;
	private String sbbanjie;
	private String sbYishencha;
	private String sbGuoqi;
	private String rootLocbm;
	private String shenpiDate="";
	public String anjianbanliroad(){	
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		admit_name = user.getName();
		Org org=recordService.getOrg();
		orgBm=org.getLocbm();
		String sql = "select org_name from u_org where org_locBm=" + org.getLocbm() + " order by org_id asc";
		orgList = bananService.findBySQL(sql);
		bumen = orgList.get(0).toString();
		locbm = org.getLocbm();
		subbumen = org.getName();
		userid = user.getId();
		orgid = org.getId();
		homeCaseNumList = bananService.getHomeCaseNum(locbm, userid, orgid);
		/*weibanjieList = bananService.getWeibanjieList(locbm);
		shenliqixian_20_List = bananService.getShenliqixian_20_List(locbm);
		shenliqixian_10_List= bananService.getShenliqixian_10_List(locbm);
		shenliqixian_chaoqi_List= bananService.getShenliqixian_chaoqi_List(locbm);
		zhongzhiList= bananService.getZhongzhiList(locbm);
		newdaifenpeiList=bananService.getNewdaifenpeiList(locbm);
		weizhidingList=bananService.getWeizhidingList(locbm);
		dailianshenchaList= bananService.getDailianshenchaList(userid);
		daibanliList= bananService.getDaibanliList(userid);
		daishenpiList= bananService.getDaishenpiList(userid);
		dailianshenpiList=bananService.getDailianshenpiList(userid);*/
		//rootLocbm = recordService.getRootOrg(locbm).getLocbm();
		if(orgBm.equals("0000")){
			if(orgid==999){
			subDailianshencha = String.valueOf(bananService.getsubDailianshenchaList(locbm).get(0));
			sub35 = String.valueOf(bananService.getsub35List(locbm).get(0));
			sub5 = String.valueOf(bananService.getsub5List(locbm).get(0));
			subBuzheng = String.valueOf(bananService.getsubBuzhengList(locbm).get(0));
			
			}else{
			subweibanjie = String.valueOf(bananService.getWeibanjie_sub_List(orgid).get(0));
			subweifenpei = String.valueOf(bananService.getWeifenpei_sub_List(orgid).get(0));
			sub40 = String.valueOf(bananService.getShenliqixian_sub40_List(orgid).get(0));
			sub50 = String.valueOf(bananService.getShenliqixian_sub50_List(orgid).get(0));
			subchaoqi = String.valueOf(bananService.getShenliqixian_subchaoqi_List(orgid).get(0));
			subzhongzhi = String.valueOf(bananService.getsubZhongzhiList(orgid).get(0));
			
			}
			//orgid==999
			sbBuzheng = String.valueOf(bananService.getsbBuzhengList(userid).get(0));
			sbYishencha = String.valueOf(bananService.getsbYishenchaList(userid).get(0));
			sbGuoqi=String.valueOf(bananService.getsbGuoqiList(userid).get(0));
			//else
			sbzhongzhi = String.valueOf(bananService.getsbZhongzhiList(userid).get(0));
			sbbanjie = String.valueOf(bananService.getsbBanjieList(userid).get(0));
		}
		bsqrListSize = bsqrService.getXzfyList(locbm, "", "", "", "", "").size();

		//weibanjieList= bananService.findBySQL("select count(0) from xzfy_info where status <'12' ");
		//String shenliqixian_20 ="select count(1) from xzfy_info where stadardresult='1' and status>'3' and status<'12' and  caseorg= " + user.getOrg().getLocbm() + "and floor(sysdate - to_date(receive_date,'yyyy-mm-dd'))>'40' ";
		//shenliqixian_20_List= bananService.findBySQL(shenliqixian_20);       
		//shenliqixian_10_List= bananService.findBySQL("select * from xzfy_info where stadardresult='1' and status>'3' and status<'12' and caseorg= " + user.getOrg().getLocbm() + " and floor(sysdate - to_date(receive_date,'yyyy-mm-dd'))>'50' ");
		//shenliqixian_chaoqi_List= bananService.findBySQL("select * from xzfy_info where stadardresult='1' and status>'3' and status<'12' and caseorg= " +user.getOrg().getLocbm()+ "  and floor(sysdate - to_date(receive_date,'yyyy-mm-dd'))>'60' ");
		//zhongzhiList= bananService.findBySQL("select * from xzfy_info where status ='8' and caseorg= " +user.getOrg().getLocbm() );
		//newdaifenpeiList=bananService.findBySQL("select * from xzfy_info where status ='1' and user1_id='' and caseorg= "+user.getOrg().getLocbm());
		//weizhidingList=bananService.findBySQL("select * from xzfy_info where status ='4' and user2_id='' and caseorg= "+user.getOrg().getLocbm());		
		//dailianshenchaList= bananService.findBySQL("select * from xzfy_info where status ='1' and user2_id= "+user.getId() );
		//daibanliList= bananService.findBySQL("select * from xzfy_info where status ='4' and user2_id= "+user.getId() );
		//daishenpiList= bananService.findBySQL("select * from xzfy_info where check_status ='1' and user2_id="+user.getId() );
		//dailianshenpiList=bananService.findBySQL("select * from xzfy_info where status ='3' and user2_id="+user.getId() );
		//weibanjie_sub_List=bananService.findBySQL("select * from xzfy_info where user1_id in (select user_id from u_user where org_id="+user.getOrg().getId()+") and user2_id in (select user_id from u_user where org_id="+user.getOrg().getId()+") and status<'12' ");
		//shenliqixian_sub40_List=bananService.findBySQL("select * from xzfy_info where user1_id in (select user_id from u_user where org_id="+user.getOrg().getId()+") and user2_id in (select user_id from u_user where org_id="+user.getOrg().getId()+") and stadardresult='1' and status>'3' and status<'12' and floor(sysdate - to_date(receive_date,'yyyy-mm-dd'))>'40' ");
		//shenliqixian_sub50_List=bananService.findBySQL("select * from xzfy_info where user1_id in (select user_id from u_user where u_user.org_id="+user.getOrg().getId()+") and user2_id in (select user_id from u_user where u_user.org_id="+user.getOrg().getId()+") and stadardresult='1' and status>'3' and status<'12' and floor(sysdate - to_date(receive_date,'yyyy-mm-dd'))>'50' ");
		//shenliqixian_subchaoqi_List=bananService.findBySQL("select * from xzfy_info where user1_id in (select user_id from u_user where u_user.org_id="+user.getOrg().getId()+") and user2_id in (select user_id from u_user where u_user.org_id="+user.getOrg().getId()+") and stadardresult='1' and status>'3' and status<'12' and floor(sysdate - to_date(receive_date,'yyyy-mm-dd'))>'60' ");	
		return SUCCESS;
	}
	public String getSub40() {
		return sub40;
	}
	public void setSub40(String sub40) {
		this.sub40 = sub40;
	}
	public String getSub50() {
		return sub50;
	}
	public void setSub50(String sub50) {
		this.sub50 = sub50;
	}
	public String getSubchaoqi() {
		return subchaoqi;
	}
	public void setSubchaoqi(String subchaoqi) {
		this.subchaoqi = subchaoqi;
	}
	public String getSubzhongzhi() {
		return subzhongzhi;
	}
	public void setSubzhongzhi(String subzhongzhi) {
		this.subzhongzhi = subzhongzhi;
	}
	public String getSubweifenpei() {
		return subweifenpei;
	}
	public void setSubweifenpei(String subweifenpei) {
		this.subweifenpei = subweifenpei;
	}
	private List case0List=new ArrayList();
	public String showanjianbanliList(){	
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();		
		String sql="select org_name from u_org where org_locBm=" +  this.recordService.getOrg().getLocbm()+ " order by org_id asc";
		orgList = bananService.findBySQL(sql);
		bumen = orgList.get(0).toString();
		Org org1=this.recordService.getOrg();
		locbm = org1.getLocbm();
		subbumen =org1.getName();
		userid = user.getId();
		orgid = user.getOrg().getId();
		
		switch(listkeyword){
		case 1:
			pageList = bananService.getWeibanjieListByPage(pNum, pageSize,locbm);
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeibanjieList(locbm);
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 2:
			pageList = bananService.getShenliqixian_20_ListByPage(pNum, pageSize,locbm );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getShenliqixian_20_List(locbm );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 3:
			pageList = bananService.getShenliqixian_10_ListByPage(pNum, pageSize,locbm );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getShenliqixian_10_List(locbm );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 4:
			pageList = bananService.getShenliqixian_chaoqi_ListByPage(pNum, pageSize,locbm );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getShenliqixian_chaoqi_List(locbm );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 5:
			pageList = bananService.getZhongzhiListByPage(pNum, pageSize,locbm );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getZhongzhiList(locbm );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 6:
			pageList = bananService.getNewdaifenpeiListByPage(pNum, pageSize,locbm );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<15;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}else if (j==14){
							x.setShouju_flag((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getNewdaifenpeiList(locbm );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 7:
			pageList = bananService.getWeizhidingListByPage(pNum, pageSize,locbm );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeizhidingList(locbm );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 8:
			pageList = bananService.getDailianshenchaListByPage(pNum, pageSize,userid );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getDailianshenchaList(userid );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 9:
			pageList = bananService.getDaibanliListByPage(pNum, pageSize,userid );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getDaibanliList(userid );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 10:
			pageList = bananService.getDaishenpiListByPage(pNum, pageSize,userid );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getDaishenpiList(userid );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 11:
			pageList = bananService.getDailianshenpiListByPage(pNum, pageSize,userid );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getDailianshenpiList(userid );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 12:
			pageList = bananService.getWeibanjie_sub_ListByPage(pNum, pageSize,orgid );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeibanjie_sub_List(orgid );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 13:
			pageList = bananService.getShenliqixian_sub40_ListByPage(pNum, pageSize,orgid );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getShenliqixian_sub40_List(orgid );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 14:
			pageList = bananService.getShenliqixian_sub50_ListByPage(pNum, pageSize,orgid );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getShenliqixian_sub50_List(orgid );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 15:
			pageList = bananService.getShenliqixian_subchaoqi_ListByPage(pNum, pageSize,orgid );
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getShenliqixian_subchaoqi_List(orgid );
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 16:
			pageList = bananService.getWeifenpei_sub_ListByPage(pNum, pageSize,orgid);
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeifenpei_sub_List(orgid);
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 17:
			pageList = bananService.getsubZhongzhiListByPage(pNum, pageSize,orgid);
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeifenpei_sub_List(orgid);
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 18:
			pageList = bananService.getsubDailianshenchaListByPage(pNum, pageSize,locbm);
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeifenpei_sub_List(orgid);
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 19:
			pageList = bananService.getsub35ListByPage(pNum, pageSize,locbm);
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeifenpei_sub_List(orgid);
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 20:
			pageList = bananService.getsub5ListByPage(pNum, pageSize,locbm);
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeifenpei_sub_List(orgid);
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 21:
			pageList = bananService.getsubBuzhengListByPage(pNum, pageSize,locbm);
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeifenpei_sub_List(orgid);
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 22:
			pageList = bananService.getsbBuzhengListByPage(pNum, pageSize, userid);
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeifenpei_sub_List(orgid);
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 23:
			pageList = bananService.getsbZhongzhiListByPage(pNum, pageSize, userid);
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeifenpei_sub_List(orgid);
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 24:
			pageList = bananService.getsbBanjieListByPage(pNum, pageSize, userid);
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeifenpei_sub_List(orgid);
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 25:
			pageList = bananService.getsbYishenchaListByPage(pNum, pageSize, userid);
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeifenpei_sub_List(orgid);
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		case 26:
			pageList = bananService.getsbGuoqiListByPage(pNum, pageSize, userid);
			case0List = pageList.getItems();
			for (int i=0;i<case0List.size();i++){
				XzfyInfo x = new XzfyInfo();
				Object[] o = (Object[]) case0List.get(i);
				for(int j=0;j<14;j++){
					if (o[j] != null){
						if(j==0){
							x.setTjzfzh((String) o[j]);
						}else if (j==1){
							x.setReceive_date((String) o[j]);
						}else if (j==2){
							x.setDefendant_name((String) o[j]);
						}else if (j==3){
							x.setApp_show((String) o[j]);
						}else if (j==4){
							x.setStatus((String) o[j]);
						}else if (j==5){
							x.setId((String) o[j]);
						}else if (j==6){
							x.setCheck_status((String) o[j]);
						}else if (j==7){
							x.setStadardResult((String) o[j]);
						}else if (j==8){
							x.setUser1_name((String) o[j]);
						}else if (j==9){
							x.setUser2_name((String) o[j]);
						}else if (j==10){
							x.setUser3_name((String) o[j]);
						}else if (j==11){
							x.setCheck_name((String) o[j]);
						}else if (j==12){
							x.setAppdetail((String) o[j]);
						}else if (j==13){
							x.setAgentDetail((String) o[j]);
						}
					}
				}
				caseList.add(x);
			}
			//caseList = pageList.getItems();
			//caseAllList = bananService.getWeifenpei_sub_List(orgid);
			totalPage = pageList.getTotalPage();
			totalCount=pageList.getTotalCount();
			break;
		}
		if(xzfyInfo==null)
			xzfyInfo=new XzfyInfo();
		return SUCCESS;
	}
	
	
	//委办复议单位
	private String[] locbmwb={};
	private XzfyWeiban xzfyWeiban;
	private List weibanList=new ArrayList();
	private List keywordList=new ArrayList();
	private List keywordCheckedList=new ArrayList();
	public XzfyWeiban getXzfyWeiban() {return xzfyWeiban;	}
	public void setXzfyWeiban(XzfyWeiban xzfyWeiban) {		this.xzfyWeiban = xzfyWeiban;	}
	private XzfyKeyword xzfyKeyword = new XzfyKeyword();
	public XzfyKeyword getXzfyKeyword() {		return xzfyKeyword;	}
	public void setXzfyKeyword(XzfyKeyword xzfyKeyword) {		this.xzfyKeyword = xzfyKeyword;	}
	public String weiban(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		locbm = this.recordService.getOrg().getLocbm();
		weibanList=bananService.getXzfyWeibanListByLocbm(locbm);
		keywordList=bananService.getXzfyKeywordListByLocbm(locbm);
		return SUCCESS;
	}
	public String saveweiban(){
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
		return SUCCESS;
	}
	public String savekeyword(){
		xzfyKeyword.setLocbm(locbm);
		bananService.save(xzfyKeyword);
		return SUCCESS;
	}
	private int keywordId;
	public int getKeywordId() {		return keywordId;	}
	public void setKeywordId(int keywordId) {		this.keywordId = keywordId;	}
	private String[] keyword={};
	
	public String deletekeyword(){
		//xzfyKeyword = new XzfyKeyword();
		bananService.deleteKeyword(keywordId);
		return SUCCESS;
	}
	
	/*public String 	showTotalList(){
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
	}*/
	public String 	showTotalList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		this.pageList = this.recordService.getTotalList(super.getPageNum(), pageSize,xzfyInfo,user);
		this.caseList = this.pageList.getItems();
		this.totalPage = this.pageList.getTotalPage();
		totalCount=pageList.getTotalCount();
		if(xzfyInfo==null)
			xzfyInfo=new XzfyInfo();
		return "success";
	}
	
	//统计表
	private List form10List=new ArrayList();
	private List form11List=new ArrayList();
	private String startDate="";
	private String endDate="";
	public String startDateShow = "";
	public String endDateShow = "";
	public String sysDate="";
	ArrayList<ArrayList<String>> dataLists = new ArrayList<ArrayList<String>>();
	private List userList = new ArrayList();
	
	public String form10Search(){
		Date dt = new Date();
		DateFormat year = new SimpleDateFormat("yyyy");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		startDate = year.format(dt)+"-01-01";
		endDate = df.format(dt);
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		userList=recordService.getUserListById(user.getOrg().getId().toString());

		this.allList=this.recordService.getCaseOrgList();
		this.locbm=this.recordService.getOrg().getLocbm();
		this.bumen=this.recordService.getRootOrg(locbm).getName();

		fileId1=this.recordService.getOrg().getLocbm();
		this.org=this.recordService.getRootOrg(fileId1);
		this.message=org.getName();
		return SUCCESS;
	}

	public String showForm10() throws ParseException{
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		admit_name=user.getName();
		if(null==locbm || "".equals(locbm)){
			locbm = this.recordService.getOrg().getLocbm();
		}
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		sysDate=DateUtil.getDatestrByDateFormat(dt,"yyyy年MM月dd日 HH时mm分");
		bumen = recordService.getRootOrg(locbm).getName();
		if(startDate.equals("")&&endDate.equals("")){
			DateFormat year = new SimpleDateFormat("yyyy");
			startDate = year.format(dt)+"-01-01";
			endDate = todate;
			form10List = bananService.getDengjiForm10List(locbm, startDate, endDate, finish_type);
			startDateShow =DateUtil.getDateByFormat(startDate, "yyyy-MM-dd", "yyyy年MM月dd日");
			endDateShow =DateUtil.getDateByFormat(endDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		}
		else if(!startDate.equals("")&&endDate.equals("")){
			endDate = todate;
			form10List = bananService.getDengjiForm10List(locbm, startDate, endDate, finish_type);
			startDateShow =DateUtil.getDateByFormat(startDate, "yyyy-MM-dd", "yyyy年MM月dd日");
			endDateShow =DateUtil.getDateByFormat(endDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		}
		else if(startDate.equals("")&&!endDate.equals("")){
			DateFormat year = new SimpleDateFormat("yyyy");
			startDate = year.format(dt)+"-01-01";
			form10List = bananService.getDengjiForm10List(locbm, startDate, endDate, finish_type);
			startDateShow =DateUtil.getDateByFormat(startDate, "yyyy-MM-dd", "yyyy年MM月dd日");
			endDateShow =DateUtil.getDateByFormat(endDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		}
		else{
			form10List = bananService.getDengjiForm10List(locbm, startDate, endDate, finish_type);
			startDateShow =DateUtil.getDateByFormat(startDate, "yyyy-MM-dd", "yyyy年MM月dd日");
			endDateShow =DateUtil.getDateByFormat(endDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		}
		return SUCCESS;
	}

/*	public String tongJi() throws ParseException, SQLException {
		if(null==locbm || "".equals(locbm)){
			locbm = this.recordService.getOrg().getLocbm();
		}
		//dataLists = getJieAnTongJiByWeekLists(startDate, endDate, locbm);
		Date date=new Date();
		sysDate=DateUtil.getDatestrByDateFormat(date,"yyyy年MM月dd日 HH时mm分");
		if (null != startDate && !"".equals(startDate)) {
			startDateShow =DateUtil.getDateByFormat(startDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		}
		if (null != endDate && !"".equals(endDate)) {
			endDateShow =DateUtil.getDateByFormat(endDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		}
		return SUCCESS;		
	}*/
	private List totalList = new ArrayList();
	private int searchpeid;
	private String orgName="";
	public String tongJi() throws ParseException, SQLException {
		if(null==locbm || "".equals(locbm)){
			locbm = this.recordService.getOrg().getLocbm();
		}
		bumen = recordService.getRootOrg(locbm).getName();
		//dataLists = getJieAnTongJiByWeekLists(startDate, endDate, locbm);
		Date date=new Date();
		sysDate=DateUtil.getDatestrByDateFormat(date,"yyyy年MM月dd日 HH时mm分");
		if (null != startDate && !"".equals(startDate)) {
			startDate = DateUtil.getMonDayByDate(startDate, "yyyy-MM-dd");
		}
		if (null != endDate && !"".equals(endDate)) {
			endDate = DateUtil.getSunDayByDate(endDate, "yyyy-MM-dd");
		}
		ArrayList<ArrayList<String>> weekLists = bananService.getWeekLists(startDate, endDate);
		totalList = bananService.getJieAnTongJiTotalList(startDate, endDate, locbm, weekLists, finish_type);
		int m = weekLists.size();
		startDateShow = weekLists.get(0).get(3); 
		endDateShow = weekLists.get(m-1).get(4);
		return SUCCESS;		
	}

	public ArrayList<ArrayList<String>> getJieAnTongJiByWeekLists(String startDate, String endDate, String locbm) throws SQLException {
		if (null != startDate && !"".equals(startDate)) {
			startDate = DateUtil.getMonDayByDate(startDate, "yyyy-MM-dd");
		}
		if (null != endDate && !"".equals(endDate)) {
			endDate = DateUtil.getSunDayByDate(endDate, "yyyy-MM-dd");
		}
		ArrayList<ArrayList<String>> weekLists = bananService.getWeekLists(startDate, endDate);
		return bananService.getJieAnTongJiByWeekLists(weekLists, locbm,finish_type);
	}
	/*public ArrayList<String> getJieAnTongJiTotalList(String startDate, String endDate, String locbm, Number searchpeid) throws SQLException {
		if (null != startDate && !"".equals(startDate)) {
			startDate = DateUtil.getMonDayByDate(startDate, "yyyy-MM-dd");
		}
		if (null != endDate && !"".equals(endDate)) {
			endDate = DateUtil.getSunDayByDate(endDate, "yyyy-MM-dd");
		}
		ArrayList<ArrayList<String>> weekLists = bananService.getWeekLists(startDate, endDate);
		return bananService.getJieAnTongJiTotalList(startDate, endDate, locbm, weekLists,searchpeid);
	}*/
	
	public String gfbtongJi() throws ParseException, SQLException {
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		if(null==locbm || "".equals(locbm)){
			locbm = this.recordService.getOrg().getLocbm();
		}
		bumen = recordService.getRootOrg(locbm).getName();
		/*if (null != startDate && !"".equals(startDate)) {
			//startDate = DateUtil.getMonDayByDate(startDate, "yyyy-MM-dd");
			startDate = df.format(startDate);
		}
		if (null != endDate && !"".equals(endDate)) {
			//endDate = DateUtil.getSunDayByDate(endDate, "yyyy-MM-dd");
			endDate = df.format(endDate);
		}*/
		dataLists = bananService.getxzfyAnjianTongJiList(startDate, endDate, locbm, finish_type);
		totalList = bananService.getxzfyAnjianTongJiTotalList(startDate, endDate, locbm, finish_type);
		Date date=new Date();
		sysDate=DateUtil.getDatestrByDateFormat(date,"yyyy年MM月dd日 HH时mm分");
		if (null != startDate && !"".equals(startDate)) {
			startDateShow =DateUtil.getDateByFormat(startDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		}
		if (null != endDate && !"".equals(endDate)) {
			endDateShow =DateUtil.getDateByFormat(endDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		}
		//打开文件   
		Workbook bookOrg = null;
		WritableWorkbook bookNew = null;
		try {
			String rootPath = ApplicationPath.getRootPath().replaceAll("\\\\",
					"\\\\\\\\");
			String absoutleFilePath = rootPath + "guofaban"+File.separator+"guofaban.xls";
			bookOrg = Workbook.getWorkbook(new File(absoutleFilePath));
			guofabanFN = FileUtil.generateRandomStr()+".xls";
			String fn = rootPath + "guofaban"+File.separator+"download"+File.separator+guofabanFN;
			bookNew = Workbook.createWorkbook(new File(fn), bookOrg);
			WritableSheet sheet  = bookNew.getSheet(0);
			for (int i=0;i<dataLists.size();i++){
				ArrayList al = dataLists.get(i); 
				for (int j=2;j<al.size()-1;j++){
					String a = (String) al.get(j);
					if ( a== null ||a.equals("")){
						a="0";
					}
					WritableCell cell =sheet.getWritableCell(j+1, i+12);
					//WritableSheet sheet2  = bookNew.getSheet(0);
					
					//WritableCell cell2 =sheet2.getWritableCell(4+1, 45+12);
					
					jxl.format.CellFormat cf = cell.getCellFormat();
					Label s=new jxl.write.Label(j+1, i+12, a); 
					System.out.println("aaa  "+a +"ss"+j);
					s.setCellFormat(cf);
					sheet.addCell(s);
				}
			//	System.out.println("fff"+i);
			}
			for (int i=2;i<totalList.size();i++){
				String a = (String) totalList.get(i);
				if ( a== null ||a.equals("")){
					a="0";
				}
				WritableCell cell =sheet.getWritableCell(i+1, 58);
				jxl.format.CellFormat cf = cell.getCellFormat();
				Label s=new jxl.write.Label(i+1, 58, a);  
				s.setCellFormat(cf);
				sheet.addCell(s);
			}
			String time = "填表时间："+sysDate;
			WritableCell cell =sheet.getWritableCell(41, 59);
			jxl.format.CellFormat cf = cell.getCellFormat();
			Label s=new jxl.write.Label(41, 59, time);  
			s.setCellFormat(cf);
			sheet.addCell(s);

			String timeShow = startDateShow+"至"+endDateShow;
			WritableCell cell1 =sheet.getWritableCell(0,1);
			jxl.format.CellFormat cf1 = cell1.getCellFormat();
			Label s1=new jxl.write.Label(0, 1, timeShow);  
			s1.setCellFormat(cf1);
			sheet.addCell(s1);
			
			bookNew.write();
		} catch (IOException e) {
			e.printStackTrace();
		}  catch (BiffException e) {
			e.printStackTrace();
		} catch (RowsExceededException e) {
			e.printStackTrace();
		} catch (WriteException e) {
			e.printStackTrace();
		} finally {
			try {
				bookNew.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	  
		return SUCCESS;		
	}
	public ArrayList<String> getxzfyAnjianTongJiTotalList(String startDate, String endDate, String locbm) throws SQLException {
		/*if (null != startDate && !"".equals(startDate)) {
			startDate = DateUtil.getMonDayByDate(startDate, "yyyy-MM-dd");
		}
		if (null != endDate && !"".equals(endDate)) {
			endDate = DateUtil.getSunDayByDate(endDate, "yyyy-MM-dd");
		}*/
		return bananService.getxzfyAnjianTongJiTotalList(startDate, endDate, locbm, finish_type);
	}
	public String form1Search(){
		Date dt = new Date();
		DateFormat year = new SimpleDateFormat("yyyy");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		startDate = year.format(dt)+"-01-01";
		endDate = df.format(dt);
		allList=this.recordService.getCaseOrgList();
		fileId1=this.recordService.getOrg().getLocbm();
		this.org=this.recordService.getRootOrg(fileId1);
		this.message=org.getName();
		return SUCCESS;
	}
	
	public String jiedaiSearch(){
		Date dt = new Date();
		DateFormat year = new SimpleDateFormat("yyyy");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		startDate = year.format(dt)+"-01-01";
		endDate = df.format(dt);
		allList=this.recordService.getCaseOrgList();
		fileId1=this.recordService.getOrg().getLocbm();
		return SUCCESS;
	}
	
	public String jiedaiSearch2(){
		Date dt = new Date();
		DateFormat year = new SimpleDateFormat("yyyy");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		startDate = year.format(dt)+"-01-01";
		endDate = df.format(dt);
		allList=this.recordService.getCaseOrgList();
		fileId1=this.recordService.getOrg().getLocbm();
		return SUCCESS;
	}
	
	
	//当面接待
	private XzfyRecieve xzfyRecieve;
	private List jiedaiList=new ArrayList();
	public String 	showDmjiedaiList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		if(null==locbm || "".equals(locbm)){
			locbm = this.recordService.getOrg().getName();
		}
		this.pageList = this.bananService.getDmjiedaiList(pNum, 100,xzfyRecieve,user,orgName);
		this.jiedaiList = this.pageList.getItems();
		this.totalPage = this.pageList.getTotalPage();
		totalCount=pageList.getTotalCount();
		if(xzfyRecieve==null)
			xzfyRecieve=new XzfyRecieve();
		return "success";
	}
	public String 	showDmjiedaiList2(){
		return "success";
		
		
		
	}
	
	
	/*----------------------------------------批量操作--------------------------------------*/
	
	String[] xzfyStr={};
	String[] personInfo={};
	private String ids;
	private int batType;
	private String batTime;
	
	public String batOperation(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name = user.getName();
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		//userList=recordService.getUserListById(user.getOrg().getId().toString());
		return SUCCESS;
	}
	
	public String savebat() throws Exception{
		xzfyStr=ids.replaceAll(" ", "").split(",");
		//suggestion = new String(suggestion.getBytes("iso-8859-1"), "utf-8");
		for (String id : xzfyStr) {
			xzfyInfo = bananService.getXzfyById(id);
			if(batType==6){
				xzfyInfo.setStatus("6");
				xzfyInfo.setIsdelay("1");				
			}else if(batType==8){
				xzfyInfo.setStatus("8");
				xzfyInfo.setIsstop("1");
				xzfyInfo.setIsstop_from(batTime);
			}else if(batType==10){
				xzfyInfo.setStatus("10");
				xzfyInfo.setBreakTo(batTime);
			}else if(batType==50){//听证
				if (upFileTzjlFileName!= null&&!"".equals(upFileTzjlFileName) ){
					String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
					String realName = upFileTzjlFileName;
					//String a = this.upFile1FileName.split("\\.")[1];
					String extension = upFileTzjlFileName.substring(upFileTzjlFileName.lastIndexOf("."));
					String fileName = Calendar.getInstance().getTimeInMillis()+extension;
					String fileFlod = webRootPath+ "uploadfiles/Tzjl/";
					File path = new File(fileFlod);
					if(!path.exists())
						path.mkdir();
					File outFile1 = new File(fileFlod + fileName);
					TzjlInfo tzjlInfo = new TzjlInfo();
					tzjlInfo.setFileName(realName);
					tzjlInfo.setRealFilePath("../uploadfiles/Tzjl/" + fileName);
					xzfyInfo.setHastingzheng("1");
					tzjlInfo.setXzfyId(id);
					IOStream stream = new IOStream();
					stream.writeFileStream(this.upFileTzjl, outFile1);
					tzjlService.save(tzjlInfo);
				}
			}else if(batType==60){//调解
				if (this.upFile1FileName != null&&!"".equals(this.upFile1FileName) ){
					String webRootPath1 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
					String realName1 = this.upFile1FileName;
					//String a = this.upFile1FileName.split("\\.")[1];
					String extension = upFile1FileName.substring(upFile1FileName.lastIndexOf("."));
					String fileName1 = Calendar.getInstance().getTimeInMillis()+extension;
					String fileFlod1 = webRootPath1 + "uploadfiles/banan/";
					File path = new File(fileFlod1);
					if(!path.exists())
						path.mkdir();
					File outFile1 = new File(fileFlod1 + fileName1);
					xzfyInfo.setTiaojiejilu(realName1);
					xzfyInfo.setTiaojiejilu1("../uploadfiles/banan/" + fileName1);	
					xzfyInfo.setHastiaojie("1");
					IOStream stream = new IOStream();
					stream.writeFileStream(this.upFile1, outFile1);
				}
			}
			
			//加入案件识别及状态推送代码(新)
			if(xzfyInfo.getXzfyInfo2id()!=null&&!xzfyInfo.getXzfyInfo2id().equals("")){
				//判断是否有外网ID，如果有则为外网案件，进行状态为推送。  改变状态为的地方很多，不能只靠在外网保存方法中加
				try{
					
					 XzfyInfo2 newXzfyInfo2 = this.recordService.getXzfyById_w(xzfyInfo.getXzfyInfo2id());
					DatesentProxy da =new DatesentProxy();  
					String c3=da.updateStatus(
							xzfyInfo.getXzfyInfo2id(),        //1案件id
							newXzfyInfo2.getReceive_real_date(), //2保存时间
							xzfyInfo.getReceive_date(),//3收案时间
							xzfyInfo.getIsBuzheng(),//4是否补正
							xzfyInfo.getBzTongzhiriqi(),//5通知补正时间
							xzfyInfo.getBzBuqiriqi(),//6补正时间
							xzfyInfo.getLian_date(),//7立案时间
							xzfyInfo.getTjzfzh(),//8案件号
							xzfyInfo.getIsstop(),// 9是否中止
							xzfyInfo.getIsstop_from(),//10中止时间
							xzfyInfo.getBreakTo(),//11恢复审理日期
							
							xzfyInfo.getIsdelay(),//12延期审理时间
						
							xzfyInfo.getFinish_date(),//13结案日期
							xzfyInfo.getFinish_type());//14审理结果
							//finish_type
							//finish_date
							//newXzfyInfo.getStatus(),
							//newXzfyInfo.getCheck_status()
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
			}
			
			
			
			bananService.saveOrUpdate(xzfyInfo);
			
		}
		return SUCCESS;
	}
	
	//日接待统计列表
	private String searchDate="";
	private List rijiedaiList=new ArrayList();
	public String showRijiedaiList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		if(null==locbm || "".equals(locbm)){
			locbm = this.recordService.getOrg().getLocbm();
		}
		bumen = recordService.getRootOrg(locbm).getName();
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		if("".equals(searchDate)){
			searchDate = todate;
		}
		rijiedaiList = bananService.getRijiedaiList(searchDate, locbm, finish_type);
		return SUCCESS;
	}
	
	private int fileId=0;
	private String fileId1="";
	public String deleteFile(){
		if(fileId != 0){
			String hql="delete from XzfyXcdc xcdc where xcdc.id="+fileId;
			bananService.deleteAll(hql);
		}
		if(!"".equals(fileId1)){
			String hql="delete from TzjlInfo tzjl where tzjl.id='"+fileId1+"'";
			bananService.deleteAll(hql);
		}
		return SUCCESS;
	}
	
	//统计表22：行政复议机关办案效果指标统计
	ArrayList<ArrayList<String>> fyjgLists = new ArrayList<ArrayList<String>>();
	private String fyjgType="0";
	private String tjyear;
	private String xgyear;
	private char xgyeartype;
	public String getBananxgTj() throws SQLException{
		fyjgLists = bananService.getFyjgLists(fyjgType);
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		sysDate=DateUtil.getDatestrByDateFormat(dt,"yyyy年MM月dd日 HH时mm分");
		String year=tjyear.substring(0, 4);//取年份
		xgyear=tjyear.substring(0, 4);
		
		/********全年*********/
		if(tjyear.charAt(4)=='0'){
			 startDate=year+"-01-01";
			 endDate=year+"-12-31";	
			 xgyear+="年全年";
		}		
		/********上半年*********/
		
		else if(tjyear.charAt(4)=='1'){
			 startDate=year+"-01-01";
			 endDate=year+"-06-30";	
			 xgyear+="年上半年";
		}		
		/*********下半年********/
        else if(tjyear.charAt(4)=='2'){
        	 startDate=year+"-07-01";
			 endDate=year+"-12-31";	
			 xgyear+="年下半年";
		}
		dataLists = bananService.getBananxgLists(fyjgLists, startDate, endDate, tjyear);
		
		return SUCCESS;
	} 
	
	
	//查重
	public void checkAnhao(){
		String msg="0";
		//System.out.println(tempname);
		if(!bananService.checkAnhao(tempname,tempid))
			msg="1";
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.print(msg);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void checkXwnum(){
		String msg="0";
		//System.out.println(tempname);
		if(!bananService.checkXwnum(tempname,tempid))
			msg="1";
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.print(msg);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public String getcheckXwnumListByPage(){
		temp=1;
		pageSize=10000;
		pageList1 = bananService.getcheckXwnumListByPage(pNum, pageSize, tempname, tempid);
		case0List = pageList1.getItems();
		for (int i=0;i<case0List.size();i++){
			XzfyInfo x = new XzfyInfo();
			Object[] o = (Object[]) case0List.get(i);
			for(int j=0;j<12;j++){
				if (o[j] != null){
					if(j==0){
						x.setTjzfzh((String) o[j]);
					}else if (j==1){
						x.setReceive_date((String) o[j]);
					}else if (j==2){
						x.setDefendant_name((String) o[j]);
					}else if (j==3){
						x.setApp_show((String) o[j]);
					}else if (j==4){
						x.setStatus((String) o[j]);
					}else if (j==5){
						x.setId((String) o[j]);
					}else if (j==6){
						x.setCheck_status((String) o[j]);
					}else if (j==7){
						x.setStadardResult((String) o[j]);
					}else if (j==8){
						x.setUser1_name((String) o[j]);
					}else if (j==9){
						x.setUser2_name((String) o[j]);
					}else if (j==10){
						x.setUser3_name((String) o[j]);
					}else if (j==11){
						x.setCheck_name((String) o[j]);
					}
				}
			}
			caseList.add(x);
		}
		//caseList = pageList1.getItems();
		totalCount = pageList1.getTotalCount();
		totalPage = pageList1.getTotalPage();
		return SUCCESS;
	}
	public void checkAppnum(){
		String msg="0";
		//System.out.println(tempname);
		if(!bananService.checkAppnum(tempname,tempid))
			msg="1";
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.print(msg);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public String getCheckAppnumListByPage(){
		temp=1;
		pageSize=10000;
		pageList1 = bananService.getCheckAppnumListByPage(pNum, pageSize, tempname, tempid);
		case0List = pageList1.getItems();
		for (int i=0;i<case0List.size();i++){
			XzfyInfo x = new XzfyInfo();
			Object[] o = (Object[]) case0List.get(i);
			for(int j=0;j<12;j++){
				if (o[j] != null){
					if(j==0){
						x.setTjzfzh((String) o[j]);
					}else if (j==1){
						x.setReceive_date((String) o[j]);
					}else if (j==2){
						x.setDefendant_name((String) o[j]);
					}else if (j==3){
						x.setApp_show((String) o[j]);
					}else if (j==4){
						x.setStatus((String) o[j]);
					}else if (j==5){
						x.setId((String) o[j]);
					}else if (j==6){
						x.setCheck_status((String) o[j]);
					}else if (j==7){
						x.setStadardResult((String) o[j]);
					}else if (j==8){
						x.setUser1_name((String) o[j]);
					}else if (j==9){
						x.setUser2_name((String) o[j]);
					}else if (j==10){
						x.setUser3_name((String) o[j]);
					}else if (j==11){
						x.setCheck_name((String) o[j]);
					}
				}
			}
			caseList.add(x);
		}
		//caseList = pageList1.getItems();
		totalCount = pageList1.getTotalCount();
		totalPage = pageList1.getTotalPage();
		return SUCCESS;
	}
	
	//首页弹出点确定之后的操作
	private String[] meetIds={};
	private String[] recieveIds={};
	private Meet meet;
	private EntryRefreshPolicy entryRefreshPolicy; 
	private ExpiresRefreshPolicy expiresRefreshPolicy;
	private GeneralCacheAdministrator generalCacheAdministrator;
	public void hasInformed(){
		for(int i=0;i<meetIds.length;i++){
			meet = bananService.getMeetById(meetIds[i]);
			meet.setFace_time("2");
			bananService.update(meet);
		}
		for(int i=0;i<recieveIds.length;i++){
			xzfyRecieve = bananService.getDmbzById(recieveIds[i]);
			xzfyRecieve.setFinish_date("2");
			bananService.update(xzfyRecieve);
		}
		//entryRefreshPolicy.needsRefresh(null);
		//generalCacheAdministrator.flushAll();
		
	}
	public String showInform(){
		user = new User();
		user = (User) ActionContext.getContext().getSession()
				.get("_USER_LOGIN_");
		admit_name = user.getName();
		Org org=recordService.getOrg();
		locbm = org.getLocbm();
		informList = bananService.getInformList(user.getId().toString(), locbm);//首页弹出提示阅卷送达转交材料
		return SUCCESS;
	}
	//查看当面补正页面
	private XzfyRecieve buzhengInfo;
	private String receiveId="";
	public String showDmbz(){
		buzhengInfo = bananService.getDmbzById(receiveId);
		return SUCCESS;
	}
	
	//是否及时登记案件监控统计
	public String jishidengji(){
		try {
			//year=new SimpleDateFormat("yyyy").format(new Date());
//			xmlString1 = xzfyStatisticsService.getXmlString();// 按区县
//			xmlString1 = "<chart caption='本年度全市各区县人民政府受理情况统计' xAxisName='' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' baseFontSize='14' outCnvBaseFontSize='14'><set label='东城区' value='30' link='../pages/showCount.ftl'/><set label='西城区' value='26' /><set label='朝阳区' value='20' /><set label='海淀区' value='20' /><set label='丰台区' value='18' /><set label='石景山区' value='16' /><set label='门头沟区' value='13' /><set label='房山区' value='8' /><set label='通州区' value='7' /><set label='顺义区' value='5' /><set label='大兴区' value='5' /><set label='昌平区' value='5' /><set label='平谷区' value='4' /><set label='怀柔区' value='3' /><set label='密云县' value='3' /><set label='延庆县' value='2' /><art>";	
			xmlString=bananService.getXmlString(jktype, hengxiangtype, locbm, startDate, endDate);
			if(jktype.equals("1")){
				if(hengxiangtype.equals("1"))
					jktype="市、区县政府按时填报率率横向比较(百分率%)";
				else if(hengxiangtype.equals("2"))
					jktype="市政府部门按时填报率横向比较(百分率%)";
		    }
		    else if(jktype.equals("2")){
		    	jktype=orgName+"及时登记案件数统计";
		    }
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
	


	private String tempname = "";
	private String tempid = "";
	private String delay_detail = "";
	private String stop_detail = "";
	private String isstop_from = "";
	private String breakTo = "";
	private String isdelay = "";
	private String isstop = "";	
	private String todate = "";
	private String checkid = "";
	private String isdelay_From = "";
	private String isdelay_To = "";
	private String tempstatus = "";
	private String tempcheckstatus = "";
	private int temp = 0;
	private int temp1 = 0;  
	private String delay_reason = "";
	private String stop_reason = "";
	private String tiaojiejilu = "";
	private String finish_date = "";
	private String finish_type = "";
	private String finishBreakType = "";
	private String nationMoney = "";
	private String nationMoneyDetail = "";
	private String pizhunren = "";
	private String pizhunren1 = "";
	private String pizhunren2 = "";
	private String pizhunren3 = "";
	private String pizhunriqi = "";
	private String pizhunriqi1 = "";
	private String pizhunriqi2 = "";
	private String pifuyijian = "";
	private String pifuyijian1 = "";
	private String pifuyijian2 = "";
	private String pifuyijian3 = "";
	private File[] upFile; // 现场调查附件对象
	private String[] upFileFileName = {}; // 现场调查附件对象名称
	private File upFile1 = new File("upFile"); // 调解附件对象
	private String upFile1FileName = ""; // 调解附件对象名称2
	private File upFile2 = new File("upFile");
	private File upFile3 = new File("upFile");
	private File upFile4 = new File("upFile");
	private String upFile2FileName = "";
	private String upFile3FileName = "";
	private String upFile4FileName = "";
	private String admit_name = "";	
	private String tiaojiejilu1;
	private User user;
	private Org org;
	private String jaAdvice="";
	private String trailMode="";
	private String bumen="";
	private String subbumen="";
	private int totalCount=0;
	private List samexwList=new ArrayList();
	private List samekindxwList=new ArrayList();
	private int totalCount1=1;
	private int totalCount2=1;
	private List informList;//首页弹出通知列表
	private String jktype=""; //1是否及时登记案件监控2是否及时填写结案信息监控
	private String hengxiangtype=""; //1市、区县政府2市政府部门
	private String xmlString="";
	
	
	public String getIsstop() {
		return isstop;
	}
	public void setIsstop(String isstop) {
		this.isstop = isstop;
	}
	public String getIsdelay() {
		return isdelay;
	}
	public void setIsdelay(String isdelay) {
		this.isdelay = isdelay;
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
	public void setAdmit_name(String admitName) {
		admit_name = admitName;
	}	
	public String getBreakTo() {
		return breakTo;
	}
	public void setBreakTo(String breakTo) {
		this.breakTo = breakTo;
	}
	public String getIsstop_from() {
		return isstop_from;
	}
	public void setIsstop_from(String isstopFrom) {
		isstop_from = isstopFrom;
	}	
	public String getTiaojiejilu() {
		return tiaojiejilu;
	}
	public void setTiaojiejilu(String tiaojiejilu) {
		this.tiaojiejilu = tiaojiejilu;
	}
	public String getTiaojiejilu1() {
		return tiaojiejilu1;
	}
	public void setTiaojiejilu1(String tiaojiejilu1) {
		this.tiaojiejilu1 = tiaojiejilu1;
	}	
	public String getTempcheckstatus() {
		return tempcheckstatus;
	}
	public void setTempcheckstatus(String tempcheckstatus) {
		this.tempcheckstatus = tempcheckstatus;
	}
	public String getTempstatus() {
		return tempstatus;
	}
	public void setTempstatus(String tempstatus) {
		this.tempstatus = tempstatus;
	}
	public String getDelay_detail() {
		return delay_detail;
	}
	public void setDelay_detail(String delayDetail) {
		delay_detail = delayDetail;
	}
	public String getIsdelay_From() {
		return isdelay_From;
	}
	public void setIsdelay_From(String isdelayFrom) {
		isdelay_From = isdelayFrom;
	}
	public String getIsdelay_To() {
		return isdelay_To;
	}
	public void setIsdelay_To(String isdelayTo) {
		isdelay_To = isdelayTo;
	}
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
	public String getStop_detail() {
		return stop_detail;
	}
	public void setStop_detail(String stopDetail) {
		stop_detail = stopDetail;
	}
	public int getTemp() {
		return temp;
	}
	public void setTemp(int temp) {
		this.temp = temp;
	}
	public int getTemp1() {
		return temp1;
	}
	public void setTemp1(int temp1) {
		this.temp1 = temp1;
	}
	public String getDelay_reason() {
		return delay_reason;
	}
	public void setDelay_reason(String delayReason) {
		delay_reason = delayReason;
	}
	public String getStop_reason() {
		return stop_reason;
	}
	public void setStop_reason(String stopReason) {
		stop_reason = stopReason;
	}
	public String getPizhunren1() {
		return pizhunren1;
	}
	public void setPizhunren1(String pizhunren1) {
		this.pizhunren1 = pizhunren1;
	}
	public String getPizhunren2() {
		return pizhunren2;
	}
	public void setPizhunren2(String pizhunren2) {
		this.pizhunren2 = pizhunren2;
	}
	public String getPizhunriqi() {
		return pizhunriqi;
	}
	public void setPizhunriqi(String pizhunriqi) {
		this.pizhunriqi = pizhunriqi;
	}
	public String getPizhunriqi1() {
		return pizhunriqi1;
	}
	public void setPizhunriqi1(String pizhunriqi1) {
		this.pizhunriqi1 = pizhunriqi1;
	}
	public String getPizhunriqi2() {
		return pizhunriqi2;
	}
	public void setPizhunriqi2(String pizhunriqi2) {
		this.pizhunriqi2 = pizhunriqi2;
	}
	public String getPifuyijian() {
		return pifuyijian;
	}
	public void setPifuyijian(String pifuyijian) {
		this.pifuyijian = pifuyijian;
	}
	public String getPifuyijian1() {
		return pifuyijian1;
	}
	public void setPifuyijian1(String pifuyijian1) {
		this.pifuyijian1 = pifuyijian1;
	}
	public String getPifuyijian2() {
		return pifuyijian2;
	}
	public void setPifuyijian2(String pifuyijian2) {
		this.pifuyijian2 = pifuyijian2;
	}
	public void setAllList(List allList) {
		this.allList = allList;
	}
	public List getAllList() {
		return allList;
	}	
	public String getPizhunren() {
		return pizhunren;
	}
	public void setPizhunren(String pizhunren) {
		this.pizhunren = pizhunren;
	}
	public String getFinish_date() {
		return finish_date;
	}
	public void setFinish_date(String finishDate) {
		finish_date = finishDate;
	}
	public String getFinish_type() {
		return finish_type;
	}
	public void setFinish_type(String finishType) {
		finish_type = finishType;
	}
	public String getFinishBreakType() {
		return finishBreakType;
	}
	public void setFinishBreakType(String finishBreakType) {
		this.finishBreakType = finishBreakType;
	}
	public String getNationMoney() {
		return nationMoney;
	}
	public void setNationMoney(String nationMoney) {
		this.nationMoney = nationMoney;
	}
	public String getNationMoneyDetail() {
		return nationMoneyDetail;
	}
	public void setNationMoneyDetail(String nationMoneyDetail) {
		this.nationMoneyDetail = nationMoneyDetail;
	}
	public File[] getUpFile() {
		return upFile;
	}
	public void setUpFile(File[] upFile) {
		this.upFile = upFile;
	}
	public String[] getUpFileFileName() {
		return upFileFileName;
	}
	public void setUpFileFileName(String[] upFileFileName) {
		this.upFileFileName = upFileFileName;
	}	
	public File getUpFile1() {
		return upFile1;
	}
	public void setUpFile1(File upFile1) {
		this.upFile1 = upFile1;
	}
	public String getUpFile1FileName() {
		return upFile1FileName;
	}
	public void setUpFile1FileName(String upFile1FileName) {
		this.upFile1FileName = upFile1FileName;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public String getPizhunren3() {
		return pizhunren3;
	}
	public void setPizhunren3(String pizhunren3) {
		this.pizhunren3 = pizhunren3;
	}
	public String getPifuyijian3() {
		return pifuyijian3;
	}
	public void setPifuyijian3(String pifuyijian3) {
		this.pifuyijian3 = pifuyijian3;
	}
	public String getCheckid() {
		return checkid;
	}
	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}
	public String getJaAdvice() {
		return jaAdvice;
	}
	public void setJaAdvice(String jaAdvice) {
		this.jaAdvice = jaAdvice;
	}
	public String getTrailMode() {
		return trailMode;
	}
	public void setTrailMode(String trailMode) {
		this.trailMode = trailMode;
	}
	public Org getOrg() {
		return org;
	}
	public void setOrg(Org org) {
		this.org = org;
	}
	public String getBumen() {
		return bumen;
	}
	public void setBumen(String bumen) {
		this.bumen = bumen;
	}
	public List getOrgList() {
		return orgList;
	}
	public void setOrgList(List orgList) {
		this.orgList = orgList;
	}

	public List getDailianshenchaList() {
		return dailianshenchaList;
	}
	public void setDailianshenchaList(List dailianshenchaList) {
		this.dailianshenchaList = dailianshenchaList;
	}
	public List getDaibanliList() {
		return daibanliList;
	}
	public void setDaibanliList(List daibanliList) {
		this.daibanliList = daibanliList;
	}
	public List getDaishenpiList() {
		return daishenpiList;
	}
	public void setDaishenpiList(List daishenpiList) {
		this.daishenpiList = daishenpiList;
	}
	public List getDailianshenpiList() {
		return dailianshenpiList;
	}
	public void setDailianshenpiList(List dailianshenpiList) {
		this.dailianshenpiList = dailianshenpiList;
	}
	public List getShenliqixian_20_List() {
		return shenliqixian_20_List;
	}
	public void setShenliqixian_20_List(List shenliqixian_20List) {
		shenliqixian_20_List = shenliqixian_20List;
	}
	public List getShenliqixian_10_List() {
		return shenliqixian_10_List;
	}
	public void setShenliqixian_10_List(List shenliqixian_10List) {
		shenliqixian_10_List = shenliqixian_10List;
	}
	public List getShenliqixian_chaoqi_List() {
		return shenliqixian_chaoqi_List;
	}
	public void setShenliqixian_chaoqi_List(List shenliqixianChaoqiList) {
		shenliqixian_chaoqi_List = shenliqixianChaoqiList;
	}
	public List getZhongzhiList() {
		return zhongzhiList;
	}
	public void setZhongzhiList(List zhongzhiList) {
		this.zhongzhiList = zhongzhiList;
	}
	public List getWeibanjie_sub_List() {
		return weibanjie_sub_List;
	}
	public void setWeibanjie_sub_List(List weibanjieSubList) {
		weibanjie_sub_List = weibanjieSubList;
	}
	public List getShenliqixian_sub40_List() {
		return shenliqixian_sub40_List;
	}
	public void setShenliqixian_sub40_List(List shenliqixianSub40List) {
		shenliqixian_sub40_List = shenliqixianSub40List;
	}
	public List getShenliqixian_sub50_List() {
		return shenliqixian_sub50_List;
	}
	public void setShenliqixian_sub50_List(List shenliqixianSub50List) {
		shenliqixian_sub50_List = shenliqixianSub50List;
	}
	public List getShenliqixian_subchaoqi_List() {
		return shenliqixian_subchaoqi_List;
	}
	public void setShenliqixian_subchaoqi_List(List shenliqixianSubchaoqiList) {
		shenliqixian_subchaoqi_List = shenliqixianSubchaoqiList;
	}
	public List getNewdaifenpeiList() {
		return newdaifenpeiList;
	}
	public void setNewdaifenpeiList(List newdaifenpeiList) {
		this.newdaifenpeiList = newdaifenpeiList;
	}
	public List getWeizhidingList() {
		return weizhidingList;
	}
	public void setWeizhidingList(List weizhidingList) {
		this.weizhidingList = weizhidingList;
	}
	public List getSuborgList() {
		return suborgList;
	}
	public void setSuborgList(List suborgList) {
		this.suborgList = suborgList;
	}
	public String getSubbumen() {
		return subbumen;
	}
	public void setSubbumen(String subbumen) {
		this.subbumen = subbumen;
	}

	public List<XzfyInfo> getWeibanjieList() {
		return weibanjieList;
	}
	public void setWeibanjieList(List<XzfyInfo> weibanjieList) {
		this.weibanjieList = weibanjieList;
	}
	public int getListkeyword() {
		return listkeyword;
	}
	public void setListkeyword(int listkeyword) {
		this.listkeyword = listkeyword;
	}
	public List getCaseList() {
		return caseList;
	}
	public void setCaseList(List caseList) {
		this.caseList = caseList;
	}
	public String getLocbm() {
		return locbm;
	}
	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}
	public List getCaseAllList() {
		return caseAllList;
	}
	public void setCaseAllList(List caseAllList) {
		this.caseAllList = caseAllList;
	}
	public File getUpFile2() {
		return upFile2;
	}
	public void setUpFile2(File upFile2) {
		this.upFile2 = upFile2;
	}
	public File getUpFile3() {
		return upFile3;
	}
	public void setUpFile3(File upFile3) {
		this.upFile3 = upFile3;
	}
	public String getUpFile2FileName() {
		return upFile2FileName;
	}
	public void setUpFile2FileName(String upFile2FileName) {
		this.upFile2FileName = upFile2FileName;
	}
	public String getUpFile3FileName() {
		return upFile3FileName;
	}
	public void setUpFile3FileName(String upFile3FileName) {
		this.upFile3FileName = upFile3FileName;
	}
	public File getUpFile4() {
		return upFile4;
	}
	public void setUpFile4(File upFile4) {
		this.upFile4 = upFile4;
	}
	public String getUpFile4FileName() {
		return upFile4FileName;
	}
	public void setUpFile4FileName(String upFile4FileName) {
		this.upFile4FileName = upFile4FileName;
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
	public String[] getKeyword() {
		return keyword;
	}
	public void setKeyword(String[] keyword) {
		this.keyword = keyword;
	}
	public List getKeywordCheckedList() {
		return keywordCheckedList;
	}
	public void setKeywordCheckedList(List keywordCheckedList) {
		this.keywordCheckedList = keywordCheckedList;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public List getXzfyCheckList() {
		return xzfyCheckList;
	}
	public void setXzfyCheckList(List xzfyCheckList) {
		this.xzfyCheckList = xzfyCheckList;
	}
	
	private AshjlInfo ashjlInfo;

	public AshjlInfo getAshjlInfo() {
		return ashjlInfo;
	}
	public void setAshjlInfo(AshjlInfo ashjlInfo) {
		this.ashjlInfo = ashjlInfo;
	}
	private List<AshjlWypj> wyList = new ArrayList<AshjlWypj>();
	public List<AshjlWypj> getWyList() {
		return wyList;
	}
	public void setWyList(List<AshjlWypj> wyList) {
		this.wyList = wyList;
	}
	private TzjlInfo tzjlInfo = new TzjlInfo();
	public TzjlInfo getTzjlInfo() {
		return tzjlInfo;
	}
	public void setTzjlInfo(TzjlInfo tzjlInfo) {
		this.tzjlInfo = tzjlInfo;
	}
	private File upFileTzjl;
	private String upFileTzjlFileName;
	public File getUpFileTzjl() {
		return upFileTzjl;
	}
	public void setUpFileTzjl(File upFileTzjl) {
		this.upFileTzjl = upFileTzjl;
	}
	public String getUpFileTzjlFileName() {
		return upFileTzjlFileName;
	}
	public void setUpFileTzjlFileName(String upFileTzjlFileName) {
		this.upFileTzjlFileName = upFileTzjlFileName;
	}
	public int getTempDftzId() {
		return tempDftzId;
	}
	public void setTempDftzId(int tempDftzId) {
		this.tempDftzId = tempDftzId;
	}
	public List getShenpiList1() {return shenpiList1;}
	public void setShenpiList1(List shenpiList1) {this.shenpiList1 = shenpiList1;}
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
	public Integer getpNum() {
		return pNum;
	}
	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}
	public List getSmsReceiverList() {
		return smsReceiverList;
	}
	public void setSmsReceiverList(List smsReceiverList) {
		this.smsReceiverList = smsReceiverList;
	}
	public Sms getSms() {
		return sms;
	}
	public void setSms(Sms sms) {
		this.sms = sms;
	}
	public int getIsView() {
		return isView;
	}
	public void setIsView(int isView) {
		this.isView = isView;
	}
	public String[] getReceiverid() {
		return receiverid;
	}
	public void setReceiverid(String[] receiverid) {
		this.receiverid = receiverid;
	}
	public String[] getReceivername() {
		return receivername;
	}
	public void setReceivername(String[] receivername) {
		this.receivername = receivername;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List getSamexwList() {
		return samexwList;
	}
	public void setSamexwList(List samexwList) {
		this.samexwList = samexwList;
	}
	public List getSamekindxwList() {
		return samekindxwList;
	}
	public void setSamekindxwList(List samekindxwList) {
		this.samekindxwList = samekindxwList;
	}
	public PaginationSupport getPageList1() {
		return pageList1;
	}
	public void setPageList1(PaginationSupport pageList1) {
		this.pageList1 = pageList1;
	}
	public PaginationSupport getPageList2() {
		return pageList2;
	}
	public void setPageList2(PaginationSupport pageList2) {
		this.pageList2 = pageList2;
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
	public List getForm10List() {
		return form10List;
	}
	public void setForm10List(List form10List) {
		this.form10List = form10List;
	}
	public List getForm11List() {
		return form11List;
	}
	public void setForm11List(List form11List) {
		this.form11List = form11List;
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
	public String getSysDate() {
		return sysDate;
	}
	public void setSysDate(String sysDate) {
		this.sysDate = sysDate;
	}
	public ArrayList<ArrayList<String>> getDataLists() {
		return dataLists;
	}
	public void setDataLists(ArrayList<ArrayList<String>> dataLists) {
		this.dataLists = dataLists;
	}
	public List getJiedaiList() {
		return jiedaiList;
	}
	public void setJiedaiList(List jiedaiList) {
		this.jiedaiList = jiedaiList;
	}
	public XzfyRecieve getXzfyRecieve() {
		return xzfyRecieve;
	}
	public void setXzfyRecieve(XzfyRecieve xzfyRecieve) {
		this.xzfyRecieve = xzfyRecieve;
	}
	public String[] getXzfyStr() {
		return xzfyStr;
	}
	public void setXzfyStr(String[] xzfyStr) {
		this.xzfyStr = xzfyStr;
	}
	public String[] getPersonInfo() {
		return personInfo;
	}
	public void setPersonInfo(String[] personInfo) {
		this.personInfo = personInfo;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public int getBatType() {
		return batType;
	}
	public void setBatType(int batType) {
		this.batType = batType;
	}
	public String getBatTime() {
		return batTime;
	}
	public void setBatTime(String batTime) {
		this.batTime = batTime;
	}
	public String getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
	public List getRijiedaiList() {
		return rijiedaiList;
	}
	public void setRijiedaiList(List rijiedaiList) {
		this.rijiedaiList = rijiedaiList;
	}
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public String getFileId1() {
		return fileId1;
	}
	public void setFileId1(String fileId1) {
		this.fileId1 = fileId1;
	}
	public List getHomeCaseNumList() {
		return homeCaseNumList;
	}
	public void setHomeCaseNumList(List homeCaseNumList) {
		this.homeCaseNumList = homeCaseNumList;
	}
	public String getOrgBm() {
		return orgBm;
	}
	public void setOrgBm(String orgBm) {
		this.orgBm = orgBm;
	}
	public int getBsqrListSize() {
		return bsqrListSize;
	}
	public void setBsqrListSize(int bsqrListSize) {
		this.bsqrListSize = bsqrListSize;
	}
	public List getDateList() {
		return dateList;
	}
	public void setDateList(List dateList) {
		this.dateList = dateList;
	}
	public String getDocdftzSql() {
		return docdftzSql;
	}
	public void setDocdftzSql(String docdftzSql) {
		this.docdftzSql = docdftzSql;
	}
	public String getDocdfdftzSql() {
		return docdfdftzSql;
	}
	public void setDocdfdftzSql(String docdfdftzSql) {
		this.docdfdftzSql = docdfdftzSql;
	}
	public List getDocdftzList() {
		return docdftzList;
	}
	public void setDocdftzList(List docdftzList) {
		this.docdftzList = docdftzList;
	}
	public List getDocdfdftzList() {
		return docdfdftzList;
	}
	public void setDocdfdftzList(List docdfdftzList) {
		this.docdfdftzList = docdfdftzList;
	}
	public int getDfdftzNum() {
		return dfdftzNum;
	}
	public void setDfdftzNum(int dfdftzNum) {
		this.dfdftzNum = dfdftzNum;
	}
	public int getDftzNum() {
		return dftzNum;
	}
	public void setDftzNum(int dftzNum) {
		this.dftzNum = dftzNum;
	}
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public List getCase0List() {
		return case0List;
	}
	public void setCase0List(List case0List) {
		this.case0List = case0List;
	}
	public List getUserList() {
		return userList;
	}
	public void setUserList(List userList) {
		this.userList = userList;
	}

	public List getTotalList() {
		return totalList;
	}
	public void setTotalList(List totalList) {
		this.totalList = totalList;
	}
	public int getSearchpeid() {
		return searchpeid;
	}
	public void setSearchpeid(int searchpeid) {
		this.searchpeid = searchpeid;
	}
	public List getWeifenpei_sub_List() {
		return weifenpei_sub_List;
	}
	public void setWeifenpei_sub_List(List weifenpeiSubList) {
		weifenpei_sub_List = weifenpeiSubList;
	}

	public String getRootLocbm() {
		return rootLocbm;
	}
	public void setRootLocbm(String rootLocbm) {
		this.rootLocbm = rootLocbm;
	}

	public String getFyjgType() {
		return fyjgType;
	}
	public void setFyjgType(String fyjgType) {
		this.fyjgType = fyjgType;
	}
	public String getTjyear() {
		return tjyear;
	}
	public void setTjyear(String tjyear) {
		this.tjyear = tjyear;
	}
	public ArrayList<ArrayList<String>> getFyjgLists() {
		return fyjgLists;
	}
	public void setFyjgLists(ArrayList<ArrayList<String>> fyjgLists) {
		this.fyjgLists = fyjgLists;
	}
	public String getDocyanqiSql() {
		return docyanqiSql;
	}
	public void setDocyanqiSql(String docyanqiSql) {
		this.docyanqiSql = docyanqiSql;
	}
	public int getDocyanqiNum() {
		return docyanqiNum;
	}
	public void setDocyanqiNum(int docyanqiNum) {
		this.docyanqiNum = docyanqiNum;
	}
	public String getDoczhongzhiSql() {
		return doczhongzhiSql;
	}
	public void setDoczhongzhiSql(String doczhongzhiSql) {
		this.doczhongzhiSql = doczhongzhiSql;
	}
	public int getDoczhongzhiNum() {
		return doczhongzhiNum;
	}
	public void setDoczhongzhiNum(int doczhongzhiNum) {
		this.doczhongzhiNum = doczhongzhiNum;
	}
	public String getDochuifuSql() {
		return dochuifuSql;
	}
	public void setDochuifuSql(String dochuifuSql) {
		this.dochuifuSql = dochuifuSql;
	}
	public int getDochuifuNum() {
		return dochuifuNum;
	}
	public void setDochuifuNum(int dochuifuNum) {
		this.dochuifuNum = dochuifuNum;
	}
	public String getDocjieanSql() {
		return docjieanSql;
	}
	public void setDocjieanSql(String docjieanSql) {
		this.docjieanSql = docjieanSql;
	}
	public int getDocjieanNum() {
		return docjieanNum;
	}
	public void setDocjieanNum(int docjieanNum) {
		this.docjieanNum = docjieanNum;
	}
	public String getDocyijianSql() {
		return docyijianSql;
	}
	public void setDocyijianSql(String docyijianSql) {
		this.docyijianSql = docyijianSql;
	}
	public int getDocyijianNum() {
		return docyijianNum;
	}
	public void setDocyijianNum(int docyijianNum) {
		this.docyijianNum = docyijianNum;
	}
	public String getDocjianyiSql() {
		return docjianyiSql;
	}
	public void setDocjianyiSql(String docjianyiSql) {
		this.docjianyiSql = docjianyiSql;
	}
	public int getDocjianyiNum() {
		return docjianyiNum;
	}
	public void setDocjianyiNum(int docjianyiNum) {
		this.docjianyiNum = docjianyiNum;
	}
	public String getDocjieanSql1() {
		return docjieanSql1;
	}
	public void setDocjieanSql1(String docjieanSql1) {
		this.docjieanSql1 = docjieanSql1;
	}
	public int getDocjieanNum1() {
		return docjieanNum1;
	}
	public void setDocjieanNum1(int docjieanNum1) {
		this.docjieanNum1 = docjieanNum1;
	}
	public String getDocjieanSql2() {
		return docjieanSql2;
	}
	public void setDocjieanSql2(String docjieanSql2) {
		this.docjieanSql2 = docjieanSql2;
	}
	public int getDocjieanNum2() {
		return docjieanNum2;
	}
	public void setDocjieanNum2(int docjieanNum2) {
		this.docjieanNum2 = docjieanNum2;
	}
	public String getDocjieanSql3() {
		return docjieanSql3;
	}
	public void setDocjieanSql3(String docjieanSql3) {
		this.docjieanSql3 = docjieanSql3;
	}
	public int getDocjieanNum3() {
		return docjieanNum3;
	}
	public void setDocjieanNum3(int docjieanNum3) {
		this.docjieanNum3 = docjieanNum3;
	}
	public String getXgyear() {
		return xgyear;
	}
	public void setXgyear(String xgyear) {
		this.xgyear = xgyear;
	}
	public char getXgyeartype() {
		return xgyeartype;
	}
	public void setXgyeartype(char xgyeartype) {
		this.xgyeartype = xgyeartype;
	}
	public String getSubweibanjie() {
		return subweibanjie;
	}
	public void setSubweibanjie(String subweibanjie) {
		this.subweibanjie = subweibanjie;
	}
	public String getSubDailianshencha() {
		return subDailianshencha;
	}
	public void setSubDailianshencha(String subDailianshencha) {
		this.subDailianshencha = subDailianshencha;
	}
	public String getSub35() {
		return sub35;
	}
	public void setSub35(String sub35) {
		this.sub35 = sub35;
	}
	public String getSub5() {
		return sub5;
	}
	public void setSub5(String sub5) {
		this.sub5 = sub5;
	}
	public String getSubBuzheng() {
		return subBuzheng;
	}
	public void setSubBuzheng(String subBuzheng) {
		this.subBuzheng = subBuzheng;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getOrgid() {
		return orgid;
	}
	public void setOrgid(int orgid) {
		this.orgid = orgid;
	}
	public String getGuofabanFN() {
		return guofabanFN;
	}
	public void setGuofabanFN(String guofabanFN) {
		this.guofabanFN = guofabanFN;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getShenpiDate() {
		return shenpiDate;
	}
	public void setShenpiDate(String shenpiDate) {
		this.shenpiDate = shenpiDate;
	}
	public String getSbBuzheng() {
		return sbBuzheng;
	}
	public void setSbBuzheng(String sbBuzheng) {
		this.sbBuzheng = sbBuzheng;
	}
	public String getSbzhongzhi() {
		return sbzhongzhi;
	}
	public void setSbzhongzhi(String sbzhongzhi) {
		this.sbzhongzhi = sbzhongzhi;
	}
	public String getSbbanjie() {
		return sbbanjie;
	}
	public void setSbbanjie(String sbbanjie) {
		this.sbbanjie = sbbanjie;
	}
	public String getSbYishencha() {
		return sbYishencha;
	}
	public void setSbYishencha(String sbYishencha) {
		this.sbYishencha = sbYishencha;
	}
	
	public String getSbGuoqi() {
		return sbGuoqi;
	}
	public void setSbGuoqi(String sbGuoqi) {
		this.sbGuoqi = sbGuoqi;
	}
	public String[] getMeetIds() {
		return meetIds;
	}
	public void setMeetIds(String[] meetIds) {
		this.meetIds = meetIds;
	}
	public Meet getMeet() {
		return meet;
	}
	public void setMeet(Meet meet) {
		this.meet = meet;
	}
	public List getInformList() {
		return informList;
	}
	public void setInformList(List informList) {
		this.informList = informList;
	}
	public File getUpFilesqs() {
		return upFilesqs;
	}
	public void setUpFilesqs(File upFilesqs) {
		this.upFilesqs = upFilesqs;
	}
	public String getUpFilesqsFileName() {
		return upFilesqsFileName;
	}
	public void setUpFilesqsFileName(String upFilesqsFileName) {
		this.upFilesqsFileName = upFilesqsFileName;
	}
	public File getUpFilebccl() {
		return upFilebccl;
	}
	public void setUpFilebccl(File upFilebccl) {
		this.upFilebccl = upFilebccl;
	}
	public String getUpFilebcclFileName() {
		return upFilebcclFileName;
	}
	public String getDftzbeizhu() {
		return dftzbeizhu;
	}
	public void setDftzbeizhu(String dftzbeizhu) {
		this.dftzbeizhu = dftzbeizhu;
	}
	public void setUpFilebcclFileName(String upFilebcclFileName) {
		this.upFilebcclFileName = upFilebcclFileName;
	}
	public int getDeldftztype() {
		return deldftztype;
	}
	public void setDeldftztype(int deldftztype) {
		this.deldftztype = deldftztype;
	}
	public XzfyRecieve getBuzhengInfo() {
		return buzhengInfo;
	}
	public void setBuzhengInfo(XzfyRecieve buzhengInfo) {
		this.buzhengInfo = buzhengInfo;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String[] getRecieveIds() {
		return recieveIds;
	}
	public void setRecieveIds(String[] recieveIds) {
		this.recieveIds = recieveIds;
	}
	public String getJktype() {
		return jktype;
	}
	public void setJktype(String jktype) {
		this.jktype = jktype;
	}
	public String getHengxiangtype() {
		return hengxiangtype;
	}
	public void setHengxiangtype(String hengxiangtype) {
		this.hengxiangtype = hengxiangtype;
	}
	public String getXmlString() {
		return xmlString;
	}
	public void setXmlString(String xmlString) {
		this.xmlString = xmlString;
	}
	public List getUser1List() {
		return user1List;
	}
	public void setUser1List(List user1List) {
		this.user1List = user1List;
	}
	public List getUser2List() {
		return user2List;
	}
	public void setUser2List(List user2List) {
		this.user2List = user2List;
	}
	public List getUser3List() {
		return user3List;
	}
	public void setUser3List(List user3List) {
		this.user3List = user3List;
	}
	public List getUser4List() {
		return user4List;
	}
	public void setUser4List(List user4List) {
		this.user4List = user4List;
	}
	public String getFasongdanwei1() {
		return fasongdanwei1;
	}
	public void setFasongdanwei1(String fasongdanwei1) {
		this.fasongdanwei1 = fasongdanwei1;
	}
	public String getFasongdanwei2() {
		return fasongdanwei2;
	}
	public void setFasongdanwei2(String fasongdanwei2) {
		this.fasongdanwei2 = fasongdanwei2;
	}
	public String getFasongdanwei3() {
		return fasongdanwei3;
	}
	public void setFasongdanwei3(String fasongdanwei3) {
		this.fasongdanwei3 = fasongdanwei3;
	}
	public String getFasongdanwei4() {
		return fasongdanwei4;
	}
	public void setFasongdanwei4(String fasongdanwei4) {
		this.fasongdanwei4 = fasongdanwei4;
	}
	public String getFasongren1() {
		return fasongren1;
	}
	public void setFasongren1(String fasongren1) {
		this.fasongren1 = fasongren1;
	}
	public String getFasongren2() {
		return fasongren2;
	}
	public void setFasongren2(String fasongren2) {
		this.fasongren2 = fasongren2;
	}
	public String getFasongren3() {
		return fasongren3;
	}
	public void setFasongren3(String fasongren3) {
		this.fasongren3 = fasongren3;
	}
	public String getFasongren4() {
		return fasongren4;
	}
	public void setFasongren4(String fasongren4) {
		this.fasongren4 = fasongren4;
	}
	
}


