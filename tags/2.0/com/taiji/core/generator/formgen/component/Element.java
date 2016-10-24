// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Element.java

package com.taiji.core.generator.formgen.component;

import com.taiji.core.generator.plugingen.DbNameConverter;
import com.taiji.core.generator.plugingen.Util;

public class Element
{

	private static String TableTokenBegin = "[$table]";
	private static String TableTokenEnd = "[/$table]";
	private static String FieldTokenBegin = "[$field]";
	private static String FieldTokenEnd = "[/$field]";
	private static String ActionTokenBegin = "[$action]";
	private static String ActionTokenEnd = "[/$action]";
	private static String CSSTokenBegin = "[$css_class]";
	private static String CSSTokenEnd = "[/$css_class]";
	private static String TabTokenBegin = "[$tab_index]";
	private static String TabTokenEnd = "[/$tab_index]";
	private static String SourceTableTokenBegin = "[$sourcetable]";
	private static String SourceTableTokenEnd = "[/$sourcetable]";
	private static String SourceIDTokenBegin = "[$sourceid]";
	private static String SourceIDTokenEnd = "[/$sourceid]";
	private static String SourceNameTokenBegin = "[$sourcename]";
	private static String SourceNameTokenEnd = "[/$sourcename]";
	private static String FieldTypeTokenBegin = "[$fieldtype]";
	private static String FieldTypeTokenEnd = "[/$fieldtype]";
	private static String FieldShowTypeTokenBegin = "[$fieldshowtype]";
	private static String FieldShowTypeTokenEnd = "[/$fieldshowtype]";
	private static String SourceTypeTokenBegin = "[$sourcetype]";
	private static String SourceTypeTokenEnd = "[/$sourcetype]";
	private static String StaticValueTokenBegin = "[$staticvalue]";
	private static String StaticValueTokenEnd = "[/$staticvalue]";
	private static String FieldLengthTokenBegin = "[$length]";
	private static String FieldLengthTokenEnd = "[/$length]";
	private static String DefaultValueTokenBegin = "[$default]";
	private static String DefaultValueTokenEnd = "[/$default]";
	private static String IsNullTokenBegin = "[$isnull]";
	private static String IsNullTokenEnd = "[/$isnull]";
	private static String DictListIDTokenBegin = "[$dictlistid]";
	private static String DictListIDTokenEnd = "[/$dictlistid]";
	private static String DictTypeTokenBegin = "[$dicttype]";
	private static String DictTypeTokenEnd = "[/$dicttype]";
	private static String DictShowTypeTokenBegin = "[$dictshowtype]";
	private static String DictShowTypeTokenEnd = "[/$dictshowtype]";
	private static String DictValGetTypeTokenBegin = "[$dictvalgettype]";
	private static String DictValGetTypeTokenEnd = "[/$dictvalgettype]";
	private static String TargetRelationTypeBegin = "[$targetrelationtype]";
	private static String TargetRelationTypeEnd = "[/$targetrelationtype]";
	private static String EventBegin = "[$event]";
	private static String EventEnd = "[/$event]";
	private static String HtmlIDBegin = "[$htmlid]";
	private static String HtmlIDEnd = "[/$htmlid]";
	private static String PropertyExpBegin = "[$property_exp]";
	private static String PropertyExpEnd = "[/$property_exp]";
	private static String DictAbbrBegin = "[$dictabbr]";
	private static String DictAbbrEnd = "[/$dictabbr]";
	private String _tableName;
	private String _fieldName;
	private String _actionCode;
	private String _cssName;
	private String _tabIndex;
	private String _sourceTable;
	private String _sourceName;
	private String _sourceID;
	private String _fieldType;
	private String _fieldShowType;
	private String _sourceType;
	private String _staticValue;
	private String _fieldLength;
	private String _fieldDefaultValue;
	private String _isNull;
	private String _dictlistID;
	private String _dictType;
	private String _dictShowType;
	private String _dictValueGetType;
	private String _targetRelationType;
	private String _relationName;
	private String _event;
	private String _htmlID;
	private String _propertyExp;
	private String _dictAbbr;

	public Element()
	{
	}

	public Element(String inputString)
	{
		init(inputString);
	}

	public void setSourceString(String inputString)
	{
		init(inputString);
	}

	public void init(String inputString)
	{
		_tableName = getTableVariableName(getTableName(inputString));
		_fieldName = getFieldVariableName(getFieldName(inputString));
		_fieldType = getFieldTypeName(inputString);
		_fieldShowType = getFieldShowTypeName(inputString);
		_sourceType = getSourceType(inputString);
		_sourceTable = getTableVariableName(getSourceTable(inputString));
		_sourceID = getFieldVariableName(getSourceID(inputString));
		_sourceName = getFieldVariableName(getSourceName(inputString));
		_fieldLength = getFieldLength(inputString);
		_staticValue = getStaticValue(inputString);
		_fieldDefaultValue = getDefaultValue(inputString);
		_isNull = getIsNull(inputString);
		_dictType = getDictType(inputString);
		_dictlistID = getDictListID(inputString);
		_dictShowType = getDictShowType(inputString);
		_dictValueGetType = getDictValGetType(inputString);
		_targetRelationType = getTargetRelationType(inputString);
		_actionCode = getActionCode(inputString);
		_cssName = getCssName(inputString);
		_tabIndex = getTabIndex(inputString);
		_event = getEvent(inputString);
		_htmlID = getHtmlID(inputString);
		_propertyExp = getPropertyExp(inputString);
		_dictAbbr = getDictAbbr(inputString);
		if (_targetRelationType != null && !_targetRelationType.equals(""))
			_relationName = getRelation();
	}

	public String getTableName()
	{
		return _tableName;
	}

	public String getFieldName()
	{
		return _fieldName;
	}

	public String getTabIndex()
	{
		return _tabIndex;
	}

	public String getActionCode()
	{
		return _actionCode;
	}

	public String getCssName()
	{
		return _cssName;
	}

	public String getFieldType()
	{
		return _fieldType;
	}

	public String getFieldShowType()
	{
		return _fieldShowType;
	}

	public String getSourceType()
	{
		return _sourceType;
	}

	public String getSourceTable()
	{
		return _sourceTable;
	}

	public String getSourceID()
	{
		return _sourceID;
	}

	public String getSourceName()
	{
		return _sourceName;
	}

	public String getFieldLength()
	{
		return _fieldLength;
	}

	public String getStaticValue()
	{
		return _staticValue;
	}

	public String getDefaultValue()
	{
		return _fieldDefaultValue;
	}

	public String getIsNull()
	{
		return _isNull;
	}

	public String getDictType()
	{
		return _dictType;
	}

	public String getDictListID()
	{
		return _dictlistID;
	}

	public String getDictShowType()
	{
		return _dictShowType;
	}

	public String getDictValueGetType()
	{
		return _dictValueGetType;
	}

	public String getTargetRelationType()
	{
		return _targetRelationType;
	}

	public String getRelationName()
	{
		return _relationName;
	}

	public String getEvent()
	{
		return _event;
	}

	public String getHtmlID()
	{
		return _htmlID;
	}

	public String getPropertyExp()
	{
		return _propertyExp;
	}

	public String getDictAbbr()
	{
		return _dictAbbr;
	}

	private String getTableName(String inputString)
	{
		return getParseValue(inputString, TableTokenBegin, TableTokenEnd);
	}

	private String getFieldName(String inputString)
	{
		return getParseValue(inputString, FieldTokenBegin, FieldTokenEnd);
	}

	private String getCssName(String inputString)
	{
		return getParseValue(inputString, CSSTokenBegin, CSSTokenEnd);
	}

	private String getActionCode(String inputString)
	{
		return getParseValue(inputString, ActionTokenBegin, ActionTokenEnd);
	}

	private String getTabIndex(String inputString)
	{
		return getParseValue(inputString, TabTokenBegin, TabTokenEnd);
	}

	private String getFieldTypeName(String inputString)
	{
		return getParseValue(inputString, FieldTypeTokenBegin, FieldTypeTokenEnd);
	}

	private String getFieldShowTypeName(String inputString)
	{
		return getParseValue(inputString, FieldShowTypeTokenBegin, FieldShowTypeTokenEnd);
	}

	private String getSourceType(String inputString)
	{
		return getParseValue(inputString, SourceTypeTokenBegin, SourceTypeTokenEnd);
	}

	private String getSourceTable(String inputString)
	{
		return getParseValue(inputString, SourceTableTokenBegin, SourceTableTokenEnd);
	}

	private String getSourceID(String inputString)
	{
		return getParseValue(inputString, SourceIDTokenBegin, SourceIDTokenEnd);
	}

	private String getSourceName(String inputString)
	{
		return getParseValue(inputString, SourceNameTokenBegin, SourceNameTokenEnd);
	}

	private String getFieldLength(String inputString)
	{
		return getParseValue(inputString, FieldLengthTokenBegin, FieldLengthTokenEnd);
	}

	private String getStaticValue(String inputString)
	{
		return getParseValue(inputString, StaticValueTokenBegin, StaticValueTokenEnd);
	}

	private String getDefaultValue(String inputString)
	{
		return getParseValue(inputString, DefaultValueTokenBegin, DefaultValueTokenEnd);
	}

	private String getIsNull(String inputString)
	{
		return getParseValue(inputString, IsNullTokenBegin, IsNullTokenEnd);
	}

	private String getDictType(String inputString)
	{
		return getParseValue(inputString, DictTypeTokenBegin, DictTypeTokenEnd);
	}

	private String getDictListID(String inputString)
	{
		return getParseValue(inputString, DictListIDTokenBegin, DictListIDTokenEnd);
	}

	private String getDictShowType(String inputString)
	{
		return getParseValue(inputString, DictShowTypeTokenBegin, DictShowTypeTokenEnd);
	}

	private String getDictValGetType(String inputString)
	{
		return getParseValue(inputString, DictValGetTypeTokenBegin, DictValGetTypeTokenEnd);
	}

	private String getTargetRelationType(String inputString)
	{
		return getParseValue(inputString, TargetRelationTypeBegin, TargetRelationTypeEnd);
	}

	private String getEvent(String inputString)
	{
		return getParseValue(inputString, EventBegin, EventEnd);
	}

	private String getHtmlID(String inputString)
	{
		return getParseValue(inputString, HtmlIDBegin, HtmlIDEnd);
	}

	private String getPropertyExp(String inputString)
	{
		return getParseValue(inputString, PropertyExpBegin, PropertyExpEnd);
	}

	private void appendProperty(StringBuffer sb, String name, String value)
	{
		if (value != null && value.length() > 0)
			sb.append((new StringBuilder(" ")).append(name).append("=\"").append(value).append("\"").toString());
	}

	public String getCommonExpress()
	{
		StringBuffer sb = new StringBuffer();
		appendProperty(sb, "id", getHtmlID());
		appendProperty(sb, "name", (new StringBuilder(String.valueOf(getTableName()))).append(".").append(getFieldName()).append("mc").toString());
		appendProperty(sb, "class", getCssName());
		appendProperty(sb, "tabindex", getTabIndex());
		if (getEvent() != null)
			sb.append((new StringBuilder(" ")).append(getEvent()).toString());
		if (getPropertyExp() != null)
			sb.append((new StringBuilder(" ")).append(getPropertyExp()).toString());
		return sb.toString();
	}

	private String getDictAbbr(String inputString)
	{
		return getParseValue(inputString, DictAbbrBegin, DictAbbrEnd);
	}

	private String getParseValue(String inputString, String startToken, String endToken)
	{
		int start = inputString.lastIndexOf(startToken) + startToken.length();
		int end = inputString.lastIndexOf(endToken);
		if (start > 0 && end > 0)
			return inputString.substring(start, end);
		else
			return "";
	}

	private String getTableVariableName()
	{
		return Util.decapitalise(DbNameConverter.getInstance().tableNameToVariableName(_tableName));
	}

	private String getFieldVariableName()
	{
		return Util.decapitalise(DbNameConverter.getInstance().columnNameToVariableName(_fieldName));
	}

	private String getTableVariableName(String tableName)
	{
		return Util.decapitalise(DbNameConverter.getInstance().tableNameToVariableName1(tableName));
	}

	private String getFieldVariableName(String columnName)
	{
		return Util.decapitalise(DbNameConverter.getInstance().columnNameToVariableName1(columnName));
	}

	private String getRelation()
	{
		if (_targetRelationType.equalsIgnoreCase("many"))
			return Util.capitalise(Util.pluralise(_sourceTable));
		else
			return Util.capitalise(Util.signularise(_sourceTable));
	}

}
