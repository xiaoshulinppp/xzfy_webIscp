// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ColumnMap.java

package com.taiji.core.generator.plugingen;


public class ColumnMap
{

	private String _primaryKey;
	private String _foreignKey;
	private boolean _unique;

	public ColumnMap(String primaryKey, String foreignKey)
	{
		_unique = false;
		_primaryKey = primaryKey;
		_foreignKey = foreignKey;
	}

	public ColumnMap(String primaryKey, String foreignKey, boolean unique)
	{
		_unique = false;
		_primaryKey = primaryKey;
		_foreignKey = foreignKey;
		_unique = unique;
	}

	public boolean getUnique()
	{
		return _unique;
	}

	public void setUnique(boolean unique)
	{
		_unique = unique;
	}

	public String getPrimaryKey()
	{
		return _primaryKey;
	}

	public String getForeignKey()
	{
		return _foreignKey;
	}
}
