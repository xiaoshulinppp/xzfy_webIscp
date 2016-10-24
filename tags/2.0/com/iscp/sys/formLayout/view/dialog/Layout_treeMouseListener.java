// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   LayoutOpenDialog.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			LayoutOpenDialog

class Layout_treeMouseListener
	implements MouseListener
{

	LayoutOpenDialog d;

	Layout_treeMouseListener(LayoutOpenDialog d)
	{
		this.d = d;
	}

	public void mouseClicked(MouseEvent e)
	{
		d.layout_tree_mouseClicked(e);
	}

	public void mouseExited(MouseEvent mouseevent)
	{
	}

	public void mouseEntered(MouseEvent mouseevent)
	{
	}

	public void mousePressed(MouseEvent mouseevent)
	{
	}

	public void mouseReleased(MouseEvent mouseevent)
	{
	}
}
