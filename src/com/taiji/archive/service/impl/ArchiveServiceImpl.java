package com.taiji.archive.service.impl;

import java.util.List;

import com.taiji.archive.domain.Archive;
import com.taiji.archive.service.ArchiveService;
import com.taiji.core.service.impl.CoreServiceImpl;

public class ArchiveServiceImpl extends CoreServiceImpl implements ArchiveService {
	
	public Archive getArchiveById(String id){
		
		String HQL="";
		HQL="from Archive archive where archive.id='"+id+"'";
		List<Archive> dataList = super.find(HQL);
		Archive archive = new Archive();
		if(!dataList.isEmpty())
			archive = dataList.get(0);
		return archive;
		
	}
	
	public List<Archive> getArchivesByXzfyId(String xzfyId){
		String HQL="from Archive archive where archive.xzfyId='"+xzfyId+"'";
		return super.find(HQL);
	}
	
	public void deleteArchive(String id){
		String HQL="delete from Archive archive where archive.id='"+id+"'";
		super.deleteAll(HQL);
	}
	
}
