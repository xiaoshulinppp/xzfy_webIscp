// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MouseEventComponent.java

package com.iscp.sys.formLayout.view.base;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

// Referenced classes of package com.iscp.sys.formLayout.view.base:
//			MouseEventComponent

class MouseEventSourceComponent_this_mouseAdapter extends MouseAdapter
{

	MouseEventComponent adaptee;

	MouseEventSourceComponent_this_mouseAdapter(MouseEventComponent adaptee)
	{
		this.adaptee = adaptee;
	}

	public void mouseClicked(MouseEvent e)
	{
		adaptee.mouseClicked(e);
	}

	public void mousePressed(MouseEvent e)
	{
		adaptee.mousePressed(e);
	}

	public void mouseReleased(MouseEvent e)
	{
		adaptee.mouseReleased(e);
	}

	public void mouseEntered(MouseEvent e)
	{
		adaptee.mouseEntered(e);
	}

	public void mouseExited(MouseEvent e)
	{
		adaptee.mouseExited(e);
	}
}
