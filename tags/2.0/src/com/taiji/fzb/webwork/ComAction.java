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
import slime.util.file.FileDelete;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.Member;

import com.taiji.fzb.service.ComService;
import com.taiji.user.domain.User;
import com.taiji.webTemplate.domain.WtTemplate;
import com.taiji.webTemplate.service.WtTemplateService;

public class ComAction extends ProtectedDetailAction {

	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}
	
	private User user;
	private String admit_name;
	private ComService comService;
	private PaginationSupport pageList;
	private Integer pageSize = 15; // 分页列表每页显示个数

	private Integer totalPage = 0; // 分页列表页面总数

	private List allMemList;
	private Integer pNum=1;

	private List memberList;
	private Member member;
	private String comttId;
	private String action;
	private String tempName="";
	private String sexy="";
	private String phone="";
	private String corpName="";
	  private String certification="";
	  private String born="";
	  private String age="";
	  private String education="";
	  private String techType="";
	  private String email="";
    private String toDate;

	
	
	public String showMemList() {
		try {	
			tempName = new String(tempName.getBytes("ISO8859-1"), "UTF-8");
			corpName = new String(corpName.getBytes("ISO8859-1"), "UTF-8");
			born = new String(born.getBytes("ISO8859-1"), "UTF-8");
			education = new String(education.getBytes("ISO8859-1"), "UTF-8");
			techType = new String(techType.getBytes("ISO8859-1"), "UTF-8");
			/*String name="";
			if(tempName!=null&&!tempName.equals("")){
			name= new String(tempName.getBytes("ISO8859-1"), "UTF-8");}*/
			action="showMemList";
			allMemList=comService.getAllMemList(tempName,sexy,corpName,phone,certification,born,age,education,techType,email);
			this.pageList = this.comService.getMemList(this.pNum, this.pageSize,tempName,sexy,corpName,phone,certification,born,age,education,techType,email);
			this.memberList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();	
			
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	

	public String createNewComt(){
		try {
			toDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	
	public String saveNewComt(){
		try {
			comService.saveMem(member);	
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String updateComt(){
		member=comService.getMemById(comttId);
		return SUCCESS;
	}
	
	public String updateCommittee(){
		comService.updateMem(member);
		return SUCCESS;
	}
	
	
	public String deleteComt(){
		comService.deleteMemById(comttId);
		return SUCCESS;
	}
	

	public String getCorpName() {
		return corpName;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
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

	public List getAllMemList() {
		return allMemList;
	}

	public void setAllMemList(List allMemList) {
		this.allMemList = allMemList;
	}

	public String getComttId() {
		return comttId;
	}

	public void setComttId(String comttId) {
		this.comttId = comttId;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public ComService getComService() {
		return comService;
	}

	public void setComService(ComService comService) {
		this.comService = comService;
	}

	public List getMemberList() {
		return memberList;
	}

	public void setMemberList(List memberList) {
		this.memberList = memberList;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getTempName() {
		return tempName;
	}

	public void setTempName(String tempName) {
		this.tempName = tempName;
	}

	public String getSexy() {
		return sexy;
	}

	public void setSexy(String sexy) {
		this.sexy = sexy;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getCertification() {
		return certification;
	}


	public void setCertification(String certification) {
		this.certification = certification;
	}


	public String getBorn() {
		return born;
	}


	public void setBorn(String born) {
		this.born = born;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getEducation() {
		return education;
	}


	public void setEducation(String education) {
		this.education = education;
	}


	public String getTechType() {
		return techType;
	}


	public void setTechType(String techType) {
		this.techType = techType;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getToDate() {
		return toDate;
	}


	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
    
}
