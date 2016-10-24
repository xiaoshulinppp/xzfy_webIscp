package com.taiji.fzb.webwork;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.rmi.RemoteException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import net.sf.cglib.beans.BeanCopier;
import net.sf.json.JSONObject;

import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.Beishenqingren;
import com.taiji.fzb.domain.Vacation;
import com.taiji.fzb.domain.Xw;
import com.taiji.fzb.domain.XzfyAgent;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyBuwei;
import com.taiji.fzb.domain.XzfyCompany;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyInfoFile;
import com.taiji.fzb.domain.XzfyRecieve;
import com.taiji.fzb.domain.XzfyShenpi;
import com.taiji.fzb.service.BananService;
import com.taiji.fzb.service.BsqrService;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.VacationService;
import com.taiji.fzb.service.XzfyService;
import com.taiji.fzb.service.XzfyStatisticsService;
import com.taiji.meet.domin.Meet;
import com.taiji.schedule.domain.ScheduleInfo;
import com.taiji.system.domain.DictItem;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.waiwangTB.domain.XzfyInfo2;
import com.taiji.waiwangTB.domain.XzfyInfo_w;
import com.taiji.waiwangTB.domain.dogs;
import com.taiji.website.domain.ArticleInfo;
import com.util.DateUtil;
import com.util.FileUtil;
import com.util.UserUtil;

import localhost.zxfy.services.datesent.DatesentProxy;



@SuppressWarnings("unchecked")
public class XzfyDetailAction extends ProtectedDetailAction {

	private static final long serialVersionUID = 1L;

	private String contentDisposition;
	private InputStream docStream;
	// 类成员

	// 公共功能变量

	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private PaginationSupport pageList1 = new PaginationSupport();
	private Integer pNum=1;

	private int totalCount=0;
	
	private Integer pageSize = 15; // 分页列表每页显示个数

	private Integer totalPage = 0; // 分页列表页面总数

	private XzfyService xzfyService = null; // 模板业务层方法
	
	private RecordService recordService = null; // 模板业务层方法

	
	private XzfyInfo2 xzfyInfo2;
	
	private String xzfyInfo2Id;
	
	public String getXzfyInfo2Id() {
		return xzfyInfo2Id;
	}

	public void setXzfyInfo2Id(String xzfyInfo2Id) {
		this.xzfyInfo2Id = xzfyInfo2Id;
	}

	public XzfyInfo2 getXzfyInfo2() {
		return xzfyInfo2;
	}

	public void setXzfyInfo2(XzfyInfo2 xzfyInfo2) {
		this.xzfyInfo2 = xzfyInfo2;
	}

	public RecordService getRecordService() {
		return recordService;
	}

	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	private String status;

	private XzfyRecieve xzfyReceive;

	private File upFile1;

	private String upFile1FileName;
	
	private File buweiUpFile0;
	
	private String buweiUpFile0FileName;

	private File buweiUpFile1;
	
	private String buweiUpFile1FileName;

	private File buweiUpFile2;
	
	private String buweiUpFile2FileName;
	
	private File[] upFile2;

	private String[] upFile2FileName;
	
	private String jiedaimudi="";

	private String shoudaoshijian="";

	private String shoudaofangshi="";
	
	private String xwNum;
	private String xwName;
	private String dname;
	private String guofabanFN;
	
	
	private BananService bananService = null; // 模板业务层方法
	private BsqrService bsqrService = null;//被申请人

	private List orgList;
	private List suborgList;
	private List<XzfyInfo> weibanjieList; // 案件未办结
	private List dailianshenchaList; // 案件待立案审查
	private List daibanliList; // 案件待办理
	private List daishenpiList; // 案件待审批
	private List dailianshenpiList; // 案件待立案审批
	private List shenliqixian_20_List; // 审理期限不满20天的
	private List shenliqixian_10_List; // 审理期限不满10天的
	private List shenliqixian_chaoqi_List; // 案件已超期
	private List zhongzhiList; // 案件处于中止状态
	private List weibanjie_sub_List; // 子部门案件未办结
	private List shenliqixian_sub40_List; // 子部门案件审理时间已满40天
	private List shenliqixian_sub50_List; // 子部门案件审理时间已满50天
	private List shenliqixian_subchaoqi_List; // 子部门案件已超期
	private List newdaifenpeiList; // 新收案件待分配
	private List weizhidingList; // 已受理案件未指定承办人
	private int listkeyword; // 辨识显示哪个List
	private List caseList;
	private List caseAllList;
	private List<ArticleInfo> articleInfoList1; // 图片信息
	private List<ArticleInfo> articleInfoList2; // 领导讲话
	private List<ArticleInfo> articleInfoList3; // 动态新闻
	private List<ArticleInfo> articleInfoList4; // 法律法规
	private List<ArticleInfo> articleInfoList5; // 法制舆情摘报
	private List<ArticleInfo> articleInfoList6; // 典型案例
	private List<ArticleInfo> articleInfoList7; // 工作建议
	private List<ArticleInfo> articleInfoList8; // 法制动态摘编
	private List<ArticleInfo> articleInfoList9; // 行政裁判文书
	private int bsqrListSize;
	private String locbm = "";
	private Number userid;
	private Number orgid;
	private String bumen = "";
	private String subbumen = "";
	private String daoqi = "";
	private String xingcheng = "";
	private String time = "";
	private String timem = "";
	private String years = "";
	private String days="";
	private List<String> vacationsDaysList;
	private Vacation vacation;
	
	private XzfyInfo_w xzfyInfo_w;
	private String xzfyId_w;
	
	
	public String getXzfyId_w() {
		return xzfyId_w;
	}

	public void setXzfyId_w(String xzfyId_w) {
		this.xzfyId_w = xzfyId_w;
	}

	public XzfyInfo_w getXzfyInfo_w() {
		return xzfyInfo_w;
	}

	public void setXzfyInfo_w(XzfyInfo_w xzfyInfo_w) {
		this.xzfyInfo_w = xzfyInfo_w;
	}

	public Vacation getVacation() {
		return vacation;
	}

	public void setVacation(Vacation vacation) {
		this.vacation = vacation;
	}

	private VacationService vacationService=null;
	
	public VacationService getVacationService() {
		return vacationService;
	}

	public void setVacationService(VacationService vacationService) {
		this.vacationService = vacationService;
	}

	private String months = "";
	private String xzfyNewId = "";
	/************************当日汇总************************/
	private String faceRecep;//当面接收
	private String letterRecep;//来信接收
	
	private String totalCurrent;//当日共协助审理
	private String scan;//阅卷
	private String delivery;//送达
	private String transfer;//转接材料
	private String chat;//谈话调查
	
	/************************** 11111 ***************************/

	private String totalOfJdRenShu;// 接待人数

	private String totalOfJdPiCi;// 接待批次
	/************************** 22222 ***************************/

	private String receivedTotalOfCases;// 共接收

	private String receivedTotalOfRegistered;// 已立案

	private String receivedTotalOfPreDealt;// 待处理
	
	/*************新增*************/
	private String unReceived;//未受理
	private String notified;//告知
	private String refused;//不予受理
	private String others;//其它处理
	
	/************************** 33333 ***************************/
	private String acceptedFuYiCases;// 已受理

	private String reject;// 驳回

	private String preserve;// 维持

	private String illegal;// 确认违法

	private String revocation;// 撤销

	private String mofify;// 变更

	private String executionInOrder;// 责令履行

	private String reconciliation;// 调解

	private String termination;// 终止

	private String otherDeals;// 其它处理
	/****************************************************/

	private XzfyStatisticsService xzfyStatisticsService;

	/****************************************************/
	private String xmlString1;// 按区县
	private String xmlString2;// 按委办局
	private String countType = "1";
	private String countTitle = "";
	private String orgBm = "";
	private String n1 = "";
	private String n2 = "";
	private String upBm = "";
	private String upName = "";
	private String localBm = "";
	private String localName = "";
	private String sljg="";
	private List<Xw> xwList;
	private List<Beishenqingren> zlList = new ArrayList<Beishenqingren>();
	private List<Beishenqingren> bList = new ArrayList<Beishenqingren>();
	private List keywordList;
	private int type;
	private String fileName0="";
	private String storedName0="";
	private String storedLocation0="";
	private String fileName1="";
	private String storedName1="";
	private String storedLocation1="";
	private String fileName2="";
	private String storedName2="";
	private String storedLocation2="";
	private ArrayList<ArrayList<ArrayList<String>>> informList;//首页弹出通知列表
	private ArrayList<ArrayList<String>> informList1;
	private ArrayList<ArrayList<String>> informList2;
	
	public String getOrgBm() {
		return orgBm;
	}

	public void setOrgBm(String orgBm) {
		this.orgBm = orgBm;
	}
	

	public List<ArticleInfo> getArticleInfoList9() {
		return articleInfoList9;
	}

	public void setArticleInfoList9(List<ArticleInfo> articleInfoList9) {
		this.articleInfoList9 = articleInfoList9;
	}

	public String downloadFile() throws Exception {
		
		String rootPath = ApplicationPath.getRootPath().replaceAll("\\\\",
				"\\\\\\\\");
		String sname="";
		String sl="";
		String f="";
		if (type==0){
			sname=storedName0;
			sl=storedLocation0;
			contentDisposition = "filename="
					+ new String(sname.getBytes(), "ISO-8859-1");
			f = rootPath + sl
					+ File.separator + File.separator + sname;
		} else if (type==1){
			sname=storedName1;
			sl=storedLocation1;
			contentDisposition = "filename="
					+ new String(sname.getBytes(), "ISO-8859-1");
			f = rootPath + sl
					+ File.separator + File.separator + sname;
		} else if (type==2){
			sname=storedName2;
			sl=storedLocation2;
			contentDisposition = "filename="
					+ new String(sname.getBytes(), "ISO-8859-1");
			f = rootPath + sl
					+ File.separator + File.separator + sname;
		} else if (type==3){
			contentDisposition = "filename="
					+ new String(guofabanFN.getBytes(), "ISO-8859-1");
			f = rootPath + "guofaban"+File.separator+"download"+File.separator+guofabanFN;
		}
		setDocStream(new FileInputStream(f));
		return SUCCESS;
	}
	
	public void anNumConfirm()  throws IOException{

		xwNum= new String(xwNum.getBytes("iso-8859-1"), "UTF-8");
		xwName= new String(xwName.getBytes("iso-8859-1"), "UTF-8");
		dname= new String(dname.getBytes("iso-8859-1"), "UTF-8");

		String sql1 = "select count(id) from xzfy_info t where defendant_name like '%" + dname +
				"%' and xwname like '%" + xwName + "%'";
		
		String sql2 = "select count(id) from xzfy_info t where xwnum like '%" + xwNum +
				"%' and xwname like '%" + xwName + "%'";
		
		List r1 = this.bananService.findBySQL(sql1);
		List r2 = this.bananService.findBySQL(sql2);
		
		String r = r1.get(0)+","+r2.get(0);
		
		HttpServletResponse response = ServletActionContext.getResponse();
	    response.setContentType("text/xml;charset=utf-8");
	    PrintWriter writer = response.getWriter();
	    writer.write(r);
	}

	
	public String openXw() throws UnsupportedEncodingException {
		xwNum= new String(xwNum.getBytes("iso-8859-1"), "UTF-8");
		xwName= new String(xwName.getBytes("iso-8859-1"), "UTF-8");
		dname= new String(dname.getBytes("iso-8859-1"), "UTF-8");

		return SUCCESS;
	}
	
	public String showXw2() throws UnsupportedEncodingException {
		xwNum= new String(xwNum.getBytes("iso-8859-1"), "UTF-8");
		xwName= new String(xwName.getBytes("iso-8859-1"), "UTF-8");
		xzfyInfo = new XzfyInfo();

		pageList1 = bananService.getSamexwListByPage(pNum, pageSize, xwNum, xwName,xzfyId);
		caseList = pageList1.getItems();
		totalCount = pageList1.getTotalCount();
		totalPage = pageList1.getTotalPage();
		return SUCCESS;
	}

	public String showXw1() throws UnsupportedEncodingException{
		xwName= new String(xwName.getBytes("iso-8859-1"), "UTF-8");
		dname= new String(dname.getBytes("iso-8859-1"), "UTF-8");
		xzfyInfo = new XzfyInfo();
		
		pageList1 = bananService.getSameKindxwListByPage(pNum, pageSize, dname, xwName,xzfyId);
		caseList = pageList1.getItems();
		totalCount = pageList1.getTotalCount();
		totalPage = pageList1.getTotalPage();
		return SUCCESS;
	}
	
	
	public String gotoIndex() throws SQLException {
		// 个人工作区
		user = new User();
		user = (User) ActionContext.getContext().getSession()
				.get("_USER_LOGIN_");
		admit_name = user.getName();
		Org org=recordService.getOrg();
		orgBm=org.getLocbm();
		String sql = "select org_name from u_org where org_locBm="
				+ org.getLocbm() + " order by org_id asc";
		orgList = bananService.findBySQL(sql);
		bumen = orgList.get(0).toString();
		locbm = org.getLocbm();
		subbumen = org.getName();
		userid = user.getId();
		orgid = org.getId();
		informList = bananService.getInformList(userid.toString(), locbm);//首页弹出提示阅卷送达转交材料
		informList1 = informList.get(0);
		if(informList1.size()==0)  informList1=null;
		informList2 = informList.get(1);
		if(informList2.size()==0)  informList2=null;
		
//		bsqrListSize = bsqrService.getXzfyList(locbm, "", "", "", "", "").size();
//		weibanjieList = bananService.getWeibanjieList(locbm);
//		shenliqixian_20_List = bananService.getShenliqixian_20_List(locbm);
//		shenliqixian_10_List = bananService.getShenliqixian_10_List(locbm);
//		shenliqixian_chaoqi_List = bananService
//				.getShenliqixian_chaoqi_List(locbm);
//		zhongzhiList = bananService.getZhongzhiList(locbm);
//		newdaifenpeiList = bananService.getNewdaifenpeiList(locbm);
//		weizhidingList = bananService.getWeizhidingList(locbm);
//		dailianshenchaList = bananService.getDailianshenchaList(userid);
//		daibanliList = bananService.getDaibanliList(userid);
//		daishenpiList = bananService.getDaishenpiList(userid);
//		dailianshenpiList = bananService.getDailianshenpiList(userid);
//		weibanjie_sub_List = bananService.getWeibanjie_sub_List(orgid);
//		shenliqixian_sub40_List = bananService
//				.getShenliqixian_sub40_List(orgid);
//		shenliqixian_sub50_List = bananService
//				.getShenliqixian_sub50_List(orgid);
//		shenliqixian_subchaoqi_List = bananService
//				.getShenliqixian_subchaoqi_List(orgid);

// 取得图片

		articleInfoList1 = xzfyService.getArticleInfoList(1);
		articleInfoList3 = xzfyService.getArticleInfoList(3);
		articleInfoList2 = xzfyService.getArticleInfoList(2);
		
		articleInfoList9 = xzfyService.getArticleInfoList(9);
		
		articleInfoList4 = xzfyService.getArticleInfoList(4);
		articleInfoList5 = xzfyService.getArticleInfoList(5);
		articleInfoList6 = xzfyService.getArticleInfoList(6);

		try {
			/************************当日汇总************************/
			faceRecep=xzfyStatisticsService.getFaceRecep();
			letterRecep=xzfyStatisticsService.getLetterRecep();
			
			totalCurrent=xzfyStatisticsService.getTotalCurrent();
			scan=xzfyStatisticsService.getScan();
			delivery=xzfyStatisticsService.getDelivery();
			transfer=xzfyStatisticsService.getTransfer();
			chat=xzfyStatisticsService.getChat();
			/************************** 111111111 **************************/
			totalOfJdRenShu = xzfyStatisticsService.getJieDaiRenShu();
			totalOfJdPiCi = xzfyStatisticsService.getJieDaiPiCi();
			System.out.println("接待批次" + totalOfJdPiCi);
			/************************** 222222222 **************************/
			receivedTotalOfCases = xzfyStatisticsService.getTotalCases();
			receivedTotalOfRegistered = xzfyStatisticsService
					.getTotalRegistered();
			receivedTotalOfPreDealt = xzfyStatisticsService.getTotalPrepared();
			
			unReceived=xzfyStatisticsService.getUnReceived();
			notified=xzfyStatisticsService.getNotified();
			refused=xzfyStatisticsService.getRefused();
			others=xzfyStatisticsService.getOthers();
			/************************** 333333333 **************************/
			acceptedFuYiCases = xzfyStatisticsService.getTotalAccepted();
			reject = xzfyStatisticsService.getTotalRefused();
			preserve = xzfyStatisticsService.getTotalPreserved();
			illegal = xzfyStatisticsService.getTotalIllegal();
			revocation = xzfyStatisticsService.getTotalRevo();
			mofify = xzfyStatisticsService.getTotalModified();
			executionInOrder = xzfyStatisticsService.getTotalExecuted();
			reconciliation = xzfyStatisticsService.getTotalRecon();
			termination = xzfyStatisticsService.getTotalTerminated();
			otherDeals = xzfyStatisticsService.getTotalOthers();

			// countTitle="北京市行政复议统计";
			/******* 统计图*******根据countType取值 选择相应的获取xmlString方法********统计图 ********/
			// if(countType.equals("1"))
			xmlString1 = xzfyStatisticsService.getXmlString("1");// 按区县
//			System.out.println("xmlString1" + xmlString1);
			// else if(countType.equals("2"))
			xmlString2 = xzfyStatisticsService.getAnotherXmlString("1");// 按委办局
//			System.out.println("xmlString2" + xmlString2);
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}

	/***************************** 单独显示详细统计页面 ********************************/
	String year="";
	// 按区县
	public String showDetailChart1() {
		try {
			year=new SimpleDateFormat("yyyy").format(new Date());
//			xmlString1 = xzfyStatisticsService.getXmlString();// 按区县
//			xmlString1 = "<chart caption='本年度全市各区县人民政府受理情况统计' xAxisName='' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' baseFontSize='14' outCnvBaseFontSize='14'><set label='东城区' value='30' link='../pages/showCount.ftl'/><set label='西城区' value='26' /><set label='朝阳区' value='20' /><set label='海淀区' value='20' /><set label='丰台区' value='18' /><set label='石景山区' value='16' /><set label='门头沟区' value='13' /><set label='房山区' value='8' /><set label='通州区' value='7' /><set label='顺义区' value='5' /><set label='大兴区' value='5' /><set label='昌平区' value='5' /><set label='平谷区' value='4' /><set label='怀柔区' value='3' /><set label='密云县' value='3' /><set label='延庆县' value='2' /><art>";	
			xmlString1=xzfyStatisticsService.getXmlString("2");
//			System.out.println(xmlString1);
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}

	// 按委办局
	public String showDetailChart2() {
		try {
			year=new SimpleDateFormat("yyyy").format(new Date());
//			xmlString2 = xzfyStatisticsService.getAnotherXmlString();// 按委办局
//			xmlString2 = "<chart caption='本年度市政府各委办局收案情况统计' xAxisName='' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' baseFontSize='10' outCnvBaseFontSize='10' ><set label='市发展和改革委员会' value='51' link='../pages/showCount2.ftl'/><set label='市教育委员会' value='44' /><set label='市科学技术委员会' value='32' /><set label='市民族事务委员会' value='30' /><set label='市公安局' value='28' /><set label='市监察局' value='25' /><set label='市民政局' value='23' /><set label='市司法局' value='21' /><set label='市财政局' value='21' /><set label='市人力资源和社会保障局' value='17' /><art>";
			xmlString2=xzfyStatisticsService.getAnotherXmlString("2");
//			System.out.println(xmlString2);
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
    
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	/***************************** 单独显示详细统计页面 ********************************/
	public String chooseXiuXiRi() {
		String month=months;
		String month1=Integer.toString(Integer.valueOf(month)+1);
		if(Integer.valueOf(month1)<10)
			month1="0"+month1;
		String sql="select days from Vacation v where v.years='"+years+"'"+" and v.months='"+month1+"'";
		vacationsDaysList= this.recordService.findListBySQL(sql);
		for (int i = 0; i < vacationsDaysList.size(); i++) {
//			System.out.println(Integer.valueOf(vacationsDaysList.get(i).toString()));
			int day=Integer.valueOf(vacationsDaysList.get(i).toString());
			vacationsDaysList.set(i, Integer.valueOf(vacationsDaysList.get(i)).toString());
//			System.out.println("+++"+vacationsDaysList.get(i));
		}
		return SUCCESS;
	}
	public void saveXiuXiRi(){
		String month1=Integer.toString(Integer.valueOf(months)+1);
		if(Integer.valueOf(month1)<10)
			month1="0"+month1;
		
		String[] dayss=days.split(",");
		this.vacationService.deleteOneMonth(years, month1);
		for (int i = 0; i < dayss.length; i++) {
			if(!dayss[i].equals("")&&dayss[i]!=null){
			String month=Integer.toString(Integer.valueOf(months)+1);
		    //System.out.println("month="+month);
			if(Integer.valueOf(dayss[i])<10)
				dayss[i]="0"+dayss[i];
			if(Integer.valueOf(month)<10)
				month="0"+month;
			Vacation vacation=new Vacation();
			vacation.setDays(dayss[i]);
			vacation.setMonths(month);
			vacation.setYears(years);
			this.vacationService.saveJiejiari(vacation);
			}
		}
	}

	public String getCalendar() {
		// 案件到期日期
		int userid = UserUtil.getUserId();
		xzfyList = xzfyService.getXzfyInfoListByUserid(String.valueOf(userid));
		String year = "";
		String month = "";
		int monthNum = 0;
		if (years.equals("") && months.equals("")) {
			Calendar cal = Calendar.getInstance();
			year = String.valueOf(cal.get(Calendar.YEAR));
			month = String.valueOf(cal.get(Calendar.MONTH) + 1);
			monthNum = Integer.parseInt(month);
		} else {
			year = years;
			monthNum = Integer.valueOf(months) + 1;
			
		}
		// 案件是否到期
		for (XzfyInfo x : xzfyList) {
			String d = x.getReceive_date();
			if (d == null) {
				continue;
			}
			SimpleDateFormat formatter = new SimpleDateFormat("MMdd");
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			try {
				date = format1.parse(d);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			GregorianCalendar gc = new GregorianCalendar();
			gc.setTime(date);
			if ("1".equals(x.getIsdelay())) {
				gc.add(5, 90);
				
			} else {
				if (Integer.parseInt(x.getStatus()) < 4) {
					gc.add(5, 5);
				} else if(x.getStatus().equals("11") && !x.getStadardResult().equals("1")){
					gc.add(5, 5);
				}else {
					gc.add(5, 60);
				}
			}
			if (x.getBzBuqiriqi() != null && !x.getBzBuqiriqi().equals("")) {
				String buQi = x.getBzBuqiriqi();
				String tongZhi = x.getBzTongzhiriqi();
				long day=0;
				try {
					Date buQiD = format1.parse(buQi);
					Date tongZhiD = format1.parse(tongZhi);
					day = (buQiD.getTime()-tongZhiD.getTime())/(24*60*60*1000);
				} catch (ParseException e) {
					System.out.println("补正日期异常！");
					e.printStackTrace();
				}
				
				gc.add(5, (int) day);
			}
			String rYear = format1.format(gc.getTime()).substring(0, 4);
			String rMonth = format1.format(gc.getTime()).substring(5, 7);
			int rMonthNum = Integer.parseInt(rMonth);
			String sqr="";
			if (x.getApp_type().equals("1")){
				sqr = x.getApp_show();
			} else {
				sqr = x.getApp_show();
			}
			String sqr_title=sqr;
			if(sqr.length()>20)
				sqr_title=sqr.substring(0,19)+"..";
			if (rYear.equals(year) && rMonthNum==monthNum) {
				if (daoqi.equals("")) {
					daoqi = formatter.format(gc.getTime())
							+ "@%<table width='99%' style='border-collapse:collapse;'><tr>" +
							"<td width='20%' style='border:1px solid #EEC900;'>"+x.getReceive_date()+"</td>" +
									" <td width='35%' title='"+sqr+"' style='border:1px solid #EEC900;'>"+sqr_title+"</td> " +
									"<td width='35%' style='border:1px solid #EEC900;'>"+x.getDefendant_name()+"</td> " +
									"<td width='10%' style='border:1px solid #EEC900;'><a target='_blank' href='../xzfy/viewCase.action?funcCode=" + 
					this.getFuncCode() +
					"&xzfyId=" +
					x.getId() +
					"'>查看</a></td></tr></table>";
				} else {
					daoqi += ", " + formatter.format(gc.getTime())
							+ "@%<table width='99%' style='border-collapse:collapse;'><tr>" +
							"<td width='20%' style='border:1px solid #EEC900;'>"+x.getReceive_date()+"</td> " +
									"<td width='35%' title='"+sqr+"' style='border:1px solid #EEC900;'>"+sqr_title+"</td> " +
									"<td width='35%' style='border:1px solid #EEC900;'>"+x.getDefendant_name()+"</td> " +
									"<td width='10%' style='border:1px solid #EEC900;'><a target='_blank' href='../xzfy/viewCase.action?funcCode=" + 
							this.getFuncCode() +
							"&xzfyId=" +
							x.getId() +
							"'>查看</a></td></tr></table>";
				}

			}
		}

		// 行程是否到期
		List<ScheduleInfo> sList = new ArrayList<ScheduleInfo>();
		sList = xzfyService.getScheduleInfoByUserId(String.valueOf(userid));
		for (ScheduleInfo s : sList) {
			if (!"".equals(years) && !s.getScheduleDate().substring(0, 4).equals(years)) {
				continue;
			}
			String d = s.getScheduleDate().substring(5, 7)
					+ s.getScheduleDate().substring(8);
			String daoqis[] = daoqi.split(", ");
			int flag = 0;
			for (String dd : daoqis) {
				if (dd.startsWith(d)) {
					flag = 1;
					if (daoqi.equals("")) {
						daoqi = d + "：" 
								+ "：<a target='_blank' href='../schedule/showSchedule.action?id="
								+ s.getId() + "&funcCode=" + this.getFuncCode()
								+ "'>" + s.getTitle() + "</a><br>";
					} else {
						daoqi += ", "
								+ d
								+ "：<a target='_blank' href='../schedule/showSchedule.action?id="
								+ s.getId() + "&funcCode=" + this.getFuncCode()
								+ "'>" + s.getTitle() + "</a><br>";
						// daoqi += ", " + d
						// +"：<a href=\"javaScript:showXingcheng('"+s.getId()+"')\">"+s.getTitle()+"</a>";
					}
					break;
				}
			}
			if (flag == 0) {
				if (xingcheng.equals("")) {
					xingcheng = d + "：<a target='_blank' href='../schedule/showSchedule.action?id="
							+ s.getId() + "&funcCode=" + this.getFuncCode()
							+ "'>" + s.getTitle() + "</a>";
				} else {
					xingcheng += ", " + d + "：<a target='_blank' href='../schedule/showSchedule.action?id="
							+ s.getId() + "&funcCode=" + this.getFuncCode()
							+ "'>" + s.getTitle() + "</a>";
				}
			}
		}

		Date date = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy");
		time = fmt.format(date);

		SimpleDateFormat fmtm = new SimpleDateFormat("MM");
		timem = fmtm.format(date);
		return SUCCESS;
	}

	/**
	 * 显示模板列表
	 */
	public String showXzfyList() {
		try {
			this.pageList = this.xzfyService.getXzfyList(super.getPageNum(),
					this.pageSize);
			this.xzfyList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	private XzfyCompany xzfyCom;
	

	public XzfyCompany getXzfyCom() {
		return xzfyCom;
	}

	public void setXzfyCom(XzfyCompany xzfyCom) {
		this.xzfyCom = xzfyCom;
	}
	
	private int userId;

	public String tiqubuwei(){
		user = new User();
		user = (User) ActionContext.getContext().getSession()
				.get("_USER_LOGIN_");
		admit_name = user.getName();
		userId = user.getId();
		Org org=this.recordService.getRootOrg(recordService.getOrg().getLocbm());
		localBm = org.getLocbm();
		localName = org.getName();
		String HQL2="";
		HQL2 += " from XzfyKeyword xzfyKeyword ";
		HQL2 += " where xzfyKeyword.status = '0' and xzfyKeyword.locbm = '"+org.getLocbm()+"' ";
		setKeywordList(recordService.find(HQL2));
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		todate = df.format(dt);
		xzfyBuwei = this.xzfyService.getBuweiById(xzfyId);
		return SUCCESS;
	}
	
	/*public String gotoCreate_w() { //  XzfyCompany  Org  表
		try {
			
			this.xzfyInfo2 = this.recordService.getXzfyById2(this.xzfyId_w);
			  
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS")
					.format(new Date());
			Random random = new Random();
			xzfyId = currentTime + random.nextInt(1000);
			Date dt = new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String bumen=recordService.getOrg().getLocbm();
			Org org=this.recordService.getRootOrg(bumen);
			
			xzfyCom=this.recordService.getXzfyComById(bumen,org.getName());
			localBm = org.getLocbm();//0000
			localName = org.getName();//北京市人民政府
			if (localBm.substring(2).equals("00")){
				upBm="0000";
			} else {
				upBm=localBm.substring(0,2)+"00";
			}
			Org rootOrg=this.recordService.getRootOrg(upBm);
			upName=rootOrg.getName();
			todate = df.format(dt);
			user = new User();
			user = (User) ActionContext.getContext().getSession()
					.get("_USER_LOGIN_");
			admit_name = user.getName();
			setUserId(user.getId());
			
			//设置被申请人种类与被申请人名称
			//北京市法制办
			if(localBm.equals("0000")){////用到org表
				//被申请人种类
				for (int i=0;i<5;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区县政府");
						b.setValue("5");
					} else if(i==1){
						b.setName("省级政府部门");
						b.setValue("7");
					} else if(i==2){
						b.setName("省级政府");
						b.setValue("6");
					} else if(i==3){
						b.setName("国务院部门");
						b.setValue("11");
					}else if(i==4){
						b.setName("其他");
						b.setValue("8");
					}
					
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("5", localBm,bList);
				bList = xzfyService.getBsqrName("7", localBm,bList);
				bList = xzfyService.getBsqrName("6", localBm,bList);
			}
			
			//区县政府
			int lb = Integer.parseInt(localBm.substring(0, 2));
			if(localBm.length()==4 && "00".equals(localBm.substring(2, 4)) && lb<19 && lb!=0){
				//被申请人种类
				for (int i=0;i<5;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区县政府部门");
						b.setValue("4");
					} else if(i==1){
						b.setName("区县政府部门派出机构");
						b.setValue("9");
					} else if(i==2){
						b.setName("乡镇街道");
						b.setValue("3");
					} else if(i==3){
						b.setName("国务院部门");
						b.setValue("11");
					}
					else if(i==4){
						b.setName("其他");
						b.setValue("8");
					}
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("4", localBm,bList);
				bList = xzfyService.getBsqrName("3", localBm,bList);
				bList = xzfyService.getBsqrName("9", localBm,bList);
			}
			//区县政府部门
			if(localBm.length()==4 && !"00".equals(localBm.substring(2, 4))){
				//被申请人种类
				for (int i=0;i<3;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区县政府部门派出机构");
						b.setValue("9");
					} else if(i==1){
						b.setName("国务院部门");
						b.setValue("11");
					}else if(i==2){
						b.setName("其他");
						b.setValue("8");
					}
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("9", localBm,bList);
			}
			//省部级政府部门
			if(localBm.length()==4 && "00".equals(localBm.substring(2, 4)) && lb>18){
				//被申请人种类
				for (int i=0;i<3;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区县政府部门");
						b.setValue("4");
					} else if(i==1){
						b.setName("国务院部门");
						b.setValue("11");
					}else if(i==2){
						b.setName("其他");
						b.setValue("8");
					}
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("4", localBm,bList);
			}
			
			String HQL2="";
			HQL2 += " from XzfyKeyword xzfyKeyword ";
			HQL2 += " where xzfyKeyword.status = '0' and xzfyKeyword.locbm = '"+org.getLocbm()+"' ";
			setKeywordList(recordService.find(HQL2));
			
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	*/
	
	
	
	
	public String gotoCreate() {//  XzfyCompany  Org  表
		try {
			
			/*DatesentProxy da =new DatesentProxy();  
				Object[] bb=da.sendname("201605161609013396");
				
			List<dogs> ll=new  ArrayList();
				for(Object ob:bb ){
			String cc=(String)ob;
			// JSONObject json = JSONObject.fromObject(dog33);//将java对象转换为json对象
			//	 String str = json.toString();//将json对象转换为字符串
					
			//同样先将json字符串转换为json对象，再将json对象转换为java对象，如下所示。
			JSONObject obj = ((JSONObject) new JSONObject()).fromObject(cc);//将json字符串转换为json对象
			//将json对象转换为java对象
			XzfyInfo2 jb = (XzfyInfo2)JSONObject.toBean(obj,XzfyInfo2.class);//将建json对象转换为Person对象
			//System.out.println(jb.getAdmit1());		
			//ll.add(jb);
			System.out.println(jb.toString());
			xzfyService.save(jb);
			
			//this.save(jb);
			
				}*/
		//	String a=xzfyInfo2.getId();
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS")
					.format(new Date());
			Random random = new Random();
			xzfyId = currentTime + random.nextInt(1000);
			Date dt = new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String bumen=recordService.getOrg().getLocbm();  //获取用户，
			Org org=this.recordService.getRootOrg(bumen);
			
			xzfyCom=this.recordService.getXzfyComById(bumen,org.getName());
			localBm = org.getLocbm();//0000
			localName = org.getName();//北京市人民政府
			if (localBm.substring(2).equals("00")){
				upBm="0000";
			} else {
				upBm=localBm.substring(0,2)+"00";
			}
			Org rootOrg=this.recordService.getRootOrg(upBm);
			upName=rootOrg.getName();
			todate = df.format(dt);
			user = new User();
			user = (User) ActionContext.getContext().getSession()
					.get("_USER_LOGIN_");
			admit_name = user.getName();
			setUserId(user.getId());
			
			//设置被申请人种类与被申请人名称
			//北京市法制办
			if(localBm.equals("0000")){//***************//用到org表
				//被申请人种类
				for (int i=0;i<5;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区政府");
						b.setValue("5");
					} else if(i==1){
						b.setName("省级政府部门");
						b.setValue("7");
					} else if(i==2){
						b.setName("省级政府");
						b.setValue("6");
					} else if(i==3){
						b.setName("国务院部门");
						b.setValue("11");
					}else if(i==4){
						b.setName("其他");
						b.setValue("8");
					}
					
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("5", localBm,bList);
				bList = xzfyService.getBsqrName("7", localBm,bList);
				bList = xzfyService.getBsqrName("6", localBm,bList);
			}
			
			//区县政府
			int lb = Integer.parseInt(localBm.substring(0, 2));
			if(localBm.length()==4 && "00".equals(localBm.substring(2, 4)) && lb<19 && lb!=0){
				//被申请人种类
				for (int i=0;i<5;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区政府部门");
						b.setValue("4");
					} else if(i==1){
						b.setName("区政府部门派出机构");
						b.setValue("9");
					} else if(i==2){
						b.setName("乡镇街道");
						b.setValue("3");
					} else if(i==3){
						b.setName("国务院部门");
						b.setValue("11");
					}
					else if(i==4){
						b.setName("其他");
						b.setValue("8");
					}
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("4", localBm,bList);
				bList = xzfyService.getBsqrName("3", localBm,bList);
				bList = xzfyService.getBsqrName("9", localBm,bList);
			}
			//区县政府部门
			if(localBm.length()==4 && !"00".equals(localBm.substring(2, 4))){
				//被申请人种类
				for (int i=0;i<3;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区政府部门派出机构");
						b.setValue("9");
					} else if(i==1){
						b.setName("国务院部门");
						b.setValue("11");
					}else if(i==2){
						b.setName("其他");
						b.setValue("8");
					}
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("9", localBm,bList);
			}
			//省部级政府部门
			if(localBm.length()==4 && "00".equals(localBm.substring(2, 4)) && lb>18){
				//被申请人种类
				for (int i=0;i<3;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区政府部门");
						b.setValue("4");
					} else if(i==1){
						b.setName("国务院部门");
						b.setValue("11");
					}else if(i==2){
						b.setName("其他");
						b.setValue("8");
					}
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("4", localBm,bList);
			}
			
			String HQL2="";
			HQL2 += " from XzfyKeyword xzfyKeyword ";
			HQL2 += " where xzfyKeyword.status = '0' and xzfyKeyword.locbm = '"+org.getLocbm()+"' ";
			setKeywordList(recordService.find(HQL2));
			
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	String lx_nian;
	String lx_yue;
	String lx_ri;
	public String gotoCreate_zl() {//  XzfyCompany  Org  表
		try {
			
			/*DatesentProxy da =new DatesentProxy();  
				Object[] bb=da.sendname("201605161609013396");
				
			List<dogs> ll=new  ArrayList();
				for(Object ob:bb ){
			String cc=(String)ob;
			// JSONObject json = JSONObject.fromObject(dog33);//将java对象转换为json对象
			//	 String str = json.toString();//将json对象转换为字符串
					
			//同样先将json字符串转换为json对象，再将json对象转换为java对象，如下所示。
			JSONObject obj = ((JSONObject) new JSONObject()).fromObject(cc);//将json字符串转换为json对象
			//将json对象转换为java对象
			XzfyInfo2 jb = (XzfyInfo2)JSONObject.toBean(obj,XzfyInfo2.class);//将建json对象转换为Person对象
			//System.out.println(jb.getAdmit1());		
			//ll.add(jb);
			System.out.println(jb.toString());
			xzfyService.save(jb);
			
			//this.save(jb);
			
				}*/
		this.xzfyInfo2 = this.recordService.getXzfyById_w(this.xzfyInfo2Id);
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS")
					.format(new Date());
			Random random = new Random();
			xzfyId = currentTime + random.nextInt(1000);
			Date dt = new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String bumen=recordService.getOrg().getLocbm();
			Org org=this.recordService.getRootOrg(bumen);
			
			xzfyCom=this.recordService.getXzfyComById(bumen,org.getName());
			localBm = org.getLocbm();//0000
			localName = org.getName();//北京市人民政府
			if (localBm.substring(2).equals("00")){
				upBm="0000";
			} else {
				upBm=localBm.substring(0,2)+"00";
			}
			Org rootOrg=this.recordService.getRootOrg(upBm);
			upName=rootOrg.getName();
			todate = df.format(dt);
			user = new User();
			user = (User) ActionContext.getContext().getSession()
					.get("_USER_LOGIN_");
			admit_name = user.getName();
			setUserId(user.getId());
			
			//设置被申请人种类与被申请人名称
			//北京市法制办
			if(localBm.equals("0000")){//***************//用到org表
				//被申请人种类
				for (int i=0;i<5;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区政府");
						b.setValue("5");
					} else if(i==1){
						b.setName("省级政府部门");
						b.setValue("7");
					} else if(i==2){
						b.setName("省级政府");
						b.setValue("6");
					} else if(i==3){
						b.setName("国务院部门");
						b.setValue("11");
					}else if(i==4){
						b.setName("其他");
						b.setValue("8");
					}
					
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("5", localBm,bList);
				bList = xzfyService.getBsqrName("7", localBm,bList);
				bList = xzfyService.getBsqrName("6", localBm,bList);
			}
			
			//区县政府
			int lb = Integer.parseInt(localBm.substring(0, 2));
			if(localBm.length()==4 && "00".equals(localBm.substring(2, 4)) && lb<19 && lb!=0){
				//被申请人种类
				for (int i=0;i<5;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区政府部门");
						b.setValue("4");
					} else if(i==1){
						b.setName("区政府部门派出机构");
						b.setValue("9");
					} else if(i==2){
						b.setName("乡镇街道");
						b.setValue("3");
					} else if(i==3){
						b.setName("国务院部门");
						b.setValue("11");
					}
					else if(i==4){
						b.setName("其他");
						b.setValue("8");
					}
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("4", localBm,bList);
				bList = xzfyService.getBsqrName("3", localBm,bList);
				bList = xzfyService.getBsqrName("9", localBm,bList);
			}
			//区县政府部门
			if(localBm.length()==4 && !"00".equals(localBm.substring(2, 4))){
				//被申请人种类
				for (int i=0;i<3;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区政府部门派出机构");
						b.setValue("9");
					} else if(i==1){
						b.setName("国务院部门");
						b.setValue("11");
					}else if(i==2){
						b.setName("其他");
						b.setValue("8");
					}
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("9", localBm,bList);
			}
			//省部级政府部门
			if(localBm.length()==4 && "00".equals(localBm.substring(2, 4)) && lb>18){
				//被申请人种类
				for (int i=0;i<3;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区政府部门");
						b.setValue("4");
					} else if(i==1){
						b.setName("国务院部门");
						b.setValue("11");
					}else if(i==2){
						b.setName("其他");
						b.setValue("8");
					}
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("4", localBm,bList);
			}
			
			String HQL2="";
			HQL2 += " from XzfyKeyword xzfyKeyword ";
			HQL2 += " where xzfyKeyword.status = '0' and xzfyKeyword.locbm = '"+org.getLocbm()+"' ";
			setKeywordList(recordService.find(HQL2));
			
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	
	public String showshenpiList() {
		try {
			user = new User();
			user = (User) ActionContext.getContext().getSession()
					.get("_USER_LOGIN_");
			admit_name = user.getName();
			this.pageList = this.xzfyService.getShenpiListById(super
					.getPageNum(), this.pageSize, xzfyId, user.getId()
					.toString());
			this.shenpiList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			return "success";

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	private void saveDeputy(String deputy) {
		String dpName[] = deputy.split("，");
		for (String name : dpName) {
			String sql = "update xzfy_app set ISDEPUTY = '1' where APP_NAME = '"
					+ name + "'";
			this.xzfyService.updateAllBySQL(sql);
		}
	}

	private XzfyInfo setInfo(XzfyInfo x) {
		
		this.xzfyService.deleteAppById(x.getId());
		String appShow = "";

		// 拆分appDetail
		if (x.getApp_type().equals("1")) {
			String apps[] = x.getAppdetail().split("；");
			for (String app : apps) {
				String info[] = app.split("，");
				XzfyApp xzfyApp = new XzfyApp();
				x = xzfyService.getXzfyById(x.getId());
				for (int i = 0; i < info.length; i++) {
					if (i == 0) {
						if (info[i].equals("") || info[i] == null) {
							break;
						}
						xzfyApp.setApp_name(info[i]);
						if (appShow.equals("")) {
							appShow = info[i];
						} else {
							appShow += "," + info[i];
						}
					} else if (i == 1) {
						xzfyApp.setSexy(info[i]);
					} else {
						xzfyApp = this.splitInfo(info[i], xzfyApp);
					}
				}
				xzfyApp.setProxytype(x.getApp_type());
				xzfyApp.setXzfyInfo(x);
				List<String> caseIndexList = this.coreService
						.find("select max(caseindex) as caseindex from XzfyInfo");
				xzfyService.saveOrUpdate(xzfyApp);
			}
		}
		// 拆分agentDetail
		if (x.getApp_type().equals("2")) {
			String agents[] = x.getAgentDetail().split("；");
			for (String agent : agents) {
				String info[] = agent.split("，");
				XzfyApp xzfyApp = new XzfyApp();
				x = xzfyService.getXzfyById(x.getId());
				for (int i = 0; i < info.length; i++) {
					if (i == 0) {
						if (info[i].equals("") || info[i] == null
								|| info[i].equals(", ")) {
							break;
						}
						if (info[i].indexOf("（") != -1) {
							String a[] = info[i].split("（");
							xzfyApp.setApp_name(a[0]);
							xzfyApp.setOtherType(a[1].replaceAll("）", ""));
							if (appShow.equals("")) {
								appShow = a[0];
							} else {
								appShow += "," + a[0];
							}
						} else {
							xzfyApp.setApp_name(info[i]);
							if (appShow.equals("")) {
								appShow = info[i];
							} else {
								appShow += "," + info[i];
							}
						}
					} else {
						xzfyApp = this.splitInfo(info[i], xzfyApp);
					}
				}
				xzfyApp.setProxytype(x.getApp_type());
				xzfyApp.setXzfyInfo(x);
				xzfyService.saveOrUpdate(xzfyApp);
			}
		}
		// 设置列表显示申请人人名
		x.setApp_show(appShow);
		return x;
	}

	public XzfyBuwei saveFile(XzfyBuwei xzfyBuwei) {
		String fnn = "";
		if (buweiUpFile0 != null) {
			try {
				fnn = FileUtil.fileSave(buweiUpFile0, buweiUpFile0FileName);
				xzfyBuwei.setFileName0(buweiUpFile0FileName);
				xzfyBuwei.setStoredName0(fnn);
				xzfyBuwei.setStoredLocation0(File.separator + File.separator
						+ "download" + File.separator + File.separator + "File"
						+ File.separator + File.separator);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("上传文件upFile0出错");
			}
		}

		if (buweiUpFile1 != null) {
			try {
				fnn = FileUtil.fileSave(buweiUpFile1, buweiUpFile1FileName);
				xzfyBuwei.setFileName1(buweiUpFile1FileName);
				xzfyBuwei.setStoredName1(fnn);
				xzfyBuwei.setStoredLocation1(File.separator + File.separator
						+ "download" + File.separator + File.separator + "File"
						+ File.separator + File.separator);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("上传文件upFile1出错");
			}
		}
		

		if (buweiUpFile2 != null) {
			try {
				fnn = FileUtil.fileSave(buweiUpFile2, buweiUpFile2FileName);
				xzfyBuwei.setFileName2(buweiUpFile2FileName);
				xzfyBuwei.setStoredName2(fnn);
				xzfyBuwei.setStoredLocation2(File.separator + File.separator
						+ "download" + File.separator + File.separator + "File"
						+ File.separator + File.separator);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("上传文件upFile2出错");
			}
		}
		return xzfyBuwei;
	}
	
	
	public void saveFile(XzfyInfo xzfyInfo) {
		String fnn = "";
		if (upFile1 != null) {
			try {
				fnn = FileUtil.fileSave(upFile1, upFile1FileName);
				XzfyInfoFile xif = new XzfyInfoFile();
				xif.setXzfyInfo(xzfyInfo);
				xif.setFileName(upFile1FileName);
				xif.setStoredName(fnn);
				xif.setStoredLocation(File.separator + File.separator
						+ "download" + File.separator + File.separator + "File"
						+ File.separator + File.separator);
				xif.setType("1");
				xzfyService.saveOrUpdate(xif);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("上传文件出错");
			}
		}

		if (upFile2 != null && upFile2.length != 0) {
			for (int i = 0; i < upFile2.length; i++) {
				try {
					fnn = FileUtil.fileSave(upFile2[i], upFile2FileName[i]);
					XzfyInfoFile xif = new XzfyInfoFile();
					xif.setXzfyInfo(xzfyInfo);
					xif.setFileName(upFile1FileName);
					xif.setStoredName(fnn);
					xif.setStoredLocation(File.separator + File.separator
							+ "download" + File.separator + File.separator
							+ "File" + File.separator + File.separator);
					xif.setType("2");
					xzfyService.saveOrUpdate(xif);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("上传文件出错");
				}
			}
		}
	}
	
	public String saveFace1() {
		// 取得localbm
		String locbm =this.recordService.getOrg().getLocbm();
		
		if ("2".equals(xzfyInfo.getIsmanage())) {
			xzfyInfo.setXwname("行政不作为");
			if(xzfyInfo.getMatter_detail()!=null && !xzfyInfo.getMatter_detail().equals("") )
				xzfyInfo.setXwname("行政不作为("+xzfyInfo.getMatter_detail()+")");
			xzfyInfo.setXwnum("");
		} else {
			xzfyInfo.setMatter_type("0");
			xzfyInfo.setMatter_detail("");
			xzfyInfo.setDuty("");
			xzfyInfo.setExecute_date("");
			xzfyInfo.setIs_prof("0");
			xzfyInfo.setIs_prof_detail("");
		}
		
		
		// 记录收案时间、24小时内删除用
		//xzfyInfo.setReceive_real_date(new SimpleDateFormat("yyyy:MM:dd HH:mm:ss").format(new Date()));

		Org org=this.recordService.getRootOrg(locbm);
		//System.out.println(org.getName());
		xzfyInfo.setBreak_right(org.getName());
		xzfyInfo.setReceive_real_date(xzfyInfo.getReceive_date());
		String receiveDate=xzfyInfo.getReceive_date();
		if(receiveDate!=null){
			if(receiveDate.length()>10)
				xzfyInfo.setReceive_date(receiveDate.substring(0,10));
		}
		BeanCopier bc = BeanCopier.create(XzfyInfo.class, XzfyRecieve.class,
				false);
		XzfyRecieve xr = new XzfyRecieve();
		
		bc.copy(xzfyInfo, xr, null);
		
		if ("1".equals(xzfyInfo.getIstiaojie())){
			if(xzfyInfo.getTiaojie_to() != null && !"".equals(xzfyInfo.getTiaojie_to())) {
				xzfyInfo.setReceive_date(xzfyInfo.getTiaojie_to());
			}
		}
		xr.setApp_type1("2");
		xr.setStatus("1");
		xr.setKeyword(jiedaimudi);
		xr.setMenu(shoudaoshijian);
		xr.setKeyword3(shoudaofangshi);
		xr.setJaAdvice(xzfyId);
		xr.setCaseorg(locbm);
		xr.setFinish_date("1");  //首页弹窗用
		xzfyService.saveOrUpdate(xr);
		XzfyInfo newXzfyInfo=this.recordService.getXzfyById(xzfyId);
		newXzfyInfo.setBzTongzhiriqi(newXzfyInfo.getReceive_date());
		newXzfyInfo.setBzBuqiriqi(xzfyInfo.getReceive_date());
		newXzfyInfo.setIsBuzheng("1");
		recordService.update(newXzfyInfo);
		return SUCCESS;
	}

	
	String realtime="";
	String getRealtime(){
		realtime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		return realtime;
	}
	
	public String saveFace() throws RemoteException {
		// 取得localbm
		String locbm =sljg;
		// 取得最大流水号
		List<String> caseIndexList = this.coreService
				.find("select max(caseindex) as caseindex from XzfyInfo");
		// 设置流水号
		String caseIndex = null;
		for (int i = 0; i < caseIndexList.size(); i++) {
			caseIndex = caseIndexList.get(i);
		}

		if (caseIndex == null) {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			caseIndex = year + locbm + "0001";
			//System.out.println(caseIndex);
		} else {
			String y = caseIndex.substring(0, 4);
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			if (year > Integer.parseInt(y)) {
				caseIndex = year + locbm + "0001";
			} else {
				Long c = Long.parseLong(caseIndex) + 1;
				caseIndex = String.valueOf(c);
			}
		}
		xzfyInfo.setCaseindex(caseIndex);
		String receiveDate=xzfyInfo.getReceive_date();
		if(receiveDate!=null){
			if(receiveDate.length()>10)
				xzfyInfo.setReceive_date(receiveDate.substring(0,10));
		}
		// 记录收案时间、24小时内删除用
		//xzfyInfo.setReceive_real_date(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		BeanCopier bc = BeanCopier.create(XzfyInfo.class, XzfyRecieve.class,
				false);
		Org org=this.recordService.getRootOrg(sljg);
		//System.out.println(org.getName());
		xzfyInfo.setBreak_right(org.getName());
		xzfyInfo.setReceive_real_date(getRealtime());
		XzfyRecieve xr = new XzfyRecieve();
		xzfyInfo.setBuzheng_to(xzfyInfo.getReceive_date());
		
		if ("2".equals(xzfyInfo.getIsmanage())) {
			xzfyInfo.setXwname("行政不作为");
			if(xzfyInfo.getMatter_detail()!=null && !xzfyInfo.getMatter_detail().equals("") )
				xzfyInfo.setXwname("行政不作为("+xzfyInfo.getMatter_detail()+")");
			xzfyInfo.setXwnum("");
		} else {
			xzfyInfo.setMatter_type("0");
			xzfyInfo.setMatter_detail("");
			xzfyInfo.setDuty("");
			xzfyInfo.setExecute_date("");
			xzfyInfo.setIs_prof("0");
			xzfyInfo.setIs_prof_detail("");
		}
		
		String content="";
		if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
			content="申请人不服"+xzfyInfo.getDefendant_name();
		if(xzfyInfo.getXwname()!=null && !xzfyInfo.getXwname().equals(""))
			content=content+xzfyInfo.getXwname();
		if(xzfyInfo.getXwnum()!=null && !xzfyInfo.getXwnum().equals(""))
			content=content+"（"+xzfyInfo.getXwnum()+"）";
		if(xzfyInfo.getXzfy_requset_retail()!=null && !xzfyInfo.getXzfy_requset_retail().equals(""))
			content=content+xzfyInfo.getXzfy_requset_retail();	
		xzfyInfo.setContent_abstract(content);
		bc.copy(xzfyInfo, xr, null);
		xzfyService.saveOrUpdate(xr);

		xzfyInfo.setStatus("1");
		
		
		
		xzfyInfo.setCheck_status("0");
		xzfyService.saveOrUpdate(xzfyInfo);
		
		if ("1".equals(xzfyInfo.getIstiaojie())){
			if(xzfyInfo.getTiaojie_to() != null && !"".equals(xzfyInfo.getTiaojie_to())) {
				xzfyInfo.setReceive_date(xzfyInfo.getTiaojie_to());
			}
		}
		// 申请人拆分存储
		if (xzfyInfo.getId().length()>10) {
			xzfyInfo = this.setInfo(xzfyInfo);
			if (xzfyInfo.getDbrDetail() != null
					&& !xzfyInfo.getDbrDetail().equals("")) {
				this.saveDeputy(xzfyInfo.getDbrDetail());
			}
		}
		
		xzfyInfo.setCaseorg(sljg);//************
		
		xzfyInfo.setCurrentuser(this.recordService.getOrg().getLocbm()); //存储接收案件机关LOCALBM
		String sl1=sljg.substring(0,2);
		String sl2=sljg.substring(2);
		int sl1i = Integer.parseInt(sl1);
		int sl2i = Integer.parseInt(sl2);
		
		if(sljg.equals("0000")){
			xzfyInfo.setXzfy_org("省部级行政机关");
		} else if(sl2.equals("00") && sl1i<19 && sl1i>0) {
			xzfyInfo.setXzfy_org("县级政府");
		} else if(sl2.equals("00") && sl1i<99 && sl1i>18) {
			xzfyInfo.setXzfy_org("省部级政府部门");
		} else if(sl2i<100 && sl2i>0 && sl1i<19 && sl1i>0) {
			xzfyInfo.setXzfy_org("县级政府部门");
		} 
		
		xr.setApp_show(xzfyInfo.getApp_show());

		// 上传文件
		saveFile(xzfyInfo);
		xr.setStatus("1");
		xr.setApp_type1("1");
		//补正信息存入receive
		xr.setKeyword(jiedaimudi);
		xr.setMenu(shoudaoshijian);
		xr.setKeyword3(shoudaofangshi);
		String op="录入当面接待信息";
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
		
		xzfyService.update(xzfyInfo);
		xzfyService.update(xr);
		return SUCCESS;
	}
	
	public String saveFace_zl() {
		// 取得localbm
		String locbm =sljg;
		// 取得最大流水号
		List<String> caseIndexList = this.coreService
				.find("select max(caseindex) as caseindex from XzfyInfo");
		// 设置流水号
		String caseIndex = null;
		for (int i = 0; i < caseIndexList.size(); i++) {
			caseIndex = caseIndexList.get(i);
		}

		if (caseIndex == null) {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			caseIndex = year + locbm + "0001";
			//System.out.println(caseIndex);
		} else {
			String y = caseIndex.substring(0, 4);
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			if (year > Integer.parseInt(y)) {
				caseIndex = year + locbm + "0001";
			} else {
				Long c = Long.parseLong(caseIndex) + 1;
				caseIndex = String.valueOf(c);
			}
		}
		
		String currentTime = new SimpleDateFormat("yyyy-MM-dd")
				.format(new Date());
		xzfyInfo.setZl_time(currentTime);
		this.xzfyInfo2 = this.recordService.getXzfyById_w(xzfyInfo.getXzfyInfo2id());
		xzfyInfo2.setZl_time(currentTime);
		
		
		xzfyInfo.setCaseindex(caseIndex);
		String receiveDate=xzfyInfo.getReceive_date();
		if(receiveDate!=null){
			if(receiveDate.length()>10)
				xzfyInfo.setReceive_date(receiveDate.substring(0,10));
		}
		// 记录收案时间、24小时内删除用
		//xzfyInfo.setReceive_real_date(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		BeanCopier bc = BeanCopier.create(XzfyInfo.class, XzfyRecieve.class,
				false);
		Org org=this.recordService.getRootOrg(sljg);
		//System.out.println(org.getName());
		xzfyInfo.setBreak_right(org.getName());
		xzfyInfo.setReceive_real_date(getRealtime());
		XzfyRecieve xr = new XzfyRecieve();
		xzfyInfo.setBuzheng_to(xzfyInfo.getReceive_date());
		
		if ("2".equals(xzfyInfo.getIsmanage())) {
			xzfyInfo.setXwname("行政不作为");
			if(xzfyInfo.getMatter_detail()!=null && !xzfyInfo.getMatter_detail().equals("") )
				xzfyInfo.setXwname("行政不作为("+xzfyInfo.getMatter_detail()+")");
			xzfyInfo.setXwnum("");
		} else {
			xzfyInfo.setMatter_type("0");
			xzfyInfo.setMatter_detail("");
			xzfyInfo.setDuty("");
			xzfyInfo.setExecute_date("");
			xzfyInfo.setIs_prof("0");
			xzfyInfo.setIs_prof_detail("");
		}
		
		String content="";
		if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
			content="申请人不服"+xzfyInfo.getDefendant_name();
		if(xzfyInfo.getXwname()!=null && !xzfyInfo.getXwname().equals(""))
			content=content+xzfyInfo.getXwname();
		if(xzfyInfo.getXwnum()!=null && !xzfyInfo.getXwnum().equals(""))
			content=content+"（"+xzfyInfo.getXwnum()+"）";
		if(xzfyInfo.getXzfy_requset_retail()!=null && !xzfyInfo.getXzfy_requset_retail().equals(""))
			content=content+xzfyInfo.getXzfy_requset_retail();	
		xzfyInfo.setContent_abstract(content);
		bc.copy(xzfyInfo, xr, null);
		xzfyService.saveOrUpdate(xr);

		xzfyInfo.setStatus("1");
		xzfyInfo.setCheck_status("0");
		xzfyService.saveOrUpdate(xzfyInfo);
		
		if ("1".equals(xzfyInfo.getIstiaojie())){
			if(xzfyInfo.getTiaojie_to() != null && !"".equals(xzfyInfo.getTiaojie_to())) {
				xzfyInfo.setReceive_date(xzfyInfo.getTiaojie_to());
			}
		}
		// 申请人拆分存储
		if (xzfyInfo.getId().length()>10) {
			xzfyInfo = this.setInfo(xzfyInfo);
			if (xzfyInfo.getDbrDetail() != null
					&& !xzfyInfo.getDbrDetail().equals("")) {
				this.saveDeputy(xzfyInfo.getDbrDetail());
			}
		}
		
		xzfyInfo.setCaseorg(sljg);//************
		
		xzfyInfo.setCurrentuser(this.recordService.getOrg().getLocbm()); //存储接收案件机关LOCALBM
		String sl1=sljg.substring(0,2);
		String sl2=sljg.substring(2);
		int sl1i = Integer.parseInt(sl1);
		int sl2i = Integer.parseInt(sl2);
		
		if(sljg.equals("0000")){
			xzfyInfo.setXzfy_org("省部级行政机关");
		} else if(sl2.equals("00") && sl1i<19 && sl1i>0) {
			xzfyInfo.setXzfy_org("县级政府");
		} else if(sl2.equals("00") && sl1i<99 && sl1i>18) {
			xzfyInfo.setXzfy_org("省部级政府部门");
		} else if(sl2i<100 && sl2i>0 && sl1i<19 && sl1i>0) {
			xzfyInfo.setXzfy_org("县级政府部门");
		} 
		
		xr.setApp_show(xzfyInfo.getApp_show());

		// 上传文件
		saveFile(xzfyInfo);
		xr.setStatus("1");
		xr.setApp_type1("1");
		//补正信息存入receive
		xr.setKeyword(jiedaimudi);
		xr.setMenu(shoudaoshijian);
		xr.setKeyword3(shoudaofangshi);
		String op="录入当面接待信息";
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
		
		xzfyService.update(xzfyInfo);
		xzfyService.update(xzfyInfo2);
		xzfyService.update(xr);
		return SUCCESS;
	}
	
	

	public String songdaqueren() {
		String locbm =this.recordService.getOrg().getLocbm();
		Org org=this.recordService.getRootOrg(locbm);
		xzfyInfo.setBreak_right(org.getName());
		xzfyInfo.setCaseorg(this.recordService.getOrg().getLocbm());
		xzfyInfo.setCheck_status("0");
		xzfyInfo.setStatus("0");
		xzfyInfo.setSongdaquerenFlag("1");
		if ("2".equals(xzfyInfo.getIsmanage())) {
			xzfyInfo.setXwname("行政不作为");
			if(xzfyInfo.getMatter_detail()!=null && !xzfyInfo.getMatter_detail().equals("") )
				xzfyInfo.setXwname("行政不作为("+xzfyInfo.getMatter_detail()+")");
			xzfyInfo.setXwnum("");
		} else {
			xzfyInfo.setMatter_type("0");
			xzfyInfo.setMatter_detail("");
			xzfyInfo.setDuty("");
			xzfyInfo.setExecute_date("");
			xzfyInfo.setIs_prof("0");
			xzfyInfo.setIs_prof_detail("");
		}
		String receiveDate=xzfyInfo.getReceive_date();
		if(receiveDate!=null){
			if(receiveDate.length()>10)
				xzfyInfo.setReceive_date(receiveDate.substring(0,10));
		}
		/*
		if ("1".equals(xzfyInfo.getIstiaojie())){
			if(xzfyInfo.getTiaojie_to() != null && !"".equals(xzfyInfo.getTiaojie_to())) {
				xzfyInfo.setReceive_date(xzfyInfo.getTiaojie_to());
			}
		}
		*/
		xzfyService.saveOrUpdate(xzfyInfo);
		if (xzfyInfo.getId().length()>10) {
			xzfyInfo = this.setInfo(this.xzfyInfo);
			if (xzfyInfo.getDbrDetail() != null
					&& !xzfyInfo.getDbrDetail().equals("")) {
				this.saveDeputy(xzfyInfo.getDbrDetail());
			}
		}
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
		xzfyService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}

	public String jiedaibilu() {

		String locbm =this.recordService.getOrg().getLocbm();

		Org org=this.recordService.getRootOrg(locbm);
		xzfyInfo.setBreak_right(org.getName());
		xzfyInfo.setReceive_real_date(xzfyInfo.getReceive_real_date());
		if ("2".equals(xzfyInfo.getIsmanage())) {
			xzfyInfo.setXwname("行政不作为");
			if(xzfyInfo.getMatter_detail()!=null && !xzfyInfo.getMatter_detail().equals("") )
				xzfyInfo.setXwname("行政不作为("+xzfyInfo.getMatter_detail()+")");
			xzfyInfo.setXwnum("");
		} else {
			xzfyInfo.setMatter_type("0");
			xzfyInfo.setMatter_detail("");
			xzfyInfo.setDuty("");
			xzfyInfo.setExecute_date("");
			xzfyInfo.setIs_prof("0");
			xzfyInfo.setIs_prof_detail("");
		}
		if ("1".equals(xzfyInfo.getIstiaojie())){
			if(xzfyInfo.getTiaojie_to() != null && !"".equals(xzfyInfo.getTiaojie_to())) {
				xzfyInfo.setReceive_date(xzfyInfo.getTiaojie_to());
			}
		}
		BeanCopier bc = BeanCopier.create(XzfyInfo.class, XzfyRecieve.class,
				false);
		XzfyRecieve xr = new XzfyRecieve();
		
		bc.copy(xzfyInfo, xr, null);
		xr.setApp_type1("0");
		//xr.setApp_type("5");
		xr.setReceive_type("5");
		xr.setKeyword(jiedaimudi);
		xr.setMenu(shoudaoshijian);
		xr.setKeyword3(shoudaofangshi);
		xr.setJaAdvice(xzfyId);
		xzfyService.saveOrUpdate(xr);
		return SUCCESS;		
	}

	public String shengchengshouju() {
		String locbm =this.recordService.getOrg().getLocbm();

		Org org=this.recordService.getRootOrg(locbm);
		xzfyInfo.setBreak_right(org.getName());
		xzfyInfo.setCaseorg(this.recordService.getOrg().getLocbm());
		xzfyInfo.setCheck_status("0");
		xzfyInfo.setStatus("0");
		xzfyInfo.setShouju_flag("1");
		if ("2".equals(xzfyInfo.getIsmanage())) {
			xzfyInfo.setXwname("行政不作为");
			if(xzfyInfo.getMatter_detail()!=null && !xzfyInfo.getMatter_detail().equals("") )
				xzfyInfo.setXwname("行政不作为("+xzfyInfo.getMatter_detail()+")");
			xzfyInfo.setXwnum("");
		} else {
			xzfyInfo.setMatter_type("0");
			xzfyInfo.setMatter_detail("");
			xzfyInfo.setDuty("");
			xzfyInfo.setExecute_date("");
			xzfyInfo.setIs_prof("0");
			xzfyInfo.setIs_prof_detail("");
		}
		/*
		if ("1".equals(xzfyInfo.getIstiaojie())){
			if(xzfyInfo.getTiaojie_to() != null && !"".equals(xzfyInfo.getTiaojie_to())) {
				xzfyInfo.setReceive_date(xzfyInfo.getTiaojie_to());
			}
		}*/
		String receiveDate=xzfyInfo.getReceive_date();
		if(receiveDate!=null){
			if(receiveDate.length()>10)
				xzfyInfo.setReceive_date(receiveDate.substring(0,10));
		}
		xzfyService.saveOrUpdate(xzfyInfo);
		
		if (xzfyInfo.getId().length()>10) {
			xzfyInfo = this.setInfo(this.xzfyInfo);
			if (xzfyInfo.getDbrDetail() != null
					&& !xzfyInfo.getDbrDetail().equals("")) {
				this.saveDeputy(xzfyInfo.getDbrDetail());
			}
		}
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
				}
		*/
		
		
		xzfyService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}

	public XzfyApp splitInfo(String r, XzfyApp xzfyApp) {

		if (r.startsWith("身")) {
			r = r.substring(4);
			xzfyApp.setApp_id(r);
		} else if (r.startsWith("送")) {
			r = r.substring(4);
			xzfyApp.setMail_address(r);
		} else if (r.startsWith("邮")) {
			r = r.substring(2);
			xzfyApp.setPostcode(r);
		} else if (r.startsWith("电")) {
			r = r.substring(2);
			xzfyApp.setTelephone(r);
		} else {
			String a[] = r.split("：");
			xzfyApp.setDeputyType(a[0].replace("是", ""));
			xzfyApp.setDeputyName(a[1]);
		}
		return xzfyApp;
	}
	
	public String saveBuwei() {
		xzfyBuwei = this.saveFile(xzfyBuwei);
		xzfyService.saveOrUpdate(xzfyBuwei);
		return SUCCESS;
	}
	
	public String savePaper() {
		// 取得localbm
		String locbm =sljg;
		// 取得最大流水号
		List<String> caseIndexList = this.coreService
				.find("select max(caseindex) as caseindex from XzfyInfo");
		// 设置流水号
		String caseIndex = null;
		for (int i = 0; i < caseIndexList.size(); i++) {
			caseIndex = caseIndexList.get(i);
		}

		if (caseIndex == null) {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			caseIndex = year + locbm + "0001";
			//System.out.println(caseIndex);
		} else {
			String y = caseIndex.substring(0, 4);
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			if (year > Integer.parseInt(y)) {
				caseIndex = year + locbm + "0001";
			} else {
				Long c = Long.parseLong(caseIndex) + 1;
				caseIndex = String.valueOf(c);
			}
		}
		xzfyInfo.setCaseindex(caseIndex);
		String receiveDate=xzfyInfo.getReceive_date();
		if(receiveDate!=null){
			if(receiveDate.length()>10)
				xzfyInfo.setReceive_date(receiveDate.substring(0,10));
		}

		
		
		
		// 记录收案时间、24小时内删除用
		xzfyInfo.setReceive_real_date(new SimpleDateFormat("yyyy-MM-dd")
				.format(new Date()));
		BeanCopier bc = BeanCopier.create(XzfyInfo.class, XzfyRecieve.class,
				false);
		Org org=this.recordService.getRootOrg(sljg);
		//System.out.println(org.getName());
		xzfyInfo.setBreak_right(org.getName());
		
		String content="";
		if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
			content="申请人不服"+xzfyInfo.getDefendant_name();
		if(xzfyInfo.getXwname()!=null && !xzfyInfo.getXwname().equals(""))
			content=content+xzfyInfo.getXwname();
		if(xzfyInfo.getXwnum()!=null && !xzfyInfo.getXwnum().equals(""))
			content=content+"（"+xzfyInfo.getXwnum()+"）";
		if(xzfyInfo.getXzfy_requset_retail()!=null && !xzfyInfo.getXzfy_requset_retail().equals(""))
			content=content+xzfyInfo.getXzfy_requset_retail();	
		//content=content+"。";
		xzfyInfo.setContent_abstract(content);
		XzfyRecieve xr = new XzfyRecieve();
		bc.copy(xzfyInfo, xr, null);
		xzfyService.saveOrUpdate(xr);
		
		xzfyInfo.setBuzheng_to(xzfyInfo.getReceive_date());
		xzfyInfo.setStatus("1");
		xzfyInfo.setCheck_status("0");
		xzfyService.saveOrUpdate(xzfyInfo);

		if (xzfyInfo.getId().length()>10) {
			xzfyInfo = this.setInfo(this.xzfyInfo);
			if (xzfyInfo.getDbrDetail() != null
					&& !xzfyInfo.getDbrDetail().equals("")) {
				this.saveDeputy(xzfyInfo.getDbrDetail());
			}
		}
		
		xzfyInfo.setCaseorg(sljg);
		
		xzfyInfo.setCurrentuser(this.recordService.getOrg().getLocbm()); //存储接收案件机关LOCALBM
		String sl1=sljg.substring(0,2);
		String sl2=sljg.substring(2);
		int sl1i = Integer.parseInt(sl1);
		int sl2i = Integer.parseInt(sl2);
		
		if(sljg.equals("0000")){
			xzfyInfo.setXzfy_org("省部级行政机关");
		} else if(sl2.equals("00") && sl1i<19 && sl1i>0) {
			xzfyInfo.setXzfy_org("县级政府");
		} else if(sl2.equals("00") && sl1i<99 && sl1i>18) {
			xzfyInfo.setXzfy_org("省部级政府部门");
		} else if(sl2i<100 && sl2i>0 && sl1i<19 && sl1i>0) {
			xzfyInfo.setXzfy_org("县级政府部门");
		} 
		xzfyInfo.setCaseorg(this.recordService.getOrg().getLocbm());
		xr.setApp_show(xzfyInfo.getApp_show());
		String op="录入复议来信信息";
		
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
		xzfyService.update(xzfyInfo);
		xzfyService.update(xr);
		return SUCCESS;
	}
	
	
	
	public String savePaper_zl() {
		// 取得localbm
		String locbm =sljg;
		// 取得最大流水号
		List<String> caseIndexList = this.coreService
				.find("select max(caseindex) as caseindex from XzfyInfo");
		// 设置流水号
		String caseIndex = null;
		for (int i = 0; i < caseIndexList.size(); i++) {
			caseIndex = caseIndexList.get(i);
		}

		if (caseIndex == null) {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			caseIndex = year + locbm + "0001";
			//System.out.println(caseIndex);
		} else {
			String y = caseIndex.substring(0, 4);
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			if (year > Integer.parseInt(y)) {
				caseIndex = year + locbm + "0001";
			} else {
				Long c = Long.parseLong(caseIndex) + 1;
				caseIndex = String.valueOf(c);
			}
		}
		xzfyInfo.setCaseindex(caseIndex);
		String receiveDate=xzfyInfo.getReceive_date();
		if(receiveDate!=null){
			if(receiveDate.length()>10)
				xzfyInfo.setReceive_date(receiveDate.substring(0,10));
		}

		String currentTime = new SimpleDateFormat("yyy-MM-dd")
				.format(new Date());
		xzfyInfo.setZl_time(currentTime);
		this.xzfyInfo2 = this.recordService.getXzfyById_w(xzfyInfo.getXzfyInfo2id());
		xzfyInfo2.setZl_time(currentTime);
		
		
		// 记录收案时间、24小时内删除用
		xzfyInfo.setReceive_real_date(new SimpleDateFormat("yyyy-MM-dd")
				.format(new Date()));
		BeanCopier bc = BeanCopier.create(XzfyInfo.class, XzfyRecieve.class,
				false);
		Org org=this.recordService.getRootOrg(sljg);
		//System.out.println(org.getName());
		xzfyInfo.setBreak_right(org.getName());
		
		String content="";
		if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
			content="申请人不服"+xzfyInfo.getDefendant_name();
		if(xzfyInfo.getXwname()!=null && !xzfyInfo.getXwname().equals(""))
			content=content+xzfyInfo.getXwname();
		if(xzfyInfo.getXwnum()!=null && !xzfyInfo.getXwnum().equals(""))
			content=content+"（"+xzfyInfo.getXwnum()+"）";
		if(xzfyInfo.getXzfy_requset_retail()!=null && !xzfyInfo.getXzfy_requset_retail().equals(""))
			content=content+xzfyInfo.getXzfy_requset_retail();	
		//content=content+"。";
		xzfyInfo.setContent_abstract(content);
		XzfyRecieve xr = new XzfyRecieve();
		bc.copy(xzfyInfo, xr, null);
		xzfyService.saveOrUpdate(xr);
		
		xzfyInfo.setBuzheng_to(xzfyInfo.getReceive_date());
		xzfyInfo.setStatus("1");
		xzfyInfo.setCheck_status("0");
		xzfyService.saveOrUpdate(xzfyInfo);

		if (xzfyInfo.getId().length()>10) {
			xzfyInfo = this.setInfo(this.xzfyInfo);
			if (xzfyInfo.getDbrDetail() != null
					&& !xzfyInfo.getDbrDetail().equals("")) {
				this.saveDeputy(xzfyInfo.getDbrDetail());
			}
		}
		
		xzfyInfo.setCaseorg(sljg);
		
		xzfyInfo.setCurrentuser(this.recordService.getOrg().getLocbm()); //存储接收案件机关LOCALBM
		String sl1=sljg.substring(0,2);
		String sl2=sljg.substring(2);
		int sl1i = Integer.parseInt(sl1);
		int sl2i = Integer.parseInt(sl2);
		
		if(sljg.equals("0000")){
			xzfyInfo.setXzfy_org("省部级行政机关");
		} else if(sl2.equals("00") && sl1i<19 && sl1i>0) {
			xzfyInfo.setXzfy_org("县级政府");
		} else if(sl2.equals("00") && sl1i<99 && sl1i>18) {
			xzfyInfo.setXzfy_org("省部级政府部门");
		} else if(sl2i<100 && sl2i>0 && sl1i<19 && sl1i>0) {
			xzfyInfo.setXzfy_org("县级政府部门");
		} 
		xzfyInfo.setCaseorg(this.recordService.getOrg().getLocbm());
		xr.setApp_show(xzfyInfo.getApp_show());
		String op="录入复议来信信息";
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
		xzfyService.update(xzfyInfo);
		xzfyService.update(xzfyInfo2);
		
		xzfyService.update(xr);
		return SUCCESS;
	}
	

	public String saveEmail() {
		// 取得localbm
		String locbm = this.recordService.getOrg().getLocbm();
		// 取得最大流水号
		List<String> caseIndexList = this.coreService
				.find("select max(caseindex) as caseindex from XzfyInfo");
		// 设置流水号
		String caseIndex = null;
		for (int i = 0; i < caseIndexList.size(); i++) {
			caseIndex = caseIndexList.get(i);
		}

		if (caseIndex == null) {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			caseIndex = year + locbm + "0001";
//			System.out.println(caseIndex);
		} else {
			String y = caseIndex.substring(0, 4);
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			if (year > Integer.parseInt(y)) {
				caseIndex = year + locbm + "0001";
			} else {
				Long c = Long.parseLong(caseIndex) + 1;
				caseIndex = String.valueOf(c);
			}
		}
		xzfyInfo.setCaseindex(caseIndex);

		// 记录收案时间、24小时内删除用
		xzfyInfo.setReceive_real_date(new SimpleDateFormat("yyyyMMddHHmmss")
				.format(new Date()));
		BeanCopier bc = BeanCopier.create(XzfyInfo.class, XzfyRecieve.class,
				false);
		XzfyRecieve xr = new XzfyRecieve();
		bc.copy(xzfyInfo, xr, null);
		xzfyService.saveOrUpdate(xr);

		xzfyInfo.setStatus("1");
		xzfyInfo.setCheck_status("0");
		xzfyService.saveOrUpdate(xzfyInfo);

		if (xzfyInfo.getId().length()>10) {
			xzfyInfo = this.setInfo(this.xzfyInfo);
			if (xzfyInfo.getDbrDetail() != null
					&& !xzfyInfo.getDbrDetail().equals("")) {
				this.saveDeputy(xzfyInfo.getDbrDetail());
			}
		}
		xzfyInfo.setCaseorg(this.recordService.getOrg().getLocbm());
		xr.setApp_show(xzfyInfo.getApp_show());

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
		
		
		xzfyService.update(xzfyInfo);
		xzfyService.update(xr);
		return SUCCESS;
	}

	public String saveLianshencha() {
		xzfyService.update(xzfyInfo);
		return SUCCESS;
	}

	public String finishLianshencha() {
		xzfyInfo.setStatus(status);
		
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
		
		xzfyService.update(xzfyInfo);
		return SUCCESS;
	}

	public String liAn() {
		xzfyInfo.setStatus("5");
		
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
		
		xzfyService.update(xzfyInfo);
		return SUCCESS;
	}

	public String banAn() {
		xzfyInfo.setStatus("9");
		
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
		
		xzfyService.update(xzfyInfo);
		return SUCCESS;
	}

	public String addDeputy() {
		appList = xzfyService.getAppListById(xzfyId, this.protype);
		sendValue = "";
		appCount = "0";
		String d = "";
		String l = "";
		int dc = 0;
		int lc = 0;
		for (int i = 0; i < appList.size(); i++) {
			XzfyApp app = new XzfyApp();
			app = (XzfyApp) appList.get(i);
			if (app.getIsdeputy().equals("1")) {
				d = d + "代表人姓名：" + app.getApp_name() + " ";
				dc++;

			}
			if (app.getIslink().equals("1")) {
				l = l + "联系人姓名：" + app.getApp_name() + " ";
				lc++;
			}
		}
		sendValue = d + l;
		return SUCCESS;
	}

	public String addApp() {
		appList = xzfyService.getAppListById(xzfyId, this.protype);
		sendValue = "";
		appCount = "0";
		String app_id;
		String mail_address;
		String mobile;
		for (int i = 0; i < appList.size(); i++) {
			XzfyApp app = new XzfyApp();
			app = (XzfyApp) appList.get(i);

			if (app.getApp_id() == null || app.getApp_id().equals("")) {
				app_id = "";
			} else {
				app_id = app.getApp_id();
			}

			if (app.getMail_address() == null
					|| app.getMail_address().equals("")) {
				mail_address = "";
			} else {
				mail_address = app.getMail_address();
			}

			if (app.getMobile() == null || app.getMobile().equals("")) {
				mobile = "";
			} else {
				mobile = app.getMobile();
			}

			sendValue = sendValue + app.getApp_name() + "，";
			if (app.getSexy().equals("1"))
				sendValue = sendValue + "男，";
			else
				sendValue = sendValue + "女，";
			sendValue = sendValue + "身份证号：" + app_id + "，住所地：" + mail_address
					+ "，电话：" + mobile;
			if (i == appList.size() - 1)
				sendValue = sendValue + "。";
			else
				sendValue = sendValue + "；";
		}
		if (appList.size() > 0)
			appCount = new Integer(appList.size()).toString();

		return SUCCESS;
	}

	public String addLegal() {
		appList = xzfyService.getAppListById(xzfyId, this.protype);
		sendValue = "";
		String otherType = "";
		String deputyType = "";
		String address = "";
		String mobile = "";
		String post = "";
		for (int i = 0; i < appList.size(); i++) {
			XzfyApp app = new XzfyApp();
			app = (XzfyApp) appList.get(i);
			if (app.getOtherType().equals("1")) {
				otherType = "由股东代表大会以股份制企业名义提出申请";
			} else if (app.getOtherType().equals("2")) {
				otherType = "由董事会以股份制企业名义提出申请";
			} else if (app.getOtherType().equals("3")) {
				otherType = "其他";
			} else if (app.getOtherType().equals("0")) {
				otherType = "无";
			}

			if (app.getDeputyType().equals("1")) {
				deputyType = "法定代表人";
			} else if (app.getDeputyType().equals("2")) {
				deputyType = "负责人";
			} else if (app.getDeputyType().equals("3")) {
				deputyType = "执行合伙事务的合伙人";
			} else if (app.getDeputyType().equals("4")) {
				deputyType = "合伙人";
			} else if (app.getDeputyType().equals("5")) {
				deputyType = "主要负责人";
			} else if (app.getDeputyType().equals("6")) {
				deputyType = "被共同推选的非法人组织其他成员";
			}

			if (app.getAddress() == null) {
				address = "";
			} else {
				address = app.getAddress();
			}
			if (app.getMobile() == null) {
				mobile = "";
			} else {
				mobile = app.getMobile();
			}
			if (app.getPostcode() == null) {
				post = "";
			} else {
				post = app.getPostcode();
			}
			sendValue = sendValue + app.getApp_name() + "(" + otherType + ")，";
			sendValue = sendValue + deputyType + "是：" + app.getDeputyName()
					+ "，";
			sendValue = sendValue + "住所地" + address + "，邮编" + post + "，电话"
					+ mobile;
			if (i == appList.size() - 1)
				sendValue = sendValue + "。";
			else
				sendValue = sendValue + "；";
		}
		appCount = "0";
		if (appList.size() > 0)
			appCount = new Integer(appList.size()).toString();
		return SUCCESS;
	}

	public String getAppname() {
		appList = this.xzfyService.getAppListById(xzfyId);
		List<XzfyApp> appTemp = new ArrayList<XzfyApp>();
		for (XzfyApp app : appList) {
			if (app.getIsdeputy().equals("1")) {
				appTemp.add(app);
			}
		}
		if (appTemp.size() != 0) {
			appList.clear();
			appList.addAll(appTemp);
		}
		return SUCCESS;
	}

	public String addAgent() {
		agentList = xzfyService.getAgentListById(xzfyId);
		sendValue = "";
		for (int i = 0; i < agentList.size(); i++) {
			XzfyAgent agent = new XzfyAgent();
			agent = (XzfyAgent) agentList.get(i);
			sendValue = sendValue + agent.getAgent_name();
			if (i == agentList.size() - 1)
				sendValue = sendValue + "。";
			else
				sendValue = sendValue + "；";
		}
		agentCount = "0";
		if (agentList.size() > 0)
			agentCount = new Integer(agentList.size()).toString();
		return SUCCESS;
	}

	public String createApp() {
		return SUCCESS;
	}

	public String createAgent() {
		return SUCCESS;
	}

	public String saveNewApp() {
		xzfyInfo = new XzfyInfo();
		xzfyInfo.setId(xzfyId);
		xzfyApp.setProxytype(protype);
		xzfyApp.setXzfyInfo(xzfyInfo);
		xzfyService.saveOrUpdate(xzfyApp);
		return SUCCESS;
	}

	public String saveDeputy() {
		for (int i = 0; i < deputy.size(); i++) {
			if (deputy.get(i).equals("1")) {
				xzfyService
						.updateAllBySQL("update xzfy_app set isdeputy ='1' where id="
								+ appIds.get(i));
			}
		}

		for (int i = 0; i < link.size(); i++) {
			if (link.get(i).equals("1")) {
				xzfyService
						.updateAllBySQL("update xzfy_app set islink ='1' where id="
								+ appIds.get(i));
			}
		}

		return SUCCESS;
	}

	public String lianTiqu() {
		xzfyInfo = xzfyService.getXzfyById(xzfyId);
		user = new User();
		user = (User) ActionContext.getContext().getSession()
				.get("_USER_LOGIN_");
		admit_name = user.getName();
		xzfyInfo.setUser1_name(admit_name);
		xzfyService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}

	public String tiquXzfyInfo() {
		user = new User();
		user = (User) ActionContext.getContext().getSession()
				.get("_USER_LOGIN_");
		admit_name = user.getName();

		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		todate = df.format(dt);
		Org org=this.recordService.getRootOrg(recordService.getOrg().getLocbm());
		xzfyCom=this.recordService.getXzfyComById(org.getLocbm(),org.getName());
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		Random random = new Random();
		setXzfyNewId(currentTime + random.nextInt(1000));
		localBm = org.getLocbm();
		localName = org.getName();
		xzfyInfo = xzfyService.getXzfyById(xzfyId);
		String currentTime1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		xzfyInfo.setReceive_real_date(currentTime1);
//		System.out.println(xzfyInfo.getApp_show());
		xwList = new ArrayList<Xw>();
		if (xzfyInfo.getIsmanage() != null && xzfyInfo.getIsmanage().equals("0")){
			if (xzfyInfo.getXwname() != null && !xzfyInfo.getXwname().equals("")){
				if (xzfyInfo.getXwnum() != null && !xzfyInfo.getXwnum().equals("")){
					String name[]=xzfyInfo.getXwname().split(", ");
					String num[]=xzfyInfo.getXwnum().split(", ");
					for (int i =0;i<name.length;i++){
						Xw x = new Xw();
						x.setXwName(name[i]);
						x.setXwNum(num[i]);
						xwList.add(x);
					}
				}
			}
		} 
		
		//设置被申请人种类与被申请人名称
		//北京市法制办
		if(localBm.equals("0000")){
			//被申请人种类
			for (int i=0;i<4;i++){
				Beishenqingren b = new Beishenqingren();
				if(i==0){
					b.setName("区政府");
					b.setValue("5");
				} else if(i==1){
					b.setName("省级政府部门");
					b.setValue("7");
				} else if(i==2){
					b.setName("省级政府");//??????????庞处修改，省级行政机关改为省级政府
					b.setValue("6");
				} else if(i==3){
					b.setName("其他");
					b.setValue("8");
				}
				zlList.add(b);
			}
			//被申请人名称
			bList = xzfyService.getBsqrName("5", localBm,bList);
			bList = xzfyService.getBsqrName("7", localBm,bList);
			bList = xzfyService.getBsqrName("6", localBm,bList);
		}
		
		//区县政府
		int lb = Integer.parseInt(localBm.substring(0, 2));
		if(localBm.length()==4 && "00".equals(localBm.substring(2, 4)) && lb<19 && lb!=0){
			//被申请人种类
			for (int i=0;i<4;i++){
				Beishenqingren b = new Beishenqingren();
				if(i==0){
					b.setName("区政府部门");
					b.setValue("4");
				} else if(i==1){
					b.setName("区政府部门派出机构");
					b.setValue("9");
				} else if(i==2){
					b.setName("乡镇街道");
					b.setValue("3");
				} else if(i==3){
					b.setName("其他");
					b.setValue("8");
				}
				zlList.add(b);
			}
			//被申请人名称
			bList = xzfyService.getBsqrName("4", localBm,bList);
			bList = xzfyService.getBsqrName("3", localBm,bList);
			bList = xzfyService.getBsqrName("9", localBm,bList);
		}
		//区县政府部门
		if(localBm.length()==4 && !"00".equals(localBm.substring(2, 4))){
			//被申请人种类
			for (int i=0;i<2;i++){
				Beishenqingren b = new Beishenqingren();
				if(i==0){
					b.setName("区政府部门派出机构");
					b.setValue("9");
				} else if(i==1){
					b.setName("其他");
					b.setValue("8");
				}
				zlList.add(b);
			}
			//被申请人名称
			bList = xzfyService.getBsqrName("9", localBm,bList);
		}
		//省部级政府部门
		if(localBm.length()==4 && "00".equals(localBm.substring(2, 4)) && lb>18){
			//被申请人种类
			for (int i=0;i<2;i++){
				Beishenqingren b = new Beishenqingren();
				if(i==0){
					b.setName("区政府部门");
					b.setValue("4");
				} else if(i==1){
					b.setName("其他");
					b.setValue("8");
				}
				zlList.add(b);
			}
			//被申请人名称
			bList = xzfyService.getBsqrName("4", localBm,bList);
		}
		return SUCCESS;
	}
	
	public List docList;
	public List docList2;
	public List docList3;

	public List getDocList() {
		return docList;
	}

	public void setDocList(List docList) {
		this.docList = docList;
	}

	public List getDocList2() {
		return docList2;
	}

	public void setDocList2(List docList2) {
		this.docList2 = docList2;
	}

	public List getDocList3() {
		return docList3;
	}

	public void setDocList3(List docList3) {
		this.docList3 = docList3;
	}
	String locbm1="";
	public String getLocbm1() {
		return locbm1;
	}

	public void setLocbm1(String locbm1) {
		this.locbm1 = locbm1;
	}

	/*
	 * 接待查看页面    接待查看页面    接待查看页面   接待查看页面    接待查看页面    接待查看页面   接待查看页面    接待查看页面    接待查看页面
	 * 接待查看页面    接待查看页面    接待查看页面   接待查看页面    接待查看页面    接待查看页面   接待查看页面    接待查看页面    接待查看页面
	 * 接待查看页面    接待查看页面    接待查看页面   接待查看页面    接待查看页面    接待查看页面   接待查看页面    接待查看页面    接待查看页面
	 * */
	//meet表，根据xzfyId取最后一个阅卷、送达、转交材料组成list
	private List<Meet> meetList = new ArrayList<Meet>();
	private XzfyRecieve buzhengInfo;
	public String getInfoById() {
		xzfyReceive = this.xzfyService.getRecieveById(xzfyId);
		xzfyInfo = this.xzfyService.getXzfyById(xzfyId);
		locbm1=this.recordService.getOrg().getLocbm();
		docList=new ArrayList();//收据
		docList2=new ArrayList();//接待笔录
		docList3=new ArrayList();//送达回证
		String sql="select * from (select * from eweboffice_t_document where caseid='"+xzfyId+"' and d_type='shouju' order by d_id desc ) where rownum=1";

		String	sql2="select * from (select * from eweboffice_t_document where caseid='"+xzfyId+"' and d_type='jiedaibilu' order by d_id desc ) where rownum=1";

		String	sql3="select * from (select * from eweboffice_t_document where caseid='"+xzfyId+"' and d_type='songdadizhiquerenshu' order by d_id desc ) where rownum=1";		
		docList=recordService.findListBySQL(sql);
		docList2=recordService.findListBySQL(sql2);
		docList3=recordService.findListBySQL(sql3);
		//meet表，根据xzfyId取最后一个阅卷、送达、转交材料组成list
		meetList = bananService.getNewestMeetList(xzfyId);
		buzhengInfo = bananService.getDmbzByInfoid(xzfyId);
		return SUCCESS;
	}

	public String saveNewAgent() {
		xzfyInfo = new XzfyInfo();
		xzfyInfo.setId(xzfyId);
		xzfyAgent.setProxytype(protype);
		xzfyAgent.setXzfyInfo(xzfyInfo);
		xzfyService.save(xzfyAgent);
		return SUCCESS;
	}

	public String deleteApp() {
		xzfyApp = new XzfyApp();
		xzfyApp = xzfyService.getAppById(appId);
		xzfyService.deleteAppById(appId);
		return SUCCESS;
	}

	public String deleteAgent() {
		xzfyAgent = new XzfyAgent();
		xzfyAgent = xzfyService.getAgentById(agentId);
		xzfyService.deleteAgentById(agentId);
		return SUCCESS;
	}

	public String updateApp() {
		xzfyApp = new XzfyApp();
		xzfyApp.setProxytype(protype);
		xzfyApp = xzfyService.getAppById(appId);
		return SUCCESS;
	}

	public String updateAgent() {
		xzfyAgent = new XzfyAgent();
		xzfyAgent.setProxytype(protype);
		xzfyAgent = xzfyService.getAgentById(agentId);
		return SUCCESS;
	}

	public String doUpdateApp() {
		xzfyInfo = new XzfyInfo();
		xzfyInfo.setId(xzfyId);
		xzfyApp.setXzfyInfo(xzfyInfo);
		xzfyService.update(xzfyApp);
		return SUCCESS;
	}

	public String doUpdateAgent() {
		xzfyInfo = new XzfyInfo();
		xzfyInfo.setId(xzfyId);
		xzfyAgent.setXzfyInfo(xzfyInfo);
		xzfyService.update(xzfyAgent);
		return SUCCESS;
	}


	public String div5Search(){
		Date dt = new Date();
		DateFormat year = new SimpleDateFormat("yyyy");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		startDate = year.format(dt)+"-01-01";
		endDate = df.format(dt);
		localBm = recordService.getOrg().getLocbm();
		Org org=this.recordService.getRootOrg(recordService.getOrg().getLocbm());
		users = recordService.getUserListById(org.getId().toString());
		
//		Iterator i = users.iterator();
//		while (i.hasNext()){
//			User u = (User) i.next();
//			System.out.println(u.getName());
//		}
		return SUCCESS;
	}
	public String div51Result() throws ParseException, SQLException{
		user = new User();
		user = (User) ActionContext.getContext().getSession()
				.get("_USER_LOGIN_");
		admit_name = user.getName();
		startDateShow =DateUtil.getDateByFormat(startDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		endDateShow =DateUtil.getDateByFormat(endDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		Date today = new Date();
		DateFormat f = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String t = f.format(today);
		todayShow =DateUtil.getDateByFormat(t, "yyyy-MM-dd-HH-mm-ss", "yyyy年MM月dd日HH小时mm分ss秒");
		div51List = this.xzfyService.getDiv51List(startDate,endDate,us);
		return SUCCESS;
	}
	public String div52Result() throws ParseException, SQLException{
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
		
		div52List = this.xzfyService.getDiv52List(startDate2,endDate2,us2);
		return SUCCESS;
	}
	private ArrayList<String> div51List;
	private ArrayList<XzfyInfo> div52List;
	private String us="";
	private String us2="";
	private String startDate="";
	private String endDate="";
	private String startDate2="";
	private String endDate2="";
	private String todayShow="";
	private String startDateShow="";
	private String endDateShow="";
	private List users;
	private XzfyInfo xzfyInfo;
	private XzfyApp xzfyApp;
	private XzfyAgent xzfyAgent;
	private int appId;
	private int agentId;
	private String sendValue;
	private String protype = "1";
	private String textId;
	private String todate;
	private String admit_name;
	private String countId;
	private String appCount;
	private String agentCount;
	private User user;
	private List<String> deputy;
	private List<String> link;
	private List<String> appIds;
	private XzfyBuwei xzfyBuwei;

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

	public XzfyApp getXzfyApp() {
		return xzfyApp;
	}

	public void setXzfyApp(XzfyApp xzfyApp) {
		this.xzfyApp = xzfyApp;
	}

	private List<XzfyApp> appList;
	private List agentList;

	public List getAppList() {
		return appList;
	}

	public void setAppList(List appList) {
		this.appList = appList;
	}

	public int getBsqrListSize() {
		return bsqrListSize;
	}

	public void setBsqrListSize(int bsqrListSize) {
		this.bsqrListSize = bsqrListSize;
	}

	private String xzfyId;

	// 继承方法

	public String getXzfyId() {
		return xzfyId;
	}

	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}

	public PaginationSupport getPageList() {
		return pageList;
	}

	public void setPageList(PaginationSupport pageList) {
		this.pageList = pageList;
	}

	@Override
	public Class<XzfyInfo> getPersistentClass() {
		return XzfyInfo.class;
	}

	// 自定义Set和Get方法

	public XzfyInfo getXzfyInfo() {
		return this.xzfyInfo;
	}

	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}

	public List getAgentList() {
		return agentList;
	}

	public void setAgentList(List agentList) {
		this.agentList = agentList;
	}

	public String getAgentCount() {
		return agentCount;
	}

	public void setAgentCount(String agentCount) {
		this.agentCount = agentCount;
	}

	public XzfyAgent getXzfyAgent() {
		return xzfyAgent;
	}

	public void setXzfyAgent(XzfyAgent xzfyAgent) {
		this.xzfyAgent = xzfyAgent;
	}

	public void setAgentId(int agentId) {
		this.agentId = agentId;
	}

	public int getAgentId() {
		return agentId;
	}

	public void setAppIds(List<String> appIds) {
		this.appIds = appIds;
	}

	public List<String> getAppIds() {
		return appIds;
	}

	public void setLink(List<String> link) {
		this.link = link;
	}

	public List<String> getLink() {
		return link;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

	private int shenpiid;
	private String checktype;
	private String checkid;
	private String checkname;
	private String checkresult;
	private String checkadvise;
	private String checkdate;
	private String sqsprenid;
	private String sqsprenname;
	private List shenpilist;
	private XzfyShenpi xzfyshenpi;

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public int getShenpiid() {
		return shenpiid;
	}

	public void setShenpiid(int shenpiid) {
		this.shenpiid = shenpiid;
	}

	public String getChecktype() {
		return checktype;
	}

	public void setChecktype(String checktype) {
		this.checktype = checktype;
	}

	public String getCheckid() {
		return checkid;
	}

	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}

	public String getCheckname() {
		return checkname;
	}

	public void setCheckname(String checkname) {
		this.checkname = checkname;
	}

	public String getCheckresult() {
		return checkresult;
	}

	public void setCheckresult(String checkresult) {
		this.checkresult = checkresult;
	}

	public String getCheckadvise() {
		return checkadvise;
	}

	public void setCheckadvise(String checkadvise) {
		this.checkadvise = checkadvise;
	}

	public String getCheckdate() {
		return checkdate;
	}

	public void setCheckdate(String checkdate) {
		this.checkdate = checkdate;
	}

	public String getSqsprenid() {
		return sqsprenid;
	}

	public void setSqsprenid(String sqsprenid) {
		this.sqsprenid = sqsprenid;
	}

	public String getSqsprenname() {
		return sqsprenname;
	}

	public void setSqsprenname(String sqsprenname) {
		this.sqsprenname = sqsprenname;
	}

	private List<XzfyInfo> shenpiList;

	public void setShenpiList(List<XzfyInfo> shenpiList) {
		this.shenpiList = shenpiList;
	}

	public List<XzfyInfo> getShenpiList() {
		return shenpiList;
	}

	public void setShenpilist(List shenpilist) {
		this.shenpilist = shenpilist;
	}

	public List getShenpilist() {
		return shenpilist;
	}

	public void setXzfyshenpi(XzfyShenpi xzfyshenpi) {
		this.xzfyshenpi = xzfyshenpi;
	}

	public XzfyShenpi getXzfyshenpi() {
		return xzfyshenpi;
	}

	public String updateshenpi1() {
		xzfyshenpi = new XzfyShenpi();
		xzfyshenpi = xzfyService.getShenpiById(shenpiid);
		xzfyInfo = xzfyService.getXzfyById(xzfyId);
		return SUCCESS;
	}

	public String updateshenpi2() {
		xzfyshenpi = new XzfyShenpi();
		xzfyshenpi = xzfyService.getShenpiById(shenpiid);
		xzfyInfo = xzfyService.getXzfyById(xzfyId);
		return SUCCESS;
	}

	public String doUpdateshenpi() {
		xzfyInfo = new XzfyInfo();
		xzfyInfo.setId(xzfyId);
		xzfyshenpi.setXzfyInfo(xzfyInfo);
		xzfyService.update(xzfyshenpi);
		return SUCCESS;
	}

	public XzfyRecieve getXzfyReceive() {
		return xzfyReceive;
	}

	public void setXzfyReceive(XzfyRecieve xzfyReceive) {
		this.xzfyReceive = xzfyReceive;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public List getOrgList() {
		return orgList;
	}

	public void setOrgList(List orgList) {
		this.orgList = orgList;
	}

	public List getSuborgList() {
		return suborgList;
	}

	public void setSuborgList(List suborgList) {
		this.suborgList = suborgList;
	}

	public List<XzfyInfo> getWeibanjieList() {
		return weibanjieList;
	}

	public void setWeibanjieList(List<XzfyInfo> weibanjieList) {
		this.weibanjieList = weibanjieList;
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

	public BsqrService getBsqrService() {
		return bsqrService;
	}

	public void setBsqrService(BsqrService bsqrService) {
		this.bsqrService = bsqrService;
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

	public List getCaseAllList() {
		return caseAllList;
	}

	public void setCaseAllList(List caseAllList) {
		this.caseAllList = caseAllList;
	}

	public String getLocbm() {
		return locbm;
	}

	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}

	public Number getUserid() {
		return userid;
	}

	public void setUserid(Number userid) {
		this.userid = userid;
	}

	public Number getOrgid() {
		return orgid;
	}

	public void setOrgid(Number orgid) {
		this.orgid = orgid;
	}

	public String getBumen() {
		return bumen;
	}

	public void setBumen(String bumen) {
		this.bumen = bumen;
	}

	public String getSubbumen() {
		return subbumen;
	}

	public void setSubbumen(String subbumen) {
		this.subbumen = subbumen;
	}

	public List<ArticleInfo> getArticleInfoList1() {
		return articleInfoList1;
	}

	public void setArticleInfoList1(List<ArticleInfo> articleInfoList1) {
		this.articleInfoList1 = articleInfoList1;
	}

	public List<ArticleInfo> getArticleInfoList2() {
		return articleInfoList2;
	}

	public void setArticleInfoList2(List<ArticleInfo> articleInfoList2) {
		this.articleInfoList2 = articleInfoList2;
	}

	public List<ArticleInfo> getArticleInfoList3() {
		return articleInfoList3;
	}

	public void setArticleInfoList3(List<ArticleInfo> articleInfoList3) {
		this.articleInfoList3 = articleInfoList3;
	}

	public List<ArticleInfo> getArticleInfoList4() {
		return articleInfoList4;
	}

	public void setArticleInfoList4(List<ArticleInfo> articleInfoList4) {
		this.articleInfoList4 = articleInfoList4;
	}

	public List<ArticleInfo> getArticleInfoList5() {
		return articleInfoList5;
	}

	public void setArticleInfoList5(List<ArticleInfo> articleInfoList5) {
		this.articleInfoList5 = articleInfoList5;
	}

	public List<ArticleInfo> getArticleInfoList6() {
		return articleInfoList6;
	}

	public void setArticleInfoList6(List<ArticleInfo> articleInfoList6) {
		this.articleInfoList6 = articleInfoList6;
	}

	public List<ArticleInfo> getArticleInfoList7() {
		return articleInfoList7;
	}

	public void setArticleInfoList7(List<ArticleInfo> articleInfoList7) {
		this.articleInfoList7 = articleInfoList7;
	}

	public List<ArticleInfo> getArticleInfoList8() {
		return articleInfoList8;
	}

	public void setArticleInfoList8(List<ArticleInfo> articleInfoList8) {
		this.articleInfoList8 = articleInfoList8;
	}

	public String getDaoqi() {
		return daoqi;
	}

	public void setDaoqi(String daoqi) {
		this.daoqi = daoqi;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTimem() {
		return timem;
	}

	public void setTimem(String timem) {
		this.timem = timem;
	}

	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public String getMonths() {
		return months;
	}

	public void setMonths(String months) {
		this.months = months;
	}
	
	
	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}
	

	

	public List<String> getVacationsDaysList() {
		return vacationsDaysList;
	}

	public void setVacationsDaysList(List<String> vacationsDaysList) {
		this.vacationsDaysList = vacationsDaysList;
	}

	public String getUpFile1FileName() {
		return upFile1FileName;
	}

	public void setUpFile1FileName(String upFile1FileName) {
		this.upFile1FileName = upFile1FileName;
	}

	public String[] getUpFile2FileName() {
		return upFile2FileName;
	}

	public void setUpFile2FileName(String[] upFile2FileName) {
		this.upFile2FileName = upFile2FileName;
	}

	public void setDeputy(List<String> deputy) {
		this.deputy = deputy;
	}

	public List<String> getDeputy() {
		return deputy;
	}

	public XzfyService getXzfyService() {
		return xzfyService;
	}

	public void setXzfyService(XzfyService xzfyService) {
		this.xzfyService = xzfyService;
	}

	private List<XzfyInfo> xzfyList;

	// 公共方法

	public List<XzfyInfo> getXzfyList() {
		return xzfyList;
	}

	public void setXzfyList(List<XzfyInfo> xzfyList) {
		this.xzfyList = xzfyList;
	}

	public File getUpFile1() {
		return upFile1;
	}

	public void setUpFile1(File upFile1) {
		this.upFile1 = upFile1;
	}

	public File[] getUpFile2() {
		return upFile2;
	}

	public void setUpFile2(File[] upFile2) {
		this.upFile2 = upFile2;
	}

	public String getTotalOfJdRenShu() {
		return totalOfJdRenShu;
	}

	public void setTotalOfJdRenShu(String totalOfJdRenShu) {
		this.totalOfJdRenShu = totalOfJdRenShu;
	}

	public String getTotalOfJdPiCi() {
		return totalOfJdPiCi;
	}

	public void setTotalOfJdPiCi(String totalOfJdPiCi) {
		this.totalOfJdPiCi = totalOfJdPiCi;
	}

	public XzfyStatisticsService getXzfyStatisticsService() {
		return xzfyStatisticsService;
	}

	public void setXzfyStatisticsService(
			XzfyStatisticsService xzfyStatisticsService) {
		this.xzfyStatisticsService = xzfyStatisticsService;
	}

	public String getReceivedTotalOfCases() {
		return receivedTotalOfCases;
	}

	public void setReceivedTotalOfCases(String receivedTotalOfCases) {
		this.receivedTotalOfCases = receivedTotalOfCases;
	}

	public String getReceivedTotalOfRegistered() {
		return receivedTotalOfRegistered;
	}

	public void setReceivedTotalOfRegistered(String receivedTotalOfRegistered) {
		this.receivedTotalOfRegistered = receivedTotalOfRegistered;
	}

	public String getReceivedTotalOfPreDealt() {
		return receivedTotalOfPreDealt;
	}

	public void setReceivedTotalOfPreDealt(String receivedTotalOfPreDealt) {
		this.receivedTotalOfPreDealt = receivedTotalOfPreDealt;
	}

	public String getAcceptedFuYiCases() {
		return acceptedFuYiCases;
	}

	public void setAcceptedFuYiCases(String acceptedFuYiCases) {
		this.acceptedFuYiCases = acceptedFuYiCases;
	}

	public String getPreserve() {
		return preserve;
	}

	public void setPreserve(String preserve) {
		this.preserve = preserve;
	}

	public String getRevocation() {
		return revocation;
	}

	public void setRevocation(String revocation) {
		this.revocation = revocation;
	}

	public String getMofify() {
		return mofify;
	}

	public void setMofify(String mofify) {
		this.mofify = mofify;
	}

	public String getIllegal() {
		return illegal;
	}

	public void setIllegal(String illegal) {
		this.illegal = illegal;
	}

	public String getReject() {
		return reject;
	}

	public void setReject(String reject) {
		this.reject = reject;
	}

	public String getExecutionInOrder() {
		return executionInOrder;
	}

	public void setExecutionInOrder(String executionInOrder) {
		this.executionInOrder = executionInOrder;
	}

	public String getReconciliation() {
		return reconciliation;
	}

	public void setReconciliation(String reconciliation) {
		this.reconciliation = reconciliation;
	}

	public String getTermination() {
		return termination;
	}

	public void setTermination(String termination) {
		this.termination = termination;
	}

	public String getOtherDeals() {
		return otherDeals;
	}

	public void setOtherDeals(String otherDeals) {
		this.otherDeals = otherDeals;
	}

	public String getXmlString1() {
		return xmlString1;
	}

	public void setXmlString1(String xmlString1) {
		this.xmlString1 = xmlString1;
	}

	public String getXmlString2() {
		return xmlString2;
	}

	public void setXmlString2(String xmlString2) {
		this.xmlString2 = xmlString2;
	}

	public String getCountType() {
		return countType;
	}

	public void setCountType(String countType) {
		this.countType = countType;
	}

	public String getCountTitle() {
		return countTitle;
	}

	public void setCountTitle(String countTitle) {
		this.countTitle = countTitle;
	}

	public String getXingcheng() {
		return xingcheng;
	}

	public void setXingcheng(String xingcheng) {
		this.xingcheng = xingcheng;
	}

	public String getJiedaimudi() {
		return jiedaimudi;
	}

	public void setJiedaimudi(String jiedaimudi) {
		this.jiedaimudi = jiedaimudi;
	}

	public String getShoudaoshijian() {
		return shoudaoshijian;
	}

	public void setShoudaoshijian(String shoudaoshijian) {
		this.shoudaoshijian = shoudaoshijian;
	}

	public String getShoudaofangshi() {
		return shoudaofangshi;
	}

	public void setShoudaofangshi(String shoudaofangshi) {
		this.shoudaofangshi = shoudaofangshi;
	}

	public String getXzfyNewId() {
		return xzfyNewId;
	}

	public void setXzfyNewId(String xzfyNewId) {
		this.xzfyNewId = xzfyNewId;
	}


	public BananService getBananService() {
		return bananService;
	}

	public void setBananService(BananService bananService) {
		this.bananService = bananService;
	}

	public List<Xw> getXwList() {
		return xwList;
	}

	public void setXwList(List<Xw> xwList) {
		this.xwList = xwList;
	}

	public String getXwNum() {
		return xwNum;
	}

	public void setXwNum(String xwNum) {
		this.xwNum = xwNum;
	}

	public String getXwName() {
		return xwName;
	}

	public void setXwName(String xwName) {
		this.xwName = xwName;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getN1() {
		return n1;
	}

	public void setN1(String n1) {
		this.n1 = n1;
	}

	public String getN2() {
		return n2;
	}

	public void setN2(String n2) {
		this.n2 = n2;
	}

	public PaginationSupport getPageList1() {
		return pageList1;
	}

	public void setPageList1(PaginationSupport pageList1) {
		this.pageList1 = pageList1;
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

	public String getUpBm() {
		return upBm;
	}

	public void setUpBm(String upBm) {
		this.upBm = upBm;
	}

	public String getUpName() {
		return upName;
	}

	public void setUpName(String upName) {
		this.upName = upName;
	}

	public String getLocalBm() {
		return localBm;
	}

	public void setLocalBm(String localBm) {
		this.localBm = localBm;
	}

	public String getLocalName() {
		return localName;
	}

	public String getLx_nian() {
		return lx_nian;
	}

	public void setLx_nian(String lx_nian) {
		this.lx_nian = lx_nian;
	}

	public String getLx_yue() {
		return lx_yue;
	}

	public void setLx_yue(String lx_yue) {
		this.lx_yue = lx_yue;
	}

	public String getLx_ri() {
		return lx_ri;
	}

	public void setLx_ri(String lx_ri) {
		this.lx_ri = lx_ri;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
	}

	public String getSljg() {
		return sljg;
	}

	public void setSljg(String sljg) {
		this.sljg = sljg;
	}
	/**
	 * 获得Diciionary
	 */
	public Map getDictMapByFyLv(String abbr) {
		User user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		user = (User) this.coreService.loadEntityObjectById(User.class,
				user.getId());
		Org org = (Org) this.coreService.loadEntityObjectById(Org.class,
				user.getOrg().getId());
		Map dictMap = new LinkedHashMap();
		List tempList = new ArrayList();
		if (org.getFyLv() == 1) {
			tempList = this.coreService
					.find("from DictItem t where t.value in ('1','2','3','4','5','6','7','8') and t.dict.abbr= '"
							+ abbr + "' order by t.seq");
		}
		if (org.getFyLv() == 2) {
			tempList = this.coreService
			.find("from DictItem t where t.value in ('4','8') and t.dict.abbr= '"
					+ abbr + "' order by t.seq");
		}
		if (org.getFyLv() == 3) {
			tempList = this.coreService
			.find("from DictItem t where t.value in ('4','5','6','7','8') and t.dict.abbr= '"
					+ abbr + "' order by t.seq");
		}
		if (org.getFyLv() == 4) {
			tempList = this.coreService
			.find("from DictItem t where t.value in ('6','8') and t.dict.abbr= '"
					+ abbr + "' order by t.seq");
		}
		if (tempList.size() > 0) {
			Iterator iter = tempList.iterator();
			while (iter.hasNext()) {
				DictItem item = (DictItem) iter.next();
				dictMap.put(item.getValue(), item.getName());
			}
		}
		return dictMap;
	}

	public List<Beishenqingren> getZlList() {
		return zlList;
	}

	public void setZlList(List<Beishenqingren> zlList) {
		this.zlList = zlList;
	}

	public List<Beishenqingren> getbList() {
		return bList;
	}

	public void setbList(List<Beishenqingren> bList) {
		this.bList = bList;
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

	public String getUs() {
		return us;
	}

	public void setUs(String us) {
		this.us = us;
	}

	public ArrayList<String> getDiv51List() {
		return div51List;
	}

	public void setDiv51List(ArrayList<String> div51List) {
		this.div51List = div51List;
	}

	public List getUsers() {
		return users;
	}

	public void setUsers(List users) {
		this.users = users;
	}

	public String getTodayShow() {
		return todayShow;
	}

	public void setTodayShow(String todayShow) {
		this.todayShow = todayShow;
	}

	public ArrayList<XzfyInfo> getDiv52List() {
		return div52List;
	}

	public void setDiv52List(ArrayList<XzfyInfo> div52List) {
		this.div52List = div52List;
	}

	public String getUs2() {
		return us2;
	}

	public void setUs2(String us2) {
		this.us2 = us2;
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

	public List getKeywordList() {
		return keywordList;
	}

	public void setKeywordList(List keywordList) {
		this.keywordList = keywordList;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public XzfyBuwei getXzfyBuwei() {
		return xzfyBuwei;
	}

	public void setXzfyBuwei(XzfyBuwei xzfyBuwei) {
		this.xzfyBuwei = xzfyBuwei;
	}

	public File getBuweiUpFile0() {
		return buweiUpFile0;
	}

	public void setBuweiUpFile0(File buweiUpFile0) {
		this.buweiUpFile0 = buweiUpFile0;
	}

	public String getBuweiUpFile0FileName() {
		return buweiUpFile0FileName;
	}

	public void setBuweiUpFile0FileName(String buweiUpFile0FileName) {
		this.buweiUpFile0FileName = buweiUpFile0FileName;
	}

	public File getBuweiUpFile1() {
		return buweiUpFile1;
	}

	public void setBuweiUpFile1(File buweiUpFile1) {
		this.buweiUpFile1 = buweiUpFile1;
	}

	public String getBuweiUpFile1FileName() {
		return buweiUpFile1FileName;
	}

	public void setBuweiUpFile1FileName(String buweiUpFile1FileName) {
		this.buweiUpFile1FileName = buweiUpFile1FileName;
	}

	public File getBuweiUpFile2() {
		return buweiUpFile2;
	}

	public void setBuweiUpFile2(File buweiUpFile2) {
		this.buweiUpFile2 = buweiUpFile2;
	}

	public String getBuweiUpFile2FileName() {
		return buweiUpFile2FileName;
	}

	public void setBuweiUpFile2FileName(String buweiUpFile2FileName) {
		this.buweiUpFile2FileName = buweiUpFile2FileName;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public InputStream getDocStream() {
		return docStream;
	}

	public void setDocStream(InputStream docStream) {
		this.docStream = docStream;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getFileName0() {
		return fileName0;
	}

	public void setFileName0(String fileName0) {
		this.fileName0 = fileName0;
	}

	public String getStoredName0() {
		return storedName0;
	}

	public void setStoredName0(String storedName0) {
		this.storedName0 = storedName0;
	}

	public String getStoredLocation0() {
		return storedLocation0;
	}

	public void setStoredLocation0(String storedLocation0) {
		this.storedLocation0 = storedLocation0;
	}

	public String getFileName1() {
		return fileName1;
	}

	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}

	public String getStoredName1() {
		return storedName1;
	}

	public void setStoredName1(String storedName1) {
		this.storedName1 = storedName1;
	}

	public String getStoredLocation1() {
		return storedLocation1;
	}

	public void setStoredLocation1(String storedLocation1) {
		this.storedLocation1 = storedLocation1;
	}

	public String getFileName2() {
		return fileName2;
	}

	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}

	public String getStoredName2() {
		return storedName2;
	}

	public void setStoredName2(String storedName2) {
		this.storedName2 = storedName2;
	}

	public String getStoredLocation2() {
		return storedLocation2;
	}

	public void setStoredLocation2(String storedLocation2) {
		this.storedLocation2 = storedLocation2;
	}

	public String getUnReceived() {
		return unReceived;
	}

	public void setUnReceived(String unReceived) {
		this.unReceived = unReceived;
	}

	public String getNotified() {
		return notified;
	}

	public void setNotified(String notified) {
		this.notified = notified;
	}

	public String getRefused() {
		return refused;
	}

	public void setRefused(String refused) {
		this.refused = refused;
	}

	public String getOthers() {
		return others;
	}

	public void setOthers(String others) {
		this.others = others;
	}

	public String getGuofabanFN() {
		return guofabanFN;
	}

	public void setGuofabanFN(String guofabanFN) {
		this.guofabanFN = guofabanFN;
	}

	public String getFaceRecep() {
		return faceRecep;
	}

	public void setFaceRecep(String faceRecep) {
		this.faceRecep = faceRecep;
	}

	public String getLetterRecep() {
		return letterRecep;
	}

	public void setLetterRecep(String letterRecep) {
		this.letterRecep = letterRecep;
	}

	public String getTotalCurrent() {
		return totalCurrent;
	}

	public void setTotalCurrent(String totalCurrent) {
		this.totalCurrent = totalCurrent;
	}

	public String getScan() {
		return scan;
	}

	public void setScan(String scan) {
		this.scan = scan;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getTransfer() {
		return transfer;
	}

	public void setTransfer(String transfer) {
		this.transfer = transfer;
	}

	public String getChat() {
		return chat;
	}

	public void setChat(String chat) {
		this.chat = chat;
	}


	public List<Meet> getMeetList() {
		return meetList;
	}

	public void setMeetList(List<Meet> meetList) {
		this.meetList = meetList;
	}

	public XzfyRecieve getBuzhengInfo() {
		return buzhengInfo;
	}

	public void setBuzhengInfo(XzfyRecieve buzhengInfo) {
		this.buzhengInfo = buzhengInfo;
	}

	public ArrayList<ArrayList<ArrayList<String>>> getInformList() {
		return informList;
	}

	public void setInformList(ArrayList<ArrayList<ArrayList<String>>> informList) {
		this.informList = informList;
	}

	public ArrayList<ArrayList<String>> getInformList1() {
		return informList1;
	}

	public void setInformList1(ArrayList<ArrayList<String>> informList1) {
		this.informList1 = informList1;
	}

	public ArrayList<ArrayList<String>> getInformList2() {
		return informList2;
	}

	public void setInformList2(ArrayList<ArrayList<String>> informList2) {
		this.informList2 = informList2;
	}


}
