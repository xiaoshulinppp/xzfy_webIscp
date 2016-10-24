// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Compiler.java

package com.taiji.core.generator.configen;

import com.sun.tools.javac.Main;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;

public class Compiler
{

	public Compiler()
	{
	}

	public static void compile(List source, String path2, List classpath)
		throws Exception
	{
		String comp[] = new String[source.size() + 4];
		comp[0] = "-d";
		comp[1] = path2;
		comp[2] = "-classpath";
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < classpath.size(); i++)
			sb.append((new StringBuilder()).append(classpath.get(i)).append(";").toString());

		comp[3] = sb.toString();
		for (int i = 0; i < source.size(); i++)
			comp[i + 4] = (String)source.get(i);

		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw, true);
		if (Main.compile(comp, pw) != 0)
			throw new Exception(sw.toString());
		else
			return;
	}
}
