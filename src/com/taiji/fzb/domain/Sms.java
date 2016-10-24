package com.taiji.fzb.domain;

public class Sms{
	private int id;
	private String xzfy_id;
	private String userid;
	private String userorg;
	private String message;
	private String username;
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserorg() {
		return userorg;
	}
	public void setUserorg(String userorg) {
		this.userorg = userorg;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}