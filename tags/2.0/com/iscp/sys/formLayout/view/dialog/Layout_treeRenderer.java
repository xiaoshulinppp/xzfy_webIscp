// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   LayoutOpenDialog.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.view.base.GrayImageFilter;
import com.iscp.sys.formLayout.view.base.MyLabel;
import com.iscp.sys.formLayout.view.icon.MyIcon;
import java.awt.Component;
import java.awt.Image;
import javax.swing.*;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.TreeCellRenderer;

class Layout_treeRenderer extends MyLabel
	implements TreeCellRenderer
{

	private static Image icon_image[];
	private static Image icon_image_absoluteTable;
	private static Icon icon[];
	private static Icon icon_absoluteTable;

	public Layout_treeRenderer()
	{
		if (icon_image == null)
		{
			icon = new Icon[3];
			icon_image = new Image[3];
			icon_image[0] = MyIcon.getImage("tree_database.gif");
			icon_image[1] = MyIcon.getImage("tree_table.gif");
			icon_image[2] = MyIcon.getImage("layout.gif");
			icon_image_absoluteTable = GrayImageFilter.getImage(icon_image[1], this);
			icon_absoluteTable = new ImageIcon(icon_image_absoluteTable);
			for (int i = 0; i < icon.length; i++)
				icon[i] = new ImageIcon(icon_image[i]);

		}
	}

	public Component getTreeCellRendererComponent(JTree tree, Object value, boolean selected, boolean expanded, boolean leaf, int row, boolean hasFocus)
	{
		String name = tree.convertValueToText(value, selected, expanded, leaf, row, hasFocus);
		setText(value.toString());
		this.selected = selected;
		DefaultMutableTreeNode node = (DefaultMutableTreeNode)value;
		row = node.getLevel();
		if (row < icon.length)
		{
			iconImage = icon_image[row];
			setIcon(icon[row]);
		}
		return this;
	}
}
