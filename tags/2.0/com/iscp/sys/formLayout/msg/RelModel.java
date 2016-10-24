// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   RelModel.java

package com.iscp.sys.formLayout.msg;

import java.io.Serializable;

public class RelModel
	implements Serializable
{

	public int id;
	public String table_host;
	public String table_related;
	public String column_host;
	public String column_related;
	public int type;
	public String mid_table;
	public String mid_table_host;
	public String mid_table_related;
	public String name_class;
	public String name_related;
	public String inverse;
	private String listType;

	public RelModel()
	{
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getId()
	{
		return id;
	}

	public void setTable_host(String table_host)
	{
		this.table_host = table_host;
	}

	public String getTable_host()
	{
		return table_host;
	}

	public void setTable_related(String table_related)
	{
		this.table_related = table_related;
	}

	public String getTable_related()
	{
		return table_related;
	}

	public void setColumn_host(String column_host)
	{
		this.column_host = column_host;
	}

	public String getColumn_host()
	{
		return column_host;
	}

	public void setColumn_related(String column_related)
	{
		this.column_related = column_related;
	}

	public String getColumn_related()
	{
		return column_related;
	}

	public void setType(int type)
	{
		this.type = type;
	}

	public int getType()
	{
		return type;
	}

	public void setMid_table(String mid_table)
	{
		this.mid_table = mid_table;
	}

	public String getMid_table()
	{
		return mid_table;
	}

	public void setMid_table_host(String mid_table_host)
	{
		this.mid_table_host = mid_table_host;
	}

	public String getMid_table_host()
	{
		return mid_table_host;
	}

	public void setMid_table_related(String mid_table_related)
	{
		this.mid_table_related = mid_table_related;
	}

	public String getMid_table_related()
	{
		return mid_table_related;
	}

	public void setInverse(String inverse)
	{
		this.inverse = inverse;
	}

	public String getInverse()
	{
		return inverse;
	}

	public void setListType(String listType)
	{
		this.listType = listType;
	}

	public String getListType()
	{
		return listType;
	}
}
