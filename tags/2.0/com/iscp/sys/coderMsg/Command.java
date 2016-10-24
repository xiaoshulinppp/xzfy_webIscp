// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Command.java

package com.iscp.sys.coderMsg;

import java.io.Serializable;
import java.util.LinkedList;

// Referenced classes of package com.iscp.sys.coderMsg:
//			TableModel, RelModel, IdTypeModel

public class Command
	implements Serializable
{

	public static final int GET_TABLE_LIST = 0;
	public static final int GET_COLUMN_LIST = 1;
	public static final int GET_REL_LIST = 2;
	public static final int SAVE_RELS = 3;
	public static final int REMOVE_RELS = 4;
	public static final int WRITE_FILE = 5;
	public static final int GET_EXIST_FILE = 6;
	public static final int GET_MID_TABLE_LIST = 7;
	public int commandType;
	public LinkedList commands;
	public int id;
	public TableModel tableModel;
	public RelModel relList[];
	public TableModel tableList[];
	public IdTypeModel idType;
	public int overWriteFiles;

	public void addCommand(Command command)
	{
		if (commands == null)
			commands = new LinkedList();
		commands.addLast(command);
	}

	public Command remove()
	{
		if (commands == null || commands.isEmpty())
			return null;
		else
			return (Command)commands.removeFirst();
	}

	public boolean isCommandSet()
	{
		return commands != null;
	}

	public Command()
	{
		commandType = 0;
		commands = null;
	}
}
