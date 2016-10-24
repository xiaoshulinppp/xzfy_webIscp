// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   BeanClassCoderImpl.java

package com.iscp.sys.creator.coder.classCoder;

import com.iscp.sys.creator.model.BeanMod;
import com.iscp.sys.creator.model.PropertyMod;
import java.util.*;

// Referenced classes of package com.iscp.sys.creator.coder.classCoder:
//			CoderManager

public class BeanClassCoderImpl
{

	private LinkedList list;
	private Set importSet;
	private int strCount;
	private StringBuffer sb;
	private int tab;

	public BeanClassCoderImpl()
	{
		list = new LinkedList();
		importSet = new HashSet();
		strCount = 0;
		tab = 0;
	}

	public String getJavaBeanExpress(BeanMod bean)
	{
		javaBeanExpressImpl(bean);
		for (Iterator it = importSet.iterator(); it.hasNext();)
		{
			String packageName = (String)it.next();
			strCount += packageName.length() + 12;
		}

		sb = new StringBuffer(strCount);
		String str = (String)list.removeLast();
		sb.append(str);
		String packageName;
		for (Iterator it = importSet.iterator(); it.hasNext(); sb.append((new StringBuilder("import ")).append(packageName).append(".*;\r\n").toString()))
			packageName = (String)it.next();

		int size = list.size();
		for (int i = 0; i < size; i++)
		{
			str = (String)list.removeLast();
			sb.append(str);
		}

		return sb.toString();
	}

	private void javaBeanExpressImpl(BeanMod bean)
	{
		int size = bean.getPropertyCount();
		String packageName = null;
		String className = null;
		int pointIndex = bean.getName().lastIndexOf(".");
		if (pointIndex >= 0)
			packageName = bean.getName().substring(0, pointIndex);
		if (packageName != null)
		{
			joinln((new StringBuilder("package ")).append(packageName).append(";").toString());
			className = bean.getName().substring(pointIndex + 1);
		} else
		{
			className = bean.getName();
		}
		joinln("");
		joinln((new StringBuilder("public class ")).append(className).append("{").toString());
		for (int i = 0; i < size; i++)
			javaPropertyExpressImpl(bean.getProperty(i));

		joinln("}");
	}

	private void javaPropertyExpressImpl(PropertyMod p)
	{
		String methodName = (new StringBuilder(String.valueOf((char)((p.getName().charAt(0) - 97) + 65)))).append(p.getName().substring(1)).toString();
		String typeName = p.getValueType_text();
		if (p.getType() == 5 || p.getType() == 4)
			typeName = "java.util.Set";
		else
		if (p.getType() == 7 || p.getType() == 6)
			typeName = "java.util.Map";
		else
		if (p.getType() == 9 || p.getType() == 8)
			typeName = "java.util.List";
		else
		if (p.getType() == 0)
			typeName = "int";
		String packageName = null;
		int pointIndex = typeName.lastIndexOf(".");
		if (pointIndex >= 0)
		{
			packageName = typeName.substring(0, pointIndex);
			importSet.add(packageName);
		}
		if (packageName != null)
			typeName = typeName.substring(pointIndex + 1);
		joinln((new StringBuilder("private ")).append(typeName).append(" ").append(p.getName()).append(";").toString());
		joinln((new StringBuilder("public ")).append(typeName).append(" get").append(methodName).append("(){").toString());
		joinln((new StringBuilder("return ")).append(p.getName()).append(";").toString());
		joinln("}");
		joinln((new StringBuilder("public void set")).append(methodName).append("(").append(typeName).append(" ").append(p.getName()).append("){").toString());
		joinln((new StringBuilder("this.")).append(p.getName()).append(" = ").append(p.getName()).append(";").toString());
		joinln("}");
	}

	private void join(String str)
	{
		strCount += str.length();
		list.addFirst(str);
	}

	private void joinln(String str)
	{
		if (str.length() > 0 && str.charAt(str.length() - 1) == '}')
			tab--;
		join((new StringBuilder(String.valueOf(getTabSpace()))).append(str.trim()).append("\r\n").toString());
		if (str.length() > 0 && str.charAt(str.length() - 1) == '{')
			tab++;
	}

	private String getTabSpace()
	{
		return CoderManager.getTabSpace(tab);
	}
}
