// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ListItemModel.java

package com.iscp.sys.formLayout.model;

import com.iscp.sys.formLayout.msg.MsgField;
import com.iscp.sys.formLayout.msg.MsgTable;

// Referenced classes of package com.iscp.sys.formLayout.model:
//			ItemModel

public class ListItemModel
	implements ItemModel
{

	public int pageSize;
	public MsgTable table;
	public MsgField fields[];
	public MsgField fid;
	public String primaryTable;
	public int widths[];
	public String script[];
	public boolean perm;
	public String type;
	public String id;

	public ListItemModel()
	{
	}

	public String getText()
	{
		return (new StringBuilder("[List]")).append(table.getName()).toString();
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String toString()
	{
		if (fields == null || widths == null)
			return "";
		StringBuffer sb = new StringBuffer();
		sb.append("[$element]");
		sb.append("[$fieldshowtype]list[/$fieldshowtype]");
		sb.append("[$table]");
		sb.append(table.getName());
		sb.append("[/$table]");
		sb.append("[$primaryTable]");
		sb.append(primaryTable);
		sb.append("[/$primaryTable]");
		sb.append("[$perm]");
		sb.append(perm);
		sb.append("[/$perm]");
		sb.append("[$type]");
		sb.append(type);
		sb.append("[/$type]");
		sb.append("[$id]");
		if (fid == null)
			return "";
		sb.append(fid.name);
		sb.append("[/$id]");
		for (int i = 0; i < fields.length; i++)
		{
			sb.append("[$field]");
			sb.append("[$name]");
			sb.append(fields[i].name);
			sb.append("[/$name]");
			sb.append("[$byname]");
			sb.append(fields[i].byName);
			sb.append("[/$byname]");
			addp(sb, "listfieldshowtype", fields[i].showType);
			addp(sb, "dictlistid", fields[i].dictListId);
			addp(sb, "dicttype", fields[i].getDictType());
			addp(sb, "dictvalgettype", fields[i].dictvalGetType);
			addp(sb, "isdict", fields[i].isDict);
			addp(sb, "script", script[i]);
			sb.append("[$width]");
			sb.append(widths[i]);
			sb.append("[/$width]");
			sb.append("[/$field]");
		}

		sb.append("[/$element]");
		return sb.toString();
	}

	public static void addp(StringBuffer sb, String name, String value)
	{
		if (value != null)
		{
			sb.append((new StringBuilder("[$")).append(name).append("]").toString());
			sb.append(value);
			sb.append((new StringBuilder("[/$")).append(name).append("]").toString());
		}
	}
}
