// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ScriptTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import com.iscp.sys.formLayout.view.base.RectPattern;
import com.iscp.sys.formLayout.view.icon.MyIcon;
import java.awt.*;
import javax.swing.DefaultListCellRenderer;
import javax.swing.JList;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			PropertyModel

class ShowProperty_menu_listCellRenderer extends DefaultListCellRenderer
{

	private PropertyModel value;
	private boolean isSelected;
	private static Image PROPERTYIMAGE = MyIcon.getImage("javascript_property.gif");
	private static Image METHODIMAGE = MyIcon.getImage("javascript_method.gif");
	private static final Color METHODCOLOR = new Color(0, 128, 0);
	private static final Color PROPERTYCOLOR = new Color(0, 0, 128);
	private int curr_x;
	private int curr_y;

	public ShowProperty_menu_listCellRenderer()
	{
		curr_x = 0;
		curr_y = 0;
	}

	public Component getListCellRendererComponent(JList list, Object value, int index, boolean isSelected, boolean cellHasFocus)
	{
		this.value = (PropertyModel)value;
		this.isSelected = isSelected;
		return super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);
	}

	public void paint(Graphics g)
	{
		g.setFont(getFont());
		Rectangle r = getBounds();
		if (isSelected)
		{
			g.setColor(RectPattern.MYBLUE);
			g.fillRect(0, 0, r.width, r.height);
		} else
		{
			g.setColor(Color.white);
			g.fillRect(0, 0, r.width, r.height);
		}
		g.setColor(Color.BLACK);
		curr_y = r.height + g.getFont().getSize() >> 1;
		curr_x = 15;
		if (value.method)
		{
			g.drawImage(METHODIMAGE, 2, r.height - METHODIMAGE.getHeight(this) >> 1, this);
			g.setColor(METHODCOLOR);
			paintStr(g, value.name);
			g.setColor(Color.black);
			paintStr(g, "(");
			for (int i = 0; i < value.param.length; i++)
			{
				g.setColor(PROPERTYCOLOR);
				paintStr(g, value.paramType[i]);
				paintStr(g, " ");
				paintStr(g, value.param[i]);
				g.setColor(Color.black);
				if (i != value.param.length - 1)
					paintStr(g, ",");
			}

			paintStr(g, ")");
		} else
		{
			g.drawImage(PROPERTYIMAGE, 2, r.height - PROPERTYIMAGE.getHeight(this) >> 1, this);
			g.setColor(PROPERTYCOLOR);
			paintStr(g, value.name);
		}
	}

	private void paintStr(Graphics g, String str)
	{
		FontMetrics fm = g.getFontMetrics();
		g.drawString(str, curr_x, curr_y);
		curr_x += fm.stringWidth(str);
	}

}
