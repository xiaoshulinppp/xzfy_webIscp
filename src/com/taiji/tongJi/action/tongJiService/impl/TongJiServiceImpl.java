package com.taiji.tongJi.action.tongJiService.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.fzb.service.RecordService;
import com.taiji.tongJi.action.tongJiService.TongJiService;
import com.taiji.user.domain.User;
import com.util.DateUtil;
import com.util.JdbcUtil;

public class TongJiServiceImpl extends CoreServiceImpl implements TongJiService {
	private RecordService recordService;

	public ArrayList<ArrayList<String>> getWeekLists(String startDate, String endDate) {
		Connection connection = JdbcUtil.getConnByHibernateConfig();

		if (null != startDate && !"".equals(startDate)) {
			startDate = DateUtil.getMonDayByDate(startDate, "yyyy-MM-dd");// 初始日期不是周一，取当周周一时间
		}
		if (null != endDate && !"".equals(endDate)) {
			endDate = DateUtil.getSunDayByDate(endDate, "yyyy-MM-dd");// 结束日期不是周日，取当周周日时间
		} else {
			endDate = DateUtil.getCurrentWeekday();
		}

		String weekListsSql = "select t.lxt_mydate_mytime_year,t.lxt_mydate_mytime_month,t.lxt_mydate_mytime_weeks,t.lxt_mydate_mytime_startdate,t.lxt_mydate_mytime_enddate from lxt_mydate_mytime t where 1=1";

		if (null != startDate && !"".equals(startDate)) {
			weekListsSql = weekListsSql + "and t.lxt_mydate_mytime_startdate>='" + startDate + "'";
		}
		if (null != endDate && !"".equals(endDate)) {
			weekListsSql = weekListsSql + " and t.lxt_mydate_mytime_enddate<='" + endDate + "'";
		}
		weekListsSql = weekListsSql + " order by t.lxt_mydate_mytime_year,t.lxt_mydate_mytime_month,t.lxt_mydate_mytime_weeks";

		ArrayList<ArrayList<String>> weekLists = JdbcUtil.getListBySql(connection, weekListsSql);

		return weekLists;
	}

	public ArrayList<ArrayList<String>> getJieDaiTongJiByWeekLists(ArrayList<ArrayList<String>> weekLists, String userName, String userId) throws SQLException {

		ArrayList<ArrayList<String>> arrayLists = new ArrayList<ArrayList<String>>();
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement2 = connection.createStatement();
		ResultSet resultSet2 = null;
		try {
			String dataListsSql = "";
			for (int i = 0; i < weekLists.size(); i++) {
				ArrayList<String> arrayList = new ArrayList<String>();// 定义单周数据List
				arrayList.add(weekLists.get(i).get(0));// 添加年份
				arrayList.add(weekLists.get(i).get(1));// 添加月份
				arrayList.add(weekLists.get(i).get(2));// 添加周次
				for (int j = 0; j < 19; j++) {// 初始化单周统计数据，默认为0
					arrayList.add("0");
				}
				dataListsSql = "select a.meet_type,count(a.main_id),nvl(sum(a.face_allnumber),0) from cww_meet a where a.face_date>='"
						+ weekLists.get(i).get(3)
						+ "' and a.face_date<='"
						+ weekLists.get(i).get(4)
						+ "' and a.case_org='"+this.recordService.getOrg().getLocbm()+"' group by a.meet_type union all select * from  (select '接收申请',count(*),nvl(sum(t.jd_renshu),0) from xzfy_recieve t where t.receive_date>='"
						+ weekLists.get(i).get(3)
						+ "' and t.receive_date<='"
						+ weekLists.get(i).get(4)
						+ "' and t.caseorg='"+this.recordService.getOrg().getLocbm()+"') union all select * from (select case when t.receive_type='1' then '当面' when t.receive_type='2' then '来信' when t.receive_type='3' then '互联网' else ' 其他' end,count(*),nvl(sum(t.jd_renshu),0)from xzfy_info t where t.receive_date>='"
						+ weekLists.get(i).get(3) + "' and t.receive_date<='" + weekLists.get(i).get(4) + "' and t.caseorg='"+this.recordService.getOrg().getLocbm()+"' group by t.receive_type order by t.receive_type )";

				if (!userId.equals("0")) {
					dataListsSql = "select a.meet_type,count(a.main_id),nvl(sum(a.face_allnumber),0) from cww_meet a where a.admit1='"
							+ userName
							+ "' and a.face_date>='"
							+ weekLists.get(i).get(3)
							+ "' and a.face_date<='"
							+ weekLists.get(i).get(4)
							+ "' and a.case_org='"+this.recordService.getOrg().getLocbm()+"' group by a.meet_type union all select * from  (select '接收申请',count(*),nvl(sum(t.jd_renshu),0) from xzfy_recieve t "
							+ "where t.admit1='"
							+ userName
							+ "' and  t.receive_date>='"
							+ weekLists.get(i).get(3)
							+ "' and t.receive_date<='"
							+ weekLists.get(i).get(4)
							+ "' and t.caseorg='"+this.recordService.getOrg().getLocbm()+"') union all select * from (select case when t.receive_type='1' then '当面' when t.receive_type='2' then '来信' when t.receive_type='3' then '互联网' else ' 其他' end,count(*),nvl(sum(t.jd_renshu),0)from xzfy_info t"
							+ " where t.user1_id=" + userId + " and t.receive_date>='" + weekLists.get(i).get(3) + "' and t.receive_date<='" + weekLists.get(i).get(4)
							+ "' and t.caseorg='"+this.recordService.getOrg().getLocbm()+"' group by t.receive_type order by t.receive_type )";
				}
				System.out.println(dataListsSql);
				resultSet2 = selectStatement2.executeQuery(dataListsSql);
				String type = "";
				int count1 = 0;
				int count2 = 0;
				int count3 = 0;
				while (resultSet2.next()) {
					// 判断查询结果，根据统计类型，添加到单周统计list中
					if (null != resultSet2.getString(1)) {
						type = resultSet2.getString(1);
						if ("阅卷".equals(type)) {
							count1 = count1 + Integer.parseInt(resultSet2.getString(2));
							count2 = count2 + Integer.parseInt(resultSet2.getString(3));
							arrayList.set(5, resultSet2.getString(2));
							arrayList.set(6, resultSet2.getString(3));

						} else if ("送达".equals(type)) {
							count1 = count1 + Integer.parseInt(resultSet2.getString(2));
							count2 = count2 + Integer.parseInt(resultSet2.getString(3));
							arrayList.set(7, resultSet2.getString(2));
							arrayList.set(8, resultSet2.getString(3));

						} else if ("转接材料".equals(type)) {
							count1 = count1 + Integer.parseInt(resultSet2.getString(2));
							count2 = count2 + Integer.parseInt(resultSet2.getString(3));
							arrayList.set(9, resultSet2.getString(2));
							arrayList.set(10, resultSet2.getString(3));

						} else if ("谈话调查".equals(type)) {
							count1 = count1 + Integer.parseInt(resultSet2.getString(2));
							count2 = count2 + Integer.parseInt(resultSet2.getString(3));
							arrayList.set(11, resultSet2.getString(2));
							arrayList.set(12, resultSet2.getString(3));

						} else if ("一般接待".equals(type)) {
							count1 = count1 + Integer.parseInt(resultSet2.getString(2));
							count2 = count2 + Integer.parseInt(resultSet2.getString(3));
							arrayList.set(13, resultSet2.getString(2));
							arrayList.set(14, resultSet2.getString(3));

						} else if ("接收申请".equals(type)) {
							count1 = count1 + Integer.parseInt(resultSet2.getString(2));
							count2 = count2 + Integer.parseInt(resultSet2.getString(3));
							arrayList.set(15, resultSet2.getString(2));
							arrayList.set(16, resultSet2.getString(3));

						} else if ("当面".equals(type)) {
							count3 = count3 + Integer.parseInt(resultSet2.getString(2));
							arrayList.set(18, resultSet2.getString(2));

						} else if ("来信".equals(type)) {
							count3 = count3 + Integer.parseInt(resultSet2.getString(2));
							arrayList.set(19, resultSet2.getString(2));

						} else if ("互联网".equals(type)) {
							count3 = count3 + Integer.parseInt(resultSet2.getString(2));
							arrayList.set(20, resultSet2.getString(2));

						} else if ("其他".equals(type)) {
							count3 = count3 + Integer.parseInt(resultSet2.getString(2));
							arrayList.set(21, resultSet2.getString(2));

						}
						// 添加合计数据
						arrayList.set(3, String.valueOf(count1));
						arrayList.set(4, String.valueOf(count2));
						arrayList.set(17, String.valueOf(count3));

					}
				}
				// 将单周统计数据添加到总数据List中
				arrayLists.add(arrayList);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if (selectStatement2 != null) {

					selectStatement2.close();
					selectStatement2 = null;
				}
				if (connection != null) {

					connection.close();
					connection = null;

				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
		return arrayLists;
	}

	// 接待工作总数统计
	public ArrayList<String> getJieDaiTongJiTotalList(String startDate, String endDate, String userName, String userId) throws SQLException {

		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement2 = connection.createStatement();
		ResultSet resultSet2 = null;
		ArrayList<String> arrayList = new ArrayList<String>();

		try {

			for (int j = 0; j < 19; j++) {// 初始化单周统计数据，默认为0
				arrayList.add("0");
			}
			String sql1 = "select a.meet_type,count(a.main_id),nvl(sum(a.face_allnumber),0) from cww_meet a where 1=1 and a.case_org='"+this.recordService.getOrg().getLocbm()+"'";
			if (!userId.equals("0"))
				sql1 = sql1 + " and  a.admit1='" + userName + "' ";
			String sql2 = "select '接收申请',count(*),nvl(sum(t.jd_renshu),0) from xzfy_recieve t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"'";
			if (!userId.equals("0"))
				sql2 = sql2 + " and t.admit1='" + userName + "' ";
			String sql3 = "select case when t.receive_type='1' then '当面' when t.receive_type='2' then '来信' when t.receive_type='3' then '互联网' else ' 其他' end,count(*),nvl(sum(t.jd_renshu),0)from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"'";
			if (!userId.equals("0"))
				sql3 = sql3 + " and  t.user1_id=" + userId + " ";
			if (null != startDate && !"".equals(startDate)) {
				sql1 += " and a.face_date>='" + startDate + "'";
				sql2 += " and t.receive_date>='" + startDate + "'";
				sql3 += " and t.receive_date>='" + startDate + "'";
			}
			if (null != endDate && !"".equals(endDate)) {
				sql1 += " and a.face_date<='" + endDate + "'";
				sql2 += " and t.receive_date<='" + endDate + "'";
				sql3 += " and t.receive_date<='" + endDate + "'";

			}
			sql1 += " group by a.meet_type";
			// sql2 += " group by t.receive_type";
			sql3 += " group by t.receive_type";
			String totalListsSql = sql1 + " union all select * from  (" + sql2 + ") union all select * from (" + sql3 + ")";
			resultSet2 = selectStatement2.executeQuery(totalListsSql);
			String type = "";
			int count1 = 0;
			int count2 = 0;
			int count3 = 0;
			// 判断查询结果，根据统计类型，添加到单周统计list中
			while (resultSet2.next()) {
				if (null != resultSet2.getString(1)) {
					type = resultSet2.getString(1);
					if ("阅卷".equals(type)) {
						count1 = count1 + Integer.parseInt(resultSet2.getString(2));
						count2 = count2 + Integer.parseInt(resultSet2.getString(3));
						arrayList.set(2, resultSet2.getString(2));
						arrayList.set(3, resultSet2.getString(3));

					} else if ("送达".equals(type)) {
						count1 = count1 + Integer.parseInt(resultSet2.getString(2));
						count2 = count2 + Integer.parseInt(resultSet2.getString(3));
						arrayList.set(4, resultSet2.getString(2));
						arrayList.set(5, resultSet2.getString(3));

					} else if ("转接材料".equals(type)) {
						count1 = count1 + Integer.parseInt(resultSet2.getString(2));
						count2 = count2 + Integer.parseInt(resultSet2.getString(3));
						arrayList.set(6, resultSet2.getString(2));
						arrayList.set(7, resultSet2.getString(3));

					} else if ("谈话调查".equals(type)) {
						count1 = count1 + Integer.parseInt(resultSet2.getString(2));
						count2 = count2 + Integer.parseInt(resultSet2.getString(3));
						arrayList.set(8, resultSet2.getString(2));
						arrayList.set(9, resultSet2.getString(3));

					} else if ("一般接待".equals(type)) {
						count1 = count1 + Integer.parseInt(resultSet2.getString(2));
						count2 = count2 + Integer.parseInt(resultSet2.getString(3));
						arrayList.set(10, resultSet2.getString(2));
						arrayList.set(11, resultSet2.getString(3));

					} else if ("接收申请".equals(type)) {
						count1 = count1 + Integer.parseInt(resultSet2.getString(2));
						count2 = count2 + Integer.parseInt(resultSet2.getString(3));
						arrayList.set(12, resultSet2.getString(2));
						arrayList.set(13, resultSet2.getString(3));

					} else if ("当面".equals(type)) {
						count3 = count3 + Integer.parseInt(resultSet2.getString(2));
						arrayList.set(15, resultSet2.getString(2));

					} else if ("来信".equals(type)) {
						count3 = count3 + Integer.parseInt(resultSet2.getString(2));
						arrayList.set(16, resultSet2.getString(2));

					} else if ("互联网".equals(type)) {
						count3 = count3 + Integer.parseInt(resultSet2.getString(2));
						arrayList.set(17, resultSet2.getString(2));

					} else if ("其他".equals(type)) {
						count3 = count3 + Integer.parseInt(resultSet2.getString(2));
						arrayList.set(18, resultSet2.getString(2));

					}
					arrayList.set(0, String.valueOf(count1));
					arrayList.set(1, String.valueOf(count2));
					arrayList.set(14, String.valueOf(count3));

				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if (selectStatement2 != null) {

					selectStatement2.close();
					selectStatement2 = null;
				}
				if (connection != null) {

					connection.close();
					connection = null;

				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
		return arrayList;
	}

	// 立案审查工作统计
	public ArrayList<String> getLiAnShenChaTongJiList(String startDate, String endDate, String userId) {

		ArrayList<String> arrayList = new ArrayList<String>();
		String param1 = "";
		String param2 = "";
		String param3 = "";
		String param4 = "";
		String param5 = "";
		String param6 = "";
		// String param7 = "";

		// 初始化查询条件
		if (null != startDate && !"".equals(startDate)) {
			param1 = " and t.receive_date>='" + startDate + "'";
			param3 = " and t.finish_date >='" + startDate + "'";
			param4 = " and t.lian_date >='" + startDate + "'";
			param5 = " and t.receive_date<'" + startDate + "'";

		}
		if (null != endDate && !"".equals(endDate)) {
			param2 = " and t.receive_date<='" + endDate + "'";
			// param6 = " and t.finish_date<='" + endDate + "'";
			// param7 = " and t.lian_date<='" + endDate + "'";
		}
		if (null != userId && !"0".equals(userId)) {
			param6 = " and t.user1_id=" + userId + " ";
		}
		// 根据不同统计类型，生成sql
		// 本期新收
		String sql1 = "select count(id) count1 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"'" + param1 + param2 + param6;
		// 上期结转
		String sql2 = "select count(id) count2 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"'" + param5 + param6 + " and ((t.stadardresult=1 " + param4 + ") or (t.stadardresult>1 " + param3
				+ ") or (t.status<4 or (t.status=11 and t.stadardresult>1)))";

		// 受理
		// 本期新收
		String sql3 = "select count(id) count3 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"' and (t.stadardresult=1 and t.status>3)" + param1 + param2 + param6 + " and t.stadardresult=1";
		// 上期结转
		String sql4 = "select count(id) count4 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"' " + param5 + param6 + " and (t.stadardresult=1 " + param4 + ")";
		// 告知
		// 本期新收
		String sql5 = "select count(id) count5 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"' and (t.stadardresult=2 and t.status=12)" + param1 + param2 + param6 + " and t.stadardresult=2";
		// 上期结转
		String sql6 = "select count(id) count6 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"'" + param5 + param6 + " and t.stadardresult=2  " + param3;

		// 不予受理
		// 本期新收
		String sql7 = "select count(id) count7 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"' and (t.stadardresult=3 and t.status=12) " + param1 + param2 + param6 + " and t.stadardresult=3";
		// 上期结转
		String sql8 = "select count(id) count8 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"'" + param5 + param6 + " and t.stadardresult=3  " + param3;

		// 案前和解
		// 本期新收
		String sql9 = "select count(id) count9 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"' and t.status=12" + param1 + param2 + param6 + " and t.stadardresult=5 and t.istiaojie=2";
		// 上期结转
		String sql10 = "select count(id) count10 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"'" + param5 + param6 + " and t.stadardresult=5 and t.istiaojie=2  " + param3;

		// 未经和解
		// 本期新收
		String sql11 = "select count(id) count11 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"' and t.status=12 " + param1 + param2 + param6 + " and t.stadardresult=5 and (t.istiaojie<>2  or t.istiaojie is null)";
		// 上期结转
		String sql12 = "select count(id) count12 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"'" + param5 + param6 + " and t.stadardresult=5 and (t.istiaojie<>2 or t.istiaojie is null)  " + param3;

		// 未审查
		// 本期新收
		String sql13 = "select count(id) count13 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"' and (t.isbuzheng=0 or t.isbuzheng is null) " + param1 + param2 + param6
				+ " and (t.status<4 or (t.status=11  and t.stadardresult>1))";
		// 上期结转
		String sql14 = "select count(id) count14 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"' and (t.isbuzheng=0 or t.isbuzheng is null) " + param5 + param6
				+ " and (t.status<4 or  (t.status=11  and t.stadardresult>1))";

		// 通知补正待处理
		// 本期新收
		String sql15 = "select count(id) count15 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"' and t.isbuzheng=1 " + param1 + param2 + param6 + " and t.isbuzheng=1 and t.status<3";
		// 上期结转
		String sql16 = "select count(id) count16 from xzfy_info t where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"' and t.isbuzheng=1 " + param5 + param6 + " and t.isbuzheng=1 and t.status<3 and ((t.stadardresult=1 " + param4
				+ " ) or (t.stadardresult>1 " + param3 + "))";

		// 合并sql
		String sql = "select count1,count2,count1+count2,count3,count4,count3+count4,count5,count6,count5+count6,count7,count8,count7+count8,count9,count10,count9+count10,count11,count12,count11+count12,count13,count14,count13+count14,count15,count16,count15+count16 from ("
				+ sql1
				+ "),("
				+ sql2
				+ "),("
				+ sql3
				+ "),("
				+ sql4
				+ "),("
				+ sql5
				+ "),("
				+ sql6
				+ "),("
				+ sql7
				+ "),("
				+ sql8
				+ "),("
				+ sql9
				+ "),("
				+ sql10
				+ "),("
				+ sql11
				+ "),("
				+ sql12
				+ "),("
				+ sql13 + "),(" + sql14 + "),(" + sql15 + "),(" + sql16 + ")";
		// System.out.println(sql);
		// 返回统计结果
		arrayList = JdbcUtil.getSingleListBySql(JdbcUtil.getConnByHibernateConfig(), sql);
		ArrayList<String> arrayList2 = new ArrayList<String>();
		for (int i = 0; i < 24; i++) {
			arrayList2.add("0");
		}
		// 该时间段内没有数据，返回初始化数据
		if (arrayList.size() == 0) {

			arrayList = arrayList2;

		}

		return arrayList;
	}

	// 时间段内未受理案件原因统计

	public ArrayList<ArrayList<String>> gtWeiShouLiYuanYinTongJi(String startDate, String endDate, String handleResult) {
		ArrayList<ArrayList<String>> monthLists = this.getMonthLists(startDate, endDate);

		Map<String, String> countMap = this.gtWeiShouLiYuanYinTongJiByMonth(startDate, endDate, handleResult);

		ArrayList<ArrayList<String>> dataLists = new ArrayList<ArrayList<String>>();

		String year = "";
		String month = "";
		String key1 = "";
		int[] totalCount = new int[19];
		ArrayList<String> totalList = new ArrayList<String>();
		for (int i = 0; i < monthLists.size(); i++) {
			ArrayList<String> arrayList = new ArrayList<String>();
			year = monthLists.get(i).get(0);
			month = monthLists.get(i).get(1);
			arrayList.add(year);
			arrayList.add(month);
			int count1 = 0;

			for (int j = 1; j <= 19; j++) {
				key1 = year + "_" + month + "_" + j;
				count1 = null == countMap.get(key1) ? 0 : Integer.parseInt(countMap.get(key1));
				arrayList.add(String.valueOf(count1));
				totalCount[j - 1] = totalCount[j - 1] + count1;
			}

			dataLists.add(arrayList);
		}
		for (int j = 0; j < totalCount.length; j++) {
			totalList.add(String.valueOf(totalCount[j]));
		}
		// System.out.println(totalList);
		dataLists.add(totalList);
		return dataLists;

	}

	public Map<String, String> gtWeiShouLiYuanYinTongJiByMonth(String startDate, String endDate, String handleResult) {
		String sql = "select to_char(to_date(t.receive_date,'yyyy-MM-dd'),'yyyy') y,to_char(to_date(t.receive_date,'yyyy-MM-dd'),'MM') m,t.handlereason,count(*) countNum from xzfy_info t"
				+ " where 1=1 and t.caseorg='"+this.recordService.getOrg().getLocbm()+"' and t.stadardresult=" + handleResult + " ";
		Map<String, String> map = new HashMap<String, String>();
		if (null == endDate || "".equals(endDate)) {
			endDate = DateUtil.getNowTime("yyyy-MM-dd");
		}
		if (null != startDate && !"".equals(startDate)) {
			sql += " and t.receive_date>='" + startDate + "'";
		}
		if (null != endDate && !"".equals(endDate)) {
			sql += " and t.receive_date<='" + endDate + "'";
		}
		// sql += " and (t.stadardresult=2 or t.stadardresult=3)";
		sql += " group by to_char(to_date(t.receive_date,'yyyy-MM-dd'),'yyyy') ,to_char(to_date(t.receive_date,'yyyy-MM-dd'),'MM'),t.handlereason";
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		Statement selectStatement = null;
		ResultSet resultSet = null;
		try {
			selectStatement = connection.createStatement();
			//System.out.println(sql);
			resultSet = selectStatement.executeQuery(sql);
			String key = "";
			String value = "";
			while (resultSet.next()) {
				key = resultSet.getString(1) + "_" + resultSet.getString(2) + "_" + resultSet.getString(3);
				value = resultSet.getString(4);
				map.put(key, value);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if (selectStatement != null) {

					selectStatement.close();
					selectStatement = null;
				}
				if (connection != null) {

					connection.close();
					connection = null;

				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		}

		// System.out.println(sql2);

		return map;
	}

	public ArrayList<ArrayList<String>> getMonthLists(String startDate, String endDate) {

		ArrayList<ArrayList<String>> arrayLists = new ArrayList<ArrayList<String>>();

		if (null == startDate || "".equals(startDate)) {

			startDate = JdbcUtil.getSingleValBySql(JdbcUtil.getConnByHibernateConfig(), "select min(t.lxt_mydate_mytime_startdate) from lxt_mydate_mytime t");
		}
		if (null == endDate || "".equals(endDate)) {

			endDate = DateUtil.getNowTime("yyyy-MM-dd");
		}

		int startYear = Integer.parseInt(startDate.substring(0, 4));
		int startMonth = startDate.charAt(5) == '0' ? Integer.parseInt(startDate.substring(6, 7)) : Integer.parseInt(startDate.substring(5, 7));
		int endYear = Integer.parseInt(endDate.substring(0, 4));
		int endMonth = endDate.charAt(5) == '0' ? Integer.parseInt(endDate.substring(6, 7)) : Integer.parseInt(endDate.substring(5, 7));

		for (int i = startYear; i <= endYear; i++) {
			if (i < endYear) {
				for (int j = startMonth; j <= 12; j++) {
					ArrayList<String> arrayList = new ArrayList<String>();
					arrayList.add(String.valueOf(i));
					arrayList.add(String.valueOf(j));
					arrayLists.add(arrayList);
				}
				startMonth = 1;
			} else {
				for (int j = startMonth; j <= endMonth; j++) {
					ArrayList<String> arrayList = new ArrayList<String>();
					arrayList.add(String.valueOf(i));
					arrayList.add(String.valueOf(j));
					arrayLists.add(arrayList);
				}
			}
		}

		return arrayLists;

	}

	public RecordService getRecordService() {
		return recordService;
	}

	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	public static void main(String[] args) {

		// TongJiServiceImpl impl = new TongJiServiceImpl();
		// Map<String, String> map = impl.gtWeiShouLiYuanYinTongJiByMonth("",
		// "");
		// for (String key : map.keySet()) {
		// System.out.println("key= " + key + " and value= " + map.get(key));
		// }
		// System.out.println(impl.getMonthLists("", ""));
	}
}
