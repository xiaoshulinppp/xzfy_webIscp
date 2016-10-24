// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TemplateMany2Many.java

package com.iscp.sys.coder.model;

import com.iscp.sys.coder.StringJoiner;
import java.util.Iterator;
import java.util.List;
import org.jdom.Element;

public class TemplateMany2Many
{

	public String tablea;
	public String tableb;
	public String jointable;

	public TemplateMany2Many()
	{
	}

	public void importTemplateXML(Element e)
	{
		List list = e.getChildren();
		for (Iterator it = list.iterator(); it.hasNext();)
		{
			Object o = it.next();
			if (o instanceof Element)
			{
				Element ele = (Element)o;
				if (ele.getName().equals("tablea"))
					tablea = ele.getText();
				else
				if (ele.getName().equals("tableb"))
					tableb = ele.getText();
				else
				if (ele.getName().equals("jointable"))
					jointable = ele.getText();
			}
		}

	}

	public void appendTemplateXML(StringBuffer sb, int tab)
	{
		sb.append(StringJoiner.getTabSpace(tab));
		sb.append("<many2many>\r\n");
		sb.append(StringJoiner.getTabSpace(tab + 1));
		sb.append((new StringBuilder("<tablea>")).append(tablea).append("</tablea>\r\n").toString());
		sb.append(StringJoiner.getTabSpace(tab + 1));
		sb.append((new StringBuilder("<tableb>")).append(tableb).append("</tableb>\r\n").toString());
		sb.append(StringJoiner.getTabSpace(tab + 1));
		sb.append((new StringBuilder("<jointable>")).append(jointable).append("</jointable>\r\n").toString());
		sb.append(StringJoiner.getTabSpace(tab));
		sb.append("</many2many>\r\n");
	}
}
