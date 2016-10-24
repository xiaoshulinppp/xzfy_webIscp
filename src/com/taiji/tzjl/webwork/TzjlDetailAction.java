package com.taiji.tzjl.webwork;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;


import slime.util.IOStream.IOStream;

import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.tzjl.domain.TzjlInfo;
import com.taiji.tzjl.service.TzjlService;

public class TzjlDetailAction extends ProtectedDetailAction{
	private static final long serialVersionUID = 1L;
	private String xzfyId;
	private TzjlInfo tzjlInfo;
	private List<TzjlInfo> infoList=new ArrayList<TzjlInfo>();
	private List<TzjlInfo> allList=new ArrayList<TzjlInfo>();
	private TzjlService tzjlService=null;
	private String upFileFileName="";
	private File upFile=new File("upFile");
    private String hasAttachment="0";
    private int tzjlId;
    private Integer pNum=1;
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private Integer pageSize = 15; // 分页列表每页显示个数
	private Integer totalPage = 0; // 分页列表页面总数
	private String time="";
	private String location="";
	private String host="";
	private String attendant="";
	
	
	
	public TzjlInfo getTzjlInfo() {
		return tzjlInfo;
	}
	public void setTzjlInfo(TzjlInfo tzjlInfo) {
		this.tzjlInfo = tzjlInfo;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getAttendant() {
		return attendant;
	}
	public void setAttendant(String attendant) {
		this.attendant = attendant;
	}
	public Integer getpNum() {
		return pNum;
	}
	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}
	public void setAllList(List<TzjlInfo> allList) {
		this.allList = allList;
	}
	public List<TzjlInfo> getAllList() {
		return allList;
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
	public List<TzjlInfo> getInfoList() {
		return infoList;
	}
	public void setInfoList(List<TzjlInfo> infoList) {
		this.infoList = infoList;
	}
	public TzjlService getTzjlService() {
		return tzjlService;
	}
	public void setTzjlService(TzjlService tzjlService) {
		this.tzjlService = tzjlService;
	}
	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}
	public String getXzfyId(){
		return xzfyId;
	}
	
	public String getHasAttachment() {
		return hasAttachment;
	}
	public void setHasAttachment(String hasAttachment) {
		this.hasAttachment = hasAttachment;
	}
	public void setTzjlId(int tzjlId) {
		this.tzjlId = tzjlId;
	}
	public int getTzjlId() {
		return tzjlId;
	}
	public String getUpFileFileName() {
		return upFileFileName;
	}
	public void setUpFileFileName(String upFileFileName) {
		this.upFileFileName = upFileFileName;
	}
	public File getUpFile() {
		return upFile;
	}
	public void setUpFile(File upFile) {
		this.upFile = upFile;
	}
	public String generateXzfyId(){
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		Random random = new Random();
		xzfyId = currentTime+random.nextInt(1000);
		return SUCCESS;
	}
	public String showTzjlList(){
		System.out.println(xzfyId);
		pageList=tzjlService.getListByPage(pNum, pageSize, xzfyId,time,location,host,attendant);
		infoList=pageList.getItems();
		allList=tzjlService.getTzjlList(xzfyId,time,location,host,attendant);
		totalPage=pageList.getTotalPage();
		return SUCCESS;
	}
	public String saveTzjlInfo(){
		
		if (!"".equals(upFileFileName)&&upFileFileName!=null) {
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String extension = upFileFileName.substring(upFileFileName.lastIndexOf("."));
			String fileName = Calendar.getInstance().getTimeInMillis() + extension;
			String fileFlod = webRootPath + "uploadfiles/Tzjl/attachment/";
			File path = new File(fileFlod);
			if(!path.exists()){
				path.mkdirs();
			}
			File outFile = new File(fileFlod + fileName);
			this.getTzjlInfo().setFilePath(fileFlod + fileName);
			this.getTzjlInfo().setRealFilePath("../uploadfiles/Tzjl/attachment/" + fileName);
			this.getTzjlInfo().setFileName(this.upFileFileName);
			hasAttachment="1";
			IOStream stream = new IOStream();
			stream.writeFileStream(upFile, outFile);
		}
		this.getTzjlInfo().setHasAttachment(hasAttachment);
		tzjlService.saveTzjlInfo(tzjlInfo);
		return SUCCESS;
	}
	@Override
	public Class<TzjlInfo> getPersistentClass() {
		return TzjlInfo.class;
	}
	public String gotoAddTzjl(){
		return SUCCESS;
	}
	public String getTzjl(){
		tzjlInfo=tzjlService.getTzjlInfo(tzjlId);		
		return SUCCESS;
	}

}
