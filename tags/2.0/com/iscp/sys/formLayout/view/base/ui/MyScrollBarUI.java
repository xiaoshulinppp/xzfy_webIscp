// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyScrollBarUI.java

package com.iscp.sys.formLayout.view.base.ui;

import com.iscp.sys.formLayout.view.base.RectPattern;
import java.awt.*;
import javax.swing.*;
import javax.swing.plaf.ComponentUI;
import javax.swing.plaf.basic.BasicScrollBarUI;

// Referenced classes of package com.iscp.sys.formLayout.view.base.ui:
//			MyArrowButton

public class MyScrollBarUI extends BasicScrollBarUI
{

	public static Color shadow = new Color(128, 128, 128);
	public static Color highlight = new Color(205, 205, 205);
	public static Color darkshadow = new Color(64, 64, 64);

	public MyScrollBarUI()
	{
	}

	public static ComponentUI createUI(JComponent c)
	{
		return new MyScrollBarUI();
	}

	protected void paintTrack(Graphics g, JComponent c, Rectangle trackBounds)
	{
		g.setColor(Color.white);
		g.fillRect(trackBounds.x, trackBounds.y, trackBounds.width - 1, trackBounds.height - 1);
		if (scrollbar.getOrientation() == 1)
			RectPattern.paintTrack_normal(g, trackBounds.x + 1, trackBounds.y + 1, trackBounds.width - 2, trackBounds.height - 2, RectPattern.MYLIGHTGRAY);
		else
			RectPattern.paintTrack2_normal(g, trackBounds.x + 1, trackBounds.y + 1, trackBounds.width - 2, trackBounds.height - 2, RectPattern.MYLIGHTGRAY);
		g.setColor(Color.lightGray);
		g.drawRoundRect(trackBounds.x, trackBounds.y, trackBounds.width - 1, trackBounds.height - 1, 5, 5);
	}

	protected void paintThumb(Graphics g, JComponent c, Rectangle thumbBounds)
	{
		if (thumbBounds.isEmpty() || !scrollbar.isEnabled())
			return;
		int w = thumbBounds.width;
		int h = thumbBounds.height;
		g.translate(thumbBounds.x, thumbBounds.y);
		if (scrollbar.getOrientation() == 1)
			RectPattern.paintThumb_normal(g, 1, 1, w - 2, h - 2, RectPattern.MYBLUE);
		else
			RectPattern.paintThumb2_normal(g, 1, 1, w - 2, h - 2, RectPattern.MYBLUE);
		g.setColor(Color.gray);
		g.drawRoundRect(0, 0, w - 1, h - 1, 5, 5);
		g.translate(-thumbBounds.x, -thumbBounds.y);
	}

	protected JButton createDecreaseButton(int orientation)
	{
		return new MyArrowButton(orientation, shadow, shadow, darkshadow, highlight);
	}

	protected JButton createIncreaseButton(int orientation)
	{
		return new MyArrowButton(orientation, shadow, shadow, darkshadow, highlight);
	}

}
