package com.unionfly.completesyn.services.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.activation.DataHandler;
import javax.jws.WebService;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.taiji.core.service.ICoreService;
import com.taiji.fzb.domain.XzfyInfo;
import com.unionfly.completesyn.model.FileUploader;
import com.unionfly.completesyn.model.ListObject;
import com.unionfly.completesyn.services.ICaseInfoServices;
import com.util.HibernateSessionFactory;

@WebService(endpointInterface = "com.unionfly.completesyn.services.ICaseInfoServices")
public class CaseInfoServicesImpl implements ICaseInfoServices {

	public XzfyInfo getXzfyInfo(String caseNo) {
		XzfyInfo xzfyInfo = new XzfyInfo();
		System.out.println("123");
		return xzfyInfo;
	}


	public ListObject getCaseInfoList() {
		ListObject list = new ListObject();
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		ICoreService coreService = (ICoreService) context.getBean(
				"coreService", ICoreService.class);
		List<XzfyInfo> xzfyInfos = new ArrayList<XzfyInfo>();
		xzfyInfos.add((XzfyInfo) (coreService.find("from XzfyInfo t where t.receive_date='2014-12-16'").get(0)));
		list.setList(xzfyInfos);
		System.out.println("server:" + list.getList().size());
		return list;
	}

	public boolean uploadFile(FileUploader file) {
		DataHandler tempfile = file.getFile();
		try {
			InputStream is = tempfile.getInputStream();
			OutputStream os = new FileOutputStream(file.getFilePath());
			byte[] b = new byte[100000];
			int bytesRead = 0;
			while ((bytesRead = is.read(b)) != -1) {
				os.write(b, 0, bytesRead);
			}
			os.flush();
			os.close();
			is.close();

		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;

	}

	private List findBySQL(String hql) {
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
		}
		if (session != null && session.isOpen()) {
			session.close();
		}
		return list;
	}


	public void updateName(String name) {
		System.out.println("aiyou");
	}
}