package com.dataSync.util;

import com.dataSync.model.ArchiveDto;
import com.taiji.archive.domain.Archive;

public class ArchiveDtoToArchive {
	public static void dtoToModel(ArchiveDto archiveDto, Archive archive) {
		archive.setId(archiveDto.getId().toString());
		archive.setStatus(archiveDto.getStatus());
		archive.setType(archiveDto.getType());
		archive.setFileName(archiveDto.getFileName());
		archive.setFileAnotherName(archiveDto.getFileAnotherName());
		archive.setFileRelativePath(archiveDto.getFileRelativePath());
		archive.setFileAbsolutePath(archiveDto.getFileAbsolutePath());
		archive.setUploadTime(archiveDto.getUploadTime());
		archive.setXzfyId(archiveDto.getXzfyId());
		archive.setOther(archiveDto.getOther());
		archive.setClName(archiveDto.getClName());
	}
}
