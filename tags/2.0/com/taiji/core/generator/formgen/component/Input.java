// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Input.java

package com.taiji.core.generator.formgen.component;


// Referenced classes of package com.taiji.core.generator.formgen.component:
//			Element

public class Input
{

	private Element _element;

	public Input(Element element)
	{
		_element = element;
	}

	public String getTemplateElement()
	{
		String result = "";
		String sourcetype = _element.getSourceType();
		if (!sourcetype.equals("dict"))
		{
			result = "<@ww.textfield";
			result = (new StringBuilder(String.valueOf(result))).append(" name=\"'").append(_element.getTableName()).append(".").append(_element.getFieldName()).append("'\" id=\"").append(_element.getFieldName()).append("\"").toString();
			result = (new StringBuilder(String.valueOf(result))).append(" cssClass=\"'inputTextNormal'\" tabindex=\"'").append(_element.getTabIndex()).append("'\" ").toString();
			result = (new StringBuilder(String.valueOf(result))).append(" ").append(_element.getEvent()).append(" ").append(_element.getPropertyExp()).toString();
			result = (new StringBuilder(String.valueOf(result))).append(" disabled =\"'${showState}'\" />").toString();
			if (_element.getFieldType().equalsIgnoreCase("date"))
			{
				result = (new StringBuilder(String.valueOf(result))).append("<input type=\"button\" value=\">>\" class=\"button\" onclick=\"GetSelectDate('").append(_element.getTableName()).append(".").append(_element.getFieldName()).append("')\" ").toString();
				result = (new StringBuilder(String.valueOf(result))).append("<#if opName == \"view\"> disabled </#if> >").toString();
			}
		} else
		{
			result = "<@ww.textfield";
			result = (new StringBuilder(String.valueOf(result))).append(" name=\"'").append(_element.getTableName()).append(".").append(_element.getFieldName()).append("Name'\"").toString();
			result = (new StringBuilder(String.valueOf(result))).append(" cssClass=\"'inputTextNormal'\" tabindex=\"'").append(_element.getTabIndex()).append("'\"").toString();
			result = (new StringBuilder(String.valueOf(result))).append(" ").append(_element.getEvent()).append(" ").append(_element.getPropertyExp()).toString();
			result = (new StringBuilder(String.valueOf(result))).append(" disabled =\"'${showState}'\" />").toString();
			result = (new StringBuilder(String.valueOf(result))).append("<input type='hidden' name='").append(_element.getTableName()).append(".").append(_element.getFieldName()).append("'>").toString();
			result = (new StringBuilder(String.valueOf(result))).append("&nbsp;<input type=\"button\"  value=\"Ñ¡Ôñ\" class=\"button\" ").toString();
			result = (new StringBuilder(String.valueOf(result))).append("onclick=\"window.open('../system/showDict.action?abbr=").append(_element.getDictListID()).append("&funcCode=${funcCode}&showElementId=").append(_element.getTableName()).append(".").append(_element.getFieldName()).append("Name&inputElementId=").append(_element.getTableName()).append(".").append(_element.getFieldName()).toString();
			if (_element.getDictShowType().equals("pickselect1"))
				result = (new StringBuilder(String.valueOf(result))).append("&multiSelect=true')\"").toString();
			else
				result = (new StringBuilder(String.valueOf(result))).append("&multiSelect=false')\"").toString();
		}
		return result;
	}

	public String toString()
	{
		String result = "";
		String sourcetype = _element.getSourceType();
		result = (new StringBuilder("<input type ='text'")).append(_element.getCommonExpress()).append(_element.getTabIndex()).append(" value=''>").toString();
		if (sourcetype.equals("dict"))
			result = (new StringBuilder(String.valueOf(result))).append("&nbsp;<input type=\"button\" value=\"²âÊÔ\" class=\"button\"").toString();
		else
		if (_element.getFieldType().equalsIgnoreCase("date"))
			result = (new StringBuilder(String.valueOf(result))).append("<input type=\"button\" value=\">>\" class=\"sbutton\" onclick=\"return showCalen").append("dar('").append(_element.getFieldName()).append("', 'y-mm-dd')\">").toString();
		return result;
	}
}
