// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TemplateTable.java

package com.iscp.sys.coder.model;

import com.iscp.sys.coder.StringJoiner;
import java.util.*;
import org.jdom.Element;

// Referenced classes of package com.iscp.sys.coder.model:
//			TableInterface, FieldInterface

public class TemplateTable
{

	public String name;
	public boolean generate;
	public String key[];
	public String idgenerator;

	public TemplateTable()
	{
	}

	public TemplateTable(TableInterface table)
	{
		name = table.getTabName();
		Iterator it = table.getFields().iterator();
		Vector keyBuffer = new Vector();
		while (it.hasNext()) 
		{
			FieldInterface fi = (FieldInterface)it.next();
			if (fi.getIsKey().equals("1"))
				keyBuffer.add(fi.getName());
		}
		int size = keyBuffer.size();
		key = new String[size];
		for (int i = 0; i < size; i++)
			key[i] = (String)keyBuffer.get(i);

	}

	public void importTemplateXML(Element e)
	{
		List list = e.getChildren();
		Iterator it = list.iterator();
		name = e.getAttributeValue("name");
		Vector keyBuffer = new Vector();
		while (it.hasNext()) 
		{
			Object o = it.next();
			if (o instanceof Element)
			{
				Element ele = (Element)o;
				if (ele.getName().equals("generate"))
					generate = ele.getText().equals("true");
				else
				if (ele.getName().equals("key"))
					keyBuffer.add(ele.getText());
				else
				if (ele.getName().equals("idgenerator"))
					idgenerator = ele.getText();
			}
		}
		int size = keyBuffer.size();
		key = new String[size];
		for (int i = 0; i < size; i++)
			key[i] = (String)keyBuffer.get(i);

	}

	public void appendTemplateXML(StringBuffer sb, int tab)
	{
		sb.append(StringJoiner.getTabSpace(tab));
		sb.append((new StringBuilder("<table name=\"")).append(name).append("\">\r\n").toString());
		sb.append(StringJoiner.getTabSpace(tab + 1));
		sb.append((new StringBuilder("<generate>")).append(generate).append("</generate>\r\n").toString());
		for (int i = 0; i < key.length; i++)
		{
			sb.append(StringJoiner.getTabSpace(tab + 1));
			sb.append((new StringBuilder("<key>")).append(key[i]).append("</key>\r\n").toString());
		}

		if (idgenerator != null)
		{
			sb.append(StringJoiner.getTabSpace(tab + 1));
			sb.append((new StringBuilder("<idgenerator>")).append(idgenerator).append("</idgenerator>\r\n").toString());
		}
		sb.append(StringJoiner.getTabSpace(tab));
		sb.append("</table>\r\n");
	}
}
