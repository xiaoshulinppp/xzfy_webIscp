// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   FormRenew.java

package com.iscp.sys.formLayout;

import com.iscp.sys.formLayout.model.CellModel;
import com.iscp.sys.formLayout.model.FieldItemModel;
import com.iscp.sys.formLayout.model.FieldTextItemModel;
import com.iscp.sys.formLayout.model.TableModel;
import com.iscp.sys.formLayout.msg.Command;
import com.taiji.core.generator.GenerateParameter;
import com.taiji.core.generator.configen.PresentCodeGen;
import com.taiji.system.domain.Field;
import java.io.*;
import java.util.Vector;

// Referenced classes of package com.iscp.sys.formLayout:
//			Execute, FileOperator

public class FormRenew
{

	public FormRenew()
	{
	}

	public static void renew(String tableName, Field field)
		throws Exception
	{
		TableModel tableModel = load_file(tableName);
		if (tableModel == null)
			return;
		Object cells[] = tableModel.cells.toArray();
		for (int i = 0; i < cells.length; i++)
		{
			com.iscp.sys.formLayout.model.ItemModel im = ((CellModel)cells[i]).getItemModel();
			if (im instanceof FieldTextItemModel)
			{
				FieldTextItemModel ftim = (FieldTextItemModel)im;
				if (ftim.table.equals(tableName) && ftim.table.equals(field.getName()))
					ftim.text = field.getShowName();
			} else
			if (im instanceof FieldItemModel)
			{
				FieldItemModel fim = (FieldItemModel)im;
				if (fim.table.equals(tableName) && fim.table.equals(field.getName()))
				{
					fim.setType(field.getType());
					fim.setShowType(field.getShowType());
					fim.default_ = field.getDefaultValue();
				}
			}
		}

		if (tableModel != null)
		{
			GenerateParameter parameter = new GenerateParameter(tableName, null, null);
			PresentCodeGen gen = new PresentCodeGen(parameter, tableModel.toString());
			System.out.println("#################################");
			System.out.println(tableModel.toString());
			System.out.println("#################################");
			gen.generatePropertyFile();
		}
	}

	public static TableModel load_file(String tableName)
		throws Exception
	{
		Execute exec;
		String path;
		FileInputStream fis;
		ObjectInputStream oos;
		TableModel tableModel;
		exec = new Execute(null);
		Command cmd = new Command();
		cmd.basePath = (new StringBuilder("/layout/")).append(tableName).append("/").append(tableName).append(".lay").toString();
		exec.setCommand(cmd);
		path = exec.getPath();
		fis = null;
		oos = null;
		tableModel = null;
		File file;
		file = new File(path);
		if (file.exists())
			break MISSING_BLOCK_LABEL_94;
		tableModel = null;
		return tableModel;
		try
		{
			fis = new FileInputStream(file);
			oos = new ObjectInputStream(fis);
			tableModel = (TableModel)oos.readObject();
			oos.close();
			fis.close();
			file = new File(exec.getJsPath(path));
			if (file.exists())
				tableModel.javaScript = FileOperator.read(file);
		}
		catch (Exception e)
		{
			if (fis != null)
				fis.close();
			if (oos != null)
				oos.close();
			throw e;
		}
		return tableModel;
	}
}
