// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Hidden.java

package com.taiji.core.generator.formgen.component;


// Referenced classes of package com.taiji.core.generator.formgen.component:
//			Element

public class Hidden
{

	private Element _element;

	public Hidden(Element element)
	{
		_element = element;
	}

	public String getTemplateElement()
	{
		String result = "";
		result = (new StringBuilder("<input type='hidden' name=")).append(_element.getTableName()).append(".").append(_element.getFieldName()).toString();
		result = (new StringBuilder(String.valueOf(result))).append(" value=${").append(_element.getTableName()).append(".").append(_element.getFieldName()).append("}").append(">").toString();
		return result;
	}

	public String toString()
	{
		String result = "";
		result = (new StringBuilder("<input type=hidden")).append(_element.getCommonExpress()).append(" value=''>").toString();
		return result;
	}
}
