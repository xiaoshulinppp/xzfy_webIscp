// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MouseEventComponent.java

package com.iscp.sys.formLayout.view.base;

import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;

// Referenced classes of package com.iscp.sys.formLayout.view.base:
//			MouseEventComponent

class MouseEventSourceComponent_this_mouseMotionAdapter extends MouseMotionAdapter
{

	MouseEventComponent adaptee;

	MouseEventSourceComponent_this_mouseMotionAdapter(MouseEventComponent adaptee)
	{
		this.adaptee = adaptee;
	}

	public void mouseDragged(MouseEvent e)
	{
		adaptee.mouseDragged(e);
	}

	public void mouseMoved(MouseEvent e)
	{
		adaptee.mouseMoved(e);
	}
}
