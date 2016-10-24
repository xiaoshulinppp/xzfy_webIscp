package com.taiji.newUser.action;

import java.util.ArrayList;
import java.util.List;

import slime.util.character.CharacterUtil;

import com.taiji.core.util.Encrypt;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedAction;
import com.taiji.newUser.service.NewUserService;
import com.taiji.system.domain.DictItem;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.Role;
import com.taiji.user.domain.User;

@SuppressWarnings("unchecked")
public class UserAction extends ProtectedAction {

	private static final long serialVersionUID = 1L;

	// 类成员

	private PaginationSupport pageList = new PaginationSupport(); // 分页列表

	private List<User> userList = new ArrayList<User>(); // 用户列表

	private List<Role> roleList = new ArrayList<Role>(); // 角色列表

	private List<DictItem> userTypeList = new ArrayList<DictItem>(); // 用户类型列表

	private Integer orgId = 0; // 组织ID

	private NewUserService newUserService = null; // 新用户业务层方法

	private Integer pageSize = 15; // 分页列表每页显示个数

	private Integer totalPage = 0; // 分页列表页面总数

	private User user = new User(); // 用户对象

	private String selectedRoles = ""; // 选择的角色

	private String messageContent = ""; // 信息页面内容

	private String messageAction = ""; // 信息页面跳转路径

	private String onloadCode = ""; // 信息页面默认载入后执行的JS代码

	private Integer userId = 0; // 用户对象ID

	// 公共方法

	/**
	 * 进入用户管理页面
	 */
	public String gotoUserFrame() {
		try {
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 获取用户列表
	 */
	public String getUserInfoList() {
		try {
			this.pageList = this.newUserService.getUserListByOrgId(super.getPageNum(), this.pageSize, this.orgId);
			this.totalPage = this.pageList.getTotalPage();
			this.userList = this.pageList.getItems();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 进入新增用户页面
	 */
	public String gotoCreateUser() {
		try {
			this.roleList = this.newUserService.getRoleListAll();
			this.userTypeList = this.newUserService.getUserTypeList();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 创建用户
	 */
	public String createUser() {
		try {
			Org org = this.newUserService.getOrgById(this.orgId);
			this.user.setOrg(org);
			this.user.setPassword(Encrypt.encryptString(user.getPassword()));
			this.user.setStyle(this.newUserService.getCurrentUser().getStyle());
			this.user.setLoginState(new Integer(0));
			this.user.setType("0");
			String[] roleArray = this.selectedRoles.trim().split(",");
			for (int i = 0; i < roleArray.length; i++) {
				user.getRoles().add(this.newUserService.getRoleById(CharacterUtil.convertObjectToInteger(roleArray[i])));
			}
			this.newUserService.save(this.user);
			this.messageContent = "新增用户成功！";
			this.messageAction = "../newUser/getUserInfoList.action?funcCode=" + super.getFuncCode() + "&orgId=" + this.orgId;
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 删除用户
	 */
	public String deleteUser() {
		try {
			User currentUser = this.newUserService.getCurrentUser();
			if (currentUser.getId().intValue() == this.user.getId().intValue()) {
				this.messageContent = "无法删除本用户！";
				return "fail";
			} else if (this.user.getId().intValue() == 1) {
				this.messageContent = "无法删除管理员用户！";
				return "fail";
			} else {
				User user = this.newUserService.getUserById(this.user.getId());
				if (user.getLoginState().intValue() == 1) {
					this.messageContent = "该用户未注销，无法删除！";
					return "fail";
				}
				this.newUserService.remove(user);
			}
			this.messageContent = "删除用户成功！";
			this.messageAction = "../newUser/getUserInfoList.action?funcCode=" + super.getFuncCode() + "&orgId=" + this.orgId;
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 进入用户更改页面
	 */
	public String gotoUpdateUser() {
		try {
			this.user = this.newUserService.getUserById(this.userId);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	/**
	 * 修改用户信息
	 */
	public String updateUser() {
		try {
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	// Set和Get方法

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public List<User> getUserList() {
		return userList;
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

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getMessageAction() {
		return messageAction;
	}

	public void setMessageAction(String messageAction) {
		this.messageAction = messageAction;
	}

	public String getOnloadCode() {
		return onloadCode;
	}

	public void setOnloadCode(String onloadCode) {
		this.onloadCode = onloadCode;
	}

	public String getSelectedRoles() {
		return selectedRoles;
	}

	public void setSelectedRoles(String selectedRoles) {
		this.selectedRoles = selectedRoles;
	}

	public List<DictItem> getUserTypeList() {
		return userTypeList;
	}

	public void setUserTypeList(List<DictItem> userTypeList) {
		this.userTypeList = userTypeList;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}
