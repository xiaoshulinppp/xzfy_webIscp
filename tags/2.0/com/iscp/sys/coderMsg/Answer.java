// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Answer.java

package com.iscp.sys.coderMsg;

import java.io.Serializable;
import java.util.LinkedList;

// Referenced classes of package com.iscp.sys.coderMsg:
//			TableModel, ColumnModel, RelModel

public class Answer
	implements Serializable
{

	public Exception error;
	private LinkedList answers;
	public TableModel tableList[];
	public ColumnModel columnList[];
	public RelModel relList[];
	public static final int JAVA_FILE = 1;
	public static final int HBM_FILE = 2;
	public static final int DAO_FILE = 4;
	public static final int SERVER_FILE = 8;
	public int writtenfile;

	public Answer()
	{
		answers = new LinkedList();
	}

	public void addAnswer(Answer answer)
	{
		answers.addLast(answer);
	}

	public Answer remove()
	{
		if (answers.isEmpty())
			return null;
		else
			return (Answer)answers.removeFirst();
	}
}
