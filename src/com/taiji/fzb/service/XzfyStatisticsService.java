package com.taiji.fzb.service;

import com.taiji.core.service.ICoreService;

public interface XzfyStatisticsService extends ICoreService {
	/************************当日汇总************************/
	public String getFaceRecep();
	public String getLetterRecep();
	
	public String getTotalCurrent();
	public String getScan();
	public String getDelivery();
	public String getTransfer();
	public String getChat();     
	/**************************11111***************************/	
	public String getJieDaiRenShu();
	public String getJieDaiPiCi();
	/**************************22222***************************/	
	public String getTotalCases();
	public String getTotalRegistered();
	public String getTotalPrepared();
	public String getUnReceived();
	public String getNotified();
	public String getRefused();
	public String getOthers();
	/**************************33333***************************/
	public String getTotalAccepted();
	public String getTotalRefused();
	public String getTotalPreserved();
	public String getTotalIllegal();
	public String getTotalRevo();
	public String getTotalModified();
	public String getTotalExecuted();
	public String getTotalRecon();
	public String getTotalTerminated();
	public String getTotalOthers();
	/********获取xmlString方法********/
	public String getXmlString(String type);//按区县
	public String getAnotherXmlString(String type);//按委办局
}
