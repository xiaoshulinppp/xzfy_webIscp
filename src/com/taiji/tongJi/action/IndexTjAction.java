package com.taiji.tongJi.action;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.service.RecordService;
import com.taiji.tongJi.action.tongJiService.IndexTjService;
import com.taiji.user.domain.Org;

public class IndexTjAction extends ProtectedDetailAction{

	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}
	
	IndexTjService indexTjService=null;
	
	
	String fyjgType="";//复议机关类别
	String tjyear="";//统计年份
	String justYear="";//用于"公正指标"统计
	
	String sysDate="";
	
	ArrayList<ArrayList<String>> eftIndexList=null;
	ArrayList<ArrayList<String>> justIndexList=null;
	private String startDate="";
	private String endDate="";
	private List allList;
	private String fileId1="";
	private Org org;
	private String message;
	private RecordService recordService;
	public String showQueryPanel() throws ParseException, SQLException{
		Date dt = new Date();
		DateFormat year = new SimpleDateFormat("yyyy");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		startDate = year.format(dt)+"-01-01";
		endDate = df.format(dt);
		allList=this.recordService.getCaseOrgList();
		fileId1=this.recordService.getOrg().getLocbm();
		this.org=this.recordService.getRootOrg(fileId1);
		this.message=org.getName();
		return SUCCESS;
	}
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public List getAllList() {
		return allList;
	}

	public void setAllList(List allList) {
		this.allList = allList;
	}

	public String getFileId1() {
		return fileId1;
	}

	public void setFileId1(String fileId1) {
		this.fileId1 = fileId1;
	}

	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public RecordService getRecordService() {
		return recordService;
	}

	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	public String getJustIndexTj() throws ParseException, SQLException{
		sysDate=new SimpleDateFormat("yyyy年MM月dd日").format(new Date());
		justIndexList=indexTjService.getJustLists(indexTjService.getYearlyCountLists(indexTjService.getFyjgLists(fyjgType),justYear),justYear);
		return SUCCESS;
	}

	public String getEftIndexTj() throws ParseException, SQLException{	
		sysDate=new SimpleDateFormat("yyyy年MM月dd日").format(new Date());
		eftIndexList=indexTjService.getEfficiencyLists(indexTjService.getFyjgLists(fyjgType),tjyear);
		return SUCCESS;
	}
		
	public ArrayList<ArrayList<String>> getJustIndexList() {
		return justIndexList;
	}

	public void setJustIndexList(ArrayList<ArrayList<String>> justIndexList) {
		this.justIndexList = justIndexList;
	}

	public String getJustYear() {
		return justYear;
	}

	public void setJustYear(String justYear) {
		this.justYear = justYear;
	}

	public String getSysDate() {
		return sysDate;
	}

	public void setSysDate(String sysDate) {
		this.sysDate = sysDate;
	}

	public IndexTjService getIndexTjService() {
		return indexTjService;
	}

	public void setIndexTjService(IndexTjService indexTjService) {
		this.indexTjService = indexTjService;
	}

	public ArrayList<ArrayList<String>> getEftIndexList() {
		return eftIndexList;
	}

	public void setEftIndexList(ArrayList<ArrayList<String>> eftIndexList) {
		this.eftIndexList = eftIndexList;
	}

	public String getTjyear() {
		return tjyear;
	}

	public void setTjyear(String tjyear) {
		this.tjyear = tjyear;
	}

	public String getFyjgType() {
		return fyjgType;
	}

	public void setFyjgType(String fyjgType) {
		this.fyjgType = fyjgType;
	}
}
