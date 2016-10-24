package com.taiji.fzb.domain;

public class XzfyKeyword{
	private int id;
	private String xzfy_id;
	private String keyword;
	private String status;
	private String locbm;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getXzfy_id() {
		return xzfy_id;
	}
	public void setXzfy_id(String xzfyId) {
		xzfy_id = xzfyId;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLocbm() {
		return locbm;
	}
	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}
}