// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   DbNameConverterImpl.java

package com.taiji.core.generator.plugingen;


// Referenced classes of package com.taiji.core.generator.plugingen:
//			DbNameConverter

public class DbNameConverterImpl extends DbNameConverter
{

	public DbNameConverterImpl()
	{
	}

	public String columnNameToVariableName(String columnName)
	{
		return DbNameToVariableName(columnName, false);
	}

	public String columnNameToVariableName1(String columnName)
	{
		return DbNameToVariableName(columnName, false);
	}

	public String tableNameToVariableName(String tableName)
	{
		return DbNameToVariableName(tableName, true);
	}

	public String tableNameToVariableName1(String tableName)
	{
		return DbNameToVariableName(tableName, true);
	}

	public String DbNameToVariableName(String dbName, boolean capitalize)
	{
		StringBuffer result = new StringBuffer();
		if (dbName.equals(""))
			return dbName;
		boolean lastDecapitalize = false;
		boolean lastcapitalize = false;
		for (int i = 0; i < dbName.length(); i++)
		{
			String temp = dbName.substring(i, i + 1);
			if (temp.equals("_"))
			{
				capitalize = true;
			} else
			{
				if (temp.toUpperCase().equals(temp))
				{
					if (lastDecapitalize && !lastcapitalize)
						capitalize = true;
					lastcapitalize = true;
				} else
				{
					lastcapitalize = false;
				}
				if (capitalize)
				{
					result.append(temp.toUpperCase());
					capitalize = false;
				} else
				{
					result.append(temp.toLowerCase());
					lastDecapitalize = true;
				}
			}
		}

		return result.toString();
	}
}
