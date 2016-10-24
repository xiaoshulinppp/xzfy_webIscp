package com.taiji.xztj.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.user.domain.Org;
import com.taiji.xztj.domain.XztjStat;
import com.taiji.xztj.service.XztjStatService;

public class XztjStatServiceImpl extends CoreServiceImpl implements XztjStatService{

	@Override
	public PaginationSupport obtainXztjStatList(int pageNumber, int pageSize,String fillDate,String fillPerson,String year,String fillQuarter,String locbm,String flag,String orderFlag) {
		// TODO Auto-generated method stub
		String HQL = "";
		HQL += " from XztjStat xztj";
		HQL += " where 1 = 1 ";
		if(fillDate!=null&&!fillDate.equals("")){HQL+=" and xztj.appDate = '"+fillDate+"'";}
		if(fillPerson!=null&&!fillPerson.equals("")){HQL+=" and xztj.appPerson like '%"+fillPerson+"%'";}
		
		if(year!=null&&!year.equals("")){HQL+=" and xztj.statYear like '%"+year+"%'";}
		
		if(fillQuarter!=null&&!fillQuarter.equals("")){HQL+=" and xztj.quarterOfYear = '"+fillQuarter+"'";}
		
		if(locbm!=null&&!locbm.equals("")){HQL+=" and xztj.locbm = '"+locbm+"'";}
		
		if(flag!=null&&!flag.equals("")){HQL+=" and xztj.totalOrNot = '"+flag+"'";}
//		if(position!=null&&!position.equals("")){HQL+=" and m.position = '"+position+"'";}
//		if(phone!=null&&!phone.equals("")){HQL+=" and m.phone = '"+phone+"'";}
//		if(type!=null&&!type.equals("")){HQL+=" and m.type = '"+type+"'";}
//		if(recordDate!=null&&!recordDate.equals("")){HQL+=" and m.recordDate = '"+recordDate+"'";}
//		if(age!=null&&!age.equals("")){HQL+=" and m.age = '"+age+"'";}
//		if(education!=null&&!education.equals("")){HQL+=" and m.education = '"+education+"'";}
//		HQL += " and m.locbm = '"+locbm+"' order by m.type ";
		if(orderFlag.equals("1")){
			HQL += " order by xztj.statYear asc,xztj.quarterOfYear asc,xztj.status asc,xztj.id desc";
		}
		else if(orderFlag.equals("2")){
			HQL += " order by xztj.statYear asc,xztj.quarterOfYear asc,xztj.status asc,xztj.id desc";
		}
		else{
			HQL += " order by xztj.statYear asc,xztj.quarterOfYear asc,xztj.locbm asc";
		}
		return super.find(HQL, pageNumber, pageSize);
	}

	@Override
	public XztjStat findXztjStatById(String id) {
		// TODO Auto-generated method stub
		String HQL = "";
		HQL += " from XztjStat xztj";
		HQL += " where 1 = 1 ";
		HQL+=  " and xztj.id='"+id+"'";
		HQL += " order by xztj.id ";
		
		List dataList = super.find(HQL);
		XztjStat xztj = null;
		if (!dataList.isEmpty()) {			
			xztj = (XztjStat)dataList.get(0);
		}
		return xztj;	
	}
	
	
	
	/*
	 * 获取行政调解法制办公室单位
	 */
	public Org getXztjFillOrg(String locBM){
		String hql="from Org org where org.locbm='"+locBM+"' order by org.id desc";
		List<Org> list1=super.find(hql);
		Org org=(Org)list1.get(0);
		return org;
	}
	
	/*
	 * 判断某年度16个区县和市政府某个季度行政调解统计数据是否已录入并审核通过
	 */
	public XztjStat findXztjStatGatherOrNot1(int year,int quarter){
		boolean flag = yon17Records1(year,quarter);//判断是否已经有16条记录了
		String id = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + new Random().nextInt(1000);
		
		String HQL=" select new map(sum(xztj.totalCaseCount) as totalCaseCount,sum(xztj.tjSuccessCount) as tjSuccessCount, ";
//		HQL += " sum(xztj.fzbGov_body) as fzbGov_body,sum(xztj.police_body) as police_body,sum(xztj.icommerce_body) as icommerce_body,sum(xztj.humanSecurity_body) as humanSecurity_body,sum(xztj.cityManage_body) as cityManage_body,";
//		HQL += " sum(xztj.land_body) as land_body,sum(xztj.houseBuilding_body) as houseBuilding_body,sum(xztj.plan_body) as plan_body,sum(xztj.traffic_body) as traffic_body,sum(xztj.judge_body) as judge_body,";
//		HQL += " sum(xztj.wbjOthers_body) as wbjOthers_body,sum(xztj.streetTown_body) as streetTown_body,";
		
		HQL += " sum(xztj.caseInvolvedCount) as caseInvolvedCount,sum(xztj.caseInvolvedSum) as caseInvolvedSum,sum(xztj.civilQuarrelSum) as civilQuarrelSum,sum(xztj.civilQuarrelSuccess) as civilQuarrelSuccess,sum(xztj.zatjCivilQuarrel) as zatjCivilQuarrel,";
		
		HQL += " sum(xztj.travelAccidentQuarrel) as travelAccidentQuarrel,";
		HQL += " sum(xztj.contractQuarrel) as contractQuarrel,";
		
		HQL += " sum(xztj.medicalQuarrel) as medicalQuarrel,";
		HQL += " sum(xztj.consumerProfitQuarrel) as consumerProfitQuarrel,";
		
		HQL += " sum(xztj.soilQuarrel) as soilQuarrel,";
		
		HQL += " sum(xztj.brandRightsQuarrel) as brandRightsQuarrel,";
		
		HQL += " sum(xztj.environmentPullutionQuarrel) as environmentPullutionQuarrel,";
					
		HQL += " sum(xztj.powerQuarrel) as powerQuarrel,sum(xztj.otherCivilQuarrel) as otherCivilQuarrel,sum(xztj.adminQuarrelTotal) as adminQuarrelTotal,sum(xztj.adminQuarrelSuccess) as adminQuarrelSuccess,sum(xztj.compensateCount) as compensateCount,sum(xztj.offsetCount) as offsetCount,";
		HQL += " sum(xztj.legalQuarrel) as legalQuarrel,sum(xztj.xzfyCount) as xzfyCount,";

		HQL += " sum(xztj.xzssCount) as xzssCount,sum(xztj.writtenProtocol) as writtenProtocol,sum(xztj.oralProtocol) as oralProtocol,sum(xztj.judicialCofirm) as judicialCofirm,sum(xztj.performCount) as performCount)";

						
		HQL += " from XztjStat xztj";
		HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		HQL += " and xztj.status = '1'";
		HQL += " and xztj.locbm >=100 ";
		HQL += " and xztj.locbm <=1800 ";
		HQL += " and xztj.totalOrNot is null ";//去除合计记录项
		
		List<Map> list = new LinkedList<Map>();
		list = super.find(HQL);
		
//		//数据库没记录就返回空
//		if(list.size()==0 && list.isEmpty()){
//			return null;
//		}
		
		XztjStat xztj = new XztjStat();
		xztj = getXztjStatObjectThroughConversion(list);
		
		//数据库没记录就返回空
		if(xztj.getTotalCaseCount() == null || xztj.getTotalCaseCount().equals("")){
			return null;
		}
		
		
		if(flag == true){
			xztj.setDivPerfectOrNot("1");//合计1统计完全
			xztj.setTotalOrNot("2");//合计1统计记录标识
			xztj.setId(id);//赋主键值
			
			xztj.setStatYear(String.valueOf(year));//赋统计年度
			xztj.setQuarterOfYear(String.valueOf(quarter));//赋统计季度
			xztj.setStatus("1");//赋状态为1
			xztj.setLocbm("1850");//赋状机构代码为特殊的1850
		}
		else{
			xztj.setDivPerfectOrNot("0");//统计不完全
			xztj.setTotalOrNot("2");//统计记录标识
			xztj.setId(id);//赋主键值
			
			xztj.setStatYear(String.valueOf(year));//赋统计年度
			xztj.setQuarterOfYear(String.valueOf(quarter));//赋统计季度
			xztj.setStatus("1");//赋状态为1
			xztj.setLocbm("1850");//赋状机构代码为特殊的2222
		}
		
//		List dataList=super.find(HQL);
//		
//		Long temp=null;
//		if (!dataList.isEmpty()){
//		     temp=(Long)dataList.get(0);
//		}
//		if(temp==null)
//			temp=new Long(0);
//		
//		if(temp.intValue()==17){
//			
//			
//			
//			return true;
//		}
		
		return xztj;
	}
	
	/*
	 * 判断某年度16个区县和市政府某个季度行政调解统计数据是否已录入并审核通过
	 */
	public XztjStat findXztjStatGatherOrNot2(int year,int quarter){
		boolean flag = yon17Records2(year,quarter);//判断是否已经有17条记录了
		String id = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + new Random().nextInt(1000);
		
		String HQL=" select new map(sum(xztj.totalCaseCount) as totalCaseCount,sum(xztj.tjSuccessCount) as tjSuccessCount, ";
//		HQL += " sum(xztj.fzbGov_body) as fzbGov_body,sum(xztj.police_body) as police_body,sum(xztj.icommerce_body) as icommerce_body,sum(xztj.humanSecurity_body) as humanSecurity_body,sum(xztj.cityManage_body) as cityManage_body,";
//		HQL += " sum(xztj.land_body) as land_body,sum(xztj.houseBuilding_body) as houseBuilding_body,sum(xztj.plan_body) as plan_body,sum(xztj.traffic_body) as traffic_body,sum(xztj.judge_body) as judge_body,";
//		HQL += " sum(xztj.wbjOthers_body) as wbjOthers_body,sum(xztj.streetTown_body) as streetTown_body,";
		
		HQL += " sum(xztj.caseInvolvedCount) as caseInvolvedCount,sum(xztj.caseInvolvedSum) as caseInvolvedSum,sum(xztj.civilQuarrelSum) as civilQuarrelSum,sum(xztj.civilQuarrelSuccess) as civilQuarrelSuccess,sum(xztj.zatjCivilQuarrel) as zatjCivilQuarrel,";
		
		HQL += " sum(xztj.travelAccidentQuarrel) as travelAccidentQuarrel,";
		HQL += " sum(xztj.contractQuarrel) as contractQuarrel,";
		
		HQL += " sum(xztj.medicalQuarrel) as medicalQuarrel,";
		HQL += " sum(xztj.consumerProfitQuarrel) as consumerProfitQuarrel,";
		
		HQL += " sum(xztj.soilQuarrel) as soilQuarrel,";
		
		HQL += " sum(xztj.brandRightsQuarrel) as brandRightsQuarrel,";
		
		HQL += " sum(xztj.environmentPullutionQuarrel) as environmentPullutionQuarrel,";
					
		HQL += " sum(xztj.powerQuarrel) as powerQuarrel,sum(xztj.otherCivilQuarrel) as otherCivilQuarrel,sum(xztj.adminQuarrelTotal) as adminQuarrelTotal,sum(xztj.adminQuarrelSuccess) as adminQuarrelSuccess,sum(xztj.compensateCount) as compensateCount,sum(xztj.offsetCount) as offsetCount,";
		HQL += " sum(xztj.legalQuarrel) as legalQuarrel,sum(xztj.xzfyCount) as xzfyCount,";

		HQL += " sum(xztj.xzssCount) as xzssCount,sum(xztj.writtenProtocol) as writtenProtocol,sum(xztj.oralProtocol) as oralProtocol,sum(xztj.judicialCofirm) as judicialCofirm,sum(xztj.performCount) as performCount)";

						
		HQL += " from XztjStat xztj";
		HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		HQL += " and xztj.status = '1'";
		HQL += " and xztj.locbm >=1900 ";
		HQL += " and xztj.locbm <=9300 ";
		HQL += " and xztj.totalOrNot is null ";//去除合计记录项
		
		List<Map> list = new LinkedList<Map>();
		list = super.find(HQL);
		
//		//数据库没记录就返回空
//		if(list.size()==0 && list.isEmpty()){
//			return null;
//		}
		
		XztjStat xztj = new XztjStat();
		xztj = getXztjStatObjectThroughConversion(list);
		
		//数据库没记录就返回空
		if(xztj.getTotalCaseCount() == null || xztj.getTotalCaseCount().equals("")){
			return null;
		}
		
		
		if(flag == true){
			xztj.setDivPerfectOrNot("1");//合计1统计完全
			xztj.setTotalOrNot("3");//合计1统计记录标识
			xztj.setId(id);//赋主键值
			
			xztj.setStatYear(String.valueOf(year));//赋统计年度
			xztj.setQuarterOfYear(String.valueOf(quarter));//赋统计季度
			xztj.setStatus("1");//赋状态为1
			xztj.setLocbm("9500");//赋状机构代码为特殊的1850
		}
		else{
			xztj.setDivPerfectOrNot("0");//统计不完全
			xztj.setTotalOrNot("3");//统计记录标识
			xztj.setId(id);//赋主键值
			
			xztj.setStatYear(String.valueOf(year));//赋统计年度
			xztj.setQuarterOfYear(String.valueOf(quarter));//赋统计季度
			xztj.setStatus("1");//赋状态为1
			xztj.setLocbm("9500");//赋状机构代码为特殊的2222
		}
		
//		List dataList=super.find(HQL);
//		
//		Long temp=null;
//		if (!dataList.isEmpty()){
//		     temp=(Long)dataList.get(0);
//		}
//		if(temp==null)
//			temp=new Long(0);
//		
//		if(temp.intValue()==17){
//			
//			
//			
//			return true;
//		}
		
		return xztj;
	}
	
	/*
	 * 判断某年度16个区县和市政府某个季度行政调解统计数据是否已录入并审核通过
	 */
	public XztjStat findXztjStatGatherOrNot(int year,int quarter){
		boolean flag = yon17Records(year,quarter);//判断是否已经有17条记录了
		String id = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + new Random().nextInt(1000);
		
		String HQL=" select new map(sum(xztj.totalCaseCount) as totalCaseCount,sum(xztj.tjSuccessCount) as tjSuccessCount, ";
//		HQL += " sum(xztj.fzbGov_body) as fzbGov_body,sum(xztj.police_body) as police_body,sum(xztj.icommerce_body) as icommerce_body,sum(xztj.humanSecurity_body) as humanSecurity_body,sum(xztj.cityManage_body) as cityManage_body,";
//		HQL += " sum(xztj.land_body) as land_body,sum(xztj.houseBuilding_body) as houseBuilding_body,sum(xztj.plan_body) as plan_body,sum(xztj.traffic_body) as traffic_body,sum(xztj.judge_body) as judge_body,";
//		HQL += " sum(xztj.wbjOthers_body) as wbjOthers_body,sum(xztj.streetTown_body) as streetTown_body,";
		
		HQL += " sum(xztj.caseInvolvedCount) as caseInvolvedCount,sum(xztj.caseInvolvedSum) as caseInvolvedSum,sum(xztj.civilQuarrelSum) as civilQuarrelSum,sum(xztj.civilQuarrelSuccess) as civilQuarrelSuccess,sum(xztj.zatjCivilQuarrel) as zatjCivilQuarrel,";
		
		HQL += " sum(xztj.travelAccidentQuarrel) as travelAccidentQuarrel,";
		HQL += " sum(xztj.contractQuarrel) as contractQuarrel,";
		
		HQL += " sum(xztj.medicalQuarrel) as medicalQuarrel,";
		HQL += " sum(xztj.consumerProfitQuarrel) as consumerProfitQuarrel,";
		
		HQL += " sum(xztj.soilQuarrel) as soilQuarrel,";
		
		HQL += " sum(xztj.brandRightsQuarrel) as brandRightsQuarrel,";
		
		HQL += " sum(xztj.environmentPullutionQuarrel) as environmentPullutionQuarrel,";
					
		HQL += " sum(xztj.powerQuarrel) as powerQuarrel,sum(xztj.otherCivilQuarrel) as otherCivilQuarrel,sum(xztj.adminQuarrelTotal) as adminQuarrelTotal,sum(xztj.adminQuarrelSuccess) as adminQuarrelSuccess,sum(xztj.compensateCount) as compensateCount,sum(xztj.offsetCount) as offsetCount,";
		HQL += " sum(xztj.legalQuarrel) as legalQuarrel,sum(xztj.xzfyCount) as xzfyCount,";

		HQL += " sum(xztj.xzssCount) as xzssCount,sum(xztj.writtenProtocol) as writtenProtocol,sum(xztj.oralProtocol) as oralProtocol,sum(xztj.judicialCofirm) as judicialCofirm,sum(xztj.performCount) as performCount)";

						
		HQL += " from XztjStat xztj";
		HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		HQL += " and xztj.status = '1'";
		HQL += " and xztj.totalOrNot is null ";//去除合计记录项
		
		List<Map> list = new LinkedList<Map>();
		list = super.find(HQL);
		
//		//数据库没记录就返回空
//		if(list.size()==0 && list.isEmpty()){
//			return null;
//		}
		
		XztjStat xztj = new XztjStat();
		xztj = getXztjStatObjectThroughConversion(list);
		
		//数据库没记录就返回空
		if(xztj.getTotalCaseCount() == null || xztj.getTotalCaseCount().equals("")){
			return null;
		}
		
		
		if(flag == true){
			xztj.setStatPerfectOrNot("1");//统计完全
			xztj.setTotalOrNot("1");//统计记录标识
			xztj.setId(id);//赋主键值
			
			xztj.setStatYear(String.valueOf(year));//赋统计年度
			xztj.setQuarterOfYear(String.valueOf(quarter));//赋统计季度
			xztj.setStatus("1");//赋状态为1
			xztj.setLocbm("9999");//赋状机构代码为特殊的2222
		}
		else{
			xztj.setStatPerfectOrNot("0");//统计不完全
			xztj.setTotalOrNot("1");//统计记录标识
			xztj.setId(id);//赋主键值
			
			xztj.setStatYear(String.valueOf(year));//赋统计年度
			xztj.setQuarterOfYear(String.valueOf(quarter));//赋统计季度
			xztj.setStatus("1");//赋状态为1
			xztj.setLocbm("9999");//赋状机构代码为特殊的2222
		}
		
//		List dataList=super.find(HQL);
//		
//		Long temp=null;
//		if (!dataList.isEmpty()){
//		     temp=(Long)dataList.get(0);
//		}
//		if(temp==null)
//			temp=new Long(0);
//		
//		if(temp.intValue()==17){
//			
//			
//			
//			return true;
//		}
		
		return xztj;
	}
	
	
	public XztjStat getXztjStatObjectThroughConversion(List<Map> list){
		Iterator<Map> it = list.iterator();
		XztjStat xztj = new XztjStat();
		while(it.hasNext()){
			Map tmpMap = it.next();
			
			xztj.setTotalCaseCount((String)tmpMap.get("totalCaseCount"));
			xztj.setTjSuccessCount((String)tmpMap.get("tjSuccessCount"));
			xztj.setCaseInvolvedCount((String)tmpMap.get("caseInvolvedCount"));
			xztj.setCaseInvolvedSum((String)tmpMap.get("caseInvolvedSum"));
			xztj.setCivilQuarrelSum((String)tmpMap.get("civilQuarrelSum"));
			xztj.setCivilQuarrelSuccess((String)tmpMap.get("civilQuarrelSuccess"));
			
//			xztj.setFzbGov_body((String)tmpMap.get("fzbGov_body"));
//			xztj.setPolice_body((String)tmpMap.get("police_body"));
//			xztj.setIcommerce_body((String)tmpMap.get("icommerce_body"));
//			xztj.setHumanSecurity_body((String)tmpMap.get("humanSecurity_body"));
//			xztj.setCityManage_body((String)tmpMap.get("cityManage_body"));
//			
//			xztj.setLand_body((String)tmpMap.get("land_body"));
//			xztj.setHouseBuilding_body((String)tmpMap.get("houseBuilding_body"));
//			xztj.setPlan_body((String)tmpMap.get("plan_body"));
//			xztj.setTraffic_body((String)tmpMap.get("traffic_body"));
//			xztj.setJudge_body((String)tmpMap.get("judge_body"));
//			
//			xztj.setWbjOthers_body((String)tmpMap.get("wbjOthers_body"));
//			xztj.setStreetTown_body((String)tmpMap.get("streetTown_body"));
			
			xztj.setZatjCivilQuarrel((String)tmpMap.get("zatjCivilQuarrel"));
			xztj.setTravelAccidentQuarrel((String)tmpMap.get("travelAccidentQuarrel"));
			xztj.setContractQuarrel((String)tmpMap.get("contractQuarrel"));
			xztj.setMedicalQuarrel((String)tmpMap.get("medicalQuarrel"));
			xztj.setConsumerProfitQuarrel((String)tmpMap.get("consumerProfitQuarrel"));
			xztj.setSoilQuarrel((String)tmpMap.get("soilQuarrel"));
			
			xztj.setBrandRightsQuarrel((String)tmpMap.get("brandRightsQuarrel"));
			xztj.setEnvironmentPullutionQuarrel((String)tmpMap.get("environmentPullutionQuarrel"));
			xztj.setPowerQuarrel((String)tmpMap.get("powerQuarrel"));
			xztj.setOtherCivilQuarrel((String)tmpMap.get("otherCivilQuarrel"));
			xztj.setAdminQuarrelTotal((String)tmpMap.get("adminQuarrelTotal"));
			xztj.setAdminQuarrelSuccess((String)tmpMap.get("adminQuarrelSuccess"));
			xztj.setCompensateCount((String)tmpMap.get("compensateCount"));
			xztj.setOffsetCount((String)tmpMap.get("offsetCount"));
			
			xztj.setLegalQuarrel((String)tmpMap.get("legalQuarrel"));
			xztj.setXzfyCount((String)tmpMap.get("xzfyCount"));
			xztj.setXzssCount((String)tmpMap.get("xzssCount"));
			xztj.setWrittenProtocol((String)tmpMap.get("writtenProtocol"));
			xztj.setOralProtocol((String)tmpMap.get("oralProtocol"));
			xztj.setJudicialCofirm((String)tmpMap.get("judicialCofirm"));
			xztj.setPerformCount((String)tmpMap.get("performCount"));
			
		}
		return xztj;
	}
	
	/*
	 * 是否已经有17条记录
	 */
	public boolean yon17Records(int year,int quarter){
	    String HQL =  " select count(*)";
		HQL += " from XztjStat xztj";
		HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		HQL += " and xztj.status = '1'";
		HQL += " and xztj.totalOrNot is null ";//去除合计记录项
		
		
		List dataList=super.find(HQL);
		
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		
		if(temp.intValue()==60){//区县和委办局总数		
			return true;
		}
		
		return false;
	}
	
	/*
	 * 合计1是否已经有16条记录
	 */
	public boolean yon17Records1(int year,int quarter){
	    String HQL =  " select count(*)";
		HQL += " from XztjStat xztj";
		HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		HQL += " and xztj.status = '1'";
		HQL += " and xztj.locbm >=100 ";
		HQL += " and xztj.locbm <=1800 ";
		
		HQL += " and xztj.totalOrNot is null ";//去除合计记录项
		
		
		List dataList=super.find(HQL);
		
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		
		if(temp.intValue()==16){//区县和委办局总数		
			return true;
		}
		
		return false;
	}
	
	/*
	 * 合计2是否已经有43条记录
	 */
	public boolean yon17Records2(int year,int quarter){
	    String HQL =  " select count(*)";
		HQL += " from XztjStat xztj";
		HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		HQL += " and xztj.status = '1'";
		HQL += " and xztj.locbm >=1900 ";
		HQL += " and xztj.locbm <=9300 ";
		
		HQL += " and xztj.totalOrNot is null ";//去除合计记录项
		
		
		List dataList=super.find(HQL);
		
		Long temp=null;
		if (!dataList.isEmpty()){
		     temp=(Long)dataList.get(0);
		}
		if(temp==null)
			temp=new Long(0);
		
		if(temp.intValue()==43){//区县和委办局总数		
			return true;
		}
		
		return false;
	}
	
	/*
	 * 是否已经存在完全的记录
	 */
	public boolean yonPerfectRecord(int year,int quarter){
	    String HQL =  "";
		HQL += " from XztjStat xztj";
		HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		HQL += " and xztj.statPerfectOrNot = '1'";//统计完全与否标识
		
		List dataList=super.find(HQL);
		
		if(dataList.size() != 0 && !dataList.isEmpty()){
			return true;
		}
		
		return false;
	}
	
	/*
	 * 合计1是否已经存在完全的记录
	 */
	public boolean yonPerfectRecord1(int year,int quarter){
	    String HQL =  "";
		HQL += " from XztjStat xztj";
		HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		HQL += " and xztj.totalOrNot = '2'";//合计1标识
		HQL += " and xztj.divPerfectOrNot = '1'";//合计1完全标识
		
		List dataList=super.find(HQL);
		
		if(dataList.size() != 0 && !dataList.isEmpty()){
			return true;
		}
		
		return false;
	}
	
	/*
	 * 合计2是否已经存在完全的记录
	 */
	public boolean yonPerfectRecord2(int year,int quarter){
	    String HQL =  "";
		HQL += " from XztjStat xztj";
		HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		HQL += " and xztj.totalOrNot = '3'";//合计2标识
		HQL += " and xztj.divPerfectOrNot = '1'";//合计2完全标识
		
		List dataList=super.find(HQL);
		
		if(dataList.size() != 0 && !dataList.isEmpty()){
			return true;
		}
		
		return false;
	}
	
	/*
	 * 删除已有总合计xztj记录
	 */
	public void deleteXztjStatByYearAndQuarter(int year,int quarter){
	    String HQL =  "";
		HQL += " delete from XztjStat xztj";
		HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		HQL += " and xztj.statPerfectOrNot = '0'";
		
		super.deleteAll(HQL);
	}
	
	/*
	 * 删除已有合计1xztj记录
	 */
	public void deleteXztjStatByYearAndQuarter1(int year,int quarter){
	    String HQL =  "";
		HQL += " delete from XztjStat xztj";
		HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		HQL += " and xztj.totalOrNot = '2'";
		HQL += " and xztj.divPerfectOrNot = '0'";
		
		super.deleteAll(HQL);
	}
	
	/*
	 * 删除已有合计2xztj记录
	 */
	public void deleteXztjStatByYearAndQuarter2(int year,int quarter){
	    String HQL =  "";
		HQL += " delete from XztjStat xztj";
		HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		HQL += " and xztj.totalOrNot = '3'";
		HQL += " and xztj.divPerfectOrNot = '0'";
		
		super.deleteAll(HQL);
	}
	
	/*
	 * 获取所有的记录（根据年度和季度)
	 */
	public List<XztjStat> findAllRecordsByYearAndQuarter(String year,String quarter){
		 String HQL =  "";
		 HQL += " from XztjStat xztj";
		 HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		 HQL += " and xztj.status = '1'";
		 HQL += " order by xztj.locbm";
		 
		 List<XztjStat> dataList=super.find(HQL);
		 
		 return dataList;
	}
	
	/*
	 * 获取已上报区县数量（根据年度和季度)
	 */
	public String findCountyCountRecordsByYearAndQuarter(String year,String quarter){
		 String HQL =  "";
		 HQL += " from XztjStat xztj";
		 HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		 HQL += " and xztj.status = '1'";
		 HQL += " and xztj.totalOrNot is null ";//去除合计记录项
		 HQL += " and to_number(xztj.locbm) > 0 ";//区县locbm区间
		 HQL += " and to_number(xztj.locbm) < 1850 ";//区县locbm区间
		 
		 HQL += " order by xztj.locbm";
		 
		 List<XztjStat> dataList=super.find(HQL);
		 
		 return dataList.size() + "";
	}
	
	/*
	 * 获取已上报市委办局数量（根据年度和季度)
	 */
	public String findWbjCountRecordsByYearAndQuarter(String year,String quarter){
		 String HQL =  "";
		 HQL += " from XztjStat xztj";
		 HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";
		 HQL += " and xztj.status = '1'";
		 HQL += " and xztj.totalOrNot is null ";//去除合计记录项
		 HQL += " and to_number(xztj.locbm) > 1850 ";//市委办局locbm区间
		 HQL += " and to_number(xztj.locbm) < 9500 ";//市委办局locbm区间
		 
		 HQL += " order by xztj.locbm";
		 
		 List<XztjStat> dataList=super.find(HQL);
		 
		 return dataList.size() + "";
	}
	
	/*
	 * ajax查重
	 */
	public boolean checkExistsYon(String code,String year,String quarter){
		String HQL =  "";
		 HQL += " from XztjStat xztj";
		 HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + quarter +"'";

		 HQL += " and xztj.locbm ='"+code+"'";
		 
		 List<XztjStat> dataList=super.find(HQL);
		 
		 if(dataList.size() !=0 && !dataList.isEmpty()){
			 return true;
		 }
		 return false;
	}
	
	/*
	 * 是否存在十六个区县or市政府、市委办局里面
	 */
	public Boolean countyRangeExistsOrNot(String deptNO){                                                                              /*区县、委办局分隔线*/																																																																					//市商务委
		String[] countyArray = {"0000","0100","0200","0500","0600","0700","0800","0900","1000","1100","1200","1300","1400","1500","1600","1700","1800","1900","2000","2100","2200","2300","2500","2600","2700","2900","3000","3100","3200","3300","3400","3500","3600","3800","3900","4100","4300","4400","4500","4600","4700","5100","5200","5300","5400","5500","5600","5700","5800","5900","6000","6200","6900","7200","7400","8300","8700","9000","9200","9300"};
		for(int i=0;i<countyArray.length;i++){
			if(countyArray[i].equals(deptNO)){
				return true;
			}
		}
		return false;
	} 
	
	
	/*
	 * 根据机构代码返回市政府或区县名称
	 */
	public String returnDeptNameBasedOnCode(String deptNO){
		String[][] countyArray = {{"市法制办","0000"},{"东城区","0100"},{"西城区","0200"},{"朝阳区","0500"},{"海淀区","0600"},{"丰台区","0700"},{"石景山区","0800"},{"门头沟区","0900"},{"房山区","1000"},{"通州区","1100"},{"顺义区","1200"},{"大兴区","1300"},{"昌平区","1400"},{"平谷区","1500"},{"怀柔区","1600"},{"密云县","1700"},{"延庆县","1800"},{"市发改委","1900"},{"市教委","2000"},{"市科委","2100"},{"市民委","2200"},{"市公安局","2300"},{"市民政局","2500"},{"市司法局","2600"},{"市财政局","2700"},{"市人社局","2900"},{"市国土局","3000"},{"市规划委","3100"},{"市住建委","3200"},{"市市政市容委","3300"},{"市交通委","3400"},{"市水务局","3500"},{"市农委","3600"},{"市文化局","3800"},{"市卫计委","3900"},{"市审计局","4100"},{"市国资委","4300"},{"市地税局","4400"},{"市工商局","4500"},{"市质监局","4600"},{"市环保局","4700"},{"市新闻出版广电局","5100"},{"市文物局","5200"},{"市体育局","5300"},{"市统计局","5400"},{"市园林绿化局","5500"},{"市食药监督局","5600"},{"市安全监管局","5700"},{"市旅游委","5800"},{"市政府侨办","5900"},{"市民防局","6000"},{"市城管执法局","6200"},{"市文化执法总队","6900"},{"市知识产权局","7200"},{"公积金管理中心","7400"},{"开发区管委会","8300"},{"市商务委","8700"},{"市经信委","9000"},{"市信访办","9200"},{"市文资办","9300"}};
		
		for(int i=0;i<countyArray.length;i++){
			
				if(countyArray[i][1].equals(deptNO)){
					return countyArray[i][0];
				
				}
		}
		
		return "";
	}

	@Override
	public void deleteXztjRecordById(String id) {
		// TODO Auto-generated method stub
		String HQL="";
		HQL = " delete from XztjStat xztj";
		HQL +=" where xztj.id = '"+id+"'";
		super.deleteAll(HQL);
	}

	@Override
	public String findNewPreAuditXztjCountByLocbm(String code) {
		// TODO Auto-generated method stub
		String HQL="";
		HQL = " from XztjStat xztj";
		HQL +=" where xztj.locbm = '"+code+"'";
		HQL +=" and xztj.status = '0'";
		
		List<XztjStat> dataList = super.find(HQL);
		
		return String.valueOf(dataList.size());
	}	
	
	/*
	 * 获取所有的记录（根据年度和季度)仅作为数字说明
	 */
	public List<List<String>> findAllRecordsByYearAndQuarterWithout3Totals(String year){
		 List<List<String>> returnList = new ArrayList<List<String>>();
		
		 for(int i=1; i<=5; i++){
			 List<String> dealList;
			 
			 String HQL =  "";
			 HQL += " from XztjStat xztj";
			 HQL += " where xztj.statYear = '" + year +"' and xztj.quarterOfYear = '" + i +"'";
			 HQL += " and xztj.status = '1'";
			 HQL += " and xztj.totalOrNot is null ";//去除合计记录项
			 		 
			 List<XztjStat> dataList=super.find(HQL);
			 
			 dealList = new ArrayList<String>();
			 
			 if(dataList.isEmpty() && dataList.size()==0){
				 dealList.add(year);
				 
				 if(i==1){
				 	dealList.add("第一季度");
				 }
				 else if(i==2){
					 dealList.add("第二季度");
				 }else if(i==3){
					 dealList.add("第三季度");
				 }else if(i==4){
					 dealList.add("第四季度");
				 }else{
					 dealList.add("全年");
				 }
				 
				 
				 dealList.add("0");
				 dealList.add("60");
				 
				 returnList.add(dealList);
			 }
			 else{
				 dealList.add(year);
				 
				 if(i==1){
					 dealList.add("第一季度");
				 }
				 else if(i==2){
					 dealList.add("第二季度");
				 }else if(i==3){
					 dealList.add("第三季度");
				 }else if(i==4){
					 dealList.add("第四季度");
				 }else{
					dealList.add("全年");
				 }
				 
				 dealList.add(String.valueOf(dataList.size()));
				 dealList.add(String.valueOf(60-dataList.size()));
				 
				 returnList.add(dealList);
			 }
			 
		 }
		
		 
		 
		 return returnList;
	}

	@Override
	public XzfyApp findXzfyAppById(String id) {
		// TODO Auto-generated method stub
		String HQL = "";
		HQL += " from XzfyApp xzfy";
		HQL += " where 1 = 1 ";
		HQL+=  " and xzfy.app_id='"+id+"'";
		HQL += " order by xzfy.id ";
		
		List dataList = super.find(HQL);
		XzfyApp xzfy = null;
		if (!dataList.isEmpty()) {			
			xzfy = (XzfyApp)dataList.get(0);
		}
		return xzfy;
	}

}
