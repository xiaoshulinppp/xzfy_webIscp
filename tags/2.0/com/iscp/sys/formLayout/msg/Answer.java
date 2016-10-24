// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Answer.java

package com.iscp.sys.formLayout.msg;

import com.iscp.sys.formLayout.model.TableModel;
import java.io.Serializable;

// Referenced classes of package com.iscp.sys.formLayout.msg:
//			MsgField, MsgTable, MsgDict

public class Answer
	implements Serializable
{

	public Exception error;
	public MsgField msgFieldList[];
	public MsgTable msgTableList[];
	public String fileNameList[];
	public String directoryList[];
	public MsgDict dictList[];
	public boolean directoryEmpty;
	public TableModel tableModel;
	public String previewHtml;

	public Answer()
	{
	}
}
