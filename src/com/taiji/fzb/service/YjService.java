package com.taiji.fzb.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyInfo;

public interface YjService extends ICoreService{
	public PaginationSupport getList(int pNum,int pageSize);
	public List<XzfyInfo> allList();
}
