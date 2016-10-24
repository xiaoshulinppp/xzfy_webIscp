// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   RelationManager.java

package com.iscp.sys.creator.relationManager;

import com.iscp.sys.creator.model.*;
import java.util.*;

// Referenced classes of package com.iscp.sys.creator.relationManager:
//			RelationModelInterface, SYS_LogicTableInterface

public class RelationManager
{

	private static PropertyMod p[];

	public RelationManager()
	{
	}

	public static void setRelationFieldProperties(PropertyMod host, PropertyMod related, RelationModelInterface relation, ModelManager modelManager)
	{
		host.setColumn(relation.getColumn_host());
		related.setColumn(relation.getColumn_related());
		host.setBean(modelManager.findBean(relation.getTable_host()));
		related.setBean(modelManager.findBean(relation.getTable_related()));
		if (relation.getName_host() == null)
			host.setName(related.getBean().getName_class());
		else
			host.setName(relation.getName_host());
		if (relation.getName_related() == null)
			related.setName(host.getBean().getName_class());
		else
			related.setName(relation.getName_related());
	}

	public static BeanMod[] importRelations(RelationModelInterface relations[], SYS_LogicTableInterface tables[])
	{
		ModelManager modelManager = new ModelManager();
		modelManager.importBeans(tables);
		importRelations(relations, modelManager);
		return modelManager.getAllBeans();
	}

	public static BeanMod[] importRelations(RelationModelInterface relations[], SYS_LogicTableInterface tables[], SYS_LogicTableInterface table_need_create)
	{
		return importRelations(relations, tables, table_need_create.getTabName());
	}

	public static BeanMod[] importRelations(RelationModelInterface relations[], SYS_LogicTableInterface tables[], String table_need_create)
	{
		ModelManager modelManager = new ModelManager();
		modelManager.importBeans(tables);
		importRelations(relations, modelManager);
		BeanMod bean = modelManager.findBean(table_need_create);
		Set bean_to_create = new HashSet();
		int size = bean.getPropertyCount();
		for (int i = 0; i < size; i++)
		{
			PropertyMod p = bean.getProperty(i);
			if (p.getRelatedProperty() != null)
				bean_to_create.add(p.getRelatedProperty().getBean());
		}

		size = bean_to_create.size();
		BeanMod beans[] = new BeanMod[size + 1];
		Iterator it = bean_to_create.iterator();
		int i = 0;
		while (it.hasNext()) 
			beans[i++] = (BeanMod)it.next();
		beans[i] = bean;
		return beans;
	}

	public static void importRelations(RelationModelInterface relations[], ModelManager modelManager)
	{
		for (int i = 0; i < relations.length; i++)
		{
			PropertyMod host = new PropertyMod();
			PropertyMod related = new PropertyMod();
			setRelationFieldProperties(host, related, relations[i], modelManager);
			switch (relations[i].getType())
			{
			case 0: // '\0'
				createRelation_one_to_one(host, related);
				break;

			case 1: // '\001'
				createRelation_one_to_many(host, related);
				break;

			case 2: // '\002'
				createRelation_one_to_many(related, host);
				break;

			case 3: // '\003'
				createRelation_many_to_many(host, related, relations[i].getMid_table(), relations[i].getMid_table_host(), relations[i].getMid_table_related());
				break;
			}
		}

	}

	public static boolean createRelation_one_to_one(PropertyMod host, PropertyMod related)
	{
		host.setType(2);
		host.setValueType(2);
		host.setRelatedProperty(related);
		host.setIsOperator(true);
		host.setCascade("all");
		PropertyMod id = host.getBean().getIdProperty();
		id.setIsOperator(false);
		id.setRelatedProperty(host);
		related.setType(2);
		related.setValueType(2);
		related.setRelatedProperty(host);
		related.setCascade("all");
		related.setIsOperator(false);
		id = related.getBean().getIdProperty();
		id.setIsOperator(true);
		id.setRelatedProperty(host);
		return true;
	}

	public static boolean createRelation_many_to_many(PropertyMod host, PropertyMod related, String tableName, String host_columnName, String related_columnName)
	{
		host.setType(5);
		host.setValueType(2);
		host.setRelatedProperty(related);
		host.setIsOperator(false);
		host.setIsManyToManyOperator(true);
		host.setMidTableColumnName_host(host_columnName);
		host.setMidTableColumnName_relate(related_columnName);
		host.setMidTableName(tableName);
		host.setCascade("save-update");
		related.setType(5);
		related.setValueType(2);
		related.setRelatedProperty(host);
		related.setIsOperator(false);
		related.setIsManyToManyOperator(false);
		related.setMidTableColumnName_host(related_columnName);
		related.setMidTableColumnName_relate(host_columnName);
		related.setMidTableName(tableName);
		related.setCascade("save-update");
		return true;
	}

	public static boolean createRelation_one_to_many(PropertyMod host, PropertyMod related)
	{
		host.setType(4);
		host.setRelatedProperty(related);
		host.setIsOperator(false);
		related.setType(3);
		related.setRelatedProperty(host);
		related.setIsOperator(true);
		related.setValueType(2);
		return true;
	}

	public static void alterOperators(PropertyMod properties[])
	{
		p = properties;
		for (int i = 0; i < p.length; i++)
		{
			p[i].setFixed(false);
			p[i].setIsOperator(false);
		}

		setOperators(3);
		setOperators(2);
		setOperators(6);
		setOperators(7);
		setOperators(4);
		setOperators(5);
		setOperators(8);
		setOperators(9);
		setOperators(-1);
	}

	private static void setOperators(int propertyType)
	{
		for (int i = 0; i < p.length; i++)
			if ((p[i].getType() == propertyType || propertyType < 0) && setOperator(p[i], false))
				setOperator(p[i], true);

	}

	private static boolean setOperator(PropertyMod pro, boolean fixed)
	{
		if (pro.getType() == 7 || pro.getType() == 5 || pro.getType() == 9)
			return false;
		PropertyMod relatedPro = pro.getRelatedProperty();
		PropertyMod sameColumnProperties[] = pro.getBean().getProperties(pro.getColumn());
		if (relatedPro.getIsOperator())
			return false;
		for (int i = 0; i < sameColumnProperties.length; i++)
			if (sameColumnProperties[i].getIsOperator() && sameColumnProperties[i] != pro)
				return false;

		pro.setIsOperator(true);
		for (int i = 0; i < sameColumnProperties.length; i++)
			if (sameColumnProperties[i] != pro)
			{
				PropertyMod otherRelatedPro = sameColumnProperties[i].getRelatedProperty();
				if (otherRelatedPro != null && !setOperator(otherRelatedPro, fixed))
				{
					for (int j = 0; j < i; j++)
						if (sameColumnProperties[j] != pro)
						{
							PropertyMod otherRelatedPro_ = sameColumnProperties[j].getRelatedProperty();
							cancleOperator(otherRelatedPro_);
						}

					pro.setIsOperator(false);
					return false;
				}
			}

		if (fixed)
			pro.setFixed(true);
		return true;
	}

	private static void cancleOperator(PropertyMod pro)
	{
		if (!pro.getFixed())
			pro.setIsOperator(false);
	}
}
