package com.dataSync;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dataSync.jobSchedule.MyJob;
import com.dataSync.model.AppDto;
import com.dataSync.model.ArchiveDto;
import com.dataSync.model.InfoDto;
import com.dataSync.service.Services;

public class Client {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		Services services = (Services) context.getBean("client");
		List<InfoDto> list  = services.anJianTongbu().getInfoDtos();
		List<AppDto> appDtos = services.anJianTongbu().getAppDtos();
		List<ArchiveDto> archiveDtos = services.anJianTongbu().getArchiveDtos();
		System.out.println(list.size());
		System.out.println(appDtos.size());
		System.out.println(archiveDtos.size());
	}
}
