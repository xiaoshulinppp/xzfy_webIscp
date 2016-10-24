// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MySelectMenu.java

package com.iscp.sys.formLayout.view.base;

import java.awt.Dimension;
import java.awt.Image;
import javax.swing.*;

// Referenced classes of package com.iscp.sys.formLayout.view.base:
//			MySelectMenuItemActionListener, MyOperPane

public class MySelectMenu extends JPopupMenu
{

	private JMenuItem item[];
	MyOperPane pane;

	public MySelectMenu(MyOperPane pane, String imgfile[], String tiptext[])
	{
		this.pane = pane;
		int count = imgfile.length;
		item = new JMenuItem[count];
		for (int i = 0; i < count; i++)
		{
			item[i] = new JMenuItem();
			item[i].setIcon(getImageIcon(imgfile[i]));
			item[i].setToolTipText(tiptext[i]);
			item[i].addActionListener(new MySelectMenuItemActionListener(this, i));
			item[i].setPreferredSize(new Dimension(23, 23));
			add(item[i]);
		}

	}

	public Image getImage(int i)
	{
		return ((ImageIcon)item[i].getIcon()).getImage();
	}

	private static ImageIcon getImageIcon(String fileName)
	{
		return new ImageIcon(com/iscp/sys/formLayout/view/base/MySelectMenu.getResource(fileName));
	}
}
