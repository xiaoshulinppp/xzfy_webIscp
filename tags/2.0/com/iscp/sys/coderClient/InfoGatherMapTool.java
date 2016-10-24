// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   InfoGatherMapTool.java

package com.iscp.sys.coderClient;

import com.iscp.sys.coderMsg.MsgComponent;
import java.util.Map;

// Referenced classes of package com.iscp.sys.coderClient:
//			MapTool

public class InfoGatherMapTool extends MapTool
	implements MsgComponent
{

	private String positionExps[];

	public InfoGatherMapTool()
	{
	}

	public String getAppletInfo()
	{
		return "Applet Information";
	}

	protected void viewInit()
	{
		String positionStrExp = getParameter("position", "test1[≤‚ ‘1]test2[≤‚ ‘2]");
		positionExps = positionStrExp.split("]");
		paramMap.put("position", positionExps);
		super.viewInit();
	}
}
