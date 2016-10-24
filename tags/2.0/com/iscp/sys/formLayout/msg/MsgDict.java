// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MsgDict.java

package com.iscp.sys.formLayout.msg;

import java.io.Serializable;

public class MsgDict
	implements Serializable
{

	public int id;
	public String name;
	public String abbr;

	public MsgDict()
	{
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getId()
	{
		return id;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getName()
	{
		return name;
	}

	public void setAbbr(String abbr)
	{
		this.abbr = abbr;
	}

	public String getAbbr()
	{
		return abbr;
	}

	public String toString()
	{
		return name;
	}
}
