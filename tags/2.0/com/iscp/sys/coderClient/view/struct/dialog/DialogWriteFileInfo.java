// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   DialogWriteFileInfo.java

package com.iscp.sys.coderClient.view.struct.dialog;

import com.iscp.sys.coderClient.InfoGatherMapTool;
import com.iscp.sys.coderClient.MapTool;
import com.iscp.sys.coderClient.view.pattern.RectPattern;
import com.iscp.sys.coderClient.view.struct.BeanOperPane;
import com.iscp.sys.coderMsg.MsgManager;
import com.iscp.sys.coderMsg.TableModel;
import java.awt.Container;
import java.awt.Frame;
import java.util.HashMap;
import java.util.Map;
import javax.swing.*;

// Referenced classes of package com.iscp.sys.coderClient.view.struct.dialog:
//			DialogWriteFile, MyOptionPane

public class DialogWriteFileInfo extends DialogWriteFile
{

	private static String DEFAULTLAYOUT = "缺省布局";
	private Map positionExpMap;
	private JComboBox positionSelect;

	public DialogWriteFileInfo(Frame frame, BeanOperPane pane, TableModel table, TableModel relTables[])
	{
		super(frame, pane, table, relTables);
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

		String position = (String)positionExpMap.get(positionSelect.getSelectedItem());
		Map paramMap = new HashMap();
		paramMap.put("position", position);
		try
		{
			MsgManager.writefile(table, relTables, layoutMap, pane, paramMap);
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
		positionExpMap = new HashMap();
		setLabelWidth(150);
		setTextWidth(350);
		positionSelect = new JComboBox();
		for (Container c = pane; c != null;)
		{
			c = c.getParent();
			if (c instanceof MapTool)
			{
				String positionExps[] = (String[])((InfoGatherMapTool)c).getParamMap().get("position");
				DefaultComboBoxModel positionExpsListModel = new DefaultComboBoxModel();
				for (int i = 0; i < positionExps.length; i++)
				{
					String items[] = positionExps[i].split("\\[");
					if (items.length > 1)
					{
						positionExpsListModel.addElement(items[1]);
						positionExpMap.put(items[1], items[0]);
					}
				}

				positionSelect.setModel(positionExpsListModel);
				break;
			}
		}

		addItem("报送方案", positionSelect);
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

	public static void showDialogWriteFile(Frame frame, BeanOperPane pane, TableModel table, TableModel relTables[])
	{
		(new DialogWriteFileInfo(frame, pane, table, relTables)).show();
	}

}
