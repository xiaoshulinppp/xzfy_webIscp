// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   HibernateDAOImpl.java

package com.taiji.core.dao.impl;

import com.taiji.core.dao.IHibernateDAO;
import com.taiji.core.exception.GenerateException;
import com.taiji.core.query.QueryObject;
import com.taiji.core.util.PaginationSupport;
import java.io.Serializable;
import java.sql.*;
import java.util.List;
import org.hibernate.*;
import org.hibernate.criterion.*;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class HibernateDAOImpl extends HibernateDaoSupport
	implements IHibernateDAO
{

	private Class persistentClass;
	private int DEFAULT_BATCH_SIZE;

	public HibernateDAOImpl()
	{
		DEFAULT_BATCH_SIZE = 15;
	}

	public void setPersistentClass(Class persistentClass)
	{
		this.persistentClass = persistentClass;
	}

	public Class getPersistentClass()
	{
		return persistentClass;
	}

	public Object getCurrentSession()
	{
		return getSession();
	}

	public Object getById(Class persistentClass, Serializable id)
	{
		if (persistentClass == null)
			throw new GenerateException("persistentClass is null");
		else
			return getHibernateTemplate().get(persistentClass, id);
	}

	public Object loadById(Class persistentClass, Serializable id)
	{
		if (persistentClass == null)
			throw new GenerateException("persistentClass is null");
		else
			return getHibernateTemplate().load(persistentClass, id);
	}

	public Serializable save(Object object)
	{
		return getHibernateTemplate().save(object);
	}

	public void persist(Object object)
	{
		getHibernateTemplate().persist(object);
	}

	public void update(Object object)
	{
		getHibernateTemplate().update(object);
	}

	public Integer updateAll(final String hql)
	{
		return (Integer)getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final String val$hql;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				checkWriteOperationAllowed(getHibernateTemplate(), session);
				Query query = session.createQuery(hql);
				return new Integer(query.executeUpdate());
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				hql = s;
				super();
			}
		}, true);
	}

	public int updateAllBySQL(String sql)
	{
		Session session;
		Connection conn;
		int result;
		PreparedStatement pstmt;
		Transaction trans;
		session = getHibernateTemplate().getSessionFactory().openSession();
		conn = session.connection();
		result = 0;
		pstmt = null;
		trans = null;
		try
		{
			trans = session.beginTransaction();
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			trans.commit();
		}
		catch (SQLException e)
		{
			trans.rollback();
			e.printStackTrace();
			break MISSING_BLOCK_LABEL_150;
		}
		break MISSING_BLOCK_LABEL_117;
		Exception exception;
		exception;
		try
		{
			pstmt.close();
			conn.close();
			session.close();
		}
		catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		throw exception;
		try
		{
			pstmt.close();
			conn.close();
			session.close();
		}
		catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		break MISSING_BLOCK_LABEL_180;
		try
		{
			pstmt.close();
			conn.close();
			session.close();
		}
		catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		return result;
	}

	public int deleteAllBySQL(String sql)
	{
		Session session;
		Connection conn;
		int result;
		PreparedStatement pstmt;
		session = getHibernateTemplate().getSessionFactory().openSession();
		conn = session.connection();
		result = 0;
		pstmt = null;
		try
		{
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			session.beginTransaction().commit();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			break MISSING_BLOCK_LABEL_136;
		}
		break MISSING_BLOCK_LABEL_103;
		Exception exception;
		exception;
		try
		{
			pstmt.close();
			conn.close();
			session.close();
		}
		catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		throw exception;
		try
		{
			pstmt.close();
			conn.close();
			session.close();
		}
		catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		break MISSING_BLOCK_LABEL_166;
		try
		{
			pstmt.close();
			conn.close();
			session.close();
		}
		catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		return result;
	}

	public Integer deleteAll(final String hql)
	{
		return (Integer)getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final String val$hql;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				checkWriteOperationAllowed(getHibernateTemplate(), session);
				Query query = session.createQuery(hql);
				return new Integer(query.executeUpdate());
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				hql = s;
				super();
			}
		}, true);
	}

	public void saveOrUpdate(Object object)
	{
		getHibernateTemplate().saveOrUpdate(object);
	}

	public void refresh(Object object)
	{
		getHibernateTemplate().refresh(object);
	}

	public void merge(Object object)
	{
		getHibernateTemplate().merge(object);
	}

	public void evict(Object object)
	{
		getHibernateTemplate().evict(object);
	}

	public void remove(Object object)
	{
		getHibernateTemplate().delete(object);
	}

	public void removeAll(Class persistentClass)
	{
		if (persistentClass == null)
		{
			throw new GenerateException("persistentClass is null");
		} else
		{
			batchRemove(getHibernateTemplate().find((new StringBuilder("from ")).append(persistentClass.getName()).toString()));
			return;
		}
	}

	public void flush()
	{
		getHibernateTemplate().flush();
	}

	public void clear()
	{
		getHibernateTemplate().clear();
	}

	public void batchSave(final List objectList)
	{
		getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final List val$objectList;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				checkWriteOperationAllowed(getHibernateTemplate(), session);
				if (objectList == null)
					return null;
				int max = objectList.size();
				for (int i = 0; i < max; i++)
				{
					session.save(objectList.get(i));
					if (i != 0 && i % DEFAULT_BATCH_SIZE == 0 || i == max - 1)
					{
						session.flush();
						session.clear();
					}
				}

				return null;
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				objectList = list;
				super();
			}
		}, true);
	}

	public void batchUpdate(final List objectList)
	{
		getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final List val$objectList;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				checkWriteOperationAllowed(getHibernateTemplate(), session);
				if (objectList == null)
					return null;
				int max = objectList.size();
				for (int i = 0; i < max; i++)
				{
					session.update(objectList.get(i));
					if (i != 0 && i % DEFAULT_BATCH_SIZE == 0 || i == max - 1)
					{
						session.flush();
						session.clear();
					}
				}

				return null;
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				objectList = list;
				super();
			}
		}, true);
	}

	public void batchSaveOrUpdate(final List objectList)
	{
		getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final List val$objectList;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				checkWriteOperationAllowed(getHibernateTemplate(), session);
				if (objectList == null)
					return null;
				int max = objectList.size();
				for (int i = 0; i < max; i++)
				{
					session.saveOrUpdate(objectList.get(i));
					if (i != 0 && i % DEFAULT_BATCH_SIZE == 0 || i == max - 1)
					{
						session.flush();
						session.clear();
					}
				}

				return null;
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				objectList = list;
				super();
			}
		}, true);
	}

	public void batchRemove(final List objectList)
	{
		getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final List val$objectList;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				checkWriteOperationAllowed(getHibernateTemplate(), session);
				if (objectList == null)
					return null;
				int max = objectList.size();
				for (int i = 0; i < max; i++)
				{
					session.refresh(objectList.get(i));
					session.delete(objectList.get(i));
					if (i != 0 && i % DEFAULT_BATCH_SIZE == 0 || i == max - 1)
					{
						session.flush();
						session.clear();
					}
				}

				return null;
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				objectList = list;
				super();
			}
		}, true);
	}

	public void checkWriteOperationAllowed(HibernateTemplate template, Session session)
	{
		if (template.isCheckWriteOperations() && template.getFlushMode() != 2 && FlushMode.NEVER.equals(session.getFlushMode()))
			throw new InvalidDataAccessApiUsageException("Write operations are not allowed in read-only mode (FlushMode.NEVER) - turn your Session into FlushMode.AUTO or remove 'readOnly' marker from transaction definition");
		else
			return;
	}

	public PaginationSupport findPageByCriteria(DetachedCriteria detachedCriteria)
	{
		return findPageByCriteria(detachedCriteria, 10, 0);
	}

	public PaginationSupport findPageByCriteria(DetachedCriteria detachedCriteria, int pNum)
	{
		return findPageByCriteria(detachedCriteria, pNum, 10);
	}

	public PaginationSupport findPageByCriteria(final DetachedCriteria detachedCriteria, final int pNum, final int pageSize)
	{
		return (PaginationSupport)getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final DetachedCriteria val$detachedCriteria;
			private final int val$pNum;
			private final int val$pageSize;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				Criteria criteria = detachedCriteria.getExecutableCriteria(session);
				int totalCount = ((Integer)criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
				criteria.setProjection(null);
				int startIndex = (pNum - 1) * pageSize;
				List items = criteria.setFirstResult(startIndex).setMaxResults(pageSize).list();
				PaginationSupport ps = new PaginationSupport(items, totalCount, startIndex, pageSize);
				return ps;
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				detachedCriteria = detachedcriteria;
				pNum = i;
				pageSize = j;
				super();
			}
		}, true);
	}

	public List findAllByCriteria(final DetachedCriteria detachedCriteria)
	{
		return (List)getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final DetachedCriteria val$detachedCriteria;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				Criteria criteria = detachedCriteria.getExecutableCriteria(session);
				return criteria.list();
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				detachedCriteria = detachedcriteria;
				super();
			}
		}, true);
	}

	public List findAll(Class entity)
	{
		if (entity == null)
			throw new GenerateException("persistentClass is null");
		else
			return getHibernateTemplate().find((new StringBuilder("from ")).append(entity.getName()).toString());
	}

	public List findAll(Class entity, List orderColumn, List orderType)
	{
		if (entity == null)
			throw new GenerateException("persistentClass is null");
		String orderSql = " order by ";
		int i = 0;
		for (i = 0; i < orderColumn.size() - 1; i++)
			if (((Boolean)orderType.get(i)).booleanValue())
				orderSql = (new StringBuilder(String.valueOf(orderSql))).append(orderColumn.get(i)).append(" asc, ").toString();
			else
				orderSql = (new StringBuilder(String.valueOf(orderSql))).append(orderColumn.get(i)).append(" desc, ").toString();

		if (((Boolean)orderType.get(i)).booleanValue())
			orderSql = (new StringBuilder(String.valueOf(orderSql))).append(orderColumn.get(i)).append(" asc").toString();
		else
			orderSql = (new StringBuilder(String.valueOf(orderSql))).append(orderColumn.get(i)).append(" desc ").toString();
		return getHibernateTemplate().find((new StringBuilder("from ")).append(entity.getName()).append(orderSql).toString());
	}

	public List findAll(QueryObject object)
	{
		Class entity = object.getClass();
		String condition = object.getQueryCondition();
		return getHibernateTemplate().find(condition);
	}

	public List findByNamedQuery(String namedQuery)
	{
		return getHibernateTemplate().findByNamedQuery(namedQuery);
	}

	public List findByNamedQuery(String query, Object parameter)
	{
		return getHibernateTemplate().findByNamedQuery(query, parameter);
	}

	public List findByNamedQuery(String query, Object parameters[])
	{
		return getHibernateTemplate().findByNamedQuery(query, parameters);
	}

	public List find(String query)
	{
		return getHibernateTemplate().find(query);
	}

	public List find(String query, Object parameter)
	{
		return getHibernateTemplate().find(query, parameter);
	}

	public List find(String query, Object parameter[])
	{
		return getHibernateTemplate().find(query, parameter);
	}

	public PaginationSupport findAll(Class entity, int pNum)
	{
		return findAll(entity, pNum, 10);
	}

	public PaginationSupport findAll(Class entity, List orderColumn, List order, int pNum)
	{
		return findAll(entity, orderColumn, order, pNum, 10);
	}

	public PaginationSupport findAll(final Class entity, final int pNum, final int pageSize)
	{
		if (entity == null)
			throw new GenerateException("persistentClass is null");
		else
			return (PaginationSupport)getHibernateTemplate().execute(new HibernateCallback() {

				final HibernateDAOImpl this$0;
				private final Class val$entity;
				private final int val$pNum;
				private final int val$pageSize;

				public Object doInHibernate(Session session)
					throws HibernateException
				{
					Criteria criteria = session.createCriteria(entity);
					int totalCount = ((Integer)criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
					criteria.setProjection(null);
					int startIndex = (pNum - 1) * pageSize;
					List items = criteria.setFirstResult(startIndex).setMaxResults(pageSize).list();
					PaginationSupport ps = new PaginationSupport(items, totalCount, startIndex, pageSize);
					return ps;
				}

			
			{
				this$0 = HibernateDAOImpl.this;
				entity = class1;
				pNum = i;
				pageSize = j;
				super();
			}
			}, true);
	}

	public PaginationSupport findAll(final Class entity, final List orderColumn, final List orderType, final int pNum, final int pageSize)
	{
		if (entity == null)
			throw new GenerateException("persistentClass is null");
		else
			return (PaginationSupport)getHibernateTemplate().execute(new HibernateCallback() {

				final HibernateDAOImpl this$0;
				private final Class val$entity;
				private final int val$pNum;
				private final int val$pageSize;
				private final List val$orderColumn;
				private final List val$orderType;

				public Object doInHibernate(Session session)
					throws HibernateException
				{
					Criteria criteria = session.createCriteria(entity);
					int totalCount = ((Integer)criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
					criteria.setProjection(null);
					int startIndex = (pNum - 1) * pageSize;
					for (int i = 0; i < orderColumn.size(); i++)
						if (((Boolean)orderType.get(i)).booleanValue())
							criteria.addOrder(Order.asc((String)orderColumn.get(i)));
						else
							criteria.addOrder(Order.desc((String)orderColumn.get(i)));

					List items = criteria.setFirstResult(startIndex).setMaxResults(pageSize).list();
					PaginationSupport ps = new PaginationSupport(items, totalCount, startIndex, pageSize);
					return ps;
				}

			
			{
				this$0 = HibernateDAOImpl.this;
				entity = class1;
				pNum = i;
				pageSize = j;
				orderColumn = list;
				orderType = list1;
				super();
			}
			}, true);
	}

	public PaginationSupport findByNamedQuery(String namedQuery, int pNum)
	{
		return findByNamedQuery(namedQuery, pNum, 10);
	}

	public PaginationSupport findByNamedQuery(final String namedQuery, final int pNum, final int pageSize)
	{
		return (PaginationSupport)getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final String val$namedQuery;
			private final int val$pNum;
			private final int val$pageSize;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				int totalCount = session.getNamedQuery(namedQuery).list().size();
				int startIndex = (pNum - 1) * pageSize;
				List items = session.getNamedQuery(namedQuery).setFirstResult(startIndex).setMaxResults(pageSize).list();
				PaginationSupport ps = new PaginationSupport(items, totalCount, startIndex, pageSize);
				return ps;
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				namedQuery = s;
				pNum = i;
				pageSize = j;
				super();
			}
		}, true);
	}

	public PaginationSupport findByNamedQuery(String query, Object parameter, int pNum)
	{
		return findByNamedQuery(query, parameter, pNum, 10);
	}

	public PaginationSupport findByNamedQuery(final String query, final Object parameter, final int pNum, final int pageSize)
	{
		return (PaginationSupport)getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final String val$query;
			private final Object val$parameter;
			private final int val$pNum;
			private final int val$pageSize;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				int totalCount = getHibernateTemplate().findByNamedQuery(query, parameter).size();
				int startIndex = (pNum - 1) * pageSize;
				List items = session.getNamedQuery(query).setFirstResult(startIndex).setMaxResults(pageSize).setParameter(0, parameter).list();
				PaginationSupport ps = new PaginationSupport(items, totalCount, startIndex, pageSize);
				return ps;
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				query = s;
				parameter = obj;
				pNum = i;
				pageSize = j;
				super();
			}
		}, true);
	}

	public PaginationSupport findByNamedQuery(String query, Object parameters[], int pNum)
	{
		return findByNamedQuery(query, parameters, pNum, 10);
	}

	public PaginationSupport findByNamedQuery(final String query, final Object parameters[], final int pNum, final int pageSize)
	{
		return (PaginationSupport)getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final String val$query;
			private final Object val$parameters[];
			private final int val$pNum;
			private final int val$pageSize;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				int totalCount = getHibernateTemplate().findByNamedQuery(query, parameters).size();
				Query queryObject = session.getNamedQuery(query);
				for (int i = 0; i < parameters.length; i++)
				{
					Object value = parameters[i];
					queryObject.setParameter(i, value);
				}

				int startIndex = (pNum - 1) * pageSize;
				List items = queryObject.setFirstResult(startIndex).setMaxResults(pageSize).list();
				PaginationSupport ps = new PaginationSupport(items, totalCount, startIndex, pageSize);
				return ps;
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				query = s;
				parameters = aobj;
				pNum = i;
				pageSize = j;
				super();
			}
		}, true);
	}

	public PaginationSupport find(String query, int pNum)
	{
		return find(query, pNum, 10);
	}

	public PaginationSupport find(final String query, final int pNum, final int pageSize)
	{
		return (PaginationSupport)getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final String val$query;
			private final int val$pNum;
			private final int val$pageSize;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				Query queryResult = session.createQuery(query);
				ScrollableResults sr = queryResult.scroll();
				sr.last();
				int totalCount = sr.getRowNumber() + 1;
				int startIndex = (pNum - 1) * pageSize;
				List items = queryResult.setFirstResult(startIndex).setMaxResults(pageSize).list();
				PaginationSupport ps = new PaginationSupport(items, totalCount, startIndex, pageSize);
				return ps;
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				query = s;
				pNum = i;
				pageSize = j;
				super();
			}
		}, true);
	}

	public PaginationSupport find(String query, Object parameter, int pNum)
	{
		return find(query, parameter, pNum, 10);
	}

	public PaginationSupport find(final String query, final Object parameter, final int pNum, final int pageSize)
	{
		return (PaginationSupport)getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final String val$query;
			private final Object val$parameter;
			private final int val$pNum;
			private final int val$pageSize;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				Query queryResult = session.createQuery(query);
				queryResult.setParameter(0, parameter);
				ScrollableResults sr = queryResult.scroll();
				sr.last();
				int totalCount = sr.getRowNumber() + 1;
				int startIndex = (pNum - 1) * pageSize;
				List items = queryResult.setFirstResult(startIndex).setMaxResults(pageSize).list();
				PaginationSupport ps = new PaginationSupport(items, totalCount, startIndex, pageSize);
				return ps;
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				query = s;
				parameter = obj;
				pNum = i;
				pageSize = j;
				super();
			}
		}, true);
	}

	public PaginationSupport find(QueryObject object, int pNum)
	{
		return find(object, pNum, 10);
	}

	public PaginationSupport find(final QueryObject object, final int pNum, final int pageSize)
	{
		return (PaginationSupport)getHibernateTemplate().execute(new HibernateCallback() {

			final HibernateDAOImpl this$0;
			private final QueryObject val$object;
			private final int val$pNum;
			private final int val$pageSize;

			public Object doInHibernate(Session session)
				throws HibernateException
			{
				Query queryResult = session.createQuery(object.getQueryCondition());
				ScrollableResults sr = queryResult.scroll();
				sr.last();
				int totalCount = sr.getRowNumber() + 1;
				int startIndex = (pNum - 1) * pageSize;
				List items = queryResult.setFirstResult(startIndex).setMaxResults(pageSize).list();
				PaginationSupport ps = new PaginationSupport(items, totalCount, startIndex, pageSize);
				return ps;
			}

			
			{
				this$0 = HibernateDAOImpl.this;
				object = queryobject;
				pNum = i;
				pageSize = j;
				super();
			}
		}, true);
	}

	public List find(QueryObject object)
	{
		return getHibernateTemplate().find(object.getQueryCondition());
	}

	private String getClassName(String packageName)
	{
		int index = packageName.lastIndexOf(".");
		return packageName.substring(index + 1);
	}

}
