// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MySelectMenu.java

package com.iscp.sys.formLayout.view.base;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

// Referenced classes of package com.iscp.sys.formLayout.view.base:
//			MySelectMenu, MyOperPane

class MySelectMenuItemActionListener
	implements ActionListener
{

	private int index;
	private MySelectMenu msm;

	public MySelectMenuItemActionListener(MySelectMenu msm, int index)
	{
		this.msm = msm;
		this.index = index;
	}

	public void actionPerformed(ActionEvent e)
	{
		msm.pane.setItemSelect(msm, index);
	}
}
