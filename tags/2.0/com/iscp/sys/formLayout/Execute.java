// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Execute.java

package com.iscp.sys.formLayout;

import com.iscp.sys.formLayout.model.CellModel;
import com.iscp.sys.formLayout.model.FieldItemModel;
import com.iscp.sys.formLayout.model.FieldTextItemModel;
import com.iscp.sys.formLayout.model.ListItemModel;
import com.iscp.sys.formLayout.model.TableModel;
import com.iscp.sys.formLayout.msg.Answer;
import com.iscp.sys.formLayout.msg.Command;
import com.iscp.sys.formLayout.msg.MsgDict;
import com.iscp.sys.formLayout.msg.MsgField;
import com.iscp.sys.formLayout.msg.MsgTable;
import com.iscp.sys.formLayout.msg.RelModel;
import com.taiji.core.generator.GenerateParameter;
import com.taiji.core.generator.configen.PresentCodeGen;
import com.taiji.core.generator.formgen.ParseTemplate;
import com.taiji.core.generator.plugingen.*;
import com.taiji.core.util.ApplicationPath;
import java.io.*;
import java.sql.*;
import java.util.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

// Referenced classes of package com.iscp.sys.formLayout:
//			FileOperator, FormLayoutServer

public class Execute
{

	private FormLayoutServer formLayoutServer;
	private Session session;
	private List genMap;
	private Command cmd;
	Configuration cfg;
	private static final int ONE_TO_ONE = 0;
	private static final int ONE_TO_MANY = 1;
	private static final int MANY_TO_ONE = 2;
	private static final int MANY_TO_MANY = 3;
	private static String tempPathForFileCreate = null;

	public Execute(FormLayoutServer formLayoutServer)
	{
		genMap = new ArrayList();
		this.formLayoutServer = formLayoutServer;
	}

	public void setSession(Session session)
	{
		this.session = session;
	}

	public void setCommand(Command cmd)
	{
		this.cmd = cmd;
	}

	public Answer execute(Session session, Command cmd)
		throws Exception
	{
		this.session = session;
		this.cmd = cmd;
		if (cmd.commandType == 1)
			return get_field_list();
		if (cmd.commandType == 0)
			return get_table_list();
		if (cmd.commandType == 2)
			return get_file_list();
		if (cmd.commandType == 3)
			return get_directory_list();
		if (cmd.commandType == 4)
			return new_directory();
		if (cmd.commandType == 5)
			return remove_directory();
		if (cmd.commandType == 6)
			return is_directory_empty();
		if (cmd.commandType == 7)
			return save_mappingtable();
		if (cmd.commandType == 8)
			return save_file();
		if (cmd.commandType == 9)
			return load_file();
		if (cmd.commandType == 10)
			return preview();
		if (cmd.commandType == 12)
			return remove_table();
		if (cmd.commandType == 15)
			return is_table_exist();
		if (cmd.commandType == 16)
			return get_dict_list();
		if (cmd.commandType == 17)
			return write_file();
		if (cmd.commandType == 18)
			return get_backup_list();
		else
			return null;
	}

	private MsgField[] getColumnList()
		throws Exception
	{
		ResultSet primaryRs = session.connection().getMetaData().getPrimaryKeys(null, null, cmd.msgTable.getName());
		int primaryCount = 0;
		Set keys = new HashSet();
		for (; primaryRs.next(); keys.add(new String(primaryRs.getString(4))))
			primaryCount++;

		ResultSet rs = session.connection().createStatement().executeQuery((new StringBuilder("select * from ")).append(cmd.msgTable.getName()).toString());
		ResultSetMetaData metadata = rs.getMetaData();
		int size = metadata.getColumnCount();
		MsgField columns[] = new MsgField[size];
		for (int i = 1; i <= size; i++)
		{
			columns[i - 1] = new MsgField();
			columns[i - 1].name = metadata.getColumnName(i);
			columns[i - 1].byName = columns[i - 1].name;
			columns[i - 1].length = "50";
			columns[i - 1].tableName = cmd.msgTable.getName();
			if (keys.contains(columns[i - 1].name))
				columns[i - 1].iskey = "1";
			else
				columns[i - 1].iskey = "0";
			int type = metadata.getColumnType(i);
			if (type == 4 || type == -5 || type == -6 || type == 5)
				columns[i - 1].type = "int";
			else
				columns[i - 1].type = "string";
		}

		return columns;
	}

	private List getFieldList()
	{
		Iterator it = session.createQuery((new StringBuilder("from MsgTable t where t.name='")).append(cmd.msgTable.name).append("'").toString()).iterate();
		if (it.hasNext())
		{
			MsgTable mt = (MsgTable)it.next();
			return session.createQuery((new StringBuilder("from MsgField f where f.field_mappingtable='")).append(mt.getId()).append("'").toString()).list();
		} else
		{
			return new ArrayList(0);
		}
	}

	public boolean isPrimaryKey(String table, String column)
	{
		ResultSet primaryRs;
		int primaryCount;
		primaryRs = session.connection().getMetaData().getPrimaryKeys(null, null, table);
		primaryCount = 0;
		  goto _L1
_L3:
		primaryCount++;
		if (primaryRs.getString(4).equals(column))
			return true;
_L1:
		if (primaryRs.next()) goto _L3; else goto _L2
_L2:
		break MISSING_BLOCK_LABEL_61;
		Exception exception;
		exception;
		return false;
	}

	public Answer get_field_list()
		throws Exception
	{
		MsgField columns[] = getColumnList();
		Answer ans = new Answer();
		Map fieldNameSet = new HashMap();
		List list = getFieldList();
		int size = list.size();
		for (int i = 0; i < size; i++)
		{
			MsgField mf = (MsgField)list.get(i);
			mf.setTableName(cmd.msgTable.name);
			mf.setLogTableName(cmd.msgTable.name);
			fieldNameSet.put(mf.getName(), mf);
		}

		for (int i = 0; i < columns.length; i++)
			if (fieldNameSet.get(columns[i].name) == null)
			{
				list.add(columns[i]);
			} else
			{
				MsgField mf = (MsgField)fieldNameSet.get(columns[i].name);
				mf.iskey = columns[i].iskey;
			}

		size = list.size();
		ans.msgFieldList = new MsgField[size];
		for (int i = 0; i < size; i++)
		{
			ans.msgFieldList[i] = (MsgField)list.get(i);
			ans.msgFieldList[i].setTableName(cmd.msgTable.getName());
			ans.msgFieldList[i].setLogTableName(cmd.msgTable.getLogTable());
		}

		Vector rel_mfs = new Vector();
		for (int i = 0; i < size; i++)
		{
			String queryStr = (new StringBuilder("from RelModel r where (r.table_host='")).append(cmd.msgTable.getName()).append("' and r.column_host='").append(ans.msgFieldList[i].getName()).append("')").toString();
			queryStr = (new StringBuilder(String.valueOf(queryStr))).append("or (r.table_related='").append(cmd.msgTable.getName()).append("' and r.column_related='").append(ans.msgFieldList[i].getName()).append("')").toString();
			List rel_list = session.createQuery(queryStr).list();
			if (!rel_list.isEmpty())
			{
				for (int j = 0; j < rel_list.size(); j++)
				{
					RelModel rm = (RelModel)rel_list.get(j);
					MsgField mf = new MsgField();
					mf.tableName = ans.msgFieldList[i].tableName;
					mf.name = ans.msgFieldList[i].name;
					mf.showType = ans.msgFieldList[i].showType;
					mf.byName = ans.msgFieldList[i].byName;
					mf.iskey = ans.msgFieldList[i].iskey;
					rel_mfs.add(mf);
					if (cmd.msgTable.getName().equals(rm.getTable_related()) && ans.msgFieldList[i].getName().equals(rm.getColumn_related()))
					{
						mf.setRelatedTable(rm.getTable_host());
						mf.setRelatedId(rm.getColumn_host());
						if (rm.getType() == 0)
						{
							mf.setTargetRelationType("one");
							if (rm.getType() == 0 && mf.iskey.equals("0"))
								mf.setOne_to_one(true);
						}
					}
					if (cmd.msgTable.getName().equals(rm.getTable_host()) && mf.getName().equals(rm.getColumn_host()))
					{
						mf.setRelatedTable(rm.getTable_related());
						mf.setRelatedId(rm.getColumn_related());
						if (rm.getType() == 0 || rm.getType() == 2)
						{
							mf.setTargetRelationType("one");
							if (rm.getType() == 0 && mf.iskey.equals("1") && isPrimaryKey(rm.getTable_related(), rm.getColumn_related()))
								mf.setOne_to_one(true);
						} else
						{
							mf.setTargetRelationType("many");
						}
					} else
					{
						mf.setRelatedTable(rm.getTable_host());
						mf.setRelatedId(rm.getColumn_host());
						if (rm.getType() == 0 || rm.getType() == 1)
							mf.setTargetRelationType("one");
						else
							mf.setTargetRelationType("many");
					}
				}

				ans.msgFieldList[i] = null;
			}
		}

		Vector finalFieldVector = new Vector();
		for (int i = 0; i < ans.msgFieldList.length; i++)
			if (ans.msgFieldList[i] != null)
				finalFieldVector.add(ans.msgFieldList[i]);

		finalFieldVector.addAll(rel_mfs);
		ans.msgFieldList = new MsgField[finalFieldVector.size()];
		for (int i = 0; i < finalFieldVector.size(); i++)
			ans.msgFieldList[i] = (MsgField)finalFieldVector.get(i);

		return ans;
	}

	private MsgTable[] getTableList()
		throws Exception
	{
		String types[] = new String[1];
		types[0] = "TABLE";
		DatabaseMetaData TableMeta = session.connection().getMetaData();
		ResultSet rs = TableMeta.getTables(null, TableMeta.getUserName(), "%", types);
		Vector tableVector = new Vector();
		for (; rs.next(); tableVector.add(rs.getString(3)));
		int size = tableVector.size();
		MsgTable tables[] = new MsgTable[size];
		for (int i = 0; i < size; i++)
		{
			tables[i] = new MsgTable();
			tables[i].name = ((String)tableVector.get(i)).toLowerCase();
		}

		return tables;
	}

	private Answer get_table_list()
		throws Exception
	{
		MsgTable tables[] = getTableList();
		Answer ans = new Answer();
		List list = session.createQuery("from MsgTable").list();
		int size = list.size();
		Set tableNameSet = new HashSet();
		for (int i = 0; i < size; i++)
			tableNameSet.add(((MsgTable)list.get(i)).getName());

		for (int i = 0; i < tables.length; i++)
		{
			if (!tableNameSet.contains(tables[i].name));
			list.add(tables[i]);
		}

		size = list.size();
		ans.msgTableList = new MsgTable[size];
		for (int i = 0; i < size; i++)
			ans.msgTableList[i] = (MsgTable)list.get(i);

		return ans;
	}

	private Answer is_table_exist()
		throws Exception
	{
		Answer ans = new Answer();
		Iterator it = session.createQuery((new StringBuilder("from MsgTable t where t.logTable='")).append(cmd.msgTable.logTable).append("'").toString()).iterate();
		ans.directoryEmpty = !it.hasNext();
		return ans;
	}

	private Answer remove_table()
		throws Exception
	{
		Answer ans = new Answer();
		String log = cmd.msgTable.logTable;
		for (Iterator it = session.createQuery((new StringBuilder("from MsgTable t where t.logTable='")).append(log).append("'").toString()).iterate(); it.hasNext(); session.delete(it.next()));
		return ans;
	}

	public String getJsPath(String path)
	{
		return (new StringBuilder(String.valueOf(path))).append(".js").toString();
	}

	public String getPath()
	{
		String path = getLayoutBasePath();
		path = (new StringBuilder(String.valueOf(path))).append(cmd.basePath).toString();
		return path;
	}

	public static String getLayoutBasePath()
	{
		return getBasePath();
	}

	private Answer get_file_list()
		throws Exception
	{
		Answer ans = new Answer();
		String path = getPath();
		File file = new File(path);
		File files[] = file.listFiles();
		int fileCount = 0;
		for (int i = 0; i < files.length; i++)
			if (!files[i].isDirectory() && files[i].getName().indexOf(".lay") > 0)
				fileCount++;

		String fileNameList[] = new String[fileCount];
		fileCount = 0;
		for (int i = 0; i < files.length; i++)
			if (!files[i].isDirectory() && files[i].getName().indexOf(".lay") > 0)
				fileNameList[fileCount++] = files[i].getName();

		ans.fileNameList = fileNameList;
		return ans;
	}

	private Answer get_directory_list()
		throws Exception
	{
		Answer ans = new Answer();
		String path = getPath();
		File file = new File(path);
		File files[] = file.listFiles();
		int fileCount = 0;
		for (int i = 0; i < files.length; i++)
			if (files[i].isDirectory())
				fileCount++;

		String directoryList[] = new String[fileCount];
		fileCount = 0;
		for (int i = 0; i < files.length; i++)
			if (files[i].isDirectory())
				directoryList[fileCount++] = files[i].getName();

		ans.directoryList = directoryList;
		return ans;
	}

	public Answer new_directory()
		throws Exception
	{
		Answer ans = new Answer();
		String path = getPath();
		File file = new File(path);
		if (!file.mkdir())
			throw new Exception("?????\274???");
		else
			return ans;
	}

	public Answer remove_directory()
		throws Exception
	{
		Answer ans = new Answer();
		String path = getPath();
		File file = new File(path);
		deleteFile(file);
		return ans;
	}

	public void deleteFile(File file)
		throws Exception
	{
		if (file.isDirectory())
		{
			File files[] = file.listFiles();
			for (int i = 0; i < files.length; i++)
				if (files[i] != file)
					deleteFile(files[i]);

		}
		if (!file.delete())
			throw new Exception((new StringBuilder("???")).append(file.getName()).append("???").toString());
		else
			return;
	}

	public Answer is_directory_empty()
		throws Exception
	{
		Answer ans = new Answer();
		String path = getPath();
		File file = new File(path);
		File list[] = file.listFiles();
		ans.directoryEmpty = list == null || list.length == 0 || list.length == 1 && list[0] == file;
		return ans;
	}

	public Answer is_file_exist()
		throws Exception
	{
		Answer ans = new Answer();
		String path = getPath();
		File file = new File(path);
		ans.directoryEmpty = !file.exists();
		return ans;
	}

	private String getFileRelatedPath(TableModel model)
	{
		return (new StringBuilder("/layout/")).append(model.tabName).toString();
	}

	public Answer save_file()
		throws Exception
	{
		Answer ans = new Answer();
		cmd.basePath = getFileRelatedPath(cmd.tableModel);
		String path = getPath();
		FileOutputStream fis = null;
		ObjectOutputStream oos = null;
		saveEnv();
		try
		{
			File fileDir = new File(path);
			if (!fileDir.exists())
				fileDir.mkdir();
			path = (new StringBuilder(String.valueOf(path))).append("/").append(cmd.tableModel.logName).append(".lay").toString();
			File file = new File(path);
			fis = new FileOutputStream(file);
			oos = new ObjectOutputStream(fis);
			oos.writeObject(cmd.tableModel);
			oos.flush();
			oos.close();
			file = new File(getJsPath(path));
			FileOperator.write(cmd.tableModel.javaScript, file);
			GenerateParameter parameter = new GenerateParameter(cmd.tableModel.tabName, null, null);
			PresentCodeGen gen = new PresentCodeGen(parameter, cmd.tableModel.toString());
			gen.generatePropertyFile();
			gen.gererateHbmJavaFile(genMap);
		}
		catch (Exception e)
		{
			if (fis != null)
				fis.close();
			if (oos != null)
				oos.close();
			throw e;
		}
		return ans;
	}

	private Answer save_mappingtable()
		throws Exception
	{
		Answer ans = new Answer();
		MsgTable mt = cmd.msgTable;
		List list = session.createQuery((new StringBuilder("from MsgTable t where t.name='")).append(cmd.msgTable.name).append("'").toString()).list();
		if (list != null && list.size() > 0)
		{
			MsgTable t = cmd.msgTable;
			mt = (MsgTable)list.get(0);
			mt.desc = t.desc;
			mt.logTable = t.logTable;
			mt.showName = t.showName;
		}
		session.save(mt);
		return ans;
	}

	private void saveEnv()
		throws Exception
	{
		cmd.tableModel.setAutoTabIndex();
		Vector cells = cmd.tableModel.cells;
		String table = cmd.tableModel.tabName;
		String logTable = cmd.tableModel.logName;
		int tableId = -1;
		Iterator it = session.createQuery((new StringBuilder("from MsgTable t where t.name='")).append(table).append("'").toString()).iterate();
		if (it != null && it.hasNext())
			tableId = ((MsgTable)it.next()).getId();
		else
			return;
		Map dictMap = new HashMap();
		MsgDict dict;
		for (it = session.createQuery("from MsgDict").iterate(); it.hasNext(); dictMap.put(dict.getAbbr(), dict))
			dict = (MsgDict)it.next();

		it = session.createQuery((new StringBuilder("from MsgField f where f.field_mappingtable='")).append(tableId).append("'").toString()).iterate();
		Map map = new HashMap();
		Set set = new HashSet();
		MsgField fm;
		for (; it.hasNext(); map.put(fm.getName(), fm))
			fm = (MsgField)it.next();

		int size = cells.size();
		for (int i = 0; i < size; i++)
		{
			com.iscp.sys.formLayout.model.ItemModel im = ((CellModel)cells.get(i)).getItemModel();
			if (im != null)
			{
				MsgField fm = null;
				String itemTable = null;
				if (im instanceof FieldItemModel)
				{
					FieldItemModel fim = (FieldItemModel)im;
					itemTable = fim.getTable();
					fm = (MsgField)map.get(fim.field);
					if (fm == null)
					{
						fm = new MsgField();
						fm.setName(fim.field);
						fm.setField_mappingtable((new StringBuilder(String.valueOf(tableId))).toString());
						map.put(fim.field, fm);
						genMap.add(fim.field);
					}
					fm.setName(fim.field);
					fm.setType(fim.getType());
					fm.setShowType(fim.getShowType());
					fm.setLength(fim.length);
					fm.setDefault(fim.default_);
					fm.setIskey("0");
					fm.setIsNull("0");
					if (fim.isNull)
						fm.setIsNull("1");
					fm.setIsDict("0");
					if (fim.isDict)
						fm.setIsDict("1");
					MsgDict dict = (MsgDict)dictMap.get(fim.dictListId);
					if (dict == null)
						fm.setDictListId(null);
					else
						fm.setDictListId((new StringBuilder(String.valueOf(dict.getId()))).toString());
					fm.setDictType(fim.getDictType());
					fm.setDictvalGetType((new StringBuilder(String.valueOf(fim.dictvalGetType))).toString());
					fm.setDictvalShowType(fim.dictShowType);
					fm.setAction(fim.action);
					fm.setTabIndex((new StringBuilder(String.valueOf(fim.tabIndex))).toString());
				} else
				if (im instanceof FieldTextItemModel)
				{
					FieldTextItemModel ftim = (FieldTextItemModel)im;
					itemTable = ftim.table;
					fm = (MsgField)map.get(ftim.field);
					if (fm == null)
					{
						fm = new MsgField();
						fm.setName(ftim.field);
						fm.setField_mappingtable((new StringBuilder(String.valueOf(tableId))).toString());
						fm.setIskey("0");
						map.put(ftim.field, fm);
						genMap.add(ftim.field);
					}
					fm.setByName(ftim.text);
				} else
				if (im instanceof ListItemModel)
				{
					ListItemModel lim = (ListItemModel)im;
					String queryStr = (new StringBuilder("from RelModel r  where (r.table_host='")).append(lim.primaryTable).append("')").toString();
					queryStr = (new StringBuilder(String.valueOf(queryStr))).append("and (r.table_related='").append(lim.table.name).append("')").toString();
					List list = session.createQuery(queryStr).list();
					RelModel r;
					for (Iterator iter = list.iterator(); iter.hasNext(); session.update(r))
					{
						r = (RelModel)iter.next();
						r.setListType(lim.type);
					}

				}
				if (fm != null && itemTable != null && itemTable.equals(table))
					set.add(fm);
			}
		}

		MsgField fm;
		for (it = set.iterator(); it.hasNext(); session.save(fm))
			fm = (MsgField)it.next();

	}

	public Answer load_file()
		throws Exception
	{
		Answer ans;
		String path;
		FileInputStream fis;
		ObjectInputStream oos;
		ans = new Answer();
		path = getPath();
		fis = null;
		oos = null;
		File file;
		file = new File(path);
		if (file.exists())
			break MISSING_BLOCK_LABEL_49;
		ans.tableModel = new TableModel();
		return ans;
		try
		{
			fis = new FileInputStream(file);
			oos = new ObjectInputStream(fis);
			ans.tableModel = (TableModel)oos.readObject();
			oos.close();
			fis.close();
			file = new File(getJsPath(path));
			if (file.exists())
				ans.tableModel.javaScript = FileOperator.read(file);
		}
		catch (Exception e)
		{
			if (fis != null)
				fis.close();
			if (oos != null)
				oos.close();
			throw e;
		}
		return ans;
	}

	private Answer preview()
		throws Exception
	{
		Answer ans = new Answer();
		String tempStr = cmd.tableModel.toString();
		ParseTemplate p = new ParseTemplate(tempStr);
		StringBuffer sb = new StringBuffer();
		if (tempStr.length() > 0)
			sb.append(p.getHtml());
		sb.append("\r\n");
		ans.previewHtml = formLayoutServer.addPreview(sb.toString());
		return ans;
	}

	public Answer get_dict_list()
		throws Exception
	{
		Answer ans = new Answer();
		List list = session.createQuery("from MsgDict").list();
		Object array[] = list.toArray();
		ans.dictList = new MsgDict[array.length];
		for (int i = 0; i < array.length; i++)
			ans.dictList[i] = (MsgDict)array[i];

		return ans;
	}

	public Answer write_file()
		throws Exception
	{
		Answer ans = new Answer();
		writeFile(cmd.tableModel.tabName, null);
		return ans;
	}

	private void getRelationList(String tableName, Set tableSet, Set relSet)
		throws Exception
	{
		String queryStr = (new StringBuilder("from RelModel r where (r.table_host='")).append(tableName).append("')").toString();
		queryStr = (new StringBuilder(String.valueOf(queryStr))).append("or (r.table_related='").append(tableName).append("')").toString();
		List list = session.createQuery(queryStr).list();
		for (int i = 0; i < list.size(); i++)
			relSet.add(list.get(i));

		for (int i = 0; i < list.size(); i++)
		{
			RelModel rm = (RelModel)list.get(i);
			if (tableSet.add(rm.table_host))
				getRelationList(rm.table_host, tableSet, relSet);
			if (tableSet.add(rm.table_related))
				getRelationList(rm.table_related, tableSet, relSet);
		}

	}

	public List getDirectRelationList(String tableName)
	{
		String queryStr = (new StringBuilder("from RelModel r where (r.table_host='")).append(tableName).append("')").toString();
		queryStr = (new StringBuilder(String.valueOf(queryStr))).append("or (r.table_related='").append(tableName).append("') order by r.type desc").toString();
		List list = session.createQuery(queryStr).list();
		List resultList = new LinkedList();
		for (int i = 0; i < list.size(); i++)
		{
			RelModel rel = (RelModel)list.get(i);
			RelModel r = new RelModel();
			r.column_host = rel.column_host;
			r.column_related = rel.column_related;
			r.id = rel.id;
			r.inverse = rel.inverse;
			r.mid_table = rel.mid_table;
			r.mid_table_host = rel.mid_table_host;
			r.mid_table_related = rel.mid_table_related;
			r.name_class = rel.name_class;
			r.name_related = rel.name_related;
			r.table_host = rel.table_host;
			r.table_related = rel.table_related;
			r.type = rel.type;
			if (r.getTable_related().equals(tableName))
			{
				String temp = r.table_host;
				r.table_host = r.table_related;
				r.table_related = temp;
				temp = r.column_host;
				r.column_host = r.column_related;
				r.column_related = temp;
				temp = r.mid_table_host;
				r.mid_table_host = r.mid_table_related;
				r.mid_table_related = temp;
				if (r.type == 1)
					r.type = 2;
				else
				if (r.type == 2)
					r.type = 1;
				if (r.inverse != null && r.inverse.equals("1"))
					r.inverse = "0";
				else
					r.inverse = "1";
			}
			resultList.add(r);
		}

		return resultList;
	}

	public void writeFile(String tableName, Map paramMap)
		throws Exception
	{
		GeneratorTask myTask = new GeneratorTask();
		myTask.setDriver(cfg.getProperty("hibernate.connection.driver_class"));
		myTask.setDatabaseURL(cfg.getProperty("hibernate.connection.url"));
		myTask.setUsername(cfg.getProperty("hibernate.connection.username"));
		myTask.setPassword(cfg.getProperty("hibernate.connection.password"));
		Connection conn = session.connection();
		myTask.setCatalog(null);
		DatabaseMetaData TableMeta = session.connection().getMetaData();
		boolean ret = TableMeta.getDatabaseProductName().toLowerCase().indexOf("oracle") != -1;
		String schmea = null;
		if (ret)
			schmea = TableMeta.getUserName();
		else
			schmea = "dbo";
		myTask.setSchema(schmea);
		myTask.setIncludeViews(false);
		LinkedList keys = new LinkedList();
		ResultSet primaryRs = conn.getMetaData().getPrimaryKeys(null, null, tableName);
		int primaryCount = 0;
		for (; primaryRs.next(); keys.add(new String(primaryRs.getString(4))))
			primaryCount++;

		List relationList = getDirectRelationList(tableName);
		GenerateParameter parameter = new GenerateParameter(tableName, relationList, getTempPathForFileCreate());
		parameter.setTableNameKeyColumn((String)keys.get(0));
		myTask.setCurrentUserPlugin(getTempPathForFileCreate(), parameter, paramMap);
		modifyTaskForWriteFile(tableName, myTask, conn, parameter);
		myTask.execute();
		PresentCodeGen gen = new PresentCodeGen(parameter);
		gen.process();
		session.close();
	}

	public void modifyTaskForWriteFile(String tabName, GeneratorTask myTask, Connection conn, GenerateParameter parameter)
		throws Exception
	{
		Set relSet = new HashSet();
		getRelationList(tabName, new HashSet(), relSet);
		Iterator ite = relSet.iterator();
		ArrayList list = new ArrayList(relSet);
		int size = list.size();
		Set tableSet = new HashSet();
		tableSet.add(tabName);
		Set midTableSet = new HashSet();
		Vector relVector = new Vector();
		Vector many2manyVector = new Vector();
		for (int i = 0; i < size; i++)
		{
			RelModel rel = (RelModel)list.get(i);
			if (rel.inverse != null && rel.inverse.equals("0"))
			{
				rel.inverse = "1";
				String temp = rel.column_host;
				rel.column_host = rel.column_related;
				rel.column_related = temp;
				temp = rel.table_host;
				rel.table_host = rel.table_related;
				rel.table_related = temp;
				temp = rel.mid_table_host;
				rel.mid_table_host = rel.mid_table_related;
				rel.mid_table_related = temp;
				if (rel.type == 2)
					rel.type = 1;
				else
				if (rel.type == 1)
					rel.type = 2;
			}
			if (rel.type == 3)
			{
				RelModel rel1 = new RelModel();
				RelModel rel2 = new RelModel();
				rel1.table_related = rel.mid_table;
				rel1.table_host = rel.table_host;
				rel1.column_related = rel.mid_table_host;
				rel1.column_host = rel.column_host;
				rel1.type = 2;
				rel2.table_related = rel.mid_table;
				rel2.table_host = rel.table_related;
				rel2.column_related = rel.mid_table_related;
				rel2.column_host = rel.column_related;
				rel2.type = 2;
				tableSet.add(rel.mid_table);
				midTableSet.add(rel.mid_table);
				relVector.add(rel1);
				relVector.add(rel2);
				many2manyVector.add(rel);
			} else
			{
				relVector.add(rel);
			}
			tableSet.add(rel.getTable_host());
			tableSet.add(rel.getTable_related());
		}

		size = relVector.size();
		RelModel rels[] = new RelModel[size];
		for (int i = 0; i < size; i++)
			rels[i] = (RelModel)relVector.get(i);

		size = many2manyVector.size();
		RelModel many2many[] = new RelModel[size];
		for (int i = 0; i < size; i++)
			many2many[i] = (RelModel)many2manyVector.get(i);

		size = tableSet.size();
		String tables[] = new String[size];
		Object tempArray[] = tableSet.toArray();
		LinkedList keys[] = new LinkedList[size];
		Map table_key_map = new HashMap();
		for (int i = 0; i < size; i++)
		{
			tables[i] = (String)tempArray[i];
			ResultSet primaryRs = conn.getMetaData().getPrimaryKeys(null, null, tables[i]);
			int primaryCount = 0;
			keys[i] = new LinkedList();
			for (; primaryRs.next(); keys[i].add(new String(primaryRs.getString(4))))
				primaryCount++;

			table_key_map.put(tables[i], keys[i]);
		}

		for (int i = 0; i < tables.length; i++)
		{
			TableElement tableElment = new TableElement();
			System.out.println("TableElement tableElment = new TableElement();");
			tableElment.setName(tables[i]);
			System.out.println((new StringBuilder("tableElment.setName(\"")).append(tables[i]).append("\");").toString());
			tableElment.setGenerate(!midTableSet.contains(tables[i]));
			System.out.println((new StringBuilder("tableElment.setGenerate(")).append(!midTableSet.contains(tables[i])).append(")").toString());
			myTask.addConfiguredTable(tableElment);
			System.out.println("myTask.addConfiguredTable(tableElment);");
		}

		for (int i = 0; i < tables.length; i++)
		{
			myTask.addTablePrimaryKeys(tables[i], keys[i]);
			System.out.println((new StringBuilder("myTask.addTablePrimaryKeys(\"")).append(tables[i]).append("\",").append(keys[i]).append(")").toString());
		}

		for (int i = 0; i < rels.length; i++)
		{
			CrossrefElement element = new CrossrefElement();
			element.setName((new StringBuilder(String.valueOf(rels[i].table_host))).append("-").append(rels[i].table_related).toString());
			System.out.println((new StringBuilder("element.setName(\"")).append(rels[i].table_host).append("-").append(rels[i].table_related).append(");").toString());
			element.setFkTable(rels[i].table_related);
			System.out.println((new StringBuilder("element.setFkTable(")).append(rels[i].table_related).append(");").toString());
			element.setFkColumn(rels[i].column_related);
			System.out.println((new StringBuilder("element.setFkColumn(")).append(rels[i].column_related).append(");").toString());
			if (rels[i].type == 0)
			{
				List keyList = (List)(List)table_key_map.get(rels[i].table_related);
				if (!keyList.contains(rels[i].column_related))
				{
					element.setUnique(true);
					System.out.println("element.setUnique(true);");
				}
			}
			element.setPkColumn(rels[i].column_host);
			System.out.println((new StringBuilder("element.setPkColumn(")).append(rels[i].column_host).append(");").toString());
			myTask.addConfiguredRelation(rels[i].table_host, element);
			System.out.println((new StringBuilder("myTask.addConfiguredRelation(")).append(rels[i].table_host).append(",element);").toString());
			if (rels[i].type == 1)
			{
				parameter.getShowListType().put((new StringBuilder(String.valueOf(rels[i].table_host))).append(rels[i].table_related).toString(), rels[i].getListType());
				parameter.getShowListType().put((new StringBuilder(String.valueOf(rels[i].table_related))).append(rels[i].table_host).toString(), rels[i].getListType());
			}
		}

		for (int i = 0; i < many2many.length; i++)
		{
			myTask.addConfiguredMany2Many(many2many[i].table_host, many2many[i].mid_table, many2many[i].table_related, true);
			System.out.println((new StringBuilder("myTask.addConfiguredMany2Many(")).append(many2many[i].table_host).append(",").append(many2many[i].mid_table).append(",").append(many2many[i].table_related).append(");").toString());
		}

	}

	private static String getTempPathForFileCreate()
	{
		if (tempPathForFileCreate == null)
		{
			String path = getBasePath();
			tempPathForFileCreate = (new StringBuilder(String.valueOf(path.substring(0, path.length() - 7)))).append("forFileCreate").toString();
		}
		return tempPathForFileCreate;
	}

	public static String getBasePath()
	{
		return ApplicationPath.getAppliactionPath().replaceAll("\\\\", "/");
	}

	public Answer get_backup_list()
	{
		Answer ans = new Answer();
		String tableName = cmd.msgTable.name;
		File file = new File((new StringBuilder(String.valueOf(getLayoutBasePath()))).append("/layout/").append(tableName).append("/").toString());
		if (file.exists())
		{
			File list[] = file.listFiles();
			Vector vector = new Vector();
			for (int i = 0; i < list.length; i++)
				if (!list[i].equals(file))
				{
					String name = list[i].getName();
					if (name.length() > 4 && name.substring(name.length() - 4).equals(".lay"))
						vector.add(name.substring(0, name.length() - 4));
				}

			ans.fileNameList = new String[vector.size()];
			for (int i = 0; i < ans.fileNameList.length; i++)
				ans.fileNameList[i] = (String)vector.get(i);

		} else
		{
			ans.fileNameList = new String[0];
		}
		return ans;
	}

}
