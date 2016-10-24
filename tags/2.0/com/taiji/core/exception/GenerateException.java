// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   GenerateException.java

package com.taiji.core.exception;


public class GenerateException extends RuntimeException
{

	public GenerateException()
	{
	}

	public GenerateException(String msg)
	{
		super(msg);
	}

	public GenerateException(String msg, Throwable exception)
	{
		super(msg, exception);
	}

	public GenerateException(Throwable exception)
	{
		super(exception);
	}
}
