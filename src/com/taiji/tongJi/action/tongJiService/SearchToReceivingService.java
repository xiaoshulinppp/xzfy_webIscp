package com.taiji.tongJi.action.tongJiService;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyRecieve;

public interface SearchToReceivingService extends ICoreService{
	public PaginationSupport getCurrentList(int pageNumber,int pageSize,String appType,String civilKeyword,String legalKeyword,String behaviorName,String behaviorNum,String fyjgName,String respondent,String startJieDaiDate,String endJieDaiDate);
    public List<XzfyRecieve> getAllList(String appType,String civilKeyword,String legalKeyword,String behaviorName,String behaviorNum,String fyjgName,String respondent,String startJieDaiDate,String endJieDaiDate);
}
