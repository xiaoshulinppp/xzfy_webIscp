// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyFileDialog.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.view.base.MyLabel;
import com.iscp.sys.formLayout.view.icon.MyIcon;
import java.awt.Component;
import java.awt.Image;
import javax.swing.*;
import javax.swing.tree.TreeCellRenderer;

class Directory_treeRenderer extends MyLabel
	implements TreeCellRenderer
{

	private static Image icon_image_open;
	private static Image icon_image_close;
	private static Icon icon_open;
	private static Icon icon_close;

	public Directory_treeRenderer()
	{
		if (icon_image_open == null)
		{
			icon_image_open = MyIcon.getImage("dialog_tree_folder_open.gif");
			icon_image_close = MyIcon.getImage("dialog_tree_folder_close.gif");
			icon_open = new ImageIcon(icon_image_open);
			icon_close = new ImageIcon(icon_image_close);
		}
	}

	public Component getTreeCellRendererComponent(JTree tree, Object value, boolean selected, boolean expanded, boolean leaf, int row, boolean hasFocus)
	{
		String name = tree.convertValueToText(value, selected, expanded, leaf, row, hasFocus);
		setText(name);
		this.selected = selected;
		if (expanded)
		{
			iconImage = icon_image_open;
			setIcon(icon_open);
		} else
		{
			iconImage = icon_image_close;
			setIcon(icon_close);
		}
		return this;
	}
}
