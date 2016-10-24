// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyMenuItemUI.java

package com.iscp.sys.formLayout.view.base.ui;

import com.iscp.sys.formLayout.view.base.MyMenuItem;
import com.iscp.sys.formLayout.view.base.RectPattern;
import java.awt.*;
import javax.swing.*;
import javax.swing.plaf.ComponentUI;
import javax.swing.plaf.basic.BasicMenuItemUI;

public class MyMenuItemUI extends BasicMenuItemUI
{

	private boolean mouseInside;
	private static Color selectedColor = new Color(195, 225, 255);
	private Image iconBuffer;

	public static ComponentUI createUI(JComponent c)
	{
		return new MyMenuItemUI();
	}

	public MyMenuItemUI()
	{
		mouseInside = false;
	}

	protected void paintMenuItem(Graphics g, JComponent component, Icon checkIcon, Icon arrowIcon, Color background, Color foreground, int defaultTextIconGap)
	{
		if (!(component instanceof JMenuItem))
			return;
		JMenuItem b = (JMenuItem)component;
		ButtonModel model = b.getModel();
		JMenuItem menuItem = (JMenuItem)component;
		int h = menuItem.getHeight();
		int w = menuItem.getWidth();
		g.setFont(menuItem.getFont());
		mouseInside = model.isArmed() || (component instanceof JMenu) && model.isSelected();
		component.setBorder(null);
		if (mouseInside)
			RectPattern.paintMouseInBack(g, 0, 0, w, h);
		else
			RectPattern.plastics(g, 0, 0, w, h, component.getBackground());
		int posx = 3;
		int posy = (h + g.getFont().getSize()) / 2;
		Icon icon = b.getIcon();
		if (icon != null)
		{
			icon.paintIcon(b, g, (w - icon.getIconWidth()) / 2, (h - icon.getIconHeight()) / 2);
			return;
		}
		if (menuItem.isEnabled())
		{
			g.setColor(menuItem.getForeground());
			g.drawString(menuItem.getText(), posx, posy - 1);
		} else
		{
			g.setColor(Color.white);
			g.drawString(menuItem.getText(), posx + 1, posy + 1);
			g.setColor(Color.lightGray);
			g.drawString(menuItem.getText(), posx, posy);
		}
		if (b instanceof MyMenuItem)
		{
			String quick = ((MyMenuItem)b).getQuick();
			if (quick != null)
			{
				int len = g.getFontMetrics().stringWidth(quick);
				g.drawString(quick, w - len - 2, posy);
			}
		}
	}

}
