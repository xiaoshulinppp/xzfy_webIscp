// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ErrorMessageDialog.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.*;
import java.awt.event.ActionEvent;
import javax.swing.*;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			ErrorMessageDialog_actionAdapter

public class ErrorMessageDialog extends JDialog
{

	JTextArea detailText;
	JButton b;
	JLabel errlabel;

	public ErrorMessageDialog(Frame frame, String title, boolean modal, String msg, String detail)
	{
		super(frame, title, modal);
		detailText = new JTextArea();
		b = new JButton();
		errlabel = new JLabel();
		setSize(new Dimension(300, 200));
		errlabel.setText(msg);
		detailText.setText(detail);
		jbInit();
	}

	private void jbInit()
	{
		Box box = Box.createVerticalBox();
		getContentPane().add(box, "Center");
		b.setText("???");
		b.addActionListener(new ErrorMessageDialog_actionAdapter(this));
		JPanel jp = new JPanel();
		jp.add(errlabel, "West");
		box.add(jp, null);
		JScrollPane sp = new JScrollPane();
		box.add(sp, null);
		sp.getViewport().add(detailText, null);
		jp = new JPanel();
		jp.add(b);
		box.add(jp, null);
	}

	void jButton1_actionPerformed(ActionEvent e)
	{
		setVisible(false);
	}
}
