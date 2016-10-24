package com.taiji.ashjl.service.impl;

import java.util.List;

import com.taiji.ashjl.service.AshjlService;
import com.taiji.ashjl.domain.AshjlInfo;
import com.taiji.ashjl.domain.AshjlWypj;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;

public class AshjlServiceImpl extends CoreServiceImpl implements AshjlService{

	@Override
	public void saveAshjlInfo(AshjlInfo ashjlInfo) {
		super.saveOrUpdate(ashjlInfo);
	}

	@Override
	public List<AshjlInfo> getAshjlList(String xzfyId,String time,String location,String host,String attendant) {
		String HQL="";
		HQL+="from AshjlInfo ashjl where ashjl.xzfyId = '"+xzfyId+"'";
		if(time!=null&&!time.equals("")){HQL+=" and ashjl.time = '"+time+"'";}
		if(location!=null&&!location.equals("")){HQL+=" and ashjl.location like '%"+location+"%'";}
		if(host!=null&&!host.equals("")){HQL+=" and info.host = '"+host+"'";}
		if(attendant!=null&&!attendant.equals("")){HQL+=" and ashjl.attendant like '%"+attendant+"%'";}
		List<AshjlInfo> list = super.find(HQL);
		return list;
	}

	@Override
	public void saveAshjlWypj(AshjlWypj ashjlWypj) {
		super.saveOrUpdate(ashjlWypj);	
	}

	public AshjlInfo getAshjlInfo(String id) {
		String HQL="";
		HQL+="from AshjlInfo ashjlInfo where ashjlInfo.xzfyId = '"+id+"'";
		List<AshjlInfo> list = super.find(HQL);
		AshjlInfo ashjlInfo = new AshjlInfo();
		if(list.isEmpty())
			{ashjlInfo = new AshjlInfo();}
		else
			{ashjlInfo=list.get(0);}
		
		return ashjlInfo;
	}

	@Override
	public AshjlWypj getHost(String id) {
		String HQL="";
		HQL+="from AshjlWypj wypj where wypj.ashjlId = '"+id+"' and wypj.isHost = '1'";
		List<AshjlWypj> list =super.find(HQL);
		AshjlWypj host = new AshjlWypj();
		if(list.isEmpty())
			host = new AshjlWypj();
		else
			host = list.get(0);
		return host;
	}

	@Override
	public List<AshjlWypj> getWypjList(String id) {
		String HQL="";
		HQL+="from AshjlWypj wypj where wypj.ashjlId = '"+id+"' and wypj.isHost = '0'";
		return super.find(HQL);
	}

	@Override
	public void deleteRelatedWypj(String id) {
		String HQL="";
		HQL+="delete from AshjlWypj wypj where wypj.ashjlId='"+id+"'";
		super.deleteAll(HQL);	
	}

	@Override
	public PaginationSupport getListByPage(int pageNumber, int pageSize,
			String id,String time,String location,String host,String attendant) {
		String HQL="";
		HQL+=" from AshjlInfo info where info.xzfyId = '"+id+"'";
		if(time!=null&&!time.equals("")){HQL+=" and info.time = '"+time+"'";}
		if(location!=null&&!location.equals("")){HQL+=" and info.location like '%"+location+"%'";}
		if(host!=null&&!host.equals("")){HQL+=" and info.host = '"+host+"'";}
		if(attendant!=null&&!attendant.equals("")){HQL+=" and info.attendant like '%"+attendant+"%'";}
		return super.find(HQL, pageNumber, pageSize);
	}

}
