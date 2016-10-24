// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyMenuSourcePane.java

package com.iscp.sys.formLayout.view;

import com.iscp.sys.formLayout.view.base.MyMenuItem;
import java.awt.event.ActionEvent;

public interface MyMenuSourcePane
{

	public abstract void menuActionPerformed(ActionEvent actionevent, MyMenuItem mymenuitem);
}
