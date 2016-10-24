package com.taiji.fzb.webwork;

import java.io.File;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import slime.util.IOStream.IOStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.EvidenceAttachment;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyDftz;
import com.taiji.fzb.domain.XzfyShenpi;
import com.taiji.fzb.domain.XzfyXcdc;
import com.taiji.fzb.service.BananService;
import com.taiji.fzb.service.RecordService;
import com.taiji.tzjl.service.TzjlService;
import com.taiji.ashjl.service.AshjlService;
import com.taiji.fzb.service.BsqrService;
import com.taiji.user.domain.User;
import com.taiji.user.domain.Org;







@SuppressWarnings("unchecked")
public class BananDetailAction extends ProtectedDetailAction {

	private static final long serialVersionUID = 1L;
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private Integer pageSize = 12; // 分页列表每页显示个数
	private Integer totalPage = 0; // 分页列表页面总数
	private Integer pNum=1;
	private List allList;
	private BananService bananService = null; // 模板业务层方法
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
	private List<EvidenceAttachment> attchmentList;
	public List<EvidenceAttachment> getAttchmentList() {return attchmentList;}
	public void setAttchmentList(List<EvidenceAttachment> attchmentList) {this.attchmentList = attchmentList;}
	private List shenpirenList;
	public List getShenpirenList() {		return shenpirenList;	}
	public void setShenpirenList(List shenpirenList) {		this.shenpirenList = shenpirenList;	}
	
	private List bananList;
	public List getBananList() {	return bananList;	}
	public void setBananList(List bananList) {	this.bananList = bananList;	}
	
	private List xcdcList;	
	public List getXcdcList() {return xcdcList;	}
	public void setXcdcList(List xcdcList) {		this.xcdcList = xcdcList;	}
	
	private List tzjlList;
	public List getTzjlList() {		return tzjlList;	}
	public void setTzjlList(List tzjlList) {		this.tzjlList = tzjlList;	}
	private List ashjlList;
	public List getAshjlList() {		return ashjlList;	}
	public void setAshjlList(List ashjlList) {		this.ashjlList = ashjlList;	}
	
	private List shenpiList;
	public List getShenpiList() {return shenpiList;}
	public void setShenpiList(List shenpiList) {this.shenpiList = shenpiList;}
	private List shenpiList1;
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

	private List shenpiList2;
	public List getShenpiList2() {return shenpiList2;}
	public void setShenpiList2(List shenpiList2) {this.shenpiList2 = shenpiList2;}
	private List shenpiList3;
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
	
	private List dftzList;
	public List getDftzList() {
		return dftzList;
	}
	public void setDftzList(List dftzList) {
		this.dftzList = dftzList;
	}
	
	/**
	 * 进入创建新模板页面
	 */
/*	public String gotoCreate() {
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
	}*/

	
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
	

	public String banan() {	
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
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
		tzjlList=tzjlService.getTzjlList(tempid,"","","","");
		ashjlList=ashjlService.getAshjlList(tempid,"","","","");
		
		return SUCCESS;
	}


	
	public String showDftzList(){
		dftzList= bananService.getDftzListById(tempid);

		return SUCCESS;
	}
	
	public String savebanan(){
		xzfyInfoold=bananService.getXzfyById(tempid);
		xzfyInfo=bananService.getXzfyById(tempid);
		//!"".equals(this.upFile1FileName)
		if (this.upFile1FileName != null&&!"".equals(this.upFile1FileName) ){
			String webRootPath1 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName1 = this.upFile1FileName;
			String fileName1 = Calendar.getInstance().getTimeInMillis()+"";
			String fileFlod1 = webRootPath1 + "uploadfiles/banan/";
			File outFile1 = new File(fileFlod1 + fileName1);
			xzfyInfo.setTiaojiejilu(realName1);
			xzfyInfo.setTiaojiejilu1("../uploadfiles/banan/" + fileName1);	
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile1, outFile1);
		}		
		if(!"0".equals(tempstatus)&&!"".equals(tempstatus)&&tempstatus != null){xzfyInfo.setStatus(tempstatus);}
		if(!"".equals(tempcheckstatus)){	xzfyInfo.setCheck_status(tempcheckstatus);	}
		if(!"0".equals(checkid)&&!"".equals(checkid)&&checkid != null){xzfyInfo.setCheck_id(checkid);}	
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
		if(!"".equals(finish_date)){	xzfyInfo.setFinish_date(finish_date);	}
		if(!"".equals(finish_type)){	xzfyInfo.setFinish_type(finish_type);	}
		if(!"".equals(finishBreakType)){	xzfyInfo.setFinishBreakType(finishBreakType);	}
		if(!"".equals(nationMoney)){	xzfyInfo.setNationMoney(nationMoney);	}
		if(!"".equals(nationMoneyDetail)){	xzfyInfo.setNationMoneyDetail(nationMoneyDetail);	}
		if(!"".equals(jaAdvice)){	xzfyInfo.setJaAdvice(jaAdvice);	}	
		if(!"".equals(trailMode)){	xzfyInfo.setTrailMode(trailMode);	}	
		if (this.upFileFileName.length!=0) {
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");		
			for (int i=0;i<upFileFileName.length;i++) {
				String a = upFileFileName[i];
				XzfyXcdc xzfyXcdc= new XzfyXcdc();				
			String realName = a;
			System.out.println("aaaaaaaa"+a);
			String fileName = Calendar.getInstance().getTimeInMillis() + "";
			String fileFlod = webRootPath + "uploadfiles/banan/";
			File path = new File(fileFlod);
			if(!path.exists())
				path.mkdir();
			File outFile = new File(fileFlod + fileName);
			//this.getXzfyXcdc().setXcdcfile(realName);
			//this.getXzfyXcdc().setXcdcfile1("../uploadfiles/banan/" + fileName);
			xzfyXcdc.setXcdcfile(realName);
			xzfyXcdc.setXcdcfile1("../uploadfiles/banan/" + fileName);
			xzfyXcdc.setXzfyInfo(xzfyInfo);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile[i], outFile);
			bananService.save(xzfyXcdc);
			}
		}		
		String op="保存案件信息";
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),xzfyInfo);
		bananService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}
	
	
	public String saveshenpi(){
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
		if(xzfyInfo.getCheck_id()!=null && !xzfyInfo.getCheck_id().equals("0")){
			user=recordService.getUserById(checkid);
			xzfyInfo.setCheck_name(user.getName());			
		}
		if(!"".equals(checkid)){	xzfyInfo.setCheck_id(checkid);	}
		if(!"".equals(tempstatus)){	xzfyInfo.setStatus(tempstatus);	}
		if(!"".equals(tempcheckstatus)){	xzfyInfo.setCheck_status(tempcheckstatus);	}	
		
		String op="提交审批";
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),xzfyInfo);
		bananService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}
	
	public String savedftz(){
		xzfyInfoold=bananService.getXzfyById(tempid);
		xzfyInfo=bananService.getXzfyById(tempid);
		xzfyDftz.setXzfyInfo(xzfyInfo);
		//xzfyInfo.setDftzstatus("1");
		xzfyInfo.getXzfyDftzs().add(xzfyDftz);
		
		String op="保存答复通知";
		recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),xzfyInfo);
		bananService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}
	public String commitdftz(){
		xzfyInfoold=bananService.getXzfyById(tempid);
		xzfyInfo=bananService.getXzfyById(tempid);
		if (this.upFile2FileName != null&&!"".equals(this.upFile2FileName) ){
			String webRootPath2 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName2 = this.upFile2FileName;
			String fileName2 = Calendar.getInstance().getTimeInMillis()+"";
			String fileFlod2 = webRootPath2 + "uploadfiles/banan/";
			File outFile2 = new File(fileFlod2 + fileName2);
			xzfyDftz.setFujian1(realName2);
			xzfyDftz.setFujian11("../uploadfiles/banan/" + fileName2);	
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile2, outFile2);
		}	
		if (this.upFile3FileName != null&&!"".equals(this.upFile3FileName) ){
			String webRootPath3 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName3 = this.upFile3FileName;
			String fileName3 = Calendar.getInstance().getTimeInMillis()+"";
			String fileFlod3 = webRootPath3 + "uploadfiles/banan/";
			File outFile3 = new File(fileFlod3 + fileName3);
			xzfyDftz.setFujian2(realName3);
			xzfyDftz.setFujian22("../uploadfiles/banan/" + fileName3);	
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile3, outFile3);
		}	
		if (this.upFile4FileName != null&&!"".equals(this.upFile4FileName) ){
			String webRootPath4 = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String realName4 = this.upFile4FileName;
			String fileName4 = Calendar.getInstance().getTimeInMillis()+"";
			String fileFlod4 = webRootPath4 + "uploadfiles/banan/";
			File outFile4 = new File(fileFlod4 + fileName4);
			xzfyDftz.setFujian3(realName4);
			xzfyDftz.setFujian33("../uploadfiles/banan/" + fileName4);	
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile4, outFile4);
		}	
		xzfyDftz.setXzfyInfo(xzfyInfo);
		xzfyInfo.setDftzstatus("1");
		xzfyInfo.getXzfyDftzs().add(xzfyDftz);
		
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
	
	
	
	private List orgList;	
	private List suborgList;
	private List<XzfyInfo> weibanjieList;   			//案件未办结
	private List dailianshenchaList;		//案件待立案审查
	private List daibanliList;			//案件待办理
	private List daishenpiList;   //案件待审批
	private List dailianshenpiList;			//案件待立案审批
	private List shenliqixian_20_List;  //审理期限不满20天的
	private List shenliqixian_10_List;  //审理期限不满10天的
	private List shenliqixian_chaoqi_List;  //案件已超期
	private List zhongzhiList;		//案件处于中止状态
	private List weibanjie_sub_List;   			//子部门案件未办结
	private List shenliqixian_sub40_List;		//子部门案件审理时间已满40天
	private List shenliqixian_sub50_List;		//子部门案件审理时间已满50天
	private List shenliqixian_subchaoqi_List;  //子部门案件已超期
	private List newdaifenpeiList; 		//新收案件待分配
	private List weizhidingList;			//已受理案件未指定承办人
	private int listkeyword;     //辨识显示哪个List
	private List caseList;
	private List caseAllList;
	private String locbm="";
	private Number userid;
	private Number orgid;
	
	public String anjianbanliroad(){	
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		admit_name=user.getName();		
		String userlocbm = user.getOrg().getLocbm();
		String sql="select org_name from u_org where org_locBm=" +  user.getOrg().getLocbm()+ " order by org_id asc";
		orgList = bananService.findBySQL(sql);
		bumen = orgList.get(0).toString();
		locbm = user.getOrg().getLocbm();
		subbumen = user.getOrg().getName();
		userid = user.getId();
		orgid = user.getOrg().getId();
		
		weibanjieList = bananService.getWeibanjieList();
		shenliqixian_20_List = bananService.getShenliqixian_20_List(locbm);
		shenliqixian_10_List= bananService.getShenliqixian_10_List(locbm);
		shenliqixian_chaoqi_List= bananService.getShenliqixian_chaoqi_List(locbm);
		zhongzhiList= bananService.getZhongzhiList(locbm);
		newdaifenpeiList=bananService.getNewdaifenpeiList(locbm);
		weizhidingList=bananService.getWeizhidingList(locbm);
		dailianshenchaList= bananService.getDailianshenchaList(userid);
		daibanliList= bananService.getDaibanliList(userid);
		daishenpiList= bananService.getDaishenpiList(userid);
		dailianshenpiList=bananService.getDailianshenpiList(userid);
		weibanjie_sub_List=bananService.getWeibanjie_sub_List(orgid);
		shenliqixian_sub40_List=bananService.getShenliqixian_sub40_List(orgid);
		shenliqixian_sub50_List=bananService.getShenliqixian_sub50_List(orgid);
		shenliqixian_subchaoqi_List=bananService.getShenliqixian_subchaoqi_List(orgid);
		

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
	public String showanjianbanliList(){	
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();		
		String sql="select org_name from u_org where org_locBm=" +  user.getOrg().getLocbm()+ " order by org_id asc";
		orgList = bananService.findBySQL(sql);
		bumen = orgList.get(0).toString();
		locbm = user.getOrg().getLocbm();
		subbumen = user.getOrg().getName();
		userid = user.getId();
		orgid = user.getOrg().getId();
		
		switch(listkeyword){
		case 1:
			pageList = bananService.getWeibanjieListByPage(pNum, pageSize);
			caseList = pageList.getItems();
			caseAllList = bananService.getWeibanjieList();
			totalPage = pageList.getTotalPage();
			break;
		case 2:
			pageList = bananService.getShenliqixian_20_ListByPage(pNum, pageSize,locbm );
			caseList = pageList.getItems();
			caseAllList = bananService.getShenliqixian_20_List(locbm );
			totalPage = pageList.getTotalPage();
			break;
		case 3:
			pageList = bananService.getShenliqixian_10_ListByPage(pNum, pageSize,locbm );
			caseList = pageList.getItems();
			caseAllList = bananService.getShenliqixian_10_List(locbm );
			totalPage = pageList.getTotalPage();
			break;
		case 4:
			pageList = bananService.getShenliqixian_chaoqi_ListByPage(pNum, pageSize,locbm );
			caseList = pageList.getItems();
			caseAllList = bananService.getShenliqixian_chaoqi_List(locbm );
			totalPage = pageList.getTotalPage();
			break;
		case 5:
			pageList = bananService.getZhongzhiListByPage(pNum, pageSize,locbm );
			caseList = pageList.getItems();
			caseAllList = bananService.getZhongzhiList(locbm );
			totalPage = pageList.getTotalPage();
			break;
		case 6:
			pageList = bananService.getNewdaifenpeiListByPage(pNum, pageSize,locbm );
			caseList = pageList.getItems();
			caseAllList = bananService.getNewdaifenpeiList(locbm );
			totalPage = pageList.getTotalPage();
			break;
		case 7:
			pageList = bananService.getWeizhidingListByPage(pNum, pageSize,locbm );
			caseList = pageList.getItems();
			caseAllList = bananService.getWeizhidingList(locbm );
			totalPage = pageList.getTotalPage();
			break;
		case 8:
			pageList = bananService.getDailianshenchaListByPage(pNum, pageSize,userid );
			caseList = pageList.getItems();
			caseAllList = bananService.getDailianshenchaList(userid );
			totalPage = pageList.getTotalPage();
			break;
		case 9:
			pageList = bananService.getDaibanliListByPage(pNum, pageSize,userid );
			caseList = pageList.getItems();
			caseAllList = bananService.getDaibanliList(userid );
			totalPage = pageList.getTotalPage();
			break;
		case 10:
			pageList = bananService.getDaishenpiListByPage(pNum, pageSize,userid );
			caseList = pageList.getItems();
			caseAllList = bananService.getDaishenpiList(userid );
			totalPage = pageList.getTotalPage();
			break;
		case 11:
			pageList = bananService.getDailianshenpiListByPage(pNum, pageSize,userid );
			caseList = pageList.getItems();
			caseAllList = bananService.getDailianshenpiList(userid );
			totalPage = pageList.getTotalPage();
			break;
		case 12:
			pageList = bananService.getWeibanjie_sub_ListByPage(pNum, pageSize,orgid );
			caseList = pageList.getItems();
			caseAllList = bananService.getWeibanjie_sub_List(orgid );
			totalPage = pageList.getTotalPage();
			break;
		case 13:
			pageList = bananService.getShenliqixian_sub40_ListByPage(pNum, pageSize,orgid );
			caseList = pageList.getItems();
			caseAllList = bananService.getShenliqixian_sub40_List(orgid );
			totalPage = pageList.getTotalPage();
			break;
		case 14:
			pageList = bananService.getShenliqixian_sub50_ListByPage(pNum, pageSize,orgid );
			caseList = pageList.getItems();
			caseAllList = bananService.getShenliqixian_sub50_List(orgid );
			totalPage = pageList.getTotalPage();
			break;
		case 15:
			pageList = bananService.getShenliqixian_subchaoqi_ListByPage(pNum, pageSize,orgid );
			caseList = pageList.getItems();
			caseAllList = bananService.getShenliqixian_subchaoqi_List(orgid );
			totalPage = pageList.getTotalPage();
			break;
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

	
	
}
