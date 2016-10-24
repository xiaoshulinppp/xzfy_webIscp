// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MainPane.java

package com.iscp.sys.formLayout.view;

import com.iscp.sys.formLayout.msg.MsgTable;
import javax.swing.tree.DefaultMutableTreeNode;

class DatabaseTableTreeNode extends DefaultMutableTreeNode
{

	MsgTable table;
	String name;

	public DatabaseTableTreeNode(MsgTable table)
	{
		this.table = table;
		if (table.logTable == null)
			name = (new StringBuilder("¦Ä???????(")).append(table.name).append(")").toString();
		else
			name = (new StringBuilder(String.valueOf(table.logTable))).append("(").append(table.name).append(")").toString();
	}

	public String toString()
	{
		if (table == null)
			return "????????";
		else
			return name;
	}
}
