// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ColoredTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import javax.swing.JOptionPane;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			ColoredTextArea, EditHistory

class Text_key_adapter extends KeyAdapter
{

	ColoredTextArea adaptee;
	private int lastKey;

	private void find(String newMatch)
	{
		if (newMatch != null && newMatch.length() > 0)
		{
			adaptee.match = newMatch;
			int i = 0;
			int start = adaptee.getCaretPosition();
			i = adaptee.getText().indexOf(newMatch, start);
			if (i == -1)
				i = adaptee.getText().indexOf(newMatch, 0);
			if (i != -1)
			{
				adaptee.setCaretPosition(i);
				adaptee.setSelectionStart(i);
				adaptee.setSelectionEnd(i + newMatch.length());
			}
		}
	}

	public Text_key_adapter(ColoredTextArea adaptee)
	{
		lastKey = 0;
		this.adaptee = adaptee;
	}

	public void keyPressed(KeyEvent e)
	{
		lastKey = e.getKeyCode();
	}

	public void keyReleased(KeyEvent keyevent)
	{
	}

	public void searchAction()
	{
		if (adaptee.match == null)
			adaptee.match = "";
		String newMatch = JOptionPane.showInputDialog(adaptee, "????", adaptee.match);
		find(newMatch);
	}

	public void keyTyped(KeyEvent e)
	{
		char k = e.getKeyChar();
		if (lastKey == 114)
		{
			String newMatch = adaptee.match;
			find(newMatch);
		} else
		if (e.isControlDown())
		{
			if (lastKey == 70)
				searchAction();
			else
			if (lastKey == 90)
				adaptee.undo();
			else
			if (lastKey == 89)
				adaptee.redo();
		} else
		{
			if (k >= 'a' && k <= 'z' || k >= 'A' && k <= 'Z' || k >= '0' && k <= '9' || k == '_')
				return;
			adaptee.undoEdit.put();
		}
	}
}
