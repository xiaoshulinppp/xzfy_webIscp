// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   BeanXMLCoder.java

package com.iscp.sys.creator.coder.hbmCoder;

import com.iscp.sys.creator.model.BeanMod;
import org.dom4j.Element;

// Referenced classes of package com.iscp.sys.creator.coder.hbmCoder:
//			BeanXMLCoderImpl

public class BeanXMLCoder
{

	private BeanXMLCoderImpl coder;

	public BeanXMLCoder()
	{
		coder = new BeanXMLCoderImpl();
	}

	public Element getElementExpress(BeanMod bean)
	{
		return coder.getElementExpress(bean);
	}
}
