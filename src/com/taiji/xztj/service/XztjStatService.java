package com.taiji.xztj.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.user.domain.Org;
import com.taiji.xztj.domain.XztjStat;

public interface XztjStatService extends ICoreService{
	public PaginationSupport obtainXztjStatList(int pageNumber,int pageSize,String fillDate,String fillPerson,String year,String fillQuarter,String locbm,String flag,String orderFlag); 
	public XztjStat findXztjStatById(String id);

	public Org getXztjFillOrg(String locBM);
	public XztjStat findXztjStatGatherOrNot(int year,int quarter);
	public boolean yonPerfectRecord(int year,int quarter);
	public void deleteXztjStatByYearAndQuarter(int year,int quarter);
	public List<XztjStat> findAllRecordsByYearAndQuarter(String year,String quarter);
	
	public String findCountyCountRecordsByYearAndQuarter(String year,String quarter);
	public String findWbjCountRecordsByYearAndQuarter(String year,String quarter);
	
	public boolean checkExistsYon(String code,String year,String quarter);
	
	public boolean yonPerfectRecord1(int year,int quarter);
	public boolean yonPerfectRecord2(int year,int quarter);
	
	public XztjStat findXztjStatGatherOrNot1(int year,int quarter);
	public XztjStat findXztjStatGatherOrNot2(int year,int quarter);
	
	
	public void deleteXztjStatByYearAndQuarter1(int year,int quarter);
	public void deleteXztjStatByYearAndQuarter2(int year,int quarter);
	
	public Boolean countyRangeExistsOrNot(String deptNO);
	public String returnDeptNameBasedOnCode(String deptNO);
	public void deleteXztjRecordById(String id);
	
	public String findNewPreAuditXztjCountByLocbm(String code);
	
	public List<List<String>> findAllRecordsByYearAndQuarterWithout3Totals(String year);
	
	public XzfyApp findXzfyAppById(String id);
}
