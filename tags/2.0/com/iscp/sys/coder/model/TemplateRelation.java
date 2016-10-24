// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TemplateRelation.java

package com.iscp.sys.coder.model;

import com.iscp.sys.coder.StringJoiner;
import java.util.Iterator;
import java.util.List;
import org.jdom.Element;

public class TemplateRelation
{

	public String name;
	public String fktable;
	public String fkcolumn;
	public String pktable;
	public String pkcolumn;

	public TemplateRelation()
	{
	}

	public void importTemplateXML(Element e)
	{
		List list = e.getChildren();
		Iterator it = list.iterator();
		name = e.getAttributeValue("name");
		while (it.hasNext()) 
		{
			Object o = it.next();
			if (o instanceof Element)
			{
				Element ele = (Element)o;
				if (ele.getName().equals("pktable"))
					pktable = ele.getText();
				else
				if (ele.getName().equals("pkcolumn"))
					pkcolumn = ele.getText();
				else
				if (ele.getName().equals("fktable"))
					fktable = ele.getText();
				else
				if (ele.getName().equals("fkcolumn"))
					fkcolumn = ele.getText();
			}
		}
	}

	public void appendTemplateXML(StringBuffer sb, int tab)
	{
		sb.append(StringJoiner.getTabSpace(tab));
		sb.append((new StringBuilder("<relation name=\"")).append(name).append("\">\r\n").toString());
		sb.append(StringJoiner.getTabSpace(tab + 1));
		sb.append((new StringBuilder("<pktable>")).append(pktable).append("</pktable>\r\n").toString());
		sb.append(StringJoiner.getTabSpace(tab + 1));
		sb.append((new StringBuilder("<pkcolumn>")).append(pkcolumn).append("</pkcolumn>\r\n").toString());
		sb.append(StringJoiner.getTabSpace(tab + 1));
		sb.append((new StringBuilder("<fktable>")).append(fktable).append("</fktable>\r\n").toString());
		sb.append(StringJoiner.getTabSpace(tab + 1));
		sb.append((new StringBuilder("<fkcolumn>")).append(fkcolumn).append("</fkcolumn>\r\n").toString());
		sb.append(StringJoiner.getTabSpace(tab));
		sb.append("</relation>\r\n");
	}
}
