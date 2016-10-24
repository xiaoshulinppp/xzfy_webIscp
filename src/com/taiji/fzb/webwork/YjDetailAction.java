package com.taiji.fzb.webwork;

import java.util.List;

import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.YjService;

public class YjDetailAction extends ProtectedDetailAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<XzfyInfo> infoList;
	private List<XzfyInfo> allList;
	private YjService yjService = null;
	private String xzfyId;
	private PaginationSupport pageList = new PaginationSupport(); // 分页列表
	private Integer pageSize = 15; // 分页列表每页显示个数
	private Integer totalPage = 0; // 分页列表页面总数
	private Integer pNum=1;
	public List<XzfyInfo> getInfoList() {
		return infoList;
	}
	public void setInfoList(List<XzfyInfo> infoList) {
		this.infoList = infoList;
	}
	public List<XzfyInfo> getAllList() {
		return allList;
	}
	public void setAllList(List<XzfyInfo> allList) {
		this.allList = allList;
	}
	public YjService getYjService() {
		return yjService;
	}
	public void setYjService(YjService yjService) {
		this.yjService = yjService;
	}
	public String getXzfyId() {
		return xzfyId;
	}
	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}
	public PaginationSupport getPageList() {
		return pageList;
	}
	public void setPageList(PaginationSupport pageList) {
		this.pageList = pageList;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getpNum() {
		return pNum;
	}
	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}
	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}
	public String showList(){
		pageList = yjService.getList(pNum, pageSize);
		infoList = pageList.getItems();
		//allList = yjService.allList();
		totalPage = pageList.getTotalPage();
		return SUCCESS;
	}

}
