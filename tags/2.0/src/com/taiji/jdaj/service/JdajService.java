package com.taiji.jdaj.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.jdaj.domain.JdajApp;
import com.taiji.jdaj.domain.JdajInfo;

public interface JdajService extends ICoreService{
	public void saveJdajInfo(JdajInfo jdajInfo);
	public void saveJdajApp(JdajApp jdajApp);
	public JdajInfo getJdajInfoById(String id);
    public List<JdajApp> getAppListById(String id);
    public void deleteAppById(int id);
    public JdajApp getAppById(int id);
    public void updateApp(JdajApp jdajApp);
    public List<JdajInfo> getList(String date,String num,String appName,String undertaker);
    public PaginationSupport getListByPage(int pNum, int pageSize,String date,String num,String appName,String undertaker);
    public void deleteJdajInfo(String id);
    public List<JdajInfo> searchJdajInfo(String date,String num,String appName,String undertaker);
    public PaginationSupport searchJdajInfoByPage(int pNum,int pageSize,String date,String num,String appName,String undertaker);
    public void deleteRelatedApp(String id);
}
