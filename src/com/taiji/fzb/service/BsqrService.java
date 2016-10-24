package com.taiji.fzb.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.EvidenceAttachment;
import com.taiji.fzb.domain.XzfyInfo;

public interface BsqrService extends ICoreService{
	public XzfyInfo getXzfyInfo(String id);
	public List<XzfyInfo> getXzfyList(String id,String liAnDate,String appName,String defendant,String tjzfzh,String admit);
	public PaginationSupport getXzfyByPage(int pNum,int pageSize,String id,String liAnDate,String appName,String defendant,String tjzfzh,String admit);
	public void saveEvidence(EvidenceAttachment e);
	public void updateXzfyInfo(XzfyInfo xzfyInfo);
	public List<EvidenceAttachment> getAttachmentList(String xzfyId,String dftzId);

}
