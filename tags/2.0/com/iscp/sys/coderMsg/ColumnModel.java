// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ColumnModel.java

package com.iscp.sys.coderMsg;

import com.iscp.sys.coder.model.FieldInterface;
import java.io.Serializable;

// Referenced classes of package com.iscp.sys.coderMsg:
//			CodeNameProducer

public class ColumnModel
	implements FieldInterface, Serializable
{

	public String name;
	public String isKey;
	public String logName;
	public String typeName;
	public boolean isOperator;

	public ColumnModel()
	{
		typeName = "String";
		isOperator = true;
	}

	public String getIsKey()
	{
		return isKey;
	}

	public String getName()
	{
		return name;
	}

	public String getLogName()
	{
		if (logName == null)
			logName = CodeNameProducer.getPropertyName(name);
		return logName;
	}

	public String getTypeName()
	{
		return typeName;
	}

	public boolean isOperator()
	{
		return isOperator;
	}
}
