// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   HbmColumn.java

package com.iscp.sys.coder.hbmcoder;

import com.iscp.sys.coder.model.*;
import com.iscp.sys.coderMsg.CodeNameProducer;

public class HbmColumn
{

	public static final int ONE_TO_ONE = 0;
	public static final int ONE_TO_MANY = 1;
	public static final int MANY_TO_ONE = 2;
	public static final int MANY_TO_MANY = 3;
	public static final int ID = 4;
	public static final int PROPERTY = 5;
	public static final String TYPES[] = {
		"one-to-one", "set", "many-to-one", "set", "id", "property"
	};
	public static final String VALUETYPES[] = {
		"integer", "java.lang.String"
	};
	public static final String VALUETYPES_JAVA[] = {
		"int", "String"
	};
	private int hbmType;
	private String name;
	private String logName;
	private boolean isId;
	private int valueType;
	private String valueTypeName;
	private String relatedColumn;
	private String relatedClass;
	private boolean isOperator;
	private String property_ref;
	private String column;
	private String cascade;
	private boolean isManyToManyOperator;
	private String midTableName;
	private String midTableColumnName_host;
	private String midTableColumnName_related;
	private boolean isIdHost;
	private boolean isIdRelated;

	public int getHbmType()
	{
		return hbmType;
	}

	private void idTypeInit(IdTypeInterface idType)
	{
		if (idType.getType() == 1)
			valueType = 1;
		else
		if (idType.getType() == 0)
			valueType = 0;
	}

	public HbmColumn(FieldInterface column, IdTypeInterface idType)
	{
		isId = false;
		valueType = 1;
		isOperator = true;
		isManyToManyOperator = true;
		if (column.getTypeName() != null && column.getTypeName().equals("String"))
			valueType = 1;
		else
			valueType = 0;
		name = column.getName();
		logName = column.getLogName();
		isId = column.getIsKey().equals("1");
		isOperator = column.isOperator();
		if (isId && isOperator)
			idTypeInit(idType);
		if (isId)
			hbmType = 4;
		else
			hbmType = 5;
	}

	public String getName()
	{
		return name;
	}

	public String getLogName()
	{
		return logName;
	}

	public boolean isId()
	{
		return isId;
	}

	public HbmColumn(RelationInterface rel)
	{
		isId = false;
		valueType = 1;
		isOperator = true;
		isManyToManyOperator = true;
		name = rel.getName_related();
		column = rel.getColumn_host();
		relatedColumn = rel.getColumn_related();
		relatedClass = firstUpperCase(rel.getName_class());
		midTableName = rel.getMid_table();
		midTableColumnName_host = rel.getMid_table_host();
		midTableColumnName_related = rel.getMid_table_related();
		valueType = TYPES.length;
		valueTypeName = firstUpperCase(rel.getName_class());
		hbmType = rel.getType();
		property_ref = CodeNameProducer.getMethodName(rel.getColumn_related());
		isOperator = getHbmType() != 3 && rel.getInverse() != null && rel.getInverse().equals("0");
		isManyToManyOperator = rel.getInverse() == null || rel.getInverse().equals("0");
		isIdRelated = rel.getType() != 1;
		isIdHost = rel.getType() != 2;
	}

	public void setNameWithColumn(String column)
	{
		this;
		name;
		JVM INSTR new #197 <Class StringBuilder>;
		JVM INSTR dup_x1 ;
		JVM INSTR swap ;
		String.valueOf();
		StringBuilder();
		"_";
		append();
		column;
		append();
		toString();
		name;
	}

	public String getHbmTypeName()
	{
		return TYPES[hbmType];
	}

	public String getValueTypeName()
	{
		if (valueType < VALUETYPES.length)
			return VALUETYPES[valueType];
		else
			return valueTypeName;
	}

	public String getValueTypeName_java()
	{
		if (valueType < VALUETYPES_JAVA.length)
			return VALUETYPES_JAVA[valueType];
		else
			return valueTypeName;
	}

	public String getRelatedColumn()
	{
		return relatedColumn;
	}

	public String getRelatedClass()
	{
		return relatedClass;
	}

	public boolean isOperator()
	{
		return isOperator;
	}

	public String getProperty_ref()
	{
		return property_ref;
	}

	public String getColumn()
	{
		return column;
	}

	public String getCascade()
	{
		return cascade;
	}

	public boolean isManyToManyOperator()
	{
		return isManyToManyOperator;
	}

	public String getMidTableName()
	{
		return midTableName;
	}

	public String getMidTableColumnName_host()
	{
		return midTableColumnName_host;
	}

	public String getMidTableColumnName_related()
	{
		return midTableColumnName_related;
	}

	public boolean isIdHost()
	{
		return isIdHost;
	}

	public boolean isIdRelated()
	{
		return isIdRelated;
	}

	private static String firstUpperCase(String name)
	{
		String newname = name.substring(0, 1);
		newname = (new StringBuilder(String.valueOf(newname.toUpperCase()))).append(name.substring(1)).toString();
		return newname;
	}

}
