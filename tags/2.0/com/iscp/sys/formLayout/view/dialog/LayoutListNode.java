// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TableOpenDialog.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.msg.MsgTable;

class LayoutListNode
{

	private MsgTable table;
	private String name;

	public LayoutListNode(MsgTable table)
	{
		name = "";
		setTable(table);
	}

	public void setTable(MsgTable table)
	{
		this.table = table;
		if (table == null || table.logTable == null)
			name = (new StringBuilder("?\262???(")).append(table.name).append(")").toString();
		else
			name = (new StringBuilder(String.valueOf(table.showName))).append("(").append(table.name).append(")").toString();
	}

	public String toString()
	{
		return name;
	}

	public MsgTable getTable()
	{
		return table;
	}
}
