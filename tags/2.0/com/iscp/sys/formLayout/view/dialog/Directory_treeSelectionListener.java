// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyFileDialog.java

package com.iscp.sys.formLayout.view.dialog;

import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			MyFileDialog

class Directory_treeSelectionListener
	implements TreeSelectionListener
{

	private MyFileDialog dialog;

	public Directory_treeSelectionListener(MyFileDialog dialog)
	{
		this.dialog = dialog;
	}

	public void valueChanged(TreeSelectionEvent e)
	{
		dialog.directory_tree_valueChanged(e);
	}
}
