package com.taiji.schedule.webwork;

import java.util.*;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.schedule.domain.ScheduleInfo;
import com.taiji.schedule.service.ScheduleService;
import com.taiji.user.domain.User;

public class ScheduleDetailAction extends ProtectedDetailAction{
	private static final long serialVersionUID = 1L;
	private String title;
	private String scheduleDate;
	private Integer id;
	private ScheduleService scheduleService=null;
	private ScheduleInfo scheduleInfo;
	private List<ScheduleInfo> scheduleList = new ArrayList<ScheduleInfo>();
	private User user;
	private String userName;
	private Integer userId;
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(String scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public ScheduleService getScheduleService() {
		return scheduleService;
	}

	public void setScheduleService(ScheduleService scheduleService) {
		this.scheduleService = scheduleService;
	}

	public ScheduleInfo getScheduleInfo() {
		return scheduleInfo;
	}

	public void setScheduleInfo(ScheduleInfo scheduleInfo) {
		this.scheduleInfo = scheduleInfo;
	}

	public List<ScheduleInfo> getScheduleList() {
		return scheduleList;
	}

	public void setScheduleList(List<ScheduleInfo> scheduleList) {
		this.scheduleList = scheduleList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Override
	public Class getPersistentClass() {
		return ScheduleInfo.class;
	}
	
	public String gotoCreate(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(                  //新建典型案例
				"_USER_LOGIN_");
		userName = user.getName();
		userId = user.getId();
		return SUCCESS;	
	}
	public String saveSchedule(){
		scheduleService.saveSchedule(scheduleInfo);
		return SUCCESS;
	}
	public String showSchedule(){
		scheduleInfo = scheduleService.getScheduleInfo(id);
		return SUCCESS;
	}
	public String showScheduleList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(                  //新建典型案例
				"_USER_LOGIN_");
		userName = user.getName();
		userId = user.getId();
		scheduleList = scheduleService.getScheduleList(scheduleDate, title,userId);
		return SUCCESS;
	}
	public String deleteSchedule(){
		scheduleService.deleteSchedule(id);
		return SUCCESS;
	}

}
