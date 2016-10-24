// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CoderManager.java

package com.iscp.sys.creator.coder.classCoder;

import com.iscp.sys.creator.coder.CodeOutput;
import com.iscp.sys.creator.model.BeanMod;
import java.io.FileOutputStream;

// Referenced classes of package com.iscp.sys.creator.coder.classCoder:
//			BeanClassCoder

public class CoderManager
{

	public CoderManager()
	{
	}

	private static String getFilePath(BeanMod model)
	{
		String beanName = model.getName();
		beanName = beanName.replace('.', '/');
		String fileName = (new StringBuilder(String.valueOf(CodeOutput.basepath))).append(beanName).toString();
		if (fileName.indexOf("file:/") >= 0)
			fileName = fileName.substring(6);
		else
		if (fileName.indexOf("file:") >= 0)
			fileName = fileName.substring(5);
		return fileName;
	}

	public static void writeBeanJava(BeanMod model)
		throws Exception
	{
		String fileName = (new StringBuilder(String.valueOf(getFilePath(model)))).append(".java").toString();
		FileOutputStream fs = new FileOutputStream(fileName);
		BeanClassCoder coder = new BeanClassCoder();
		fs.write(coder.getJavaBeanExpress(model).getBytes());
	}

	public static String getTabSpace(int tab)
	{
		String temp = "";
		for (int i = 0; i < tab; i++)
			temp = (new StringBuilder(String.valueOf(temp))).append("  ").toString();

		return temp;
	}
}
