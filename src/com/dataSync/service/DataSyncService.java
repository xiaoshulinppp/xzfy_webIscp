package com.dataSync.service;

import java.util.List;

import com.dataSync.model.AppDto;
import com.dataSync.model.ArchiveDto;
import com.dataSync.model.InfoDto;
import com.taiji.fzb.domain.XzfyInfo;

/**
 * 
 * @author Riven
 * 
 */
public interface DataSyncService{
	// 保存在线申请的案件
	public void infoSave(InfoDto infoDto);

	// 保存与在线申请案件相关的人员
	public void appSave(AppDto appDto);

	// 保存于在线申请相关的材料
	public void archiveSave(ArchiveDto archiveDto);
	public XzfyInfo findXzfyInfoById(String id);
}
