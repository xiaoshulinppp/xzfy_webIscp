package com.taiji.fzb.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.fzb.domain.Vacation;
import com.taiji.fzb.service.VacationService;
import com.util.HibernateSessionFactory;

public class VacationServiceImpl extends CoreServiceImpl implements VacationService {
	@Override
	public void saveJiejiari(Vacation vacation) {
		// TODO Auto-generated method stub
		String year=vacation.getYears();
		String month=vacation.getMonths();
		String day=vacation.getDays();
		String hql="";
		hql+="from Vacation v";
		hql+=" where 1=1";
		hql+=" and v.years='"+year+"' and v.months='"+month+"' and v.days='"+day+"'";
		List vac=super.find(hql);
		if(vac.isEmpty()){
			super.saveOrUpdate(vacation);			
		}
	}

	@Override
	public int vacationDays(String xzfyInfoId) {
		// TODO Auto-generated method stub
		String sql="select to_date(t.receive_date,'yyyy-mm-dd') from xzfy_info t  where t.id='"+xzfyInfoId+"'";
		List list=this.findBySQL(sql);
		String startDate1=list.get(0).toString();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = null;
		try {
			startDate = format.parse(startDate1);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql1="select years,months,days from Vacation ";
		List list1=findBySQL(sql1);
		Integer count = 0;
		for (int i = 0; i < list1.size(); i++) {
			Object[] o = (Object[]) list1.get(i);
			String vacDate=o[0]+"-"+o[1]+"-"+o[2];
			Date vacationDate = null;
			try {
				vacationDate = format.parse(vacDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date now=new Date();
			String nowString=format.format(now);
			Date nowDate = null;
			try {
				nowDate = format.parse(nowString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if ((startDate.before(vacationDate)||startDate.equals(vacationDate))&&(vacationDate.before(nowDate)||vacationDate.equals(nowDate))) {
//				System.out.println("startDate:"+startDate);
//				System.out.println(i+":"+vacationDate);
//				System.out.println("nowDate:"+nowDate);
				count++;
			}
		}
		return count;
	}
	public  List findBySQL(String hql) {
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
			exception.printStackTrace();
		}finally{
			if (session != null && session.isOpen()) {
				session.close();
			}
		}
		return list;
	}

	@Override
	public void deleteOneMonth(String year, String month) {
		// TODO Auto-generated method stub
		String hql="delete from  Vacation v where v.years='"+year+"' and v.months='"+month+"'";
		super.deleteAll(hql);
	}
}
