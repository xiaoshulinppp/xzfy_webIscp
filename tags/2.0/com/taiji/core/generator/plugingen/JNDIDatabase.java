// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   JNDIDatabase.java

package com.taiji.core.generator.plugingen;

import com.taiji.core.exception.GenerateException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Hashtable;
import javax.naming.*;
import javax.sql.DataSource;

// Referenced classes of package com.taiji.core.generator.plugingen:
//			Database

public class JNDIDatabase
	implements Database
{
