// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   LayoutOpenDialog.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.msg.MsgTable;
import javax.swing.tree.DefaultMutableTreeNode;

class LayoutTreeNode extends DefaultMutableTreeNode
{

	private MsgTable table;
	private String name;

	public LayoutTreeNode(MsgTable table)
	{
		name = "";
		setTable(table);
	}

	public void setTable(MsgTable table)
	{
		this.table = table;
		if (table == null || table.logTable == null)
			name = "?\262???";
		else
			name = table.logTable;
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
