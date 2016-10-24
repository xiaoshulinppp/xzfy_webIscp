// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   FieldInterface.java

package com.iscp.sys.coder.model;


public interface FieldInterface
{

	public abstract String getName();

	public abstract String getLogName();

	public abstract String getIsKey();

	public abstract String getTypeName();

	public abstract boolean isOperator();
}
