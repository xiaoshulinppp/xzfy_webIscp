// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyIcon.java

package com.iscp.sys.formLayout.view.icon;

import java.awt.Image;
import javax.swing.ImageIcon;

public class MyIcon
{

	public MyIcon()
	{
	}

	public static ImageIcon getIcon(String fileName)
	{
		return new ImageIcon(com/iscp/sys/formLayout/view/icon/MyIcon.getResource(fileName));
	}

	public static Image getImage(String fileName)
	{
		return getIcon(fileName).getImage();
		Exception e;
		e;
		e.printStackTrace();
		return null;
	}
}
