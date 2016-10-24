// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MsgTable.java

package com.iscp.sys.formLayout.msg;

import java.io.Serializable;

public class MsgTable
	implements Serializable
{

	public int id;
	public String name;
	public String logTable;
	public String desc;
	public String showName;

	public MsgTable()
	{
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getLogTable()
	{
		return logTable;
	}

	public void setLogTable(String logTable)
	{
		this.logTable = logTable;
	}

	public void setDesc(String desc)
	{
		this.desc = desc;
	}

	public String getDesc()
	{
		return desc;
	}

	public void setShowName(String showName)
	{
		this.showName = showName;
	}

	public String getShowName()
	{
		return showName;
	}
}
