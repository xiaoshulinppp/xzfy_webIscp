package com.taiji.schedule.service.impl;

import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.schedule.domain.ScheduleInfo;
import com.taiji.schedule.service.ScheduleService;

public class ScheduleServiceImpl extends CoreServiceImpl implements ScheduleService {

	@Override
	public void deleteSchedule(int id) {
		String HQL="";
		HQL+="delete from ScheduleInfo s where s.id = "+id+"";
		super.deleteAllBySQL(HQL);
	}

	@Override
	public List<ScheduleInfo> getScheduleList(String scheduleDate, String title,Integer id) {
		String HQL="";
		HQL+="from ScheduleInfo s where 1=1";
		if(scheduleDate!=null&&!scheduleDate.equals("")){HQL+=" and s.scheduleDate = '"+scheduleDate+"'";}
		if(title!=null&&!title.equals("")){HQL+=" and s.title = '"+title+"'";}
		HQL+=" and s.recorderId = "+id;
		HQL+=" order by s.id desc";
		return super.find(HQL);
	}

	@Override
	public void saveSchedule(ScheduleInfo scheduleInfo) {
		super.saveOrUpdate(scheduleInfo);	
	}

	@Override
	public ScheduleInfo getScheduleInfo(int id) {
		String HQL="";
		HQL+="from ScheduleInfo s where s.id = "+id;
		List<ScheduleInfo> list = super.find(HQL);
		ScheduleInfo s = new ScheduleInfo();
		if(list.isEmpty()){
			s = new ScheduleInfo();
		}else{
			s = list.get(0);
		}
		return s;
	}

}
