package com.taiji.fzb.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork.ActionContext;
import com.taiji.archive.domain.Archive;
import com.taiji.common.ContextUtil;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyCompany;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzssFile;
import com.taiji.fzb.domain.XzssInfo;
import com.taiji.fzb.domain.XzssLog;
import com.taiji.fzb.service.XzssService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.util.UserUtil;


@SuppressWarnings("unchecked")
public class XzssServiceImpl extends CoreServiceImpl implements XzssService {
	private String year = new SimpleDateFormat("yyyy").format(new Date());
	private String theYearBefore = String.valueOf(new Integer(year).intValue() - 1) ;


	/*
	 * 获取模板列表
	 * 
	 * @param pageNumber 页码
	 * 
	 * @param pageSize 每页显示条数
	 * 
	 * @return 分页的列表
	 */
	@Override
	public PaginationSupport getXzssList(int pageNumber, int pageSize) {
		User user = null;
	    user = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
	    String locbm = getOrg().getLocbm();
	    //System.out.println(locbm);
		String HQL = "";
		HQL += " from  XzssInfo xzssInfo";
		HQL += " where 1 = 1";
		HQL += " and xzssInfo.case_org = '"+locbm+"'";
		HQL += " order by xzssInfo.receive_date desc, xzssInfo.id desc";
		
		return super.find(HQL, pageNumber, pageSize);
	}
	
	@Override
	public PaginationSupport getUndertakerList(int pageNumber, int pageSize,String tempundertaker) {
		String HQL = "";
		HQL += " from  XzssInfo xzssInfo";
		HQL += " where 1 = 1";
		HQL += " and xzssInfo.undertaker_id = '"+tempundertaker+"' and xzssInfo.status = 4";
		HQL += " order by xzssInfo.receive_date desc, xzssInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}
	
	//showJieanlist
	@Override
	public PaginationSupport getJieanList(int pageNumber, int pageSize,String tempuser ,String tempstatus) {
		String HQL = "";
		HQL += " from  XzssInfo xzssInfo";
		HQL += " where 1 = 1";
		HQL+="and xzssInfo.undertaker_id = '"+tempuser+"'";
		HQL+="and xzssInfo.status = '"+tempstatus+"'";
		//System.out.println(tempuser);
		
		
		return super.find(HQL, pageNumber, pageSize);
	}
	
	@Override
	public PaginationSupport getSearchList(int pageNumber, int pageSize,XzssInfo xzssInfo,String receiveCaseDate1,String receiveCaseDate2,String jieanDate1,String jieanDate2,String tiaojie ) {
		User user = null;
	    user = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
	    String locbm = getOrg().getLocbm();
		String HQL = "";
		HQL += " from  XzssInfo xzssInfo";
		HQL += " where 1 = 1";
		HQL += " and xzssInfo.case_org = '"+locbm+"'";
		if(xzssInfo!=null){
		    if ((xzssInfo.getShen_level() != null) && (!(xzssInfo.getShen_level().equals("")))) HQL = HQL + " and  xzssInfo.shen_level like '%" + xzssInfo.getShen_level() + "%'";
		    if ((xzssInfo.getCase_num() != null) && (!(xzssInfo.getCase_num().equals("")))) HQL = HQL + " and  xzssInfo.case_num like '%" + xzssInfo.getCase_num() + "%'";
		    if ((xzssInfo.getNotice_receiptDate() != null) && (!(xzssInfo.getNotice_receiptDate().equals("")))) HQL = HQL + " and  xzssInfo.notice_receiptDate= '" + xzssInfo.getNotice_receiptDate() + "'";
		    if ((xzssInfo.getApp_type() != null) && (!(xzssInfo.getApp_type().equals("")))) HQL = HQL + " and  xzssInfo.app_type=" + xzssInfo.getApp_type();
		    if ((xzssInfo.getApp_name() != null) && (!(xzssInfo.getApp_name().equals("")))) HQL = HQL + " and  xzssInfo.app_name like '%" + xzssInfo.getApp_name() + "%'";
		    if ((xzssInfo.getDefendant() != null) && (!(xzssInfo.getDefendant().equals("")))) HQL = HQL + " and  xzssInfo.defendant like '%" + xzssInfo.getDefendant() + "%'";
		    if ((xzssInfo.getYsundertaker_name() != null) && (!(xzssInfo.getYsundertaker_name().equals("")))) HQL = HQL + " and  xzssInfo.ysundertaker_name like '%" + xzssInfo.getYsundertaker_name() + "%'";
		    if ((xzssInfo.getManage_type() != null) && (!(xzssInfo.getManage_type().equals("")))) HQL = HQL + " and  xzssInfo.manage_type=" + xzssInfo.getManage_type() ;
		    if ((xzssInfo.getCase_type() != null) && (!(xzssInfo.getCase_type().equals("")))) HQL = HQL + " and  xzssInfo.case_type=" + xzssInfo.getCase_type();
		    if ((xzssInfo.getCourt() != null) && (!(xzssInfo.getCourt().equals("")))) HQL = HQL + " and  xzssInfo.court=" + xzssInfo.getCourt();
		    if ((xzssInfo.getIsmoney() != null) && (!(xzssInfo.getIsmoney().equals("")))) HQL = HQL + " and  xzssInfo.ismoney like '%" + xzssInfo.getIsmoney()+"%'";
		    if ((xzssInfo.getCase_cause() != null) && (!(xzssInfo.getCase_cause().equals("")))) HQL = HQL + " and  xzssInfo.case_cause like '%" + xzssInfo.getCase_cause()+ "%'";
		    if ((xzssInfo.getDabian_endDate() != null) && (!(xzssInfo.getDabian_endDate().equals("")))) HQL = HQL + " and  xzssInfo.dabian_endDate= '" + xzssInfo.getDabian_endDate()+ "'";
		    if ((receiveCaseDate2 != null) && (!(receiveCaseDate2.equals("")))) HQL = HQL + " and xzssInfo.notice_receiptDate<='" + receiveCaseDate2 + "'";
		    if ((receiveCaseDate1 != null) && (!(receiveCaseDate1.equals("")))) HQL = HQL + " and xzssInfo.notice_receiptDate>='" + receiveCaseDate1 + "'";
		    if ((jieanDate1 != null) && (!(jieanDate1.equals("")))) HQL = HQL + " and xzssInfo.jieandate<='" + jieanDate2 + "'";
		    if ((jieanDate2 != null) && (!(jieanDate2.equals("")))) HQL = HQL + " and xzssInfo.jieandate>='" + jieanDate1 + "'";
		    if ((xzssInfo.getJieandate() != null) && (!(xzssInfo.getJieandate().equals("")))) HQL = HQL + " and  xzssInfo.jieandate= '" + xzssInfo.getJieandate() + "'";
		    if ((xzssInfo.getIssifajianyi() != null) && (!(xzssInfo.getIssifajianyi().equals("")))) HQL = HQL + " and  xzssInfo.issifajianyi='"+ xzssInfo.getIssifajianyi()+ "'";
		    if ((xzssInfo.getBeigao() != null) && (!(xzssInfo.getBeigao().equals("")))) HQL = HQL + " and  xzssInfo.beigao=" + xzssInfo.getBeigao() ;
		    if ((xzssInfo.getJieanType() != null) && (!(xzssInfo.getJieanType().equals("")))) {
		    	//HQL = HQL + " and  xzssInfo.jieanType=" + xzssInfo.getJieanType() ;
		    	if (xzssInfo.getJieanType().equals("1")) {
		    		HQL = HQL + " and  xzssInfo.panjue=" + xzssInfo.getPanjue();
				}
		    	else if (xzssInfo.getJieanType().equals("2")) {
		    		HQL = HQL + " and  xzssInfo.daiding=" + xzssInfo.getCaiding();
				}
		    	else if (xzssInfo.getJieanType().equals("3")) {
		    		HQL = HQL + " and  tiaojie=" + xzssInfo.getTiaojie();
				}
		    	else {
		    		HQL=HQL+"";
				}
		    	}
		}
		HQL += " order by xzssInfo.receive_date desc, xzssInfo.id desc";
		//System.out.println("111"+HQL);
		return super.find(HQL, pageNumber, pageSize);
		
	}
	
	
	
	
	/*
	 * 通过ID获取模板对象
	 * 
	 * @param entityId 模板对象ID
	 * 
	 * @return 模板对象
	 */
	@Override
	public XzssInfo getXzssById(String entityId) {
		String HQL = "";
		HQL += " from XzssInfo xzssInfo";
		HQL += " where 1 = 1";
		HQL += " and xzssInfo.id = '" + entityId+"'";
		List<XzssInfo> dataList = super.find(HQL);
		XzssInfo xzssInfo = new XzssInfo();
		if (dataList.isEmpty()) {
			xzssInfo = new XzssInfo();
		} else {
			xzssInfo = dataList.get(0);
		}
		return xzssInfo;
	}
	
	public void deleteXzssById(String entityId){
		//double d = Double.parseDouble(entityId);
		String hql="delete from  XzssInfo xzssInfo where xzssInfo.id='"+entityId+"'";
		super.deleteAll(hql);
	}
	

	@Override
	public void saveXzssInfo(XzssInfo xzssInfo) {
		super.save(xzssInfo);
	}

	public Org getOrg()
	  {
	    User user = 
	      (User)ActionContext.getContext().getSession().get
	      ("_USER_LOGIN_");

	    String hql = "from Org org where org.id=" + user.getOrg().getId();
	    Org org = (Org)super.find(hql).get(0);
	    return org;
	  }
	
	@Override
	public PaginationSupport getXzfyList(int pageNumber, int pageSize,String applicant, String undertaker, String undertakerSecond,String caseNo, String representative, String caseNumBFY,String caseNameBFY, String respondent) {
		// TODO Auto-generated method stub
		User user = null;
	    user = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
	    String locbm = getOrg().getLocbm();
	    String HQL = "";
	    
	    HQL = HQL + " from XzfyInfo xzfy";
		   
	    HQL = HQL + " where 1=1";
	    HQL = HQL + " and xzfy.caseorg='" + locbm + "'";
	    
	    if ((applicant != null) && (!(applicant.equals("")))) HQL = HQL + " and  xzfy.appdetail like '%" + applicant + "%'";
	    if ((respondent != null) && (!(respondent.equals("")))) HQL = HQL + " and xzfy.defendant_name like '%" + respondent + "%'";
	    if ((undertaker != null) && (!(undertaker.equals("")))) HQL = HQL + " and xzfy.user2_name like '%" + undertaker + "'";
	    if ((undertakerSecond != null) && (!(undertakerSecond.equals("")))) HQL = HQL + " and xzfy.user3_name like '%" + undertakerSecond + "'";
	    if ((caseNo != null) && (!(caseNo.equals("")))) HQL = HQL + " and xzfy.tjzfzh like '%" + caseNo + "%'";
	    if ((representative != null) && (!(representative.equals("")))) HQL = HQL + " and xzfy.deputy_show like '%" + representative + "'";
	    if ((caseNumBFY != null) && (!(caseNumBFY.equals("")))) HQL = HQL + " and xzfy.xwnum like '%" + caseNumBFY + "%'";
	    if ((caseNameBFY != null) && (!(caseNameBFY.equals("")))) HQL = HQL + " and xzfy.xwname like '%" + caseNameBFY + "%'";
	    HQL = HQL + " order by xzfy.receive_date desc, xzfy.id desc";
	    //System.out.println("hql="+HQL);
	    //System.out.println("pageNumber="+pageNumber);
	    return super.find(HQL, pageNumber, pageSize);
	}
	public PaginationSupport getXzfyPageList(int pageNumber, int pageSize,User user) {
	   user = 
			 (User)ActionContext.getContext().getSession().get
			 ("_USER_LOGIN_");
		String hql = "from Org org where org.id=" + user.getOrg().getId();
	    Org org = (Org)super.find(hql).get(0);
		String locbm = org.getLocbm();
		String HQL = "";
		HQL += " from  XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.caseorg = '"+locbm+"'";
		//HQL += " order by xzssInfo.receive_date desc, xzssInfo.id desc";
		return super.find(HQL, pageNumber, pageSize);
	}

	@Override
	public XzfyInfo getXzfyById(String xzfyId) {
		// TODO Auto-generated method stub
		//System.out.println("xzfyid="+xzfyId);
		String HQL = "";
		HQL += " from XzfyInfo xzfyInfo";
		HQL += " where 1 = 1";
		HQL += " and xzfyInfo.id = '" +xzfyId+"'";
		List<XzfyInfo> dataList = super.find(HQL);
		XzfyInfo xzfyInfo = new XzfyInfo();
		if (dataList.isEmpty()) {
			xzfyInfo = new XzfyInfo();
		} else {
			xzfyInfo = dataList.get(0);
		}
		return xzfyInfo;
	}
    //查询某个单位的行政复议案件
	@Override
	public PaginationSupport getXzfyOrgList(int pageNumber, int pageSize,XzfyInfo xzfyInfo) {
		// TODO Auto-generated method stub
		User user = null;
	    user = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
	    String locbm = getOrg().getLocbm();
	    String HQL = "";
	    
	    HQL = HQL + " from XzfyInfo xzfy";
		   
	    HQL = HQL + " where 1=1";
	    HQL = HQL + " and xzfy.caseorg='" + locbm + "'";
	    if(xzfyInfo!=null){
	    if ((xzfyInfo.getTjzfzh() != null) && (!(xzfyInfo.getTjzfzh().equals("")))) HQL = HQL + " and  xzfy.tjzfzh like '%" + xzfyInfo.getTjzfzh() + "%'";
	    if ((xzfyInfo.getReceive_date() != null) && (!(xzfyInfo.getReceive_date().equals("")))) HQL = HQL + " and  xzfy.receive_date like '%" + xzfyInfo.getReceive_date() + "%'";
	    if ((xzfyInfo.getDefendant_name() != null) && (!(xzfyInfo.getDefendant_name().equals("")))) HQL = HQL + " and  xzfy.defendant_name like '%" + xzfyInfo.getDefendant_name() + "%'";
	    if ((xzfyInfo.getApp_show()!= null) && (!(xzfyInfo.getApp_show().equals("")))) HQL = HQL + " and  xzfy.app_show like '%" + xzfyInfo.getApp_show() + "%'";
	    if ((xzfyInfo.getXwname()!= null) && (!(xzfyInfo.getXwname().equals("")))) HQL = HQL + " and  xzfy.xwname like '%" + xzfyInfo.getXwname() + "%'";
	    if ((xzfyInfo.getXwnum()!= null) && (!(xzfyInfo.getXwnum().equals("")))) HQL = HQL + " and  xzfy.xwnum like '%" + xzfyInfo.getXwnum() + "%'";
	    
	    /**********************若无搜索条件，则仅提取近两年收案案件********************/
	    if(    (xzfyInfo.getTjzfzh() == null || xzfyInfo.getTjzfzh().equals("")) && (xzfyInfo.getReceive_date() == null || xzfyInfo.getReceive_date().equals(""))&& (xzfyInfo.getDefendant_name() == null || xzfyInfo.getDefendant_name().equals(""))&& (xzfyInfo.getApp_show() == null || xzfyInfo.getApp_show().equals(""))&& (xzfyInfo.getXwname() == null || xzfyInfo.getXwname().equals(""))&& (xzfyInfo.getXwnum() == null || xzfyInfo.getXwnum().equals(""))   ){ HQL += " and xzfy.receive_date like '"+year+"%'";         }
	    /************************************结束***************************/
	    
	    }
	    HQL = HQL + " order by xzfy.receive_date desc, xzfy.id desc";
//	    System.out.println(locbm);
	    //System.out.println("pageNumber="+pageNumber);
	    return super.find(HQL, pageNumber, pageSize);
	}

	//查询全市所有复议案件
	@Override
	public PaginationSupport getXzfyDefendantList(int pageNumber, int pageSize ,XzfyInfo xzfyInfo) {
		String orgName = getOrg().getName();
	    String HQL = "";
	    HQL = HQL + "from XzfyInfo xzfy";
	    HQL = HQL + " where 1=1";
	    HQL = HQL + " and xzfy.defendant_name='" + orgName + "'";
	    if(xzfyInfo!=null){
		    if ((xzfyInfo.getTjzfzh() != null) && (!(xzfyInfo.getTjzfzh().equals("")))) HQL = HQL + " and  xzfy.tjzfzh like '%" + xzfyInfo.getTjzfzh() + "%'";
		    if ((xzfyInfo.getReceive_date() != null) && (!(xzfyInfo.getReceive_date().equals("")))) HQL = HQL + " and  xzfy.receive_date like '%" + xzfyInfo.getReceive_date() + "%'";
		    if ((xzfyInfo.getDefendant_name() != null) && (!(xzfyInfo.getDefendant_name().equals("")))) HQL = HQL + " and  xzfy.defendant_name like '%" + xzfyInfo.getDefendant_name() + "%'";
		    if ((xzfyInfo.getApp_show()!= null) && (!(xzfyInfo.getApp_show().equals("")))) HQL = HQL + " and  xzfy.app_show like '%" + xzfyInfo.getApp_show() + "%'";
		    if ((xzfyInfo.getXwname()!= null) && (!(xzfyInfo.getXwname().equals("")))) HQL = HQL + " and  xzfy.xwname like '%" + xzfyInfo.getXwname() + "%'";
		    if ((xzfyInfo.getXwnum()!= null) && (!(xzfyInfo.getXwnum().equals("")))) HQL = HQL + " and  xzfy.xwnum like '%" + xzfyInfo.getXwnum() + "%'";
//		    if (fuyijiguan!=null&&!(fuyijiguan.equals(""))) HQL=HQL+" and org.name like '%"+fuyijiguan+"%' and org.locbm=xzfy.caseorg";
	   
		    /**********************若无搜索条件，则仅提取近两年收案案件********************/
		    if(    (xzfyInfo.getTjzfzh() == null || xzfyInfo.getTjzfzh().equals("")) && (xzfyInfo.getReceive_date() == null || xzfyInfo.getReceive_date().equals(""))&& (xzfyInfo.getDefendant_name() == null || xzfyInfo.getDefendant_name().equals(""))&& (xzfyInfo.getApp_show() == null || xzfyInfo.getApp_show().equals(""))&& (xzfyInfo.getXwname() == null || xzfyInfo.getXwname().equals(""))&& (xzfyInfo.getXwnum() == null || xzfyInfo.getXwnum().equals(""))   ){ HQL += " and xzfy.receive_date like '"+year+"%'";         }
		    /************************************结束***************************/
	    
	    }
	    //if ((xzfyInfo.getCaseorg() != null) && (!(xzfyInfo.getCaseorg().equals("")))) HQL = HQL + " and xzfy.caseorg="+xzfyInfo.getCaseorg();
	    HQL = HQL + " order by xzfy.receive_date desc, xzfy.id desc";
	    System.out.println("hql="+HQL);
	    //System.out.println("pageNumber="+pageNumber);
//	    xzfyOrgName=org.getName();
	    return super.find(HQL, pageNumber, pageSize);
	}
	public List getOrgFy()
	  {
	    String hql = "from Org org where org.org_fy='1'" ;
	    List<Org> orgList = super.find(hql);
	    return orgList;
	  }
	@Override
	public PaginationSupport getXzssShen1List(int pageNumber, int pageSize,
			XzssInfo xzssInfo) {
		// TODO Auto-generated method stub
		User user = null;
	    user = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
	    String locbm = getOrg().getLocbm();
	    String HQL = "";
	    HQL = HQL + " from XzssInfo xzss";
		   
	    HQL = HQL + " where 1=1";
	    HQL = HQL + " and xzss.case_org='" + locbm + "'";
	    HQL = HQL + " and xzss.shen_level='1'";
	    if(xzssInfo!=null){
		    if ((xzssInfo.getCase_num() != null) && (!(xzssInfo.getCase_num().equals("")))) HQL = HQL + " and  xzss.case_num like '%" + xzssInfo.getCase_num() + "%'";
		    if ((xzssInfo.getApp_name() != null) && (!(xzssInfo.getApp_name().equals("")))) HQL = HQL + " and  xzss.app_name like '%" + xzssInfo.getApp_name() + "%'";
		    if ((xzssInfo.getDefendant() != null) && (!(xzssInfo.getDefendant().equals("")))) HQL = HQL + " and  xzss.defendant like '%" + xzssInfo.getDefendant() + "%'";
		    if ((xzssInfo.getAction_name() != null) && (!(xzssInfo.getAction_name().equals("")))) HQL = HQL + " and  xzss.action_name like '%" + xzssInfo.getAction_name() + "%'";
		    if ((xzssInfo.getAction_id() != null) && (!(xzssInfo.getAction_id().equals("")))) HQL = HQL + " and  xzss.action_id like '%" + xzssInfo.getAction_id() + "%'";
	    }
		    HQL = HQL + " order by xzss.receive_date desc, xzss.id desc";
//		    System.out.println("hql="+HQL);
		    //System.out.println("pageNumber="+pageNumber);
		    return super.find(HQL, pageNumber, pageSize);
	}

	@Override
	public PaginationSupport getXzssShen2List(int pageNumber, int pageSize,
			XzssInfo xzssInfo) {
		// TODO Auto-generated method stub
		User user = null;
	    user = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
	    String locbm = getOrg().getLocbm();
	    String HQL = "";
	    HQL = HQL + " from XzssInfo xzss";
		   
	    HQL = HQL + " where 1=1";
	    HQL = HQL + " and xzss.case_org='" + locbm + "'";
	    HQL = HQL + " and xzss.shen_level='2'";
	    if(xzssInfo!=null){
		    if ((xzssInfo.getCase_num() != null) && (!(xzssInfo.getCase_num().equals("")))) HQL = HQL + " and  xzss.case_num like '%" + xzssInfo.getCase_num() + "%'";
		    if ((xzssInfo.getApp_name() != null) && (!(xzssInfo.getApp_name().equals("")))) HQL = HQL + " and  xzss.app_name like '%" + xzssInfo.getApp_name() + "%'";
		    if ((xzssInfo.getDefendant() != null) && (!(xzssInfo.getDefendant().equals("")))) HQL = HQL + " and  xzss.defendant like '%" + xzssInfo.getDefendant() + "%'";
		    if ((xzssInfo.getAction_name() != null) && (!(xzssInfo.getAction_name().equals("")))) HQL = HQL + " and  xzss.action_name like '%" + xzssInfo.getAction_name() + "%'";
		    if ((xzssInfo.getAction_id() != null) && (!(xzssInfo.getAction_id().equals("")))) HQL = HQL + " and  xzss.action_id like '%" + xzssInfo.getAction_id() + "%'";
	    }
		    HQL = HQL + " order by xzss.receive_date desc, xzss.id desc";
		    //System.out.println("hql="+HQL);
		    //System.out.println("pageNumber="+pageNumber);
		    return super.find(HQL, pageNumber, pageSize);
	}
	//查询案件号的序列号
	public List<String> getCaseNumIndex(){
		User user = null;
	    user = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
	    String locbm = getOrg().getLocbm();
	    String year=new SimpleDateFormat("yyyy") .format(new Date() );
		String hql = "select to_char(max(to_number(case_numNum))) as case_numNum from XzssInfo xzss where  xzss.case_org='"+locbm+"'" ;
	   // System.out.println("locbm="+locbm);
		hql+=" and xzss.case_numYear='"+year+"'";
		List indexList = super.find(hql);
	    return indexList;
	}

	@Override
	public List getXzfyApp(String xzfyId) {
		// TODO Auto-generated method stub
		String hql = "from XzfyApp app where app.xzfyInfo='"+xzfyId+"'" ;
	    List<XzfyApp> appList = super.find(hql);
	    return appList;
	}

	@Override
	public XzssFile getXzssFileById(String id) {
		// TODO Auto-generated method stub
		String HQL="";
		HQL="from XzssFile xzssFile where xzssFile.id='"+id+"'";
		List<XzssFile> dataList = super.find(HQL);
		XzssFile xzssFile = new XzssFile();
		if(!dataList.isEmpty())
			xzssFile = dataList.get(0);
		return xzssFile;
	}

	@Override
	public List<XzssFile> getXzssFileByXzssId(String xzssId) {
		// TODO Auto-generated method stub
		String HQL="from XzssFile xzssFile where xzssFile.xzssId='"+xzssId+"'";
		return super.find(HQL);
	}

	@Override
	public void deleteXzssFile(String id) {
		// TODO Auto-generated method stub
		String HQL="delete from XzssFile xzssFile where xzssFile.id='"+id+"'";
		super.deleteAll(HQL);
	}

	@Override
	public void save_log( String xzssId,String objName, String oldString,String newString) {
		// TODO Auto-generated method stub
		String caozuo="将"+objName+"由'"+oldString+"'改为'"+newString+"'";
		String user = UserUtil.getUserName();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String logTime = df.format(new Date());
		XzssLog xzssLog=new XzssLog();
		xzssLog.setLog_time(logTime);
		xzssLog.setLog_info(caozuo);
		xzssLog.setUpdate_name(user);
		xzssLog.setXzssId(xzssId);
		super.save(xzssLog);
	}

	@Override
	public List getLogList(String xzssId) {
		// TODO Auto-generated method stub
		String Hql="from XzssLog log where log.xzssId='"+xzssId+"' order by log.id desc";
		List logList=super.find(Hql);
		return logList;
	}

	@Override
	public PaginationSupport getSearchQuanShiList(int pageNumber, int pageSize,
			XzssInfo xzssInfo,String receiveCaseDate1,String receiveCaseDate2,String jieanDate1,String jieanDate2,String tiaojie) {
		// TODO Auto-generated method stub
		String HQL = "";
		HQL += " from  XzssInfo xzssInfo";
		HQL += " where 1 = 1";
		if(xzssInfo!=null){
		    if ((xzssInfo.getShen_level() != null) && (!(xzssInfo.getShen_level().equals("")))) HQL = HQL + " and  xzssInfo.shen_level like '%" + xzssInfo.getShen_level() + "%'";
		    if ((xzssInfo.getCase_num() != null) && (!(xzssInfo.getCase_num().equals("")))) HQL = HQL + " and  xzssInfo.case_num like '%" + xzssInfo.getCase_num() + "%'";
		    if ((xzssInfo.getNotice_receiptDate() != null) && (!(xzssInfo.getNotice_receiptDate().equals("")))) HQL = HQL + " and  xzssInfo.notice_receiptDate = '" + xzssInfo.getNotice_receiptDate()+ "'";
		    if ((xzssInfo.getApp_type() != null) && (!(xzssInfo.getApp_type().equals("")))) HQL = HQL + " and  xzssInfo.app_type=" + xzssInfo.getApp_type();
		    if ((xzssInfo.getApp_name() != null) && (!(xzssInfo.getApp_name().equals("")))) HQL = HQL + " and  xzssInfo.app_name like '%" + xzssInfo.getApp_name() + "%'";
		    if ((xzssInfo.getDefendant() != null) && (!(xzssInfo.getDefendant().equals("")))) HQL = HQL + " and  xzssInfo.defendant like '%" + xzssInfo.getDefendant() + "%'";
		    if ((xzssInfo.getYsundertaker_name() != null) && (!(xzssInfo.getYsundertaker_name().equals("")))) HQL = HQL + " and  xzssInfo.ysundertaker_name like '%" + xzssInfo.getYsundertaker_name() + "%'";
		    if ((xzssInfo.getManage_type() != null) && (!(xzssInfo.getManage_type().equals("")))) HQL = HQL + " and  xzssInfo.manage_type=" + xzssInfo.getManage_type() ;
		    if ((xzssInfo.getCase_type() != null) && (!(xzssInfo.getCase_type().equals("")))) HQL = HQL + " and  xzssInfo.case_type=" + xzssInfo.getCase_type();
		    if ((xzssInfo.getCourt() != null) && (!(xzssInfo.getCourt().equals("")))) HQL = HQL + " and  xzssInfo.court=" + xzssInfo.getCourt();
		    if ((xzssInfo.getIsmoney() != null) && (!(xzssInfo.getIsmoney().equals("")))) HQL = HQL + " and  xzssInfo.ismoney like '%" + xzssInfo.getIsmoney()+ "%'";
		    if ((xzssInfo.getCase_cause() != null) && (!(xzssInfo.getCase_cause().equals("")))) HQL = HQL + " and  xzssInfo.case_cause like '%" + xzssInfo.getCase_cause()+ "%'";
		    if ((xzssInfo.getDabian_endDate() != null) && (!(xzssInfo.getDabian_endDate().equals("")))) HQL = HQL + " and  xzssInfo.dabian_endDate= '" + xzssInfo.getDabian_endDate()+ "'";
		    if ((receiveCaseDate2 != null) && (!(receiveCaseDate2.equals("")))) HQL = HQL + " and xzssInfo.notice_receiptDate<='" + receiveCaseDate2 + "'";
		    if ((receiveCaseDate1 != null) && (!(receiveCaseDate1.equals("")))) HQL = HQL + " and xzssInfo.notice_receiptDate>='" + receiveCaseDate1 + "'";
		    if ((jieanDate1 != null) && (!(jieanDate1.equals("")))) HQL = HQL + " and xzssInfo.jieandate<='" + jieanDate2 + "'";
		    if ((jieanDate2 != null) && (!(jieanDate2.equals("")))) HQL = HQL + " and xzssInfo.jieandate>='" + jieanDate1 + "'";
		    if ((xzssInfo.getJieandate() != null) && (!(xzssInfo.getJieandate().equals("")))) HQL = HQL + " and  xzssInfo.jieandate= '" + xzssInfo.getJieandate() + "'";
		    if ((xzssInfo.getIssifajianyi() != null) && (!(xzssInfo.getIssifajianyi().equals("")))) HQL = HQL + " and  xzssInfo.issifajianyi='"+ xzssInfo.getIssifajianyi()+ "'";
		    if ((xzssInfo.getBeigao() != null) && (!(xzssInfo.getBeigao().equals("")))) HQL = HQL + " and  xzssInfo.beigao=" + xzssInfo.getBeigao() ;
		    if ((xzssInfo.getJieanType() != null) && (!(xzssInfo.getJieanType().equals("")))) {
		    	//HQL = HQL + " and  xzssInfo.jieanType=" + xzssInfo.getJieanType() ;
		    	if (xzssInfo.getJieanType().equals("1")) {
		    		HQL = HQL + " and  xzssInfo.panjue=" + xzssInfo.getPanjue();
				}
		    	else if (xzssInfo.getJieanType().equals("2")) {
		    		HQL = HQL + " and  xzssInfo.daiding=" + xzssInfo.getCaiding();
				}
		    	else if (xzssInfo.getJieanType().equals("3")) {
		    		HQL = HQL + " and  tiaojie=" + xzssInfo.getTiaojie();
				}
		    	else {
		    		HQL=HQL+"";
				}
		    	}
		}
		HQL += " order by xzssInfo.receive_date desc, xzssInfo.id desc";
		//System.out.println("111"+HQL);
		return super.find(HQL, pageNumber, pageSize);
		
	}

	@Override
	public String getYingSuNum() {
		// TODO Auto-generated method stub
		String locbm = getOrg().getLocbm();
		String HQL = "";
		HQL += " from XzfyCompany company";
		HQL += " where 1 = 1";
		HQL+=" and company.corpCode='"+locbm+"'";
		List<XzfyCompany> xzfyCompany=super.find(HQL);
		String yingSunum="";
		if (!xzfyCompany.isEmpty()) {
			if (xzfyCompany.get(0).getYingSuNum()!=null) {
				yingSunum=xzfyCompany.get(0).getYingSuNum().toString();
			}
		}
		return yingSunum;
	}

	@Override
	public XzssInfo getXzssInfoByCaseNum(String caseName) {
		// TODO Auto-generated method stub
		String HQL="";
		HQL +=" from XzssInfo xzssInfo ";
		HQL += " where 1 = 1";
		HQL+=" and xzssInfo.case_num='"+caseName+"'";
		List<XzssInfo> xzssList = super.find(HQL);
		if (xzssList.size()!=0) {
			return xzssList.get(0);
		} else {
			return null;
		}
	}

	@Override
	public List<String> getZbh() {
		// TODO Auto-generated method stub
	    String locbm = getOrg().getLocbm();
		String hql = "select to_char(max(to_number(zhuanbaohao))) as zhuanbaohao from XzssInfo xzss where  xzss.case_org='"+locbm+"'" ;
	    //System.out.println(hql);
		List indexList = super.find(hql);
	    return indexList;
	}

}
