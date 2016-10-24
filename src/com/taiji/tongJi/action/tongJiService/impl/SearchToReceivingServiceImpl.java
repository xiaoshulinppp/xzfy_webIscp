package com.taiji.tongJi.action.tongJiService.impl;

import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyRecieve;
import com.taiji.tongJi.action.tongJiService.SearchToReceivingService;

public class SearchToReceivingServiceImpl extends CoreServiceImpl implements SearchToReceivingService{

	@Override
	public List<XzfyRecieve> getAllList(String appType,
			String civilKeyword, String legalKeyword, String behaviorName,
			String behaviorNum, String fyjgName, String respondent,
			String startJieDaiDate, String endJieDaiDate) {
		// TODO Auto-generated method stub
		String HQL="";
		HQL+=" from XzfyRecieve xzfy";
		HQL+=" where 1=1";
		if(null!=appType&&!"".equals(appType)){HQL+=" and xzfy.app_type='"+appType+"'";}
		if(null!=civilKeyword&&!"".equals(civilKeyword)){HQL+=" and xzfy.appdetail like '%"+civilKeyword+"%'";}
		if(null!=legalKeyword&&!"".equals(legalKeyword)){HQL+=" and xzfy.agentDetail like '%"+legalKeyword+"%'";}
		if(null!=behaviorName&&!"".equals(behaviorName)){HQL+=" and xzfy.xwname like '%"+behaviorName+"%'";}
		if(null!=behaviorNum&&!"".equals(behaviorNum)){HQL+=" and xzfy.xwnum like '%"+behaviorNum+"%'";}
		if(null!=fyjgName&&!"".equals(fyjgName)){HQL+=" and xzfy.xzfy_org='"+fyjgName+"'";}
		if(null!=respondent&&!"".equals(respondent)){HQL+=" and xzfy.defendant_real_name like '%"+respondent+"%'";}
		if(null!=startJieDaiDate&&!"".equals(startJieDaiDate)){HQL+=" and xzfy.receive_date >='"+startJieDaiDate+"'";}
		if(null!=endJieDaiDate&&!"".equals(endJieDaiDate)){HQL+=" and xzfy.receive_date <='"+endJieDaiDate+"'";}
		return super.find(HQL);
	}

	@Override
	public PaginationSupport getCurrentList(int pageNumber, int pageSize,
		    String appType, String civilKeyword,
			String legalKeyword, String behaviorName, String behaviorNum,
			String fyjgName, String respondent, String startJieDaiDate,
			String endJieDaiDate) {
		// TODO Auto-generated method stub
		String HQL="";
		HQL+=" from XzfyRecieve xzfy";
		HQL+=" where 1=1";
		if(null!=appType&&!"".equals(appType)){HQL+=" and xzfy.app_type='"+appType+"'";}
		if(null!=civilKeyword&&!"".equals(civilKeyword)){HQL+=" and xzfy.appdetail like '%"+civilKeyword+"%'";}
		if(null!=legalKeyword&&!"".equals(legalKeyword)){HQL+=" and xzfy.agentDetail like '%"+legalKeyword+"%'";}
		if(null!=behaviorName&&!"".equals(behaviorName)){HQL+=" and xzfy.xwname like '%"+behaviorName+"%'";}
		if(null!=behaviorNum&&!"".equals(behaviorNum)){HQL+=" and xzfy.xwnum like '%"+behaviorNum+"%'";}
		if(null!=fyjgName&&!"".equals(fyjgName)){HQL+=" and xzfy.xzfy_org='"+fyjgName+"'";}
		if(null!=respondent&&!"".equals(respondent)){HQL+=" and xzfy.defendant_name like '%"+respondent+"%'";}
		if(null!=startJieDaiDate&&!"".equals(startJieDaiDate)){HQL+=" and xzfy.receive_date >='"+startJieDaiDate+"'";}
		if(null!=endJieDaiDate&&!"".equals(endJieDaiDate)){HQL+=" and xzfy.receive_date <='"+endJieDaiDate+"'";}
		return super.find(HQL,pageNumber,pageSize);
	}

}
