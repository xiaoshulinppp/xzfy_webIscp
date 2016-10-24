package com.taiji.newUser.action;

import java.util.ArrayList;
import java.util.List;

import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedAction;
import com.taiji.newUser.service.NewUserService;
import com.taiji.user.domain.Role;

@SuppressWarnings("unchecked")
public class RoleAction extends ProtectedAction {

	private static final long serialVersionUID = 1L;

	// 类成员

	private List<Role> roleList = new ArrayList<Role>(); // 角色对象列表

	private Integer orgId = 0; // 组织ID

	private NewUserService newUserService = null; // 新用户业务层方法

	private PaginationSupport pageList = new PaginationSupport(); // 分页列表

	private Integer pageSize = 15; // 分页列表每页显示个数

	private Integer totalPage = 0; // 分页列表页面总数

	private String treeData = ""; // 角色树数据字符串

	// 公共方法

	// Set和Get方法

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public NewUserService getNewUserService() {
		return newUserService;
	}

	public void setNewUserService(NewUserService newUserService) {
		this.newUserService = newUserService;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public String getTreeData() {
		return treeData;
	}

	public void setTreeData(String treeData) {
		this.treeData = treeData;
	}

}
