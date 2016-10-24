package com.dataSync.util;

import com.dataSync.model.AppDto;
import com.taiji.fzb.domain.XzfyApp;

public class AppDtoToXzfyApp {
	public static void dtoToModel(AppDto appDto, XzfyApp xzfyApp) {
		xzfyApp.setApp_name(appDto.getAppName());
		xzfyApp.setApp_id(appDto.getAppId());
		xzfyApp.setIsdeputy(appDto.getIsDeputy());
		xzfyApp.setMobile(appDto.getMobile());
		xzfyApp.setEmail(appDto.getEmail());
		xzfyApp.setAddress(appDto.getAddress());
		xzfyApp.setMail_address(appDto.getMailAddress());
		xzfyApp.setSexy(appDto.getSexy());
		xzfyApp.setProxytype(appDto.getProxyType());
		xzfyApp.setPostcode(appDto.getPostCode());
		xzfyApp.setTelephone(appDto.getTelephone());
		xzfyApp.setIslink(appDto.getIsLink());
		xzfyApp.setDeputyName(appDto.getDeputyName());
		xzfyApp.setDeputyType(appDto.getDeputyType());
		xzfyApp.setOtherType(appDto.getOtherType());
	}
}
