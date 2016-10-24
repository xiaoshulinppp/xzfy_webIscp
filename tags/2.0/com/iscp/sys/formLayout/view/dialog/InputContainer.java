// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   InputContainer.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.Graphics;
import java.awt.Rectangle;
import javax.swing.JComponent;
import javax.swing.JLabel;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			FreeContainer

public class InputContainer extends FreeContainer
{

	int textWidth;
	int labelWidth;
	private int itemHeight;
	private int total;
	private int itemCount;

	public InputContainer()
	{
		textWidth = 300;
		labelWidth = 100;
		itemHeight = 20;
		itemCount = 0;
		total = 0;
	}

	public JLabel add(String label, JComponent text)
	{
		JLabel l = new JLabel(label);
		add(((java.awt.Component) (l)));
		add(((java.awt.Component) (text)));
		l.setBounds(1, total, labelWidth - 1, itemHeight);
		text.setBounds(labelWidth + 1, total + 1, textWidth, itemHeight - 1);
		itemCount++;
		total += itemHeight;
		int x = getBounds().x;
		int y = getBounds().y;
		setBounds(x, y, labelWidth + textWidth, total);
		return l;
	}

	public void paint(Graphics g)
	{
		super.paint(g);
		int y = 0;
		g.drawLine(0, 0, 0, total);
		g.drawLine(labelWidth, 0, labelWidth, total);
		g.drawLine(labelWidth + textWidth + 1, 0, labelWidth + textWidth + 1, total);
		for (int i = 0; i <= itemCount; i++)
		{
			g.drawLine(0, y, labelWidth + textWidth, y);
			y += itemHeight;
		}

	}
}
