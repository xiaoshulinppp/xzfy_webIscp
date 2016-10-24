// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   HbmCoder.java

package com.iscp.sys.coder.hbmcoder;

import com.iscp.sys.coder.Coder;
import com.iscp.sys.coder.StringJoiner;
import com.iscp.sys.coder.model.*;
import java.io.ByteArrayOutputStream;
import java.util.HashSet;
import java.util.Set;
import org.dom4j.DocumentFactory;
import org.dom4j.Element;
import org.dom4j.io.XMLWriter;

// Referenced classes of package com.iscp.sys.coder.hbmcoder:
//			HbmTable, HbmColumn

public class HbmCoder
{

	static String HBMTITLE1 = "<?xml version=\"1.0\"?>\r\n";
	static String HBMTITLE2 = "<!DOCTYPE hibernate-mapping\r\n";
	static String HBMTITLE3 = "PUBLIC \"-//Hibernate/Hibernate Mapping DTD 2.0//EN\"\r\n";
	static String HBMTITLE4 = "http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd\"\r\n";
	static String HBMTITLE5 = ">\r\n";
	private TableInterface table__;
	private RelationInterface rels__[];
	private IdTypeInterface idType__;
	private Set tableNameWithMoreThanOneRelation;
	private int tab;
	public static final int ONE_ATTR_ONE_LINE = 0;
	public static final int ALL_ATTR_ONE_LINE = 1;
	public static final int DEFAULT_ATTR_STYLE = 2;
	private static int attrStyle = 2;

	public HbmCoder()
	{
		tab = 0;
	}

	public String getBeanExpress(TableInterface table, RelationInterface rels[], IdTypeInterface idType)
		throws Exception
	{
		table__ = table;
		rels__ = rels;
		idType__ = idType;
		Element element = getBeanElement(table, rels);
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		XMLWriter writer = new XMLWriter();
		writer.setOutputStream(outputStream);
		outputStream.write(HBMTITLE1.getBytes());
		outputStream.write(HBMTITLE2.getBytes());
		outputStream.write(StringJoiner.getTabSpace(1).getBytes());
		outputStream.write(HBMTITLE3.getBytes());
		outputStream.write(StringJoiner.getTabSpace(1).getBytes());
		outputStream.write(HBMTITLE4.getBytes());
		outputStream.write(HBMTITLE5.getBytes());
		writer.write(element);
		return outputStream.toString();
	}

	public Element getBeanElement(TableInterface table, RelationInterface rels[])
	{
		return getBeanElement(table, rels, 0);
	}

	public Element getBeanElement(TableInterface table, RelationInterface rels[], int tab)
	{
		Element element = DocumentFactory.getInstance().createElement("hibernate-mapping");
		Element classElement = DocumentFactory.getInstance().createElement("class");
		setAttr(classElement, new HbmTable(table), tab + 1);
		nextLine(element, tab + 1);
		element.add(classElement);
		Object columns[] = table.getFields().toArray();
		for (int i = 0; i < columns.length; i++)
		{
			nextLine(classElement, tab + 2);
			classElement.add(getPropertyElement(new HbmColumn((FieldInterface)columns[i], idType__), tab + 2));
		}

		tableNameWithMoreThanOneRelation = new HashSet();
		Set tempTableName = new HashSet();
		for (int i = 0; i < rels.length; i++)
			if (rels[i].getTable_host().equals(table.getTabName()) && !tempTableName.add(rels[i].getTable_related()))
				tableNameWithMoreThanOneRelation.add(rels[i].getTable_related());

		for (int i = 0; i < rels.length; i++)
			if (rels[i].getTable_host().equals(table.getTabName()))
			{
				nextLine(classElement, tab + 2);
				HbmColumn column = new HbmColumn(rels[i]);
				if (tableNameWithMoreThanOneRelation.contains(rels[i].getTable_related()))
					column.setNameWithColumn(rels[i].getColumn_host());
				classElement.add(getPropertyElement(column, tab + 2));
			}

		nextLine(classElement, tab + 1);
		nextLine(element, tab);
		return element;
	}

	private void setAttr(Element element, HbmTable table, int tab)
	{
		addAttr(element, "name", table.getName(), tab);
		addAttr(element, "package", (new StringBuilder(String.valueOf(Coder.getPackageExpress()))).append("bean").toString(), tab);
		addAttr(element, "table", table.getTable(), tab);
	}

	public Element getPropertyElement(HbmColumn column, int tab)
	{
		this.tab = tab;
		Element element = DocumentFactory.getInstance().createElement(column.getHbmTypeName());
		if (column.getHbmType() == 4)
			setElementExpress_id(element, column);
		else
		if (column.getHbmType() == 5)
			setElementExpress_property(element, column);
		else
		if (column.getHbmType() == 0)
			setElementExpress_one_to_one(element, column);
		else
		if (column.getHbmType() == 2)
			setElementExpress_many_to_one(element, column);
		else
		if (column.getHbmType() == 3)
			setElementExpress_many_to_many(element, column);
		else
		if (column.getHbmType() == 1)
			setElementExpress_one_to_many(element, column);
		return element;
	}

	private void setElementExpress_id(Element element, HbmColumn column)
	{
		commonSetting(element, column);
		Element generatorElement = DocumentFactory.getInstance().createElement("generator");
		Element paramElement = DocumentFactory.getInstance().createElement("param");
		nextLine(element, tab + 1);
		element.add(generatorElement);
		nextLine(element, tab);
		if (column.isOperator())
		{
			if (idType__.getType() == 0)
				addAttr(generatorElement, "class", "increment");
			else
			if (idType__.getType() == 2)
				addAttr(generatorElement, "class", "native");
			else
			if (idType__.getType() == 1)
				addAttr(generatorElement, "class", "uuid.hex");
		} else
		{
			addAttr(generatorElement, "class", "foreign");
			nextLine(generatorElement, tab + 2);
			generatorElement.add(paramElement);
			nextLine(generatorElement, tab + 1);
			addAttr(paramElement, "name", "property");
			String propertyName = null;
			for (int i = 0; i < rels__.length; i++)
			{
				if (rels__[i].getType() != 0 || !rels__[i].getInverse().equals("0"))
					continue;
				propertyName = (new HbmColumn(rels__[i])).getName();
				break;
			}

			addText(paramElement, propertyName);
		}
	}

	private void setElementExpress_property(Element element, HbmColumn property)
	{
		commonSetting(element, property);
		if (!property.isOperator())
		{
			addAttr(element, "insert", "false");
			addAttr(element, "update", "false");
		}
	}

	private void setElementExpress_one_to_one(Element element, HbmColumn property)
	{
		if (property.isIdRelated())
		{
			addAttr(element, "name", property.getName());
			addAttr(element, "class", property.getRelatedClass());
			addAttr(element, "constrained", (new StringBuilder()).append(property.isOperator()).toString());
			addAttr(element, "cascade", property.getCascade());
		} else
		{
			addAttr(element, "name", property.getName());
			addAttr(element, "class", property.getRelatedClass());
			addAttr(element, "property-ref", property.getRelatedColumn());
			addAttr(element, "constrained", (new StringBuilder()).append(property.isOperator()).toString());
			addAttr(element, "cascade", property.getCascade());
		}
	}

	private void setElementExpress_many_to_one(Element element, HbmColumn column)
	{
		addAttr(element, "name", column.getName());
		addAttr(element, "class", column.getValueTypeName());
		addAttr(element, "column", column.getColumn());
		addAttr(element, "cascade", column.getCascade());
		if (!column.isIdRelated())
			addAttr(element, "property-ref", column.getProperty_ref());
	}

	private void setElementExpress_one_to_many(Element element, HbmColumn column)
	{
		addAttr(element, "name", column.getName());
		addAttr(element, "cascade", column.getCascade());
		addAttr(element, "inverse", (new StringBuilder()).append(!column.isOperator()).toString());
		Element keyElement = DocumentFactory.getInstance().createElement("key");
		nextLine(element, tab + 1);
		element.add(keyElement);
		addAttr(keyElement, "column", column.getRelatedColumn());
		Element one_to_manyElement = DocumentFactory.getInstance().createElement("one-to-many");
		nextLine(element, tab + 1);
		element.add(one_to_manyElement);
		addAttr(one_to_manyElement, "class", column.getRelatedClass());
		nextLine(element, tab);
	}

	private void setElementExpress_many_to_many(Element element, HbmColumn column)
	{
		addAttr(element, "name", column.getName());
		addAttr(element, "table", column.getMidTableName());
		addAttr(element, "cascade", column.getCascade());
		addAttr(element, "inverse", (new StringBuilder()).append(!column.isManyToManyOperator()).toString());
		Element keyElement = DocumentFactory.getInstance().createElement("key");
		nextLine(element, tab + 1);
		element.add(keyElement);
		addAttr(keyElement, "column", column.getMidTableColumnName_host());
		if (!column.isIdHost())
			addAttr(element, "column", column.getColumn());
		Element many_to_manyElement = DocumentFactory.getInstance().createElement("many-to-many");
		nextLine(element, tab + 1);
		element.add(many_to_manyElement);
		addAttr(many_to_manyElement, "class", column.getRelatedClass());
		addAttr(many_to_manyElement, "column", column.getMidTableColumnName_related());
		nextLine(element, tab);
	}

	private void commonSetting(Element element, HbmColumn column)
	{
		addAttr(element, "name", column.getLogName());
		addAttr(element, "type", column.getValueTypeName());
		addAttr(element, "column", column.getName());
	}

	private void addAttr(Element element, String name, String value)
	{
		int tabInner = 0;
		int defaultAttr = 0;
		if (element.getName().equals("generator") || element.getName().equals("one-to-many") || element.getName().equals("many-to-many") || element.getName().equals("key"))
		{
			tabInner = 1;
			defaultAttr = 1;
		} else
		if (element.getName().equals("param"))
		{
			tabInner = 2;
			defaultAttr = 1;
		}
		if (attrStyle == 2)
			addAttr(element, name, value, tab + tabInner, defaultAttr);
		else
			addAttr(element, name, value, tab + tabInner, attrStyle);
	}

	private void addText(Element element, String text)
	{
		if (text != null)
		{
			org.dom4j.Text t = DocumentFactory.getInstance().createText(text);
			element.add(t);
		}
	}

	public static void addAttr(Element element, String name, String value, int tab, int style)
	{
		if (value != null)
		{
			if (style == 0)
				name = (new StringBuilder("\r\n")).append(StringJoiner.getTabSpace(tab)).append(" ").append(name).toString();
			org.dom4j.Attribute attr = DocumentFactory.getInstance().createAttribute(element, name, value);
			element.add(attr);
		}
	}

	private void addAttr(Element element, String name, String value, int tab)
	{
		if (attrStyle == 2)
			addAttr(element, name, value, tab, 0);
		else
			addAttr(element, name, value, tab, attrStyle);
	}

	public static void nextLine(Element element, int tab)
	{
		element.addText((new StringBuilder("\r\n")).append(StringJoiner.getTabSpace(tab)).toString());
	}

}
