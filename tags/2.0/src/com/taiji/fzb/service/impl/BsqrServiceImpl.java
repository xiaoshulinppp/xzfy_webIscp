package com.taiji.fzb.service.impl;

import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.EvidenceAttachment;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.BsqrService;

public class BsqrServiceImpl extends CoreServiceImpl implements BsqrService {

	@Override
	public XzfyInfo getXzfyInfo(String id) {
		String HQL="";
		HQL+="from XzfyInfo xzfyInfo where xzfyInfo.id ='"+id+"'";
		List<XzfyInfo> list = super.find(HQL);
		XzfyInfo xzfyInfo = new XzfyInfo();
		if(list.isEmpty())
			xzfyInfo = new XzfyInfo();
		else
			xzfyInfo = list.get(0);
		return xzfyInfo;
	}


	public List<XzfyInfo> getXzfyList(String id,String liAnDate,String appName,String defendant,String tjzfzh,String admit) {
		String HQL="";
		HQL+="from XzfyInfo xzfyInfo where xzfyInfo.tAppDeptId ='"+id+"' and xzfyInfo.dftzstatus = '1'";
		if(liAnDate!=null&&!liAnDate.equals("")){HQL+=" and xzfyInfo.lian_date = '"+liAnDate+"'";}
		if(appName!=null&&!appName.equals("")){HQL+=" and xzfyInfo.app_show like '%"+appName+"%'";}
		if(defendant!=null&&!defendant.equals("")){HQL+=" and xzfyInfo.defendant_name like '%"+defendant+"%'";}
		if(tjzfzh!=null&&!tjzfzh.equals("")){HQL+=" and xzfyInfo.tjzfzh = '"+tjzfzh+"'";}
		if(admit!=null&&!admit.equals("")){HQL+=" and (xzfyInfo.admit1 ='"+admit+"' or xzfyInfo.admit2 ='"+admit+"')";}
		return super.find(HQL);
		
	}

	@Override
	public PaginationSupport getXzfyByPage(int pNum, int pageSize, String id
			,String liAnDate,String appName,String defendant,String tjzfzh,String admit) {
		String HQL="";
		HQL+="from XzfyInfo xzfyInfo where xzfyInfo.tAppDeptId ='"+id+"' and xzfyInfo.dftzstatus = '1'";
		if(liAnDate!=null&&!liAnDate.equals("")){HQL+=" and xzfyInfo.lian_date = '"+liAnDate+"'";}
		if(appName!=null&&!appName.equals("")){HQL+=" and xzfyInfo.app_show like '%"+appName+"%'";}
		if(defendant!=null&&!defendant.equals("")){HQL+=" and xzfyInfo.defendant_name like '%"+defendant+"%'";}
		if(tjzfzh!=null&&!tjzfzh.equals("")){HQL+=" and xzfyInfo.tjzfzh = '"+tjzfzh+"'";}
		if(admit!=null&&!admit.equals("")){HQL+=" and (xzfyInfo.admit1 ='"+admit+"' or xzfyInfo.admit2 ='"+admit+"')";}
		return super.find(HQL, pNum, pageSize);
	}

	@Override
	public void saveEvidence(EvidenceAttachment e) {
		super.save(e);
		
	}

	@Override
	public void updateXzfyInfo(XzfyInfo xzfyInfo) {
		super.update(xzfyInfo);
	}


	public List<EvidenceAttachment> getAttachmentList(String xzfyId,String dftzId) {
		String HQL="";
		HQL+="from EvidenceAttachment e where e.xzfyId = '"+xzfyId+"' and e.dftzId = '"+dftzId+"'";
		return super.find(HQL);
	}

}
