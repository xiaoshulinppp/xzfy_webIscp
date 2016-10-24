// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MapTool.java

package com.iscp.sys.coderClient;

import com.iscp.sys.coderClient.view.struct.MainPane;
import com.iscp.sys.coderMsg.MsgComponent;
import java.applet.Applet;
import java.awt.Dimension;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

public class MapTool extends Applet
	implements MsgComponent
{

	private boolean isStandalone;
	private String layoutUrl;
	private String url;
	private String generateTemplate;
	protected Map paramMap;

	public MapTool()
	{
		isStandalone = false;
		paramMap = new HashMap();
	}

	public String getAppletInfo()
	{
		return "Applet Information";
	}

	public Map getParamMap()
	{
		return paramMap;
	}

	public URL getLayoutURL()
		throws Exception
	{
		if (layoutUrl.equals("TEST"))
			return new URL("http://localhost:8083/xx/formlayoutserver");
		else
			return new URL((new StringBuilder(String.valueOf(getCodeBase().toString()))).append(layoutUrl).toString());
	}

	public String getParameter(String key, String def)
	{
		return isStandalone ? System.getProperty(key, def) : getParameter(key) != null ? getParameter(key) : def;
	}

	public String[][] getParameterInfo()
	{
		return null;
	}

	public String getGenerateTemplate()
	{
		return generateTemplate;
	}

	public URL getURL()
		throws Exception
	{
		if (url.equals("TEST"))
			return new URL("http://localhost:8083/xx/coderserver");
		else
			return new URL((new StringBuilder(String.valueOf(getCodeBase().toString()))).append(url).toString());
	}

	public void init()
	{
		try
		{
			jbInit();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	private void jbInit()
		throws Exception
	{
		viewInit();
	}

	protected void viewInit()
	{
		MainPane mainPane = new MainPane();
		int w = Integer.parseInt(getParameter("width", "800"));
		int h = Integer.parseInt(getParameter("height", "600"));
		generateTemplate = getParameter("generateTemplate", "base");
		url = getParameter("coderserver", "../coderserver");
		layoutUrl = getParameter("formlayoutserver", "../formlayoutserver");
		mainPane.setPreferredSize(new Dimension(w, h - 20));
		add(mainPane);
		mainPane.setActive();
	}
}
