package com.taiji.tzjl.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.tzjl.domain.TzjlInfo;

public interface TzjlService extends ICoreService {
	public List<TzjlInfo> getTzjlList(String id,String time,String location,String host,String attendant);
	public void saveTzjlInfo(TzjlInfo tzjlInfo);
	public TzjlInfo getTzjlInfo(int id);
	public PaginationSupport getListByPage(int pageNumber, int pageSize,String id,String time,String location,String host,String attendant);

}
