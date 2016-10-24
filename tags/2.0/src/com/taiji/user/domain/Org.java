package com.taiji.user.domain;

import com.taiji.core.domain.Entity;
import java.util.LinkedHashSet;
import java.util.Set;

@SuppressWarnings(value = { "unchecked", "unused" })
public class Org extends Entity {
	private static final long serialVersionUID = 1L;

	private Org parent; // 父组织对象

	private Set users = new LinkedHashSet(); // 组织所辖用户集合

	private Set childs = new LinkedHashSet(); // 子组织集合

	private Set roles = new LinkedHashSet(); // 组织所辖角色集合

	private String locbm; // 组织编码（副）

	private String bm; // 组织编码

	private String name; // 组织名称

	private Integer state; // 组织状态

	private Integer level; // 组织级别

	private Integer seq = 0; // 组织顺序

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Org getParent() {
		return this.parent;
	}

	public void setParent(Org parent) {
		this.parent = parent;
	}

	public Set getUsers() {
		return this.users;
	}

	private void setUsers(Set users) {
		this.users = users;
	}

	public Set getRoles() {
		return this.roles;
	}

	private void setRoles(Set roles) {
		this.roles = roles;
	}

	public void addUser(User user) {
		if (user == null)
			throw new IllegalArgumentException("Null User");
		user.setOrg(this);
		this.users.add(user);
	}

	public Set getChilds() {
		return this.childs;
	}

	private void setChilds(Set childs) {
		this.childs = childs;
	}

	public void addChildOrg(Org childOrg) {
		if (childOrg == null)
			throw new IllegalArgumentException("Null Org");
		if (childOrg.getParent() != null)
			childOrg.getParent().getChilds().remove(childOrg);
		childOrg.setParent(this);
		this.childs.add(childOrg);
	}

	public String getLocbm() {
		return this.locbm;
	}

	public void setLocbm(String locBm) {
		this.locbm = locBm;
	}

	public String getBm() {
		return this.bm;
	}

	public void setBm(String bm) {
		this.bm = bm;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}
}