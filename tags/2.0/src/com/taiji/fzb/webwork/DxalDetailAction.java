package com.taiji.fzb.webwork;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;

import slime.util.IOStream.IOStream;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.DxalComment;
import com.taiji.fzb.domain.DxalInfo;
import com.taiji.fzb.service.DxalService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;

public class DxalDetailAction extends ProtectedDetailAction{
	
	private static final long serialVersionUID = 1L;
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private Integer pageSize = 15; // 分页列表每页显示个数
	private Integer totalPage = 0; // 分页列表页面总数
    private String id;
	private File upFile = new File("upFile"); // 附件对象
	private String upFileFileName = ""; // 附件对象名称
    private String filepath;
    private String realfilepath;
    private List<DxalInfo> allUnsetList;
    private List<DxalInfo> allSetupList;
	private DxalService dxalService = null; // 模板业务层方法
	private List<DxalInfo> dxalList;
	private List<DxalInfo> allList;
	private int pNum=1;
	private String dxalId;
	private String name;
	private String todate;
	private DxalInfo dxalInfo;
	private DxalComment dxalComment;
	private User user;
	private String action;
	private String title="";
	private String keyword="";
	private String case_type="";
	private int read_count=0;
	private int comment_count;
	private Set<DxalComment> allComments;
	private List<DxalComment> allCommentsList;
	private Org org;
	private String department;
	private String org_locbm="";

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCase_type() {
		return case_type;
	}
	public void setCase_type(String caseType) {
		case_type = caseType;
	}
	public DxalService getDxalService() {
		return dxalService;
	}
	public void setDxalService(DxalService dxalService) {
		this.dxalService = dxalService;
	}
	public List<DxalInfo> getDxalList() {
		return dxalList;
	}
	public void setDxalList(List<DxalInfo> dxalList) {
		this.dxalList = dxalList;
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
	public DxalInfo getDxalInfo() {
		return dxalInfo;
	}
	public void setDxalInfo(DxalInfo dxalInfo) {
		this.dxalInfo = dxalInfo;
	}
	public DxalComment getDxalComment() {
		return dxalComment;
	}
	public void setDxalComment(DxalComment dxalComment) {
		this.dxalComment = dxalComment;
	}
	public void setAllList(List<DxalInfo> allList) {
		this.allList = allList;
	}
	public List<DxalInfo> getAllList() {
		return allList;
	}
	public void setPNum(int pNum) {
		this.pNum = pNum;
	}
	public int getPNum() {
		return pNum;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getId() {
		return id;
	}
	public void setUpFile(File upFile) {
		this.upFile = upFile;
	}
	public File getUpFile() {
		return upFile;
	}
	public void setUpFileFileName(String upFileFileName) {
		this.upFileFileName = upFileFileName;
	}
	public String getUpFileFileName() {
		return upFileFileName;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setRealfilepath(String realfilepath) {
		this.realfilepath = realfilepath;
	}
	public String getRealfilepath() {
		return realfilepath;
	}
	public void setAllSetupList(List<DxalInfo> allSetupList) {
		this.allSetupList = allSetupList;
	}
	public List<DxalInfo> getAllSetupList() {
		return allSetupList;
	}
	public void setAllUnsetList(List<DxalInfo> allUnsetList) {
		this.allUnsetList = allUnsetList;
	}
	public List<DxalInfo> getAllUnsetList() {
		return allUnsetList;
	}
	public String getDxalId() {
		return dxalId;
	}
	public void setDxalId(String dxalId) {
		this.dxalId = dxalId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public Class<DxalInfo> getPersistentClass() {
		return DxalInfo.class;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getAction() {
		return action;
	}
	public void setAllComments(Set<DxalComment> allComments) {
		this.allComments = allComments;
	}
	public Set<DxalComment> getAllComments() {
		return allComments;
	}
	public void setAllCommentsList(List<DxalComment> allCommentsList) {
		this.allCommentsList = allCommentsList;
	}
	public List<DxalComment> getAllCommentsList() {
		return allCommentsList;
	}
	public void setOrg(Org org) {
		this.org = org;
	}
	public Org getOrg() {
		return org;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDepartment() {
		return department;
	}
	public void setOrg_locbm(String org_locbm) {
		this.org_locbm = org_locbm;
	}
	public String getOrg_locbm() {
		return org_locbm;
	}
	
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public int getComment_count() {
		return comment_count;
	}
	
	@SuppressWarnings("unchecked")
	public String showDxalList() {
		try {
			action = "dxal_List";
			this.allList = this.dxalService.getAllList();
			this.pageList = this.dxalService.getDxalList(pNum, this.pageSize);
			this.dxalList = this.pageList.getItems();			
			this.totalPage = this.pageList.getTotalPage();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@SuppressWarnings("unchecked")
	public String showSetupList() {
		try {
			action = "dxal_Setup";
			this.allList = this.dxalService.getAllSetupList();
			this.pageList = this.dxalService.getSetupList(pNum, this.pageSize);
			this.dxalList = this.pageList.getItems();			
			this.totalPage = this.pageList.getTotalPage();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	@SuppressWarnings("unchecked")
	public String showSearchList() {
		try {
			this.allList = this.dxalService.FindAllList(title,keyword,case_type,read_count,comment_count);
			this.pageList = this.dxalService.FindList(pNum, this.pageSize,title,keyword,case_type,read_count,comment_count);
			this.dxalList = this.pageList.getItems();			
			this.totalPage = this.pageList.getTotalPage();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String showDxal() {                                 //第一次进入该页面
		try {
			user = new User();
			user = (User) ActionContext.getContext().getSession().get(                  //新建典型案例
					"_USER_LOGIN_");
			dxalInfo = new DxalInfo();
			dxalInfo = dxalService.getDxalById(id);
			int read = dxalInfo.getRead_count();
			int marks=dxalInfo.getMarks();
     		dxalInfo.setRead_count(read+1);
			allComments=dxalInfo.getDxalcomments();
			allCommentsList = new ArrayList<DxalComment>(allComments);
			String str = dxalInfo.getUserNames();
			if(str!=null&&str!=""){
				if(!findUser(dxalInfo.getUserNames(), user.getId())){
					str+= ","+String.valueOf(user.getId());
					dxalInfo.setUserNames(str);
					dxalInfo.setMarks(marks+1);
					}
				}else{
					dxalInfo.setUserNames(String.valueOf(user.getId()));
					dxalInfo.setMarks(marks+1);
					}
							
			dxalService.updateDxalInfo(dxalInfo);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	public String backToDxal() {                                             //评论成功后返回该页面
		try {
			dxalInfo = new DxalInfo();
			dxalInfo = dxalService.getDxalById(id);
			allComments=dxalInfo.getDxalcomments();
			allCommentsList = new ArrayList<DxalComment>(allComments);
			dxalService.updateDxalInfo(dxalInfo);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String gotoCreate() {
		try {	
			String currentTime=new SimpleDateFormat("yyyyMMddHHmmssSSS") .format(new Date() );
			Random random = new Random();
			dxalId=currentTime+random.nextInt(10000);
			Date dt = new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			todate = df.format(dt);
			user = new User();
			user = (User) ActionContext.getContext().getSession().get(                  //新建典型案例
					"_USER_LOGIN_");
			name=user.getName();
			org_locbm=user.getOrg().getLocbm();
			department=user.getOrg().getName();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	

	public String savaDxalInfo(){
		if (!"".equals(this.upFileFileName)) {
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String fileName = Calendar.getInstance().getTimeInMillis() + this.upFileFileName;
			String fileFlod = webRootPath + "uploadfiles/Dxal/attachment/";
			File path = new File(fileFlod);
			if(!path.exists()){
				path.mkdirs();
			}
			File outFile = new File(fileFlod + fileName);
			this.getDxalInfo().setFilePath(fileFlod + fileName);
			this.getDxalInfo().setRealFilePath("../uploadfiles/Dxal/attachment/" + fileName);
			this.getDxalInfo().setFileName(this.upFileFileName);
			IOStream stream = new IOStream();
			stream.writeFileStream(this.upFile, outFile);
		}
		dxalService.saveDxalInfo(dxalInfo);               //保存
		return SUCCESS;
	}
	public String saveDxalComment(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(   //新建典型案例
				"_USER_LOGIN_");
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		dxalInfo = new DxalInfo();
		dxalInfo=dxalService.getDxalById(id);
		int count=dxalInfo.getComment_count();
		int marks=dxalInfo.getMarks();
		
		allComments=dxalInfo.getDxalcomments();
		allCommentsList = new ArrayList<DxalComment>(allComments);
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(                  //新建典型案例
				"_USER_LOGIN_");
		if(!check(allCommentsList,user.getId())){
			dxalInfo.setMarks(marks+2);
		}
		
		dxalInfo.setComment_count(count+1);                         //评论次数+1
		dxalService.updateDxalInfo(dxalInfo);
		dxalComment.setDxalinfo(dxalInfo);
		dxalComment.setCommenter_id(user.getId());
		dxalComment.setCommenter_name(user.getName());
		dxalComment.setTime(df.format(dt));
		dxalService.saveDxalComment(dxalComment);
		return SUCCESS;
	}
	public String gotoSearch(){
		return SUCCESS;
	}
	public String updateInfo(){
		dxalService.updateDxalInfo(dxalInfo);		
		return SUCCESS;
	}
	public boolean check(List<DxalComment> list,int id){    //检验用户是否第一次评论
		for(int i=0;i<list.size();i++){
			DxalComment dc=list.get(i);
			if(dc.getCommenter_id()==id)
				return true;				
		}                                              
		return false;
	}
	public boolean findUser(String str,int userId){      //检验用户是否第一次点击
		if(str!=null){
			String[] s = str.split(",");
			for (String a : s) {
			if(a.equals(String.valueOf(userId)))
				return true;
			}
		}
		return false;
	}
	public String deleteDxalInfo(){
		dxalService.deleteComment(dxalId);
		dxalService.deleteDxal(dxalId);
		return SUCCESS;
		
	}

}
