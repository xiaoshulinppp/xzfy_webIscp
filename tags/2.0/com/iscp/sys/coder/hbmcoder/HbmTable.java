// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   HbmTable.java

package com.iscp.sys.coder.hbmcoder;

import com.iscp.sys.coder.beancoder.BeanCoder;
import com.iscp.sys.coder.model.TableInterface;

public class HbmTable
{

	private String name;
	private String table;

	public HbmTable(TableInterface table)
	{
		name = BeanCoder.firstUpperCase(table.getLogName());
		this.table = table.getTabName();
	}

	public String getName()
	{
		return name;
	}

	public String getTable()
	{
		return table;
	}
}
