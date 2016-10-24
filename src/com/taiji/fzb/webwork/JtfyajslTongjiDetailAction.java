package com.taiji.fzb.webwork;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.Beishenqingren;
import com.taiji.fzb.domain.XzfyCompany;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.BananService;
import com.taiji.fzb.service.JtfyajslTongjiService;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzfyService;
import com.taiji.user.domain.Org;
import com.util.DateUtil;
import com.util.JdbcUtil;

public class JtfyajslTongjiDetailAction extends ProtectedDetailAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String startDate;
	private String endDate;
	private String sysDate;
	private String startDateShow;
	private String endDateShow;
	public String getSysDate() {
		return sysDate;
	}
	public void setSysDate(String sysDate) {
		this.sysDate = sysDate;
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

	private ArrayList<ArrayList<String>> monthList = new ArrayList<ArrayList<String>>();
	private ArrayList<ArrayList<String>> dataList = new ArrayList<ArrayList<String>>();
	private ArrayList heji = new ArrayList();
	public ArrayList getHeji() {
		return heji;
	}
	public void setHeji(ArrayList heji) {
		this.heji = heji;
	}

	private JtfyajslTongjiService jtfyajslTongjiService = null;
	
	public String jtfyajslTongji() throws Exception{
		Date date=new Date();
		sysDate=DateUtil.getDatestrByDateFormat(date,"yyyy年MM月dd日 HH时mm分");
		if (null != startDate && !"".equals(startDate)) {
			startDateShow =DateUtil.getDateByFormat(startDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		}
		if (null != endDate && !"".equals(endDate)) {
			endDateShow =DateUtil.getDateByFormat(endDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		}
		monthList = getMonthList(startDate,endDate);
		dataList = jtfyajslTongjiService.getJtfyajslTongjiData(monthList);
		for(int i=2;i<14;i++){
			int k=0;
			for(int j=0;j<dataList.size();j++){
				k+=Integer.valueOf(!dataList.get(j).get(i).equals("null")?dataList.get(j).get(i):"0");
				if(j==dataList.size()-1){
					heji.add(k);
				}
			}
			
		}
		return SUCCESS;
	}
	public JtfyajslTongjiService getJtfyajslTongjiService() {
		return jtfyajslTongjiService;
	}
	public void setJtfyajslTongjiService(JtfyajslTongjiService jtfyajslTongjiService) {
		this.jtfyajslTongjiService = jtfyajslTongjiService;
	}
	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
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
	public ArrayList<ArrayList<String>> getMonthList() {
		return monthList;
	}
	public void setMonthList(ArrayList<ArrayList<String>> monthList) {
		this.monthList = monthList;
	}
	public ArrayList<ArrayList<String>> getDataList() {
		return dataList;
	}
	public void setDataList(ArrayList<ArrayList<String>> dataList) {
		this.dataList = dataList;
	}
	public ArrayList<ArrayList<String>> getMonthList(String startDate,String endDate) throws ParseException{   //根据其实日期获得形如[2013,12,2013-12-01,2013-12-31]的ArrayList<ArrayList<String>
		
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");

			ArrayList<ArrayList<String>> arrayList = new ArrayList<ArrayList<String>>();
			Date date1 = f.parse(startDate);
			Calendar sCal = Calendar.getInstance();
			sCal.setTime(date1);
			Date date2 = f.parse(endDate);
			Calendar eCal = Calendar.getInstance();
			eCal.setTime(date2);
			int sYear = sCal.get(Calendar.YEAR);
			int sMonth = sCal.get(Calendar.MONTH)+1;
			int eYear = eCal.get(Calendar.YEAR);
			int eMonth=eCal.get(Calendar.MONTH)+1;
			int yearToGo = eYear-sYear;
			int monthToGO = eMonth-sMonth;
			if(yearToGo==0){
				if(monthToGO==0){
					ArrayList<String> myDateList = new ArrayList<String>();
					myDateList.add(String.valueOf(sYear));
					myDateList.add(String.valueOf(sMonth));
					myDateList.add(startDate);
					myDateList.add(endDate);
					arrayList.add(myDateList);
				}else{
					for(int i=sMonth;i<=eMonth;i++){
						ArrayList<String> myDateList = new ArrayList<String>();
						myDateList.add(String.valueOf(sYear));
						myDateList.add(String.valueOf(i));
						if(i==sMonth){
							myDateList.add(startDate);
						}else{
							if(i<10)
								myDateList.add(String.valueOf(sYear)+"-0"+String.valueOf(i)+"-"+"01");
							else
								myDateList.add(String.valueOf(sYear)+"-"+String.valueOf(i)+"-"+"01");
						}
						if(i==eMonth){
							myDateList.add(endDate);
						}else{
							int lastDay = getLastDayOfMonth(eYear,i);
							if(i<10)
								myDateList.add(String.valueOf(eYear)+"-0"+String.valueOf(i)+"-"+String.valueOf(lastDay));
							else
								myDateList.add(String.valueOf(eYear)+"-"+String.valueOf(i)+"-"+String.valueOf(lastDay));
						}
						arrayList.add(myDateList);
					}
				}
			}else{
				for(int i=0;i<=yearToGo;i++){
					if(i==0){
						for(int j=sMonth;j<=12;j++){
							ArrayList<String> myDateList = new ArrayList<String>();
							myDateList.add(String.valueOf(sYear));
							myDateList.add(String.valueOf(j));
							if(j==sMonth){
								myDateList.add(startDate);
							}else{
								if(j<10)
									myDateList.add(String.valueOf(sYear)+"-0"+String.valueOf(j)+"-"+"01");
								else
									myDateList.add(String.valueOf(sYear)+"-"+String.valueOf(j)+"-"+"01");
							}
							int lastDay = getLastDayOfMonth(sYear,j);
							if(j<10)
								myDateList.add(String.valueOf(sYear)+"-0"+String.valueOf(j)+"-"+String.valueOf(lastDay));
							else
								myDateList.add(String.valueOf(sYear)+"-"+String.valueOf(j)+"-"+String.valueOf(lastDay));
							arrayList.add(myDateList);	
						}
					}else if(i>0&&i<yearToGo){
						for(int j=1;j<=12;j++){
							ArrayList<String> myDateList = new ArrayList<String>();
							myDateList.add(String.valueOf(sYear+i));
							myDateList.add(String.valueOf(j));
							if(j<10)
								myDateList.add(String.valueOf(sYear+i)+"-0"+String.valueOf(j)+"-"+"01");
							else
								myDateList.add(String.valueOf(sYear+i)+"-"+String.valueOf(j)+"-"+"01");
							int lastDay = getLastDayOfMonth(sYear+i,j);
							if(j<10)
								myDateList.add(String.valueOf(sYear+i)+"-0"+String.valueOf(j)+"-"+String.valueOf(lastDay));
							else
								myDateList.add(String.valueOf(sYear+i)+"-"+String.valueOf(j)+"-"+String.valueOf(lastDay));
							arrayList.add(myDateList);
						}
						
					}else{
						for(int j=1;j<=eMonth;j++){
							ArrayList<String> myDateList = new ArrayList<String>();
							myDateList.add(String.valueOf(eYear));
							myDateList.add(String.valueOf(j));
							if(j<10)
								myDateList.add(String.valueOf(eYear)+"-0"+String.valueOf(j)+"-"+"01");
							else
								myDateList.add(String.valueOf(eYear)+"-"+String.valueOf(j)+"-"+"01");
							if(j==eMonth){
								myDateList.add(endDate);
							}else{
								int lastDay = getLastDayOfMonth(eYear+i,j);
								if(j<10)
									myDateList.add(String.valueOf(eYear)+"-0"+String.valueOf(j)+"-"+String.valueOf(lastDay));
								else
									myDateList.add(String.valueOf(eYear)+"-"+String.valueOf(j)+"-"+String.valueOf(lastDay));
							}
							arrayList.add(myDateList);	
						}
						
					}
				}
			}
	
		return arrayList;
		 
	}
	public  int getLastDayOfMonth(int year, int month) {
		if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
			return 31;
		}
		if (month == 4 || month == 6 || month == 9 || month == 11) {
			return 30;
		}
		if (month == 2) {
			if (isLeapYear(year)) {
				return 29;
			} else {
				return 28;
			}
		}
		return 0;
	}

	/**
	 * 是否闰年
	 * 
	 * @param year
	 *            年
	 * @return
	 */
	public boolean isLeapYear(int year) {
		return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
	}
	/*--------------------------END  集体复议案件数量统计-----------------------------------------------*/
	
	
	/*--------------------------START  多人分别复议同一具体行政行为统计-----------------------------------------------*/
	private String appName;
	private String xwName;
	private String xwNum;
	private String defendantName;
	private int pageNum=1;
	private int totalPage;
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

	private List<String> dataList1 = new ArrayList<String>();
	private List<XzfyInfo> xzfyInfoList = new ArrayList<XzfyInfo>();
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	public PaginationSupport getPageList() {
		return pageList;
	}
	public void setPageList(PaginationSupport pageList) {
		this.pageList = pageList;
	}
	public List<XzfyInfo> getXzfyInfoList() {
		return xzfyInfoList;
	}
	public void setXzfyInfoList(List<XzfyInfo> xzfyInfoList) {
		this.xzfyInfoList = xzfyInfoList;
	}
	public String getAppName() {
		return appName;
	}
	public void setAppName(String appName) {
		this.appName = appName;
	}
	public String getXwName() {
		return xwName;
	}
	public void setXwName(String xwName) {
		this.xwName = xwName;
	}
	public String getXwNum() {
		return xwNum;
	}
	public void setXwNum(String xwNum) {
		this.xwNum = xwNum;
	}
	public String getDefendantName() {
		return defendantName;
	}
	public void setDefendantName(String defendantName) {
		this.defendantName = defendantName;
	}
	public List<String> getDataList1() {
		return dataList1;
	}
	public void setDataList1(List<String> dataList1) {
		this.dataList1 = dataList1;
	}
	public String searchDataList() throws Exception{
		/*appName = new String(appName.getBytes("iso-8859-1"), "utf-8");
		xwName = new String(xwName.getBytes("iso-8859-1"), "utf-8");
		xwNum = new String(xwNum.getBytes("iso-8859-1"), "utf-8");
		defendantName = new String(defendantName.getBytes("iso-8859-1"), "utf-8");
		System.out.println(appName);
		System.out.println(xwName);
		System.out.println(xwNum);
		System.out.println(defendantName);*/
		dataList1 = jtfyajslTongjiService.getTongjiData1(appName, xwName, xwNum, defendantName);
		//dataList1 = pageList.getItems();
		totalPage = dataList1.size();
		return SUCCESS;
	}
	public String xzfyInfoList() throws Exception{
		//appName = new String(appName.getBytes("iso-8859-1"), "utf-8");
		xwName = new String(xwName.getBytes("iso-8859-1"), "utf-8");
		xwNum = new String(xwNum.getBytes("iso-8859-1"), "utf-8");
		defendantName = new String(defendantName.getBytes("iso-8859-1"), "utf-8");
		pageList = jtfyajslTongjiService.getXzfyInfoList(pageNum,100,appName, xwName, xwNum, defendantName);
		xzfyInfoList = pageList.getItems();
		totalPage = pageList.getTotalPage();
		return SUCCESS;
	}
	private String tongJiType="";
	private String locbm="";
	private String shixiang="";
	private String xwname="";
	private String keyword="";
	private String receiveYear="";
	private String status="";
	private RecordService recordService = null;
	private List arrayList = new ArrayList();
	private List keywordList = new ArrayList();
	private BananService bananService = null;
	private List<Beishenqingren> bList = new ArrayList<Beishenqingren>();
	private String orgName;

	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	private XzfyService xzfyService = null;
	public List<Beishenqingren> getbList() {
		return bList;
	}
	public void setbList(List<Beishenqingren> bList) {
		this.bList = bList;
	}
	public XzfyService getXzfyService() {
		return xzfyService;
	}
	public void setXzfyService(XzfyService xzfyService) {
		this.xzfyService = xzfyService;
	}
	public List getKeywordList() {
		return keywordList;
	}
	public void setKeywordList(List keywordList) {
		this.keywordList = keywordList;
	}
	public BananService getBananService() {
		return bananService;
	}
	public void setBananService(BananService bananService) {
		this.bananService = bananService;
	}
	public List getArrayList() {
		return arrayList;
	}
	public void setArrayList(List arrayList) {
		this.arrayList = arrayList;
	}
	public RecordService getRecordService() {
		return recordService;
	}
	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}
	public String getTongJiType() {
		return tongJiType;
	}
	public void setTongJiType(String tongJiType) {
		this.tongJiType = tongJiType;
	}
	public String getLocbm() {
		return locbm;
	}
	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}
	public String getShixiang() {
		return shixiang;
	}
	public void setShixiang(String shixiang) {
		this.shixiang = shixiang;
	}
	public String getXwname() {
		return xwname;
	}
	public void setXwname(String xwname) {
		this.xwname = xwname;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getReceiveYear() {
		return receiveYear;
	}
	public void setReceiveYear(String receiveYear) {
		this.receiveYear = receiveYear;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String enterMoKuai4(){
		locbm = recordService.getOrg().getLocbm();
		Org org=this.recordService.getRootOrg(recordService.getOrg().getLocbm());
		
		setXzfyCom(this.recordService.getXzfyComById(org.getLocbm(),org.getName()));
		localBm = org.getLocbm();
		localName = org.getName();
		if (localBm.substring(2).equals("00")){
			upBm="0000";
		} else {
			upBm=localBm.substring(0,2)+"00";
		}
		Org rootOrg=this.recordService.getRootOrg(upBm);
		upName=rootOrg.getName();
		//bList = xzfyService.getBsqrName("7", locbm,bList);
		//b1List = xzfyService.getBsqrName("5", locbm,b1List);
		//b2List = xzfyService.getBsqrName("6", locbm,b2List);
		//allList=recordService.getCaseOrgList();
		setFileId1(this.recordService.getOrg().getLocbm());
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String tongJiMoKuai4() throws Exception{
		if(tongJiType.equals("1")){
			dataList = jtfyajslTongjiService.getTongjiForm15(locbm, appName, shixiang, xwname, keyword, receiveYear, status);
			keywordList=bananService.getXzfyKeywordListByLocbm(locbm);
			return "tongji_form15_success";
		}else if(tongJiType.equals("3")){
			dataList = jtfyajslTongjiService.getTongjiForm15(locbm, appName, shixiang, xwname, keyword, receiveYear, status);
			keywordList=bananService.getXzfyKeywordListByLocbm(locbm);
			return "tongji_form17_success";
		}else if(tongJiType.equals("5")){
			List<String> subCode  = getSub(locbm);
			orgName = recordService.getRootOrg(locbm).getName();
			List<String> govCode = new ArrayList<String>();
			for(int i =0;i<subCode.size();i++){
				String code = subCode.get(i).toString().substring(0, 2);
				govCode.add(code+"00");
				if(code.equals("01")){arrayList.add("东城");}else if(code.equals("02")){arrayList.add("西城");}else if(code.equals("05")){arrayList.add("朝阳");}else if(code.equals("06")){arrayList.add("海淀");}
				else if(code.equals("07")){arrayList.add("丰台");}else if(code.equals("08")){arrayList.add("石景山");}else if(code.equals("09")){arrayList.add("门头沟");}else if(code.equals("10")){arrayList.add("房山");}
				else if(code.equals("11")){arrayList.add("通州");}else if(code.equals("12")){arrayList.add("顺义");}else if(code.equals("13")){arrayList.add("大兴");}else if(code.equals("14")){arrayList.add("昌平");}
				else if(code.equals("15")){arrayList.add("平谷");}else if(code.equals("16")){arrayList.add("怀柔");}else if(code.equals("17")){arrayList.add("密云");}else if(code.equals("18")){arrayList.add("延庆");}
			}
			arrayList.add("总计");
			dataList = jtfyajslTongjiService.getTongjiForm19(govCode,subCode,locbm,shixiang,startDate,endDate);
			Date date = new Date();
			sysDate = DateUtil.getDatestrByDateFormat(date, "yyyy年MM月dd日 HH时mm分");
			startDateShow = DateUtil.getDateByFormat(startDate, "yyyy-MM-dd", "yyyy年MM月dd日");
			endDateShow = DateUtil.getDateByFormat(endDate, "yyyy-MM-dd", "yyyy年MM月dd日");
			return "tongji_form19_success";
		}else{
			return ERROR;
		}
	}
	@SuppressWarnings("unchecked")
	public List getSub(String locbm) throws Exception{
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement = connection.createStatement();
		ResultSet resultSet = null;
		List<String> list = new ArrayList<String>();
		try{
			String sql = "select distinct org_locbm from u_org where org_manage = '"+locbm+"' and org_locbm like '____' order by org_locbm";
			resultSet = selectStatement.executeQuery(sql);
			while(resultSet.next()){
				//List tmp = new ArrayList();
				list.add(resultSet.getString(1));
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally{
			if (selectStatement != null) {
				selectStatement.close();
				selectStatement = null;
			}
			if (connection != null) {
				connection.close();
				connection = null;

			}
		}
		return list;
	}
	
	
	
	
	
	
	private String upBm = "";
	private String upName = "";
	private String localName = "";
	private String localBm = "";
	private int fileId=0;
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

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
	
	/*******************统计模块五    复议办案指标统计     表23：是否及时填写结案信息监控 ****************************/
	private String jktype;
	private String hengxiangtype;
	private String xmlString;
	public String getXmlString() {
		return xmlString;
	}
	public void setXmlString(String xmlString) {
		this.xmlString = xmlString;
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
	public String form23sfjstxjaxxjk(){
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnByHibernateConfig();
			if(jktype.equals("1")){
				xmlString = jtfyajslTongjiService.form23jk1(conn, jktype, hengxiangtype,startDate,endDate);
				if(hengxiangtype.equals("1")){
					jktype="复议机关横向比较（市、区县政府）百分率（%）";
				}else{
					jktype="复议机关横向比较（市政府部门）百分率（%）";
				}
			}else{
				xmlString = jtfyajslTongjiService.form23jk2(conn, locbm,startDate,endDate);
				jktype=orgName+"情况";
			}
			
		}catch(Exception e){
			
		}finally{
			try{
				conn.close();
			}catch (Exception e) {
				
			}
		}
		return SUCCESS;
			
	}
	
	private XzfyCompany xzfyCom;
	private List<Beishenqingren> allList = new ArrayList<Beishenqingren>();
	private List<Beishenqingren> b1List = new ArrayList<Beishenqingren>();
	private List<Beishenqingren> b2List = new ArrayList<Beishenqingren>();
	public String getUpBm() {
		return upBm;
	}
	public void setUpBm(String upBm) {
		this.upBm = upBm;
	}
	public void setUpName(String upName) {
		this.upName = upName;
	}
	public String getUpName() {
		return upName;
	}
	public void setLocalName(String localName) {
		this.localName = localName;
	}
	public String getLocalName() {
		return localName;
	}
	public void setLocalBm(String localBm) {
		this.localBm = localBm;
	}
	public String getLocalBm() {
		return localBm;
	}
	public void setXzfyCom(XzfyCompany xzfyCom) {
		this.xzfyCom = xzfyCom;
	}
	public XzfyCompany getXzfyCom() {
		return xzfyCom;
	}
	public void setB1List(List<Beishenqingren> b1List) {
		this.b1List = b1List;
	}
	public List<Beishenqingren> getB1List() {
		return b1List;
	}
	public void setB2List(List<Beishenqingren> b2List) {
		this.b2List = b2List;
	}
	public List<Beishenqingren> getB2List() {
		return b2List;
	}
	public void setAllList(List<Beishenqingren> allList) {
		this.allList = allList;
	}
	public List<Beishenqingren> getAllList() {
		return allList;
	}
	public void setFileId1(String fileId1) {
		this.fileId1 = fileId1;
	}
	public String getFileId1() {
		return fileId1;
	}
	
	
	
	
	
}
