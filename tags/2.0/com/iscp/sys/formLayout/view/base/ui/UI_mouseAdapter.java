// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   UI_mouseAdapter.java

package com.iscp.sys.formLayout.view.base.ui;

import java.awt.Component;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

// Referenced classes of package com.iscp.sys.formLayout.view.base.ui:
//			MouseEventUI

public class UI_mouseAdapter extends MouseAdapter
{

	MouseEventUI adaptee;
	Component c;

	UI_mouseAdapter(MouseEventUI adaptee, Component c)
	{
		this.adaptee = adaptee;
		this.c = c;
	}

	public void mouseEntered(MouseEvent e)
	{
		if (c.isEnabled())
		{
			adaptee.mouseEntered(e);
			c.repaint();
		}
	}

	public void mouseExited(MouseEvent e)
	{
		if (c.isEnabled())
		{
			adaptee.mouseExited(e);
			c.repaint();
		}
	}
}
