package com.taiji.fzb.webwork;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.MaterialSharing;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.fzb.service.MaterialService;
import java.io.File;
//import java.io.UnsupportedEncodingException;

import slime.util.IOStream.IOStream;
import com.taiji.fzb.service.BananService;
import com.taiji.fzb.service.RecordService;

public class MaterialDetailAction extends ProtectedDetailAction{

	private User user;
	private Org org;
	private MaterialSharing materialSharing;
	private String admit_name;
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private Integer pageSize = 12; // 分页列表每页显示个数
	private Integer totalPage = 0; // 分页列表页面总数
	private int totalCount = 0;
	private Integer pNum=1;
	private MaterialService materialService;
	private List<MaterialSharing> materialList;
	private List<MaterialSharing> myorgmaterialList;
	private List<MaterialSharing> myMaterialList;
	private String todate;
	private File upFile = new File("upFile");
	private String upFileFileName = "";
	private int ViewOrModify;
	private int tempid;
	private BananService bananService = null; // 模板业务层方法
	public BananService getBananService() {return bananService;}
	public void setBananService(BananService bananService) {this.bananService = bananService;}
	private List orgList;
	private RecordService recordService = null;
	public RecordService getRecordService() {return recordService;	}
	public void setRecordService(RecordService recordService) {		this.recordService = recordService;	}
	
	@SuppressWarnings("unchecked")
	public String showMaterialList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		admit_name=user.getName();
		this.pageList = this.materialService.getMaterialList(pNum, pageSize, materialSharing, user);
		materialList = pageList.getItems();
		totalPage = pageList.getTotalPage();
		totalCount=pageList.getTotalCount();
		if(materialSharing==null)
			materialSharing = new MaterialSharing();
		return SUCCESS;
	}
	
	public String showMyOrgMaterialList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		admit_name=user.getName();
		this.pageList = this.materialService.getMyOrgMaterialList(pNum, pageSize, materialSharing);
		materialList = pageList.getItems();
		totalPage = pageList.getTotalPage();
		totalCount=pageList.getTotalCount();
		if(materialSharing==null)
			materialSharing = new MaterialSharing();
		return SUCCESS;
	}
	
	public String showMyMaterialList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		admit_name=user.getName();
		this.pageList = this.materialService.getMyMaterialList(pNum, pageSize, materialSharing, user);
		myMaterialList = pageList.getItems();
		totalPage = pageList.getTotalPage();
		totalCount=pageList.getTotalCount();
		if(materialSharing==null)
			materialSharing = new MaterialSharing();
		return SUCCESS;
	}
	
	public String createMaterial(){
		materialSharing = new MaterialSharing();
		return SUCCESS;
	}
	
	private String materialpath="";
	public String saveMaterial(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		materialSharing.setLocbm(recordService.getOrg().getLocbm());
		//materialSharing.setSuperdepartment();
		materialSharing.setUploadingdate(todate);
		materialSharing.setUserid(user.getId().toString());
		materialSharing.setUsername(user.getName());
		materialSharing.setCount("0");
		String sql="select org_name from u_org where org_locBm=" +  this.recordService.getOrg().getLocbm()+ " order by org_id asc";
		orgList = bananService.findBySQL(sql);
		 // orgList.get(0).toString();
		materialSharing.setSuperdepartment(orgList.get(0).toString());
		if(this.upFileFileName != null && !"".equals(this.upFileFileName)){
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String name = materialSharing.getName();
			/*String a="";
			try { 
				a = new String(name.getBytes(),"iso8859-1");
			}
			 catch (UnsupportedEncodingException e) {  
			        e.printStackTrace();  
			    } */ 
			String extension = upFileFileName.substring(upFileFileName.lastIndexOf("."));
			String fileName = Calendar.getInstance().getTimeInMillis() + extension;
			
			String fileFlod = webRootPath + "uploadfiles/material/";
			File path = new File(fileFlod);
			if(!path.exists())
				path.mkdir();
			File outFile = new File(fileFlod + fileName);
			materialSharing.setFilepath("../uploadfiles/material/" + fileName);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile, outFile);
		}
		else if(!"".equals(materialpath)){
			materialSharing.setFilepath(materialpath);
		}
		materialService.saveOrUpdate(materialSharing);
		return SUCCESS;
	}
	
	public String showMaterial(){
		materialSharing = materialService.getMaterialById(tempid);
		user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		if(!materialSharing.getUserid().equals(user.getId().toString())){
			Integer count = Integer.parseInt(materialSharing.getCount()) + 1;
			materialSharing.setCount(count.toString());
			materialService.saveOrUpdate(materialSharing);
		}
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
	
	

	
	
	private static final long serialVersionUID = 1L;
	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Org getOrg() {
		return org;
	}
	public void setOrg(Org org) {
		this.org = org;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public String getAdmit_name() {
		return admit_name;
	}

	public void setAdmit_name(String admitName) {
		admit_name = admitName;
	}

	public MaterialSharing getMaterialSharing() {
		return materialSharing;
	}

	public void setMaterialSharing(MaterialSharing materialSharing) {
		this.materialSharing = materialSharing;
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

	public Integer getpNum() {
		return pNum;
	}

	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}

	public MaterialService getMaterialService() {
		return materialService;
	}

	public void setMaterialService(MaterialService materialService) {
		this.materialService = materialService;
	}



	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public List<MaterialSharing> getMaterialList() {
		return materialList;
	}

	public void setMaterialList(List<MaterialSharing> materialList) {
		this.materialList = materialList;
	}

	public List<MaterialSharing> getMyMaterialList() {
		return myMaterialList;
	}

	public void setMyMaterialList(List<MaterialSharing> myMaterialList) {
		this.myMaterialList = myMaterialList;
	}

	public String getTodate() {
		return todate;
	}

	public void setTodate(String todate) {
		this.todate = todate;
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

	public int getViewOrModify() {
		return ViewOrModify;
	}

	public void setViewOrModify(int viewOrModify) {
		ViewOrModify = viewOrModify;
	}

	public int getTempid() {
		return tempid;
	}

	public void setTempid(int tempid) {
		this.tempid = tempid;
	}
	public List getOrgList() {
		return orgList;
	}
	public void setOrgList(List orgList) {
		this.orgList = orgList;
	}
	public List<MaterialSharing> getMyorgmaterialList() {
		return myorgmaterialList;
	}
	public void setMyorgmaterialList(List<MaterialSharing> myorgmaterialList) {
		this.myorgmaterialList = myorgmaterialList;
	}
	public String getMaterialpath() {
		return materialpath;
	}
	public void setMaterialpath(String materialpath) {
		this.materialpath = materialpath;
	}




	
	

}