// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   PropertyTable.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JComponent;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			DetailPane

class DetailPane_ItemInputActionListener
	implements ActionListener
{

	private DetailPane detail;
	private JComponent c;

	public DetailPane_ItemInputActionListener(DetailPane detail, JComponent c)
	{
		this.detail = detail;
		this.c = c;
	}

	public void actionPerformed(ActionEvent e)
	{
		detail.itemActionPerformed(e, c);
	}
}
