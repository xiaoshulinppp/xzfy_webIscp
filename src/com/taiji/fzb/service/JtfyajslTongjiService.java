package com.taiji.fzb.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyInfo;

public interface JtfyajslTongjiService extends ICoreService{
	public ArrayList<ArrayList<String>> getJtfyajslTongjiData(ArrayList<ArrayList<String>> monthList);
	public List getTongjiData1(String appName,String xwName,String xzNum,String defendantName);
	public PaginationSupport getXzfyInfoList(int pageNum,int pageSize,String appName, String xwName,String xwNum, String defendantName);
	public ArrayList<ArrayList<String>> getTongjiForm15(String locbm,String appName,String shixiang,String xwname,String keyword,String receiveYear,String status) throws SQLException;
	public ArrayList<ArrayList<String>> getTongjiForm17(String locbm,String appName,String shixiang,String xwname,String keyword,String receiveYear,String status) throws SQLException;
	public ArrayList<ArrayList<String>> getTongjiForm19(List<String> list1,List<String> list2,String locbm,String shixiang,String startDate,String endDate) throws Exception;
	public String form23jk1(Connection conn,String jktype,String hengxiangtype,String startDate,String endDate) throws Exception;
	public String form23jk2(Connection conn,String locbm,String startDate,String endDate) throws Exception;
	
}
