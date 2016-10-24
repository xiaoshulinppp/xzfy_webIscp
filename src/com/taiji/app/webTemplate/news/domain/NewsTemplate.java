package com.taiji.app.webTemplate.news.domain;

import java.io.Serializable;

import com.taiji.core.domain.Entity;
import com.taiji.webTemplate.domain.WtClassify;

public class NewsTemplate extends Entity implements Serializable {

	private static final long serialVersionUID = 1L;

	// 类成员

	private WtClassify classify = new WtClassify(); // 栏目对象

	private String title = ""; // 标题

	private String source = ""; // 来源

	private String editor = ""; // 编辑

	private String author = ""; // 作者

	private String date = ""; // 日期

	private String time = ""; // 时间

	private String dateTime = ""; // 日期时间

	private String filePath = ""; // 文件完整路径

	private String fileName = ""; // 文件名称

	private String fileFlod = ""; // 文件路径

	private String imagePath = ""; // 图片完整路径

	private String imageName = ""; // 图片名称

	private String imageFlod = ""; // 图片路径

	private String content = ""; // 内容

	private String introduction = ""; // 简介

	private Integer stick = Integer.valueOf(0); // 置顶标志位

	private Integer report = Integer.valueOf(0); // 提交标志位

	private Integer audit = Integer.valueOf(0); // 审核标志位

	private Integer release = Integer.valueOf(0); // 发布标志位

	private Integer delete = Integer.valueOf(0); // 删除标志位

	private String remarks = ""; // 备注

	private String state = ""; // 状态标志位

	private String power = ""; // 权限标志位

	private String stickDateTime = ""; // 置顶排序时间字段

	private String reportDateTime = ""; // 提交日期时间

	private String auditDateTime = ""; // 审核日期时间

	private String releaseDateTime = ""; // 发布日期时间

	private String deleteDateTime = ""; // 删除日期时间

	private String updateDateTime = ""; // 修改日期时间

	// Set和Get方法

	public WtClassify getClassify() {
		return classify;
	}

	public void setClassify(WtClassify classify) {
		this.classify = classify;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileFlod() {
		return fileFlod;
	}

	public void setFileFlod(String fileFlod) {
		this.fileFlod = fileFlod;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImageFlod() {
		return imageFlod;
	}

	public void setImageFlod(String imageFlod) {
		this.imageFlod = imageFlod;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Integer getStick() {
		return stick;
	}

	public void setStick(Integer stick) {
		this.stick = stick;
	}

	public Integer getReport() {
		return report;
	}

	public void setReport(Integer report) {
		this.report = report;
	}

	public Integer getAudit() {
		return audit;
	}

	public void setAudit(Integer audit) {
		this.audit = audit;
	}

	public Integer getRelease() {
		return release;
	}

	public void setRelease(Integer release) {
		this.release = release;
	}

	public Integer getDelete() {
		return delete;
	}

	public void setDelete(Integer delete) {
		this.delete = delete;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}

	public String getStickDateTime() {
		return stickDateTime;
	}

	public void setStickDateTime(String stickDateTime) {
		this.stickDateTime = stickDateTime;
	}

	public String getReportDateTime() {
		return reportDateTime;
	}

	public void setReportDateTime(String reportDateTime) {
		this.reportDateTime = reportDateTime;
	}

	public String getAuditDateTime() {
		return auditDateTime;
	}

	public void setAuditDateTime(String auditDateTime) {
		this.auditDateTime = auditDateTime;
	}

	public String getReleaseDateTime() {
		return releaseDateTime;
	}

	public void setReleaseDateTime(String releaseDateTime) {
		this.releaseDateTime = releaseDateTime;
	}

	public String getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(String deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	public String getUpdateDateTime() {
		return updateDateTime;
	}

	public void setUpdateDateTime(String updateDateTime) {
		this.updateDateTime = updateDateTime;
	}

}
