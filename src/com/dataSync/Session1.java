package com.dataSync;

import org.hibernate.Session;

import com.taiji.fzb.domain.XzfyInfo;
import com.util.HibernateSessionFactory;

public class Session1 {
	public static void main(String[] args) {
		XzfyInfo xzfyInfo = new XzfyInfo();
		xzfyInfo.setId("adjsaldjsal");
		xzfyInfo.setReceive_date("2014-1-23");
		try {
			Session2 session2 = new Session2();
			session2.saveModel(xzfyInfo);
			System.out.println("main1方法执行了");
		} catch (Exception e) {
			System.out.println("Session1抛出异常了！");
			e.printStackTrace();
		}
	}

	public void saveModel(Object object) throws Exception {
		Session session = null;
		try {
			session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			session.save(object);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw new Exception();
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}
	}
}
