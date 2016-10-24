// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CodeExecuteTest.java

package com.iscp.sys.coder.model;

import java.io.PrintStream;
import java.util.Enumeration;
import java.util.Properties;

public class CodeExecuteTest
{

	public CodeExecuteTest()
	{
	}

	public static void main(String arg[])
	{
		String name;
		for (Enumeration e = System.getProperties().propertyNames(); e.hasMoreElements(); System.out.println((new StringBuilder(String.valueOf(name))).append(" = ").append(System.getProperties().getProperty(name)).toString()))
			name = e.nextElement().toString();

	}

	public void testGenrateHiberanteConfigureFile()
	{
	}
}
