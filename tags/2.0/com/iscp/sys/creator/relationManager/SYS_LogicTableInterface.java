// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   SYS_LogicTableInterface.java

package com.iscp.sys.creator.relationManager;

import java.util.Set;

public interface SYS_LogicTableInterface
{

	public abstract String getTabName();

	public abstract String getLogName();

	public abstract Set getFields();
}
