// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   SizeRect.java

package com.iscp.sys.formLayout.view.base;

import java.awt.*;
import javax.swing.JComponent;

public class SizeRect extends JComponent
{

	private int x;
	private int y;
	public static final int SIZE = 3;
	public static final Color BORDERCOLOR = new Color(0, 0, 0, 64);
	public static final Color FILLCOLOR = new Color(255, 255, 255, 128);
	public boolean drawOnly;

	public SizeRect(int x, int y, int cursor)
	{
		drawOnly = false;
		this.x = x;
		this.y = y;
		setCursor(new Cursor(cursor));
	}

	public void setPosition(int x, int y)
	{
		this.x = x;
		this.y = y;
	}

	public boolean contain(int x, int y)
	{
		return Math.abs(this.x - x) <= 3 && Math.abs(this.y - y) <= 3;
	}

	public int getX()
	{
		return x;
	}

	public int getY()
	{
		return y;
	}

	public void paint(Graphics g)
	{
		if (drawOnly)
		{
			g.setColor(FILLCOLOR);
			g.fillRect(x - 3, y - 3, 7, 7);
			g.setColor(BORDERCOLOR);
			g.drawRect(x - 3, y - 3, 7, 7);
		} else
		{
			g.setColor(FILLCOLOR);
			g.fillRect(x - 3, y - 3, 7, 7);
			g.setColor(BORDERCOLOR);
			g.drawRect(x - 3, y - 3, 7, 7);
		}
	}

}
