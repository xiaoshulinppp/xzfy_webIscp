package com.taiji.datum.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;

public interface DatumService extends ICoreService{
	
	public PaginationSupport getPersonalList(int pNum, int pageSize,int userid);
	
	public PaginationSupport getPublicList (int pNum, int pageSize,String zlmc,String zlnx,String gjc,String scr,String zy);
	
	public int getPublicedNumber(int userid);
	
	public List getDictList(int id);

}
