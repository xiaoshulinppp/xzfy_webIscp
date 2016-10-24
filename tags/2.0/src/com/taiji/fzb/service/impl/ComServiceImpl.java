package com.taiji.fzb.service.impl;

import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.Member;
import com.taiji.fzb.service.ComService;

public class ComServiceImpl extends CoreServiceImpl implements ComService{


	@Override
	public PaginationSupport getMemList(int pageNumber, int pageSize,String name,String sexy,String corp,String phone,String cert,String born,String age,String education,String techType,String email) {
		String HQL = "";
		HQL += " from Member m";
		HQL += " where 1 = 1 ";
		if(name!=null&&!name.equals("")){HQL+=" and m.memName = '"+name+"'";}
		if(sexy!=null&&!sexy.equals("")){HQL+=" and m.sexy = '"+sexy+"'";}
		if(corp!=null&&!corp.equals("")){HQL+=" and m.workName = '"+corp+"'";}
		if(phone!=null&&!phone.equals("")){HQL+=" and m.phone = '"+phone+"'";}
		if(cert!=null&&!cert.equals("")){HQL+=" and m.certId = '"+cert+"'";}
		if(born!=null&&!born.equals("")){HQL+=" and m.born = '"+born+"'";}
		if(age!=null&&!age.equals("")){HQL+=" and m.age = '"+age+"'";}
		if(education!=null&&!education.equals("")){HQL+=" and m.education = '"+education+"'";}
		if(techType!=null&&!techType.equals("")){HQL+=" and m.techType = '"+techType+"'";}
		if(email!=null&&!email.equals("")){HQL+=" and m.email = '"+email+"'";}
		return super.find(HQL, pageNumber, pageSize);
	}

	public List getAllMemList(String name,String sexy,String corp,String phone,String cert,String born,String age,String education,String techType,String email) {
		String HQL = "";
		HQL += " from Member m";
		HQL += " where 1 = 1";
		if(name!=null&&!name.equals("")){HQL+=" and m.memName = '"+name+"'";}
		if(sexy!=null&&!sexy.equals("")){HQL+=" and m.sexy = '"+sexy+"'";}
		if(corp!=null&&!corp.equals("")){HQL+=" and m.workName = '"+corp+"'";}
		if(phone!=null&&!phone.equals("")){HQL+=" and m.phone = '"+phone+"'";}
		if(cert!=null&&!cert.equals("")){HQL+=" and m.certId = '"+cert+"'";}
		if(born!=null&&!born.equals("")){HQL+=" and m.born = '"+born+"'";}
		if(age!=null&&!age.equals("")){HQL+=" and m.age = '"+age+"'";}
		if(education!=null&&!education.equals("")){HQL+=" and m.education = '"+education+"'";}
		if(techType!=null&&!techType.equals("")){HQL+=" and m.techType = '"+techType+"'";}
		if(email!=null&&!email.equals("")){HQL+=" and m.email = '"+email+"'";}
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
