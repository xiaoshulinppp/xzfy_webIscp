package com.taiji.fzb.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.Committee;
import com.taiji.fzb.domain.Term;

public interface RddbService extends ICoreService{
	public void save(Term term);
	public void saveCom(Committee com);
	public PaginationSupport getTermList(int pageNumber, int pageSize);
	public List getAllTermList();
	public Term getTermById(String entityId);
	public Committee getComtById(String entityId);
	public void deleteComtById(String entityId);
	public void updateComt(Committee comt);
	public List<Committee> getCommitteeListById(String id);
	public Term getTermByTermNo(String num);
}
