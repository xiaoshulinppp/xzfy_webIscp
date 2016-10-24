// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyLabel.java

package com.iscp.sys.formLayout.view.base;

import java.awt.*;
import javax.swing.JLabel;

public class MyLabel extends JLabel
{

	private static Color BACKGROUND_SELECTED = new Color(128, 192, 255, 64);
	private static Color BACKGROUND_SELECTED_BORDER = new Color(128, 192, 255);
	protected boolean selected;
	protected Image iconImage;

	public MyLabel()
	{
		selected = false;
	}

	public void paint(Graphics g)
	{
		Rectangle rect = getBounds();
		int w = rect.width;
		int h = rect.height;
		int iw = iconImage.getWidth(this);
		int ih = iconImage.getHeight(this);
		if (selected)
		{
			g.setColor(BACKGROUND_SELECTED);
			g.fillRect(2 + iw, 0, w - iw - 3, h - 1);
			g.setColor(BACKGROUND_SELECTED_BORDER);
			g.drawRect(2 + iw, 0, w - iw - 3, h - 1);
		}
		g.setFont(getFont());
		g.drawImage(iconImage, 1, (h - ih) / 2, this);
		int y = ((h + g.getFont().getSize()) - 1) / 2;
		g.setColor(getForeground());
		g.drawString(getText(), 3 + iw, y);
	}

}
