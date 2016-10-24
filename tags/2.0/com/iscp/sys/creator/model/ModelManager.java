// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ModelManager.java

package com.iscp.sys.creator.model;

import com.iscp.sys.creator.relationManager.SYS_LogicFieldInterface;
import com.iscp.sys.creator.relationManager.SYS_LogicTableInterface;
import java.util.*;

// Referenced classes of package com.iscp.sys.creator.model:
//			BeanMod, PropertyMod

public class ModelManager
{

	public static boolean autoCommit_inverse = true;
	private Vector allBeans;
	private Map bean_table;

	public ModelManager()
	{
		allBeans = new Vector();
		bean_table = new HashMap();
	}

	public static String getBasedPackage()
	{
		return "com.iscp.database";
	}

	public static String getClassName(String tableName)
	{
		tableName = tableName.toLowerCase();
		String className = (new StringBuilder(String.valueOf((char)((tableName.charAt(0) + 65) - 97)))).append(tableName.substring(1)).toString();
		return className;
	}

	public static String getTableName(String className)
	{
		return className.substring(0, className.length() - 4);
	}

	public void addTable(SYS_LogicTableInterface table)
	{
		BeanMod bean = new BeanMod();
		bean.setName((new StringBuilder(String.valueOf(getBasedPackage()))).append(".").append(getClassName(table.getLogName())).toString());
		bean.setTable(table.getTabName());
		importProperties(table, bean);
		addBean(bean);
	}

	public void importBeans(SYS_LogicTableInterface tables[])
	{
		allBeans = new Vector();
		bean_table = new HashMap();
		for (int i = 0; i < tables.length; i++)
			addTable(tables[i]);

	}

	private void importProperties(SYS_LogicTableInterface table, BeanMod bean)
	{
		for (Iterator fields = table.getFields().iterator(); fields.hasNext();)
		{
			SYS_LogicFieldInterface field = (SYS_LogicFieldInterface)fields.next();
			PropertyMod property = new PropertyMod();
			property.setName(field.getName());
			property.setColumn(field.getName());
			property.setIsOperator(true);
			if (field.getIsKey() != null && field.getIsKey().equals("1"))
			{
				property.setType(0);
				property.setValueType(0);
			} else
			{
				property.setType(1);
			}
			if (field.getIsKey() == null || !field.getIsKey().equals("3"))
				bean.addProperty(property);
		}

	}

	public BeanMod[] getAllBeans()
	{
		int size = allBeans.size();
		BeanMod beans[] = new BeanMod[size];
		for (int i = 0; i < size; i++)
			beans[i] = (BeanMod)allBeans.get(i);

		return beans;
	}

	private void addBean(BeanMod bean)
	{
		allBeans.add(bean);
		bean_table.put(bean.getTable(), bean);
	}

	public BeanMod findBean(String tableName)
	{
		return (BeanMod)bean_table.get(tableName);
	}

}
