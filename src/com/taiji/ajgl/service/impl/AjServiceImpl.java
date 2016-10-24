package com.taiji.ajgl.service.impl;

import java.util.List;

import com.taiji.ajgl.domain.AjAttachment;
import com.taiji.ajgl.service.AjService;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyInfo;

public class AjServiceImpl extends CoreServiceImpl implements AjService {


	public List<XzfyInfo> getAllList1(String locbm,String liAnDate,String appName,String tjzfzh,String admit,String defendant) {
		String HQL="";
		HQL+="from XzfyInfo xzfyInfo where xzfyInfo.caseorg ='"+locbm+"' and xzfyInfo.status = '12'";
		if(liAnDate!=null&&!liAnDate.equals("")){HQL+=" and xzfyInfo.lian_date = '"+liAnDate+"'";}
		if(appName!=null&&!appName.equals("")){HQL+=" and xzfyInfo.app_show like '%"+appName+"%'";}
		if(defendant!=null&&!defendant.equals("")){HQL+=" and xzfyInfo.defendant_name like '%"+defendant+"%'";}
		if(tjzfzh!=null&&!tjzfzh.equals("")){HQL+=" and xzfyInfo.tjzfzh = '"+tjzfzh+"'";}
		if(admit!=null&&!admit.equals("")){HQL+=" and xzfyInfo.user2_name ='"+admit+"'";}
		return super.find(HQL);
	}

	public List<XzfyInfo> getAllList2(String locbm,String liAnDate,String appName,String tjzfzh,String admit,String defendant) {
		String HQL="";
		HQL+="from XzfyInfo xzfyInfo where xzfyInfo.caseorg ='"+locbm+"' and xzfyInfo.status in ('13')";
		if(liAnDate!=null&&!liAnDate.equals("")){HQL+=" and xzfyInfo.lian_date = '"+liAnDate+"'";}
		if(appName!=null&&!appName.equals("")){HQL+=" and xzfyInfo.app_show like '%"+appName+"%'";}
		if(defendant!=null&&!defendant.equals("")){HQL+=" and xzfyInfo.defendant_name like '%"+defendant+"%'";}
		if(tjzfzh!=null&&!tjzfzh.equals("")){HQL+=" and xzfyInfo.tjzfzh = '"+tjzfzh+"'";}
		if(admit!=null&&!admit.equals("")){HQL+=" and xzfyInfo.user2_name ='"+admit+"'";}
		return super.find(HQL);
	}

	public List<AjAttachment> getAttachmentList(String xzfyId) {
		String HQL="";
		HQL+="from AjAttachment a where a.xzfyId = '"+xzfyId+"'";
		return super.find(HQL);
	}

	public PaginationSupport getList1ByPage(int pNum, int pageSize, String locbm,String liAnDate,String appName,String tjzfzh,String admit,String defendant) {
		String HQL="";
		HQL+="from XzfyInfo xzfyInfo where xzfyInfo.caseorg ='"+locbm+"' and xzfyInfo.status = '12'";
		if(liAnDate!=null&&!liAnDate.equals("")){HQL+=" and xzfyInfo.lian_date = '"+liAnDate+"'";}
		if(defendant!=null&&!defendant.equals("")){HQL+=" and xzfyInfo.defendant_name like '%"+defendant+"%'";}
		if(appName!=null&&!appName.equals("")){HQL+=" and xzfyInfo.app_show like '%"+appName+"%'";}
		if(tjzfzh!=null&&!tjzfzh.equals("")){HQL+=" and xzfyInfo.tjzfzh = '"+tjzfzh+"'";}
		if(admit!=null&&!admit.equals("")){HQL+=" and xzfyInfo.user2_name ='"+admit+"'";}
		return super.find(HQL,pNum,pageSize);
	}

	public PaginationSupport getList2ByPage(int pNum, int pageSize, String locbm,String liAnDate,String appName,String tjzfzh,String admit,String defendant) {
		String HQL="";
		HQL+="from XzfyInfo xzfyInfo where xzfyInfo.caseorg ='"+locbm+"' and xzfyInfo.status in ('13')";
		if(liAnDate!=null&&!liAnDate.equals("")){HQL+=" and xzfyInfo.lian_date = '"+liAnDate+"'";}
		if(appName!=null&&!appName.equals("")){HQL+=" and xzfyInfo.app_show like '%"+appName+"%'";}
		if(defendant!=null&&!defendant.equals("")){HQL+=" and xzfyInfo.defendant_name like '%"+defendant+"%'";}
		if(tjzfzh!=null&&!tjzfzh.equals("")){HQL+=" and xzfyInfo.tjzfzh = '"+tjzfzh+"'";}
		if(admit!=null&&!admit.equals("")){HQL+=" and xzfyInfo.user2_name ='"+admit+"'";}
		return super.find(HQL,pNum,pageSize);
	}

	@Override
	public void saveAjAttachment(AjAttachment a) {
		super.save(a);
		
	}

	@Override
	public void deleteAttachment(String id) {
		String HQL="";
		HQL+="delete from AjAttachment a where a.id='"+id+"'";
		super.deleteAllBySQL(HQL);
	}

}
