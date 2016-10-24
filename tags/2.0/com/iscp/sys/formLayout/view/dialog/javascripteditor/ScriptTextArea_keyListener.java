// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ScriptTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			ScriptTextArea

class ScriptTextArea_keyListener
	implements KeyListener
{

	public ScriptTextArea text;

	public ScriptTextArea_keyListener(ScriptTextArea text)
	{
		this.text = text;
	}

	public void keyPressed(KeyEvent e)
	{
		text.keyPressed(e);
	}

	public void keyReleased(KeyEvent e)
	{
		text.keyReleased(e);
	}

	public void keyTyped(KeyEvent e)
	{
		text.keyTyped(e);
	}
}
