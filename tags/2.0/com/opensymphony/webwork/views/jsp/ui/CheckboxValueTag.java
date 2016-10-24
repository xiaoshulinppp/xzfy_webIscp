// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CheckboxValueTag.java

package com.opensymphony.webwork.views.jsp.ui;

import com.opensymphony.webwork.util.ContainUtil;
import com.opensymphony.webwork.util.MakeIterator;
import com.opensymphony.xwork.util.OgnlValueStack;
import java.util.Collection;

// Referenced classes of package com.opensymphony.webwork.views.jsp.ui:
//			AbstractUITag

public class CheckboxValueTag extends AbstractUITag
{

	public static final String TEMPLATE = "checkboxvalue";
	protected String fieldValueAttr;
	protected String listAttr;

	public CheckboxValueTag()
	{
	}

	public void setFieldValue(String fieldValue)
	{
		fieldValueAttr = fieldValue;
	}

	public void setList(String list)
	{
		listAttr = list;
	}

	protected String getDefaultTemplate()
	{
		return "checkboxvalue";
	}

	protected Class getValueClassType()
	{
		return java/lang/Boolean;
	}

	public boolean contains(Object obj, Object obj1)
	{
		return ContainUtil.contains(obj, obj1);
	}

	protected void evaluateExtraParams(OgnlValueStack ognlvaluestack)
	{
		if (fieldValueAttr != null)
			addParameter("fieldValue", findString(fieldValueAttr));
		Object obj = findValue(listAttr);
		if (listAttr != null)
			if (obj instanceof Collection)
			{
				addParameter("list", obj);
				addParameter("listSize", new Integer(((Collection)obj).size()));
			} else
			{
				addParameter("list", MakeIterator.convert(obj));
			}
	}
}
