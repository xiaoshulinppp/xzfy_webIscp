package com.taiji.waiwangTB;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/** 
 * @function 订单计算 定时任务
 *                1、试制订单定时计算
 *                    a、车型拆分成零件需求
 *                    b、需求生成订单明细
 *                2、试装订单定时计算
 *                3、工料废订单定时计算
 * @author zhoujian
 * @date 2014/10/29
 */
@Component
public class Quartz {
     
    
    public String a=null;
     
  
    @Scheduled(cron="0/5 * * * * *") 
    public void convertVehicleToParts() {
        System.out.println("定时执行了11111111");
    }
    @Scheduled(cron="0/5 * * * * *") 
    public void convertVehicleToParts2() {
        System.out.println("定时执行了2222222");
    }

	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}
     
     
}