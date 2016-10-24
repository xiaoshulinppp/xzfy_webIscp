package com.taiji.fzb.domain;

import com.taiji.core.domain.Entity;

public class Committee extends Entity{
      private Integer comtId;
      private String comtName;
      private String sexy;
      private String workName;
      private String phone;
      private Term term;
    
	public Integer getComtId() {
		return comtId;
	}
	public void setComtId(Integer comtId) {
		this.comtId = comtId;
	}
	public String getComtName() {
		return comtName;
	}
	public void setComtName(String comtName) {
		this.comtName = comtName;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Term getTerm() {
		return term;
	}
	public void setTerm(Term term) {
		this.term = term;
	}
      
}
