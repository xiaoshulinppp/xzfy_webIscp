package com.taiji.schedule.domain;

public class ScheduleInfo {
	private Integer id;
	private String scheduleDate;
	private String title;
	private String content;
	private String recorder;
	private Integer recorderId;
	public Integer getRecorderId() {
		return recorderId;
	}
	public void setRecorderId(Integer recorderId) {
		this.recorderId = recorderId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(String scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRecorder() {
		return recorder;
	}
	public void setRecorder(String recorder) {
		this.recorder = recorder;
	}

}
