// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   RelationModelInterface.java

package com.iscp.sys.creator.relationManager;


public interface RelationModelInterface
{

	public static final int ONE_TO_ONE = 0;
	public static final int ONE_TO_MANY = 1;
	public static final int MANY_TO_ONE = 2;
	public static final int MANY_TO_MANY = 3;

	public abstract void setId(int i);

	public abstract int getId();

	public abstract void setTable_host(String s);

	public abstract String getTable_host();

	public abstract void setTable_related(String s);

	public abstract String getTable_related();

	public abstract void setColumn_host(String s);

	public abstract String getColumn_host();

	public abstract void setColumn_related(String s);

	public abstract String getColumn_related();

	public abstract void setType(int i);

	public abstract int getType();

	public abstract void setMid_table(String s);

	public abstract String getMid_table();

	public abstract void setMid_table_host(String s);

	public abstract String getMid_table_host();

	public abstract void setMid_table_related(String s);

	public abstract String getMid_table_related();

	public abstract void setName_related(String s);

	public abstract String getName_related();

	public abstract void setName_host(String s);

	public abstract String getName_host();
}
