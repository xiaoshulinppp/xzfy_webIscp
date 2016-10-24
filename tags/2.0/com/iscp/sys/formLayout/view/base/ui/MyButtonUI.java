// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyButtonUI.java

package com.iscp.sys.formLayout.view.base.ui;

import com.iscp.sys.formLayout.view.base.RectPattern;
import java.awt.*;
import java.awt.event.MouseEvent;
import javax.swing.*;
import javax.swing.plaf.ComponentUI;
import javax.swing.plaf.basic.BasicButtonUI;

// Referenced classes of package com.iscp.sys.formLayout.view.base.ui:
//			MyButtonUI_this_mouseAdapter, MyUIConfig

public class MyButtonUI extends BasicButtonUI
{

	private boolean buttonDown;
	private boolean mouseInside;
	JComponent c;

	public static ComponentUI createUI(JComponent c)
	{
		MyButtonUI buttonUI = new MyButtonUI();
		buttonUI.c = c;
		c.addMouseListener(new MyButtonUI_this_mouseAdapter(buttonUI));
		return buttonUI;
	}

	public MyButtonUI()
	{
		buttonDown = false;
		mouseInside = false;
	}

	private Dimension larger(Dimension d, int size_w, int size_h)
	{
		d.height += size_h;
		d.width += size_w;
		return d;
	}

	public Dimension getMinimumSize(JComponent c)
	{
		Dimension d = super.getMinimumSize(c);
		return larger(d, 8, 3);
	}

	public Dimension getPreferredSize(JComponent c)
	{
		Dimension d = super.getPreferredSize(c);
		return larger(d, 8, 3);
	}

	public void paint(Graphics g, JComponent button)
	{
		MyUIConfig.setFontDefault(button);
		button.setBorder(null);
		if (!(button instanceof AbstractButton))
			return;
		AbstractButton component = (AbstractButton)button;
		int h = component.getHeight();
		int w = component.getWidth();
		g.setFont(component.getFont());
		if (!component.isEnabled())
			RectPattern.paintBack(g, 0, 0, w, h, MyUIConfig.normalBackColor, c);
		else
		if (mouseInside || button.hasFocus())
			RectPattern.paintLightBack(g, 0, 0, w, h);
		else
			RectPattern.paintBack(g, 0, 0, w, h, MyUIConfig.normalBackColor, c);
		String text = component.getText();
		char ch = (char)component.getMnemonic();
		FontMetrics fm = g.getFontMetrics();
		int len = 0;
		int posx = (w - g.getFontMetrics().stringWidth(text)) / 2;
		int posy = (h + g.getFont().getSize()) / 2;
		Icon icon;
		if (component.isEnabled())
			icon = component.getIcon();
		else
			icon = component.getDisabledIcon();
		if (icon != null)
		{
			int minx = icon.getIconWidth() + 3;
			if (posx < minx)
				posx = minx;
		}
		if (!component.isEnabled())
		{
			g.setColor(Color.white);
			g.drawString(text, posx + 1, posy + 1);
			g.setColor(Color.gray);
			g.drawString(text, posx, posy);
		} else
		{
			g.setColor(component.getForeground());
			g.drawString(text, posx, posy);
		}
		if (component.getIcon() != null)
		{
			int iconX;
			if (component.getText().length() != 0)
				iconX = 3;
			else
				iconX = h - icon.getIconHeight() >> 1;
			int iconY = w - icon.getIconWidth() >> 1;
			icon.paintIcon(component, g, iconY, iconX);
		}
		int d = 2;
		g.setColor(button.getParent().getBackground());
		h--;
		w--;
		for (int i = 0; i <= d; i++)
		{
			g.drawLine(0, i, d - i, i);
			g.drawLine(w, i, (w - d) + i, i);
			g.drawLine(0, h - i, d - i, h - i);
			g.drawLine(w, h - i, (w - d) + i, h - i);
		}

		if (buttonDown)
		{
			g.setColor(RectPattern.MYBLUE);
			drawRoundRect(g, 1, 0, w - 2, h, d, d);
			drawRoundRect(g, 0, 1, w, h - 2, d, d);
		}
		if (button.hasFocus())
			g.setColor(MyUIConfig.focusBorderColor);
		else
			g.setColor(Color.gray);
		drawRoundRect(g, 0, 0, w, h, d, d);
	}

	private void drawRoundRect(Graphics g, int x, int y, int w, int h, int dx, int dy)
	{
		g.translate(x, y);
		g.drawLine(dx, 0, w - dx, 0);
		g.drawLine(dx, h, w - dx, h);
		g.drawLine(0, dy, 0, h - dy);
		g.drawLine(w, dy, w, h - dy);
		g.drawLine(dx, 0, 0, dy);
		g.drawLine(w - dx, 0, w, dy);
		g.drawLine(dx, h, 0, h - dy);
		g.drawLine(w - dx, h, w, h - dy);
		g.translate(-x, -y);
	}

	void this_mousePressed(MouseEvent e)
	{
		buttonDown = true;
	}

	void this_mouseReleased(MouseEvent e)
	{
		buttonDown = false;
	}

	void this_mouseEntered(MouseEvent e)
	{
		mouseInside = true;
	}

	public void this_mouseExited(MouseEvent e)
	{
		mouseInside = false;
	}
}
