// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyMenu.java

package com.iscp.sys.formLayout.view.base;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

// Referenced classes of package com.iscp.sys.formLayout.view.base:
//			MyMenu, MyMenuItem

class Menu_actionAdapter
	implements ActionListener
{

	MyMenu adaptee;
	MyMenuItem item;

	Menu_actionAdapter(MyMenu adaptee, MyMenuItem item)
	{
		this.adaptee = adaptee;
		this.item = item;
	}

	public void actionPerformed(ActionEvent e)
	{
		adaptee.menu_actionPerformed(e, item);
	}
}
