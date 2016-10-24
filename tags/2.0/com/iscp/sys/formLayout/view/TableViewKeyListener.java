// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TableView.java

package com.iscp.sys.formLayout.view;

import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

// Referenced classes of package com.iscp.sys.formLayout.view:
//			TableView

class TableViewKeyListener extends KeyAdapter
{

	private TableView tv;

	public TableViewKeyListener(TableView tv)
	{
		this.tv = tv;
	}

	public void keyPressed(KeyEvent e)
	{
		tv.keyPressed(e);
	}

	public void keyReleased(KeyEvent e)
	{
		tv.keyReleased(e);
	}
}
