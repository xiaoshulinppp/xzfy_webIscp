// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ItemModel.java

package com.iscp.sys.formLayout.model;

import java.io.Serializable;

public interface ItemModel
	extends Serializable
{

	public abstract String getText();

	public abstract String getId();

	public abstract void setId(String s);
}
