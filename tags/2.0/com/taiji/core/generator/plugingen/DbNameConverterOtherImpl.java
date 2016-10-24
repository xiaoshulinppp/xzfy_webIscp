// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   DbNameConverterOtherImpl.java

package com.taiji.core.generator.plugingen;


// Referenced classes of package com.taiji.core.generator.plugingen:
//			DbNameConverter

public class DbNameConverterOtherImpl extends DbNameConverter
{

	public DbNameConverterOtherImpl()
	{
	}

	public String columnNameToVariableName(String columnName)
	{
		return DbNameToVariableName(columnName, false);
	}

	public String columnNameToVariableName1(String columnName)
	{
		return DbNameToVariableName1(columnName, false);
	}

	public String tableNameToVariableName(String tableName)
	{
		return DbNameToVariableName(tableName, true);
	}

	public String tableNameToVariableName1(String tableName)
	{
		return DbNameToVariableName1(tableName, true);
	}

	public String DbNameToVariableName1(String dbName, boolean capitalize)
	{
		if (dbName.equals(""))
			return dbName;
		int index = dbName.lastIndexOf("_");
		if (index >= 0)
		{
			String tempString[] = dbName.split("_");
			String result1 = tempString[0];
			for (int i = 1; i < tempString.length; i++)
				result1 = (new StringBuilder(String.valueOf(result1))).append(tempString[i].substring(0, 1).toUpperCase()).append(tempString[i].substring(1)).toString();

			dbName = result1;
		}
		return dbName;
	}

	public String DbNameToVariableName(String dbName, boolean capitalize)
	{
		StringBuffer result = new StringBuffer();
		if (dbName.equals(""))
			return dbName;
		boolean lastDecapitalize = false;
		boolean lastcapitalize = false;
		int index = dbName.lastIndexOf("_");
		dbName = dbName.substring(index + 1);
		for (int i = 0; i < dbName.length(); i++)
		{
			String temp = dbName.substring(i, i + 1);
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

		return result.toString();
	}
}
