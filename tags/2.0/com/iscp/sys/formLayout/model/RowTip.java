// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   RowTip.java

package com.iscp.sys.formLayout.model;

import java.io.Serializable;

public class RowTip
	implements Serializable
{

	public String id;

	public RowTip()
	{
	}

	public RowTip(RowTip t)
	{
		id = t.id;
	}
}
