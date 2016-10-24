package com.taiji.fzb.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.Member;
import com.taiji.fzb.domain.XzfyCompany;
import com.taiji.fzb.domain.XzfyOtherSuggest;
import com.taiji.fzb.domain.XzfyQuestionnaire;

public interface ComService extends ICoreService{
	
	public void saveMem(Member mem);
	public PaginationSupport getMemList(int pageNumber, int pageSize,String name,String sexy,String position,String type,String phone,String recordDate,String age,String education,String locbm);
	
	public PaginationSupport findAllCompanyList(int pageNumber, int pageSize,XzfyCompany xzfyCompany);
	
	public List getAllMemList(String name,String sexy,String position,String type,String phone,String recordDate,String age,String education,String locbm);

	public Member getMemById(String entityId);
	public void deleteMemById(String entityId);
	public void updateMem(Member mem);
//	public List<Member> getMemListById(String id);
	public XzfyCompany getXzfyComById(String code,String name);
	
	public XzfyCompany findXzfyCompanyByIdAndLocbm(int id,String code);
	
	public void updateXzfyCom(XzfyCompany xzfy);
	public XzfyCompany getXzfyById(int id);
	
    public void saveXzfyQustn(XzfyQuestionnaire xzfy);//在线调查
	
	public String getXmlString();//在线调查
	
	public void saveXzfySuggest(XzfyOtherSuggest xzfy);//在线调查
	
	public PaginationSupport getOpinionList(int pageNumber,int pageSize);
	public List getAllOtherList();
	public List getReplyList(int id);
	public XzfyOtherSuggest getSuggestById(int id);
}
