package com.taiji.fzb.domain;

import java.util.LinkedHashSet;
import java.util.Set;

public class DxalInfo {
	
	private String id;
	private String title;
	private String submit_date;
	private String keyword;
	private String case_type;
	private String remarks;
	private String submitter;
	private String department;
	private String filePath = ""; // 模板截图完整路径
	private String realFilePath = ""; // 模板截图绝对路径
	private String fileName;
	private int read_count;
	private int comment_count;
	private int marks;
	private String org_locbm;
	private String firstAuthor;
	private String secondAuthor;
	private String userNames;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubmit_date() {
		return submit_date;
	}
	public void setSubmit_date(String submit_date) {
		this.submit_date = submit_date;
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
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getSubmitter() {
		return submitter;
	}
	public void setSubmitter(String submitter) {
		this.submitter = submitter;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int readCount) {
		read_count = readCount;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int commentCount) {
		comment_count = commentCount;
	}
	public int getMarks() {
		return marks;
	}
	public void setMarks(int marks) {
		this.marks = marks;
	}
	private Set<DxalComment> dxalcomments = new LinkedHashSet<DxalComment>();
	public Set<DxalComment> getDxalcomments() {
		return dxalcomments;
	}
	public void setDxalcomments(Set<DxalComment> dxalcomments) {
		this.dxalcomments = dxalcomments;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setRealFilePath(String realFilePath) {
		this.realFilePath = realFilePath;
	}
	public String getRealFilePath() {
		return realFilePath;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setOrg_locbm(String org_locbm) {
		this.org_locbm = org_locbm;
	}
	public String getOrg_locbm() {
		return org_locbm;
	}
	public void setFirstAuthor(String firstAuthor) {
		this.firstAuthor = firstAuthor;
	}
	public String getFirstAuthor() {
		return firstAuthor;
	}
	public void setSecondAuthor(String secondAuthor) {
		this.secondAuthor = secondAuthor;
	}
	public String getSecondAuthor() {
		return secondAuthor;
	}
	public void setUserNames(String userNames) {
		this.userNames = userNames;
	}
	public String getUserNames() {
		return userNames;
	}


}
