package com.taiji.jdaj.domain;

import java.util.LinkedHashSet;
import java.util.Set;

public class JdajInfo {
	private String id;          //主键
	private String receiveDate;    //接受日期
	private String documentNumber;   //文号
	private String method;                //接收材料方式
	private String feedback;               //反映内容
	private String proposal;               //建议
	private String undertaker;              //承办人
	private String filePath; // 模板截图完整路径
	private String realFilePath; // 模板截图绝对路径
	private String fileName;     //附件名称
	private String state;       //案件状态
	private String appNames;
	private Set<JdajApp> apps = new LinkedHashSet<JdajApp>();
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}
	public String getDocumentNumber() {
		return documentNumber;
	}
	public void setDocumentNumber(String documentNumber) {
		this.documentNumber = documentNumber;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public String getProposal() {
		return proposal;
	}
	public void setProposal(String proposal) {
		this.proposal = proposal;
	}
	public String getUndertaker() {
		return undertaker;
	}
	public void setUndertaker(String undertaker) {
		this.undertaker = undertaker;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getRealFilePath() {
		return realFilePath;
	}
	public void setRealFilePath(String realFilePath) {
		this.realFilePath = realFilePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setAppNames(String appNames) {
		this.appNames = appNames;
	}
	public String getAppNames() {
		return appNames;
	}
	public void setApps(Set<JdajApp> apps) {
		this.apps = apps;
	}
	public Set<JdajApp> getApps() {
		return apps;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getState() {
		return state;
	}
	

}
