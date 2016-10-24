// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   PropertyModImpl.java

package com.iscp.sys.creator.model;


// Referenced classes of package com.iscp.sys.creator.model:
//			PropertyMod, BeanMod

public class PropertyModImpl
{

	private String midTableName;
	private String midTableColumnName_host;
	private String midTableColumnName_relate;
	private PropertyMod myInterface;
	private boolean isOperator;
	private boolean isManyToManyOperator;
	private String cascade;
	private BeanMod bean;
	private int type;
	private int valueType;
	private String name;
	private String column;
	private PropertyMod relatedProperty;

	public void setIsOperator(boolean isOperator)
	{
		this.isOperator = isOperator;
	}

	public boolean getIsOperator()
	{
		return isOperator;
	}

	public void setIsManyToManyOperator(boolean isManyToManyOperator)
	{
		this.isManyToManyOperator = isManyToManyOperator;
	}

	public boolean getIsManyToManyOperator()
	{
		return isManyToManyOperator;
	}

	public void setCascade(String cascade)
	{
		this.cascade = cascade;
	}

	public String getCascade()
	{
		return cascade;
	}

	public void setMidTableName(String midTableName)
	{
		this.midTableName = midTableName;
	}

	public void setMidTableColumnName_host(String midTableColumnName_host)
	{
		this.midTableColumnName_host = midTableColumnName_host;
	}

	public void setMidTableColumnName_relate(String midTableColumnName_relate)
	{
		this.midTableColumnName_relate = midTableColumnName_relate;
	}

	public String getMidTableName()
	{
		return midTableName;
	}

	public String getMidTableColumnName_host()
	{
		if (midTableColumnName_host == null)
			return column;
		else
			return midTableColumnName_host;
	}

	public String getMidTableColumnName_relate()
	{
		if (midTableColumnName_relate == null)
			return relatedProperty.getColumn();
		else
			return midTableColumnName_relate;
	}

	public PropertyModImpl(PropertyMod myInterface)
	{
		isOperator = false;
		isManyToManyOperator = false;
		type = 1;
		valueType = 1;
		this.myInterface = myInterface;
	}

	public void setBean(BeanMod bean)
	{
		if (this.bean == bean)
			return;
		if (this.bean != null)
			this.bean.removeProperty(myInterface);
		this.bean = bean;
		if (this.bean != null)
			this.bean.addProperty(myInterface);
	}

	public BeanMod getBean()
	{
		return bean;
	}

	public void setType(int type)
	{
		this.type = type;
	}

	public int getType()
	{
		return type;
	}

	public String getType_text()
	{
		return PropertyMod.TYPES[type];
	}

	public void setValueType(int valueType)
	{
		this.valueType = valueType;
	}

	public int getValueType()
	{
		return valueType;
	}

	public String getValueType_text()
	{
		if (valueType < PropertyMod.VALUETYPES.length)
			return PropertyMod.VALUETYPES[valueType];
		else
			return relatedProperty.getBean().getName();
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getName()
	{
		if (name == null && getRelatedProperty() != null && getValueType() == 2)
		{
			name = getRelatedProperty().getBean().getName();
			int index = name.lastIndexOf(".");
			if (index >= 0)
				name = name.substring(index + 1);
			name = (new StringBuilder(String.valueOf((char)((name.charAt(0) - 65) + 97)))).append(name.substring(1)).toString();
			return name;
		} else
		{
			return name;
		}
	}

	public void setColumn(String column)
	{
		this.column = column;
	}

	public String getColumn()
	{
		return column;
	}

	public void setRelatedProperty(PropertyMod relatedProperty)
	{
		this.relatedProperty = relatedProperty;
	}

	public PropertyMod getRelatedProperty()
	{
		return relatedProperty;
	}
}
