package com.taiji.ajgl.webwork;

import java.io.File;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import slime.util.IOStream.IOStream;

import com.opensymphony.xwork.ActionContext;
import com.taiji.ajgl.domain.AjAttachment;
import com.taiji.ajgl.service.AjService;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzfyService;
import com.taiji.user.domain.User;

import localhost.zxfy.services.datesent.DatesentProxy;

public class AjDetailAction extends ProtectedDetailAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String xzfyId;
	private int pNum=1;
	private int pageSize=15;
	private int totalPage;
	private PaginationSupport pageList;
	private List<XzfyInfo> infoList = new ArrayList<XzfyInfo>();
	private List<XzfyInfo> allList = new ArrayList<XzfyInfo>();
	private AjService ajService=null;
	private RecordService recordService = null; // 模板业务层方法
	private XzfyService xzfyService = null;
	private List<AjAttachment> attachmentList = new ArrayList<AjAttachment>();
	private String locbm;
	private User user;
	private File[] upFile;
	private String[] upFileFileName={};
	private String inputFileName="";
	private XzfyInfo xzfyInfo;
	private String attachid;
	private String liAnDate="";
	private String appName="";
	private String tjzfzh="";
	private String admit="";
	private String defendant="";
	@SuppressWarnings("unchecked")
	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}
	public String getDefendant() {
		return defendant;
	}
	public void setDefendant(String defendant) {
		this.defendant = defendant;
	}
	public String getInputFileName() {
		return inputFileName;
	}
	public void setInputFileName(String inputFileName) {
		this.inputFileName = inputFileName;
	}
	public String getLiAnDate() {
		return liAnDate;
	}
	public void setLiAnDate(String liAnDate) {
		this.liAnDate = liAnDate;
	}
	public String getAppName() {
		return appName;
	}
	public void setAppName(String appName) {
		this.appName = appName;
	}
	public String getTjzfzh() {
		return tjzfzh;
	}
	public void setTjzfzh(String tjzfzh) {
		this.tjzfzh = tjzfzh;
	}
	public String getAdmit() {
		return admit;
	}
	public void setAdmit(String admit) {
		this.admit = admit;
	}
	public String getAttachid() {
		return attachid;
	}
	public void setAttachid(String attachid) {
		this.attachid = attachid;
	}
	public XzfyService getXzfyService() {
		return xzfyService;
	}
	public void setXzfyService(XzfyService xzfyService) {
		this.xzfyService = xzfyService;
	}
	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}
	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
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
	public AjService getAjService() {
		return ajService;
	}
	public void setAjService(AjService ajService) {
		this.ajService = ajService;
	}
	public String getLocbm() {
		return locbm;
	}
	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}
	public void setAttachmentList(List<AjAttachment> attachmentList) {
		this.attachmentList = attachmentList;
	}
	public List<AjAttachment> getAttachmentList() {
		return attachmentList;
	}
	public PaginationSupport getPageList() {
		return pageList;
	}
	public void setPageList(PaginationSupport pageList) {
		this.pageList = pageList;
	}
	public RecordService getRecordService() {
		return recordService;
	}
	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}
	public String getXzfyId() {
		return xzfyId;
	}
	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<XzfyInfo> getInfoList() {
		return infoList;
	}
	public void setInfoList(List<XzfyInfo> infoList) {
		this.infoList = infoList;
	}
	public List<XzfyInfo> getAllList() {
		return allList;
	}
	public void setAllList(List<XzfyInfo> allList) {
		this.allList = allList;
	}
	@SuppressWarnings("unchecked")
	public String showList1() throws Exception{
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		locbm=this.recordService.getOrg().getLocbm();
		/*appName=new String(appName.getBytes("ISO8859-1"), "UTF-8");
		admit=new String(admit.getBytes("ISO8859-1"), "UTF-8");
		defendant=new String(defendant.getBytes("ISO8859-1"), "UTF-8");*/
		pageList = ajService.getList1ByPage(pNum, pageSize, locbm,liAnDate,appName,tjzfzh,admit,defendant);
		infoList = pageList.getItems();
		totalPage = pageList.getTotalPage();
		return SUCCESS;
	}
	public String saveAttachment(){
		String[] str1;
		str1 = inputFileName.replaceAll(" ", "").split(",");
		String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
		for (int i=0;i<upFileFileName.length;i++) {
			String name = upFileFileName[i];
			String inputName=str1[i];
			AjAttachment a = new AjAttachment();
			String fileName = Calendar.getInstance().getTimeInMillis() + name;
			String fileFlod = webRootPath + "uploadfiles/Aj/attachment/";
			File path = new File(fileFlod);
			if(!path.exists()){
			path.mkdirs();
			}
			File outFile = new File(fileFlod + fileName);
			
			String currentTime=new SimpleDateFormat("yyyyMMddHHmmss") .format(new Date() );
			String time=new SimpleDateFormat("yyyyMMddHHmmssSSS") .format(new Date() );
			Random random = new Random();
			a.setId(time+random.nextInt(1000));
			a.setInputFileName(inputName);
			a.setUploadDate(currentTime);
			a.setFileName(name);
			a.setRealFilePath("../uploadfiles/Aj/attachment/" + fileName);
			a.setFilePath(fileFlod + fileName);
			a.setXzfyId(xzfyId);
			IOStream stream = new IOStream();
			stream.writeFileStream(upFile[i], outFile);
			ajService.saveAjAttachment(a);
			
		}
		xzfyInfo = xzfyService.getXzfyById(xzfyId);
		xzfyInfo.setStatus("13");
		
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
		
		
		
		xzfyService.saveXzfyInfo(xzfyInfo);
		return SUCCESS;
	}
	
	
	@SuppressWarnings("unchecked")
	public String showList2() throws Exception{
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		locbm=this.recordService.getOrg().getLocbm();
		/*appName=new String(appName.getBytes("ISO8859-1"), "UTF-8");
		admit=new String(admit.getBytes("ISO8859-1"), "UTF-8");
		defendant=new String(defendant.getBytes("ISO8859-1"), "UTF-8");*/
		pageList = ajService.getList2ByPage(pNum, pageSize, locbm,liAnDate,appName,tjzfzh,admit,defendant);
		infoList = pageList.getItems();
		totalPage = pageList.getTotalPage();
		//allList = ajService.getAllList2(locbm,liAnDate,appName,tjzfzh,admit,defendant);
		return SUCCESS;
	}
	public String gotoUpload(){
		return SUCCESS;
	}
	public String viewAttachment(){
		attachmentList = ajService.getAttachmentList(xzfyId);
		return SUCCESS;
	}
	public String updateAttachment(){
		if(upFileFileName.length!=0){
			String[] str1;
			str1 = inputFileName.replaceAll(" ", "").split(",");
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			for (int i=0;i<upFileFileName.length;i++) {
				String name= upFileFileName[i];
				String inputname = str1[i];
				AjAttachment a = new AjAttachment();
				String fileName = Calendar.getInstance().getTimeInMillis() + name;
				String fileFlod = webRootPath + "uploadfiles/Aj/attachment/";
				File path = new File(fileFlod);
				if(!path.exists()){
				path.mkdirs();
				}
				File outFile = new File(fileFlod + fileName);
				
				String currentTime=new SimpleDateFormat("yyyyMMddHHmmss") .format(new Date() );
				String time=new SimpleDateFormat("yyyyMMddHHmmssSSS") .format(new Date() );
				Random random = new Random();
				a.setId(time+random.nextInt(1000));
				a.setInputFileName(inputname);
				a.setUploadDate(currentTime);
				a.setFileName(name);
				a.setRealFilePath("../uploadfiles/Aj/attachment/" + fileName);
				a.setFilePath(fileFlod + fileName);
				a.setXzfyId(xzfyId);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile[i], outFile);
				ajService.saveAjAttachment(a);
				
			}
		}
		if(!attachid.equals("")){
			String[] str=attachid.replaceAll(" ", "").split(";");
			for (String a : str) {
				ajService.deleteAttachment(a);
			}
		}
		return SUCCESS;
	}
	public String appAnjuView(){
		xzfyInfo=xzfyService.getXzfyById(xzfyId);
		return SUCCESS;
	}
	
	public String viewMulu(){
		xzfyInfo=xzfyService.getXzfyById(xzfyId);
		attachmentList = ajService.getAttachmentList(xzfyId);
		return SUCCESS;
	}

}
