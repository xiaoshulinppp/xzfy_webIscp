// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ScriptTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			ScriptTextArea

class ScriptEditorAssistant_documentListener
	implements DocumentListener
{

	ScriptTextArea textarea;

	public ScriptEditorAssistant_documentListener(ScriptTextArea textarea)
	{
		this.textarea = textarea;
	}

	public void changedUpdate(DocumentEvent documentevent)
	{
	}

	public void removeUpdate(DocumentEvent documentevent)
	{
	}

	public void insertUpdate(DocumentEvent e)
	{
		String text = textarea.getText();
		char c = text.charAt(e.getOffset());
		if (!textarea.isRedoing() && !textarea.isUndoing() && c == '.')
			textarea.dotTyped = true;
	}
}
