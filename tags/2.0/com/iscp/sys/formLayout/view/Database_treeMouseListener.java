// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MainPane.java

package com.iscp.sys.formLayout.view;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

// Referenced classes of package com.iscp.sys.formLayout.view:
//			MainPane

class Database_treeMouseListener
	implements MouseListener
{

	MainPane mainPane;

	Database_treeMouseListener(MainPane mainPane)
	{
		this.mainPane = mainPane;
	}

	public void mouseClicked(MouseEvent e)
	{
		mainPane.database_tree_mouseClicked(e);
	}

	public void mouseExited(MouseEvent mouseevent)
	{
	}

	public void mouseEntered(MouseEvent mouseevent)
	{
	}

	public void mousePressed(MouseEvent e)
	{
		mainPane.database_tree_mousePressed(e);
	}

	public void mouseReleased(MouseEvent e)
	{
		mainPane.database_tree_mouseReleased(e);
	}
}
