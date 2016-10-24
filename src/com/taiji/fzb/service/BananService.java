package com.taiji.fzb.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.*;
import com.taiji.meet.domin.Meet;
import com.taiji.user.domain.User;
import com.taiji.webTemplate.domain.WtTemplate;

public interface BananService extends ICoreService {

	
	/**
	 * 获取模板列表
	 * 
	 * @param pageNumber
	 *            页码
	 * @param pageSize
	 *            每页显示条数
	 * @return 分页的列表
	 */
	public PaginationSupport getBananListByPage(int pageNumber, int pageSize);
	public List getBananList();
	public List getXcdcListById(String entityId);
	public List getDftzListById(String entityId);
	public List getShenpiListById(String entityId);
	public List getShenpiListById1(String entityId);
	public List getShenpiListById2(String entityId);
	public List getShenpiListById3(String entityId);
	public XzfyInfo getXzfyById(String entityId);
	public void savebanan(XzfyInfo xzfyInfo);
	public void saveshenpi(XzfyShenpi xzfyShenpi);
	public PaginationSupport getDftzListByPage(int pageNumber, int pageSize,String id);
	public XzfyDftz getDftzById(String id);
	public List findBySQL(String hql);
	public PaginationSupport getWeibanjieListByPage(int pageNumber, int pageSize, String locbm);
	public PaginationSupport getShenliqixian_20_ListByPage(int pageNumber, int pageSize, String locbm);
	public PaginationSupport getShenliqixian_10_ListByPage(int pageNumber, int pageSize, String locbm);
	public PaginationSupport getShenliqixian_chaoqi_ListByPage(int pageNumber, int pageSize, String locbm);
	public PaginationSupport getZhongzhiListByPage(int pageNumber, int pageSize, String locbm);
	public PaginationSupport getNewdaifenpeiListByPage(int pageNumber, int pageSize, String locbm);
	public PaginationSupport getWeizhidingListByPage(int pageNumber, int pageSize, String locbm);
	public PaginationSupport getDailianshenchaListByPage(int pageNumber, int pageSize, Number userid);
	public PaginationSupport getDaibanliListByPage(int pageNumber, int pageSize, Number userid);
	public PaginationSupport getDaishenpiListByPage(int pageNumber, int pageSize, Number userid);
	public PaginationSupport getDailianshenpiListByPage(int pageNumber, int pageSize, Number userid);
	public PaginationSupport getWeibanjie_sub_ListByPage(int pageNumber, int pageSize, Number orgid);
	public PaginationSupport getShenliqixian_sub40_ListByPage(int pageNumber, int pageSize, Number orgid);
	public PaginationSupport getShenliqixian_sub50_ListByPage(int pageNumber, int pageSize, Number orgid);
	public PaginationSupport getShenliqixian_subchaoqi_ListByPage(int pageNumber, int pageSize, Number orgid);
	public PaginationSupport getWeifenpei_sub_ListByPage(int pageNumber, int pageSize, Number orgid);
	public List getWeifenpei_sub_List(Number orgid);
	public PaginationSupport getsubZhongzhiListByPage(int pageNumber, int pageSize, Number orgid);
	public List getsubZhongzhiList(Number orgid);
	public PaginationSupport getsubDailianshenchaListByPage(int pageNumber, int pageSize, String locbm);
	public List getsubDailianshenchaList(String locbm);
	public PaginationSupport getsub35ListByPage(int pageNumber, int pageSize, String locbm);
	public List getsub35List(String locbm);
	public PaginationSupport getsub5ListByPage(int pageNumber, int pageSize, String locbm);
	public List getsub5List(String locbm);
	public PaginationSupport getsubBuzhengListByPage(int pageNumber, int pageSize, String locbm);
	public List getsubBuzhengList(String locbm);
	public PaginationSupport getsbBuzhengListByPage(int pageNumber, int pageSize,  Number userid);
	public List getsbBuzhengList( Number userid);
	public PaginationSupport getsbZhongzhiListByPage(int pageNumber, int pageSize, Number userid);
	public List getsbZhongzhiList(Number userid);
	public PaginationSupport getsbBanjieListByPage(int pageNumber, int pageSize, Number userid);
	public List getsbBanjieList(Number userid);
	public PaginationSupport getsbYishenchaListByPage(int pageNumber, int pageSize, Number userid);
	public List getsbYishenchaList(Number userid);
	public PaginationSupport getsbGuoqiListByPage(int pageNumber,int pageSize,Number userid);
	public List getsbGuoqiList(Number userid);
	
	public List<XzfyInfo> getWeibanjieList(String locbm);
	public List<XzfyInfo> getShenliqixian_20_List(String locbm);
	public List<XzfyInfo> getShenliqixian_10_List(String locbm);
	public List<XzfyInfo> getShenliqixian_chaoqi_List(String locbm);
	public List<XzfyInfo> getZhongzhiList(String locbm);
	public List<XzfyInfo> getNewdaifenpeiList(String locbm);
	public List<XzfyInfo> getWeizhidingList(String locbm);
	public List<XzfyInfo> getDailianshenchaList(Number userid);
	public List<XzfyInfo> getDaibanliList(Number userid);
	public List<XzfyInfo> getDaishenpiList(Number userid);
	public List<XzfyInfo> getDailianshenpiList(Number userid);
	public List<XzfyInfo> getWeibanjie_sub_List(Number orgid);
	public List<XzfyInfo> getShenliqixian_sub40_List(Number orgid);
	public List<XzfyInfo> getShenliqixian_sub50_List(Number orgid);
	public List<XzfyInfo> getShenliqixian_subchaoqi_List(Number orgid);
	public void deleteWeiban(String locbm);
	public List<XzfyWeiban> getXzfyWeibanListByLocbm(String locbm);
	public List<XzfyKeyword> getXzfyKeywordListByLocbm(String locbm);
	public void deleteKeyword(int id);
	public List<XzfyKeyword> getXzfyKeywordListByxzfyId(String xzfyid);
	public void deleteBananKeyword(String id);
	public List getUserListBytAppDeptId(String locbm);
	public PaginationSupport getSamexwListByPage(int pageNumber, int pageSize, String xwnum, String xwname, String id );
	public PaginationSupport getSameKindxwListByPage(int pageNumber, int pageSize, String defendantname, String xwname, String id);
	
	//统计表10
	public List getDengjiForm10List(String locbm, String startDate, String endDate, String finish_type);
	//统计表11
	public ArrayList<ArrayList<String>> getWeekLists(String startDate, String endDate);
	public ArrayList<ArrayList<String>> getJieAnTongJiByWeekLists(ArrayList<ArrayList<String>> weekLists, String locbm, String finish_type) throws SQLException;
	public ArrayList<String> getJieAnTongJiTotalList(String startDate, String endDate, String locbm, ArrayList<ArrayList<String>> weekLists, String finish_type) throws SQLException;
	//统计表1
	public List<XzfyInfo> getAnjianTongJiList(String startDate, String endDate, String locbm);
	public List<XzfyInfo> getAnjianTongJiTotalList(String startDate, String endDate, String locbm);
	public ArrayList<ArrayList<String>> getxzfyAnjianTongJiList(String startDate, String endDate, String locbm, String finish_type) throws SQLException;
	public ArrayList<String> getxzfyAnjianTongJiTotalList(String startDate, String endDate, String locbm, String finish_type) throws SQLException;
	
	public PaginationSupport getDmjiedaiList(int pageNumber, int pageSize,XzfyRecieve xzfyRecieve,User user, String locbm);
	
	//统计表3日接待
	public ArrayList<ArrayList<String>> getRijiedaiList(String searchDate, String locbm, String finish_type);
	//首页案件办理通道案件数量
	public ArrayList<String> getHomeCaseNum(String locbm,Number userid,Number orgid);
	
	//统计表22：行政复议机关办案效果指标统计
	public ArrayList<ArrayList<String>> getFyjgLists(String type);
	public ArrayList<ArrayList<String>> getBananxgLists(ArrayList<ArrayList<String>> fyjgLists, String startDate, String endDate, String date) throws SQLException;
	
	//查重
	public boolean checkAnhao(String anhao,String id);
	public boolean checkXwnum(String xwnum,String id);
	public PaginationSupport getcheckXwnumListByPage(int pageNumber, int pageSize, String xwnum, String id);
	public boolean checkAppnum(String appnum,String id);
	public PaginationSupport getCheckAppnumListByPage(int pageNumber, int pageSize, String appnum, String id);
	
	
	//meet表，首页打开提示承办人相关案件是否阅卷送达转接材料
	public ArrayList<ArrayList<ArrayList<String>>> getInformList(String userId, String locbm);
	public Meet getMeetById(String entityId);
	//meet表，根据xzfyId取最后一个阅卷、送达、转交材料组成list
	public List<Meet> getNewestMeetList(String xzfyId);
	//通过infoId在receive表里根据jaadvice拿最新当面补正接待记录
	public XzfyRecieve getDmbzByInfoid(String id);
	//查看当面补正页面
	public XzfyRecieve getDmbzById(String id);
	
	//是否及时登记案件监控统计
	public String getXmlString(String jktype, String hengxiangtype, String locbm, String startDate, String endDate);
}
