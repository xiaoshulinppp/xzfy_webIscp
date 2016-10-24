package com.taiji.tongJi.action.tongJiService;

import java.sql.SQLException;
import java.util.ArrayList;

import com.taiji.core.service.ICoreService;

public interface TongJiService extends ICoreService {

	public ArrayList<ArrayList<String>> getWeekLists(String startDate, String endDate);

	public ArrayList<ArrayList<String>> getJieDaiTongJiByWeekLists(ArrayList<ArrayList<String>> weekList,String userName,String userId) throws SQLException;

	public ArrayList<String> getJieDaiTongJiTotalList(String startDate, String endDate,String userName,String userId)  throws SQLException;

	public ArrayList<String> getLiAnShenChaTongJiList(String startDate, String endDate,String userId);

	public ArrayList<ArrayList<String>> gtWeiShouLiYuanYinTongJi(String startDate, String endDate,String handleResult);


}
