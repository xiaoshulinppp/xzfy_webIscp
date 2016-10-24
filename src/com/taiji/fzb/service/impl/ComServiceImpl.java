package com.taiji.fzb.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.Member;
import com.taiji.fzb.domain.XzfyCompany;
import com.taiji.fzb.domain.XzfyOtherSuggest;
import com.taiji.fzb.domain.XzfyQuestionnaire;
import com.taiji.fzb.service.ComService;
import com.taiji.user.domain.Org;

public class ComServiceImpl extends CoreServiceImpl implements ComService{


	@Override
	public PaginationSupport getMemList(int pageNumber, int pageSize,String name,String sexy,String position,String type,String phone,String recordDate,String age,String education,String locbm) {
		String HQL = "";
		HQL += " from Member m";
		HQL += " where 1 = 1 ";
		if(name!=null&&!name.equals("")){HQL+=" and m.memName = '"+name+"'";}
		if(sexy!=null&&!sexy.equals("")){HQL+=" and m.sexy = '"+sexy+"'";}
		if(position!=null&&!position.equals("")){HQL+=" and m.position = '"+position+"'";}
		if(phone!=null&&!phone.equals("")){HQL+=" and m.phone = '"+phone+"'";}
		if(type!=null&&!type.equals("")){HQL+=" and m.type = '"+type+"'";}
		if(recordDate!=null&&!recordDate.equals("")){HQL+=" and m.recordDate = '"+recordDate+"'";}
		if(age!=null&&!age.equals("")){HQL+=" and m.age = '"+age+"'";}
		if(education!=null&&!education.equals("")){HQL+=" and m.education = '"+education+"'";}
		HQL += " and m.locbm = '"+locbm+"' order by m.type ";
		return super.find(HQL, pageNumber, pageSize);
	}
	
	public PaginationSupport findAllCompanyList(int pageNumber, int pageSize,XzfyCompany xzfyCompany){
		String HQL = "";
		HQL += " from XzfyCompany xzfy";
		HQL += " where 1 = 1 ";
		
		if(xzfyCompany != null){
			if(xzfyCompany.getWorkName()!=null&&!xzfyCompany.getWorkName().equals("")){HQL+=" and xzfy.workName like '%"+xzfyCompany.getWorkName()+"%'";}
			if(xzfyCompany.getContact()!=null&&!xzfyCompany.getContact().equals("")){HQL+=" and xzfy.contact like '%"+xzfyCompany.getContact()+"%'";}
			if(xzfyCompany.getFax()!=null&&!xzfyCompany.getFax().equals("")){HQL+=" and xzfy.fax like '%"+xzfyCompany.getFax()+"%'";}
		}
		
		HQL += " order by xzfy.corpCode ";
		
		return super.find(HQL, pageNumber, pageSize);
		
	}

	public List getAllMemList(String name,String sexy,String position,String type,String phone,String recordDate,String age,String education,String locbm) {
		String HQL = "";
		HQL += " from Member m";
		HQL += " where 1 = 1";
		if(name!=null&&!name.equals("")){HQL+=" and m.memName = '"+name+"'";}
		if(sexy!=null&&!sexy.equals("")){HQL+=" and m.sexy = '"+sexy+"'";}
		if(position!=null&&!position.equals("")){HQL+=" and m.position = '"+position+"'";}
		if(phone!=null&&!phone.equals("")){HQL+=" and m.phone = '"+phone+"'";}
		if(type!=null&&!type.equals("")){HQL+=" and m.type = '"+type+"'";}
		if(recordDate!=null&&!recordDate.equals("")){HQL+=" and m.recordDate = '"+recordDate+"'";}
		if(age!=null&&!age.equals("")){HQL+=" and m.age = '"+age+"'";}
		if(education!=null&&!education.equals("")){HQL+=" and m.education = '"+education+"'";}
		HQL += " and m.locbm = '"+locbm+"' order by m.type ";
		return super.find(HQL);
	}
	
	@Override
	public void saveMem(Member mem) {
		super.saveOrUpdate(mem);
	}

	@Override
	public Member getMemById(String entityId) {
		String HQL = "";
		HQL += " from Member m";
		HQL += " where 1 = 1";
		HQL += " and m.memId = " + entityId;
		List<Member> dataList = super.find(HQL);
		Member com = new Member();
		if (dataList.isEmpty()) {
			com = new Member();
		} else {
			com = (Member)dataList.get(0);
		}
		return com;
	}
	
	@Override
	public void updateMem(Member mem) {
		super.saveOrUpdate(mem);
		
	}
	
	
	/*
	@Override
	public Term getTermById(String entityId) {
		String HQL = "";
		HQL += " from Term term";
		HQL += " where 1 = 1";
		HQL += " and term.termId = '" + entityId+"'";
		List<Term> dataList = super.find(HQL);
		Term term = new Term();
		if (dataList.isEmpty()) {
			term = new Term();
		} else {
			term = (Term)dataList.get(0);
		}
		return term;
	}
	*/

	
	
	@Override
	public void deleteMemById(String entityId) {
		String hql="delete from  Member m where m.memId="+entityId;
		super.deleteAll(hql);
	}

/*******************************************************当前用户所属单位*********************************************/
	public XzfyCompany getXzfyComById(String code,String name){
		XzfyCompany xzfyCom=null;
		String HQL="";
		HQL+=" from XzfyCompany xzfy";
	    HQL+=" where 1=1";
//	    HQL+=" and xzfy.corpCode='"+code+"'";
	    HQL+=" and xzfy.workName='"+name+"'";
	    List dataList=super.find(HQL);
	    if(dataList.isEmpty()){	    	
	    	xzfyCom=new XzfyCompany();
	    	
	    	/*****************2015修改补充******************/
	    	String updateFlag = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss").format(new Date());
	    	xzfyCom.setUpdateDateFlag(updateFlag);
	    	/********************结束*********************/
	    	
	    	xzfyCom.setCorpCode(code);
	    	xzfyCom.setWorkName(name); 
	    	super.saveOrUpdate(xzfyCom);
	    }
	    else{
	    	xzfyCom=(XzfyCompany)dataList.get(0);
	    }
	    return xzfyCom;
	}
	
	/**************************查看单位详细信息*****************************/
	public XzfyCompany findXzfyCompanyByIdAndLocbm(int id,String code){
		XzfyCompany xzfyCom = null;
		String HQL = "";
		HQL+=" from XzfyCompany xzfy";
	    HQL+=" where 1=1";
	    
	    HQL+=" and xzfy.id='"+id+"'";
	    HQL+=" and xzfy.corpCode='"+code+"'";
	    
	    List dataList=super.find(HQL);
	    
	    if(!dataList.isEmpty() && dataList.size() != 0){
	    	xzfyCom=(XzfyCompany)dataList.get(0);
	    }
	    
	    return xzfyCom;
	}
	
	public XzfyCompany getXzfyById(int id){
		String HQL = "";
		HQL += " from XzfyCompany x";
		HQL += " where 1 = 1";
		HQL += " and x.id = " + id;
		List dataList = super.find(HQL);
		XzfyCompany xzfy = new XzfyCompany();
		if (dataList.isEmpty()) {
			xzfy = new XzfyCompany();
		} else {
			xzfy = (XzfyCompany)dataList.get(0);
		}
		return xzfy;
	}
	
	public void updateXzfyCom(XzfyCompany xzfy){
		 super.saveOrUpdate(xzfy);
	}
	
	
/*******************************************************当前用户所属单位*********************************************/	
	
	
/*******************************************************在线调查*********************************************/	

	@Override//隔离
	public void saveXzfyQustn(XzfyQuestionnaire xzfy) {
		// TODO Auto-generated method stub
		super.saveOrUpdate(xzfy);
	}

	@Override//隔离
	public String getXmlString() {
		// TODO Auto-generated method stub
		double sum=0.0;
		String xAxisName="";
//		String xAxisName="调查问卷统计结果";
		String xmlStr="";
	    xmlStr="<chart caption='"+xAxisName+"' xAxisName='"
	  	+"' yAxisName='' showValues='1' decimals='0' formatNumberScale='0' " +
	  			"baseFontSize='14' outCnvBaseFontSize='14'>";

	    String[][] array={{"非常满意","1"},{"满意","2"},{"一般","3"},{"不满意","4"}};
	    
	    
	    
	    
	    /*for(int i=0;i<array.length;i++){
	    	String HQL=" select count(*) from XzfyQuestionnaire x";
		    HQL+=" where x.selectValue='"+array[i][1]+"'";
		    List list=super.find(HQL);
		    
		    if(!list.isEmpty()){
		    	sum+=((Long)(list.get(0))).doubleValue();
		    }	    	
	    }
	     
	    for(int i=0;i<array.length;i++){
	    	String HQL=" select round(count(*)/"+sum+"*100,2) from XzfyQuestionnaire x";
		    HQL+=" where x.selectValue='"+array[i][1]+"'";
		    List list=super.find(HQL);
		    
		    if(!list.isEmpty()){
//		    	System.out.println("被执行！");
		    	xmlStr+="<set label='"+array[i][0]+"' value='";
		    	xmlStr+=((Double)(list.get(0))).toString()+
//		    	"%"+
		    	"' />";
		    }	    	    	
	    }*/
	    
	    
	    
	    
	    for(int i=0;i<array.length;i++){
	    	String HQL=" select count(*) from XzfyQuestionnaire x";
		    HQL+=" where x.selectValue='"+array[i][1]+"'";
		    List list=super.find(HQL);
		    
		    if(!list.isEmpty()){
//		    	System.out.println("被执行！");
		    	xmlStr+="<set label='"+array[i][0]+"' value='";
		    	xmlStr+=((Long)(list.get(0))).toString()+"' />";
		    }	    	
	    }
	    
	    
	    xmlStr+="</chart>";
//    	System.out.println(xmlStr);        
	    return xmlStr;
	}

	@Override
	public void saveXzfySuggest(XzfyOtherSuggest xzfy) {
		// TODO Auto-generated method stub
		super.saveOrUpdate(xzfy);
	}

	@Override
	public PaginationSupport getOpinionList(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		String HQL = "";
		HQL += " from XzfyOtherSuggest x";
		HQL += " where 1 = 1 and x.parentId is null order by id desc";	
		return super.find(HQL, pageNumber, pageSize);

	}
	public List getReplyList(int id) {
		// TODO Auto-generated method stub
		String HQL = "";
		HQL += " from XzfyOtherSuggest x";
		HQL += " where 1 = 1 and x.parentId ="+id+"order by id asc";	
		return super.find(HQL);
	}
	public XzfyOtherSuggest getSuggestById(int id){
		String HQL = "";
		HQL += " from XzfyOtherSuggest x";
		HQL += " where 1 = 1 and x.id ="+id;	
		List list = super.find(HQL);
		XzfyOtherSuggest x;
		if(list.isEmpty()){
			x = new XzfyOtherSuggest();
		}else{
			x = (XzfyOtherSuggest) list.get(0);
		}
		return x;
	}
	@Override
	public List getAllOtherList() {
		// TODO Auto-generated method stub
		String HQL = "";
		HQL += " from XzfyOtherSuggest x";
		HQL += " where 1 = 1 ";	
		return super.find(HQL);
	}
	
/*******************************************************在线调查*********************************************/	
	
	
	/*
	@Override
	public List<Member> getMemListById(String id) {
		String HQL="";
		HQL+="from Committee comt where comt.term.currentTermNo = '"+id+"'";
		List comtList=super.find(HQL);
		return comtList;
	}
	*/

	/*
	@Override
	public Term getTermByTermNo(String num) {
		String HQL = "";
		HQL += " from Term term";
		HQL += " where 1 = 1";
		HQL += " and term.currentTermNo = '" + num+"'";
		List<Term> dataList = super.find(HQL);
		Term term = new Term();
		if (dataList.isEmpty()) {
			term = new Term();
		} else {
			term = (Term)dataList.get(0);
		}
		return term;
	}
	*/
    
}
