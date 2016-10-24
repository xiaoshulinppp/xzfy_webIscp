// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TemplateCoder.java

package com.iscp.sys.coder.model;

import com.iscp.sys.coder.StringJoiner;
import java.io.ByteArrayInputStream;
import java.net.URL;
import java.util.*;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

// Referenced classes of package com.iscp.sys.coder.model:
//			IdTypeInterface, TemplateTable, TableInterface, RelationInterface, 
//			TemplateMany2Many, TemplateRelation

public class TemplateCoder
{

	public TemplateTable tables[];
	public TemplateRelation rels[];
	public TemplateMany2Many many2many[];

	public TemplateCoder(TableInterface table, TableInterface tables[], RelationInterface rels[], IdTypeInterface idType, boolean generate)
	{
		String typeStr = null;
		if (idType.getType() == 1)
			typeStr = "UUID";
		else
		if (idType.getType() == 0)
			typeStr = "INCREMENT";
		else
		if (idType.getType() == 2)
			typeStr = "NATIVE";
		init(table, tables, rels, typeStr, generate);
	}

	public TemplateCoder(TableInterface table, TableInterface tables[], RelationInterface rels[], String idgenerator, boolean generate)
	{
		init(table, tables, rels, idgenerator, generate);
	}

	public TemplateCoder(String str)
	{
		importTemplateXML(str);
	}

	public void init(TableInterface table, TableInterface tables[], RelationInterface rels[], String idgenerator, boolean generate)
	{
		this.tables = new TemplateTable[tables.length];
		for (int i = 0; i < tables.length; i++)
		{
			this.tables[i] = new TemplateTable(tables[i]);
			this.tables[i].generate = tables[i].getTabName().equals(table.getTabName());
		}

		Vector relsBuffer = new Vector();
		Vector many2manyBuffer = new Vector();
		for (int i = 0; i < rels.length; i++)
			if (rels[i].getTable_host().equals(table.getTabName()) || rels[i].getTable_related().equals(table.getTabName()))
				if (rels[i].getType() == 3)
				{
					TemplateMany2Many m2m = new TemplateMany2Many();
					m2m.jointable = rels[i].getMid_table();
					if (rels[i].getInverse().equals("1"))
					{
						m2m.tablea = rels[i].getTable_related();
						m2m.tableb = rels[i].getTable_host();
					} else
					{
						m2m.tablea = rels[i].getTable_host();
						m2m.tableb = rels[i].getTable_related();
					}
					many2manyBuffer.add(m2m);
					TemplateRelation r = new TemplateRelation();
					r.name = (new StringBuilder(String.valueOf(rels[i].getTable_host()))).append("_").append(rels[i].getMid_table()).toString();
					r.pktable = rels[i].getTable_host();
					r.pkcolumn = rels[i].getColumn_host();
					r.fktable = rels[i].getMid_table();
					r.fkcolumn = rels[i].getMid_table_host();
					relsBuffer.add(r);
					r = new TemplateRelation();
					r.name = (new StringBuilder(String.valueOf(rels[i].getTable_related()))).append("_").append(rels[i].getMid_table()).toString();
					r.pktable = rels[i].getTable_related();
					r.pkcolumn = rels[i].getColumn_related();
					r.fktable = rels[i].getMid_table();
					r.fkcolumn = rels[i].getMid_table_related();
					relsBuffer.add(r);
				} else
				{
					TemplateRelation r = new TemplateRelation();
					if (rels[i].getInverse().equals("1"))
					{
						r.name = (new StringBuilder(String.valueOf(rels[i].getTable_related()))).append("_").append(rels[i].getTable_host()).toString();
						r.pktable = rels[i].getTable_related();
						r.pkcolumn = rels[i].getColumn_related();
						r.fktable = rels[i].getTable_host();
						r.fkcolumn = rels[i].getColumn_host();
					} else
					{
						r.name = (new StringBuilder(String.valueOf(rels[i].getTable_host()))).append("_").append(rels[i].getTable_related()).toString();
						r.pktable = rels[i].getTable_host();
						r.pkcolumn = rels[i].getColumn_host();
						r.fktable = rels[i].getTable_related();
						r.fkcolumn = rels[i].getColumn_related();
					}
					relsBuffer.add(r);
				}

		this.rels = new TemplateRelation[relsBuffer.size()];
		for (int i = 0; i < this.rels.length; i++)
			this.rels[i] = (TemplateRelation)relsBuffer.get(i);

		many2many = new TemplateMany2Many[many2manyBuffer.size()];
		for (int i = 0; i < many2many.length; i++)
			many2many[i] = (TemplateMany2Many)many2manyBuffer.get(i);

	}

	public String toTemplateXML()
	{
		return toTemplateXML(0);
	}

	public void importTemplateXML(String str)
	{
		try
		{
			SAXBuilder builder = new SAXBuilder();
			Document doc = builder.build(new ByteArrayInputStream(str.getBytes()));
			importTemplateXML(doc.getRootElement());
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public void importTemplateXML(Element e)
	{
		List list = e.getChildren();
		Iterator it = list.iterator();
		Vector tableBuffer = new Vector();
		Vector relsBuffer = new Vector();
		Vector m2mBuffer = new Vector();
		while (it.hasNext()) 
		{
			Object o = it.next();
			if (o instanceof Element)
			{
				Element ele = (Element)o;
				String eleName = ele.getName().toLowerCase();
				if (eleName.equals("table"))
				{
					TemplateTable tt = new TemplateTable();
					tt.importTemplateXML(ele);
					tableBuffer.add(tt);
				} else
				if (eleName.equals("relation"))
				{
					TemplateRelation tr = new TemplateRelation();
					tr.importTemplateXML(ele);
					relsBuffer.add(tr);
				} else
				if (eleName.equals("many2many"))
				{
					TemplateMany2Many tm2m = new TemplateMany2Many();
					tm2m.importTemplateXML(ele);
					m2mBuffer.add(tm2m);
				}
			}
		}
		int size = tableBuffer.size();
		tables = new TemplateTable[size];
		for (int i = 0; i < size; i++)
			tables[i] = (TemplateTable)tableBuffer.get(i);

		size = relsBuffer.size();
		rels = new TemplateRelation[size];
		for (int i = 0; i < size; i++)
			rels[i] = (TemplateRelation)relsBuffer.get(i);

		size = m2mBuffer.size();
		many2many = new TemplateMany2Many[size];
		for (int i = 0; i < size; i++)
			many2many[i] = (TemplateMany2Many)m2mBuffer.get(i);

	}

	public String toTemplateXML(int tab)
	{
		StringBuffer sb = new StringBuffer();
		sb.append(StringJoiner.getTabSpace(tab));
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n");
		sb.append(StringJoiner.getTabSpace(tab));
		sb.append("<codeTemplate>\r\n");
		for (int i = 0; i < tables.length; i++)
			tables[i].appendTemplateXML(sb, tab + 1);

		for (int i = 0; i < rels.length; i++)
			rels[i].appendTemplateXML(sb, tab + 1);

		for (int i = 0; i < many2many.length; i++)
			many2many[i].appendTemplateXML(sb, tab + 1);

		sb.append(StringJoiner.getTabSpace(tab));
		sb.append("</codeTemplate>\r\n");
		return sb.toString();
	}

	public void writeFiles(Configuration configuration, Session session1)
		throws Exception
	{
	}

	public static String getBasePath()
	{
		String path = com/iscp/sys/coder/model/TemplateCoder.getResource("").toString();
		int ind = path.indexOf("file:");
		if (ind >= 0)
		{
			path = path.substring(ind + 5);
		} else
		{
			ind = path.indexOf("file:/");
			if (ind >= 0)
				path = path.substring(ind + 6);
		}
		ind = path.indexOf("/WEB-INF/");
		if (ind >= 0)
		{
			path = path.substring(0, ind + 8);
		} else
		{
			int len = path.length();
			for (int i = 0; i < 6; i++)
				len = path.lastIndexOf("/", len) - 1;

			path = path.substring(0, len);
		}
		path = (new StringBuilder(String.valueOf(path))).append("/classes").toString();
		return path.replaceAll("%20", " ");
	}
}
