// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   PropertyModel.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;


public class PropertyModel
	implements Comparable
{

	public boolean method;
	public String returnType;
	public String paramType[];
	public String param[];
	public boolean readonly;
	public String name;

	public PropertyModel(String name)
	{
		this(name, false);
	}

	public PropertyModel(String name, boolean method)
	{
		this.name = name;
		this.method = method;
	}

	public PropertyModel(String name, String param[])
	{
		this.name = name;
		this.param = param;
		method = true;
	}

	public String toString()
	{
		return name;
	}

	public String getExpress()
	{
		StringBuffer sb = new StringBuffer();
		if (method)
		{
			sb.append(name);
			sb.append("(");
			for (int i = 0; i < param.length; i++)
			{
				sb.append(paramType[i]);
				sb.append(" ");
				sb.append(param[i]);
				if (param.length == i + 1)
					sb.append(",");
			}

			sb.append(") ");
			sb.append(returnType);
		} else
		{
			sb.append(name);
			sb.append(" ");
			sb.append(returnType);
		}
		return sb.toString();
	}

	public int compareTo(Object o)
	{
		if (o instanceof PropertyModel)
			return name.compareTo(((PropertyModel)o).name);
		else
			return 0;
	}

	public boolean equals(Object o)
	{
		if (o instanceof PropertyModel)
		{
			PropertyModel pm = (PropertyModel)o;
			if (method != pm.method)
				return false;
			if (method)
			{
				if (!name.equals(pm.name))
					return false;
				return param.length == pm.param.length;
			} else
			{
				return name.equals(pm.name);
			}
		} else
		{
			return false;
		}
	}
}
