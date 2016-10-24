package com.dataSync.jobSchedule;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.dataSync.model.AppDto;
import com.dataSync.model.ArchiveDto;
import com.dataSync.model.InfoDto;
import com.dataSync.service.Services;
import com.dataSync.util.AppDtoToXzfyApp;
import com.dataSync.util.ArchiveDtoToArchive;
import com.dataSync.util.InfoDtoToXzfyInfo;
import com.taiji.archive.domain.Archive;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyInfo;
import com.util.HibernateSessionFactory;

public class MyJob extends QuartzJobBean {

	@SuppressWarnings("unchecked")
	protected void executeInternal(JobExecutionContext context)
			throws JobExecutionException {
		System.out.println("定时任务执行中。。。。");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		Services services = (Services) applicationContext.getBean("client");
		List<InfoDto> list = services.anJianTongbu().getInfoDtos();
		List<AppDto> appDtos = services.anJianTongbu().getAppDtos();
		List<ArchiveDto> archiveDtos = services.anJianTongbu().getArchiveDtos();
		List<ArchiveDto> bzArchiveDtos = services.anJianTongbu()
				.getBzArchiveDtos();
		List<ArchiveDto> yjArchiveDtos = services.anJianTongbu()
				.getYjArchiveDtos();
		List<InfoDto> infoDtos = services.anJianTongbu().getYjInfoDtos();

		int flag = 1;// 状态位
		// 保存案件
		XzfyInfo xzfyInfo = new XzfyInfo();
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				InfoDtoToXzfyInfo.dtoToModel(list.get(i), xzfyInfo);//************************************区别****************************************//

				// 设置案件代码
				List<String> caseIndexList = findBySql("select max(caseindex) as caseindex from XzfyInfo"); // 设置流水号？？？？？？？？？？？？？？？？？？？？？规则？？？？？？？？？
				String caseIndex = null;
				for (int k = 0; k < caseIndexList.size(); k++) {
					caseIndex = caseIndexList.get(k);
				}

				if (caseIndex == null) {
					Calendar cal = Calendar.getInstance();
					int year = cal.get(Calendar.YEAR);
					caseIndex = year + xzfyInfo.getCaseorg() + "0001";
				} else {
					String y = caseIndex.substring(0, 4);
					Calendar cal = Calendar.getInstance();
					int year = cal.get(Calendar.YEAR);
					if (year > Integer.parseInt(y)) {
						caseIndex = year + xzfyInfo.getCaseorg() + "0001";
					} else {
						Long c = Long.parseLong(caseIndex) + 1;
						caseIndex = String.valueOf(c);
					}
				}
				xzfyInfo.setCaseindex(caseIndex);

				// 设计简要内容
				String str = "";
				if (xzfyInfo.getIsmanage().equals("0")) {
					str = "申请人不服" + xzfyInfo.getXwname() + "("
							+ xzfyInfo.getXwnum() + ")"
							+ xzfyInfo.getXzfy_requset_retail();

				} else {
					str = "申请人不服" + xzfyInfo.getXwname() + "("
							+ xzfyInfo.getMatter_type() + ")申请"
							+ xzfyInfo.getXzfy_requset_retail();
				}
				xzfyInfo.setContent_abstract(str);
				try {
					saveModel(xzfyInfo);
					services.flagInfo(flag, list.get(i).getId());
				} catch (Exception e) {
					flag = 0;
					services.flagInfo(flag, null);
				}
			}
		}
		// 保存案件相关的人员

		XzfyApp xzfyApp = new XzfyApp();
		String hqlInfo = "from XzfyInfo x where x.id='";
		List<XzfyInfo> xzfyInfos = null;
		if (appDtos != null) {
			for (int i = 0; i < appDtos.size(); i++) {
				AppDtoToXzfyApp.dtoToModel(appDtos.get(i), xzfyApp);
				xzfyInfos = findBySql(hqlInfo + appDtos.get(i).getXzfyId()
						+ "'");
				xzfyApp.setXzfyInfo(xzfyInfos.get(0));//?????????????????????????????????这样设置的原因????????????????????????????????
				try {
					saveModel(xzfyApp);
				} catch (Exception e) {
				}
			}
		}

		// 保存案件相关的材料
		Archive archive = new Archive();
		if (archiveDtos != null) {
			for (int i = 0; i < archiveDtos.size(); i++) {
				ArchiveDtoToArchive.dtoToModel(archiveDtos.get(i), archive);
				try {
					saveModel(archive);
				} catch (Exception e) {
				}
			}
		}
		// 保存案件相关的补正材料
		Archive bzArchive = new Archive();
		int flag2 = 1;
		if (bzArchiveDtos != null) {
			for (int i = 0; i < bzArchiveDtos.size(); i++) {
				ArchiveDtoToArchive.dtoToModel(bzArchiveDtos.get(i), bzArchive);
				try {
					saveModel(bzArchive);
					services.flag2Info(flag2, bzArchiveDtos.get(i).getXzfyId());
				} catch (Exception e) {
					flag2 = 0;
					services.flag2Info(flag2, bzArchiveDtos.get(i).getXzfyId());
				}
			}
		}
		// 保存案件相关的意见证据材料
		Archive yjArchive = new Archive();
		int flag3 = 1;
		if (yjArchiveDtos != null) {
			for (int i = 0; i < yjArchiveDtos.size(); i++) {
				ArchiveDtoToArchive.dtoToModel(yjArchiveDtos.get(i), yjArchive);
				try {
					saveModel(yjArchive);
					services.flag3Info(flag3, yjArchiveDtos.get(i).getId().toString());
				} catch (Exception e) {
					flag3 = 0;
					services.flag3Info(flag3, yjArchiveDtos.get(i).getId().toString());
				}
			}
		}
		// 更新案件意见证据
		int flag4 = 1;
		if (infoDtos != null) {
			for (int i = 0; i < infoDtos.size(); i++) {
				List<XzfyInfo> list2 = findBySql(hqlInfo
						+ infoDtos.get(i).getId() + "'");
				list2.get(0).setApp_advice_type(
						infoDtos.get(i).getAppAdviceType());
				try {
					updateObject(list2.get(0));
					services.flag4Info(flag4, list2.get(0).getId());
				} catch (Exception e) {
					flag4 = 0;
					services.flag4Info(flag4, list2.get(0).getId());
				}
			}
		}
	}

	/**
	 * 保存实体
	 * 
	 * @param object
	 * @throws Exception
	 */
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
			session.close();
		}
	}

	/**
	 * 查询实体
	 * 
	 * @param hql
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findBySql(String hql) {
		Session session = null;
		List list = null;
		Query query = null;
		try {
			session = HibernateSessionFactory.getSession();
			query = session.createQuery(hql);
			list = query.list();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * 更新数据库
	 * 
	 * @param infoDto
	 * @throws Exception
	 */
	public void updateObject(Object object) throws Exception {
		Session session = null;
		try {
			session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			session.update(object);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw new Exception(e);
		} finally {
			session.close();
		}
	}

}
