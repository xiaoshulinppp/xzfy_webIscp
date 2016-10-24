package com.dataSync.service.impl;

import java.util.List;

import com.dataSync.model.AppDto;
import com.dataSync.model.ArchiveDto;
import com.dataSync.model.InfoDto;
import com.dataSync.service.DataSyncService;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzfyInfo;

/**
 * 
 * @author Riven
 * 
 */
public class DataSyncServiceImpl extends ProtectedDetailAction implements DataSyncService{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8156010827961125772L;

	public void infoSave(InfoDto infoDto) {
		
	}

	public void appSave(AppDto appDto) {
		
	}

	public void archiveSave(ArchiveDto archiveDto) {
		
	}

	public Class getPersistentClass() {
		return null;
	}

	public XzfyInfo findXzfyInfoById(String id) {
		return (XzfyInfo) this.coreService.loadEntityObjectById(XzfyInfo.class, id);
	}

}
