package com.taiji.datum.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedListAction;
import com.taiji.datum.model.AppDatum;
import com.taiji.datum.service.DatumService;
import com.taiji.system.domain.DictItem;
import com.taiji.user.domain.User;

public class DatumListAction extends ProtectedListAction{
	private static final Log log = LogFactory.getLog(DatumListAction.class);
	private static final String TABLE_NAME = "APP_DATUM";

	public List listDisplay=new ArrayList();
	public Map mapDisplay=new TreeMap();
	public PaginationSupport list;
	public DatumService datumService;
	public int totalnum;
	public int publicnum;
	public List dictList;
	public String zlmc;
	public String zlnx;
	public String gjc;
	public String scr;
	public String zy;

	public DatumService getDatumService() {
		return datumService;
	}

	public void setDatumService(DatumService datumService) {
		this.datumService = datumService;
	}
	
	public String gotoPersonalList() throws Exception{
		User user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		int userid = user.getId();
		list = datumService.getPersonalList(getPageNum(), 10,userid);
		totalnum = list.getTotalCount();
		publicnum = datumService.getPublicedNumber(userid);
		listDisplay=DisplayInfoUtil.getDisplayInfo();
		mapDisplay.put(AppDatum.class.getName(),listDisplay);
		getDisplayInfo().setShowMultiList(mapDisplay);
		String redFlag = "gxzt=1"; 
		this.setTagRedKey(redFlag);
		this.wrapResult(getTableName(),list,AppDatum.class.getName());

		return SUCCESS;
	}
	
	public String gotoPublicList()throws Exception{
		dictList = datumService.getDictList(122);
		list = datumService.getPublicList(getPageNum(), 10,zlmc,zlnx,gjc,scr,zy);
		totalnum = list.getTotalCount();
		listDisplay=DisplayInfoUtil.getDisplayInfo1();
		mapDisplay.put(AppDatum.class.getName(),listDisplay);
		getDisplayInfo().setShowMultiList(mapDisplay);
		this.wrapResult(getTableName(),list,AppDatum.class.getName());
		return SUCCESS;
	}
	
	public String getDicName(String DicName ,String value) {
		List tempDictItems = this.coreService
				.find("from DictItem t where t.dict.id in (select a.id from Dictionary a where a.abbr='"+DicName+"')");

		for (int i = 0; i < tempDictItems.size(); i++) {
			DictItem d = (DictItem) tempDictItems.get(i);
			if (!"".equals(d.getValue()) && !"".equals(value)) {
				if (d.getValue().equals(value)) {
					return d.getName();
				}
			}
		}

		return "未分类";
	}

	@Override
	public Class getPersistentClass() {
		return AppDatum.class;
	}



	@Override
	public String getTableName() {
		return TABLE_NAME;
	}



	@Override
	public PaginationSupport getInitResult() {
		// TODO Auto-generated method stub
		return null;
	}


}
