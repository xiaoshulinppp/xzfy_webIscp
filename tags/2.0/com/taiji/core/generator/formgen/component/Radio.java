// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Radio.java

package com.taiji.core.generator.formgen.component;

import java.util.StringTokenizer;

// Referenced classes of package com.taiji.core.generator.formgen.component:
//			Element

public class Radio
{

	private Element _element;

	public Radio(Element element)
	{
		_element = element;
	}

	public String getTemplateElement()
	{
		String result = "<@ww.radio";
		if (!_element.getHtmlID().equals(""))
			result = (new StringBuilder(String.valueOf(result))).append(" id=\"'").append(_element.getHtmlID()).append("'\"").toString();
		result = (new StringBuilder(String.valueOf(result))).append(" cssClass=\"'").append(_element.getCssName()).append("'\" tabindex=\"'").append(_element.getTabIndex()).append("'\"").toString();
		result = (new StringBuilder(String.valueOf(result))).append(" ").append(_element.getEvent()).append(" ").append(_element.getPropertyExp()).toString();
		result = (new StringBuilder(String.valueOf(result))).append(" disabled =\"'${showState}'\" ").toString();
		if (_element.getSourceType().equalsIgnoreCase("relation"))
		{
			result = (new StringBuilder(String.valueOf(result))).append(" name=\"'select").append(_element.getRelationName()).append("'\"").toString();
			result = (new StringBuilder(String.valueOf(result))).append(" list=\"getAll").append(_element.getRelationName()).append("()\"").toString();
			result = (new StringBuilder(String.valueOf(result))).append(" value=\"getAllCustom").append(_element.getRelationName()).append("()\"").toString();
		} else
		if (_element.getSourceType().equalsIgnoreCase("dict"))
		{
			result = (new StringBuilder(String.valueOf(result))).append(" name=\"'").append(_element.getTableName()).append(".").append(_element.getFieldName()).append("'\"").toString();
			result = (new StringBuilder(String.valueOf(result))).append(" list=\"getDictMap('").append(_element.getDictListID()).append("')\"").toString();
		} else
		{
			result = (new StringBuilder(String.valueOf(result))).append(" name=\"'").append(_element.getTableName()).append(".").append(_element.getFieldName()).append("'\"").toString();
		}
		result = (new StringBuilder(String.valueOf(result))).append("/>").toString();
		return result;
	}

	public String toString()
	{
		StringBuffer sb = new StringBuffer();
		String staticValue = "Р§зг0:0|Р§зг1:1|Р§зг2:2|";
		String namevalue;
		int index;
		for (StringTokenizer st = new StringTokenizer(staticValue, "|"); st.hasMoreElements(); sb.append((new StringBuilder("<input type='radio'")).append(_element.getCommonExpress()).append(" value = ").append(namevalue.substring(index + 1)).append(">").append(namevalue.substring(0, index)).append("</input>").toString()))
		{
			namevalue = st.nextToken();
			index = namevalue.indexOf(":");
		}

		return sb.toString();
	}
}
