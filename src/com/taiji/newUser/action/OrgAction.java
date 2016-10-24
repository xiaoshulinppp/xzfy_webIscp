package com.taiji.newUser.action;

import java.util.ArrayList;
import java.util.List;

import org.slime.json.JsonBuilder;
import org.slime.json.JsonEntity;
import org.slime.json.JsonObject;
import org.slime.json.JsonResolver;

import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.newUser.service.NewUserService;
import com.taiji.user.domain.Org;

@SuppressWarnings("unchecked")
public class OrgAction extends ProtectedDetailAction {

	private static final long serialVersionUID = 1L;

	// 类成员

	private PaginationSupport pageList = new PaginationSupport(); // 分页列表

	private NewUserService newUserService = null; // 用户业务层方法

	private Integer orgId = 0; // 组织树节点ID

	private String orgIds = ""; // 组织树节点（多选）

	private Org currentOrg = new Org(); // 当前用户所在组织对象

	private String treeData = ""; // 组织树数据字符串

	private String expandOrg = "0"; // 是否展开当前orgId节点，1为展开，0为不展开

	private List<Org> orgList = new ArrayList<Org>(); // 组织对象列表

	private Integer pageSize = 15; // 分页列表每页显示个数

	private Integer totalPage = 0; // 分页列表页面总数

	private Org orgObject = new Org(); // 组织对象

	private Integer orgSeq = 0; // 组织顺序

	private String messageContent = ""; // 信息页面内容

	private String messageAction = ""; // 信息页面跳转路径

	private String onloadCode = ""; // 信息页面默认载入后执行的JS代码

	// 继承方法

	@Override
	public Class<Org> getPersistentClass() {
		return Org.class;
	}

	// 公共方法

	/**
	 * 获取整个组织树
	 */
	public String getOrgTreeAll() {
		try {
			List<Org> orgList = this.newUserService.getOrgListAll();
			JsonObject jsonObject = new JsonObject();
			for (int i = 0; i < orgList.size(); i++) {
				JsonEntity jsonEntity = new JsonEntity();
				jsonEntity.setAttribute("id", String.valueOf(orgList.get(i).getId()));
				jsonEntity.setAttribute("pId", String.valueOf(orgList.get(i).getParent().getId()));
				jsonEntity.setAttribute("name", orgList.get(i).getName());
				jsonEntity.setAttribute("orgBm", orgList.get(i).getBm());
				jsonEntity.setAttribute("orgSeq", String.valueOf(orgList.get(i).getSeq()));
				jsonObject.appendJsonEntity(jsonEntity);
			}
			JsonBuilder builder = new JsonBuilder();
			builder.isLineFeed(true);
			builder.isSimpleNameType(false);
			builder.isSimpleValueType(true);
			jsonObject.sortJsonByAttribute("orgSeq", "Integer");
			this.treeData = builder.buildJsonObject(jsonObject);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 获取整个组织树，其中组织为已启动项
	 */
	public String getOrgTreeAllWithState() {
		try {
			List<Org> orgList = this.newUserService.getOrgListAll(true);
			JsonObject jsonObject = new JsonObject();
			for (int i = 0; i < orgList.size(); i++) {
				JsonEntity jsonEntity = new JsonEntity();
				jsonEntity.setAttribute("id", String.valueOf(orgList.get(i).getId()));
				jsonEntity.setAttribute("pId", String.valueOf(orgList.get(i).getParent().getId()));
				jsonEntity.setAttribute("name", orgList.get(i).getName());
				jsonEntity.setAttribute("orgBm", orgList.get(i).getBm());
				jsonEntity.setAttribute("orgSeq", String.valueOf(orgList.get(i).getSeq()));
				jsonObject.appendJsonEntity(jsonEntity);
			}
			JsonBuilder builder = new JsonBuilder();
			builder.isLineFeed(true);
			builder.isSimpleNameType(false);
			builder.isSimpleValueType(true);
			jsonObject.sortJsonByAttribute("orgSeq", "Integer");
			this.treeData = builder.buildJsonObject(jsonObject);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 获取指定ID下的组织树
	 */
	public String getOrgTreeById() {
		try {
			Org org = this.newUserService.getOrgById(this.orgId);
			List<Org> orgList = this.newUserService.getOrgList(this.orgId);
			JsonObject jsonObject = new JsonObject();
			JsonEntity rootEntity = new JsonEntity();
			rootEntity.setAttribute("id", String.valueOf(org.getId()));
			rootEntity.setAttribute("pId", String.valueOf(org.getParent().getId()));
			rootEntity.setAttribute("name", org.getName());
			rootEntity.setAttribute("orgBm", org.getBm());
			rootEntity.setAttribute("orgSeq", String.valueOf(org.getSeq()));
			jsonObject.appendJsonEntity(rootEntity);
			for (int i = 0; i < orgList.size(); i++) {
				JsonEntity jsonEntity = new JsonEntity();
				jsonEntity.setAttribute("id", String.valueOf(orgList.get(i).getId()));
				jsonEntity.setAttribute("pId", String.valueOf(orgList.get(i).getParent().getId()));
				jsonEntity.setAttribute("name", orgList.get(i).getName());
				jsonEntity.setAttribute("orgBm", orgList.get(i).getBm());
				jsonEntity.setAttribute("orgSeq", String.valueOf(orgList.get(i).getSeq()));
				jsonObject.appendJsonEntity(jsonEntity);
			}
			JsonBuilder builder = new JsonBuilder();
			builder.isLineFeed(true);
			builder.isSimpleNameType(false);
			builder.isSimpleValueType(true);
			jsonObject.sortJsonByAttribute("orgSeq", "Integer");
			this.treeData = builder.buildJsonObject(jsonObject);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 获取指定ID下的组织树，其中组织为已启动项
	 */
	public String getOrgTreeByIdWithState() {
		try {
			Org org = this.newUserService.getOrgById(this.orgId);
			List<Org> orgList = this.newUserService.getOrgList(this.orgId, true);
			JsonObject jsonObject = new JsonObject();
			JsonEntity rootEntity = new JsonEntity();
			rootEntity.setAttribute("id", String.valueOf(org.getId()));
			rootEntity.setAttribute("pId", String.valueOf(org.getParent().getId()));
			rootEntity.setAttribute("name", org.getName());
			rootEntity.setAttribute("orgBm", org.getBm());
			rootEntity.setAttribute("orgSeq", String.valueOf(org.getSeq()));
			jsonObject.appendJsonEntity(rootEntity);
			for (int i = 0; i < orgList.size(); i++) {
				JsonEntity jsonEntity = new JsonEntity();
				jsonEntity.setAttribute("id", String.valueOf(orgList.get(i).getId()));
				jsonEntity.setAttribute("pId", String.valueOf(orgList.get(i).getParent().getId()));
				jsonEntity.setAttribute("name", orgList.get(i).getName());
				jsonEntity.setAttribute("orgBm", orgList.get(i).getBm());
				jsonEntity.setAttribute("orgSeq", String.valueOf(orgList.get(i).getSeq()));
				jsonObject.appendJsonEntity(jsonEntity);
			}
			JsonBuilder builder = new JsonBuilder();
			builder.isLineFeed(true);
			builder.isSimpleNameType(false);
			builder.isSimpleValueType(true);
			jsonObject.sortJsonByAttribute("orgSeq", "Integer");
			this.treeData = builder.buildJsonObject(jsonObject);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 获取当前用户所在组织的组织树
	 */
	public String getUserOrgTree() {
		try {
			Org org = this.newUserService.getCurrentOrg();
			List<Org> orgList = this.newUserService.getOrgList(org.getId());
			JsonObject jsonObject = new JsonObject();
			JsonEntity rootEntity = new JsonEntity();
			rootEntity.setAttribute("id", String.valueOf(org.getId()));
			rootEntity.setAttribute("pId", String.valueOf(org.getParent().getId()));
			rootEntity.setAttribute("name", org.getName());
			rootEntity.setAttribute("orgBm", org.getBm());
			rootEntity.setAttribute("orgSeq", String.valueOf(org.getSeq()));
			jsonObject.appendJsonEntity(rootEntity);
			for (int i = 0; i < orgList.size(); i++) {
				JsonEntity jsonEntity = new JsonEntity();
				jsonEntity.setAttribute("id", String.valueOf(orgList.get(i).getId()));
				jsonEntity.setAttribute("pId", String.valueOf(this.orgId));
				jsonEntity.setAttribute("name", orgList.get(i).getName());
				jsonEntity.setAttribute("orgBm", orgList.get(i).getBm());
				jsonEntity.setAttribute("orgSeq", String.valueOf(orgList.get(i).getSeq()));
				if (!orgList.get(i).getChilds().isEmpty()) {
					jsonEntity.setAttribute("isParent", "true");
				}
				jsonObject.appendJsonEntity(jsonEntity);
			}
			JsonBuilder builder = new JsonBuilder();
			builder.isLineFeed(true);
			builder.isSimpleNameType(false);
			builder.isSimpleValueType(true);
			jsonObject.sortJsonByAttribute("orgSeq", "Integer");
			this.treeData = builder.buildJsonObject(jsonObject);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 获取当前用户所在组织的组织树，其中组织为已启动项
	 */
	public String getUserOrgTreeWithState() {
		try {
			Org org = this.newUserService.getCurrentOrg();
			List<Org> orgList = this.newUserService.getOrgList(org.getId(), true);
			JsonObject jsonObject = new JsonObject();
			JsonEntity rootEntity = new JsonEntity();
			rootEntity.setAttribute("id", String.valueOf(org.getId()));
			rootEntity.setAttribute("pId", String.valueOf(org.getParent().getId()));
			rootEntity.setAttribute("name", org.getName());
			rootEntity.setAttribute("orgBm", org.getBm());
			rootEntity.setAttribute("orgSeq", String.valueOf(org.getSeq()));
			jsonObject.appendJsonEntity(rootEntity);
			for (int i = 0; i < orgList.size(); i++) {
				JsonEntity jsonEntity = new JsonEntity();
				jsonEntity.setAttribute("id", String.valueOf(orgList.get(i).getId()));
				jsonEntity.setAttribute("pId", String.valueOf(this.orgId));
				jsonEntity.setAttribute("name", orgList.get(i).getName());
				jsonEntity.setAttribute("orgBm", orgList.get(i).getBm());
				jsonEntity.setAttribute("orgSeq", String.valueOf(orgList.get(i).getSeq()));
				if (!orgList.get(i).getChilds().isEmpty()) {
					jsonEntity.setAttribute("isParent", "true");
				}
				jsonObject.appendJsonEntity(jsonEntity);
			}
			JsonBuilder builder = new JsonBuilder();
			builder.isLineFeed(true);
			builder.isSimpleNameType(false);
			builder.isSimpleValueType(true);
			jsonObject.sortJsonByAttribute("orgSeq", "Integer");
			this.treeData = builder.buildJsonObject(jsonObject);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 获取指定节点下的子节点组织树
	 */
	public String getChildOrgTree() {
		try {
			JsonResolver resolver = new JsonResolver();
			JsonObject jsonObject = resolver.parseJson(this.treeData);
			List<Org> orgList = this.newUserService.getOrgList(this.orgId);
			for (int i = 0; i < orgList.size(); i++) {
				JsonEntity jsonEntity = new JsonEntity();
				jsonEntity.setAttribute("id", String.valueOf(orgList.get(i).getId()));
				jsonEntity.setAttribute("pId", String.valueOf(this.orgId));
				jsonEntity.setAttribute("name", orgList.get(i).getName());
				jsonEntity.setAttribute("orgBm", orgList.get(i).getBm());
				jsonEntity.setAttribute("orgSeq", String.valueOf(orgList.get(i).getSeq()));
				if (!orgList.get(i).getChilds().isEmpty()) {
					jsonEntity.setAttribute("isParent", "true");
				}
				jsonObject.appendJsonEntity(jsonEntity);
			}
			JsonBuilder builder = new JsonBuilder();
			builder.isLineFeed(true);
			builder.isSimpleNameType(false);
			builder.isSimpleValueType(true);
			jsonObject.sortJsonByAttribute("orgSeq", "Integer");
			this.treeData = builder.buildJsonObject(jsonObject);
			this.expandOrg = "1";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 获取指定节点下的子节点组织树，其中组织为已启动项
	 */
	public String getChildOrgTreeWithState() {
		try {
			JsonResolver resolver = new JsonResolver();
			JsonObject jsonObject = resolver.parseJson(this.treeData);
			List<Org> orgList = this.newUserService.getOrgList(this.orgId, true);
			for (int i = 0; i < orgList.size(); i++) {
				JsonEntity jsonEntity = new JsonEntity();
				jsonEntity.setAttribute("id", String.valueOf(orgList.get(i).getId()));
				jsonEntity.setAttribute("pId", String.valueOf(this.orgId));
				jsonEntity.setAttribute("name", orgList.get(i).getName());
				jsonEntity.setAttribute("orgBm", orgList.get(i).getBm());
				jsonEntity.setAttribute("orgSeq", String.valueOf(orgList.get(i).getSeq()));
				if (!orgList.get(i).getChilds().isEmpty()) {
					jsonEntity.setAttribute("isParent", "true");
				}
				jsonObject.appendJsonEntity(jsonEntity);
			}
			JsonBuilder builder = new JsonBuilder();
			builder.isLineFeed(true);
			builder.isSimpleNameType(false);
			builder.isSimpleValueType(true);
			jsonObject.sortJsonByAttribute("orgSeq", "Integer");
			this.treeData = builder.buildJsonObject(jsonObject);
			this.expandOrg = "1";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 更新组织树节点信息
	 */
	public String updateOrgTreeNode() {
		try {
			Org org = this.newUserService.getOrgById(this.orgId);
			JsonResolver jsonResolver = new JsonResolver();
			JsonObject jsonObject = jsonResolver.parseJson(this.treeData);
			List<JsonEntity> entityList = jsonObject.getJosnEntitiesByAttribute("id", String.valueOf(this.orgId));
			if (!entityList.isEmpty()) {
				JsonEntity jsonEntity = entityList.get(0);
				jsonEntity.setAttribute("name", org.getName());
				jsonEntity.setAttribute("orgBm", org.getBm());
				jsonEntity.setAttribute("orgSeq", String.valueOf(org.getSeq()));
			}
			JsonBuilder jsonBuilder = new JsonBuilder();
			jsonBuilder.isLineFeed(true);
			jsonBuilder.isSimpleNameType(false);
			jsonBuilder.isSimpleValueType(true);
			jsonObject.sortJsonByAttribute("orgSeq", "Integer");
			this.treeData = jsonBuilder.buildJsonObject(jsonObject);
			this.expandOrg = "0";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 删除组织树节点信息
	 */
	public String deleteOrgTreeNode() {
		try {
			JsonResolver jsonResolver = new JsonResolver();
			JsonObject jsonObject = jsonResolver.parseJson(this.treeData);
			List<JsonEntity> entityList = jsonObject.getJosnEntitiesByAttribute("id", String.valueOf(this.orgId));
			String parentId = "";
			if (!entityList.isEmpty()) {
				JsonEntity jsonEntity = entityList.get(0);
				parentId = jsonEntity.getAttributeValue("pId");
				this.removeTreeNode(jsonObject, this.orgId);
			}
			this.orgId = Integer.valueOf(parentId).intValue();
			JsonBuilder jsonBuilder = new JsonBuilder();
			jsonBuilder.isLineFeed(true);
			jsonBuilder.isSimpleNameType(false);
			jsonBuilder.isSimpleValueType(true);
			jsonObject.sortJsonByAttribute("orgSeq", "Integer");
			this.treeData = jsonBuilder.buildJsonObject(jsonObject);
			this.expandOrg = "1";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 插入新的组织树节点信息
	 */
	public String insertOrgTreeNode() {
		try {
			JsonResolver jsonResolver = new JsonResolver();
			JsonObject jsonObject = jsonResolver.parseJson(this.treeData);
			this.removeTreeNode(jsonObject, this.orgId);
			Org org = this.newUserService.getOrgById(this.orgId);
			List<Org> orgList = this.newUserService.getOrgList(this.orgId);
			JsonEntity jsonEntity = new JsonEntity();
			jsonEntity.setAttribute("id", String.valueOf(this.orgId));
			jsonEntity.setAttribute("pId", String.valueOf(org.getParent().getId()));
			jsonEntity.setAttribute("name", org.getName());
			jsonEntity.setAttribute("orgBm", org.getBm());
			jsonEntity.setAttribute("orgSeq", String.valueOf(org.getSeq()));
			jsonObject.appendJsonEntity(jsonEntity);
			for (int i = 0; i < orgList.size(); i++) {
				jsonEntity = new JsonEntity();
				jsonEntity.setAttribute("id", String.valueOf(orgList.get(i).getId()));
				jsonEntity.setAttribute("pId", String.valueOf(this.orgId));
				jsonEntity.setAttribute("name", orgList.get(i).getName());
				jsonEntity.setAttribute("orgBm", orgList.get(i).getBm());
				jsonEntity.setAttribute("orgSeq", String.valueOf(orgList.get(i).getSeq()));
				if (!orgList.get(i).getChilds().isEmpty()) {
					jsonEntity.setAttribute("isParent", "true");
				}
				jsonObject.appendJsonEntity(jsonEntity);
			}
			JsonBuilder jsonBuilder = new JsonBuilder();
			jsonBuilder.isLineFeed(true);
			jsonBuilder.isSimpleNameType(false);
			jsonObject.sortJsonByAttribute("orgSeq", "Integer");
			this.treeData = jsonBuilder.buildJsonObject(jsonObject);
			this.expandOrg = "1";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 刷新指定节的子节点
	 */
	public String refreshOrgTreeNode() {
		try {
			JsonResolver jsonResolver = new JsonResolver();
			JsonObject jsonObject = jsonResolver.parseJson(this.treeData);
			List<Org> orgList = this.newUserService.getOrgList(this.orgId);
			List<JsonEntity> entityList = jsonObject.getJosnEntitiesByAttribute("pId", String.valueOf(this.orgId));
			for (int i = 0; i < entityList.size(); i++) {
				this.removeTreeNode(jsonObject, Integer.valueOf(entityList.get(i).getAttributeValue("id")));
			}
			for (int i = 0; i < orgList.size(); i++) {
				JsonEntity jsonEntity = new JsonEntity();
				jsonEntity.setAttribute("id", String.valueOf(orgList.get(i).getId()));
				jsonEntity.setAttribute("pId", String.valueOf(this.orgId));
				jsonEntity.setAttribute("name", orgList.get(i).getName());
				jsonEntity.setAttribute("orgBm", orgList.get(i).getBm());
				jsonEntity.setAttribute("orgSeq", String.valueOf(orgList.get(i).getSeq()));
				if (!orgList.get(i).getChilds().isEmpty()) {
					jsonEntity.setAttribute("isParent", "true");
				}
				jsonObject.appendJsonEntity(jsonEntity);
			}
			JsonBuilder jsonBuilder = new JsonBuilder();
			jsonBuilder.isLineFeed(true);
			jsonBuilder.isSimpleNameType(false);
			jsonObject.sortJsonByAttribute("orgSeq", "Integer");
			this.treeData = jsonBuilder.buildJsonObject(jsonObject);
			this.expandOrg = "1";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 获取子点下子组织列表
	 */
	public String getChildOrgList() {
		try {
			this.pageList = this.newUserService.getOrgListPage(super.getPageNum(), this.pageSize, this.orgId);
			this.orgList = (List<Org>) this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 进入组织管理页面
	 */
	public String gotoOrgFrame() {
		try {
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 获取组织信息
	 */
	public String showOrgInfo() {
		try {
			if (this.orgId == 0) {
				return "welcome";
			}
			this.currentOrg = this.newUserService.getCurrentOrg();
			this.orgObject = this.newUserService.getOrgById(this.orgId);
			this.setOrg(this.orgObject);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 更新组织信息
	 */
	public String updateOrgInfo() {
		try {
			this.newUserService.update(this.getOrg());
			this.messageContent = "组织信息修改成功！";
			this.messageAction = "../newUser/showOrgInfo.action?funcCode=" + super.getFuncCode() + "&orgId="
					+ super.getEntityId();
			this.onloadCode = "window.parent.updateTree(" + super.getEntityId() + ");";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 删除组织信息
	 */
	public String deleteOrgInfo() {
		try {
			int orgId = super.getEntityId();
			int parentId = this.getOrg().getParent().getId();
			this.newUserService.remove(this.getOrg());
			this.messageContent = "组织删除成功！";
			this.messageAction = "../newUser/showOrgInfo.action?funcCode=" + super.getFuncCode() + "&orgId=" + parentId;
			this.onloadCode = "window.parent.deleteTree(" + orgId + ")";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 批量删除组织信息
	 */
	public String deleteOrgBatch() {
		try {
			String[] orgIdArray = this.orgIds.trim().split(",");
			for (int i = 0; i < orgIdArray.length; i++) {
				int id = Integer.valueOf(orgIdArray[i].trim()).intValue();
				Org org = this.newUserService.getOrgById(id);
				this.newUserService.remove(org);
			}
			this.messageContent = "组织删除成功！";
			this.messageAction = "../newUser/getChildOrgList.action?funcCode=" + super.getFuncCode() + "&orgId=" + this.orgId;
			this.onloadCode = "window.parent.refreshTree(" + this.orgId + ")";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 进入创建组织子项页面
	 */
	public String gotoCreateChildOrg() {
		try {
			this.orgSeq = this.newUserService.getMaxOrgSequence().intValue() + 1;
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 创建组织子项
	 */
	public String createChildOrg() {
		try {
			Org parentOrg = this.newUserService.getOrgById(this.orgId);
			int level = parentOrg.getLevel().intValue() + 1;
			parentOrg.addChildOrg(this.getOrg());
			this.getOrg().setParent(parentOrg);
			this.getOrg().setLevel(level);
			this.newUserService.save(this.getOrg());
			this.messageContent = "新增组织成功！";
			this.messageAction = "../newUser/getChildOrgList.action?funcCode=" + super.getFuncCode() + "&orgId=" + this.orgId;
			this.onloadCode = "window.parent.insertTree(" + this.orgId + ")";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	// 私有方法

	/*
	 * 删除树的节点
	 */
	private void removeTreeNode(JsonObject jsonObject, int orgId) {
		List<JsonEntity> jsonEntities = jsonObject.getJosnEntitiesByAttribute("id", String.valueOf(orgId));
		if (!jsonEntities.isEmpty()) {
			jsonObject.removeEntity(jsonEntities.get(0));
		}
		jsonEntities = jsonObject.getJosnEntitiesByAttribute("pId", String.valueOf(orgId));
		for (int i = 0; i < jsonEntities.size(); i++) {
			int id = Integer.valueOf(jsonEntities.get(i).getAttributeValue("id")).intValue();
			this.removeTreeNode(jsonObject, id);
		}
	}

	// 自定义Set和Get方法

	public Org getOrg() {
		return (Org) super.getEntity();
	}

	public void setOrg(Org org) {
		super.setEntity(org);
	}

	// Set和Get方法

	public NewUserService getNewUserService() {
		return newUserService;
	}

	public void setNewUserService(NewUserService newUserService) {
		this.newUserService = newUserService;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public Org getCurrentOrg() {
		return currentOrg;
	}

	public void setCurrentOrg(Org currentOrg) {
		this.currentOrg = currentOrg;
	}

	public String getTreeData() {
		return treeData;
	}

	public void setTreeData(String treeData) {
		this.treeData = treeData;
	}

	public String getExpandOrg() {
		return expandOrg;
	}

	public void setExpandOrg(String expandOrg) {
		this.expandOrg = expandOrg;
	}

	public List<Org> getOrgList() {
		return orgList;
	}

	public void setOrgList(List<Org> orgList) {
		this.orgList = orgList;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Org getOrgObject() {
		return orgObject;
	}

	public void setOrgObject(Org orgObject) {
		this.orgObject = orgObject;
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

	public String getOrgIds() {
		return orgIds;
	}

	public void setOrgIds(String orgIds) {
		this.orgIds = orgIds;
	}

	public Integer getOrgSeq() {
		return orgSeq;
	}

	public void setOrgSeq(Integer orgSeq) {
		this.orgSeq = orgSeq;
	}

}
