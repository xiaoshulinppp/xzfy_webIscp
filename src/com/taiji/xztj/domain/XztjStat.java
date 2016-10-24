package com.taiji.xztj.domain;


public class XztjStat{
	private String id;//主键id，手动分配
		
	/*****
	 * 新增属性
	 */
	private String appFirm;//填报单位
	private String appDate;//填报日期
	private String appPerson;//填报人
	private String appId;//填报人Id
	
	private String statYear;//统计年度
	private String quarterOfYear;//统计季度
	
	private String locbm;//用户所属机构locbm
	
	private String orgId;//用户直属单位id
	
	private String status;//审核状态
	
	private String auditIdea;//审核意见
	private String auditPerson;//审核人
	private String auditId;//审核人Id
	private String auditDate;//审核时间	
	
	private String totalOrNot;//是否合计标识
	private String statPerfectOrNot;//是否统计完全
	
	private String divPerfectOrNot;//合计1和合计2是否统计完全标识
	
	/**********************总计**********************/
	private String totalCaseCount;//案件总数
	
	private String tjSuccessCount;//调解成功数
	
	private String caseInvolvedCount;//涉案人数
	
	private String caseInvolvedSum;//涉案金额
	/**********************结束**********************/
	
	/*********************民事纠纷***********************/
	private String civilQuarrelSum;//民事纠纷总数
	
	private String civilQuarrelSuccess;//调解成功民事纠纷总数
	
	private String zatjCivilQuarrel;//治安调解的民间纠纷
	
	private String travelAccidentQuarrel;//交通事故损害赔偿纠纷
	
	private String contractQuarrel;//合同纠纷
	
	private String medicalQuarrel;//医疗事故赔偿纠纷
	
	private String consumerProfitQuarrel;//消费者权益保护纠纷、产品质量纠纷
	
	private String soilQuarrel;//土地承包经营纠纷
	
	private String brandRightsQuarrel;//侵犯商标专用权专利权等知识产权的赔偿纠纷
	
	private String environmentPullutionQuarrel;//环境污染赔偿纠纷
	
	private String powerQuarrel;//电力纠纷水事纠纷
	
	private String otherCivilQuarrel;//其他依法可以调解的民事纠纷
	
	/**********************结束**********************/
	
	/**********************行政争议**********************/
	private String adminQuarrelTotal;//行政争议总数
	
	private String adminQuarrelSuccess;//调解成功行政争议总数
	
	private String compensateCount;//赔偿案件
	
	private String offsetCount;//补偿案件
	
	private String legalQuarrel;//法定自由裁量产生的争议
	
	private String xzfyCount;//行政复议中的调解
	
	private String xzssCount;//行政诉讼中的调解
	/**********************结束**********************/
	
	/**********************行政争议**********************/
	private String writtenProtocol;//达成书面协议
	
	private String oralProtocol;//达成口头协议
	
	private String judicialCofirm;//司法确认
	
	private String performCount;//已履行
	/**********************结束**********************/

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAppFirm() {
		return appFirm;
	}

	public void setAppFirm(String appFirm) {
		this.appFirm = appFirm;
	}

	public String getAppDate() {
		return appDate;
	}

	public void setAppDate(String appDate) {
		this.appDate = appDate;
	}

	public String getAppPerson() {
		return appPerson;
	}

	public void setAppPerson(String appPerson) {
		this.appPerson = appPerson;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getStatYear() {
		return statYear;
	}

	public void setStatYear(String statYear) {
		this.statYear = statYear;
	}

	public String getQuarterOfYear() {
		return quarterOfYear;
	}

	public void setQuarterOfYear(String quarterOfYear) {
		this.quarterOfYear = quarterOfYear;
	}

	public String getLocbm() {
		return locbm;
	}

	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAuditIdea() {
		return auditIdea;
	}

	public void setAuditIdea(String auditIdea) {
		this.auditIdea = auditIdea;
	}

	public String getAuditPerson() {
		return auditPerson;
	}

	public void setAuditPerson(String auditPerson) {
		this.auditPerson = auditPerson;
	}

	public String getAuditId() {
		return auditId;
	}

	public void setAuditId(String auditId) {
		this.auditId = auditId;
	}

	public String getAuditDate() {
		return auditDate;
	}

	public void setAuditDate(String auditDate) {
		this.auditDate = auditDate;
	}

	public String getTotalOrNot() {
		return totalOrNot;
	}

	public void setTotalOrNot(String totalOrNot) {
		this.totalOrNot = totalOrNot;
	}

	public String getStatPerfectOrNot() {
		return statPerfectOrNot;
	}

	public void setStatPerfectOrNot(String statPerfectOrNot) {
		this.statPerfectOrNot = statPerfectOrNot;
	}

	public String getDivPerfectOrNot() {
		return divPerfectOrNot;
	}

	public void setDivPerfectOrNot(String divPerfectOrNot) {
		this.divPerfectOrNot = divPerfectOrNot;
	}

	public String getTotalCaseCount() {
		return totalCaseCount;
	}

	public void setTotalCaseCount(String totalCaseCount) {
		this.totalCaseCount = totalCaseCount;
	}

	public String getTjSuccessCount() {
		return tjSuccessCount;
	}

	public void setTjSuccessCount(String tjSuccessCount) {
		this.tjSuccessCount = tjSuccessCount;
	}

	public String getCaseInvolvedCount() {
		return caseInvolvedCount;
	}

	public void setCaseInvolvedCount(String caseInvolvedCount) {
		this.caseInvolvedCount = caseInvolvedCount;
	}

	public String getCaseInvolvedSum() {
		return caseInvolvedSum;
	}

	public void setCaseInvolvedSum(String caseInvolvedSum) {
		this.caseInvolvedSum = caseInvolvedSum;
	}

	public String getCivilQuarrelSum() {
		return civilQuarrelSum;
	}

	public void setCivilQuarrelSum(String civilQuarrelSum) {
		this.civilQuarrelSum = civilQuarrelSum;
	}

	public String getZatjCivilQuarrel() {
		return zatjCivilQuarrel;
	}

	public void setZatjCivilQuarrel(String zatjCivilQuarrel) {
		this.zatjCivilQuarrel = zatjCivilQuarrel;
	}

	public String getTravelAccidentQuarrel() {
		return travelAccidentQuarrel;
	}

	public void setTravelAccidentQuarrel(String travelAccidentQuarrel) {
		this.travelAccidentQuarrel = travelAccidentQuarrel;
	}

	public String getContractQuarrel() {
		return contractQuarrel;
	}

	public void setContractQuarrel(String contractQuarrel) {
		this.contractQuarrel = contractQuarrel;
	}

	public String getMedicalQuarrel() {
		return medicalQuarrel;
	}

	public void setMedicalQuarrel(String medicalQuarrel) {
		this.medicalQuarrel = medicalQuarrel;
	}

	public String getConsumerProfitQuarrel() {
		return consumerProfitQuarrel;
	}

	public void setConsumerProfitQuarrel(String consumerProfitQuarrel) {
		this.consumerProfitQuarrel = consumerProfitQuarrel;
	}

	public String getSoilQuarrel() {
		return soilQuarrel;
	}

	public void setSoilQuarrel(String soilQuarrel) {
		this.soilQuarrel = soilQuarrel;
	}

	public String getBrandRightsQuarrel() {
		return brandRightsQuarrel;
	}

	public void setBrandRightsQuarrel(String brandRightsQuarrel) {
		this.brandRightsQuarrel = brandRightsQuarrel;
	}

	public String getEnvironmentPullutionQuarrel() {
		return environmentPullutionQuarrel;
	}

	public void setEnvironmentPullutionQuarrel(String environmentPullutionQuarrel) {
		this.environmentPullutionQuarrel = environmentPullutionQuarrel;
	}

	public String getPowerQuarrel() {
		return powerQuarrel;
	}

	public void setPowerQuarrel(String powerQuarrel) {
		this.powerQuarrel = powerQuarrel;
	}

	public String getOtherCivilQuarrel() {
		return otherCivilQuarrel;
	}

	public void setOtherCivilQuarrel(String otherCivilQuarrel) {
		this.otherCivilQuarrel = otherCivilQuarrel;
	}

	public String getAdminQuarrelTotal() {
		return adminQuarrelTotal;
	}

	public void setAdminQuarrelTotal(String adminQuarrelTotal) {
		this.adminQuarrelTotal = adminQuarrelTotal;
	}

	public String getCompensateCount() {
		return compensateCount;
	}

	public void setCompensateCount(String compensateCount) {
		this.compensateCount = compensateCount;
	}

	public String getOffsetCount() {
		return offsetCount;
	}

	public void setOffsetCount(String offsetCount) {
		this.offsetCount = offsetCount;
	}

	public String getLegalQuarrel() {
		return legalQuarrel;
	}

	public void setLegalQuarrel(String legalQuarrel) {
		this.legalQuarrel = legalQuarrel;
	}

	public String getXzfyCount() {
		return xzfyCount;
	}

	public void setXzfyCount(String xzfyCount) {
		this.xzfyCount = xzfyCount;
	}

	public String getXzssCount() {
		return xzssCount;
	}

	public void setXzssCount(String xzssCount) {
		this.xzssCount = xzssCount;
	}

	public String getWrittenProtocol() {
		return writtenProtocol;
	}

	public void setWrittenProtocol(String writtenProtocol) {
		this.writtenProtocol = writtenProtocol;
	}

	public String getOralProtocol() {
		return oralProtocol;
	}

	public void setOralProtocol(String oralProtocol) {
		this.oralProtocol = oralProtocol;
	}

	public String getJudicialCofirm() {
		return judicialCofirm;
	}

	public void setJudicialCofirm(String judicialCofirm) {
		this.judicialCofirm = judicialCofirm;
	}

	public String getPerformCount() {
		return performCount;
	}

	public void setPerformCount(String performCount) {
		this.performCount = performCount;
	}

	public String getCivilQuarrelSuccess() {
		return civilQuarrelSuccess;
	}

	public void setCivilQuarrelSuccess(String civilQuarrelSuccess) {
		this.civilQuarrelSuccess = civilQuarrelSuccess;
	}

	public String getAdminQuarrelSuccess() {
		return adminQuarrelSuccess;
	}

	public void setAdminQuarrelSuccess(String adminQuarrelSuccess) {
		this.adminQuarrelSuccess = adminQuarrelSuccess;
	}
	
}
