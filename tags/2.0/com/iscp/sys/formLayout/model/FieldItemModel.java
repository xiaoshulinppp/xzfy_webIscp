// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   FieldItemModel.java

package com.iscp.sys.formLayout.model;


// Referenced classes of package com.iscp.sys.formLayout.model:
//			ItemModel

public class FieldItemModel
	implements ItemModel
{

	public String table;
	public boolean hidden;
	public String field;
	public String action;
	public String css_class;
	public int css_class_index;
	public String other_property_express;
	public String id;
	public int tabIndex;
	public FieldItemModel tabNext;
	public FieldItemModel tabLast;
	public String sourceTable;
	public String sourceId;
	public String sourceName;
	public String targetRelationType;
	public static final int INT = 0;
	public static final int STRING = 1;
	public static final int DATE = 2;
	public static final int FLOAT = 3;
	public static final String TYPES__[] = {
		"int", "string", "date", "float"
	};
	public int type;
	public static final int SELECT = 0;
	public static final int INPUT = 1;
	public static final int TEXTAREA = 2;
	public static final int INPUTFILE = 3;
	public static final int INPUTWIN = 4;
	public static final int RADIO = 5;
	public static final int CHECKBOX = 6;
	public static final int INVISIBLE = 7;
	public static final String SHOWTYPES__[] = {
		"select", "input", "textarea", "inputfile", "inputwin", "radio", "checkbox", "invisible"
	};
	public int showType;
	public String enu;
	public String length;
	public String default_;
	public boolean isNull;
	public boolean isDict;
	public String dictListId;
	public static final int DICT_TREE = 0;
	public static final int DICT_RADIO = 1;
	public static final String DICTTYPES__[] = {
		"tree", "radio"
	};
	public int dictType;
	public static String SYSTEM_CSS_CLASSES[] = {
		"selectStyleLong", "selectStyleNormal", "inputTextLong", "inputTextNormal", "inputTextNumber", "textarea", "button", "fieldsetNormal", ""
	};
	private static int SYSTEM_CSS_SELECTABLE[][];
	public String dictvalGetType;
	public String dictShowType;
	public static String eventIntr[] = new String[14];
	public static String eventName[] = new String[14];
	private static int counterForEventInit = 0;
	public boolean event[];

	public void setTable(String table)
	{
		this.table = table;
	}

	public String getTable()
	{
		return table;
	}

	public void setField(String field)
	{
		this.field = field;
	}

	public String getField()
	{
		return field;
	}

	public void setAction(String action)
	{
		this.action = action;
	}

	public String getAction()
	{
		return action;
	}

	public void setCss_class(String css_class)
	{
		this.css_class = css_class;
		css_class_index = -1;
		for (int i = 0; i < SYSTEM_CSS_CLASSES.length; i++)
			if (SYSTEM_CSS_CLASSES[i].equals(css_class))
				css_class_index = i;

	}

	public String getCss_class()
	{
		return css_class;
	}

	public FieldItemModel()
	{
		table = "";
		hidden = false;
		field = "";
		action = "";
		css_class_index = -1;
		tabIndex = 1;
		event = new boolean[eventName.length];
	}

	public static void addp(StringBuffer sb, String name, String value)
	{
		if (value != null)
		{
			sb.append((new StringBuilder("[$")).append(name).append("]").toString());
			sb.append(value);
			sb.append((new StringBuilder("[/$")).append(name).append("]").toString());
		}
	}

	public String toString()
	{
		String tempstr = "";
		StringBuffer sb = new StringBuffer();
		sb.append("[$element]");
		addp(sb, "table", table);
		addp(sb, "field", field);
		if (id != null && id.length() > 0)
			addp(sb, "htmlid", id);
		if (!hidden)
		{
			addp(sb, "event", getEventString(this));
			addp(sb, "action", action);
			addp(sb, "css_class", css_class);
			addp(sb, "tab_index", (new StringBuilder(String.valueOf(tabIndex))).toString());
			addp(sb, "sourcetable", sourceTable);
			addp(sb, "sourceid", sourceId);
			addp(sb, "sourcename", sourceName);
			addp(sb, "fieldtype", getType());
			addp(sb, "fieldshowtype", getShowType());
			if (sourceTable != null)
				tempstr = "relation";
			else
			if (isDict)
				tempstr = "dict";
			else
				tempstr = "static";
			addp(sb, "sourcetype", tempstr);
			addp(sb, "targetrelationtype", targetRelationType);
			addp(sb, "staticvalue", enu);
			addp(sb, "length", length);
			addp(sb, "default", default_);
			addp(sb, "isnull", (new StringBuilder(String.valueOf(isNull))).toString());
			addp(sb, "property_exp", other_property_express);
			if (isDict)
			{
				addp(sb, "dictlistid", dictListId);
				addp(sb, "dicttype", getDictType());
				addp(sb, "dictshowtype", dictShowType);
				addp(sb, "dictvalgettype", dictvalGetType);
			}
		}
		sb.append("[/$element]");
		if (!isNull)
			sb.append("<font color=red>**</font>");
		return sb.toString();
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getText()
	{
		if (sourceTable != null)
			return sourceTable;
		else
			return field;
	}

	public void setTabNext(FieldItemModel tabNext)
	{
		for (FieldItemModel itemForCheck = this; itemForCheck != null; itemForCheck = itemForCheck.tabLast)
		{
			if (itemForCheck != tabNext)
				continue;
			if (tabLast != null)
				tabLast.tabNext = null;
			tabLast = null;
			break;
		}

		if (this.tabNext != null)
			this.tabNext.tabLast = null;
		this.tabNext = tabNext;
		if (tabNext.tabLast != null)
			tabNext.tabLast.tabNext = null;
		tabNext.tabLast = this;
	}

	public String getType()
	{
		return TYPES__[type];
	}

	public void setType(String type)
	{
		for (int i = 0; i < TYPES__.length; i++)
			if (TYPES__[i].equals(type))
			{
				this.type = i;
				return;
			}

	}

	public String getShowType()
	{
		return SHOWTYPES__[showType];
	}

	public void setShowType(String showType)
	{
		for (int i = 0; i < SHOWTYPES__.length; i++)
			if (SHOWTYPES__[i].equals(showType))
			{
				this.showType = i;
				return;
			}

	}

	public void setIsNull(String isNull)
	{
		this.isNull = isNull == null || isNull.equals("true") || isNull.equals("1");
	}

	public String getIsNull()
	{
		return (new StringBuilder(String.valueOf(isNull))).toString();
	}

	public void setIsDict(String isDict)
	{
		this.isDict = isDict != null && (isDict.equals("true") || isDict.equals("1"));
	}

	public String getDictType()
	{
		return DICTTYPES__[dictType];
	}

	public void setDictType(String dictType)
	{
		for (int i = 0; i < DICTTYPES__.length; i++)
			if (DICTTYPES__[i].equals(dictType))
			{
				this.dictType = i;
				return;
			}

	}

	public static int[] getSelectableCss(int type)
	{
		if (SYSTEM_CSS_SELECTABLE == null)
		{
			SYSTEM_CSS_SELECTABLE = new int[SHOWTYPES__.length][];
			int i = 0;
			SYSTEM_CSS_SELECTABLE[i] = (new int[] {
				0, 1
			});
			i = 1;
			SYSTEM_CSS_SELECTABLE[i] = (new int[] {
				2, 3, 4
			});
			i = 2;
			SYSTEM_CSS_SELECTABLE[i] = (new int[] {
				5
			});
			i = 3;
			SYSTEM_CSS_SELECTABLE[i] = (new int[] {
				2, 3, 4
			});
			i = 4;
			SYSTEM_CSS_SELECTABLE[i] = (new int[] {
				6
			});
			i = 5;
			SYSTEM_CSS_SELECTABLE[i] = (new int[] {
				7
			});
			i = 6;
			SYSTEM_CSS_SELECTABLE[i] = (new int[] {
				7
			});
			i = 7;
			SYSTEM_CSS_SELECTABLE[i] = (new int[] {
				8
			});
		}
		return SYSTEM_CSS_SELECTABLE[type];
	}

	private static void addEventForInit(String _eventName, String _eventIntr)
	{
		eventName[counterForEventInit] = _eventName;
		eventIntr[counterForEventInit] = _eventIntr;
		counterForEventInit++;
	}

	public static String getFunction(FieldItemModel fim, String event)
	{
		return (new StringBuilder(String.valueOf(fim.getTable()))).append("_").append(fim.getField()).append("_").append(event).append("(this)").toString();
	}

	public static String getEventString(FieldItemModel fim, String event)
	{
		return (new StringBuilder(String.valueOf(event))).append("=\"").append(getFunction(fim, event)).append("\"").toString();
	}

	public static String getEventString(FieldItemModel fim)
	{
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < eventName.length; i++)
			if (fim.event[i])
			{
				sb.append(" ");
				sb.append(getEventString(fim, eventName[i]));
			}

		sb.append(" ");
		String result = sb.toString();
		if (result.length() == 0)
			result = null;
		return result;
	}

	static 
	{
		counterForEventInit = 0;
		addEventForInit("onblur", "??????");
		addEventForInit("onchange", "???");
		addEventForInit("onclick", "?????");
		addEventForInit("ondblclick", "??????");
		addEventForInit("onfocus", "??\375???");
		addEventForInit("onkeydown", "???????");
		addEventForInit("onkeypress", "???????????");
		addEventForInit("onkeyup", "???????");
		addEventForInit("onmousedown", "?????");
		addEventForInit("onmousemove", "??????");
		addEventForInit("onmouseout", "??????");
		addEventForInit("onmouseover", "???????");
		addEventForInit("onmouseup", "??????");
		addEventForInit("onselect", "???");
	}
}
