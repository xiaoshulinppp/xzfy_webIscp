// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ErrorMessageDialog.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			ErrorMessageDialog

class ErrorMessageDialog_actionAdapter
	implements ActionListener
{

	ErrorMessageDialog d;

	ErrorMessageDialog_actionAdapter(ErrorMessageDialog d)
	{
		this.d = d;
	}

	public void actionPerformed(ActionEvent e)
	{
		d.jButton1_actionPerformed(e);
	}
}
