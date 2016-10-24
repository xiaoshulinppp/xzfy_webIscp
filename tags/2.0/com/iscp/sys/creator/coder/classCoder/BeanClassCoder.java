// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   BeanClassCoder.java

package com.iscp.sys.creator.coder.classCoder;

import com.iscp.sys.creator.model.BeanMod;

// Referenced classes of package com.iscp.sys.creator.coder.classCoder:
//			BeanClassCoderImpl

public class BeanClassCoder
{

	private BeanClassCoderImpl coder;

	public BeanClassCoder()
	{
		coder = new BeanClassCoderImpl();
	}

	public String getJavaBeanExpress(BeanMod bean)
	{
		return coder.getJavaBeanExpress(bean);
	}
}
