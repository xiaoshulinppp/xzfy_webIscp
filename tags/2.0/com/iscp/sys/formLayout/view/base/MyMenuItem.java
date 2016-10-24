// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyMenuItem.java

package com.iscp.sys.formLayout.view.base;

import javax.swing.JMenuItem;

public class MyMenuItem extends JMenuItem
{

	private String quick;

	public MyMenuItem(String a, String b)
	{
		super(a);
		setQuick(b);
	}

	public void setQuick(String quick)
	{
		this.quick = quick;
	}

	public String getQuick()
	{
		return quick;
	}
}
