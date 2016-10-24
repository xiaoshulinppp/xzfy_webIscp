package com.taiji.ashjl.webwork;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import slime.util.IOStream.IOStream;

import com.taiji.ashjl.service.AshjlService;
import com.taiji.ashjl.domain.AshjlInfo;
import com.taiji.ashjl.domain.AshjlWypj;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.Committee;
import com.taiji.fzb.domain.Term;
import com.taiji.fzb.service.RddbService;
import com.taiji.tzjl.domain.TzjlInfo;

public class AshjlDetailAction extends ProtectedDetailAction{
	private static final long serialVersionUID = 1L;
	private String xzfyId;
	private String ashjlId;
	private String isModify;
	private AshjlInfo ashjlInfo;
	private AshjlWypj host;
	private AshjlService ashjlService = null;
	private RddbService rddbService = null;
	private Term term;
	private List<AshjlInfo> ashjlList = new ArrayList<AshjlInfo>();
	private List<AshjlInfo> allList=new ArrayList<AshjlInfo>();
	private String upFileFileName="";
	private File upFile = new File("upFile");
	private List<Committee> committeeList=new ArrayList<Committee>();
    private List<GradeClass> gradeList1=new ArrayList<GradeClass>();
    private List<GradeClass> gradeList2=new ArrayList<GradeClass>();
    private String attendantName;
    private String grade;
    private String comtStr;
    private String graded="0";
    private List<AshjlWypj> wypjList = new ArrayList<AshjlWypj>();
    private Integer pNum=1;
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private Integer pageSize = 15; // 分页列表每页显示个数
	private Integer totalPage = 0; // 分页列表页面总数
	private String time;
	private String location;
	private String ashHost;
	private String attendant;
    
    public class GradeClass{
    	String grade;
    	public void setGrade(String grade){
    		this.grade=grade;
    	}
    	public String getGrade(){
    		return grade;
    	}
    }
    public List<GradeClass> getGradeList1(){
    	for(int i=0;i<=10;i++){
    		GradeClass g=new GradeClass();
    		g.setGrade(String.valueOf(i));
    		gradeList1.add(g);
    	}
    	return gradeList1;
    }
	public void setGradeList1(List<GradeClass> gradeList1){
		this.gradeList1=gradeList1;
	}
    public List<GradeClass> getGradeList2(){
    	for(int i=0;i<=10;i++){
    		GradeClass g=new GradeClass();
    		g.setGrade(String.valueOf(i));
    		gradeList2.add(g);
    	}
    	return gradeList2;
    }
	public void setGradeList2(List<GradeClass> gradeList2){
		this.gradeList2=gradeList2;
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
	public String getAshHost() {
		return ashHost;
	}
	public void setAshHost(String ashHost) {
		this.ashHost = ashHost;
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
	public void setWypjList(List<AshjlWypj> wypjList) {
		this.wypjList = wypjList;
	}
	public List<AshjlWypj> getWypjList() {
		return wypjList;
	}
	public String getGraded() {
		return graded;
	}
	public void setGraded(String graded) {
		this.graded = graded;
	}
	public void setComtStr(String comtStr) {
		this.comtStr = comtStr;
	}
	public String getComtStr() {
		return comtStr;
	}
	public String getAttendantName() {
		return attendantName;
	}
	public void setAttendantName(String attendantName) {
		this.attendantName = attendantName;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public void setHost(AshjlWypj host) {
		this.host = host;
	}
	public AshjlWypj getHost() {
		return host;
	}
	public void setIsModify(String isModify) {
		this.isModify = isModify;
	}
	public String getIsModify() {
		return isModify;
	}
	public void setAshjlId(String ashjlId) {
		this.ashjlId = ashjlId;
	}
	public String getAshjlId() {
		return ashjlId;
	}
	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}
	public String getXzfyId() {
		return xzfyId;
	}
	public void setCommitteeList(List<Committee> committeeList) {
		this.committeeList = committeeList;
	}
	public List<Committee> getCommitteeList() {
		return committeeList;
	}
	public void setAllList(List<AshjlInfo> allList) {
		this.allList = allList;
	}
	public List<AshjlInfo> getAllList() {
		return allList;
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
	public AshjlInfo getAshjlInfo() {
		return ashjlInfo;
	}
	public void setAshjlInfo(AshjlInfo ashjlInfo) {
		this.ashjlInfo = ashjlInfo;
	}
	public AshjlService getAshjlService() {
		return ashjlService;
	}
	public void setAshjlService(AshjlService ashjlService) {
		this.ashjlService = ashjlService;
	}
	public List<AshjlInfo> getAshjlList() {
		return ashjlList;
	}
	public void setAshjlList(List<AshjlInfo> ashjlList) {
		this.ashjlList = ashjlList;
	}
	public RddbService getRddbService() {
		return rddbService;
	}
	public void setRddbService(RddbService rddbService) {
		this.rddbService = rddbService;
	}
	public Term getTerm() {
		return term;
	}
	public void setTerm(Term term) {
		this.term = term;
	}
	@Override
	public Class<AshjlInfo> getPersistentClass() {
		return AshjlInfo.class;
	}
	public String generateXzfyId(){
		String currentTime=new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		Random random = new Random();
		setXzfyId(currentTime+random.nextInt(1000));
		return SUCCESS;
	}
	public String showAshjlList(){
		pageList=ashjlService.getListByPage(pNum, pageSize, xzfyId,time,location,ashHost,attendant);
		ashjlList = pageList.getItems();
		totalPage = pageList.getTotalPage();
		allList = ashjlService.getAshjlList(xzfyId,time,location,ashHost,attendant);
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String addAshjl(){
		String currentTerm = new SimpleDateFormat("yyyy").format(new Date()).toString();
		String currentTime=new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		Random random = new Random();
		ashjlId= currentTime+random.nextInt(1000);
		committeeList = rddbService.getCommitteeListById(currentTerm);
		isModify="0";
		return SUCCESS;
	}
	public String saveAshjl(){
		if(isModify.equals("1")){
			ashjlService.deleteRelatedWypj(ashjlId);
			System.out.println(ashjlId+"delete");
		}
		if(!"".equals(upFileFileName)){
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String fileName = Calendar.getInstance().getTimeInMillis() + this.upFileFileName;
			String fileFlod = webRootPath + "uploadfiles/Ashjl/attachment/";
			File path = new File(fileFlod);
			if(!path.exists()){
				path.mkdirs();
			}
			File outFile = new File(fileFlod + fileName);
			this.getAshjlInfo().setFilePath(fileFlod + fileName);
			this.getAshjlInfo().setRealFilePath("../uploadfiles/Ashjl/attachment/" + fileName);
			this.getAshjlInfo().setFileName(this.upFileFileName);
			IOStream stream = new IOStream();
			stream.writeFileStream(upFile, outFile);
		}
		System.out.println(comtStr);
		String[] str1;             
		str1=comtStr.split(",");
		this.getHost().setIsHost("1");
		if(!this.getHost().getGrade().equals("0")){
			System.out.println(this.getHost().getGrade());
			System.out.println("that");
			graded="1";
		}
		this.getAshjlInfo().setHost(str1[0]);           //info表主持人
		this.getHost().setCommitteeName(str1[0]);
		this.getHost().setCommitteeId(Integer.parseInt(str1[1]));
		ashjlService.saveAshjlWypj(host);
		System.out.println(attendantName);
		String[] str2=attendantName.replaceAll(" ", "").split(",");
		System.out.println(attendantName);
		String[] str3;
		String attendantName="";
		System.out.println(grade);
		String[] str4=grade.replaceAll(" ", "").split(",");
		for (int i=0;i<str2.length;i++) {
			String an=str2[i];
			if(an!=""){
				str3=an.split(";");
				attendantName+=str3[0];
				AshjlWypj a = new AshjlWypj();
				a.setAshjlId(ashjlId);
				a.setCommitteeId(Integer.parseInt(str3[1]));
				a.setCommitteeName(str3[0]);
				a.setXzfyId(xzfyId);
				if(!str4[i].equals("未评价")){
					
				    graded="1";
				    System.out.println("this");
					a.setGrade(str4[i].substring(0,str4[i].indexOf("分")));
				} 
				else{
				a.setGrade("0");
				System.out.println("here");}
				a.setIsHost("0");
				ashjlService.saveAshjlWypj(a);
			}
			if(i!=str2.length-1)
				attendantName+="、";
		}
		this.getAshjlInfo().setAttendant(attendantName);
		this.getAshjlInfo().setGraded(graded);
		ashjlService.saveAshjlInfo(ashjlInfo);
		return SUCCESS;
	}
	public String modifyAshjl(){
		ashjlInfo=ashjlService.getAshjlInfo(ashjlId);
		host = ashjlService.getHost(ashjlId);
		wypjList = ashjlService.getWypjList(ashjlId);
		String currentTerm = new SimpleDateFormat("yyyy").format(new Date()).toString();
		System.out.println(currentTerm);
		committeeList = rddbService.getCommitteeListById(currentTerm);
		isModify="1";
		return SUCCESS;
	}


}
