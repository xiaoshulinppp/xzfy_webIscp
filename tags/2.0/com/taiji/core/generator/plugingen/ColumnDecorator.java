// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ColumnDecorator.java

package com.taiji.core.generator.plugingen;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

// Referenced classes of package com.taiji.core.generator.plugingen:
//			PreferenceAware, Column, DbColumn, TableDecorator, 
//			Table

public class ColumnDecorator extends PreferenceAware
	implements Column
{

	private final Column _subject;
	private TableDecorator _tableDecorator;
	private static final Log log = LogFactory.getLog(com/taiji/core/generator/plugingen/ColumnDecorator);

	public ColumnDecorator(Column subject)
	{
		if (!(subject instanceof DbColumn))
		{
			throw new IllegalArgumentException((new StringBuilder("subject must be class ")).append(com/taiji/core/generator/plugingen/DbColumn.getName()).append(" . but now was").append(subject.getClass().getName()).toString());
		} else
		{
			_subject = subject;
			return;
		}
	}

	public final Table getTable()
	{
		return _tableDecorator;
	}

	public final int getSqlType()
	{
		return _subject.getSqlType();
	}

	public final String getSqlTypeName()
	{
		return _subject.getSqlTypeName();
	}

	public final String getSqlName()
	{
		return _subject.getSqlName();
	}

	public final int getSize()
	{
		return _subject.getSize();
	}

	public final boolean isPk()
	{
		return _subject.isPk();
	}

	public final boolean isFk()
	{
		return _subject.isFk();
	}

	public final boolean isNullable()
	{
		return _subject.isNullable();
	}

	public final boolean isUnique()
	{
		return _subject.isUnique();
	}

	public final boolean isIndexed()
	{
		return _subject.isIndexed();
	}

	public final String getDefaultValue()
	{
		return _subject.getDefaultValue();
	}

	public final int getDecimalDigits()
	{
		return _subject.getDecimalDigits();
	}

	public void setTableDecorator(TableDecorator tableDecorator)
	{
		_tableDecorator = tableDecorator;
	}

}
