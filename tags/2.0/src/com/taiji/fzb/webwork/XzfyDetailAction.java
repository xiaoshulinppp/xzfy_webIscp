package com.taiji.fzb.webwork;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import net.sf.cglib.beans.BeanCopier;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzfyAgent;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.domain.XzfyRecieve;
import com.taiji.fzb.domain.XzfyShenpi;
import com.taiji.fzb.service.XzfyService;
import com.taiji.user.domain.User;
import com.util.UserUtil;

@SuppressWarnings("unchecked")
public class XzfyDetailAction extends ProtectedDetailAction {

	private static final long serialVersionUID = 1L;

	// 类成员

	// 公共功能变量

	private PaginationSupport pageList = new PaginationSupport(); // 分页列表

	private Integer pageSize = 15; // 分页列表每页显示个数

	private Integer totalPage = 0; // 分页列表页面总数

	private XzfyService xzfyService = null; // 模板业务层方法
	
	private String status;
	
	private XzfyRecieve xzfyReceive;
	
	
	public void setDeputy(List<String> deputy) {
		this.deputy = deputy;
	}

	public List<String> getDeputy() {
		return deputy;
	}

	public XzfyService getXzfyService() {
		return xzfyService;
	}

	public void setXzfyService(XzfyService xzfyService) {
		this.xzfyService = xzfyService;
	}

	private List xzfyList;

	// 公共方法

	public List getXzfyList() {
		return xzfyList;
	}

	public void setXzfyList(List xzfyList) {
		this.xzfyList = xzfyList;
	}

	/**
	 * 显示模板列表
	 */
	public String showXzfyList() {
		try {
			this.pageList = this.xzfyService.getXzfyList(super.getPageNum(), this.pageSize);
			this.xzfyList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 进入创建新模板页面
	 */
	public String gotoCreate() {
		try {	
			String currentTime=new SimpleDateFormat("yyyyMMddHHmmssSSS") .format(new Date() );
			Random random = new Random();
			xzfyId=currentTime+random.nextInt(10000);
			Date dt = new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			todate = df.format(dt);
			user = new User();
			user = (User) ActionContext.getContext().getSession().get(
					"_USER_LOGIN_");
			admit_name=user.getName();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	public String showshenpiList(){
		try{
			user = new User();
			user = (User) ActionContext.getContext().getSession().get(
					"_USER_LOGIN_");
			admit_name=user.getName();
			this.pageList = this.xzfyService.getShenpiListById(super.getPageNum(), this.pageSize,xzfyId,user.getId().toString());
			this.shenpiList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			return "success";

		} catch (Exception e){
			e.printStackTrace();
			return "error";
		}
	}

	private void saveDeputy(String deputy){
		String dpName[] = deputy.split("，");
		for (String name:dpName){
			String sql = "update xzfy_app set ISDEPUTY = '1' where APP_NAME = '" + name + "'";
			this.xzfyService.updateAllBySQL(sql);
		}
	}
	
	private XzfyInfo setInfo(XzfyInfo x){
		
		this.xzfyService.deleteAppById(x.getId());
		String appShow="";
		
		//拆分appDetail
		if (x.getApp_type().equals("1")){
			String apps[] = x.getAppdetail().split("；");
			for(String app:apps){
				String info[] = app.split("，");
				XzfyApp xzfyApp = new XzfyApp();
				x = xzfyService.getXzfyById(x.getId());
				for(int i=0;i<info.length;i++){
					if(i==0){
						if(info[i].equals("") || info[i]==null){
							break;
						}
						xzfyApp.setApp_name(info[i]);
						if (appShow.equals("")){
							appShow = info[i];
						} else {
							appShow += "," + info[i];
						}
					} else if(i==1){
						xzfyApp.setSexy(info[i]);
					} else {
						xzfyApp = this.splitInfo(info[i],xzfyApp);
					}
				}
				xzfyApp.setProxytype(x.getApp_type());
				xzfyApp.setXzfyInfo(x);
				xzfyService.saveOrUpdate(xzfyApp);
			}
		}
		//拆分agentDetail
		if (x.getApp_type().equals("2")){
			String agents[] = x.getAgentDetail().split("；");
			for(String agent:agents){
				String info[] = agent.split("，");
				XzfyApp xzfyApp = new XzfyApp();
				x = xzfyService.getXzfyById(x.getId());
				for(int i=0;i<info.length;i++){
					if(i==0){
						if(info[i].equals("") || info[i]==null || info[i].equals(", ")){
							break;
						}
						if(info[i].indexOf("（")==1){
							String a[]=info[i].split("（");
							xzfyApp.setApp_name(a[0]);
							xzfyApp.setOtherType(a[1].replaceAll("）", ""));
							if (appShow.equals("")){
								appShow = a[0];
							} else {
								appShow += "," + a[0];
							}
						} else {
							xzfyApp.setApp_name(info[i]);
							if (appShow.equals("")){
								appShow = info[i];
							} else {
								appShow += "," + info[i];
							}
						} 
					} else {
						xzfyApp = this.splitInfo(info[i],xzfyApp);
					}
				}
				xzfyApp.setProxytype(x.getApp_type());
				xzfyApp.setXzfyInfo(x);
				xzfyService.saveOrUpdate(xzfyApp);
			}
		}
		//设置列表显示申请人人名
		x.setApp_show(appShow);
		return x;
	}
	
	public String saveFace(){
		//取得localbm
		String locbm =  UserUtil.getLocBM();
		//取得最大流水号
		List<String> caseIndexList = this.coreService.find("select max(caseindex) as caseindex from XzfyInfo");
		//设置流水号
		String caseIndex = null;
		for (int i=0;i<caseIndexList.size();i++){
			caseIndex = caseIndexList.get(i);
		}
		
		if (caseIndex == null){
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			caseIndex = year  + locbm + "0001";
			System.out.println(caseIndex);
		} else {
			String y = caseIndex.substring(0, 4);
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			if (year > Integer.parseInt(y)) {
				caseIndex = year  +locbm+ "0001";
			} else {
				Long c = Long.parseLong(caseIndex)+1;
				caseIndex = String.valueOf(c);
			}
		}
		xzfyInfo.setCaseindex(caseIndex);
		
		//记录收案时间、24小时内删除用
		xzfyInfo.setReceive_real_date(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		BeanCopier bc = BeanCopier.create(XzfyInfo.class, XzfyRecieve.class, false);
		XzfyRecieve xr = new XzfyRecieve();
		bc.copy(xzfyInfo, xr, null);
		xzfyService.saveOrUpdate(xr);
		
		xzfyInfo.setStatus("1");
		xzfyInfo.setCheck_status("0");
		xzfyService.saveOrUpdate(xzfyInfo);

		xzfyInfo = this.setInfo(xzfyInfo);
		if (xzfyInfo.getDbrDetail() != null && !xzfyInfo.getDbrDetail().equals("")){
			this.saveDeputy(xzfyInfo.getDbrDetail());
		}
		xzfyInfo.setCaseorg(UserUtil.getLocBM());
		xr.setApp_show(xzfyInfo.getApp_show());

		xzfyService.update(xzfyInfo);
		xzfyService.update(xr);
		return SUCCESS;
	}
	
	public String songdaqueren(){
		xzfyInfo.setCaseorg(UserUtil.getLocBM());
		xzfyInfo.setCheck_status("0");
		xzfyInfo.setStatus("0");
		xzfyInfo.setSongdaquerenFlag("1");
		xzfyService.saveOrUpdate(xzfyInfo);
		xzfyInfo = this.setInfo(this.xzfyInfo);
		if (xzfyInfo.getDbrDetail() != null && !xzfyInfo.getDbrDetail().equals("")){
			this.saveDeputy(xzfyInfo.getDbrDetail());
		}
		xzfyService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}

	public String jiedaibilu(){
		xzfyInfo.setCaseorg(UserUtil.getLocBM());
		xzfyInfo.setCheck_status("0");
		xzfyInfo.setStatus("0");
		xzfyInfo.setJdbl_flag("1");
		xzfyService.saveOrUpdate(xzfyInfo);
		xzfyInfo = this.setInfo(this.xzfyInfo);
		if (xzfyInfo.getDbrDetail() != null && !xzfyInfo.getDbrDetail().equals("")){
			this.saveDeputy(xzfyInfo.getDbrDetail());
		}
		xzfyService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}

	public String shengchengshouju(){
		xzfyInfo.setCaseorg(UserUtil.getLocBM());
		xzfyInfo.setCheck_status("0");
		xzfyInfo.setStatus("0");
		xzfyInfo.setShouju_flag("1");
		xzfyService.saveOrUpdate(xzfyInfo);
		xzfyInfo = this.setInfo(this.xzfyInfo);
		if (xzfyInfo.getDbrDetail() != null && !xzfyInfo.getDbrDetail().equals("")){
			this.saveDeputy(xzfyInfo.getDbrDetail());
		}
		xzfyService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}
	
	public XzfyApp splitInfo(String r,XzfyApp xzfyApp) {
		
		if(r.startsWith("身")){
			r=r.substring(4);
			xzfyApp.setApp_id(r);
		} else if (r.startsWith("送")){
			r=r.substring(4);
			xzfyApp.setMail_address(r);
		} else if (r.startsWith("邮")){
			r=r.substring(2);
			xzfyApp.setPostcode(r);
		} else if (r.startsWith("电")){
			r=r.substring(2);
			xzfyApp.setTelephone(r);
		} else {
			String a[] = r.split("：");
			xzfyApp.setDeputyType(a[0].replace("是", ""));
			xzfyApp.setDeputyName(a[1]);
		}
		return xzfyApp;
	}
	
	
	public String savePaper(){
		//取得localbm
				String locbm =  UserUtil.getLocBM();
				//取得最大流水号
				List<String> caseIndexList = this.coreService.find("select max(caseindex) as caseindex from XzfyInfo");
				//设置流水号
				String caseIndex = null;
				for (int i=0;i<caseIndexList.size();i++){
					caseIndex = caseIndexList.get(i);
				}
				
				if (caseIndex == null){
					Calendar cal = Calendar.getInstance();
					int year = cal.get(Calendar.YEAR);
					caseIndex = year  + locbm + "0001";
					System.out.println(caseIndex);
				} else {
					String y = caseIndex.substring(0, 4);
					Calendar cal = Calendar.getInstance();
					int year = cal.get(Calendar.YEAR);
					if (year > Integer.parseInt(y)) {
						caseIndex = year  +locbm+ "0001";
					} else {
						Long c = Long.parseLong(caseIndex)+1;
						caseIndex = String.valueOf(c);
					}
				}
				xzfyInfo.setCaseindex(caseIndex);
				
				//记录收案时间、24小时内删除用
				xzfyInfo.setReceive_real_date(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
				BeanCopier bc = BeanCopier.create(XzfyInfo.class, XzfyRecieve.class, false);
				XzfyRecieve xr = new XzfyRecieve();
				bc.copy(xzfyInfo, xr, null);
				xzfyService.saveOrUpdate(xr);
				
				xzfyInfo.setStatus("1");
				xzfyInfo.setCheck_status("0");
				xzfyService.saveOrUpdate(xzfyInfo);

				xzfyInfo = this.setInfo(xzfyInfo);
				if (xzfyInfo.getDbrDetail() != null && !xzfyInfo.getDbrDetail().equals("")){
					this.saveDeputy(xzfyInfo.getDbrDetail());
				}
				xzfyInfo.setCaseorg(UserUtil.getLocBM());
				xr.setApp_show(xzfyInfo.getApp_show());

				xzfyService.update(xzfyInfo);
				xzfyService.update(xr);
				return SUCCESS;
	}

	public String saveEmail(){
		//取得localbm
				String locbm =  UserUtil.getLocBM();
				//取得最大流水号
				List<String> caseIndexList = this.coreService.find("select max(caseindex) as caseindex from XzfyInfo");
				//设置流水号
				String caseIndex = null;
				for (int i=0;i<caseIndexList.size();i++){
					caseIndex = caseIndexList.get(i);
				}
				
				if (caseIndex == null){
					Calendar cal = Calendar.getInstance();
					int year = cal.get(Calendar.YEAR);
					caseIndex = year  + locbm + "0001";
					System.out.println(caseIndex);
				} else {
					String y = caseIndex.substring(0, 4);
					Calendar cal = Calendar.getInstance();
					int year = cal.get(Calendar.YEAR);
					if (year > Integer.parseInt(y)) {
						caseIndex = year  +locbm+ "0001";
					} else {
						Long c = Long.parseLong(caseIndex)+1;
						caseIndex = String.valueOf(c);
					}
				}
				xzfyInfo.setCaseindex(caseIndex);
				
				//记录收案时间、24小时内删除用
				xzfyInfo.setReceive_real_date(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
				BeanCopier bc = BeanCopier.create(XzfyInfo.class, XzfyRecieve.class, false);
				XzfyRecieve xr = new XzfyRecieve();
				bc.copy(xzfyInfo, xr, null);
				xzfyService.saveOrUpdate(xr);
				
				xzfyInfo.setStatus("1");
				xzfyInfo.setCheck_status("0");
				xzfyService.saveOrUpdate(xzfyInfo);

				xzfyInfo = this.setInfo(xzfyInfo);
				if (xzfyInfo.getDbrDetail() != null && !xzfyInfo.getDbrDetail().equals("")){
					this.saveDeputy(xzfyInfo.getDbrDetail());
				}
				xzfyInfo.setCaseorg(UserUtil.getLocBM());
				xr.setApp_show(xzfyInfo.getApp_show());

				xzfyService.update(xzfyInfo);
				xzfyService.update(xr);
				return SUCCESS;
	}
	
	public String saveLianshencha(){
		xzfyService.update(xzfyInfo);
		return SUCCESS;
	}
	public String finishLianshencha(){
		xzfyInfo.setStatus(status);
		xzfyService.update(xzfyInfo);
		return SUCCESS;
	}
	
	public String liAn(){
		xzfyInfo.setStatus("5");
		xzfyService.update(xzfyInfo);
		return SUCCESS;
	}
	
	public String banAn(){
		xzfyInfo.setStatus("9");
		xzfyService.update(xzfyInfo);
		return SUCCESS;
	}
	
	public String addDeputy() {
		appList=xzfyService.getAppListById(xzfyId,this.protype);
		sendValue="";
		appCount="0";
		String d = "";
		String l = "";
		int dc=0;
		int lc=0;
		for(int i=0;i<appList.size();i++){
			XzfyApp app=new XzfyApp();
			app=(XzfyApp)appList.get(i);
			if (app.getIsdeputy().equals("1")){
				d = d+"代表人姓名："+app.getApp_name() + " ";
				dc++;
				
			}
			if (app.getIslink().equals("1")){
				l = l+"联系人姓名："+app.getApp_name() + " ";
				lc++;
			}
		}
		sendValue = d + l;
		return SUCCESS;
	}
	
	public String addApp(){
		appList=xzfyService.getAppListById(xzfyId,this.protype);
		sendValue="";
		appCount="0";
		String app_id;
		String mail_address;
		String mobile;
		for(int i=0;i<appList.size();i++){
			XzfyApp app=new XzfyApp();
			app=(XzfyApp)appList.get(i);
			

			if(app.getApp_id()==null || app.getApp_id().equals("")){
				app_id = "";
			} else {
				app_id = app.getApp_id();
			}

			if(app.getMail_address()==null || app.getMail_address().equals("")){
				mail_address = "";
			} else {
				mail_address = app.getMail_address();
			}

			if(app.getMobile()==null || app.getMobile().equals("")){
				mobile = "";
			} else {
				mobile = app.getMobile();
			}
			
			sendValue=sendValue+app.getApp_name()+"，";
			if(app.getSexy().equals("1"))
				sendValue=sendValue+"男，";
			else
				sendValue=sendValue+"女，";
			sendValue=sendValue+"身份证号："+app_id+"，住所地："
			+ mail_address+"，电话："+ mobile;
			if(i==appList.size()-1)
				sendValue=sendValue+"。";
			else
				sendValue=sendValue+"；";
		}
		if(appList.size()>0)
			appCount=new Integer(appList.size()).toString();
		
		return SUCCESS;
	}
	
	public String addLegal(){
		appList=xzfyService.getAppListById(xzfyId,this.protype);  
		sendValue="";
		String otherType="";
		String deputyType="";
		String address="";
		String mobile="";
		String post="";
		for(int i=0;i<appList.size();i++){
			XzfyApp app=new XzfyApp();
			app=(XzfyApp)appList.get(i);
			if(app.getOtherType().equals("1")){
				otherType="由股东代表大会以股份制企业名义提出申请";
			} else if (app.getOtherType().equals("2")){
				otherType="由董事会以股份制企业名义提出申请";
			} else if (app.getOtherType().equals("3")){
				otherType="其他";
			} else if (app.getOtherType().equals("0")){
				otherType="无";
			}
			
			if(app.getDeputyType().equals("1")){
				deputyType="法定代表人";
			} else if (app.getDeputyType().equals("2")){
				deputyType="负责人";
			} else if (app.getDeputyType().equals("3")){
				deputyType="执行合伙事务的合伙人";
			} else if (app.getDeputyType().equals("4")){
				deputyType="合伙人";
			} else if (app.getDeputyType().equals("5")){
			deputyType="主要负责人";
			} else if (app.getDeputyType().equals("6")){
				deputyType="被共同推选的非法人组织其他成员";
			} 
			
			if(app.getAddress()==null){
				address = "";
			} else {
				address = app.getAddress();
			}
			if(app.getMobile()==null){
				mobile = "";
			} else {
				mobile = app.getMobile();
			}
			if(app.getPostcode()==null){
				post = "";
			} else {
				post = app.getPostcode();
			}
			sendValue=sendValue+app.getApp_name()+"("+ otherType +")，";
			sendValue=sendValue+deputyType+"是："+app.getDeputyName() +"，";
			sendValue=sendValue+"住所地"+address+"，邮编"+post+"，电话"+mobile;
			if(i==appList.size()-1)
				sendValue=sendValue+"。";
			else
				sendValue=sendValue+"；";
				}
		appCount="0";
		if(appList.size()>0)
			appCount=new Integer(appList.size()).toString();
		return SUCCESS;
	}

	public String getAppname(){
		appList = this.xzfyService.getAppListById(xzfyId);
		List<XzfyApp> appTemp = new ArrayList<XzfyApp>();
		for (XzfyApp app:appList){
			if(app.getIsdeputy().equals("1")){
				appTemp.add(app);
			}
		}
		if (appTemp.size()!=0){
			appList.clear();
			appList.addAll(appTemp);
		}
		return SUCCESS;
	}
	
	
	public String addAgent() {
		agentList=xzfyService.getAgentListById(xzfyId);  
		sendValue="";
		for(int i=0;i<agentList.size();i++){
			XzfyAgent agent=new XzfyAgent();
			agent=(XzfyAgent)agentList.get(i);
			sendValue=sendValue+agent.getAgent_name();
			if(i==agentList.size()-1)
				sendValue=sendValue+"。";
			else
				sendValue=sendValue+"；";
				}
		agentCount="0";
		if(agentList.size()>0)
			agentCount=new Integer(agentList.size()).toString();
		return SUCCESS;
	}

	public String createApp(){
		return SUCCESS;
	}

	public String createAgent(){
		return SUCCESS;
	}
	
	public String saveNewApp(){
		xzfyInfo=new XzfyInfo();
		xzfyInfo.setId(xzfyId);
		xzfyApp.setProxytype(protype);
		xzfyApp.setXzfyInfo(xzfyInfo);
		xzfyService.save(xzfyApp);
		return SUCCESS;
	}
	
	public String saveDeputy(){
		for (int i=0;i<deputy.size();i++){
			if (deputy.get(i).equals("1")){
				xzfyService.updateAllBySQL("update xzfy_app set isdeputy ='1' where id="+appIds.get(i));
			}
		}

		for (int i=0;i<link.size();i++){
			if (link.get(i).equals("1")){
				xzfyService.updateAllBySQL("update xzfy_app set islink ='1' where id="+appIds.get(i));
			}
		}
		
		return SUCCESS;
	}
	
	public String lianTiqu(){
		xzfyInfo = xzfyService.getXzfyById(xzfyId);
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		admit_name=user.getName();
		xzfyInfo.setUser1_name(admit_name);
		xzfyService.saveOrUpdate(xzfyInfo);
		return SUCCESS;
	}
	
	public String getInfoById(){
		xzfyReceive = this.xzfyService.getRecieveById(xzfyId);
		
		return SUCCESS;
	}
	
	public String saveNewAgent() {
		xzfyInfo=new XzfyInfo();
		xzfyInfo.setId(xzfyId);
		xzfyAgent.setProxytype(protype);
		xzfyAgent.setXzfyInfo(xzfyInfo);
		xzfyService.save(xzfyAgent);
		return SUCCESS;
	}
	
	public String deleteApp(){
		xzfyApp=new XzfyApp();
		xzfyApp=xzfyService.getAppById(appId);
		xzfyService.deleteAppById(appId);
		return SUCCESS;
	}

	public String deleteAgent(){
		xzfyAgent=new XzfyAgent();
		xzfyAgent=xzfyService.getAgentById(agentId);
		xzfyService.deleteAgentById(agentId);
		return SUCCESS;
	}
	
	public String updateApp(){
		xzfyApp=new XzfyApp();
		xzfyApp.setProxytype(protype);
		xzfyApp=xzfyService.getAppById(appId);
		return SUCCESS;
	}

	public String updateAgent(){
		xzfyAgent=new XzfyAgent();
		xzfyAgent.setProxytype(protype);
		xzfyAgent=xzfyService.getAgentById(agentId);
		return SUCCESS;
	}
	
	public String doUpdateApp(){
		xzfyInfo=new XzfyInfo();
		xzfyInfo.setId(xzfyId);
		xzfyApp.setXzfyInfo(xzfyInfo);
		xzfyService.update(xzfyApp);
		return SUCCESS;
	}
	
	public String doUpdateAgent(){
		xzfyInfo=new XzfyInfo();
		xzfyInfo.setId(xzfyId);
		xzfyAgent.setXzfyInfo(xzfyInfo);
		xzfyService.update(xzfyAgent);
		return SUCCESS;
	}

	
	private XzfyInfo xzfyInfo;
	private XzfyApp xzfyApp;
	private XzfyAgent xzfyAgent;
	private int appId;
	private int agentId;
	private String sendValue;
	private String protype="1";
	private String textId;
	private String todate;
	private String admit_name;
	private String countId;
	private String appCount;
	private String agentCount;
	private User user;
	private List<String> deputy; 
	private List<String> link; 
	private List<String> appIds;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getAppCount() {
		return appCount;
	}

	public void setAppCount(String appCount) {
		this.appCount = appCount;
	}

	public String getCountId() {
		return countId;
	}

	public void setCountId(String countId) {
		this.countId = countId;
	}

	public String getAdmit_name() {
		return admit_name;
	}

	public void setAdmit_name(String admitName) {
		admit_name = admitName;
	}

	public String getTodate() {
		return todate;
	}

	public void setTodate(String todate) {
		this.todate = todate;
	}

	public String getTextId() {
		return textId;
	}

	public void setTextId(String textId) {
		this.textId = textId;
	}

	public String getProtype() {
		return protype;
	}

	public void setProtype(String protype) {
		this.protype = protype;
	}

	public String getSendValue() {
		return sendValue;
	}

	public void setSendValue(String sendValue) {
		this.sendValue = sendValue;
	}

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public XzfyApp getXzfyApp() {
		return xzfyApp;
	}

	public void setXzfyApp(XzfyApp xzfyApp) {
		this.xzfyApp = xzfyApp;
	}

	private List<XzfyApp> appList;
	private List agentList;
	public List getAppList() {
		return appList;
	}

	public void setAppList(List appList) {
		this.appList = appList;
	}

	private String xzfyId;


	// 继承方法

	public String getXzfyId() {
		return xzfyId;
	}

	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}

	public PaginationSupport getPageList() {
		return pageList;
	}

	public void setPageList(PaginationSupport pageList) {
		this.pageList = pageList;
	}

	@Override
	public Class<XzfyInfo> getPersistentClass() {
		return XzfyInfo.class;
	}

	// 自定义Set和Get方法

	public XzfyInfo getXzfyInfo() {
		return this.xzfyInfo;
	}

	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo=xzfyInfo;
	}

	public List getAgentList() {
		return agentList;
	}

	public void setAgentList(List agentList) {
		this.agentList = agentList;
	}

	public String getAgentCount() {
		return agentCount;
	}

	public void setAgentCount(String agentCount) {
		this.agentCount = agentCount;
	}

	public XzfyAgent getXzfyAgent() {
		return xzfyAgent;
	}

	public void setXzfyAgent(XzfyAgent xzfyAgent) {
		this.xzfyAgent = xzfyAgent;
	}

	public void setAgentId(int agentId) {
		this.agentId = agentId;
	}

	public int getAgentId() {
		return agentId;
	}

	public void setAppIds(List<String> appIds) {
		this.appIds = appIds;
	}

	public List<String> getAppIds() {
		return appIds;
	}

	public void setLink(List<String> link) {
		this.link = link;
	}

	public List<String> getLink() {
		return link;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
	}
	
	private int shenpiid;
	private String checktype;
	private String checkid;
	private String checkname;
	private String checkresult;
	private String checkadvise;
	private String checkdate;
	private String sqsprenid;
	private String sqsprenname;
	private List shenpilist;
	private XzfyShenpi xzfyshenpi;
	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public int getShenpiid() {
		return shenpiid;
	}

	public void setShenpiid(int shenpiid) {
		this.shenpiid = shenpiid;
	}

	public String getChecktype() {
		return checktype;
	}

	public void setChecktype(String checktype) {
		this.checktype = checktype;
	}

	public String getCheckid() {
		return checkid;
	}

	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}

	public String getCheckname() {
		return checkname;
	}

	public void setCheckname(String checkname) {
		this.checkname = checkname;
	}

	public String getCheckresult() {
		return checkresult;
	}

	public void setCheckresult(String checkresult) {
		this.checkresult = checkresult;
	}

	public String getCheckadvise() {
		return checkadvise;
	}

	public void setCheckadvise(String checkadvise) {
		this.checkadvise = checkadvise;
	}

	public String getCheckdate() {
		return checkdate;
	}

	public void setCheckdate(String checkdate) {
		this.checkdate = checkdate;
	}

	public String getSqsprenid() {
		return sqsprenid;
	}

	public void setSqsprenid(String sqsprenid) {
		this.sqsprenid = sqsprenid;
	}

	public String getSqsprenname() {
		return sqsprenname;
	}

	public void setSqsprenname(String sqsprenname) {
		this.sqsprenname = sqsprenname;
	}

	private List<XzfyInfo> shenpiList;
	
	public void setShenpiList(List<XzfyInfo> shenpiList) {
		this.shenpiList = shenpiList;
	}

	public List<XzfyInfo> getShenpiList() {
		return shenpiList;
	}

	public void setShenpilist(List shenpilist) {
		this.shenpilist = shenpilist;
	}

	public List getShenpilist() {
		return shenpilist;
	}

	public void setXzfyshenpi(XzfyShenpi xzfyshenpi) {
		this.xzfyshenpi = xzfyshenpi;
	}

	public XzfyShenpi getXzfyshenpi() {
		return xzfyshenpi;
	}

	public String updateshenpi1(){
		xzfyshenpi=new XzfyShenpi();
		xzfyshenpi=xzfyService.getShenpiById(shenpiid);
		xzfyInfo = xzfyService.getXzfyById(xzfyId);
		return SUCCESS;
	}
	public String updateshenpi2(){
		xzfyshenpi=new XzfyShenpi();
		xzfyshenpi=xzfyService.getShenpiById(shenpiid);
		xzfyInfo = xzfyService.getXzfyById(xzfyId);
		return SUCCESS;
	}
	
	public String doUpdateshenpi(){
		xzfyInfo=new XzfyInfo();
		xzfyInfo.setId(xzfyId);
		xzfyshenpi.setXzfyInfo(xzfyInfo);
		xzfyService.update(xzfyshenpi);
		return SUCCESS;
	}

	public XzfyRecieve getXzfyReceive() {
		return xzfyReceive;
	}

	public void setXzfyReceive(XzfyRecieve xzfyReceive) {
		this.xzfyReceive = xzfyReceive;
	}
	

}
