package com.taiji.tongJi.action.tongJiService;

import java.sql.SQLException;
import java.util.ArrayList;

import com.taiji.core.service.ICoreService;

public interface IndexTjService extends ICoreService{
	public ArrayList<ArrayList<String>> getFyjgLists(String type);
	public ArrayList<ArrayList<String>> getYearlyCountLists(ArrayList<ArrayList<String>> doubleList,String year) throws SQLException;
	public ArrayList<ArrayList<String>> getJustLists(ArrayList<ArrayList<String>> doubleList,String year) throws SQLException;
	public ArrayList<ArrayList<String>> getEfficiencyLists(ArrayList<ArrayList<String>> doubleList,String date) throws SQLException;
}
