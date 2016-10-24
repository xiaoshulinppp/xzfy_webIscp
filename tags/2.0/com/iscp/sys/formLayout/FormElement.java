// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   FormElement.java

package com.iscp.sys.formLayout;


public class FormElement
{

	private String showtype;
	private String css_class;

	public FormElement()
	{
	}

	public String toString()
	{
		StringBuffer sb = new StringBuffer();
		showtype.equals("");
		return sb.toString();
	}

	public void importTemplate(String template, int start, int end)
	{
		showtype = getTemplateProperty(template, "fieldshowtype", start, end);
		css_class = getTemplateProperty(template, "css_class", start, end);
	}

	private String getTemplateProperty(String template, String name, int e_start, int e_end)
	{
		int type1 = template.indexOf((new StringBuilder("[$")).append(name).append("]").toString(), e_start);
		int type2 = template.indexOf((new StringBuilder("[/$")).append(name).append("]").toString(), e_start);
		if (type1 >= 0 && type2 >= 0 && type1 <= e_end)
			return template.substring(type1 + (new StringBuilder("[$")).append(name).append("]").toString().length(), type2);
		else
			return null;
	}
}
