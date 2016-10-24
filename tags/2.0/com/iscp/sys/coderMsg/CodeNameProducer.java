// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CodeNameProducer.java

package com.iscp.sys.coderMsg;


public class CodeNameProducer
{

	public CodeNameProducer()
	{
	}

	public static String getClassName(String name)
	{
		return (new StringBuilder(String.valueOf(name))).append("Bean").toString();
	}

	public static String getPropertyName(String name)
	{
		return name;
	}

	public static String getMethodName(String name)
	{
		return name;
	}
}
