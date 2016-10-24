// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyFileDialog.java

package com.iscp.sys.formLayout.view.dialog;

import javax.swing.event.TreeExpansionEvent;
import javax.swing.event.TreeWillExpandListener;
import javax.swing.tree.ExpandVetoException;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			MyFileDialog

class Directory_treeWillExpandListener
	implements TreeWillExpandListener
{

	private MyFileDialog dialog;

	Directory_treeWillExpandListener(MyFileDialog dialog)
	{
		this.dialog = dialog;
	}

	public void treeWillCollapse(TreeExpansionEvent treeexpansionevent)
	{
	}

	public void treeWillExpand(TreeExpansionEvent e)
		throws ExpandVetoException
	{
		dialog.directory_treeWillExpand(e);
	}
}
