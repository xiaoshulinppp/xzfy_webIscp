// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TableView.java

package com.iscp.sys.formLayout.view;

import java.awt.event.MouseEvent;

// Referenced classes of package com.iscp.sys.formLayout.view:
//			TableView

class TableViewDetailShowManager extends Thread
{

	private long time_to_show;
	private boolean active;
	private boolean detail_showed;
	TableView tv;
	private MouseEvent e;

	public TableViewDetailShowManager(TableView tv)
	{
		active = true;
		detail_showed = false;
		this.tv = tv;
	}

	public void run()
	{
		while (active) 
			try
			{
				if (!detail_showed)
				{
					detail_showed = true;
					if (this.e == null)
						tv.showDetail(0, 0);
					else
						tv.showDetail(this.e.getX(), this.e.getY());
				}
				sleep(2000L);
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
	}

	public void mouseMoved(MouseEvent e)
	{
		this.e = e;
		detail_showed = false;
		tv.closeDetail();
	}

	public void end()
	{
		active = false;
	}
}
