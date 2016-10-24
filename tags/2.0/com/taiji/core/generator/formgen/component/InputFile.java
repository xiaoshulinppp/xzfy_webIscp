// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   InputFile.java

package com.taiji.core.generator.formgen.component;


// Referenced classes of package com.taiji.core.generator.formgen.component:
//			Element

public class InputFile
{

	private Element _element;

	public InputFile(Element element)
	{
		_element = element;
	}

	public String getTemplateElement()
	{
		String result = "<@ww.file";
		result = (new StringBuilder(" cssClass=\"'")).append(_element.getCssName()).append("'\" name=\"'").append(_element.getTableName()).append(".").append(_element.getFieldName()).append("'\" >").toString();
		result = (new StringBuilder(String.valueOf(result))).append(" <INPUT type=\"button\"  VALUE=\"上传\" class=\"button\" onclick=\"window.open('../upload/uploadnew.jsp?name=").append(_element.getTableName()).append("','Upload','width=550,height=280,left=90,top=95,toolbar=no,resizable=yes,menubar=no,status=no,scrollbars=yes')\">").toString();
		return result;
	}

	public String toString()
	{
		StringBuffer sb = new StringBuffer();
		sb.append(" &nbsp;<INPUT");
		sb.append(_element.getCommonExpress());
		sb.append((new StringBuilder(">&nbsp;<INPUT type=\"button\"  VALUE=\"上 传\" class=\"button\" onclick=\"window.open('../upload/uploadnew.jsp?name=")).append(_element.getTableName()).append("','Upload','width=550,height=280,left=90,top=95,toolbar=no,resizable=yes,menubar").append("=no,status=no,scrollbars=yes')\">").toString());
		return sb.toString();
	}
}
