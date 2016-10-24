// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyUIConfig.java

package com.iscp.sys.formLayout.view.base.ui;

import com.iscp.sys.formLayout.view.icon.MyIcon;
import java.awt.*;
import javax.swing.*;

public class MyUIConfig
{

	private static Font defaultFont;
	private static Font oldDefaultFont;
	private static Icon collapsed_icon = MyIcon.getIcon("tree_close.gif");
	private static Icon expanded_icon = MyIcon.getIcon("tree_expand.gif");
	public static Color normalBackColor = new Color(230, 230, 230);
	public static Color lightBackColor = new Color(230, 240, 255);
	public static Color selectionBackColor = new Color(128, 192, 255);
	public static Color selectionForeColor = new Color(0, 0, 64);
	public static Color focusBorderColor = new Color(255, 192, 0);

	public MyUIConfig()
	{
	}

	public static void setFontDefault(Component c)
	{
		if (c.getFont() == null || c.getFont().equals(oldDefaultFont))
			c.setFont(defaultFont);
	}

	public static Font getDefaultFont()
	{
		return defaultFont;
	}

	public static void config()
	{
		UIManager.put("ButtonUI", "com.iscp.sys.formLayout.view.base.ui.MyButtonUI");
		UIManager.put("ScrollBarUI", "com.iscp.sys.formLayout.view.base.ui.MyScrollBarUI");
		UIManager.put("MenuItemUI", "com.iscp.sys.formLayout.view.base.ui.MyMenuItemUI");
		UIManager.put("ComboBoxUI", "com.iscp.sys.formLayout.view.base.ui.MyComboBoxUI");
		JScrollPane tempPane = new JScrollPane();
		oldDefaultFont = tempPane.getFont();
		Font tempFont = tempPane.getFont().deriveFont(tempPane.getFont().getStyle(), 12F);
		defaultFont = tempFont;
		UIManager.getDefaults().put("DefaultComponent.font", tempFont);
		UIManager.getDefaults().put("TabbedPane.font", tempFont);
		UIManager.getDefaults().put("ScrollPane.font", tempFont);
		UIManager.getDefaults().put("Table.font", tempFont);
		UIManager.getDefaults().put("Label.font", tempFont);
		UIManager.getDefaults().put("ComboBox.font", tempFont);
		UIManager.getDefaults().put("SplitPane.font", tempFont);
		UIManager.getDefaults().put("TextField.font", tempFont);
		UIManager.getDefaults().put("Button.font", tempFont);
		UIManager.getDefaults().put("Panel.font", tempFont);
		UIManager.getDefaults().put("MenuItem.font", tempFont);
		UIManager.getDefaults().put("RootPane.font", tempFont);
		UIManager.getDefaults().put("TextArea.background", Color.white);
		UIManager.getDefaults().put("Tree.expandedIcon", expanded_icon);
		UIManager.getDefaults().put("Tree.collapsedIcon", collapsed_icon);
	}

	public static Image getImage(String fileName)
	{
		return MyIcon.getImage(fileName);
	}

	public static Icon getIcon(String fileName)
	{
		return MyIcon.getIcon(fileName);
	}

}
