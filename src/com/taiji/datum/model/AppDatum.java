package com.taiji.datum.model;


import java.util.HashSet;
import java.util.Set;

import com.taiji.core.domain.Entity;

/**
 * AppDatum entity. @author MyEclipse Persistence Tools
 */

public class AppDatum extends Entity  implements java.io.Serializable{

	// Fields

	//private BigDecimal id;
	private String title;
	private String instruction;
	private String summary;
	private String keyword;
	private String uploadpeople;
	private String uploadtime;
	private String lastreadtime;
	private Integer readnum;
	private String status;
	private String type;
	private Integer userid;
	private Set datumfiles = new HashSet();

	// Constructors
	public AppDatum() {
		
	}
	/** default constructor */

	public AppDatum(String title, String instruction, String summary,
			String keyword, String uploadpeople, String uploadtime,
			String lastreadtime, Integer readnum, String status,String type,
			Integer userid) {
		
		this.title = title;
		this.instruction = instruction;
		this.summary = summary;
		this.keyword = keyword;
		this.uploadpeople = uploadpeople;
		this.uploadtime = uploadtime;
		this.lastreadtime = lastreadtime;
		this.readnum = readnum;
		this.status = status;
		this.type = type;
		this.userid = userid;
	}
	// Property accessors







	public String getTitle() {
		return this.title;
	}



	public void setTitle(String title) {
		this.title = title;
	}

	public String getInstruction() {
		return this.instruction;
	}

	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}

	public String getSummary() {
		return this.summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getKeyword() {
		return this.keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getUploadpeople() {
		return this.uploadpeople;
	}

	public void setUploadpeople(String uploadpeople) {
		this.uploadpeople = uploadpeople;
	}

	public String getUploadtime() {
		return this.uploadtime;
	}

	public void setUploadtime(String uploadtime) {
		this.uploadtime = uploadtime;
	}

	public String getLastreadtime() {
		return this.lastreadtime;
	}

	public void setLastreadtime(String lastreadtime) {
		this.lastreadtime = lastreadtime;
	}

	public Integer getReadnum() {
		return readnum;
	}

	public void setReadnum(Integer readnum) {
		this.readnum = readnum;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Set getDatumfiles() {
		return datumfiles;
	}
	public void setDatumfiles(Set datumfiles) {
		this.datumfiles = datumfiles;
	}
	
	

}