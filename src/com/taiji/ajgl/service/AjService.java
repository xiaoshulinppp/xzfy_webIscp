package com.taiji.ajgl.service;

import java.util.List;

import com.taiji.ajgl.domain.AjAttachment;
import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyInfo;

public interface AjService extends ICoreService {
	public PaginationSupport getList1ByPage(int pNum,int pageSize,String locbm,String liAnDate,String appName,String tjzfzh,String admit,String defendant);
	public List<XzfyInfo> getAllList1(String locbm,String liAnDate,String appName,String tjzfzh,String admit,String defendant);
	public List<AjAttachment> getAttachmentList(String xzfyId);
	public void saveAjAttachment(AjAttachment a);
	public PaginationSupport getList2ByPage(int pNum,int pageSize,String locbm,String liAnDate,String appName,String tjzfzh,String admit,String defendant);
	public List<XzfyInfo> getAllList2(String locbm,String liAnDate,String appName,String tjzfzh,String admit,String defendant);
	public void deleteAttachment(String id);

}
