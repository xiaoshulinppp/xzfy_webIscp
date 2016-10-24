// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   DialogWriteFile.java

package com.iscp.sys.coderClient.view.struct.dialog;

import com.iscp.sys.coderClient.view.pattern.RectPattern;
import com.iscp.sys.coderClient.view.struct.BeanOperPane;
import com.iscp.sys.coderMsg.MsgManager;
import com.iscp.sys.coderMsg.TableModel;
import java.awt.Frame;
import java.awt.event.ActionEvent;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;
import javax.swing.*;

// Referenced classes of package com.iscp.sys.coderClient.view.struct.dialog:
//			InputDialog, MyOptionPane, MyIntegerInputDialog

public class DialogWriteFile extends InputDialog
{

	protected static String DEFAULTLAYOUT = "缺省布局";
	protected int colCount[];
	protected JButton formDesignButtons[];
	protected JComboBox layoutSelect[];
	protected BeanOperPane pane;
	protected TableModel relTables[];
	protected TableModel table;

	public DialogWriteFile(Frame frame, BeanOperPane pane, TableModel table, TableModel relTables[])
	{
		super(frame, "生成文件", true);
		this.pane = pane;
		this.table = table;
		this.relTables = relTables;
		init();
	}

	public void cmd_cancel()
	{
		hide();
	}

	public void cmd_ok()
	{
		Map layoutMap = new HashMap();
		int count = 0;
		for (int i = 0; i < relTables.length; i++)
		{
			Object layout = layoutSelect[i].getSelectedItem().toString();
			if (layoutSelect[i].getSelectedIndex() == 0)
				layout = new Integer(colCount[i]);
			layoutMap.put(relTables[i].tabName, layout);
		}

		try
		{
			MsgManager.writefile(table, relTables, layoutMap, pane);
			MyOptionPane.showMessageDialog(pane, "文件生成成功");
		}
		catch (Exception e)
		{
			MyOptionPane.showMessageDialog(this, e.toString());
			e.printStackTrace();
			hide();
		}
	}

	protected void init()
	{
		setLabelWidth(150);
		setTextWidth(350);
		JLabel titleLabel = new JLabel("布局");
		titleLabel.setBackground(RectPattern.MYBLUE);
		layoutSelect = new JComboBox[relTables.length];
		formDesignButtons = new JButton[relTables.length];
		colCount = new int[relTables.length];
		for (int i = 0; i < relTables.length; i++)
		{
			layoutSelect[i] = new JComboBox();
			formDesignButtons[i] = new JButton("...");
			colCount[i] = 2;
		}

		for (int i = 0; i < relTables.length; i++)
		{
			if (relTables[i] != table)
				continue;
			initLayoutSelect(layoutSelect[i], relTables[i].tabName, formDesignButtons[i]);
			break;
		}

		for (int i = 0; i < relTables.length; i++)
			if (relTables[i] != table)
				initLayoutSelect(layoutSelect[i], relTables[i].tabName, formDesignButtons[i]);

	}

	protected void initLayoutSelect(JComboBox select, String tableName, JButton button)
	{
		DefaultComboBoxModel layoutListModel = new DefaultComboBoxModel();
		layoutListModel.addElement(DEFAULTLAYOUT);
		try
		{
			Object layoutList[] = MsgManager.getLayoutList(tableName, pane);
			for (int i = 0; i < layoutList.length; i++)
				layoutListModel.addElement(layoutList[i]);

			if (select == null)
				System.out.println("$$$");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		select.setModel(layoutListModel);
		select.setSelectedIndex(0);
		addItem(tableName, select, new JButton[] {
			button
		}, 20);
	}

	public void itemActionPerformed(ActionEvent e, JComponent c)
	{
		for (int i = 0; i < formDesignButtons.length; i++)
			if (formDesignButtons[i] == c)
			{
				int value;
				if (layoutSelect[i].getSelectedItem().equals(DEFAULTLAYOUT))
					do
					{
						value = MyIntegerInputDialog.showDialog(this, "设置缺省布局的列数", colCount[i]);
						if (value <= 0)
							continue;
						colCount[i] = value;
						break;
					} while (value != -10000);
				return;
			}

	}

	public static void showDialogWriteFile(Frame frame, BeanOperPane pane, TableModel table, TableModel relTables[])
	{
		(new DialogWriteFile(frame, pane, table, relTables)).show();
	}

}
