// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   InputDialog.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			InputDialog

class InputDialog_InputActionListener
	implements ActionListener
{

	private InputDialog d;
	private int cmd;

	public InputDialog_InputActionListener(InputDialog d, int cmd)
	{
		this.d = d;
		this.cmd = cmd;
	}

	public void actionPerformed(ActionEvent e)
	{
		if (cmd == 0)
			d.cmd_ok();
		else
			d.cmd_cancel();
	}
}
