// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   IHibernateDAO.java

package com.taiji.core.dao;

import com.taiji.core.query.QueryObject;
import com.taiji.core.util.PaginationSupport;
import java.io.Serializable;
import java.util.List;
import org.hibernate.criterion.DetachedCriteria;

public interface IHibernateDAO
{

	public abstract void setPersistentClass(Class class1);

	public abstract Class getPersistentClass();

	public abstract Object getCurrentSession();

	public abstract Object getById(Class class1, Serializable serializable);

	public abstract Object loadById(Class class1, Serializable serializable);

	public abstract Serializable save(Object obj);

	public abstract void persist(Object obj);

	public abstract void update(Object obj);

	public abstract Integer updateAll(String s);

	public abstract Integer deleteAll(String s);

	public abstract int updateAllBySQL(String s);

	public abstract int deleteAllBySQL(String s);

	public abstract void saveOrUpdate(Object obj);

	public abstract void refresh(Object obj);

	public abstract void merge(Object obj);

	public abstract void evict(Object obj);

	public abstract void remove(Object obj);

	public abstract void removeAll(Class class1);

	public abstract void flush();

	public abstract void clear();

	public abstract void batchSave(List list);

	public abstract void batchUpdate(List list);

	public abstract void batchSaveOrUpdate(List list);

	public abstract void batchRemove(List list);

	public abstract List find(String s);

	public abstract List find(String s, Object obj);

	public abstract List find(String s, Object aobj[]);

	public abstract List find(QueryObject queryobject);

	public abstract PaginationSupport find(String s, int i);

	public abstract PaginationSupport find(String s, int i, int j);

	public abstract PaginationSupport find(String s, Object obj, int i);

	public abstract PaginationSupport find(String s, Object obj, int i, int j);

	public abstract PaginationSupport find(QueryObject queryobject, int i);

	public abstract PaginationSupport find(QueryObject queryobject, int i, int j);

	public abstract List findAll(Class class1);

	public abstract List findAll(Class class1, List list, List list1);

	public abstract List findAll(QueryObject queryobject);

	public abstract PaginationSupport findAll(Class class1, int i);

	public abstract PaginationSupport findAll(Class class1, int i, int j);

	public abstract PaginationSupport findAll(Class class1, List list, List list1, int i);

	public abstract PaginationSupport findAll(Class class1, List list, List list1, int i, int j);

	public abstract PaginationSupport findByNamedQuery(String s, int i);

	public abstract PaginationSupport findByNamedQuery(String s, int i, int j);

	public abstract PaginationSupport findByNamedQuery(String s, Object obj, int i);

	public abstract PaginationSupport findByNamedQuery(String s, Object obj, int i, int j);

	public abstract PaginationSupport findByNamedQuery(String s, Object aobj[], int i);

	public abstract PaginationSupport findByNamedQuery(String s, Object aobj[], int i, int j);

	public abstract List findByNamedQuery(String s);

	public abstract List findByNamedQuery(String s, Object obj);

	public abstract List findByNamedQuery(String s, Object aobj[]);

	public abstract List findAllByCriteria(DetachedCriteria detachedcriteria);

	public abstract PaginationSupport findPageByCriteria(DetachedCriteria detachedcriteria);

	public abstract PaginationSupport findPageByCriteria(DetachedCriteria detachedcriteria, int i);

	public abstract PaginationSupport findPageByCriteria(DetachedCriteria detachedcriteria, int i, int j);
}
