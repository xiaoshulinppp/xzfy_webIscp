// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Execute.java

package com.iscp.sys.coderServer;

import com.iscp.sys.coder.Coder;
import com.iscp.sys.coder.beancoder.BeanCoder;
import com.iscp.sys.coder.hbmcoder.HbmCoder;
import com.iscp.sys.coder.model.TemplateCoder;
import com.iscp.sys.coderMsg.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

public class Execute
{

	private Session session;
	private Command command;
	private Configuration cfg;

	public Execute()
	{
	}

	public void setCommand(Command command)
	{
		this.command = command;
	}

	public void setCfg(Configuration cfg)
	{
		this.cfg = cfg;
	}

	public Answer execute(Session session, Command command)
		throws Exception
	{
		this.session = session;
		this.command = command;
		if (command.commandType == 0)
			return get_table_list();
		if (command.commandType == 1)
			return get_column_list();
		if (command.commandType == 2)
			return get_rel_list();
		if (command.commandType == 3)
			return save_rels();
		if (command.commandType == 4)
			return remove_rels();
		if (command.commandType == 5)
			return write_file();
		if (command.commandType == 7)
			return get_mid_table_list();
		else
			return null;
	}

	public Answer get_mid_table_list()
		throws Exception
	{
		Answer ans = new Answer();
		Connection conn = null;
		conn = session.connection();
		String types[] = new String[1];
		types[0] = "TABLE";
		DatabaseMetaData TableMeta = conn.getMetaData();
		boolean ret = TableMeta.getDatabaseProductName().toLowerCase().indexOf("oracle") != -1;
		String schmea = null;
		if (ret)
			schmea = TableMeta.getUserName();
		ResultSet rs = TableMeta.getTables(null, schmea, "%", types);
		Vector tableVector = new Vector();
		for (; rs.next(); tableVector.add(rs.getString(3)));
		for (int i = 0; i < tableVector.size(); i++)
		{
			ResultSet primaryRs = conn.getMetaData().getPrimaryKeys(null, null, (String)tableVector.get(i));
			int primaryCount;
			for (primaryCount = 0; primaryRs.next(); primaryCount++);
			if (primaryCount != 2)
			{
				tableVector.remove(i);
				i--;
			}
		}

		ans.tableList = new TableModel[tableVector.size()];
		for (int i = 0; i < tableVector.size(); i++)
		{
			ans.tableList[i] = new TableModel();
			ans.tableList[i].tabName = ((String)tableVector.get(i)).toLowerCase();
		}

		return ans;
	}

	public Answer get_table_list()
		throws Exception
	{
		Answer ans = new Answer();
		Connection conn = null;
		conn = session.connection();
		String types[] = new String[1];
		types[0] = "TABLE";
		DatabaseMetaData TableMeta = conn.getMetaData();
		boolean ret = TableMeta.getDatabaseProductName().toLowerCase().indexOf("oracle") != -1;
		String schmea = null;
		if (ret)
			schmea = TableMeta.getUserName();
		ResultSet rs = TableMeta.getTables(null, schmea, "%", types);
		Vector tableVector = new Vector();
		for (; rs.next(); tableVector.add(rs.getString(3)));
		ans.tableList = new TableModel[tableVector.size()];
		for (int i = 0; i < tableVector.size(); i++)
		{
			ans.tableList[i] = new TableModel();
			ans.tableList[i].tabName = (String)tableVector.get(i);
		}

		return ans;
	}

	public Answer get_column_list()
		throws Exception
	{
		Answer ans = new Answer();
		Connection conn = null;
		conn = session.connection();
		ResultSet primaryRs = conn.getMetaData().getPrimaryKeys(null, null, command.tableModel.tabName);
		Set primaryColumnNameSet = new HashSet();
		for (; primaryRs.next(); primaryColumnNameSet.add(primaryRs.getString(4)));
		ResultSet rs = conn.createStatement().executeQuery((new StringBuilder("select * from ")).append(command.tableModel.getTabName()).toString());
		ResultSetMetaData metadata = rs.getMetaData();
		int size = metadata.getColumnCount();
		ans.columnList = new ColumnModel[size];
		for (int i = 1; i <= size; i++)
		{
			ans.columnList[i - 1] = new ColumnModel();
			ans.columnList[i - 1].name = metadata.getColumnName(i);
			int type = metadata.getColumnType(i);
			if (type == 4 || type == -5 || type == -6 || type == 5)
				ans.columnList[i - 1].typeName = "Integer";
			else
				ans.columnList[i - 1].typeName = "String";
			if (primaryColumnNameSet.contains(ans.columnList[i - 1].name))
				ans.columnList[i - 1].isKey = "1";
			else
				ans.columnList[i - 1].isKey = "0";
		}

		return ans;
	}

	public Answer get_rel_list()
		throws Exception
	{
		Answer ans = new Answer();
		String tableName = command.tableModel.getTabName();
		List list = session.createQuery((new StringBuilder("from RelModel r where r.table_host='")).append(tableName).append("' or r.table_related='").append(tableName).append("'").toString()).list();
		int size = list.size();
		Iterator it = list.iterator();
		ans.relList = new RelModel[size];
		int i = 0;
		while (it.hasNext()) 
			ans.relList[i++] = (RelModel)it.next();
		return ans;
	}

	private boolean equal(RelModel a, RelModel b)
	{
		if (!a.column_host.equals(b.column_host))
			return false;
		if (!a.column_related.equals(b.column_related))
			return false;
		if (!a.table_related.equals(b.table_related))
			return false;
		if (a.type != b.type)
			return false;
		if (a.type != 3)
			return true;
		if (!a.mid_table.equals(b.mid_table))
			return false;
		if (!a.mid_table_host.equals(b.mid_table_host))
			return false;
		Exception e;
		return a.mid_table_related.equals(b.mid_table_related);
		e;
		return false;
	}

	private boolean exist(RelModel a, RelModel b[])
	{
		for (int i = 0; i < b.length; i++)
			if (equal(a, b[i]))
				return true;

		return false;
	}

	public Answer save_rels()
		throws Exception
	{
		Answer ans = new Answer();
		String tableName = command.tableModel.getTabName();
		RelModel relList[] = command.relList;
		List list = session.createQuery((new StringBuilder("from RelModel r where r.table_host='")).append(tableName).append("' or r.table_related='").append(tableName).append("'").toString()).list();
		Object obj_rels[] = list.toArray();
		RelModel rels[] = new RelModel[obj_rels.length];
		for (int i = 0; i < rels.length; i++)
		{
			rels[i] = (RelModel)obj_rels[i];
			if (!exist(rels[i], relList))
				session.delete(rels[i]);
		}

		for (int i = 0; i < relList.length; i++)
			if (relList[i].table_host.equals(tableName) && !exist(relList[i], rels))
				session.save(relList[i]);
			else
			if (relList[i].table_related.equals(tableName) && !exist(relList[i], rels))
				session.save(relList[i]);

		return ans;
	}

	public Answer remove_rels()
	{
		Answer ans = new Answer();
		for (int i = 0; i < command.relList.length; i++)
		{
			Object o = session.get(com/iscp/sys/coderMsg/RelModel, new Integer(command.relList[i].getId()));
			session.delete(o);
		}

		return ans;
	}

	public Answer write_file()
		throws Exception
	{
		Answer ans = new Answer();
		TableModel tableList[] = command.tableList;
		TableModel table = command.tableModel;
		RelModel relList[] = command.relList;
		com.iscp.sys.coderMsg.IdTypeModel idType = command.idType;
		TemplateCoder coder = new TemplateCoder(table, tableList, relList, idType, true);
		coder.writeFiles(cfg, session);
		return ans;
	}

	public Answer write_file_()
		throws Exception
	{
		Answer ans;
		File javaFile;
		File hbmFile;
		OutputStream os;
		ans = new Answer();
		String path = (new StringBuilder(String.valueOf(Coder.getBasePath()))).append("bean").append("/").toString();
		String javaFileName = (new StringBuilder(String.valueOf(path))).append(BeanCoder.firstUpperCase(command.tableModel.getLogName())).append(".java").toString();
		String hbmFileName = (new StringBuilder(String.valueOf(path))).append(BeanCoder.firstUpperCase(command.tableModel.getLogName())).append(".hbm.xml").toString();
		javaFile = new File(javaFileName);
		hbmFile = new File(hbmFileName);
		ans.writtenfile = 0;
		os = null;
		try
		{
			if (!javaFile.exists() || (1 & command.overWriteFiles) != 0)
			{
				os = new FileOutputStream(javaFile);
				BeanCoder bc = new BeanCoder();
				os.write(bc.getBeanExpress(command.tableModel, command.relList, command.idType).getBytes());
				ans.writtenfile++;
				os.close();
			}
			if (!hbmFile.exists() || (2 & command.overWriteFiles) != 0)
			{
				os = new FileOutputStream(hbmFile);
				HbmCoder hc = new HbmCoder();
				os.write(hc.getBeanExpress(command.tableModel, command.relList, command.idType).getBytes());
				ans.writtenfile += 2;
				os.close();
			}
		}
		catch (Exception e)
		{
			ans.error = e;
			break MISSING_BLOCK_LABEL_361;
		}
		break MISSING_BLOCK_LABEL_348;
		Exception exception;
		exception;
		if (os != null)
			os.close();
		throw exception;
		if (os != null)
			os.close();
		break MISSING_BLOCK_LABEL_371;
		if (os != null)
			os.close();
		return ans;
	}
}
