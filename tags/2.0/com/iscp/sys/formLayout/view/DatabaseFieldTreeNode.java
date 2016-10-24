// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MainPane.java

package com.iscp.sys.formLayout.view;

import com.iscp.sys.formLayout.msg.MsgField;
import javax.swing.tree.DefaultMutableTreeNode;

class DatabaseFieldTreeNode extends DefaultMutableTreeNode
{

	MsgField field;
	String name;

	public DatabaseFieldTreeNode(MsgField field)
	{
		setField(field);
	}

	public void setField(MsgField field)
	{
		this.field = field;
		if (field == null)
			return;
		if (field.getRelatedTable() != null)
			name = (new StringBuilder(String.valueOf(field.getByName()))).append("(").append(field.getRelatedTable()).append(")").toString();
		name = (new StringBuilder(String.valueOf(field.getByName()))).append("(").append(field.getName()).append(")").toString();
	}

	public String toString()
	{
		if (field == null)
			return "?????????";
		else
			return name;
	}
}
