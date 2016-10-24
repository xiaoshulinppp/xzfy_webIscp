package com.taiji.waiwangTB;

import java.rmi.RemoteException;
import java.util.List;


import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.XzfyService;

import localhost.zxfy.services.datesent.DatesentProxy;






public class Check_Tb extends QuartzJobBean {

	private int timeout;
	private static int i = 0;
	XzfyService xzfyService = (XzfyService) SpringUtil.getApplicationContext()
			.getBean("xzfyService");

	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {

		List<XzfyInfo> xzfyInfo1 = xzfyService
				.getXzfyInfoListByStatechange("0");

		DatesentProxy da = new DatesentProxy();
		System.out.println("------------");
		for (XzfyInfo xzfyInfo : xzfyInfo1) {
			String c3;
			try {
				
				
				 c3=da.updateStatus(
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
			} catch (RemoteException e) {
				e.printStackTrace();
				continue;
			}
		}
	}
//	public static void testQuartzJob(XzfyService xzfyService){
//
//
//		List<XzfyInfo> xzfyInfo1 = xzfyService
//				.getXzfyInfoListByStatechange("0");
//
//		DatesentProxy da = new DatesentProxy();
//		System.out.println("------------");
//		for (XzfyInfo xzfyInfo : xzfyInfo1) {
//			String c3;
//			try {
//				c3 = da.updateStatus(xzfyInfo.getXzfyInfo2id(), xzfyInfo
//						.getStatus());
//				// 返回值全部用大写“SUCCESS”
//				// 同步标志位，外网的改自己的表tb_flag，内网的改自己的xzfyInfo表的tb_flag，不该同一张表，消除影响。
//				if (c3.equals("SUCCESS")) {
//					// 行政复议表增加同步标志位字段。statechange
//					xzfyInfo.setStatechange("1");
//				} else {
//					xzfyInfo.setStatechange("0");
//				}
//			} catch (RemoteException e) {
//				e.printStackTrace();
//				continue;
//			}
//		}
//	
//	}

	public void setTimeout(int timeout) {

		this.timeout = timeout;

	}
//	public static void main(String[] args) {
//		Check_Tb tb = new Check_Tb();
//		tb.testQuartzJob(tb.xzfyService);
//	}
}
