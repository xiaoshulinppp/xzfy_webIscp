// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Command.java

package com.iscp.sys.formLayout.msg;

import com.iscp.sys.formLayout.model.TableModel;
import java.io.Serializable;

// Referenced classes of package com.iscp.sys.formLayout.msg:
//			MsgTable

public class Command
	implements Serializable
{

	public static final int GET_TABLE_LIST = 0;
	public static final int GET_FIELD_LIST = 1;
	public static final int GET_FILE_LIST = 2;
	public static final int GET_DIRECTORY_LIST = 3;
	public static final int NEW_DIRECTORY = 4;
	public static final int REMOVE_DIRECTORY = 5;
	public static final int IS_DIRECTORY_EMPTY = 6;
	public static final int SAVE_MAPPINGTABLE = 7;
	public static final int SAVE_FILE = 8;
	public static final int LOAD_FILE = 9;
	public static final int PREVIEW = 10;
	public static final int GET_DBTABLE_LIST = 11;
	public static final int REMOVE_TABLE = 12;
	public static final int ADD_TABLE = 13;
	public static final int RENAME_TABLE = 14;
	public static final int IS_TABLE_EXIST = 15;
	public static final int GET_DICT_LIST = 16;
	public static final int WRITE_FILE = 17;
	public static final int GET_BACKUP_LIST = 18;
	public MsgTable msgTable;
	public int commandType;
	public String basePath;
	public TableModel tableModel;
	public String creator;

	public Command()
	{
	}
}
