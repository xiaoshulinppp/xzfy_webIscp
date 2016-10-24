// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   InputDialog.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JComponent;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			InputDialog

class InputDialog_ItemInputActionListener
	implements ActionListener
{

	private InputDialog d;
	private JComponent c;

	public InputDialog_ItemInputActionListener(InputDialog d, JComponent c)
	{
		this.d = d;
		this.c = c;
	}

	public void actionPerformed(ActionEvent e)
	{
		d.itemActionPerformed(e, c);
	}
}
