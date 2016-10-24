package com.taiji.schedule.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.schedule.domain.ScheduleInfo;

public interface ScheduleService extends ICoreService{
	public void saveSchedule(ScheduleInfo scheduleInfo);
	public List<ScheduleInfo> getScheduleList(String scheduleDate,String title,Integer id);
	public void deleteSchedule(int id);
	public ScheduleInfo getScheduleInfo(int id);
}
