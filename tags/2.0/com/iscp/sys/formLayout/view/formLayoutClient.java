// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   formLayoutClient.java

package com.iscp.sys.formLayout.view;

import com.iscp.sys.formLayout.model.TableModel;
import com.iscp.sys.formLayout.view.base.ui.MyUIConfig;
import java.applet.Applet;
import java.awt.BorderLayout;
import java.net.URL;

// Referenced classes of package com.iscp.sys.formLayout.view:
//			TableView, MainPane

public class formLayoutClient extends Applet
{

	private boolean isStandalone;
	private MainPane mainPane;
	private URL url;

	public String getParameter(String key, String def)
	{
		return isStandalone ? System.getProperty(key, def) : getParameter(key) == null ? def : getParameter(key);
	}

	public formLayoutClient()
	{
		isStandalone = false;
	}

	public void init()
	{
		String netmode = getParameter("netmode", "");
		String hideToolbar = getParameter("hideToolbar", "");
		try
		{
			if (netmode.length() == 0)
			{
				url = new URL("http://localhost:8080/FormLayout/formlayoutserver");
			} else
			{
				String urlstr = getCodeBase().toString();
				url = new URL((new StringBuilder(String.valueOf(urlstr))).append("/formlayoutserver").toString());
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		MyUIConfig.config();
		TableView t = new TableView(TableModel.getTestModel());
		mainPane = new MainPane(t, this);
		setLayout(new BorderLayout());
		add(mainPane);
		mainPane.Ability_FieldItemRemove = getParameter("disableFieldItemRemove", "false").equals("false");
		mainPane.Ability_FieldItemInsert = getParameter("disableFieldItemInsert", "false").equals("false");
		mainPane.Ability_FieldItemPropertyEdit = getParameter("disableFieldItemPropertyEdit", "false").equals("false");
		mainPane.Ability_FieldItemEventEdit = getParameter("disableFieldItemEventEdit", "false").equals("false");
		mainPane.Ability_FieldTextItemEdit = getParameter("disableFieldTextItemEdit", "false").equals("false");
		mainPane.Ability_FieldTextItemRemoveAndInsert = getParameter("disableFieldTextItemRemoveAndInsert", "false").equals("false");
		mainPane.Ability_JavaScriptEdit = getParameter("disableJavaScriptEdit", "false").equals("false");
		mainPane.Ability_TextItemEdit = getParameter("disableTextItemEdit", "false").equals("false");
		if (hideToolbar.length() > 0)
			mainPane.hideToolBar();
		String tableName = getParameter("tableName", null);
		if (tableName != null)
			mainPane.bindWithTable(tableName);
	}

	public URL getURL()
		throws Exception
	{
		return url;
	}

	public boolean preview()
	{
		return mainPane.preview();
	}

	public void fetchWebEditorResult()
	{
		mainPane.getTableView().fetchWebEditorResult();
	}

	public void clickButton(int i)
	{
		mainPane.buttonClicked(i);
	}

	public String getAppletInfo()
	{
		return "Applet Information";
	}

	public String[][] getParameterInfo()
	{
		return null;
	}
}
