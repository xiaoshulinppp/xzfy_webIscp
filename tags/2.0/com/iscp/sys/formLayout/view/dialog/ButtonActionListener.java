// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyFileDialog.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			MyFileDialog

class ButtonActionListener
	implements ActionListener
{

	private MyFileDialog dialog;
	private JButton button;

	public ButtonActionListener(MyFileDialog dialog, JButton button)
	{
		this.dialog = dialog;
		this.button = button;
	}

	public void actionPerformed(ActionEvent e)
	{
		dialog.button_actionPerformed(e, button);
	}
}
