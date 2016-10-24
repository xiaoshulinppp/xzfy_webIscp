// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   DbColumn.java

package com.taiji.core.generator.plugingen;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

// Referenced classes of package com.taiji.core.generator.plugingen:
//			Column, Table

public class DbColumn
	implements Column
{

	private final Table _table;
	private final int _sqlType;
	private final String _sqlTypeName;
	private final String _sqlName;
	private final int _size;
	private final int _decimalDigits;
	private final String _defaultValue;
	private boolean _isPk;
	private boolean _isFk;
	private boolean _isNullable;
	private boolean _isIndexed;
	private boolean _isUnique;
	private static final Log _log = LogFactory.getLog(com/taiji/core/generator/plugingen/DbColumn);

	public DbColumn(Table table, int sqlType, String sqlTypeName, String sqlName, int size, int decimalDigits, boolean isPk, 
			boolean isNullable, boolean isIndexed, boolean isUnique, String defaultValue)
	{
		_table = table;
		_sqlType = sqlType;
		_sqlName = sqlName;
		_sqlTypeName = sqlTypeName;
		_size = size;
		_decimalDigits = decimalDigits;
		_isPk = isPk;
		_isNullable = isNullable;
		_isIndexed = isIndexed;
		_isUnique = isUnique;
		_defaultValue = defaultValue;
		_log.debug((new StringBuilder(String.valueOf(sqlName))).append("isPK->").append(isPk).toString());
	}

	public Table getTable()
	{
		return _table;
	}

	public int getSqlType()
	{
		return _sqlType;
	}

	public String getSqlTypeName()
	{
		return _sqlTypeName;
	}

	public String getSqlName()
	{
		return _sqlName;
	}

	public int getSize()
	{
		return _size;
	}

	public int getDecimalDigits()
	{
		return _decimalDigits;
	}

	public String getDefaultValue()
	{
		return _defaultValue;
	}

	public boolean isPk()
	{
		return _isPk;
	}

	public boolean isFk()
	{
		return _isFk;
	}

	public boolean isNullable()
	{
		return _isNullable;
	}

	public boolean isIndexed()
	{
		return _isIndexed;
	}

	public boolean isUnique()
	{
		return _isUnique;
	}

	public void setFk(boolean isFk)
	{
		_isFk = isFk;
	}

	public int hashCode()
	{
		return (new StringBuilder(String.valueOf(getTable().getSqlName()))).append(" ## ").append(getSqlName()).toString().hashCode();
	}

	public boolean equals(Object that)
	{
		return this == that;
	}

	public String toString()
	{
		return getSqlName();
	}

}
