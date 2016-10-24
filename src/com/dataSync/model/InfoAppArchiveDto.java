package com.dataSync.model;

import java.io.Serializable;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement(name = "Customer")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = { "infoDtos", "appDtos", "archiveDtos", "bzArchiveDtos",
		"yjArchiveDtos", "yjInfoDtos" })
public class InfoAppArchiveDto implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7608868221227691081L;
	private List<InfoDto> infoDtos;
	private List<AppDto> appDtos;
	private List<ArchiveDto> archiveDtos;
	private List<ArchiveDto> bzArchiveDtos;
	private List<ArchiveDto> yjArchiveDtos;
	private List<InfoDto> yjInfoDtos;

	public List<InfoDto> getInfoDtos() {
		return infoDtos;
	}

	public void setInfoDtos(List<InfoDto> infoDtos) {
		this.infoDtos = infoDtos;
	}

	public List<AppDto> getAppDtos() {
		return appDtos;
	}

	public void setAppDtos(List<AppDto> appDtos) {
		this.appDtos = appDtos;
	}

	public List<ArchiveDto> getArchiveDtos() {
		return archiveDtos;
	}

	public void setArchiveDtos(List<ArchiveDto> archiveDtos) {
		this.archiveDtos = archiveDtos;
	}

	public List<ArchiveDto> getBzArchiveDtos() {
		return bzArchiveDtos;
	}

	public void setBzArchiveDtos(List<ArchiveDto> bzArchiveDtos) {
		this.bzArchiveDtos = bzArchiveDtos;
	}

	public List<ArchiveDto> getYjArchiveDtos() {
		return yjArchiveDtos;
	}

	public void setYjArchiveDtos(List<ArchiveDto> yjArchiveDtos) {
		this.yjArchiveDtos = yjArchiveDtos;
	}

	public List<InfoDto> getYjInfoDtos() {
		return yjInfoDtos;
	}

	public void setYjInfoDtos(List<InfoDto> yjInfoDtos) {
		this.yjInfoDtos = yjInfoDtos;
	}
}
