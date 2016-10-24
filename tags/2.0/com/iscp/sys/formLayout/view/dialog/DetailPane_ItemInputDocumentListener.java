// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   PropertyTable.java

package com.iscp.sys.formLayout.view.dialog;

import javax.swing.JComponent;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			DetailPane

class DetailPane_ItemInputDocumentListener
	implements DocumentListener
{

	private DetailPane detail;
	private JComponent c;

	public DetailPane_ItemInputDocumentListener(DetailPane detail, JComponent c)
	{
		this.detail = detail;
		this.c = c;
	}

	public void changedUpdate(DocumentEvent e)
	{
		detail.itemActionPerformed(null, c);
	}

	public void removeUpdate(DocumentEvent e)
	{
		detail.itemActionPerformed(null, c);
	}

	public void insertUpdate(DocumentEvent e)
	{
		detail.itemActionPerformed(null, c);
	}
}
