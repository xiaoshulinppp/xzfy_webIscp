// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Coder.java

package com.iscp.sys.coder;

import com.taiji.core.util.ApplicationPath;
import java.net.URL;

public class Coder
{

	public static final int TABSIZE = 3;
	public static final String PACKAGENAMES[] = {
		"com", "iscp", "business"
	};
	public static final String PACKAGE_BEAN = "bean";
	private static String packageExpress;

	public static String getPackageExpress()
	{
		if (packageExpress != null) goto _L2; else goto _L1
_L1:
		int i;
		packageExpress = "";
		i = 0;
		  goto _L3
_L4:
		packageExpress;
		JVM INSTR new #37  <Class StringBuilder>;
		JVM INSTR dup_x1 ;
		JVM INSTR swap ;
		String.valueOf();
		StringBuilder();
		PACKAGENAMES[i];
		append();
		".";
		append();
		toString();
		packageExpress;
		i++;
_L3:
		if (i < PACKAGENAMES.length) goto _L4; else goto _L2
_L2:
		return packageExpress;
	}

	public static String getBasePath()
	{
		String path = (new StringBuilder(String.valueOf(com/iscp/sys/coder/Coder.getResource("").getPath()))).append("/").toString();
		for (int i = 0; i < 4; i++)
			path = (new StringBuilder(String.valueOf(path))).append("../").toString();

		path = ApplicationPath.getAppliactionPath().replaceAll("\\\\", "/");
		for (int i = 0; i < PACKAGENAMES.length; i++)
			path = (new StringBuilder(String.valueOf(path))).append(PACKAGENAMES[i]).append("/").toString();

		return path;
	}

	public Coder()
	{
	}

}
