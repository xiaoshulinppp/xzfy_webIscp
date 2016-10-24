package com.taiji.ashjl.service;

import java.util.List;

import com.taiji.ashjl.domain.AshjlInfo;
import com.taiji.ashjl.domain.AshjlWypj;
import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;

public interface AshjlService extends ICoreService {
	public void saveAshjlInfo(AshjlInfo ashjlInfo);
	public List<AshjlInfo> getAshjlList(String xzfyId,String time,String location,String host,String attendant);
	public void saveAshjlWypj(AshjlWypj ashjlWypj);
	public AshjlInfo getAshjlInfo(String id);
	public AshjlWypj getHost(String id);
	public List<AshjlWypj> getWypjList(String id);
	public void deleteRelatedWypj(String id);
	public PaginationSupport getListByPage(int pageNumber, int pageSize,String id,String time,String location,String host,String attendant);

}
