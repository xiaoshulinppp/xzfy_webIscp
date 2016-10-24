// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MsgManager.java

package com.iscp.sys.formLayout.msg;

import com.iscp.sys.formLayout.model.*;
import com.iscp.sys.formLayout.view.TableView;
import com.iscp.sys.formLayout.view.dialog.TableDialog;
import java.awt.Container;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Vector;

// Referenced classes of package com.iscp.sys.formLayout.msg:
//			Answer, MsgComponent, Command, MsgTable, 
//			MsgField, MsgDict

public class MsgManager
{

	public MsgManager()
	{
	}

	public static URL getURL(Container c)
		throws Exception
	{
		Container temp = c;
		Answer answer = new Answer();
		for (; temp != null && !(temp instanceof MsgComponent); temp = temp.getParent());
		if (temp instanceof MsgComponent)
			return ((MsgComponent)temp).getURL();
		else
			return null;
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
			throw new Exception("???????????????");
		}
	}

	public static MsgTable[] getTableList(Container c)
		throws Exception
	{
		Command cmd = new Command();
		cmd.commandType = 0;
		Answer ans = ask(c, cmd);
		return ans.msgTableList;
	}

	public static MsgField[] getFieldList(Container c, MsgTable table)
		throws Exception
	{
		Command cmd = new Command();
		cmd.msgTable = table;
		cmd.commandType = 1;
		return ask(c, cmd).msgFieldList;
	}

	public static String[] getFileList(Container c, String path)
		throws Exception
	{
		Command cmd = new Command();
		cmd.basePath = path;
		cmd.commandType = 2;
		return ask(c, cmd).fileNameList;
	}

	public static String[] getDirectoryList(Container c, String path)
		throws Exception
	{
		Command cmd = new Command();
		cmd.basePath = path;
		cmd.commandType = 3;
		return ask(c, cmd).directoryList;
	}

	public static void newDirectory(Container c, String path, String directoryName)
		throws Exception
	{
		Command cmd = new Command();
		cmd.basePath = (new StringBuilder(String.valueOf(path))).append("/").append(directoryName).toString();
		cmd.commandType = 4;
		ask(c, cmd);
	}

	public static boolean isTableExist(Container c, String logTableName)
		throws Exception
	{
		Command cmd = new Command();
		cmd.msgTable = new MsgTable();
		cmd.commandType = 15;
		cmd.msgTable.logTable = logTableName;
		return !ask(c, cmd).directoryEmpty;
	}

	public static void removeTable(Container c, MsgTable table)
		throws Exception
	{
		Command cmd = new Command();
		cmd.msgTable = table;
		cmd.commandType = 12;
		ask(c, cmd);
	}

	public static void removeDirectory(Container c, String path)
		throws Exception
	{
		Command cmd = new Command();
		cmd.basePath = path;
		cmd.commandType = 5;
		ask(c, cmd);
	}

	public static boolean isDirectoryEmpty(Container c, String path)
		throws Exception
	{
		Command cmd = new Command();
		cmd.basePath = path;
		cmd.commandType = 6;
		return ask(c, cmd).directoryEmpty;
	}

	public static void saveMappingTable(Container c, MsgTable msgTable)
		throws Exception
	{
		Command cmd = new Command();
		cmd.msgTable = msgTable;
		cmd.commandType = 7;
		ask(c, cmd);
	}

	public static boolean saveFile(Container c, TableModel tableModel)
		throws Exception
	{
		Command cmd = new Command();
		cmd.basePath = "/";
		cmd.tableModel = tableModel;
		cmd.commandType = 8;
		if (tableModel.logName == null || tableModel.showName == null)
			(new TableDialog(TableView.getFrame(c), tableModel, "????????", false)).setVisible(true);
		if (tableModel.logName == null || tableModel.showName == null)
			return false;
		MsgTable mt = new MsgTable();
		mt.desc = tableModel.tableDesc;
		mt.showName = tableModel.showName;
		mt.logTable = tableModel.logName;
		mt.name = tableModel.tabName;
		saveMappingTable(c, mt);
		Vector cells = tableModel.cells;
		for (int i = 0; i < cells.size(); i++)
		{
			com.iscp.sys.formLayout.model.ItemModel item = ((CellModel)cells.get(i)).getItemModel();
			if (item instanceof FieldItemModel)
			{
				FieldItemModel m = (FieldItemModel)item;
				m.table = mt.name;
			} else
			if (item instanceof FieldTextItemModel)
			{
				FieldTextItemModel m = (FieldTextItemModel)item;
				m.table = mt.name;
			}
		}

		ask(c, cmd);
		return true;
	}

	public static TableModel loadFile(Container c, String path, String fileName)
		throws Exception
	{
		Command cmd = new Command();
		cmd.basePath = (new StringBuilder(String.valueOf(path))).append("/").append(fileName).toString();
		cmd.commandType = 9;
		return ask(c, cmd).tableModel;
	}

	public static String preview(Container c, TableModel tableModel)
		throws Exception
	{
		Command cmd = new Command();
		cmd.tableModel = tableModel;
		cmd.commandType = 10;
		return ask(c, cmd).previewHtml;
	}

	public static MsgDict[] getDictList(Container c)
		throws Exception
	{
		Command cmd = new Command();
		cmd.commandType = 16;
		return ask(c, cmd).dictList;
	}

	public static void writefile(Container c, TableModel tm)
		throws Exception
	{
		Command cmd = new Command();
		cmd.commandType = 17;
		cmd.tableModel = tm;
		ask(c, cmd);
	}
}
