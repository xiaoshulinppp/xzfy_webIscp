package com.taiji.meet.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.taiji.meet.domin.*;
import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.user.domain.User;
import com.taiji.webTemplate.domain.WtTemplate;
import java.sql.SQLException;

public interface MeetService extends ICoreService {


	public PaginationSupport getXzfyList(int pageNumber, int pageSize);
	public XzfyInfo getXzfyById(String entityId);
	public void saveXzfyInfo(XzfyInfo xzfyInfo);
	public List getAppListById(String entityId,String protype) ;
	public XzfyApp getAppById(int entityId);
	public void deleteAppById(int entityId);
	public void savexzfyApp(XzfyApp xzfyApp);
	
	public PaginationSupport getMeetList(int pageNumber, int pageSize);	
	public void saveClient(Client client);
	public Meet getMeetById(String meetid);
	public void saveMeet(Meet meet);
	public List getClientListById(int clientid,String protype);
	public Client getClientById(int clientid);
	public void deleteClientById(int clientid);
	public List<Meet> getAllList();
	public PaginationSupport getUnsetList(int pageNumber,int pageSize);
	public List<Meet> getAllUnsetList();
	public PaginationSupport getSetupList(int pageNumber,int pageSize);
	public List<Meet> getAllSetupList();
	public PaginationSupport FindList(int pageNumber,int pageSize,String title,String Face_time,String Admit1,String Admit2,String Meet_type);
	public List<Meet> FindAllList(String title,String Face_time, String Admit1, String Admit2,String Meet_type);
	public PaginationSupport getBananListByPage(int pageNumber, int pageSize,XzfyInfo xzfyInfo,String locbm);
	public PaginationSupport getBananListByPage1(int pageNumber, int pageSize,XzfyInfo xzfyInfo,String locbm);
	public List getBananList(String locbm);
	public List getBananList1(String locbm);
	public PaginationSupport getYiBanJieDaiList(int pageNumber, int pageSize,Meet meet,User user);
	public PaginationSupport getYueJuanList(int pageNumber, int pageSize,Meet meet,User user);
	public PaginationSupport getSongDaList(int pageNumber, int pageSize,Meet meet,User user);
	public PaginationSupport getZhuanJiaoCaiLiaoList(int pageNumber, int pageSize,Meet meet,User user);
	
	
	
	public ArrayList<ArrayList<String>> getWeekLists(String startDate, String endDate);
	public ArrayList<ArrayList<String>> getJieAnTongJiByWeekLists(ArrayList<ArrayList<String>> weekLists, String locbm) throws SQLException;
	public ArrayList<String> getJieAnTongJiTotalList(String startDate, String endDate, String locbm, ArrayList<ArrayList<String>> weekLists, Number searchpeid) throws SQLException;
	public ArrayList<ArrayList<String>> getTongjiForm18(String startDate, String endDate,String locbm, String sljg) throws Exception;
	public ArrayList<ArrayList<String>> getTongjiForm18_2(List<String> list1,String startDate, String endDate,String locbm, String sljg) throws Exception;
}
