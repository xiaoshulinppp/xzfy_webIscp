// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Database.java

package com.taiji.core.generator.plugingen;

import com.taiji.core.exception.GenerateException;
import java.sql.Connection;

public interface Database
{

	public abstract Connection getConnection()
		throws GenerateException;
}
