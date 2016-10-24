// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   DbNameConverter.java

package com.taiji.core.generator.plugingen;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

// Referenced classes of package com.taiji.core.generator.plugingen:
//			DbNameConverterOtherImpl

public abstract class DbNameConverter
{

	protected static DbNameConverter _instance = null;
	private static final Log log = LogFactory.getLog(com/taiji/core/generator/plugingen/DbNameConverter);

	public DbNameConverter()
	{
	}

	public abstract String columnNameToVariableName(String s);

	public abstract String tableNameToVariableName(String s);

	public abstract String tableNameToVariableName1(String s);

	public abstract String columnNameToVariableName1(String s);

	public static DbNameConverter getInstance()
	{
		if (_instance == null)
			_instance = new DbNameConverterOtherImpl();
		return _instance;
	}

}
