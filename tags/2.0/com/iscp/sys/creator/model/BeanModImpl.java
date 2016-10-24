// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   BeanModImpl.java

package com.iscp.sys.creator.model;

import java.io.PrintStream;
import java.util.LinkedList;
import java.util.Vector;

// Referenced classes of package com.iscp.sys.creator.model:
//			PropertyMod, BeanMod

public class BeanModImpl
{

	private Vector properties;
	private BeanMod myInterface;
	private String entity_name;
	private String name;
	private String proxy;
	private boolean lazy;
	private String table;
	private String schema;
	private String catalog;
	private String subselect;
	private String discriminator_value;
	private boolean mutable;
	private boolean abstract_;
	private boolean polymorphism;
	private String where;
	private String persister;
	private boolean dynamic_update;
	private boolean dynamic_insert;
	private String batch_size;
	private boolean select_before_update;
	private int optimistic_lock;
	private String check;
	private String rowid;
	private String node;

	public BeanModImpl(BeanMod myInterface)
	{
		properties = new Vector();
		lazy = true;
		mutable = true;
		abstract_ = false;
		polymorphism = true;
		dynamic_update = false;
		dynamic_insert = false;
		select_before_update = false;
		optimistic_lock = 1;
		this.myInterface = myInterface;
	}

	public PropertyMod getProperty(int index)
	{
		return (PropertyMod)properties.get(index);
	}

	public int getPropertyCount()
	{
		return properties.size();
	}

	public PropertyMod[] getProperties(String columnName)
	{
		LinkedList list = new LinkedList();
		int size = this.properties.size();
		for (int i = 0; i < size; i++)
		{
			PropertyMod temp = getProperty(i);
			if (temp.getColumn().equals(columnName))
				list.add(temp);
		}

		size = list.size();
		PropertyMod properties[] = new PropertyMod[size];
		for (int i = 0; i < size; i++)
			properties[i] = (PropertyMod)list.removeFirst();

		return properties;
	}

	public PropertyMod getIdProperty()
	{
		int size = properties.size();
		for (int i = 0; i < size; i++)
		{
			PropertyMod temp = getProperty(i);
			if (temp.getType() == 0)
				return temp;
		}

		return null;
	}

	public void addProperty(PropertyMod property)
	{
		if (!properties.contains(property))
		{
			properties.add(property);
			property.setBean(myInterface);
			System.out.println((new StringBuilder("addp:")).append(myInterface.getName()).toString());
		}
	}

	public void removeProperty(PropertyMod property)
	{
		if (properties.contains(property))
		{
			properties.remove(property);
			property.setBean(null);
			System.out.println((new StringBuilder("removep:")).append(myInterface.getName()).toString());
		}
	}

	public void setEntity_name(String entity_name)
	{
		this.entity_name = entity_name;
	}

	public String getEntity_name()
	{
		return entity_name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getName_class()
	{
		int tempIndex = name.lastIndexOf(".");
		if (tempIndex >= 0)
			return name.substring(tempIndex + 1);
		else
			return name;
	}

	public String getName_package()
	{
		int tempIndex = name.lastIndexOf(".");
		if (tempIndex >= 0)
			return name.substring(0, tempIndex);
		else
			return null;
	}

	public String getName()
	{
		return name;
	}

	public void setProxy(String proxy)
	{
		this.proxy = proxy;
	}

	public String getProxy()
	{
		return proxy;
	}

	public void setLazy(boolean lazy)
	{
		this.lazy = lazy;
	}

	public boolean getLazy()
	{
		return lazy;
	}

	public void setTable(String table)
	{
		this.table = table;
	}

	public String getTable()
	{
		return table;
	}

	public void setSchema(String schema)
	{
		this.schema = schema;
	}

	public String getSchema()
	{
		return schema;
	}

	public void setCatalog(String catalog)
	{
		this.catalog = catalog;
	}

	public String getCatalog()
	{
		return catalog;
	}

	public void setSubselect(String subselect)
	{
		this.subselect = subselect;
	}

	public String getSubselect()
	{
		return subselect;
	}

	public void setDiscriminator_value(String discriminator_value)
	{
		this.discriminator_value = discriminator_value;
	}

	public String getDiscriminator_value()
	{
		return discriminator_value;
	}

	public void setMutable(boolean mutable)
	{
		this.mutable = mutable;
	}

	public boolean getMutable()
	{
		return mutable;
	}

	public void setAbstract(boolean abstract_)
	{
		this.abstract_ = abstract_;
	}

	public boolean getAbstract()
	{
		return abstract_;
	}

	public void setPolymorphism(boolean polymorphism)
	{
		this.polymorphism = polymorphism;
	}

	public boolean getPolymorphism()
	{
		return polymorphism;
	}

	public void setWhere(String where)
	{
		this.where = where;
	}

	public String getWhere()
	{
		return where;
	}

	public void setPersister(String persister)
	{
		this.persister = persister;
	}

	public String getPersister()
	{
		return persister;
	}

	public void setDynamic_update(boolean dynamic_update)
	{
		this.dynamic_update = dynamic_update;
	}

	public boolean getDynamic_update()
	{
		return dynamic_update;
	}

	public void setDynamic_insert(boolean dynamic_insert)
	{
		this.dynamic_insert = dynamic_insert;
	}

	public boolean getDynamic_insert()
	{
		return dynamic_insert;
	}

	public void setBatch_size(String batch_size)
	{
		this.batch_size = batch_size;
	}

	public String getBatch_size()
	{
		return batch_size;
	}

	public void setSelect_before_update(boolean select_before_update)
	{
		this.select_before_update = select_before_update;
	}

	public boolean getSelect_before_update()
	{
		return select_before_update;
	}

	public void setOptimistic_lock(int optimistic_lock)
	{
		this.optimistic_lock = optimistic_lock;
	}

	public int getOptimistic_lock()
	{
		return optimistic_lock;
	}

	public void setCheck(String check)
	{
		this.check = check;
	}

	public String getCheck()
	{
		return check;
	}

	public void setRowid(String rowid)
	{
		this.rowid = rowid;
	}

	public String getRowid()
	{
		return rowid;
	}

	public void setNode(String node)
	{
		this.node = node;
	}

	public String getNode()
	{
		return node;
	}
}
