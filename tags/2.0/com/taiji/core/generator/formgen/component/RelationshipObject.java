// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   RelationshipObject.java

package com.taiji.core.generator.formgen.component;


public class RelationshipObject
{

	private String tableHostClassName;
	private String tableHostName;
	private String tableRelatedClassName;
	private String tableRelatedName;
	private String tableHostObjectName;
	private String tableRelatedObjectName;
	private String columnHostClassName;
	private String columnRelatedClassName;
	private String columnHostObjectName;
	private String columnRelatedObjectName;
	private int type;
	private String midTableClassName;
	private String midTableName;
	private String midTableObjectName;
	private String showListType;
	private String inverse;

	public RelationshipObject()
	{
	}

	public void setTableHostClassName(String tableHostClassName)
	{
		this.tableHostClassName = tableHostClassName;
	}

	public String getTableHostClassName()
	{
		return tableHostClassName;
	}

	public void setTableHostName(String tableHostName)
	{
		this.tableHostName = tableHostName;
	}

	public String getTableHostName()
	{
		return tableHostName;
	}

	public void setTablRelatedClassName(String tableRelatedClassName)
	{
		this.tableRelatedClassName = tableRelatedClassName;
	}

	public String getTableRelatedClassName()
	{
		return tableRelatedClassName;
	}

	public void setTablRelatedName(String tableRelatedName)
	{
		this.tableRelatedName = tableRelatedName;
	}

	public String getTableRelatedName()
	{
		return tableRelatedName;
	}

	public void setColumnHostClassName(String columnHostClassName)
	{
		this.columnHostClassName = columnHostClassName;
	}

	public String getColumnHostClassName()
	{
		return columnHostClassName;
	}

	public void setColumnRelatedClassName(String columnRelatedClassName)
	{
		this.columnRelatedClassName = columnRelatedClassName;
	}

	public String getColumnRelatedClassName()
	{
		return columnRelatedClassName;
	}

	public void setType(int type)
	{
		this.type = type;
	}

	public int getType()
	{
		return type;
	}

	public void setTableHostObjectName(String tableHostObjectName)
	{
		this.tableHostObjectName = tableHostObjectName;
	}

	public String getTableHostObjectName()
	{
		return tableHostObjectName;
	}

	public void setTablRelatedObjectName(String tableRelatedObjectName)
	{
		this.tableRelatedObjectName = tableRelatedObjectName;
	}

	public String getTableRelatedObjectName()
	{
		return tableRelatedObjectName;
	}

	public void setColumnHostObjectName(String columnHostObjectName)
	{
		this.columnHostObjectName = columnHostObjectName;
	}

	public String getColumnHostObjectName()
	{
		return columnHostObjectName;
	}

	public void setColumnRelatedObjectName(String columnRelatedObjectName)
	{
		this.columnRelatedObjectName = columnRelatedObjectName;
	}

	public String getColumnRelatedObjectName()
	{
		return columnRelatedClassName;
	}

	public void setMidTableClassName(String midTableClassName)
	{
		this.midTableClassName = midTableClassName;
	}

	public String getMidTableClassName()
	{
		return midTableClassName;
	}

	public void setMidTableName(String midTableName)
	{
		this.midTableName = midTableName;
	}

	public String getMidTableName()
	{
		return midTableName;
	}

	public void setInverse(String inverse)
	{
		this.inverse = inverse;
	}

	public String getInverse()
	{
		return inverse;
	}

	public void setMidTableObjectName(String midTableObjectName)
	{
		this.midTableObjectName = midTableObjectName;
	}

	public String getMidTableObjectName()
	{
		return midTableObjectName;
	}

	public void setShowListType(String showListType)
	{
		this.showListType = showListType;
	}

	public String getShowListType()
	{
		return showListType;
	}

	public String getMixSqlTableName()
	{
		return (new StringBuilder(String.valueOf(tableHostName))).append(tableRelatedName).toString();
	}
}
