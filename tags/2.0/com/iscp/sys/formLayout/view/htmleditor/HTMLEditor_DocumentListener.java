// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   HTMLEditor.java

package com.iscp.sys.formLayout.view.htmleditor;

import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

// Referenced classes of package com.iscp.sys.formLayout.view.htmleditor:
//			HTMLEditor

class HTMLEditor_DocumentListener
	implements DocumentListener
{

	private HTMLEditor editor;

	public HTMLEditor_DocumentListener(HTMLEditor editor)
	{
		this.editor = editor;
	}

	public void changedUpdate(DocumentEvent documentevent)
	{
	}

	public void insertUpdate(DocumentEvent documentevent)
	{
	}

	public void removeUpdate(DocumentEvent documentevent)
	{
	}
}
