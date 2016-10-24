// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CrossrefElement.java

package com.taiji.core.generator.plugingen;


public class CrossrefElement
{

	private String _name;
	private String _fkTable;
	private String _pkColumn;
	private String _fkColumn;
	private boolean _unique;

	public CrossrefElement()
	{
	}

	public CrossrefElement(String fkName, String fkTable, String pkColumn, String fkColumn)
	{
		_name = fkName;
		_fkTable = fkTable;
		_pkColumn = pkColumn;
		_fkColumn = fkColumn;
		_unique = false;
	}

	public CrossrefElement(String fkName, String fkTable, String pkColumn, String fkColumn, boolean unique)
	{
		_name = fkName;
		_fkTable = fkTable;
		_pkColumn = pkColumn;
		_fkColumn = fkColumn;
		_unique = unique;
	}

	public void setName(String name)
	{
		_name = name;
	}

	public void setFkTable(String fkTable)
	{
		_fkTable = fkTable;
	}

	public void setPkColumn(String pkColumn)
	{
		_pkColumn = pkColumn;
	}

	public void setFkColumn(String fkColumn)
	{
		_fkColumn = fkColumn;
	}

	public void setUnique(boolean unique)
	{
		_unique = unique;
	}

	public String getName()
	{
		return _name;
	}

	public String getFkTable()
	{
		return _fkTable;
	}

	public String getPkColumn()
	{
		return _pkColumn;
	}

	public String getFkColumn()
	{
		return _fkColumn;
	}

	public boolean getUnique()
	{
		return _unique;
	}
}
