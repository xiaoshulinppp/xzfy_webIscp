// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TableOpenDialog.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.msg.MsgTable;
import com.iscp.sys.formLayout.view.base.GrayImageFilter;
import com.iscp.sys.formLayout.view.base.MyLabel;
import com.iscp.sys.formLayout.view.icon.MyIcon;
import java.awt.Component;
import java.awt.Image;
import javax.swing.*;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			LayoutListNode

class LayoutListRenderer extends MyLabel
	implements ListCellRenderer
{

	private LayoutListNode node;
	private Image icon_image[];
	private ImageIcon icons[];

	public LayoutListRenderer()
	{
		icon_image = new Image[2];
		icons = new ImageIcon[2];
		icon_image[0] = MyIcon.getImage("tree_table.gif");
		icon_image[1] = GrayImageFilter.getImage(icon_image[0], this);
		icons[0] = new ImageIcon(icon_image[0]);
		icons[1] = new ImageIcon(icon_image[1]);
	}

	public Component getListCellRendererComponent(JList list, Object value, int index, boolean isSelected, boolean cellHasFocus)
	{
		node = null;
		if (value instanceof LayoutListNode)
		{
			node = (LayoutListNode)value;
			setText(node.toString());
			if (node.getTable().getLogTable() == null)
			{
				iconImage = icon_image[1];
				setIcon(icons[1]);
			} else
			{
				iconImage = icon_image[0];
				setIcon(icons[0]);
			}
		}
		selected = isSelected;
		return this;
	}
}
