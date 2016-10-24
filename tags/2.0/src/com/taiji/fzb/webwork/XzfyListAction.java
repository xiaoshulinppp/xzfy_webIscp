package com.taiji.fzb.webwork;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedListAction;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.XzfyService;

@SuppressWarnings("serial")
public class XzfyListAction extends ProtectedListAction{

	private static final String TABLE_NAME = "xzfy_info";
	
	public int pageSize = 15;

	public int pageNum = 1;

	public int totalPage = 1;

	public int totalCount = 0;
	
	public PaginationSupport list = new PaginationSupport();

	public XzfyInfo xzfyInfo;
	
	private XzfyService xzfyService = null;
	
	private List<XzfyInfo> xzfyList = new ArrayList<XzfyInfo>();
	
	private List<XzfyInfo> xzfyList1 = new ArrayList<XzfyInfo>();
	private List<XzfyInfo> xzfyList2 = new ArrayList<XzfyInfo>();
	private List<XzfyInfo> xzfyList3 = new ArrayList<XzfyInfo>();
	
	@SuppressWarnings("unchecked")
	public String daibanList() throws Exception {
		this.list = this.xzfyService.getXzfyListByStatus("1",pageNum,pageSize);
		this.totalPage = this.list.getTotalPage();
		this.setXzfyList(this.list.getItems());
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String indexList() throws Exception {
		//  取得所有未结案案件
		this.list = this.xzfyService.getXzfyListNoEnd(pageNum,pageSize);
//		this.totalPage = this.list.getTotalPage();
		this.setXzfyList(this.list.getItems());
		//  取得所有待立案案件
		this.list = this.xzfyService.getXzfyListByStatus("1",pageNum,pageSize);
		this.setXzfyList1(this.list.getItems());
		//  取得所有待办理案件
		this.list = this.xzfyService.getXzfyListByStatus("5",pageNum,pageSize);
		this.setXzfyList2(this.list.getItems());
		//  取得所有待结案案件
		this.list = this.xzfyService.getXzfyListByStatus("9",pageNum,pageSize);
		this.setXzfyList3(this.list.getItems());
		
		return SUCCESS;
	}
	@Override
	public PaginationSupport getInitResult() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getTableName() {
		// TODO Auto-generated method stub
		return TABLE_NAME;
	}

	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}

	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public PaginationSupport getList() {
		return list;
	}

	public void setList(PaginationSupport list) {
		this.list = list;
	}

	public XzfyService getXzfyService() {
		return xzfyService;
	}

	public void setXzfyService(XzfyService xzfyService) {
		this.xzfyService = xzfyService;
	}

	public void setXzfyList(List<XzfyInfo> xzfyList) {
		this.xzfyList = xzfyList;
	}

	public List<XzfyInfo> getXzfyList() {
		return xzfyList;
	}

	public List<XzfyInfo> getXzfyList1() {
		return xzfyList1;
	}

	public void setXzfyList1(List<XzfyInfo> xzfyList1) {
		this.xzfyList1 = xzfyList1;
	}

	public List<XzfyInfo> getXzfyList2() {
		return xzfyList2;
	}

	public void setXzfyList2(List<XzfyInfo> xzfyList2) {
		this.xzfyList2 = xzfyList2;
	}

	public List<XzfyInfo> getXzfyList3() {
		return xzfyList3;
	}

	public void setXzfyList3(List<XzfyInfo> xzfyList3) {
		this.xzfyList3 = xzfyList3;
	}

}
