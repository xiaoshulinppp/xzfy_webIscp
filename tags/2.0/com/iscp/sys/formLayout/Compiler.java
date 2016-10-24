// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Compiler.java

package com.iscp.sys.formLayout;

import com.sun.tools.javac.Main;
import java.io.PrintWriter;
import java.io.StringWriter;

public class Compiler
{

	public Compiler()
	{
	}

	public static void main(String a[])
	{
		try
		{
			compile(new String[] {
				"D:/test/coma/test.java", "D:/test/com/test.java"
			}, "d:/", new String[0]);
		}
		catch (Exception exception) { }
	}

	public static void compile(String source[], String path2, String classpath[])
		throws Exception
	{
		String comp[] = new String[source.length + 4];
		comp[0] = "-d";
		comp[1] = path2;
		comp[2] = "-classpath";
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < classpath.length; i++)
			sb.append((new StringBuilder(String.valueOf(classpath[i]))).append(";").toString());

		comp[3] = sb.toString();
		for (int i = 0; i < source.length; i++)
			comp[i + 4] = source[i];

		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw, true);
		if (Main.compile(comp, pw) != 0)
			throw new Exception(sw.toString());
		else
			return;
	}
}
