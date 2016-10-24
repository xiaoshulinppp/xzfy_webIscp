// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   StringJoiner.java

package com.iscp.sys.coder;

import java.util.LinkedList;

public class StringJoiner
{

	private LinkedList list;
	private int length;
	private static String tabStr[] = new String[8];

	public StringJoiner()
	{
		list = new LinkedList();
		length = 0;
	}

	public void insert(String str)
	{
		list.addLast(str);
		length += str.length();
	}

	public void insertln(String str)
	{
		list.addLast((new StringBuilder(String.valueOf(str))).append("\r\n").toString());
		length += str.length() + 2;
	}

	public void insert(int tab, String str)
	{
		list.addLast((new StringBuilder(String.valueOf(getTab(tab)))).append(str).toString());
		length += str.length() + tab * 3;
	}

	public void insertln(int tab, String str)
	{
		list.addLast((new StringBuilder(String.valueOf(getTab(tab)))).append(str).append("\r\n").toString());
		length += str.length() + 2 + tab * 3;
	}

	private String getTab(int tab)
	{
		if (tab < 8)
		{
			if (tabStr[tab] == null)
				tabStr[tab] = getTabSpace(tab);
			return tabStr[tab];
		} else
		{
			return getTabSpace(tab);
		}
	}

	public static String getTabSpace(int tab)
	{
		if (tab < 0)
			return "";
		char temp[] = new char[tab * 3];
		for (int i = 0; i < temp.length; i++)
			temp[i] = ' ';

		return new String(temp);
	}

	public String flush()
	{
		StringBuffer temp = new StringBuffer(length);
		int size = list.size();
		for (int i = 0; i < size; i++)
			temp.append((String)list.removeFirst());

		length = 0;
		return temp.toString();
	}

}
