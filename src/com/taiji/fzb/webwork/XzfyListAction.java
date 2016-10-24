package com.taiji.fzb.webwork;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedListAction;
import com.taiji.fzb.domain.XzfyBuwei;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzfyService;
import com.taiji.user.domain.User;

@SuppressWarnings("serial")
public class XzfyListAction extends ProtectedListAction{

	private RecordService recordService = null;
	private static final String TABLE_NAME = "xzfy_info";
	
	public int pageSize = 15;

	public int pageNum = 1;

	public int totalPage = 1;

	public int totalCount = 0;
	
	public PaginationSupport list = new PaginationSupport();

	public XzfyInfo xzfyInfo;
	public XzfyBuwei xzfyBuwei;
	
	private XzfyService xzfyService = null;
	private List<XzfyBuwei> xzfyBuweiList= new ArrayList<XzfyBuwei>();;
	private List<XzfyInfo> xzfyList = new ArrayList<XzfyInfo>();
	
	private List<XzfyInfo> xzfyList1 = new ArrayList<XzfyInfo>();
	private List<XzfyInfo> xzfyList2 = new ArrayList<XzfyInfo>();
	private List<XzfyInfo> xzfyList3 = new ArrayList<XzfyInfo>();

	private List tiquList = new ArrayList();
	
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
	
	@SuppressWarnings("unchecked")
	public String getbuweiListByName() {
		User user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		String un=user.getName();
		this.list = this.xzfyService.getTiquBuweiListByName(pageNum, 50, xzfyBuwei,un);
		this.totalPage = this.list.getTotalPage();
		this.setXzfyBuweiList(this.list.getItems());
		if (xzfyBuwei==null) {
			xzfyBuwei = new XzfyBuwei();
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String getbuweiList() {
		this.list = this.xzfyService.getTiquBuweiList(pageNum, 50, xzfyBuwei);
		this.totalPage = this.list.getTotalPage();
		this.setXzfyBuweiList(this.list.getItems());
		if (xzfyBuwei==null) {
			xzfyBuwei = new XzfyBuwei();
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String buweiEnd() {
		this.list = this.xzfyService.getBuweiEndList(pageNum, 50, xzfyBuwei);
		this.totalPage = this.list.getTotalPage();
		this.setXzfyBuweiList(this.list.getItems());
		if (xzfyBuwei==null) {
			xzfyBuwei = new XzfyBuwei();
		}
		return SUCCESS;
	}

	
	
	@SuppressWarnings("unchecked")
	public String buzhengFace() throws Exception{
		User user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		this.list = this.xzfyService.getTiquXzfyList(pageNum,50,xzfyInfo,user);
		this.totalPage = this.list.getTotalPage();
		this.totalCount=list.getTotalCount();
		this.setTiquList(this.list.getItems());
		for (int i=0;i<tiquList.size();i++){
			XzfyInfo x = new XzfyInfo();
			Object[] o = (Object[]) tiquList.get(i);
			for(int j=0;j<10;j++){
				if (o[j] != null){
					if(j==0){
						x.setId((String) o[j]);
					}else if (j==1){
						x.setReceive_date((String) o[j]);
					}else if (j==2){
						x.setApp_show((String) o[j]);
					}else if (j==3){
						x.setAdmit1((String) o[j]);
					}else if (j==4){
						x.setDefendant_name((String) o[j]);
					}else if (j==5){
						x.setDefendant_type((String) o[j]);
					}else if (j==6){
						x.setReceive_type((String) o[j]);
					}else if (j==7){
						x.setJddetail((String) o[j]);
					}else if (j==8){
						x.setAdmit2((String) o[j]);
					}else if (j==9){
						x.setXzfy_requset_retail((String) o[j]);
					}
				}
			}
			xzfyList.add(x);
		}
		if (xzfyInfo==null) {
			xzfyInfo = new XzfyInfo();
		}
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

	public List getTiquList() {
		return tiquList;
	}

	public void setTiquList(List tiquList) {
		this.tiquList = tiquList;
	}

	public XzfyBuwei getXzfyBuwei() {
		return xzfyBuwei;
	}

	public void setXzfyBuwei(XzfyBuwei xzfyBuwei) {
		this.xzfyBuwei = xzfyBuwei;
	}

	public List<XzfyBuwei> getXzfyBuweiList() {
		return xzfyBuweiList;
	}

	public void setXzfyBuweiList(List<XzfyBuwei> xzfyBuweiList) {
		this.xzfyBuweiList = xzfyBuweiList;
	}

}