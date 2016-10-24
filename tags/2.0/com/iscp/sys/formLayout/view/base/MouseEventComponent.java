// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MouseEventComponent.java

package com.iscp.sys.formLayout.view.base;

import java.awt.Font;
import java.awt.event.MouseEvent;
import javax.swing.*;

// Referenced classes of package com.iscp.sys.formLayout.view.base:
//			MouseEventSourceComponent_this_mouseMotionAdapter, MouseEventSourceComponent_this_mouseAdapter

public class MouseEventComponent extends JComponent
{

	public MouseEventComponent()
	{
		try
		{
			init();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public void mouseDragged(JComponent c, MouseEvent e)
	{
		java.awt.Container parent = getParent();
		if (parent != null && (parent instanceof MouseEventComponent))
			((MouseEventComponent)parent).mouseDragged(((JComponent) (this)), e);
	}

	public void mousePressed(JComponent c, MouseEvent e)
	{
		java.awt.Container parent = getParent();
		if (parent != null && (parent instanceof MouseEventComponent))
			((MouseEventComponent)parent).mousePressed(((JComponent) (this)), e);
	}

	public void mouseReleased(JComponent c, MouseEvent e)
	{
		java.awt.Container parent = getParent();
		if (parent != null && (parent instanceof MouseEventComponent))
			((MouseEventComponent)parent).mouseReleased(((JComponent) (this)), e);
	}

	public void mouseClicked(JComponent c, MouseEvent e)
	{
		java.awt.Container parent = getParent();
		if (parent != null && (parent instanceof MouseEventComponent))
			((MouseEventComponent)parent).mouseClicked(((JComponent) (this)), e);
	}

	public void mouseEntered(JComponent c, MouseEvent e)
	{
		java.awt.Container parent = getParent();
		if (parent != null && (parent instanceof MouseEventComponent))
			((MouseEventComponent)parent).mouseEntered(((JComponent) (this)), e);
	}

	public void mouseExited(JComponent c, MouseEvent e)
	{
		java.awt.Container parent = getParent();
		if (parent != null && (parent instanceof MouseEventComponent))
			((MouseEventComponent)parent).mouseExited(((JComponent) (this)), e);
	}

	public void mouseDragged(MouseEvent e)
	{
		java.awt.Container parent = getParent();
		if (parent != null && (parent instanceof MouseEventComponent))
			((MouseEventComponent)parent).mouseDragged(((JComponent) (this)), e);
	}

	public void mousePressed(MouseEvent e)
	{
		java.awt.Container parent = getParent();
		if (parent != null && (parent instanceof MouseEventComponent))
			((MouseEventComponent)parent).mousePressed(((JComponent) (this)), e);
	}

	public void mouseReleased(MouseEvent e)
	{
		java.awt.Container parent = getParent();
		if (parent != null && (parent instanceof MouseEventComponent))
			((MouseEventComponent)parent).mouseReleased(((JComponent) (this)), e);
	}

	public void mouseClicked(MouseEvent e)
	{
		java.awt.Container parent = getParent();
		if (parent != null && (parent instanceof MouseEventComponent))
			((MouseEventComponent)parent).mouseClicked(((JComponent) (this)), e);
	}

	public void mouseEntered(MouseEvent e)
	{
		java.awt.Container parent = getParent();
		if (parent != null && (parent instanceof MouseEventComponent))
			((MouseEventComponent)parent).mouseEntered(((JComponent) (this)), e);
	}

	public void mouseExited(MouseEvent e)
	{
		java.awt.Container parent = getParent();
		if (parent != null && (parent instanceof MouseEventComponent))
			((MouseEventComponent)parent).mouseExited(((JComponent) (this)), e);
	}

	public void mouseMoved(MouseEvent mouseevent)
	{
	}

	private void init()
		throws Exception
	{
		setFont((Font)UIManager.getDefaults().get("DefaultComponent.font"));
		addMouseMotionListener(new MouseEventSourceComponent_this_mouseMotionAdapter(this));
		addMouseListener(new MouseEventSourceComponent_this_mouseAdapter(this));
	}
}
