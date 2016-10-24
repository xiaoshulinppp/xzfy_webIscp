package com.taiji.datum.model;



import com.taiji.core.domain.Entity;

/**
 * AppDatumFile entity. @author MyEclipse Persistence Tools
 */

public class AppDatumFile extends Entity implements java.io.Serializable{

	// Fields

	//private Integer id;
	private String filename;
	private String creatfilename;
	private String path;
	 private AppDatum datum;
	//private Integer pid;

	// Constructors

	/** default constructor */
	public AppDatumFile() {
	}

	/** full constructor */
	public AppDatumFile(String filename, String creatfilename, String path,
			Integer pid) {
		this.filename = filename;
		this.creatfilename = creatfilename;
		this.path = path;
		//this.pid = pid;
	}

	// Property accessors



	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getCreatfilename() {
		return this.creatfilename;
	}

	public void setCreatfilename(String creatfilename) {
		this.creatfilename = creatfilename;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public AppDatum getDatum() {
		return datum;
	}

	public void setDatum(AppDatum datum) {
		this.datum = datum;
	}

/*	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}*/



}