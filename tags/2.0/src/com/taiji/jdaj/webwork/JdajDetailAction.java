package com.taiji.jdaj.webwork;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import slime.util.IOStream.IOStream;

import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.jdaj.domain.JdajApp;
import com.taiji.jdaj.domain.JdajInfo;
import com.taiji.jdaj.service.JdajService;

public class JdajDetailAction extends ProtectedDetailAction{
	private static final long serialVersionUID = 1L;
	private JdajService jdajService=null;
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private Integer pageSize = 15;                                // 分页列表每页显示个数
	private Integer totalPage = 0;                                // 分页列表页面总数
	private List<JdajInfo> jdajListAll;
	private List<JdajInfo> jdajList;
	private Integer pNum=1;
	private String jdajId;
	private String todate="";
	private JdajInfo jdajInfo;
	private JdajApp jdajApp;
	private File upFile = new File("upFile"); // 附件对象
	private String upFileFileName = ""; // 附件对象名称
    private String filepath;
    private String realfilepath;
    private List<JdajApp> appList=new ArrayList<JdajApp>();
    private String sendValue="";
    private String textId;
    private int appId;
    private int isModify;
    private int initSearch=0;
    private String appName="";
    private String documentNumber;
    private String undertaker="";
    private String state;
    private int isFirst;            //第一次进入查询界面
    private String nameString="";

	public void setNameString(String nameString) {
		this.nameString = nameString;
	}
	public String getNameString() {
		return nameString;
	}
	public void setIsFirst(int isFirst) {
		this.isFirst = isFirst;
	}
	public int getIsFirst() {
		return isFirst;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getState() {
		return state;
	}
	public void setIsModify(int isModify) {
		this.isModify = isModify;
	}
	public int getIsModify() {
		return isModify;
	}
	public File getUpFile() {
		return upFile;
	}
	public void setUpFile(File upFile) {
		this.upFile = upFile;
	}
	public String getUpFileFileName() {
		return upFileFileName;
	}
	public void setUpFileFileName(String upFileFileName) {
		this.upFileFileName = upFileFileName;
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
	public JdajService getJdajService() {
		return jdajService;
	}
	public void setJdajService(JdajService jdajService) {
		this.jdajService = jdajService;
	}
	public String getJdajId() {
		return jdajId;
	}
	public void setJdajId(String jdajId) {
		this.jdajId = jdajId;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public JdajInfo getJdajInfo() {
		return jdajInfo;
	}
	public void setJdajInfo(JdajInfo jdajInfo) {
		this.jdajInfo = jdajInfo;
	}
	public JdajApp getJdajApp() {
		return jdajApp;
	}
	public void setJdajApp(JdajApp jdajApp) {
		this.jdajApp = jdajApp;
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
	public List<JdajInfo> getJdajList() {
		return jdajList;
	}
	public void setJdajList(List<JdajInfo> jdajList) {
		this.jdajList = jdajList;
	}
	public Integer getpNum() {
		return pNum;
	}
	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}
	public void setAppList(List<JdajApp> appList) {
		this.appList = appList;
	}
	public List<JdajApp> getAppList() {
		return appList;
	}
	public void setSendValue(String sendValue) {
		this.sendValue = sendValue;
	}
	public String getSendValue() {
		return sendValue;
	}
	public void setTextId(String textId) {
		this.textId = textId;
	}
	public String getTextId() {
		return textId;
	}
	public void setAppId(int appId) {
		this.appId = appId;
	}
	public int getAppId() {
		return appId;
	}
	public void setJdajListAll(List<JdajInfo> jdajListAll) {
		this.jdajListAll = jdajListAll;
	}
	public List<JdajInfo> getJdajListAll() {
		return jdajListAll;
	}
	public int getInitSearch() {
		return initSearch;
	}
	public void setInitSearch(int initSearch) {
		this.initSearch = initSearch;
	}
	public String getAppName() {
		return appName;
	}
	public void setAppName(String appName) {
		this.appName = appName;
	}
	public String getDocumentNumber() {
		return documentNumber;
	}
	public void setDocumentNumber(String documentNumber) {
		this.documentNumber = documentNumber;
	}
	public String getUndertaker() {
		return undertaker;
	}
	public void setUndertaker(String undertaker) {
		this.undertaker = undertaker;
	}
	@Override
	public Class<JdajInfo> getPersistentClass() {
		return JdajInfo.class;
	}
	public String gotoCreate(){
		try{
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
			Random random = new Random();
			jdajId = currentTime+random.nextInt(1000);
			Date date = new Date();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			todate = dateFormat.format(date);
			isModify=0;
			return "success";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	public String saveJdajInfo(){
		if (!"".equals(this.upFileFileName)) {
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String fileName = Calendar.getInstance().getTimeInMillis() + this.upFileFileName;
			String fileFlod = webRootPath + "uploadfiles/Jdaj/attachment/";
			File path = new File(fileFlod);
			if(!path.exists()){
				path.mkdirs();
			}
			File outFile = new File(fileFlod + fileName);
			this.getJdajInfo().setFilePath(fileFlod + fileName);
			this.getJdajInfo().setRealFilePath("../uploadfiles/Jdaj/attachment/" + fileName);
			this.getJdajInfo().setFileName(this.upFileFileName);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile, outFile);
		}
		

		appList =jdajService.getAppListById(jdajId);
		for(int i=0;i<appList.size();i++){
			JdajApp app=(JdajApp)appList.get(i);
			nameString+=app.getName();
			if(i!=appList.size()-1)
				nameString=nameString+"，";
		}
		System.out.println("test:"+nameString);
		this.getJdajInfo().setAppNames(nameString);
		jdajService.saveJdajInfo(jdajInfo);               //保存
		return SUCCESS;
	}
	public String addApp(){
		appList=jdajService.getAppListById(jdajId);
		for(int i=0;i<appList.size();i++){
			JdajApp app=new JdajApp();
			app=(JdajApp)appList.get(i);
			nameString+="app.getName()";
			sendValue=sendValue+"姓名："+app.getName()+"，性别：";
			if(app.getSex()=="1"){
				sendValue+="男，";
			}else{
				sendValue+="女，";
			}
			sendValue+="身份证号："+app.getIdNumber()+"，住所地："
			+app.getAddress()+"，通讯地址："+app.getAddress()+"，邮编："+app.getPostCode()+"，电话："+app.getTeleNumber()+"，手机："+app.getPhoneNumber();
			if(i==appList.size()-1){
				sendValue=sendValue+"。";
			}else{
				nameString+="，";
				sendValue=sendValue+"；";
			}
		}
		return SUCCESS;
	}
	public String gotoCreateApp(){
		return SUCCESS;
	}
	public String saveJdajApp(){
		if(isModify==0){                                       //是否在监督案件管理中修改      否
			jdajInfo = new JdajInfo();
			jdajInfo.setId(jdajId);
			jdajApp.setJdajInfo(jdajInfo);
			jdajService.saveJdajApp(jdajApp);
		}else{                                                     //是
			jdajInfo = jdajService.getJdajInfoById(jdajId);
			jdajApp.setJdajInfo(jdajInfo);
			jdajService.saveJdajApp(jdajApp);
			return SUCCESS;
		}
		return SUCCESS;
	}
	
	public String deleteJdajApp(){
		jdajApp = new JdajApp();	
		jdajApp = jdajService.getAppById(appId);
		jdajService.deleteAppById(appId);	
		return SUCCESS;
	}
	public String updateJdajApp(){
		jdajApp = new JdajApp();	
		jdajApp = jdajService.getAppById(appId);
		return SUCCESS;
	}
	public String doUpdateJdajApp(){
		jdajInfo = new JdajInfo();
		jdajInfo.setId(jdajId);
		jdajApp.setJdajInfo(jdajInfo);
		jdajService.updateApp(jdajApp);
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String showJdajList(){
		jdajListAll=jdajService.getList(todate, documentNumber, appName, undertaker);
		pageList=jdajService.getListByPage(pNum, pageSize,todate, documentNumber, appName, undertaker);
		jdajList=pageList.getItems();
		totalPage=pageList.getTotalPage();
		return SUCCESS;
	}
	public String deleteJdaj(){
		System.out.println(jdajId);
		jdajService.deleteJdajInfo(jdajId);
		jdajService.deleteRelatedApp(jdajId);
		return SUCCESS;
	}
	public String showInfo(){
		isModify=1;
		jdajInfo=jdajService.getJdajInfoById(jdajId);
		appList=jdajService.getAppListById(jdajId);
		for(int i=0;i<appList.size();i++){
			JdajApp app=new JdajApp();
			app=(JdajApp)appList.get(i);
			sendValue=sendValue+"姓名："+app.getName()+"，性别：";
			if(app.getSex()=="1"){
				sendValue+="男，";
			}else{
				sendValue+="女，";
			}
			sendValue+="身份证号："+app.getIdNumber()+"，住所地："
			+app.getAddress()+"，通讯地址："+app.getAddress()+"，邮编："+app.getPostCode()+"，电话："+app.getTeleNumber()+"，手机："+app.getPhoneNumber();
			if(i==appList.size()-1)
				sendValue=sendValue+"。";
			else
				sendValue=sendValue+"；";
		}
		System.out.println("sendValue的值："+sendValue);
		return SUCCESS;
	}
	public String searchJdaj(){
		if(initSearch==0){
			jdajListAll=new ArrayList<JdajInfo>();
			initSearch=1;
			isFirst=0;
		}else{
			isFirst=1;
			pageList = jdajService.searchJdajInfoByPage(pNum, pageSize, todate, documentNumber, appName, undertaker);
			jdajList = pageList.getItems();
			totalPage = pageList.getTotalPage();
			jdajListAll=jdajService.searchJdajInfo(todate, documentNumber, appName, undertaker);
		}
		return SUCCESS;
	}

}
