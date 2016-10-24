package com.taiji.fzb.domain;

import java.util.Set;


public class Term {
      private String termId;
      private String currentTermNo;
      private String createTime;
      private Set comts;
	public String getTermId() {
		return termId;
	}
	public void setTermId(String termId) {
		this.termId = termId;
	}
	public String getCurrentTermNo() {
		return currentTermNo;
	}
	public void setCurrentTermNo(String currentTermNo) {
		this.currentTermNo = currentTermNo;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Set getComts() {
		return comts;
	}
	public void setComts(Set comts) {
		this.comts = comts;
	}
      
}
