package com.taiji.fzb.domain;

import java.util.Set;
import java.util.LinkedHashSet;

public class XzfyShenpi {

	
	
	private int id;
	//private String xzfy_id;
	private String check_type;
	public String getCheck_type() {
		return check_type;
	}
	public void setCheck_type(String checkType) {
		check_type = checkType;
	}
	public String getCheck_id() {
		return check_id;
	}
	public void setCheck_id(String checkId) {
		check_id = checkId;
	}
	public String getCheck_name() {
		return check_name;
	}
	public void setCheck_name(String checkName) {
		check_name = checkName;
	}
	public String getCheck_result() {
		return check_result;
	}
	public void setCheck_result(String checkResult) {
		check_result = checkResult;
	}
	public String getCheck_advise() {
		return check_advise;
	}
	public void setCheck_advise(String checkAdvise) {
		check_advise = checkAdvise;
	}
	public String getCheck_date() {
		return check_date;
	}
	public void setCheck_date(String checkDate) {
		check_date = checkDate;
	}
	public String getSqspren_id() {
		return sqspren_id;
	}
	public void setSqspren_id(String sqsprenId) {
		sqspren_id = sqsprenId;
	}
	public String getSqspren_name() {
		return sqspren_name;
	}
	public void setSqspren_name(String sqsprenName) {
		sqspren_name = sqsprenName;
	}
	private String check_id;
	private String check_name;
	private String check_result;
	private String check_advise;
	private String check_date;
	private String sqspren_id;
	private String sqspren_name;

	private XzfyInfo xzfyInfo;
	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}
	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	/*public String getXzfy_id() {
		return xzfy_id;
	}
	public void setXzfy_id(String xzfyId) {
		xzfy_id = xzfyId;
	}*/

	
	
	
	
	
	
	
	

}