// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TableOpenDialog.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			TableOpenDialog

class TableOpenDialog_ActionListener
	implements ActionListener
{

	private TableOpenDialog d;
	private JButton b;

	public TableOpenDialog_ActionListener(TableOpenDialog d, JButton b)
	{
		this.d = d;
		this.b = b;
	}

	public void actionPerformed(ActionEvent e)
	{
		d.actionPerformed(e, b);
	}
}
