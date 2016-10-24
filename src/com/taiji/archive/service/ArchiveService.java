package com.taiji.archive.service;

import java.util.List;

import com.taiji.archive.domain.Archive;
import com.taiji.core.service.ICoreService;

public interface ArchiveService extends ICoreService {
	public Archive getArchiveById(String id);
	public List<Archive> getArchivesByXzfyId(String xzfyId);
	public void deleteArchive(String id);
}
