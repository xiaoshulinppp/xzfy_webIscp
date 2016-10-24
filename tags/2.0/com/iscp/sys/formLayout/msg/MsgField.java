// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MsgField.java

package com.iscp.sys.formLayout.msg;

import java.io.Serializable;
import java.util.Map;

public class MsgField
	implements Serializable
{

	public Map property;
	public boolean one_to_one;
	public int id;
	public String name;
	public String tableName;
	public String logTableName;
	public String byName;
	public String type;
	public String showType;
	public String enu;
	public String length;
	public String default_;
	public String isNull;
	public String isDict;
	public String dictListId;
	public String dictType;
	public String dictvalGetType;
	public String dictvalShowType;
	public String action;
	public String relatedTable;
	public String relatedId;
	public String targetRelationType;
	public String tabIndex;
	public String field_mappingtable;
	public String iskey;

	public MsgField()
	{
	}

	public boolean getOne_to_one()
	{
		return one_to_one;
	}

	public void setOne_to_one(boolean one_to_one)
	{
		this.one_to_one = one_to_one;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTableName()
	{
		return tableName;
	}

	public void setTableName(String tableName)
	{
		this.tableName = tableName;
	}

	public String getLogTableName()
	{
		return logTableName;
	}

	public void setLogTableName(String logTableName)
	{
		this.logTableName = logTableName;
	}

	public String getByName()
	{
		return byName;
	}

	public void setByName(String byName)
	{
		this.byName = byName;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public String getShowType()
	{
		return showType;
	}

	public void setShowType(String showType)
	{
		this.showType = showType;
	}

	public String getEnu()
	{
		return enu;
	}

	public void setEnu(String enu)
	{
		this.enu = enu;
	}

	public String getLength()
	{
		return length;
	}

	public void setLength(String length)
	{
		this.length = length;
	}

	public String getDefault()
	{
		return default_;
	}

	public void setDefault(String default_)
	{
		this.default_ = default_;
	}

	public String getIsNull()
	{
		return isNull;
	}

	public void setIsNull(String isNull)
	{
		this.isNull = isNull;
	}

	public String getIsDict()
	{
		return isDict;
	}

	public void setIsDict(String isDict)
	{
		this.isDict = isDict;
	}

	public String getDictListId()
	{
		return dictListId;
	}

	public void setDictListId(String dictListId)
	{
		this.dictListId = dictListId;
	}

	public String getDictType()
	{
		return dictType;
	}

	public void setDictType(String dictType)
	{
		this.dictType = dictType;
	}

	public void setDictvalGetType(String dictvalGetType)
	{
		this.dictvalGetType = dictvalGetType;
	}

	public String getDictvalGetType()
	{
		return dictvalGetType;
	}

	public String getDictvalShowType()
	{
		return dictvalShowType;
	}

	public void setDictvalShowType(String dictvalShowType)
	{
		this.dictvalShowType = dictvalShowType;
	}

	public String getAction()
	{
		return action;
	}

	public void setAction(String action)
	{
		this.action = action;
	}

	public String getRelatedTable()
	{
		return relatedTable;
	}

	public void setRelatedTable(String relatedTable)
	{
		this.relatedTable = relatedTable;
	}

	public String getRelatedId()
	{
		return relatedId;
	}

	public void setRelatedId(String relatedId)
	{
		this.relatedId = relatedId;
	}

	public String getTargetRelationType()
	{
		return targetRelationType;
	}

	public void setTargetRelationType(String targetRelationType)
	{
		this.targetRelationType = targetRelationType;
	}

	public void setTabIndex(String tabIndex)
	{
		this.tabIndex = tabIndex;
	}

	public String getTabIndex()
	{
		return tabIndex;
	}

	public String getField_mappingtable()
	{
		return field_mappingtable;
	}

	public void setField_mappingtable(String field_mappingtable)
	{
		this.field_mappingtable = field_mappingtable;
	}

	public void setIskey(String iskey)
	{
		this.iskey = iskey;
	}

	public String getIskey()
	{
		return iskey;
	}
}
