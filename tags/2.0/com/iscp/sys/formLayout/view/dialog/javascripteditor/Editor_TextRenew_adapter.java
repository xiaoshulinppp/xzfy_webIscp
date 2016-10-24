// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   DefaultScriptEditor.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import com.iscp.sys.formLayout.view.MainPane;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			ColoredTextArea

class Editor_TextRenew_adapter
	implements DocumentListener
{

	ColoredTextArea adaptee;
	MainPane mainPane;

	public Editor_TextRenew_adapter(ColoredTextArea adaptee, MainPane mainPane)
	{
		this.adaptee = adaptee;
		this.mainPane = mainPane;
	}

	public void renew()
	{
		adaptee.renew();
	}

	public void changedUpdate(DocumentEvent e)
	{
		renew();
	}

	public void removeUpdate(DocumentEvent e)
	{
		renew();
	}

	public void insertUpdate(DocumentEvent e)
	{
		renew();
	}
}
