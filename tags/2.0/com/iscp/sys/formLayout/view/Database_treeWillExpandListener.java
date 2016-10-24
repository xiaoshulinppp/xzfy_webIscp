// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MainPane.java

package com.iscp.sys.formLayout.view;

import javax.swing.event.TreeExpansionEvent;
import javax.swing.event.TreeWillExpandListener;
import javax.swing.tree.ExpandVetoException;

// Referenced classes of package com.iscp.sys.formLayout.view:
//			MainPane

class Database_treeWillExpandListener
	implements TreeWillExpandListener
{

	MainPane mainPane;

	Database_treeWillExpandListener(MainPane mainPane)
	{
		this.mainPane = mainPane;
	}

	public void treeWillCollapse(TreeExpansionEvent treeexpansionevent)
	{
	}

	public void treeWillExpand(TreeExpansionEvent e)
		throws ExpandVetoException
	{
		mainPane.database_treeWillExpand(e);
	}
}
