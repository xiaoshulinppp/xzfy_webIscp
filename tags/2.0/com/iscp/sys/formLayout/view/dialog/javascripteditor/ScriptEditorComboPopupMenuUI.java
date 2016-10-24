// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ScriptEditorComboPopupMenuUI.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import com.iscp.sys.formLayout.view.base.RectPattern;
import com.iscp.sys.formLayout.view.base.ui.MouseEventUI;
import java.awt.Graphics;
import java.awt.Rectangle;
import java.awt.event.MouseEvent;
import javax.swing.*;
import javax.swing.plaf.ComponentUI;
import javax.swing.plaf.basic.BasicComboBoxUI;

public class ScriptEditorComboPopupMenuUI extends BasicComboBoxUI
	implements MouseEventUI
{

	private boolean mouseIn;

	public ScriptEditorComboPopupMenuUI()
	{
		mouseIn = false;
	}

	public void mouseEntered(MouseEvent e)
	{
		mouseIn = true;
	}

	public void mouseExited(MouseEvent e)
	{
		mouseIn = false;
	}

	public static ComponentUI createUI(JComponent c)
	{
		ScriptEditorComboPopupMenuUI t = new ScriptEditorComboPopupMenuUI();
		return t;
	}

	public void paintCurrentValueBackground(Graphics g, Rectangle bounds, boolean hasFocus)
	{
		if (mouseIn)
			RectPattern.paintLightBack(g, 0, 0, bounds.width, bounds.height);
	}

	public void paint(Graphics g, JComponent c)
	{
		c.setBorder(null);
	}

	protected JButton createArrowButton()
	{
		JButton arrow = new JButton();
		arrow.setFocusable(false);
		return arrow;
	}

	protected ComboBoxEditor createEditor()
	{
		return new ScriptEditorComboEditor.UIResource();
	}
}
