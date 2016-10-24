// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   PropertyMod.java

package com.iscp.sys.creator.model;


// Referenced classes of package com.iscp.sys.creator.model:
//			PropertyModImpl, BeanMod

public class PropertyMod
{

	public static final String TYPES[] = {
		"id", "property", "one-to-one", "many-to-one", "set", "set", "map", "map", "list", "list"
	};
	public static final String VALUETYPES[] = {
		"integer", "java.lang.String"
	};
	public static final int ID = 0;
	public static final int PROPERTY = 1;
	public static final int ONE_TO_ONE = 2;
	public static final int MANY_TO_ONE = 3;
	public static final int SET_ONE_TO_MANY = 4;
	public static final int SET_MANY_TO_MANY = 5;
	public static final int MAP_ONE_TO_MANY = 6;
	public static final int MAP_MANY_TO_MANY = 7;
	public static final int LIST_ONE_TO_MANY = 8;
	public static final int LIST_MANY_TO_MANY = 9;
	public static final int INT = 0;
	public static final int STRING = 1;
	public static final int OTHER = 2;
	private boolean fixed;
	private PropertyModImpl model;

	public void setFixed(boolean fixed)
	{
		this.fixed = fixed;
	}

	public boolean getFixed()
	{
		return fixed;
	}

	public PropertyMod()
	{
		fixed = false;
		model = new PropertyModImpl(this);
	}

	public void setIsOperator(boolean isOperator)
	{
		model.setIsOperator(isOperator);
	}

	public boolean getIsOperator()
	{
		return model.getIsOperator();
	}

	public void setIsManyToManyOperator(boolean isManyToManyOperator)
	{
		model.setIsManyToManyOperator(isManyToManyOperator);
	}

	public void setCascade(String cascade)
	{
		model.setCascade(cascade);
	}

	public String getCascade()
	{
		return model.getCascade();
	}

	public boolean getIsManyToManyOperator()
	{
		return model.getIsManyToManyOperator();
	}

	public void setMidTableName(String midTableName)
	{
		model.setMidTableName(midTableName);
	}

	public void setMidTableColumnName_host(String midTableColumnName_host)
	{
		model.setMidTableColumnName_host(midTableColumnName_host);
	}

	public void setMidTableColumnName_relate(String midTableColumnName_relate)
	{
		model.setMidTableColumnName_relate(midTableColumnName_relate);
	}

	public String getMidTableName()
	{
		return model.getMidTableName();
	}

	public String getMidTableColumnName_host()
	{
		return model.getMidTableColumnName_host();
	}

	public String getMidTableColumnName_relate()
	{
		return model.getMidTableColumnName_relate();
	}

	public void setBean(BeanMod bean)
	{
		model.setBean(bean);
	}

	public BeanMod getBean()
	{
		return model.getBean();
	}

	public void setType(int type)
	{
		model.setType(type);
	}

	public int getType()
	{
		return model.getType();
	}

	public String getType_text()
	{
		return model.getType_text();
	}

	public void setValueType(int valueType)
	{
		model.setValueType(valueType);
	}

	public int getValueType()
	{
		return model.getValueType();
	}

	public String getValueType_text()
	{
		return model.getValueType_text();
	}

	public void setName(String name)
	{
		model.setName(name);
	}

	public String getName()
	{
		return model.getName();
	}

	public void setColumn(String column)
	{
		model.setColumn(column);
	}

	public String getColumn()
	{
		return model.getColumn();
	}

	public void setRelatedProperty(PropertyMod relatedProperty)
	{
		model.setRelatedProperty(relatedProperty);
	}

	public PropertyMod getRelatedProperty()
	{
		return model.getRelatedProperty();
	}

	public boolean isId()
	{
		return getColumn().equals(getBean().getIdProperty().getColumn());
	}

}
