// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyComboBoxUI.java

package com.iscp.sys.formLayout.view.base.ui;

import com.iscp.sys.formLayout.view.base.RectPattern;
import java.awt.Graphics;
import java.awt.Rectangle;
import java.awt.event.MouseEvent;
import javax.swing.*;
import javax.swing.plaf.ComponentUI;
import javax.swing.plaf.basic.BasicComboBoxUI;

// Referenced classes of package com.iscp.sys.formLayout.view.base.ui:
//			MouseEventUI, MyUIConfig, UI_mouseAdapter

public class MyComboBoxUI extends BasicComboBoxUI
	implements MouseEventUI
{

	private static Icon buttonIcon = MyUIConfig.getIcon("combobox.gif");
	private boolean mouseIn;

	public MyComboBoxUI()
	{
		mouseIn = false;
	}

	public void mouseEntered(MouseEvent e)
	{
		mouseIn = true;
	}

	public void mouseExited(MouseEvent e)
	{
		mouseIn = false;
	}

	public static ComponentUI createUI(JComponent c)
	{
		MyComboBoxUI t = new MyComboBoxUI();
		c.addMouseListener(new UI_mouseAdapter(t, c));
		return t;
	}

	public void paintCurrentValueBackground(Graphics g, Rectangle bounds, boolean hasFocus)
	{
		if (mouseIn)
			RectPattern.paintLightBack(g, 0, 0, bounds.width, bounds.height);
	}

	public void paint(Graphics g, JComponent c)
	{
		c.setBorder(null);
		super.paint(g, c);
	}

	protected JButton createArrowButton()
	{
		JButton arrow = new JButton(buttonIcon);
		arrow.setFocusable(false);
		return arrow;
	}

}
