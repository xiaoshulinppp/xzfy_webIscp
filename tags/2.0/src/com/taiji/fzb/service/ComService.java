package com.taiji.fzb.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.Member;

public interface ComService extends ICoreService{
	
	public void saveMem(Member mem);
	public PaginationSupport getMemList(int pageNumber, int pageSize,String name,String sexy,String corp,String phone,String cert,String born,String age,String education,String techType,String email);
	public List getAllMemList(String name,String sexy,String corp,String phone,String cert,String born,String age,String education,String techType,String email);

	public Member getMemById(String entityId);
	public void deleteMemById(String entityId);
	public void updateMem(Member mem);
//	public List<Member> getMemListById(String id);

}
