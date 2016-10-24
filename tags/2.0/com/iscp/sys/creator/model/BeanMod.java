// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   BeanMod.java

package com.iscp.sys.creator.model;


// Referenced classes of package com.iscp.sys.creator.model:
//			BeanModImpl, PropertyMod

public class BeanMod
{

	private BeanModImpl model;

	public BeanMod()
	{
		model = new BeanModImpl(this);
	}

	public PropertyMod getProperty(int index)
	{
		return model.getProperty(index);
	}

	public int getPropertyCount()
	{
		return model.getPropertyCount();
	}

	public PropertyMod[] getProperties(String columnName)
	{
		return model.getProperties(columnName);
	}

	public PropertyMod getIdProperty()
	{
		return model.getIdProperty();
	}

	public void addProperty(PropertyMod property)
	{
		model.addProperty(property);
	}

	public void removeProperty(PropertyMod property)
	{
		model.removeProperty(property);
	}

	public void setEntity_name(String entity_name)
	{
		model.setEntity_name(entity_name);
	}

	public String getEntity_name()
	{
		return model.getEntity_name();
	}

	public void setName(String name)
	{
		model.setName(name);
	}

	public String getName()
	{
		return model.getName();
	}

	public String getName_class()
	{
		return model.getName_class();
	}

	public String getName_package()
	{
		return model.getName_package();
	}

	public void setProxy(String proxy)
	{
		model.setProxy(proxy);
	}

	public String getProxy()
	{
		return model.getProxy();
	}

	public void setLazy(boolean lazy)
	{
		model.setLazy(lazy);
	}

	public boolean getLazy()
	{
		return model.getLazy();
	}

	public void setTable(String table)
	{
		model.setTable(table);
	}

	public String getTable()
	{
		return model.getTable();
	}

	public void setSchema(String schema)
	{
		model.setSchema(schema);
	}

	public String getSchema()
	{
		return model.getSchema();
	}

	public void setCatalog(String catalog)
	{
		model.setCatalog(catalog);
	}

	public String getCatalog()
	{
		return model.getCatalog();
	}

	public void setSubselect(String subselect)
	{
		model.setSubselect(subselect);
	}

	public String getSubselect()
	{
		return model.getSubselect();
	}

	public void setDiscriminator_value(String discriminator_value)
	{
		model.setDiscriminator_value(discriminator_value);
	}

	public String getDiscriminator_value()
	{
		return model.getDiscriminator_value();
	}

	public void setMutable(boolean mutable)
	{
		model.setMutable(mutable);
	}

	public boolean getMutable()
	{
		return model.getMutable();
	}

	public void setAbstract(boolean abstract_)
	{
		model.setAbstract(abstract_);
	}

	public boolean getAbstract()
	{
		return model.getAbstract();
	}

	public void setPolymorphism(boolean polymorphism)
	{
		model.setPolymorphism(polymorphism);
	}

	public boolean getPolymorphism()
	{
		return model.getPolymorphism();
	}

	public void setWhere(String where)
	{
		model.setWhere(where);
	}

	public String getWhere()
	{
		return model.getWhere();
	}

	public void setPersister(String persister)
	{
		model.setPersister(persister);
	}

	public String getPersister()
	{
		return model.getPersister();
	}

	public void setDynamic_update(boolean dynamic_update)
	{
		model.setDynamic_update(dynamic_update);
	}

	public boolean getDynamic_update()
	{
		return model.getDynamic_update();
	}

	public void setDynamic_insert(boolean dynamic_insert)
	{
		model.setDynamic_insert(dynamic_insert);
	}

	public boolean getDynamic_insert()
	{
		return model.getDynamic_insert();
	}

	public void setBatch_size(String batch_size)
	{
		model.setBatch_size(batch_size);
	}

	public String getBatch_size()
	{
		return model.getBatch_size();
	}

	public void setSelect_before_update(boolean select_before_update)
	{
		model.setSelect_before_update(select_before_update);
	}

	public boolean getSelect_before_update()
	{
		return model.getSelect_before_update();
	}

	public void setOptimistic_lock(int optimistic_lock)
	{
		model.setOptimistic_lock(optimistic_lock);
	}

	public int getOptimistic_lock()
	{
		return model.getOptimistic_lock();
	}

	public void setCheck(String check)
	{
		model.setCheck(check);
	}

	public String getCheck()
	{
		return model.getCheck();
	}

	public void setRowid(String rowid)
	{
		model.setRowid(rowid);
	}

	public String getRowid()
	{
		return model.getRowid();
	}

	public void setNode(String node)
	{
		model.setNode(node);
	}

	public String getNode()
	{
		return model.getNode();
	}
}
