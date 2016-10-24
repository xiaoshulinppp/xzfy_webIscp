package com.taiji.waiwangTB;



import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzfyService;
import com.taiji.fzb.service.impl.XzfyServiceImpl;
import com.taiji.waiwangTB.domain.XzfyInfo2;

import localhost.zxfy.services.datesent.DatesentProxy;
import net.sf.json.JSONObject;

import java.rmi.RemoteException;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.WebApplicationContextUtils;

@Service  
public class dateTransfer_nei  extends  CoreServiceImpl{
	
	XzfyService xzfyService = (XzfyService) SpringUtil.getApplicationContext().getBean("xzfyService");
	//private XzfyService xzfyService = null; // 模板业务层方法
	//private RecordService recordService = null; // 模板业务层方法
	
	//ApplicationContext ctx = new ClassPathXmlApplicationContext("/WEB-INF/classes/applicationContext.xml];");
//	FileSystemXmlApplicationContext ac=new FileSystemXmlApplicationContext("/WebRoot/WEB-INF/classes/applicationContext.xml");
	
//	XzfyService xzfyService = (XzfyService) ac.getBean("xzfyService");
	//XzfyService xzfyService = new  XzfyServiceImpl();
	//XzfyService xzfyService = (XzfyService) MyApplicationContextUtil.getContext().getBean("xzfyService");
	
	//RecordService recordService = (RecordService) MyApplicationContextUtil.getContext().getBean("recordService");
	
	
	//ApplicationContext ac1 = WebApplicationContextUtils.getRequiredWebApplicationContext(ServletContext sc);
	//ApplicationContext ac2 = WebApplicationContextUtils.getWebApplicationContext(null, "applicationContext.xml");
	//ac2.getBean("xzfyService");
	//ac2.getBean("beanId");
	

	public String saveJSON1 ( ) {
		return "success";
		
		
	}
	
	public String saveJSON (String cc  ) {
		
		System.out.println(cc);
		//XzfyInfo2 xzfyInfo1 = this.recordService.getXzfyById_w("00002");
		
		// JSONObject json = JSONObject.fromObject(xzfyInfo1);//将java对象转换为json对象
		// String str = json.toString();//将json对象转换为字符串
	//{"casenum":"","xzfy_requset":"1撤销该具体行政行为","secondSubmitDate":"","receive_address":"","delay_reason":"","refer":"","pizhunren3":"","jdGzContent":"","pizhunren1":"","pizhunren2":"","casetype2":"","jdbl_flag":"","app_advice_type":"","laixin_post":"","isBuzheng":"","breakReport":"","tiaojie_result":"","buzheng_from":"2013年9月16日（阿斯顿发）","isdelay_from":"","adviseFile":"","receive_real_date":"2016-07-18","songdaquerenFlag":"","user4_id":"","tiaojiejilu":"","tb_time":"","admit2":"","admit1":"","caseyear":"","nationMoneyDetail":"","app_show":"","resarch":"","finish_date":"","app_type":"1","advise":"","user3_id":"","user2_id":"","tiaojiejilu1":"","reception2":"","zhongzhispdate":"","jdFileContent":"","firstSubmitResult":"","zhidaosj":"","proxy":"","tiaojie_from":"2016-07-18","break_right":"北京市人民政府","check_name":"","tiaojie_count":"","keyword2":"","keyword3":"","endFile":"","tAppDeptId":"1500","ismoney":"否","istingzheng":"","dftzstatus":"","matter_type":"0","user1_name":"","jianyi_file":"","receive_type":"1","xwnum":"阿斯顿发","jddetail":"","laixin_tel":"","content_abstract":"申请人不服北京市平谷区人民政府阿斯顿发（阿斯顿发）","hasanshen":"","fuyifs":"","xzfy_requset_retail":"","issame_detail":"","issame":"","lian_date":"","execute_date":"","xwname":"阿斯顿发","tb_flag":"","agent_address":"","pizhunren":"","opinion":"","jiansuom":"122233331442492","renCount":"1","is_commit":"","shishiyuly":"按时发生","admit2_id":"","zhize":"","is_prof":"0","agent":"0","app_advice_detail":"","delayAdvice":"","admit1_id":"","pifuyijian3":"","isMany":"否","agent_name":"","pifuyijian2":"","pifuyijian1":"","buzhengDelay":"","trailMode":"","laixin_name":"","bzTongzhiriqi":"","defendant_type":"5","defendant_name":"北京市平谷区人民政府","jiedai_file":"","caseindex":"201600000037","bzAdvice":"","appdetail":"( 1 )刘全成，男，身份证号：130627198912084613，送达地址：松岛枫，邮编：444333，电话：22223333； 共计  1 人","shouju_flag":"","hastingzheng":"","bzBuqiriqi":"","user1_id":"","jaAdvice":"","yijian_file":"","tjzfzh":"","lian_real_date":"","jieanspdate":"","buzhengContentType":"","casestatus":"","money_detail":"","tPoliceIsParade":"0","isdelay":"","casetype":"","fenpei_name":"","defendant_real_name":"","agent_date":"","other_commit":"","user3_name":"","isstop":"","receiveAnswerDate":"","agentDetail_cang":"","guanli1":"","guanli3":"","guanli2":"","menu":"","require_fy":"阿斯顿发（阿斯顿发）；知道时间：2013年9月16日（阿斯顿发）；共1件","deputy_show":"","appdetail_cang":"刘全成$男$身份证号130627198912084613$送达地址松岛枫$邮编444333$电话22223333&","third":"","ismanage":"0","buzhengspdate":"","bzTongzhifangshi":"","bztz_flag":"","check_status":"0","issafe":"","jdBzContent":"","mid_tiaojie":"","jdRenshu":"","third_agent":"","yuedusj":"","opinionFile":"","xzfy_org":"省部级行政机关","user4_name":"","breakTo":"","app_type1":"","app_type2":"","isstop_from":"","buzheng_to":"","check_file":"","matter_detail":"","yanzhengsj":"12223333","laixin_address":"","user2_name":"","remark":"","delayTo":"","jieanwenshu":"","huifuspdate":"","checkMail":"1212@qq.com","isdelay_to":"","stadardResult":"","manage_type":"","caseorg":"0000","require_fy_cang":"阿斯顿发$阿斯顿发$2013-9-16$阿斯顿发&","dbrDetail":"","stop_reason":"","receive_date":"","isstop_to":"","stop_detail":"","isBreak":"","handleReason":"","status":"1","hasdiaocha":"","money_file":"暗示法士大夫","pifuyijian":"","referother":"","refer2":"","receive_detail":"","yanqispdate":"","breakAdvice":"","ischeck":"否","agentDetail":"","fenpei_id":"","isBuzhengshenpi":"","has_tingzheng":"","tiaojie_to":"","istiaojie":"","pizhunriqi":"","id":"20160718144249255790","firstSubmitDate":"","finish_type":"","duty":"","currentuser":"0000","isfront":"","bsqrSpecial":"","secondSubmitResult":"","finishBreakType":"","delayReport":"","zl_time":"","is_prof_detail":"","finish_real_date":"","pizhunriqi2":"","pizhunriqi1":"","safeContent":"","check_id":"","keyword":"","laAdvice":"","time_show":"","hastiaojie":"","delay_detail":"","reception":"","nationMoney":"","otherTrailMode":"","lianspdate":"","condition_type":"","sentAnswerDate":"","isAnswer":""}

		
		JSONObject obj = ((JSONObject) new JSONObject()).fromObject(cc);//将json字符串转换为json对象
		//将json对象转换为java对象
		XzfyInfo2 xzfyInfo2 = (XzfyInfo2)JSONObject.toBean(obj,XzfyInfo2.class);//将建json对象转换为Person对象
		
		//xzfyInfo2.setId("3333377");
		xzfyInfo2.setAppdetail(xzfyInfo2.getAppdetail().replace("<br/>", ""));
		xzfyInfo2.setAgentDetail(xzfyInfo2.getAgentDetail().replace("<br/>", ""));
		xzfyInfo2.setRequire_fy(xzfyInfo2.getRequire_fy().replace("<br/>", ""));
		
		//xzfyInfo2.getAppdetail().replaceAll(regex, replacement)
		//XzfyInfo2 xzfyInfo3 =xzfyService.getXzfyInfo2ById(xzfyInfo2.getId());
		/*String HQL = "";
		HQL += " delete from XzfyInfo2 xzfyinfo2";
		HQL += " where 1 = 1";
		HQL += " and xzfyinfo2.id = '" + xzfyInfo2.getId()+"'";*/
		xzfyService.deleteXzfyInfo2ById(xzfyInfo2.getId());
		
		
		xzfyService.save(xzfyInfo2);
		
		return "SUCCESS";
		
	}
	
	public String saveTest ( String cc ) {
		
		System.out.println("接受参数"+cc);
		return "服务器返回数据："+cc;
		
	}
        public void check_status (  ) throws RemoteException {
		
        //所有的状态位改变后面加如下代码。。//所有字段xzfyInfo2ID有值的，且Statechange为0 的就把值往外送一边
        	List<XzfyInfo> xzfyInfo1=xzfyService.getXzfyInfoListByStatechange("0");
        	
        	DatesentProxy da =new DatesentProxy();  
        	for (XzfyInfo xzfyInfo:xzfyInfo1){
        		String c3=da.updateStatus(
						xzfyInfo.getXzfyInfo2id(),        //1案件id
						xzfyInfo.getReceive_real_date(), //2保存时间
						xzfyInfo.getReceive_date(),//3收案时间
						xzfyInfo.getIsBuzheng(),//4是否补正
						xzfyInfo.getBzTongzhiriqi(),//5通知补正时间
						xzfyInfo.getBzBuqiriqi(),//6补正时间
						xzfyInfo.getLian_date(),//7立案时间
						xzfyInfo.getTjzfzh(),//8案件号
						xzfyInfo.getIsstop(),// 9是否中止
						xzfyInfo.getIsstop_from(),//10中止时间
						xzfyInfo.getBreakTo(),//11恢复审理日期
						
						xzfyInfo.getIsdelay(),//12延期审理时间
					
						xzfyInfo.getFinish_date(),//13结案日期
						xzfyInfo.getFinish_type());//14审理结果
						//finish_type
						//finish_date
						//newXzfyInfo.getStatus(),
						//newXzfyInfo.getCheck_status()
				//返回值全部用大写“SUCCESS”
    			if(c3.equals("SUCCESS")){
    				
    				//行政复议表增加同步标志位字段。statechange
    				xzfyInfo.setStatechange("1");
    			}else{
    				xzfyInfo.setStatechange("0");
    				
    			}
        		
        		
        		
        	}
		
	}
        
        public void dingshi(){
        	
        	System.out.println("dingshi ceshi !!");
        }
		
	
}
