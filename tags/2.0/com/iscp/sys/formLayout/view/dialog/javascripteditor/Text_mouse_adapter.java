// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ColoredTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			ColoredTextArea, EditHistory

class Text_mouse_adapter extends MouseAdapter
{

	ColoredTextArea adaptee;

	public Text_mouse_adapter(ColoredTextArea adaptee)
	{
		this.adaptee = adaptee;
	}

	public void mouseClicked(MouseEvent e)
	{
		adaptee.undoEdit.put();
	}
}
