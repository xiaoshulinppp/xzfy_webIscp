package com.taiji.datum.service.impl;

import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.datum.service.DatumService;

public class DatumServiceImpl extends CoreServiceImpl implements DatumService{
	
	public PaginationSupport getPersonalList(int pNum, int pageSize,int userid){
		String hql = " from AppDatum t where 1=1 and t.userid="+userid+" order by t.id desc";
		return find(hql,pNum,pageSize);
	}
	
	public PaginationSupport getPublicList (int pNum, int pageSize,String zlmc,String zlnx,String gjc,String scr,String zy){
		String hql = " from AppDatum t where 1=1 and t.status='1'";
		if(zlmc!=null&&!zlmc.equals("")){
			hql += " and t.title like '%"+zlmc+"%'";
		}
		if(zlnx!=null&&!zlnx.equals("")){
			hql += " and t.type='"+zlnx+"'";
		}
		if(gjc!=null&&!gjc.equals("")){
			hql += " and t.keyword like '%"+gjc+"%'";
		}
		if(scr!=null&&!scr.equals("")){
			hql += " and t.uploadpeople like '%"+scr+"%'";
		}
		if(zy!=null&&!zy.equals("")){
			hql += " and t.summary like '%"+zy+"%'";
		}
		hql += " order by t.id desc";
		return find(hql,pNum,pageSize);
	}

	public int getPublicedNumber(int userid){
		String hql = " from AppDatum t where 1=1 and t.userid="+userid+" and t.status='1'";
		int pnumbet = find(hql).size();
		return pnumbet;
	}
	
	public List getDictList(int id){
		String hql = " from DictItem d where d.dict.id="+id+" order by d.value asc";
		List templist= find(hql);
		return templist;
	}
}
