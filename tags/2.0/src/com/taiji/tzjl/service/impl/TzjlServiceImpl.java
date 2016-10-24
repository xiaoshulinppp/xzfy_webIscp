package com.taiji.tzjl.service.impl;

import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.tzjl.domain.TzjlInfo;
import com.taiji.tzjl.service.TzjlService;

public class TzjlServiceImpl extends CoreServiceImpl implements TzjlService {

	@SuppressWarnings("unchecked")
	@Override
	public List<TzjlInfo> getTzjlList(String id,String time,String location,String host,String attendant) {
		String HQL="";
		HQL+="from TzjlInfo info where info.xzfyId = '"+id+"'";
		if(time!=null&&!time.equals("")){HQL+=" and info.time = '"+time+"'";}
		if(location!=null&&!location.equals("")){HQL+=" and info.location like '%"+location+"%'";}
		if(host!=null&&!host.equals("")){HQL+=" and info.host = '"+host+"'";}
		if(attendant!=null&&!attendant.equals("")){HQL+=" and info.attendant like '%"+attendant+"%'";}
		List<TzjlInfo> list = super.find(HQL);
		return list;
	}
	@Override
	public void saveTzjlInfo(TzjlInfo tzjlInfo) {
		super.saveOrUpdate(tzjlInfo);
		
	}
	@Override
	public TzjlInfo getTzjlInfo(int id) {
		String HQL="";
		HQL+=" from TzjlInfo tzjlInfo where tzjlInfo.id= "+id;
		List<TzjlInfo> list=super.find(HQL);
		TzjlInfo tzjlInfo = new TzjlInfo();
		if (list.isEmpty()) {
			tzjlInfo = new TzjlInfo();
		} else {
			tzjlInfo = list.get(0);
		}
		return tzjlInfo;
	}
	@Override
	public PaginationSupport getListByPage(int pageNumber, int pageSize,String id
			,String time,String location,String host,String attendant) {
		String HQL="";
		HQL+=" from TzjlInfo info where info.xzfyId = '"+id+"'";
		if(time!=null&&!time.equals("")){HQL+=" and info.time = '"+time+"'";}
		if(location!=null&&!location.equals("")){HQL+=" and info.location like '%"+location+"%'";}
		if(host!=null&&!host.equals("")){HQL+=" and info.host = '"+host+"'";}
		if(attendant!=null&&!attendant.equals("")){HQL+=" and info.attendant like '%"+attendant+"%'";}
		return super.find(HQL, pageNumber, pageSize);
	}

}
