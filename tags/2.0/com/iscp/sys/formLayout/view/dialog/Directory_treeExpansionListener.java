// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyFileDialog.java

package com.iscp.sys.formLayout.view.dialog;

import javax.swing.event.TreeExpansionEvent;
import javax.swing.event.TreeExpansionListener;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			MyFileDialog

class Directory_treeExpansionListener
	implements TreeExpansionListener
{

	private MyFileDialog dialog;

	Directory_treeExpansionListener(MyFileDialog dialog)
	{
		this.dialog = dialog;
	}

	public void treeCollapsed(TreeExpansionEvent treeexpansionevent)
	{
	}

	public void treeExpanded(TreeExpansionEvent e)
	{
		dialog.directory_treeExpanded(e);
	}
}
