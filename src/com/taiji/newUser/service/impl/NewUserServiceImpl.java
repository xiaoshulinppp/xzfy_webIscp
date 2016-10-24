package com.taiji.newUser.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork.ActionContext;
import com.taiji.common.ContextUtil;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.newUser.service.NewUserService;
import com.taiji.system.domain.DictItem;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.Role;
import com.taiji.user.domain.User;

@SuppressWarnings("unchecked")
public class NewUserServiceImpl extends CoreServiceImpl implements NewUserService {

	/*
	 * 获取当前登录用户的User对象
	 * 
	 * @return User对象
	 */
	@Override
	public User getCurrentUser() {
		User currentUser = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		User user = (User) super.getEntityObjectById(User.class, currentUser.getId());
		return user;
	}

	/*
	 * 获取当前登录用户所在的组织的Org对象
	 * 
	 * @return Org对象
	 */
	@Override
	public Org getCurrentOrg() {
		return this.getCurrentUser().getOrg();
	}

	/*
	 * 获取组织树所有内容
	 * 
	 * @return Org对象列表
	 */
	@Override
	public List<Org> getOrgListAll() {
		String HQL = "";
		HQL += " from " + ContextUtil.OrgName + " o";
		HQL += " where 1 = 1";
		HQL += " order by o.seq asc";
		List<Org> dataList = super.find(HQL);
		if (dataList.isEmpty()) {
			dataList = new ArrayList<Org>();
		}
		return dataList;
	}

	/*
	 * 获取组织树所有内容
	 * 
	 * @param state 当state为true时只获取启动的组织项，当state为false时获取全部组织项
	 * 
	 * @return Org对象列表
	 */
	@Override
	public List<Org> getOrgListAll(boolean isStateTrue) {
		String HQL = "";
		HQL += " from " + ContextUtil.OrgName + " o";
		HQL += " where 1 = 1";
		if (isStateTrue) {
			HQL += " and o.state = 1";
		}
		HQL += " order by o.seq asc";
		List<Org> dataList = super.find(HQL);
		if (dataList.isEmpty()) {
			dataList = new ArrayList<Org>();
		}
		return dataList;
	}

	/*
	 * 通过ID获取Org对象
	 * 
	 * @param orgId Org对象的ID
	 * 
	 * @return Org对象
	 */
	@Override
	public Org getOrgById(int orgId) {
		String HQL = "";
		HQL += " from " + ContextUtil.OrgName + " o";
		HQL += " where 1 = 1";
		HQL += " and o.id = " + orgId;
		HQL += " order by o.seq asc";
		List<Org> dataList = super.find(HQL);
		if (dataList.isEmpty()) {
			return new Org();
		}
		return dataList.get(0);
	}

	/*
	 * 通过指定ID获取Org子对象列表
	 * 
	 * @param orgId Org对象的ID
	 * 
	 * @return Org对象列表
	 */
	@Override
	public List<Org> getOrgList(int orgId) {
		String HQL = "";
		HQL += " from " + ContextUtil.OrgName + " o";
		HQL += " where 1 = 1";
		HQL += " and o.parent.id = " + orgId;
		HQL += " order by o.seq asc";
		List<Org> dataList = super.find(HQL);
		if (dataList.isEmpty()) {
			dataList = new ArrayList<Org>();
		}
		return dataList;
	}

	/*
	 * 通过指定ID获取Org子对象列表
	 * 
	 * @param orgId Org对象的ID
	 * 
	 * @param isStateTrue 当state为true时只获取启动的组织项，当state为false时获取全部组织项
	 * 
	 * @return Org对象列表
	 */
	@Override
	public List<Org> getOrgList(int orgId, boolean isStateTrue) {
		String HQL = "";
		HQL += " from " + ContextUtil.OrgName + " o";
		HQL += " where 1 = 1";
		HQL += " and o.parent.id = " + orgId;
		if (isStateTrue) {
			HQL += " and o.state = 1";
		}
		HQL += " order by o.seq asc";
		List<Org> dataList = super.find(HQL);
		if (dataList.isEmpty()) {
			dataList = new ArrayList<Org>();
		}
		return dataList;
	}

	/*
	 * 通过指定ID获取Org对象分页列表
	 * 
	 * @param pageNum 当前查询的页数
	 * 
	 * @param pageSize 每页显示的个数
	 * 
	 * @param orgId Org对象的ID
	 * 
	 * @return Org对象列表
	 */
	@Override
	public PaginationSupport getOrgListPage(int pageNum, int pageSize, int orgId) {
		String HQL = "";
		HQL += " from " + ContextUtil.OrgName + " o";
		HQL += " where 1 = 1";
		HQL += " and o.parent.id = " + orgId;
		HQL += " order by o.seq asc";
		return super.find(HQL, pageNum, pageSize);
	}

	/*
	 * 获取指定组织ID对应的组织下的用户列表
	 * 
	 * @param pageNum 当前查询的页数
	 * 
	 * @param pageSize 每页显示的个数
	 * 
	 * @param orgId Org对象的ID
	 * 
	 * @return User对象列表
	 */
	@Override
	public PaginationSupport getUserListByOrgId(int pageNum, int pageSize, int orgId) {
		String HQL = "";
		HQL += " from " + ContextUtil.UserName + " u";
		HQL += " where 1 = 1";
		if (orgId != 0) {
			HQL += " and u.org.id = " + orgId;
		}
		HQL += " order by u.id asc";
		return super.find(HQL, pageNum, pageSize);
	}

	/*
	 * 获取所有的角色对象列表
	 * 
	 * @return 角色对象列表
	 */
	@Override
	public List<Role> getRoleListAll() {
		String HQL = "";
		HQL += " from " + ContextUtil.RoleName + " r";
		HQL += " where 1 = 1";
		HQL += " order by r.id asc";
		List<Role> dataList = super.find(HQL);
		if (dataList.isEmpty()) {
			dataList = new ArrayList<Role>();
		}
		return dataList;
	}

	/*
	 * 通过ID获取角色对象
	 * 
	 * @param roleId 角色ID
	 * 
	 * @return 角色对象
	 */
	@Override
	public Role getRoleById(int roleId) {
		String HQL = "";
		HQL += " from " + ContextUtil.RoleName + " r";
		HQL += " where 1 = 1";
		HQL += " and r.id = " + roleId;
		List<Role> dataList = super.find(HQL);
		Role role = new Role();
		if (!dataList.isEmpty()) {
			role = dataList.get(0);
		}
		return role;
	}

	/*
	 * 获取用户类型列表
	 * 
	 * @return DictItem对象列表
	 */
	@Override
	public List<DictItem> getUserTypeList() {
		String HQL = "";
		HQL += " from " + ContextUtil.DictItemName + " d";
		HQL += " where 1 = 1";
		HQL += " and d.dict.id = 64";
		HQL += " order by d.seq asc";
		List<DictItem> dataList = super.find(HQL);
		if (dataList.isEmpty()) {
			dataList = new ArrayList<DictItem>();
		}
		return dataList;
	}

	/*
	 * 通过ID获取用户对象
	 * 
	 * @param userId 用户对象ID
	 * 
	 * @return 用户对象
	 */
	@Override
	public User getUserById(int userId) {
		String HQL = "";
		HQL += " from " + ContextUtil.UserName + " u";
		HQL += " where 1 = 1";
		HQL += " and u.id = " + userId;
		List<User> dataList = super.find(HQL);
		User user = new User();
		if (!dataList.isEmpty()) {
			user = dataList.get(0);
		}
		return user;
	}

	/*
	 * 获取组织中最大顺序数
	 */
	@Override
	public Integer getMaxOrgSequence() {
		String HQL = "";
		HQL += " from " + ContextUtil.OrgName + " o";
		HQL += " where 1 = 1";
		HQL += " order by o.seq desc";
		List<Org> dataList = super.find(HQL);
		if (!dataList.isEmpty()) {
			return dataList.get(0).getSeq();
		}
		return 0;
	}

	/*
	 * 获取所有用户列表
	 */
	@Override
	public List<User> getAllUserList() {
		String HQL = "";
		HQL += " from " + ContextUtil.UserName + " u";
		HQL += " where 1 = 1";
		HQL += " order by u.id asc";
		List<User> dataList = super.find(HQL);
		if(dataList.isEmpty()){
			dataList = new ArrayList<User>();
		}
		return dataList;
	}

}
