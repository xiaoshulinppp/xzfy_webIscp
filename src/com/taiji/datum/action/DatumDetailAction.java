package com.taiji.datum.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.datum.model.AppDatum;
import com.taiji.datum.model.AppDatumFile;
import com.taiji.datum.service.DatumService;
import com.taiji.system.domain.DictItem;
import com.taiji.user.domain.User;

public class DatumDetailAction extends ProtectedDetailAction{
	
	private static final Log log = LogFactory.getLog(DatumDetailAction.class);
	
	public String userName = "";
	public String currenttime = "";
	public DatumService datumService;
	public AppDatum appDatum;
	public AppDatum appDatumNew;
	public AppDatumFile appDatumFile;
	public List dictList;
	public int entityid;
	public File[] files;
	public String[] filesFileName;
	public InputStream is;
	
	/*public void setEntityId(Integer entityid) {
		super.setEntityId(entityid);
	}*/
	public void setAppDatum(AppDatum appDatum) {
		//this.appDatum = appDatum;
		setEntity(appDatum);
	}
	public AppDatum getAppDatum() {
		return (AppDatum) getEntity();
	}
	public String gotoInsertDatum()throws Exception{
		User user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		userName = user.getName();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		currenttime = df.format(new Date());
		dictList = datumService.getDictList(122);
		return SUCCESS;
	}

	public String insertDatum(){
    	appDatum = getAppDatum();
		if (files != null) {
			Set datumfiles = new HashSet();
			for (int n = 0; n < files.length; n++) {
				AppDatumFile adfile = new AppDatumFile();
				File file = files[n];
				String fileName = filesFileName[n];
	            String rootPath=null;	
	            String AbsoutleFilePath=null;
	        	rootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
	        	Date date1 = new Date();
		        SimpleDateFormat fmt1 = new SimpleDateFormat("yyyyMMddHHmmss");
		        String creattime1=fmt1.format(date1);
		        AbsoutleFilePath = rootPath + "datumfiles"+ File.separator;
		        String filePath = ApplicationPath.getRootPath() + "datumfiles"+ File.separator;
		        String fileSaveName = creattime1 + fileName;
	        	try
	        	{
	        		FileInputStream fis = new FileInputStream(file);
	        		FileOutputStream os = new FileOutputStream(filePath+fileSaveName);
	        		byte[] b = new byte[(int) file.length()];
	        		fis.read(b);
	        		os.write(b);
	        		os.close();
	        		fis.close();
	        	}
	        	catch (FileNotFoundException e)
	        	{
	        			e.printStackTrace();
	        			return INPUT;
	        	}
	        	catch (IOException e) {
	        			e.printStackTrace();
	        			return INPUT;
	        	}
	        	adfile.setFilename(fileName);
	        	adfile.setCreatfilename(fileSaveName);
	        	adfile.setPath(AbsoutleFilePath);
	        	datumfiles.add(adfile);
	        	appDatum.setDatumfiles(datumfiles);
			}
		}
		
		
		User user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		appDatum = getAppDatum();
		appDatum.setUserid(user.getId());
		appDatum.setStatus("0");
		appDatum.setReadnum(0);
		datumService.save(appDatum);		
		return SUCCESS;
	}
	
	public String shareData(){
		appDatum = (AppDatum) datumService.getEntityObjectById(AppDatum.class, entityid);
		appDatum.setStatus("1");
		datumService.update(appDatum);
		return SUCCESS;
	}
	
	public String deleteData(){
		appDatum = (AppDatum) datumService.getEntityObjectById(AppDatum.class, entityid);
		datumService.remove(appDatum);
		return SUCCESS;
	}
	
	public String viewData(){
		appDatumNew = (AppDatum) datumService.getEntityObjectById(AppDatum.class, entityid);
		appDatumNew.setReadnum(appDatumNew.getReadnum()+1);
		Set dfiles = appDatumNew.getDatumfiles();
		List dlist = new ArrayList();
		dlist.addAll(dfiles);
		if(dlist.size()>0)
		appDatumFile = (AppDatumFile) dlist.get(0);
		datumService.update(appDatumNew);
		
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

	public Class getPersistentClass() {
		return AppDatum.class;
	}

	public DatumService getDatumService() {
		return datumService;
	}


	public void setDatumService(DatumService datumService) {
		this.datumService = datumService;
	}
	public AppDatum getAppDatumNew() {
		return appDatumNew;
	}
	public void setAppDatumNew(AppDatum appDatumNew) {
		this.appDatumNew = appDatumNew;
	}


}
