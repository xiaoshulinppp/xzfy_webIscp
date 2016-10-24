package com.taiji.fzb.domain;

public class XzfyLog {

	  private Integer id;
      private String log_info;
      private String log_time;
      private String update_name;
      private String xzfyId;


	public String getXzfyId() {
		return xzfyId;
	}

	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}

	public String getLog_info() {
		return log_info;
	}

	public void setLog_info(String logInfo) {
		log_info = logInfo;
	}

	public String getLog_time() {
		return log_time;
	}

	public void setLog_time(String logTime) {
		log_time = logTime;
	}

	public String getUpdate_name() {
		return update_name;
	}

	public void setUpdate_name(String updateName) {
		update_name = updateName;
	}



	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}
      
}
