// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   IdTypeInterface.java

package com.iscp.sys.coder.model;


public interface IdTypeInterface
{

	public static final int INCREMENT = 0;
	public static final int UUID = 1;
	public static final int NATIVE = 2;
	public static final int FOREIGN = 3;

	public abstract int getType();

	public abstract void setType(int i);

	public abstract String getSequenceName();

	public abstract void getSequenceName(String s);
}
