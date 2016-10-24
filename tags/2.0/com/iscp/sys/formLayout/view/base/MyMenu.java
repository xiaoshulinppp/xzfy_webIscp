// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyMenu.java

package com.iscp.sys.formLayout.view.base;

import com.iscp.sys.formLayout.view.MyMenuSourcePane;
import java.awt.event.ActionEvent;
import javax.swing.*;

// Referenced classes of package com.iscp.sys.formLayout.view.base:
//			Menu_actionAdapter, MyMenuItem

public class MyMenu extends JPopupMenu
{

	private MyMenuSourcePane pane;

	public MyMenu(MyMenuSourcePane pane)
	{
		this.pane = pane;
	}

	public void show(int x, int y)
	{
		if (pane instanceof JComponent)
			show(((java.awt.Component) ((JComponent)pane)), x, y);
	}

	public JMenuItem add(MyMenuItem item)
	{
		if (item != null)
		{
			item.addActionListener(new Menu_actionAdapter(this, item));
			return (MyMenuItem)super.add(item);
		} else
		{
			return item;
		}
	}

	public void menu_actionPerformed(ActionEvent e, MyMenuItem item)
	{
		pane.menuActionPerformed(e, item);
	}
}
