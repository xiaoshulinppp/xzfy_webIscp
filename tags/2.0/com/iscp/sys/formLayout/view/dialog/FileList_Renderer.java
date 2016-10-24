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

class FileList_Renderer extends MyLabel
	implements ListCellRenderer
{

	private static ImageIcon icon = MyIcon.getIcon("newfile.gif");
	private static Image icon_image = MyIcon.getImage("newfile.gif");

	public FileList_Renderer()
	{
		iconImage = icon_image;
		setIcon(icon);
	}

	public Component getListCellRendererComponent(JList list, Object value, int row, boolean selected, boolean hasFocus)
	{
		String name = value.toString();
		setText(name);
		this.selected = selected;
		return this;
	}

}
