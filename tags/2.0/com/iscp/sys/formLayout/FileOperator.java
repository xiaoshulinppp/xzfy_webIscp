// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   FileOperator.java

package com.iscp.sys.formLayout;

import java.io.*;

public class FileOperator
{

	public static FileOperator oper = new FileOperator();

	public FileOperator()
	{
	}

	public static void write(String content, File file)
	{
		oper.writeFile(content, file);
	}

	public static String read(File file)
	{
		return oper.readFile(file);
	}

	private void writeFile(String content, File file)
	{
		OutputStream os = null;
		try
		{
			os = new FileOutputStream(file);
			os.write(content.getBytes());
		}
		catch (Exception e)
		{
			e.printStackTrace();
			break MISSING_BLOCK_LABEL_76;
		}
		break MISSING_BLOCK_LABEL_55;
		Exception exception;
		exception;
		if (os != null)
			try
			{
				os.close();
			}
			catch (Exception eclose)
			{
				eclose.printStackTrace();
			}
		throw exception;
		if (os != null)
			try
			{
				os.close();
			}
			catch (Exception eclose)
			{
				eclose.printStackTrace();
			}
		break MISSING_BLOCK_LABEL_94;
		if (os != null)
			try
			{
				os.close();
			}
			catch (Exception eclose)
			{
				eclose.printStackTrace();
			}
	}

	private String readFile(File file)
	{
		InputStream os = null;
		int len = (int)file.length();
		if (len < 0)
			return "";
		byte b[];
		b = new byte[len];
		os = new FileInputStream(file);
		os.read(b);
		os.close();
		System.out.println(len);
		System.out.println(new String(b));
		return new String(b);
		Exception e;
		e;
		System.out.println("不能读取文件");
		e.printStackTrace();
		if (os != null)
			try
			{
				os.close();
			}
			catch (Exception eclose)
			{
				eclose.printStackTrace();
			}
		return "";
	}

}
