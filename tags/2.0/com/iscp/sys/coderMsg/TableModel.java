// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TableModel.java

package com.iscp.sys.coderMsg;

import com.iscp.sys.coder.model.TableInterface;
import java.io.Serializable;
import java.util.Set;

// Referenced classes of package com.iscp.sys.coderMsg:
//			CodeNameProducer

public class TableModel
	implements TableInterface, Serializable
{

	public int keyCount;
	public Set fields;
	public String logName;
	public String tabName;

	public TableModel()
	{
	}

	public Set getFields()
	{
		return fields;
	}

	public String getLogName()
	{
		if (logName == null)
			logName = CodeNameProducer.getClassName(tabName);
		return logName;
	}

	public String getTabName()
	{
		return tabName;
	}
}
