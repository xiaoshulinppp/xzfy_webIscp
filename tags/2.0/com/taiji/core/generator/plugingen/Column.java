// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Column.java

package com.taiji.core.generator.plugingen;


// Referenced classes of package com.taiji.core.generator.plugingen:
//			Table

public interface Column
{

	public abstract Table getTable();

	public abstract int getSqlType();

	public abstract String getSqlTypeName();

	public abstract String getSqlName();

	public abstract int getSize();

	public abstract int getDecimalDigits();

	public abstract boolean isPk();

	public abstract boolean isFk();

	public abstract boolean isNullable();

	public abstract boolean isUnique();

	public abstract boolean isIndexed();

	public abstract String getDefaultValue();
}
