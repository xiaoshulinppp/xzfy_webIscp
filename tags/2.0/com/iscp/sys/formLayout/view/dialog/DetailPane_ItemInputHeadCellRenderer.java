// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   PropertyTable.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.view.base.RectPattern;
import com.iscp.sys.formLayout.view.base.ui.MyUIConfig;
import java.awt.*;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.table.TableCellRenderer;

class DetailPane_ItemInputHeadCellRenderer extends JLabel
	implements TableCellRenderer
{

	private boolean readable;
	private boolean identity;

	public DetailPane_ItemInputHeadCellRenderer()
	{
		readable = true;
		identity = true;
		setFont(MyUIConfig.getDefaultFont());
	}

	public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column)
	{
		if (value != null)
			setText(value.toString());
		return this;
	}

	public void paint(Graphics g)
	{
		Rectangle r = getBounds();
		g.setFont(getFont());
		String text = getText();
		int w = r.width;
		int h = r.height;
		RectPattern.paintThumb2_normal(g, 0, 0, w, h, RectPattern.MYBLUE);
		FontMetrics fm = g.getFontMetrics();
		int x = w - fm.stringWidth(text) >> 1;
		int y = h + g.getFont().getSize() >> 1;
		g.setColor(Color.blue);
		g.drawString(text, x, y);
	}
}
