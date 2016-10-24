// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ColoredTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import javax.swing.event.UndoableEditEvent;
import javax.swing.event.UndoableEditListener;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			ColoredTextArea

class Text_undo_adapter
	implements UndoableEditListener
{

	ColoredTextArea adaptee;

	Text_undo_adapter(ColoredTextArea adaptee)
	{
		this.adaptee = adaptee;
	}

	public void undoableEditHappened(UndoableEditEvent e)
	{
		if (!adaptee.isUndoing())
			adaptee.isRedoing();
	}
}
