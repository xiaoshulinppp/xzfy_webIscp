// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   PropertyXMLCoder.java

package com.iscp.sys.creator.coder.hbmCoder;

import com.iscp.sys.creator.model.PropertyMod;
import org.dom4j.Element;

// Referenced classes of package com.iscp.sys.creator.coder.hbmCoder:
//			PropertyXMLCoderImpl

public class PropertyXMLCoder
{

	private PropertyXMLCoderImpl coder;

	public PropertyXMLCoder()
	{
		coder = new PropertyXMLCoderImpl();
	}

	public Element getElementExpress(PropertyMod property, int tab)
	{
		return coder.getElementExpress(property, tab);
	}
}
