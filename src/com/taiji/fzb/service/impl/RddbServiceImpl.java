package com.taiji.fzb.service.impl;

import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.Committee;
import com.taiji.fzb.domain.Term;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.RddbService;
import com.taiji.fzb.service.XzfyService;

public class RddbServiceImpl extends CoreServiceImpl implements RddbService{

	@Override
	public void save(Term term) {
		super.saveOrUpdate(term);
	}

	@Override
	public PaginationSupport getTermList(int pageNumber, int pageSize) {
		String HQL = "";
		HQL += " from  Term term";
		HQL += " where 1 = 1";
		return super.find(HQL, pageNumber, pageSize);
	}

	@Override
	public List getAllTermList() {
		String HQL = "";
		HQL += " from  Term term";
		HQL += " where 1 = 1";
		return super.find(HQL);
	}

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

	@Override
	public void saveCom(Committee com) {
		super.saveOrUpdate(com);
	}

	@Override
	public void deleteComtById(String entityId) {
		String hql="delete from  Committee comt where comt.comtId="+entityId;
		super.deleteAll(hql);
	}

	@Override
	public Committee getComtById(String entityId) {
		String HQL = "";
		HQL += " from Committee comt";
		HQL += " where 1 = 1";
		HQL += " and comt.comtId = " + entityId;
		List<Committee> dataList = super.find(HQL);
		Committee com = new Committee();
		if (dataList.isEmpty()) {
			com = new Committee();
		} else {
			com = (Committee)dataList.get(0);
		}
		return com;
	}

	@Override
	public void updateComt(Committee comt) {
		super.saveOrUpdate(comt);
		
	}

	@Override
	public List<Committee> getCommitteeListById(String id) {
		String HQL="";
		HQL+="from Committee comt where comt.term.currentTermNo = '"+id+"'";
		List comtList=super.find(HQL);
		return comtList;
	}

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

}
