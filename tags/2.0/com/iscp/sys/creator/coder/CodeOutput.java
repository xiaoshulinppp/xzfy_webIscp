// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CodeOutput.java

package com.iscp.sys.creator.coder;

import com.iscp.sys.creator.coder.hbmCoder.CoderManager;
import com.iscp.sys.creator.model.BeanMod;
import com.iscp.sys.creator.relationManager.RelationManager;
import com.iscp.sys.creator.relationManager.RelationModelInterface;
import com.iscp.sys.creator.relationManager.SYS_LogicTableInterface;
import com.sun.tools.javac.Main;
import java.io.File;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Vector;

public class CodeOutput
{

	public static String basepath;
	private static boolean cover;

	public CodeOutput()
	{
	}

	public static void output(BeanMod model)
		throws Exception
	{
		CoderManager.writeBeanHbm(model);
		com.iscp.sys.creator.coder.classCoder.CoderManager.writeBeanJava(model);
	}

	public static String getBasePath(Object obj)
	{
		System.out.println(obj.getClass().getName());
		String packageName = obj.getClass().getPackage().getName();
		String backPath = "/";
		for (int count = 0; count >= 0;)
		{
			count = packageName.indexOf(".", count + 1);
			backPath = (new StringBuilder(String.valueOf(backPath))).append("../").toString();
		}

		return (new StringBuilder()).append(obj.getClass().getResource("")).append(backPath).toString();
	}

	public static String[] output(RelationModelInterface relations[], SYS_LogicTableInterface tables[], boolean cover_)
		throws Exception
	{
		cover = cover_;
		return output(relations, tables);
	}

	public static String[] output(RelationModelInterface relations[], SYS_LogicTableInterface tables[])
		throws Exception
	{
		basepath = getBasePath(tables[0]);
		BeanMod beans[] = RelationManager.importRelations(relations, tables);
		String newpath = basepath;
		if (newpath.indexOf("file:/") >= 0)
			newpath = newpath.substring(6);
		else
		if (newpath.indexOf("file:") >= 0)
			newpath = newpath.substring(5);
		String comp[] = new String[beans.length + 2];
		comp[0] = "-d";
		comp[1] = newpath;
		for (int i = 0; i < beans.length; i++)
			comp[i + 2] = (new StringBuilder(String.valueOf(getFilePath(beans[i])))).append(".java").toString();

		if (!cover)
		{
			Vector v = new Vector();
			for (int i = 0; i < beans.length; i++)
				if ((new File(comp[i + 2])).exists() || (new File((new StringBuilder(String.valueOf(getFilePath(beans[i])))).append(".class").toString())).exists())
					v.add(beans[i].getName());

			if (v.size() > 0)
			{
				int size = v.size();
				String existClassName[] = new String[size];
				for (int i = 0; i < size; i++)
					existClassName[i] = (String)v.get(i);

				return existClassName;
			}
		}
		for (int i = 0; i < beans.length; i++)
			output(beans[i]);

		Main m = new Main();
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw, true);
		if (Main.compile(comp, pw) != 0)
			throw new Exception(sw.toString());
		for (int i = 0; i < beans.length; i++)
			Class.forName(beans[i].getName()).getClassLoader().loadClass(beans[i].getName());

		return null;
	}

	private static String getFilePath(BeanMod model)
	{
		String beanName = model.getName();
		beanName = beanName.replace('.', '/');
		String fileName = (new StringBuilder(String.valueOf(basepath))).append(beanName).toString();
		if (fileName.indexOf("file:/") >= 0)
			fileName = fileName.substring(6);
		else
		if (fileName.indexOf("file:") >= 0)
			fileName = fileName.substring(5);
		return fileName;
	}

	public static boolean writeFile(RelationModelInterface relations[], SYS_LogicTableInterface tables[], SYS_LogicTableInterface table)
		throws Exception
	{
		basepath = getBasePath(table);
		BeanMod beans[] = RelationManager.importRelations(relations, tables);
		String newpath = basepath;
		if (newpath.indexOf("file:/") >= 0)
			newpath = newpath.substring(6);
		else
		if (newpath.indexOf("file:") >= 0)
			newpath = newpath.substring(5);
		BeanMod bean = null;
		for (int i = 0; i < beans.length; i++)
		{
			if (!beans[i].getTable().equals(table.getTabName()))
				continue;
			bean = beans[i];
			break;
		}

		if (!cover && ((new File((new StringBuilder(String.valueOf(getFilePath(bean)))).append(".java").toString())).exists() || (new File((new StringBuilder(String.valueOf(getFilePath(bean)))).append(".class").toString())).exists()))
		{
			return false;
		} else
		{
			output(bean);
			return true;
		}
	}
}
