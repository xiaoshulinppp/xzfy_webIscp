// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   StaticValueDialog.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			InputDialog, DetailPane_ItemInputHeadCellRenderer, InputDialog_ItemInputActionListener

public class StaticValueDialog extends InputDialog
{

	private JTable table;
	private String valueStr;
	private DefaultTableModel tm;
	JButton b_add;
	JButton b_remove;

	public StaticValueDialog(Frame frame, String title, boolean modal, String valueStr)
	{
		super(frame, title, modal);
		tm = new DefaultTableModel();
		b_add = new JButton(" ???? ");
		b_remove = new JButton(" ??? ");
		this.valueStr = valueStr;
		init();
		setViewSize(500, 300);
	}

	public void init()
	{
		table = new JTable();
		table.getTableHeader().setDefaultRenderer(new DetailPane_ItemInputHeadCellRenderer());
		JScrollPane jScrollPane = new JScrollPane();
		jScrollPane.getViewport().add(table);
		Box box = Box.createVerticalBox();
		JPanel jPanel_up = new JPanel();
		JPanel jPanel_down = new JPanel();
		jPanel_up.setMinimumSize(new Dimension(100, 50));
		jPanel_down.setMinimumSize(new Dimension(100, 50));
		box.add(jPanel_up);
		jPanel_down.add(b_ok);
		jPanel_down.add(b_cancel);
		jPanel_down.add(b_add);
		jPanel_down.add(b_remove);
		b_add.addActionListener(new InputDialog_ItemInputActionListener(this, b_add));
		b_remove.addActionListener(new InputDialog_ItemInputActionListener(this, b_remove));
		box.add(jScrollPane);
		box.add(jPanel_down);
		getContentPane().add(box);
		table.setModel(tm);
		tm.addColumn("?????");
		tm.addColumn("?");
		Vector s = new Vector();
		Vector v = new Vector();
		setShow(valueStr, s, v);
		int size = s.size();
		for (int i = 0; i < size; i++)
		{
			String p[] = new String[2];
			p[0] = (String)s.get(i);
			p[1] = (String)v.get(i);
			tm.addRow(p);
		}

	}

	private void setValueStr()
	{
		StringBuffer sb = new StringBuffer();
		int size = tm.getRowCount();
		for (int i = 0; i < size; i++)
		{
			Object show = tm.getValueAt(i, 0);
			Object value = tm.getValueAt(i, 1);
			if (show != null && show.toString().length() > 0 && value != null && value.toString().length() > 0)
			{
				sb.append(show);
				sb.append(":");
				sb.append(value);
				sb.append("|");
			}
		}

		valueStr = sb.toString();
	}

	public void cmd_ok()
	{
		setValueStr();
		setVisible(false);
	}

	public void cmd_cancel()
	{
		setVisible(false);
	}

	public void itemActionPerformed(ActionEvent e, JComponent c)
	{
		if (c == b_add)
		{
			int row = table.getSelectedRow();
			if (row < 0 || row > tm.getRowCount())
				row = tm.getRowCount() - 1;
			tm.insertRow(row + 1, new String[] {
				"", ""
			});
		} else
		if (c == b_remove)
		{
			int rows[] = table.getSelectedRows();
			for (int i = 0; i < rows.length; i++)
			{
				tm.removeRow(rows[i]);
				for (int j = i + 1; j < rows.length; j++)
					if (rows[j] > rows[i])
						rows[j]--;

			}

		}
	}

	public static void setShow(String str, Vector s, Vector v)
	{
		s.removeAllElements();
		v.removeAllElements();
		int start = 0;
		int end = -1;
		do
		{
			start = end + 1;
			end = str.indexOf("|", start);
			if (end < 0)
			{
				if (start >= str.length())
					break;
				end = str.length();
			}
			String p = str.substring(start, end);
			int div = p.indexOf(":");
			if (div >= 0)
			{
				s.add(p.substring(0, div));
				v.add(p.substring(div + 1, p.length()));
			}
		} while (true);
	}

	public static String editStaticValue(Container c, String valueStr)
	{
		Container f;
		for (f = c; f != null; f = f.getParent())
			if (f instanceof Frame)
				break;

		if (f != null)
		{
			StaticValueDialog d = new StaticValueDialog((Frame)f, "??????งา?", true, valueStr);
			d.setVisible(true);
			return d.valueStr;
		} else
		{
			return valueStr;
		}
	}
}
