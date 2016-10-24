package com.taiji.newUser.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.system.domain.DictItem;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.Role;
import com.taiji.user.domain.User;

public interface NewUserService extends ICoreService {

	/**
	 * 获取当前登录用户的User对象
	 * 
	 * @return User对象
	 */
	public User getCurrentUser();

	/**
	 * 获取当前登录用户所在的组织的Org对象
	 * 
	 * @return Org对象
	 */
	public Org getCurrentOrg();

	/**
	 * 获取组织树所有内容
	 * 
	 * @return Org对象列表
	 */
	public List<Org> getOrgListAll();

	/**
	 * 获取组织树所有内容
	 * 
	 * @param state
	 *            当state为true时只获取启动的组织项，当state为false时获取全部组织项
	 * @return Org对象列表
	 */
	public List<Org> getOrgListAll(boolean isStateTrue);

	/**
	 * 通过ID获取Org对象
	 * 
	 * @param orgId
	 *            Org对象的ID
	 * @return Org对象
	 */
	public Org getOrgById(int orgId);

	/**
	 * 通过指定ID获取Org子对象列表
	 * 
	 * @param orgId
	 *            Org对象的ID
	 * @return Org对象列表
	 */
	public List<Org> getOrgList(int orgId);

	/**
	 * 通过指定ID获取Org子对象列表
	 * 
	 * @param orgId
	 *            Org对象的ID
	 * @param isStateTrue
	 *            当state为true时只获取启动的组织项，当state为false时获取全部组织项
	 * @return Org对象列表
	 */
	public List<Org> getOrgList(int orgId, boolean isStateTrue);

	/**
	 * 通过指定ID获取Org对象分页列表
	 * 
	 * @param pageNum
	 *            当前查询的页数
	 * @param pageSize
	 *            每页显示的个数
	 * @param orgId
	 *            Org对象的ID
	 * @return Org对象列表
	 */
	public PaginationSupport getOrgListPage(int pageNum, int pageSize, int orgId);

	/**
	 * 获取指定组织ID对应的组织下的用户列表
	 * 
	 * @param pageNum
	 *            当前查询的页数
	 * @param pageSize
	 *            每页显示的个数
	 * @param orgId
	 *            Org对象的ID
	 * @return User对象列表
	 */
	public PaginationSupport getUserListByOrgId(int pageNum, int pageSize, int orgId);

	/**
	 * 通过ID获取用户对象
	 * 
	 * @param userId
	 *            用户对象ID
	 * @return 用户对象
	 */
	public User getUserById(int userId);

	/**
	 * 获取全部角色列表
	 * 
	 * @return 角色对象列表
	 */
	public List<Role> getRoleListAll();

	/**
	 * 通过ID获取角色对象
	 * 
	 * @param roleId
	 *            角色ID
	 * @return 角色对象
	 */
	public Role getRoleById(int roleId);

	/**
	 * 获取用户类型列表
	 * 
	 * @return DictItem对象列表
	 */
	public List<DictItem> getUserTypeList();

	/**
	 * 获取组织中最大顺序数
	 */
	public Integer getMaxOrgSequence();

	/**
	 * 获取所有用户列表
	 */
	public List<User> getAllUserList();

}
