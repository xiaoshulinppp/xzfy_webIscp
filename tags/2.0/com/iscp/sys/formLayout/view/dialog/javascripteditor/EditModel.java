// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ColoredTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import javax.swing.event.DocumentEvent;
import javax.swing.text.Document;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			ColoredTextArea

class EditModel
{

	private boolean isInsert;
	private int offset;
	private int length;
	private String text;

	public int getLength()
	{
		return length;
	}

	public EditModel(DocumentEvent e, ColoredTextArea textArea)
	{
		isInsert = e.getType().equals(javax.swing.event.DocumentEvent.EventType.INSERT);
		offset = e.getOffset();
		length = e.getLength();
		if (isInsert)
		{
			textArea.lastText = textArea.getText();
			text = textArea.lastText.substring(offset, offset + length);
		} else
		{
			text = textArea.lastText.substring(offset, offset + length);
			textArea.lastText = textArea.getText();
		}
	}

	public void redo(ColoredTextArea textArea)
		throws Exception
	{
		if (isInsert)
			textArea.getDocument().insertString(offset, text, null);
		else
			textArea.getDocument().remove(offset, length);
	}

	public void undo(ColoredTextArea textArea)
		throws Exception
	{
		try
		{
			if (isInsert)
				textArea.getDocument().remove(offset, length);
			else
				textArea.getDocument().insertString(offset, text, null);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
