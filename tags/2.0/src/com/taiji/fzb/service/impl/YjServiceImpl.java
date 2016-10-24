package com.taiji.fzb.service.impl;

import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.YjService;

public class YjServiceImpl extends CoreServiceImpl implements YjService {

	@Override
	public PaginationSupport getList(int pNum,int pageSize) {
		String HQL="";
		HQL+="from XzfyInfo xzfyInfo where 1=1";
		return super.find(HQL, pNum, pageSize);
	}

	@Override
	public List<XzfyInfo> allList() {
		String HQL="";
		HQL+="from XzfyInfo xzfyInfo where 1=1";
		return super.find(HQL);
	}

}
