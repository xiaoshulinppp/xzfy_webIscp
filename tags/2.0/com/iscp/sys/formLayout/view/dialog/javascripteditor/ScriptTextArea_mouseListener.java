// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ScriptTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			ScriptTextArea

class ScriptTextArea_mouseListener
	implements MouseListener
{

	public ScriptTextArea text;

	public ScriptTextArea_mouseListener(ScriptTextArea text)
	{
		this.text = text;
	}

	public void mousePressed(MouseEvent mouseevent)
	{
	}

	public void mouseReleased(MouseEvent e)
	{
		text.mouseReleased(e);
	}

	public void mouseExited(MouseEvent mouseevent)
	{
	}

	public void mouseEntered(MouseEvent mouseevent)
	{
	}

	public void mouseClicked(MouseEvent mouseevent)
	{
	}
}
