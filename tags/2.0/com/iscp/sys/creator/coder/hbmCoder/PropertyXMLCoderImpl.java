// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   PropertyXMLCoderImpl.java

package com.iscp.sys.creator.coder.hbmCoder;

import com.iscp.sys.creator.model.BeanMod;
import com.iscp.sys.creator.model.PropertyMod;
import org.dom4j.DocumentFactory;
import org.dom4j.Element;

// Referenced classes of package com.iscp.sys.creator.coder.hbmCoder:
//			CoderManager

public class PropertyXMLCoderImpl
{

	private int tab;

	public PropertyXMLCoderImpl()
	{
		tab = 0;
	}

	public Element getElementExpress(PropertyMod property, int tab)
	{
		this.tab = tab;
		Element element = DocumentFactory.getInstance().createElement(property.getType_text());
		if (property.getType() == 0)
			setElementExpress_id(element, property);
		else
		if (property.getType() == 1)
			setElementExpress_property(element, property);
		else
		if (property.getType() == 2)
			setElementExpress_one_to_one(element, property);
		else
		if (property.getType() == 3)
			setElementExpress_many_to_one(element, property);
		else
		if (property.getType() == 7 || property.getType() == 5 || property.getType() == 9)
			setElementExpress_many_to_many(element, property);
		else
		if (property.getType() == 6 || property.getType() == 4 || property.getType() == 8)
			setElementExpress_one_to_many(element, property);
		return element;
	}

	private void setElementExpress_id(Element element, PropertyMod property)
	{
		commonSetting(element, property);
		Element generatorElement = DocumentFactory.getInstance().createElement("generator");
		CoderManager.nextLine(element, tab + 1);
		element.add(generatorElement);
		CoderManager.nextLine(element, tab);
		if (property.getIsOperator())
		{
			addAttr(generatorElement, "class", "increment");
		} else
		{
			addAttr(generatorElement, "class", "foreign");
			Element paramElement = DocumentFactory.getInstance().createElement("param");
			CoderManager.nextLine(generatorElement, tab + 2);
			generatorElement.add(paramElement);
			CoderManager.nextLine(generatorElement, tab + 1);
			addAttr(paramElement, "name", "property");
			addText(paramElement, property.getRelatedProperty().getBean().getName_class());
		}
	}

	private void setElementExpress_property(Element element, PropertyMod property)
	{
		commonSetting(element, property);
		if (!property.getIsOperator())
		{
			addAttr(element, "insert", "false");
			addAttr(element, "update", "false");
		}
	}

	private void setElementExpress_one_to_one(Element element, PropertyMod property)
	{
		if (property.getRelatedProperty().isId())
		{
			addAttr(element, "name", property.getName());
			addAttr(element, "class", property.getRelatedProperty().getBean().getName_class());
			addAttr(element, "constrained", (new StringBuilder()).append(property.getIsOperator()).toString());
			addAttr(element, "cascade", property.getCascade());
		} else
		{
			addAttr(element, "name", property.getName());
			addAttr(element, "class", property.getRelatedProperty().getBean().getName_class());
			addAttr(element, "property-ref", property.getRelatedProperty().getColumn());
			addAttr(element, "constrained", (new StringBuilder()).append(property.getIsOperator()).toString());
			addAttr(element, "cascade", property.getCascade());
		}
	}

	private void setElementExpress_many_to_one(Element element, PropertyMod property)
	{
		addAttr(element, "name", property.getName());
		addAttr(element, "class", property.getValueType_text());
		addAttr(element, "column", property.getColumn());
		addAttr(element, "cascade", property.getCascade());
		if (!property.getRelatedProperty().isId())
			addAttr(element, "property-ref", property.getRelatedProperty().getName());
	}

	private void setElementExpress_one_to_many(Element element, PropertyMod property)
	{
		addAttr(element, "name", property.getName());
		addAttr(element, "cascade", property.getCascade());
		addAttr(element, "inverse", (new StringBuilder()).append(!property.getIsOperator()).toString());
		Element keyElement = DocumentFactory.getInstance().createElement("key");
		CoderManager.nextLine(element, tab);
		element.add(keyElement);
		addAttr(keyElement, "column", property.getRelatedProperty().getColumn());
		Element one_to_manyElement = DocumentFactory.getInstance().createElement("one-to-many");
		CoderManager.nextLine(element, tab + 1);
		element.add(one_to_manyElement);
		addAttr(one_to_manyElement, "class", property.getRelatedProperty().getBean().getName_class());
		CoderManager.nextLine(element, tab);
	}

	private void setElementExpress_many_to_many(Element element, PropertyMod property)
	{
		addAttr(element, "name", property.getName());
		addAttr(element, "table", property.getMidTableName());
		addAttr(element, "cascade", property.getCascade());
		addAttr(element, "inverse", (new StringBuilder()).append(!property.getIsManyToManyOperator()).toString());
		Element keyElement = DocumentFactory.getInstance().createElement("key");
		CoderManager.nextLine(element, tab + 1);
		element.add(keyElement);
		addAttr(keyElement, "column", property.getMidTableColumnName_host());
		if (!property.isId())
			addAttr(element, "column", property.getColumn());
		Element many_to_manyElement = DocumentFactory.getInstance().createElement("many-to-many");
		CoderManager.nextLine(element, tab + 1);
		element.add(many_to_manyElement);
		addAttr(many_to_manyElement, "class", property.getRelatedProperty().getBean().getName_class());
		addAttr(many_to_manyElement, "column", property.getMidTableColumnName_relate());
		CoderManager.nextLine(element, tab);
	}

	private void commonSetting(Element element, PropertyMod property)
	{
		addAttr(element, "name", property.getName());
		addAttr(element, "type", property.getValueType_text());
		addAttr(element, "column", property.getColumn());
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
		if (CoderManager.getAttrStyle() == 2)
			CoderManager.addAttr(element, name, value, tab + tabInner, defaultAttr);
		else
			CoderManager.addAttr(element, name, value, tab + tabInner, CoderManager.getAttrStyle());
	}

	private void addText(Element element, String text)
	{
		if (text != null)
		{
			org.dom4j.Text t = DocumentFactory.getInstance().createText(text);
			element.add(t);
		}
	}
}
