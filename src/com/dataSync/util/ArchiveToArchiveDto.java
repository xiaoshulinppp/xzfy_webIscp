package com.dataSync.util;

import com.dataSync.model.ArchiveDto;
import com.taiji.archive.domain.Archive;

public class ArchiveToArchiveDto {
	public static void modelToDto(ArchiveDto archiveDto, Archive archive) {
		archiveDto.setStatus("0");
		archiveDto.setType(archive.getType());
		archiveDto.setFileName(archive.getFileName());
		archiveDto.setFileAnotherName(archive.getFileAnotherName());
		archiveDto.setFileRelativePath(archive.getFileRelativePath());
		archiveDto.setFileAbsolutePath(archive.getFileAbsolutePath());
		archiveDto.setUploadTime(archive.getUploadTime());
		archiveDto.setXzfyId(archive.getXzfyId());
		archiveDto.setArchiveOfXzfyId(archive.getId());
	}
}
