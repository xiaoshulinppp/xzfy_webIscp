package com.taiji.fzb.domain;

import com.taiji.core.domain.Entity;

@SuppressWarnings("serial")
public class DxalComment extends Entity{
    
	//private String info_id;
	private String comment;
	private Integer commenter_id;
	private String commenter_name;
	private String time;

//	public String getInfo_id() {
//		return info_id;
//	}
//	public void setInfo_id(String info_Id) {
//		this.info_id = info_Id;
//	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Integer getCommenter_id() {
		return commenter_id;
	}
	public void setCommenter_id(Integer commenterId) {
		commenter_id = commenterId;
	}
	public String getCommenter_name() {
		return commenter_name;
	}
	public void setCommenter_name(String commenter_name) {
		this.commenter_name = commenter_name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	private DxalInfo dxalinfo = new DxalInfo();
	public DxalInfo getDxalinfo() {
		return dxalinfo;
	}
	public void setDxalinfo(DxalInfo dxalinfo) {
		this.dxalinfo = dxalinfo;
	}
	

}
