package com.taiji.fzb.domain;

import com.taiji.core.domain.Entity;

public class Member extends Entity{
	private Integer memId;//id
    private String memName;//姓名
    private String sexy;//性别
    private String workName;//工作单位
    private String education;//学历
    
    private String type;//类别
    private String position;//职务
    
    private String phone;//电话号码
    private String recordDate;//填写日期
    private String locbm;

	public String getLocbm() {
		return locbm;
	}

	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}

	public Integer getMemId() {
		return memId;
	}

	public void setMemId(Integer memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getSexy() {
		return sexy;
	}

	public void setSexy(String sexy) {
		this.sexy = sexy;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRecordDate() {
		return recordDate;
	}

	public void setRecordDate(String recordDate) {
		this.recordDate = recordDate;
	}
}
