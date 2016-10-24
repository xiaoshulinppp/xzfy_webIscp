// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Select.java

package com.taiji.core.generator.formgen.component;

import com.taiji.core.generator.formgen.ParseTemplate;

// Referenced classes of package com.taiji.core.generator.formgen.component:
//			Element

public class Select
{

	private Element _element;

	public Select(Element element)
	{
		_element = element;
	}

	public String getTemplateElement()
	{
		String result = "<@ww.select";
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
		String show[] = ParseTemplate.getShow(null);
		StringBuffer sb = new StringBuffer();
		sb.append((new StringBuilder("<select  class='")).append(_element.getCssName()).append("' name=").append(_element.getFieldName()).append(" tabindex='").append(_element.getTabIndex()).append("'").toString());
		if (_element.getHtmlID() != null && _element.getHtmlID().length() > 0)
			sb.append((new StringBuilder(" id=")).append(_element.getHtmlID()).toString());
		if (_element.getEvent() != null && _element.getEvent().length() > 0)
			sb.append(_element.getEvent());
		sb.append(">");
		for (int i = 0; i < show.length; i++)
			sb.append((new StringBuilder(" <option value=")).append(i).append(" selected>").append(show[i]).append("</option>").toString());

		sb.append("</select>");
		return sb.toString();
	}
}
