// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   RelationModel_test.java

package com.iscp.sys.creator.relationManager;


public class RelationModel_test
{

	public static final int ONE_TO_ONE = 0;
	public static final int ONE_TO_MANY = 1;
	public static final int MANY_TO_ONE = 2;
	public static final int MANY_TO_MANY = 3;
	private int id;
	private String table_host;
	private String table_related;
	private String column_host;
	private String column_related;
	private int type;
	private String mid_table;
	private String mid_table_host;
	private String mid_table_related;

	public RelationModel_test()
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
}
