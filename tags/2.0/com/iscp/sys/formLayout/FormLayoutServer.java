// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   FormLayoutServer.java

package com.iscp.sys.formLayout;

import com.iscp.sys.formLayout.model.CellModel;
import com.iscp.sys.formLayout.model.FieldItemModel;
import com.iscp.sys.formLayout.model.FieldTextItemModel;
import com.iscp.sys.formLayout.model.TableModel;
import com.iscp.sys.formLayout.msg.Answer;
import com.iscp.sys.formLayout.msg.Command;
import com.iscp.sys.formLayout.msg.MsgField;
import com.iscp.sys.formLayout.msg.MsgTable;
import com.taiji.core.util.ApplicationPath;
import java.io.*;
import java.sql.*;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;

// Referenced classes of package com.iscp.sys.formLayout:
//			Execute

public class FormLayoutServer extends HttpServlet
{

	private static final String CONTENT_TYPE = "text/html; charset=GBK";
	private SessionFactory factory;
	private Execute execute;
	private static int MAXPREVIEWCOUNT = 5;
	private int currentIndex;
	private String previewHtmls[];
	public static String headString = null;

	public FormLayoutServer()
	{
		execute = new Execute(this);
		previewHtmls = new String[MAXPREVIEWCOUNT];
	}

	public void init()
		throws ServletException
	{
		String url = getBasePath();
		Configuration cfg = (new Configuration()).configure(new File((new StringBuilder(String.valueOf(url))).append("/hibernate.cfg.xml").toString()));
		cfg.addResource("com/iscp/sys/formLayout/msg/MsgField.hbm.xml");
		cfg.addResource("com/iscp/sys/formLayout/msg/MsgTable.hbm.xml");
		cfg.addResource("com/iscp/sys/formLayout/msg/MsgDict.hbm.xml");
		cfg.addResource("com/iscp/sys/formLayout/msg/RelModel.hbm.xml");
		factory = cfg.buildSessionFactory();
		execute.cfg = cfg;
	}

	public String getHTMLString(String inner)
	{
		if (headString == null)
		{
			StringBuffer sb = new StringBuffer();
			sb.append("<html>");
			sb.append("<head>");
			sb.append("<link rel=\"stylesheet\" href=\"css/12B/style.css\" type=\"text/css\">");
			sb.append("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
			sb.append("<title>\r\n</title>\r\n</head>\r\n");
			headString = sb.toString();
		}
		StringBuffer s = new StringBuffer();
		s.append(headString);
		s.append(inner);
		s.append("</html>");
		return s.toString();
	}

	public String addPreview(String previewHtml)
	{
		previewHtmls[currentIndex] = getHTMLString(previewHtml);
		String id = (new StringBuilder(String.valueOf(currentIndex))).toString();
		currentIndex++;
		if (currentIndex >= MAXPREVIEWCOUNT)
			currentIndex -= MAXPREVIEWCOUNT;
		System.out.println((new StringBuilder("&id&=")).append(id).toString());
		return id;
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		response.setContentType("text/html; charset=GBK");
		String tabName = request.getParameter("tb");
		if (tabName != null)
		{
			Session session = factory.openSession();
			execute.setSession(session);
			try
			{
				execute.writeFile(tabName, null);
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			return;
		}
		String id = request.getParameter("id");
		System.out.println((new StringBuilder("_id_=")).append(id).toString());
		OutputStream os = response.getOutputStream();
		String html = null;
		if (id != null)
		{
			int i = Integer.parseInt(id);
			if (i >= 0 && i < MAXPREVIEWCOUNT)
				html = previewHtmls[i];
		}
		if (html == null)
			html = getHTMLString("??7????????????id?????id??งน");
		os.write(html.getBytes());
		os.flush();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		response.setContentType("text/html; charset=GBK");
		Command command = null;
		Answer answer = new Answer();
		Object answerObjs[] = (Object[])null;
		Object commandObjs[] = (Object[])null;
		try
		{
			ObjectInputStream commandStream = new ObjectInputStream(request.getInputStream());
			Object o = commandStream.readObject();
			commandStream.close();
			if (o instanceof Command)
				command = (Command)o;
			else
			if (o instanceof Object[])
				commandObjs = (Object[])o;
		}
		catch (Exception e)
		{
			answer = new Answer();
			answer.error = e;
			e.printStackTrace();
		}
		try
		{
			if (answer.error == null)
				if (command != null)
					answer = execute(command);
				else
				if (commandObjs != null)
					answerObjs = execute(commandObjs);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			answer.error = e;
		}
		ObjectOutputStream answerStream = new ObjectOutputStream(response.getOutputStream());
		if (command != null)
			answerStream.writeObject(answer);
		else
			answerStream.writeObject(((Object) (answerObjs)));
		answerStream.flush();
	}

	public Answer execute(Command command)
		throws Exception
	{
		Answer answer = null;
		Session session = factory.openSession();
		Transaction tx = null;
		if (command.commandType != 17)
			tx = session.beginTransaction();
		answer = execute.execute(session, command);
		if (command.commandType != 17)
		{
			tx.commit();
			session.close();
		}
		return answer;
	}

	private Object[] execute(Object command[])
	{
		Object ans[] = new Object[2];
		Exception error = null;
		try
		{
			Session session = factory.openSession();
			ans[0] = ((Object) (detailExecute(session, command)));
			if (session.isOpen())
				session.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			error = e;
		}
		ans[1] = error;
		return ans;
	}

	private MsgField[] msgFieldListFilter(MsgField msgFieldList[], String tableName, Connection conn)
		throws Exception
	{
		String key = null;
		ResultSet primaryRs = conn.getMetaData().getPrimaryKeys(null, null, tableName);
		if (primaryRs.next())
			key = primaryRs.getString(4);
		Vector validMsgFields = new Vector();
		for (int i = 0; i < msgFieldList.length; i++)
			if (!msgFieldList[i].getName().equals(key) && !msgFieldList[i].getName().equals("creator"))
				validMsgFields.add(msgFieldList[i]);
			else
			if (msgFieldList[i].getRelatedTable() != null)
				validMsgFields.add(msgFieldList[i]);

		int size = validMsgFields.size();
		MsgField validMsgFieldArray[] = new MsgField[size];
		for (int i = 0; i < size; i++)
			validMsgFieldArray[i] = (MsgField)validMsgFields.get(i);

		return validMsgFieldArray;
	}

	private MsgField[] getDefaultFieldList(String tableName, Connection conn)
		throws Exception
	{
		Vector v = new Vector();
		MsgField mainList[] = getFieldList(tableName);
		for (int i = 0; i < mainList.length; i++)
			if (mainList[i].one_to_one)
			{
				MsgField relatedList[] = getFieldList(mainList[i].getRelatedTable());
				relatedList = msgFieldListFilter(relatedList, mainList[i].getRelatedTable(), conn);
				for (int j = 0; j < relatedList.length; j++)
					if (!mainList[i].getRelatedId().equals(relatedList[j].name))
						v.add(relatedList[j]);

			} else
			{
				v.add(mainList[i]);
			}

		MsgField list[] = new MsgField[v.size()];
		for (int i = 0; i < list.length; i++)
			list[i] = (MsgField)v.get(i);

		return list;
	}

	private MsgField[] getFieldList(String tableName)
		throws Exception
	{
		Command cmd = new Command();
		cmd.msgTable = new MsgTable();
		cmd.msgTable.name = tableName;
		cmd.msgTable.logTable = tableName;
		execute.setCommand(cmd);
		MsgField list[] = execute.get_field_list().msgFieldList;
		return list;
	}

	private void writeLayout(Object layout, String tableName, Session session)
		throws Exception
	{
		TableModel tableModel = null;
		if (layout instanceof String)
		{
			Command cmd = new Command();
			cmd.commandType = 9;
			cmd.basePath = (new StringBuilder("/layout/")).append(tableName).append("/").append(layout).append(".lay").toString();
			tableModel = execute.execute(session, cmd).tableModel;
		} else
		if (layout instanceof Integer)
		{
			Connection conn = session.connection();
			int colCount = ((Integer)layout).intValue();
			MsgField msgFieldList[] = getDefaultFieldList(tableName, conn);
			msgFieldList = msgFieldListFilter(msgFieldList, tableName, conn);
			tableModel = new TableModel(800, 500, msgFieldList.length / colCount + 6, 20, 0);
			TableModel tm = tableModel;
			tableModel.tabName = tableName;
			if (colCount > 3)
				colCount = 3;
			int col = 0;
			int row = 1;
			for (int i = 0; i < msgFieldList.length; i++)
			{
				CellModel title = new CellModel();
				FieldTextItemModel titleItem = new FieldTextItemModel();
				title.setItemModel(titleItem);
				titleItem.text = msgFieldList[i].byName;
				titleItem.field = msgFieldList[i].name;
				titleItem.table = msgFieldList[i].tableName;
				title.top = row;
				title.rowspan = 1;
				title.left = col * 5 + 1;
				title.colspan = 2;
				tm.addCell(title);
				CellModel field = new CellModel();
				FieldItemModel fieldItem = new FieldItemModel();
				field.setItemModel(fieldItem);
				importMsgFieldIntoFieldItem(msgFieldList[i], fieldItem);
				field.top = row;
				field.rowspan = 1;
				field.left = col * 5 + 3;
				field.colspan = 3;
				tm.addCell(field);
				if (++col >= colCount)
				{
					col = 0;
					row++;
				}
			}

		}
		if (tableModel != null)
		{
			Command cmd = new Command();
			cmd.tableModel = tableModel;
			cmd.tableModel.logName = tableModel.tabName;
			try
			{
				execute.setCommand(cmd);
				execute.setSession(session);
				execute.save_file();
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			System.out.println("#################################");
			System.out.println(tableModel.toString());
			System.out.println("#################################");
		}
	}

	private void importMsgFieldIntoFieldItem(MsgField mf, FieldItemModel fim)
	{
		fim.field = mf.name;
		fim.table = mf.tableName;
		fim.action = mf.action;
		fim.default_ = mf.default_;
		fim.dictListId = mf.dictListId;
		fim.setDictType(mf.dictType);
		fim.enu = mf.enu;
		fim.setType(mf.type);
		fim.hidden = fim.type == 7;
		fim.setIsDict(mf.isDict);
		fim.setIsNull(mf.isNull);
		fim.length = mf.length;
		fim.setShowType(mf.showType);
		fim.dictShowType = mf.dictvalShowType;
		fim.dictvalGetType = mf.dictvalGetType;
		String relationTable = mf.getRelatedTable();
		if (relationTable != null)
		{
			if (mf.targetRelationType != null)
				if (mf.targetRelationType.equals("one"))
					fim.showType = 0;
				else
					fim.showType = 6;
			fim.sourceTable = relationTable;
			fim.sourceName = "name";
			fim.sourceId = mf.getRelatedId();
			fim.targetRelationType = mf.getTargetRelationType();
		}
		correctFieldItem(fim);
	}

	private void correctFieldItem(FieldItemModel fim)
	{
		int showType = fim.showType;
		boolean selectableItem = showType == 5 || showType == 6 || showType == 0;
		if (fim.sourceTable != null && fim.sourceTable.length() > 0)
		{
			if (!selectableItem && showType != 7)
				fim.showType = 0;
			fim.isDict = false;
		} else
		if (fim.isDict)
			fim.showType = 1;
		else
		if (selectableItem && (fim.enu == null || fim.enu.length() <= 0))
			fim.showType = 1;
		if (fim.css_class_index < 0 && (fim.css_class == null || fim.css_class.length() == 0))
			fim.css_class = FieldItemModel.SYSTEM_CSS_CLASSES[FieldItemModel.getSelectableCss(fim.showType)[0]];
	}

	private Object[] detailExecute(Session session, Object command[])
		throws Exception
	{
		Object answer[] = (Object[])null;
		execute.setSession(session);
		if (command[0].equals("writeFile"))
		{
			Object param[] = (Object[])command[1];
			String tableName = (String)param[0];
			String relTableNames[] = (String[])param[2];
			Map layoutMap = (Map)param[1];
			boolean writeInfo = param.length > 4 && param[4] != null;
			for (int i = 0; i < relTableNames.length; i++)
			{
				Object layout = layoutMap.get(relTableNames[i]);
				writeLayout(layout, relTableNames[i], session);
			}

			execute.writeFile(tableName.toString(), (Map)param[3]);
			return answer;
		}
		if (command[0].equals("getLayoutList"))
		{
			Object param[] = (Object[])command[1];
			String tableName = (String)param[0];
			File file = new File((new StringBuilder(String.valueOf(Execute.getLayoutBasePath()))).append("/layout/").append(tableName).append("/").toString());
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

				answer = new Object[vector.size()];
				for (int i = 0; i < answer.length; i++)
					answer[i] = (String)vector.get(i);

			} else
			{
				answer = new Object[0];
			}
		}
		return answer;
	}

	public void destroy()
	{
	}

	public static String getBasePath()
	{
		return ApplicationPath.getAppliactionPath().replaceAll("\\\\", "/");
	}

}
