package com.taiji.tongJi.action;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.service.RecordService;
import com.taiji.tongJi.action.tongJiService.TongJiService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.user.service.IOrgService;
import com.taiji.user.service.IUserService;
import com.util.DateUtil;

@SuppressWarnings("serial")
public class TongJiAction extends ProtectedDetailAction {

	public String tongJiMoKuai = "";
	public String tongJiType = "";
	public String startDate = "";
	public String endDate = "";
	public TongJiService tongJiService;
	ArrayList<ArrayList<String>> dataLists = new ArrayList<ArrayList<String>>();
	public String sysDate = "";
	public String startDateShow = "";
	public String endDateShow = "";
	public Integer parentId;
	public Integer orgId=1;
	public List<Org> orgList;
	public Org org;
	public IOrgService orgService;
	public IUserService userService;
	public List<User> userList;
	private String orgName;
	private String handleId;
	private String handleName;
	private String handleResult;
	public String getHandleResult() {
		return handleResult;
	}

	public void setHandleResult(String handleResult) {
		this.handleResult = handleResult;
	}

	public String getHandleName() {
		return handleName;
	}

	public void setHandleName(String handleName) {
		this.handleName = handleName;
	}

	public String getHandleId() {
		return handleId;
	}

	public void setHandleId(String handleId) {
		this.handleId = handleId;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	private RecordService recordService;

	public RecordService getRecordService() {
		return recordService;
	}

	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	public String tongJi() throws ParseException, SQLException {
		// 表格表头时间显示格式化
		Date date = new Date();
		sysDate = DateUtil.getDatestrByDateFormat(date, "yyyy年MM月dd日 HH时mm分");
		
		if (null != startDate && !"".equals(startDate)) {
			startDateShow = DateUtil.getDateByFormat(startDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		}
		if (null != endDate && !"".equals(endDate)) {
			endDateShow = DateUtil.getDateByFormat(endDate, "yyyy-MM-dd", "yyyy年MM月dd日");
		}
		User user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		Org org=this.recordService.getOrg();
		orgName=this.recordService.getRootOrg(org.getLocbm()).getName();
		// 接待与立案工作信息模块
		if (tongJiMoKuai.equals("2")) {
			if (tongJiType.equals("2")) {// 接待工作统计（月、周）

				// 返回统计时间段内统计数据List
				if(!handleId.equals("0")){
					User user1=this.recordService.getUserById(handleId);
					handleName=user1.getName();
				}else{
					handleName="0";
				}
				dataLists = getJieDaiTongJiByWeekLists(startDate, endDate,handleName,handleId);
				// 指定返回值，跳转页面
				return "success_jieDaiTongJiByWeek";

			} else if (tongJiType.equals("4")) {// 立案审查工作统计

				// 获取时间段内星期的的列表，前段页面循环星期列表获取相应周的统计数据
				//dataLists = tongJiService.getWeekLists(startDate, endDate);
				if(!handleId.equals("0")){
					User user1=this.recordService.getUserById(handleId);
					handleName=user1.getName();
				}
				// 指定返回值，跳转页面
				return "success_liAnShenChaTongJiByWeek";
			} else if (tongJiType.equals("5")) {// 未受理案件原因统计
				
				dataLists = tongJiService.gtWeiShouLiYuanYinTongJi(startDate, endDate,handleResult);
				// 指定返回值，跳转页面
				return "success_weiShouLiYuanYinTongJi";
			} else {

				return ERROR;
			}

		} else {
			return ERROR;
		}
	}

	public String dianHuaBen() {

		return SUCCESS;
	}

	// 返回统计时间段内统计数据List
	public ArrayList<ArrayList<String>> getJieDaiTongJiByWeekLists(String startDate, String endDate,String userName,String userId) throws SQLException {

		// 获取时间段内星期的的列表，前段页面循环星期列表获取相应周的统计数据
		ArrayList<ArrayList<String>> weekLists = tongJiService.getWeekLists(startDate, endDate);
		// 根据星期列表，返回统计数据
		return tongJiService.getJieDaiTongJiByWeekLists(weekLists,userName,userId);
	}

	// 获取时间段内，接待统计总数据的方法
	public ArrayList<String> getJieDaiTongJiTotalList(String startDate, String endDate,String userName,String userId) throws SQLException {
		if (null != startDate && !"".equals(startDate)) {
			startDate = DateUtil.getMonDayByDate(startDate, "yyyy-MM-dd");
		}
		if (null != endDate && !"".equals(endDate)) {
			endDate = DateUtil.getSunDayByDate(endDate, "yyyy-MM-dd");
		}

		return tongJiService.getJieDaiTongJiTotalList(startDate, endDate,userName,userId);
	}


	public String initTree() {
		org = (Org) coreService.getEntityObjectById(Org.class, this.getOrgId());
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String listUser(){
		org=(Org) coreService.getEntityObjectById(Org.class, this.getOrgId());
		userList=userService.getAllUserByOrg(org);
		return SUCCESS;
	}

	public ArrayList<String> getLiAnShenChaTongJiList(String startDate, String endDate,String userId) {

		return tongJiService.getLiAnShenChaTongJiList(startDate, endDate,userId);
	}

	public String getTongJiMoKuai() {
		return tongJiMoKuai;
	}

	public void setTongJiMoKuai(String tongJiMoKuai) {
		this.tongJiMoKuai = tongJiMoKuai;
	}

	public String getTongJiType() {
		return tongJiType;
	}

	public void setTongJiType(String tongJiType) {
		this.tongJiType = tongJiType;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public TongJiService getTongJiService() {
		return tongJiService;
	}

	public void setTongJiService(TongJiService tongJiService) {
		this.tongJiService = tongJiService;
	}

	public ArrayList<ArrayList<String>> getDataLists() {
		return dataLists;
	}

	public void setDataLists(ArrayList<ArrayList<String>> dataLists) {
		this.dataLists = dataLists;
	}

	public String getSysDate() {
		return sysDate;
	}

	public void setSysDate(String sysDate) {
		this.sysDate = sysDate;
	}

	public String getStartDateShow() {
		return startDateShow;
	}

	public void setStartDateShow(String startDateShow) {
		this.startDateShow = startDateShow;
	}

	public String getEndDateShow() {
		return endDateShow;
	}

	public void setEndDateShow(String endDateShow) {
		this.endDateShow = endDateShow;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}


	public List<Org> getOrgList() {
		return orgList;
	}

	public void setOrgList(List<Org> orgList) {
		this.orgList = orgList;
	}

	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}


	public IOrgService getOrgService() {
		return orgService;
	}

	public void setOrgService(IOrgService orgService) {
		this.orgService = orgService;
	}


	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Class getPersistentClass() {
		return Org.class;
	}
}
