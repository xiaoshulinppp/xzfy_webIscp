// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   BeanXMLCoderImpl.java

package com.iscp.sys.creator.coder.hbmCoder;

import com.iscp.sys.creator.model.BeanMod;
import org.dom4j.DocumentFactory;
import org.dom4j.Element;

// Referenced classes of package com.iscp.sys.creator.coder.hbmCoder:
//			CoderManager, PropertyXMLCoder

public class BeanXMLCoderImpl
{

	public BeanXMLCoderImpl()
	{
	}

	public Element getElementExpress(BeanMod bean)
	{
		return getElementExpress(bean, 0);
	}

	public Element getElementExpress(BeanMod bean, int tab)
	{
		Element element = DocumentFactory.getInstance().createElement("hibernate-mapping");
		Element classElement = DocumentFactory.getInstance().createElement("class");
		setAttr(classElement, bean, tab + 1);
		CoderManager.nextLine(element, tab + 1);
		element.add(classElement);
		PropertyXMLCoder coder = new PropertyXMLCoder();
		for (int i = 0; i < bean.getPropertyCount(); i++)
		{
			CoderManager.nextLine(classElement, tab + 2);
			classElement.add(coder.getElementExpress(bean.getProperty(i), tab + 2));
		}

		CoderManager.nextLine(classElement, tab + 1);
		CoderManager.nextLine(element, tab);
		return element;
	}

	private void setAttr(Element element, BeanMod bean, int tab)
	{
		addAttr(element, "entity_name", bean.getEntity_name(), tab);
		addAttr(element, "name", bean.getName_class(), tab);
		addAttr(element, "package", bean.getName_package(), tab);
		addAttr(element, "proxy", bean.getProxy(), tab);
		if (!bean.getLazy())
			addAttr(element, "lazy", "false", tab);
		addAttr(element, "table", bean.getTable(), tab);
		addAttr(element, "schema", bean.getSchema(), tab);
		addAttr(element, "catalog", bean.getCatalog(), tab);
		addAttr(element, "subselect", bean.getSubselect(), tab);
		addAttr(element, "discriminator_value", bean.getDiscriminator_value(), tab);
		if (!bean.getMutable())
			addAttr(element, "mutable", "false", tab);
		if (bean.getAbstract())
			addAttr(element, "abstract", "true", tab);
		if (!bean.getPolymorphism())
			addAttr(element, "explicit", "explicit", tab);
		addAttr(element, "where", bean.getWhere(), tab);
		addAttr(element, "persister", bean.getPersister(), tab);
		if (bean.getDynamic_update())
			addAttr(element, "dynamic_update", "true", tab);
		if (bean.getDynamic_insert())
			addAttr(element, "dynamic_insert", "true", tab);
		addAttr(element, "batch_size", bean.getBatch_size(), tab);
		if (bean.getSelect_before_update())
			addAttr(element, "select_before_update", "false", tab);
		if (bean.getOptimistic_lock() == 0)
			addAttr(element, "optimistic_lock", "none", tab);
		else
		if (bean.getOptimistic_lock() == 2)
			addAttr(element, "optimistic_lock", "dirty", tab);
		else
		if (bean.getOptimistic_lock() == 2)
			addAttr(element, "optimistic_lock", "all", tab);
		addAttr(element, "check", bean.getCheck(), tab);
		addAttr(element, "rowid", bean.getRowid(), tab);
		addAttr(element, "node", bean.getNode(), tab);
	}

	private void addAttr(Element element, String name, String value, int tab)
	{
		if (CoderManager.getAttrStyle() == 2)
			CoderManager.addAttr(element, name, value, tab, 0);
		else
			CoderManager.addAttr(element, name, value, tab, CoderManager.getAttrStyle());
	}
}
