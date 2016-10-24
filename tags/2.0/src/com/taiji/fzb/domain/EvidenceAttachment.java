package com.taiji.fzb.domain;

public class EvidenceAttachment {
	private Integer id;
	private String xzfyId;
	private String dftzId;
	public String getDftzId() {
		return dftzId;
	}
	public void setDftzId(String dftzId) {
		this.dftzId = dftzId;
	}
	private String fileName;
	private String realFilePath;
	private String filePath;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getXzfyId() {
		return xzfyId;
	}
	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getRealFilePath() {
		return realFilePath;
	}
	public void setRealFilePath(String realFilePath) {
		this.realFilePath = realFilePath;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
