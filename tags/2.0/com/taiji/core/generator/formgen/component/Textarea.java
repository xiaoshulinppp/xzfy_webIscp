// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Textarea.java

package com.taiji.core.generator.formgen.component;


// Referenced classes of package com.taiji.core.generator.formgen.component:
//			Element

public class Textarea
{

	private static String ROWSIZE = "5";
	private static String COLSIZE = "20";
	private Element _element;

	public Textarea(Element element)
	{
		_element = element;
	}

	public String getTemplateElement()
	{
		String result = "";
		result = "<@ww.textarea";
		if (!_element.getHtmlID().equals(""))
			result = (new StringBuilder(String.valueOf(result))).append(" id=\"'").append(_element.getHtmlID()).append("'\"").toString();
		result = (new StringBuilder(String.valueOf(result))).append(" name=\"'").append(_element.getTableName()).append(".").append(_element.getFieldName()).append("'\"").toString();
		result = (new StringBuilder(String.valueOf(result))).append(" cssClass=\"'").append(_element.getCssName()).append("'\" tabindex=\"'").append(_element.getTabIndex()).append("'\"").toString();
		result = (new StringBuilder(String.valueOf(result))).append(" rows=\"'").append(ROWSIZE).append("'\" cols=\"'").append(COLSIZE).append("'\"").toString();
		result = (new StringBuilder(String.valueOf(result))).append(" ").append(_element.getEvent()).append(" ").append(_element.getPropertyExp()).toString();
		result = (new StringBuilder(String.valueOf(result))).append(" disabled =\"'${showState}'\" />").toString();
		return result;
	}

	public String toString()
	{
		StringBuffer sb = new StringBuffer();
		sb.append((new StringBuilder("<textarea ")).append(_element.getCommonExpress()).append("></textarea>").toString());
		return sb.toString();
	}

}
