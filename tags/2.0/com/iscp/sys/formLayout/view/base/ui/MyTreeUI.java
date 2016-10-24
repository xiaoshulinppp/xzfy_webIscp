// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyTreeUI.java

package com.iscp.sys.formLayout.view.base.ui;

import com.iscp.sys.formLayout.view.icon.MyIcon;
import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.plaf.ComponentUI;
import javax.swing.plaf.basic.BasicTreeUI;

public class MyTreeUI extends BasicTreeUI
{

	private static Icon collapsed_icon = MyIcon.getIcon("tree_close.gif");
	private static Icon expanded_icon = MyIcon.getIcon("tree_expand.gif");

	public MyTreeUI()
	{
	}

	public static ComponentUI createUI(JComponent x)
	{
		BasicTreeUI ui = new BasicTreeUI();
		ui.setCollapsedIcon(collapsed_icon);
		ui.setExpandedIcon(expanded_icon);
		return ui;
	}

}
