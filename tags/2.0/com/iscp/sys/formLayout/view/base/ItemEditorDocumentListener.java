// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ItemEditor.java

package com.iscp.sys.formLayout.view.base;

import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

// Referenced classes of package com.iscp.sys.formLayout.view.base:
//			ItemEditor

class ItemEditorDocumentListener
	implements DocumentListener
{

	private ItemEditor editor;

	public ItemEditorDocumentListener(ItemEditor editor)
	{
		this.editor = editor;
	}

	public void changedUpdate(DocumentEvent e)
	{
		editor.documentChange(e);
	}

	public void insertUpdate(DocumentEvent e)
	{
		editor.documentChange(e);
	}

	public void removeUpdate(DocumentEvent e)
	{
		editor.documentChange(e);
	}
}
