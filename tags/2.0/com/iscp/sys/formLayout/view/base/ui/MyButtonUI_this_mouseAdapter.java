// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyButtonUI.java

package com.iscp.sys.formLayout.view.base.ui;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.JComponent;

// Referenced classes of package com.iscp.sys.formLayout.view.base.ui:
//			MyButtonUI

class MyButtonUI_this_mouseAdapter extends MouseAdapter
{

	MyButtonUI adaptee;

	MyButtonUI_this_mouseAdapter(MyButtonUI adaptee)
	{
		this.adaptee = adaptee;
	}

	public void mousePressed(MouseEvent e)
	{
		adaptee.this_mousePressed(e);
	}

	public void mouseReleased(MouseEvent e)
	{
		adaptee.this_mouseReleased(e);
	}

	public void mouseEntered(MouseEvent e)
	{
		adaptee.this_mouseEntered(e);
		adaptee.c.repaint();
	}

	public void mouseExited(MouseEvent e)
	{
		adaptee.this_mouseExited(e);
		adaptee.c.repaint();
	}
}
