// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MsgManager.java

package com.iscp.sys.coderMsg;

import com.iscp.sys.coderClient.view.hbm.BeanView;
import com.iscp.sys.coderClient.view.hbm.GlobeView;
import java.awt.Container;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.util.*;

// Referenced classes of package com.iscp.sys.coderMsg:
//			Answer, MsgComponent, Command, RelModel, 
//			TableModel, ColumnModel

public class MsgManager
{

	public MsgManager()
	{
	}

	public static Answer ask(Container c, Command command)
		throws Exception
	{
		Container temp = c;
		Answer answer = new Answer();
		for (; temp != null && !(temp instanceof MsgComponent); temp = temp.getParent());
		if (temp instanceof MsgComponent)
		{
			URL url = ((MsgComponent)temp).getURL();
			URLConnection con = url.openConnection();
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setUseCaches(false);
			con.setRequestProperty("Content-Type", "application/octet-stream");
			ObjectOutputStream outStream = new ObjectOutputStream(con.getOutputStream());
			outStream.writeObject(command);
			outStream.flush();
			outStream.close();
			java.io.InputStream in = con.getInputStream();
			ObjectInputStream inStream = new ObjectInputStream(in);
			answer = (Answer)inStream.readObject();
			if (answer != null && answer.error != null)
				throw answer.error;
			else
				return answer;
		} else
		{
			throw new Exception("找不到发送机制组件");
		}
	}

	public static Object[] ask(Container c, String type, Object param[])
		throws Exception
	{
		Container temp = c;
		Object command[] = new Object[2];
		command[0] = type;
		command[1] = ((Object) (param));
		for (; temp != null && !(temp instanceof MsgComponent); temp = temp.getParent());
		if (temp instanceof MsgComponent)
		{
			URL url = ((MsgComponent)temp).getLayoutURL();
			System.out.println((new StringBuilder("###")).append(url).toString());
			URLConnection con = url.openConnection();
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setUseCaches(false);
			con.setRequestProperty("Content-Type", "application/octet-stream");
			ObjectOutputStream outStream = new ObjectOutputStream(con.getOutputStream());
			outStream.writeObject(((Object) (command)));
			outStream.flush();
			outStream.close();
			java.io.InputStream in = con.getInputStream();
			ObjectInputStream inStream = new ObjectInputStream(in);
			Object ans[] = (Object[])inStream.readObject();
			if (ans != null && ans[1] != null && (ans[1] instanceof Exception))
				throw (Exception)ans[1];
			else
				return ans;
		} else
		{
			throw new Exception("找不到发送机制组件");
		}
	}

	public static Object[] getLayoutList(String tableName, Container c)
		throws Exception
	{
		Object cmd[] = new Object[2];
		cmd[0] = tableName;
		Object o[] = ask(c, "getLayoutList", cmd);
		return (Object[])o[0];
	}

	public static ColumnModel[] get_column_list(TableModel table, Container c)
		throws Exception
	{
		Command cmd = new Command();
		Command _tmp = cmd;
		cmd.commandType = 1;
		cmd.tableModel = table;
		return ask(c, cmd).columnList;
	}

	public static TableModel[] get_mid_table_list(Container c)
		throws Exception
	{
		Command cmd = new Command();
		Command _tmp = cmd;
		cmd.commandType = 7;
		return ask(c, cmd).tableList;
	}

	public static RelModel[] get_rel_list(TableModel table, Container c)
		throws Exception
	{
		Command cmd = new Command();
		Command _tmp = cmd;
		cmd.commandType = 2;
		cmd.tableModel = table;
		return ask(c, cmd).relList;
	}

	public static TableModel[] get_table_list(Container c)
		throws Exception
	{
		Command cmd = new Command();
		Command _tmp = cmd;
		cmd.commandType = 0;
		return ask(c, cmd).tableList;
	}

	public static void removeRelation(Collection rels, Container c)
		throws Exception
	{
		Command cmd = new Command();
		Command _tmp = cmd;
		cmd.commandType = 4;
		Iterator it = rels.iterator();
		int count = rels.size();
		cmd.relList = new RelModel[count];
		for (int i = 0; i < count; i++)
			cmd.relList[i] = (RelModel)it.next();

		ask(c, cmd);
	}

	public static void save_rels(GlobeView gv, Container c)
		throws Exception
	{
		Command cmd = new Command();
		Command _tmp = cmd;
		cmd.commandType = 3;
		cmd.tableModel = gv.mainBeanView.getModel();
		RelModel allRels[] = gv.getRelations();
		int count = allRels.length;
		for (int i = 0; i < allRels.length; i++)
			if (!allRels[i].table_host.equals(gv.mainBeanView.getModel().tabName) && !allRels[i].table_related.equals(gv.mainBeanView.getModel().tabName))
			{
				allRels[i] = null;
				count--;
			}

		cmd.relList = new RelModel[count];
		count = 0;
		for (int i = 0; i < allRels.length; i++)
			if (allRels[i] != null)
				cmd.relList[count++] = allRels[i];

		ask(c, cmd);
	}

	public static Answer writefile(TableModel table, TableModel relTables[], Map layoutMap, Container c, Map param)
		throws Exception
	{
		Object cmd[] = new Object[4];
		cmd[0] = table.tabName;
		String relTableNames[] = new String[relTables.length];
		for (int i = 0; i < relTables.length; i++)
			relTableNames[i] = relTables[i].tabName;

		cmd[1] = layoutMap;
		cmd[2] = relTableNames;
		cmd[3] = param;
		Answer ans = new Answer();
		ask(c, "writeFile", cmd);
		return ans;
	}

	public static Answer writefile(TableModel table, TableModel relTables[], Map layoutMap, Container c)
		throws Exception
	{
		return writefile(table, relTables, layoutMap, c, null);
	}
}
