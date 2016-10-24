// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ColoredTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import java.io.PrintStream;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			Text_key_adapter, ColoredTextArea, Text_mouse_adapter, EditHistory

class TextRenew_adapter
	implements DocumentListener
{

	ColoredTextArea adaptee;

	public TextRenew_adapter(ColoredTextArea adaptee)
	{
		this.adaptee = adaptee;
		this.adaptee.setActionKeyListener(new Text_key_adapter(adaptee));
		this.adaptee.addMouseListener(new Text_mouse_adapter(adaptee));
	}

	public void changedUpdate(DocumentEvent e)
	{
		System.out.println("%%%%%%%%%%%%%%%%%");
		adaptee.renew();
	}

	public void removeUpdate(DocumentEvent e)
	{
		if (!adaptee.isRedoing() && !adaptee.isUndoing())
			adaptee.undoEdit.add(e);
		adaptee.renew();
	}

	public void insertUpdate(DocumentEvent e)
	{
		if (!adaptee.isRedoing() && !adaptee.isUndoing())
			adaptee.undoEdit.add(e);
		adaptee.renew();
	}
}
