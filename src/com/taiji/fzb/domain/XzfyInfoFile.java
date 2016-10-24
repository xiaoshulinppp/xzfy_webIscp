package com.taiji.fzb.domain;

import com.taiji.core.domain.Entity;

@SuppressWarnings("serial")
public class XzfyInfoFile extends Entity{	

	private String xzfy_id;
	
	private XzfyInfo xzfyInfo;
	
	private String fileName;
	private String storedLocation;
	private String storedName;
	private String type;
	
	public String getXzfy_id() {
		return xzfy_id;
	}
	public void setXzfy_id(String xzfyId) {
		xzfy_id = xzfyId;
	}
	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}
	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getStoredLocation() {
		return storedLocation;
	}
	public void setStoredLocation(String storedLocation) {
		this.storedLocation = storedLocation;
	}
	public String getStoredName() {
		return storedName;
	}
	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}

