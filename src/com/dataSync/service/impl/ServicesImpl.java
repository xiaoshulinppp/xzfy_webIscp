package com.dataSync.service.impl;

import javax.jws.WebService;

import com.dataSync.model.ArchiveDto;
import com.dataSync.model.InfoAppArchiveDto;
import com.dataSync.model.InfoDto;
import com.dataSync.service.Services;

@WebService
public class ServicesImpl implements Services {

	public void sendIsBuzheng(InfoDto infoDto) {

	}

	public InfoAppArchiveDto anJianTongbu() {
		return null;
	}

	public void flagInfo(int flag, String id) {

	}

	public void flag2Info(int flag, String id) {

	}

	public int updateStatus(String id, String status) {
		return 0;
	}

	public int archiveSync(ArchiveDto archiveDto) {
		return 0;
	}

	public int updateXzfyStatus(String xzfyId, String status) {
		return 0;
	}

	public int archiveDel(String id) {
		return 0;
	}

	public void flag3Info(int flag, String id) {

	}

	public void flag4Info(int flag, String id) {

	}

}
