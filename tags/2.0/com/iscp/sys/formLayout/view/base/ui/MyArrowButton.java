// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyArrowButton.java

package com.iscp.sys.formLayout.view.base.ui;

import java.awt.*;
import javax.swing.plaf.ButtonUI;
import javax.swing.plaf.basic.BasicArrowButton;

public class MyArrowButton extends BasicArrowButton
{

	public MyArrowButton(int direction, Color background, Color shadow, Color darkShadow, Color highlight)
	{
		super(direction, background, shadow, darkShadow, highlight);
	}

	public void paint(Graphics g)
	{
		getUI().paint(g, this);
		Color origColor = g.getColor();
		int w = getSize().width;
		int h = getSize().height;
		boolean isEnabled = isEnabled();
		if (h < 2 || w < 2)
		{
			g.setColor(origColor);
			return;
		} else
		{
			int size = Math.min((h - 2) / 3, (w - 2) / 3);
			size = Math.max(size, 4);
			paintTriangle(g, (w - size) / 2, (h - size) / 2, size, direction, isEnabled);
			g.setColor(origColor);
			return;
		}
	}
}
