package com.taiji.fzb.webwork;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import slime.util.IOStream.IOStream;

import com.opensymphony.xwork.ActionContext;
import com.taiji.archive.domain.Archive;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.EvidenceAttachment;
import com.taiji.fzb.domain.XzfyDftz;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.BananService;
import com.taiji.fzb.service.BsqrService;
import com.taiji.fzb.service.RecordService;
import com.taiji.user.domain.User;

public class BsqrDetailAction extends ProtectedDetailAction {
	private static final long serialVersionUID = 1L;
	private XzfyInfo xzfyInfo;
	private EvidenceAttachment evidenceAttachment;
	private List<XzfyInfo> infoList;
	private List<XzfyInfo> allList;
	private User user;
	private String userLocbm;
	private BsqrService bsqrService = null;
	private String xzfyId;
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private Integer pageSize = 15; // 分页列表每页显示个数
	private Integer totalPage = 0; // 分页列表页面总数
	private Integer pNum=1;
	private File[] upFile;
	private String[] upFileFileName={"","",""};
	private File dftzFile;
	private String dftzFileFileName;
	private String liAnDate="";
	private String appName="";
	private String tjzfzh="";
	private String defendant="";
	private String admit="";
	private List<XzfyDftz> dftzList;
	private XzfyDftz xzfyDftz;
	private BananService bananService=null;
	private String userName;
	private List dftzOnline = new ArrayList();
	private RecordService recordService;
	public RecordService getRecordService() {
		return recordService;
	}
	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}
	public List getDftzOnline() {
		return dftzOnline;
	}
	public void setDftzOnline(List dftzOnline) {
		this.dftzOnline = dftzOnline;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public List<XzfyDftz> getDftzList() {
		return dftzList;
	}
	public void setDftzList(List<XzfyDftz> dftzList) {
		this.dftzList = dftzList;
	}
	public XzfyDftz getXzfyDftz() {
		return xzfyDftz;
	}
	public void setXzfyDftz(XzfyDftz xzfyDftz) {
		this.xzfyDftz = xzfyDftz;
	}
	public BananService getBananService() {
		return bananService;
	}
	public void setBananService(BananService bananService) {
		this.bananService = bananService;
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
	public String getDefendant() {
		return defendant;
	}
	public void setDefendant(String defendant) {
		this.defendant = defendant;
	}
	public String getAdmit() {
		return admit;
	}
	public void setAdmit(String admit) {
		this.admit = admit;
	}
	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}
	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}

	public BsqrService getBsqrService() {
		return bsqrService;
	}
	public void setBsqrService(BsqrService bsqrService) {
		this.bsqrService = bsqrService;
	}
	public Integer getpNum() {
		return pNum;
	}
	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}
	public void setEvidenceAttachment(EvidenceAttachment evidenceAttachment) {
		this.evidenceAttachment = evidenceAttachment;
	}
	public EvidenceAttachment getEvidenceAttachment() {
		return evidenceAttachment;
	}
	public List<XzfyInfo> getAllList() {
		return allList;
	}
	public void setAllList(List<XzfyInfo> allList) {
		this.allList = allList;
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
	public File getDftzFile() {
		return dftzFile;
	}
	public void setDftzFile(File dftzFile) {
		this.dftzFile = dftzFile;
	}
	public String getDftzFileFileName() {
		return dftzFileFileName;
	}
	public void setDftzFileFileName(String dftzFileFileName) {
		this.dftzFileFileName = dftzFileFileName;
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
	public List<XzfyInfo> getInfoList() {
		return infoList;
	}
	public void setInfoList(List<XzfyInfo> infoList) {
		this.infoList = infoList;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getUserLocbm() {
		return userLocbm;
	}
	public void setUserLocbm(String userLocbm) {
		this.userLocbm = userLocbm;
	}
	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}
	public String getXzfyId() {
		return xzfyId;
	}
	@SuppressWarnings("unchecked")
	public String showList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		userLocbm=this.recordService.getOrg().getLocbm();
		System.out.println(userLocbm);
		pageList = bsqrService.getXzfyByPage(pNum, pageSize, userLocbm,liAnDate,appName,defendant,tjzfzh,admit);
		infoList = pageList.getItems();
		//allList = bsqrService.getXzfyList(userLocbm,liAnDate,appName,defendant,tjzfzh,admit);
		totalPage = pageList.getTotalPage();
		return SUCCESS;
	}
	
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
	public String showXzfyInfo(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		userName = user.getName();
		xzfyInfo = bsqrService.getXzfyInfo(xzfyId);
		String locbm = this.recordService.getOrg().getLocbm();
		if(xzfyInfo.gettAppDeptId().equals(locbm));
			isPermission=1;
		
		/*
		 * 被申请人为北京市人民政府和选择本单位为答复通知接收单位情况
		 */
		if(xzfyInfo.gettAppDeptId().equals("0000") && xzfyInfo.getBsqrSpecial().equals(locbm));
			isPermission=1;
			
		dftzList = bananService.getDftzListById(xzfyId);
		xzfyDftz = dftzList.get(0);
		xzfyDftz.setUserName2(userName);
		bananService.update(xzfyDftz);
		String sql4="select * from (select * from eweboffice_t_document where caseid='"+xzfyId+"' and d_type='dafutongzhi' order by d_id desc ) where rownum=1";
		dftzOnline = recordService.findListBySQL(sql4);
		
		archiveList = recordService.getArchivesByXzfyId(xzfyId);
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
		return SUCCESS;
	}
	public String saveInfo(){
		xzfyDftz = bananService.getDftzById(xzfyId);
		int i=1;
		String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
		String fileFlod = webRootPath + "uploadfiles/banan/";
		File path = new File(fileFlod);
		if(!path.exists()){
			path.mkdirs();
		}
		if (upFileFileName.length!=0) {
			
			if(upFileFileName[0]!=null&&!upFileFileName[0].equals("")){
				String a = upFileFileName[0];
				String extension = a.substring(a.lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()+extension;	
				File outFile = new File(fileFlod + fileName);
				xzfyDftz.setFujian11("../uploadfiles/banan/" + fileName);
				xzfyDftz.setFujian1(a);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile[0], outFile);
				i++;
			}
			if(i<=upFileFileName.length&&upFileFileName[1]!=null&&!upFileFileName[1].equals("")){
				String a = upFileFileName[1];
				String extension = a.substring(a.lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()+extension;
				File outFile = new File(fileFlod + fileName);
				xzfyDftz.setFujian22("../uploadfiles/banan/" + fileName);
				xzfyDftz.setFujian2(a);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile[1], outFile);
				i++;
			}
			if(i<=upFileFileName.length&&upFileFileName[2]!=null&&!upFileFileName[2].equals("")){
				String a = upFileFileName[2];
				String extension = a.substring(a.lastIndexOf("."));
				String fileName = Calendar.getInstance().getTimeInMillis()+extension;
				File outFile = new File(fileFlod + fileName);
				xzfyDftz.setFujian33("../uploadfiles/banan/" + fileName);
				xzfyDftz.setFujian3(a);
				IOStream stream = new IOStream();
				stream.writeFileStream(upFile[2], outFile);
			}
			
		}
		if(dftzFileFileName!=null&&!dftzFileFileName.equals("")){
			String extension = dftzFileFileName.substring(dftzFileFileName.lastIndexOf("."));
			String fileName = Calendar.getInstance().getTimeInMillis()+extension;
			File outFile = new File(fileFlod + fileName);
			xzfyDftz.setContent1("../uploadfiles/banan/" + fileName);
			IOStream stream = new IOStream();
			stream.writeFileStream(dftzFile, outFile);
		}
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = df.format(dt);
		xzfyDftz.setReceiveanswerdate(date);
		xzfyDftz.setStatus("0");
		bananService.update(xzfyDftz);
		xzfyInfo=bsqrService.getXzfyInfo(xzfyId);
		xzfyInfo.setDftzstatus("0");
		bsqrService.updateXzfyInfo(xzfyInfo);
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	@Override
	public Class getPersistentClass() {
		return null;
	}

}
