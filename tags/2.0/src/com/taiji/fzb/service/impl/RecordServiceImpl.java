package com.taiji.fzb.service.impl;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.taiji.common.ContextUtil;
import com.taiji.core.dao.IHibernateDAO;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
//import com.taiji.fzb.domain.XzcjApp;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyDftz;
import com.taiji.fzb.domain.XzfyLog;
import com.taiji.fzb.domain.XzfyShenpi;
import com.taiji.fzb.service.BananService;
import com.taiji.fzb.service.RecordService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.util.HibernateSessionFactory;
import com.util.UserUtil;


@SuppressWarnings("unchecked")
public class RecordServiceImpl extends CoreServiceImpl implements RecordService {

	
	@Override
	public XzfyInfo getXzfyById(String entityId) {
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.id = '" + entityId+"'";
		List<XzfyInfo> dataList = super.find(HQL);
		XzfyInfo xzfyInfo = new XzfyInfo();
		if (dataList.isEmpty()) {
			xzfyInfo = new XzfyInfo();
		} else {
			xzfyInfo = dataList.get(0);
		}
		return xzfyInfo;
	}
	
	public List  getUserListById(String orgId){
		List list=super.find("from Org org where org.id="+orgId);		
		Org org=new Org();
		org=(Org)list.get(0);
		String hql="from Org org where org.locbm='"+org.getLocbm()+"'";
		List<Org> orgList=super.find(hql);
		String whereSql="";
		for(int i=0;i<orgList.size();i++){
			Org orgTmp=(Org)orgList.get(i);
			if(i==0)
				whereSql=whereSql+"("+org.getId();
			else
				whereSql=whereSql+","+org.getId();
			if(i==orgList.size()-1)
				whereSql=whereSql+")";	
		}
		String getUserSql="from User u where 1=1 and  u.org.id in"+whereSql;
		List<User> userList=super.find(getUserSql);
		return userList;
				
	}
	
	public PaginationSupport getShenpiListById(int pageNumber, int pageSize,String user_id){
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.check_status=1 and xzfy.check_id="+user_id+"";
		return super.find(HQL, pageNumber, pageSize);
	}
	
	
	public void  save_log(String status,String caozuo,String xzfyId,Object objNew){
		
		//判断案件状态
		String stage ="";
		//log_info
		String info="";
		if(status.equals("1")) {
			stage="立案审查";
		}
		if(status.equals("2")) {
			stage="补正审批";
		} else if (status.equals("3")) {
			stage="立案审批";
		} else if (status.equals("4")) {
			stage="案件办理";
		} else if (status.equals("5")) {
			stage="延期审批";
		} else if (status.equals("6")) {
			stage="案件延期";
		} else if (status.equals("7")) {
			stage="中止审批";
		} else if (status.equals("8")) {
			stage="案件中止";
		} else if (status.equals("9")) {
			stage="恢复审理审批";
		} else if (status.equals("10")) {
			stage="恢复审理";
		} else if (status.equals("11")) {
			stage="结案审批";
		} else if (status.equals("12")) {
			stage="结案";
		}
		
		XzfyInfo objOld=this.getXzfyById(xzfyId);
		//update_name
		String user = UserUtil.getUserName();		
		//log_info
		info = user + "在" +stage + "阶段" + caozuo;
		//判断对象内容是否被修改
		try {
			info += " "  + this.objectCompare(objOld,objNew);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IntrospectionException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//log_time
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String logTime = df.format(new Date());
		
		XzfyLog log = new XzfyLog();
		log.setLog_info(info);
		log.setLog_time(logTime);
		log.setUpdate_name(user);

		//XzfyInfo xzfyInfo = (XzfyInfo) this.coreService.getEntityObjectById(XzfyInfo.class, xzfyId);
		log.setXzfyId(xzfyId);
		super.save(log);
	}
	
	private String objectCompare(Object ob1,Object ob2) throws IntrospectionException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{
		if(ob1==null&&ob2==null){
			return "";
		}
		Class clazz = ob1.getClass();
		String r = clazz.getName();
		Field[] fields = ob1.getClass().getDeclaredFields();
		for (Field field:fields){
		if(!field.getName().equals("tAppDeptId") && !field.getName().equals("tPoliceIsParade")){
			//System.out.println(field.getName());
			if (field.getType() !=null &&field.getType().getName().equals("java.lang.String")){
				PropertyDescriptor pd = new PropertyDescriptor(field
						.getName(), clazz);
				Method method = pd.getReadMethod();
				Object o1 = method.invoke(ob1);
				Object o2 = method.invoke(ob2);
				if(o1 !=null){
					if(o2 !=null){
						if (!o1.toString().equals(o2.toString()) || o1!=o2 || !o1.equals(o2)) {
							r+=field.getName() + "被更改(" + o1.toString() + "|" + o2.toString() + ");";
							//System.out.println(field.getName()+" has changed");
						}
					}else{
						r+=field.getName() + "被更改(" + o1.toString() + "|null);";
					}
				}else{
					if(o2 !=null){
						r+=field.getName() + "被更改(null|" + o2.toString() + ");";
					}
				}
			} 
		 }	
		}
		if (r.equals(clazz.getName())){
			r="";
		}
		return r;
	}
	
	
	public List getLogList(String xzfyId){
		String Hql="from XzfyLog log where log.xzfyId='"+xzfyId+"' order by log.id desc";
		List logList=super.find(Hql);
		return logList;
	}
	
	public PaginationSupport getCheckList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,String user_id){
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.check_status=1 and xzfy.check_id="+user_id+"";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				HQL+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				HQL+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				HQL+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				HQL+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		}
		return super.find(HQL, pageNumber, pageSize);		
	}
	
	public PaginationSupport getUserShenChaList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,String user_id){
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.check_status=0 and xzfy.user1_id="+user_id+" and " +
				"(xzfy.status in (1,2,3) or (xzfy.stadardResult not in (1) and xzfy.status=11))";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				HQL+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				HQL+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				HQL+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				HQL+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		}
		return super.find(HQL, pageNumber, pageSize);	
	}
	
	public PaginationSupport getUserBanLiList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,String user_id){
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.check_status=0 and xzfy.user2_id="+user_id+" and " +
				"((xzfy.status>3 and xzfy.status<11) or (xzfy.stadardResult=1 and xzfy.status=11))";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				HQL+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				HQL+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				HQL+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				HQL+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		}
		return super.find(HQL, pageNumber, pageSize);	
	}
	
	

	public PaginationSupport getTotalList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,User user){
		String orqSql="from Org org where org.id="+user.getOrg().getId();
		List orgList=super.find(orqSql);
		Org org=(Org)orgList.get(0);
		
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.status between 1 and 11   and xzfy.caseorg='"+org.getLocbm()+"'";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				HQL+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				HQL+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				HQL+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				HQL+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		}

		return super.find(HQL, pageNumber, pageSize);	

		/*
		String sql="select * from (" +
				"select tjzfzh,receive_date,app_show,app_type,defendant_name,user1_name,user2_name,status," +
				"xzfy.id,t2.user_name " +
				"from xzfy_info xzfy join u_user t2 on t2.user_id=xzfy.check_id where 1=1";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				sql+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				sql+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				sql+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				sql+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		}
		sql=sql+") where rownum between "+(pageNumber*pageSize+1-pageSize)+" and "+pageSize;
		
		return findBySQL(sql);	
		*/
		
	}
	
	public int getTotaCount(XzfyInfo xzfyInfo,User user){
		String sql="select count(1) count_id " +
				"from xzfy_info xzfy join u_user t2 on t2.user_id=xzfy.check_id where 1=1";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				sql+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				sql+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				sql+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				sql+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		}
		return totalCount(sql);
		
	}
	
	public int getTotalPage(int count,int pageSize,int pageNumber){
		return totalPage(count,pageSize,pageNumber);
		
	}
	
	public static int totalPage(int count,int pageSize,int pageNumber){

		int totalCount=count;
		if(totalCount<pageSize)
			return 1;
		else{
			
			if(totalCount%pageSize==0)
				return totalCount/pageSize;
			else
				return totalCount/pageSize+1;
		}
		
	}
	
	public static int totalCount(String sql){
		List list=findBySQL(sql);
		String count=list.get(0).toString();
		int totalCount=Integer.parseInt(count);
		return totalCount;
		
	}
	
	public static List findBySQL(String hql) {
		Session session;
		List list;
		Query query = null;
		session = null;
		list = null;
		try {
			session = HibernateSessionFactory.getSession();
			query = session.createSQLQuery(hql);
			list = query.list();
		} catch (Exception exception) {
			exception.printStackTrace();
		}finally{
			if (session != null && session.isOpen()) {
				session.close();
			}
		}
		return list;
	}
	
	public User getUserById(String userId){
		String hql="from User u where u.id="+userId;
		List userList=super.find(hql);
		User user=(User)userList.get(0);
		return user;
	}
	
	public PaginationSupport getXzfyListByStatus(int pageNumber, int pageSize) {
		String hql = "from XzfyInfo where STATUS in (1,2,3,4,5,6,7,8,9,10,11) order by id desc";
		return super.find(hql, pageNumber, pageSize);
	}
	
	public List getCheckListByXzfyID(String xzfyId,String type){
		String hql="from XzfyShenpi shenpi where shenpi.check_type="+type
				+" and shenpi.xzfyInfo.id='"+xzfyId+"' order by shenpi.id desc";
		List checkList=super.find(hql);
		return checkList;
	}

}
