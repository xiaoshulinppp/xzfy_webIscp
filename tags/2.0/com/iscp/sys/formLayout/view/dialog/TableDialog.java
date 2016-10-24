// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TableDialog.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.model.TableModel;
import com.iscp.sys.formLayout.view.MyMenuSourcePane;
import com.iscp.sys.formLayout.view.base.MyMenu;
import com.iscp.sys.formLayout.view.base.MyMenuItem;
import java.awt.*;
import java.awt.event.*;
import java.util.Vector;
import javax.swing.*;

public class TableDialog extends JDialog
	implements MyMenuSourcePane
{

	private TableModel table;
	private JTextField logName_;
	private JTextField showName_;
	private JTextArea tableDesc_;
	private JList javascripts_;
	private DefaultListModel listModel;
	private JButton b_ok;
	private JButton b_cancel;
	private MyMenu jsMenu;
	private MyMenuItem add_js;
	private MyMenuItem remove_js;

	public TableDialog(Frame frame, TableModel table, String title, boolean modal)
	{
		super(frame, title, true);
		logName_ = new JTextField();
		showName_ = new JTextField();
		tableDesc_ = new JTextArea();
		javascripts_ = new JList();
		b_ok = new JButton("???");
		b_cancel = new JButton("???");
		add_js = new MyMenuItem("????", "");
		remove_js = new MyMenuItem("???", "");
		Box box = Box.createVerticalBox();
		listModel = new DefaultListModel();
		javascripts_.setModel(listModel);
		jsMenu = new MyMenu(this);
		jsMenu.add(add_js);
		jsMenu.add(remove_js);
		javascripts_.addMouseListener(new MouseListener() {

			final TableDialog this$0;

			public void mouseClicked(MouseEvent mouseevent)
			{
			}

			public void mousePressed(MouseEvent e)
			{
				if (e.getButton() == 3)
					jsMenu.show(javascripts_, e.getX(), e.getY());
			}

			public void mouseReleased(MouseEvent mouseevent)
			{
			}

			public void mouseEntered(MouseEvent mouseevent)
			{
			}

			public void mouseExited(MouseEvent mouseevent)
			{
			}

			
			{
				this$0 = TableDialog.this;
				super();
			}
		});
		box.add(input("???????", logName_, true));
		box.add(input("?????", showName_, true));
		box.add(input("???", tableDesc_, false, false));
		box.add(input("js???", javascripts_, false, false));
		Box cmd_box = Box.createHorizontalBox();
		box.add(cmd_box);
		cmd_box.add(b_ok);
		cmd_box.add(b_cancel);
		b_ok.addActionListener(new ActionListener() {

			final TableDialog this$0;

			public void actionPerformed(ActionEvent e)
			{
				cmd_ok();
			}

			
			{
				this$0 = TableDialog.this;
				super();
			}
		});
		b_cancel.addActionListener(new ActionListener() {

			final TableDialog this$0;

			public void actionPerformed(ActionEvent e)
			{
				cmd_cancel();
			}

			
			{
				this$0 = TableDialog.this;
				super();
			}
		});
		getContentPane().add(box);
		setSize(360, 200);
		setTable(table);
	}

	public void cmd_ok()
	{
		if (logName_.getText().length() <= 0)
		{
			JOptionPane.showMessageDialog(this, "????????????");
			logName_.requestFocus();
		}
		if (showName_.getText().length() <= 0)
		{
			JOptionPane.showMessageDialog(this, "??????????");
			showName_.requestFocus();
		}
		table.tableDesc = tableDesc_.getText();
		table.logName = logName_.getText();
		table.showName = showName_.getText();
		table.javascripts = new Vector();
		for (int i = 0; i < listModel.size(); i++)
			table.javascripts.add(listModel.get(i));

		setVisible(false);
	}

	public void cmd_cancel()
	{
		setVisible(false);
	}

	public Box input(String title, JComponent c, boolean notNull)
	{
		return input(title, c, notNull, true);
	}

	public Box input(String title, JComponent c, boolean notNull, boolean oneline)
	{
		Box box = Box.createHorizontalBox();
		JLabel label = new JLabel();
		label.setText((new StringBuilder("<html><body><p width=\"100\" align=\"right\">")).append(title).append("</p></body></html>").toString());
		if (notNull)
			label.setForeground(Color.red);
		box.add(label);
		if (oneline)
		{
			box.setMaximumSize(new Dimension(30000, 20));
			box.add(c);
		} else
		{
			JScrollPane scrollPane = new JScrollPane();
			scrollPane.getViewport().add(c);
			box.add(scrollPane);
		}
		box.setPreferredSize(new Dimension(300, 20));
		label.setMaximumSize(new Dimension(100, 20));
		return box;
	}

	public void setTable(TableModel table)
	{
		this.table = table;
		Vector jss = table.javascripts;
		for (int i = 0; i < jss.size(); i++)
			listModel.addElement(jss.get(i));

		if (table.logName != null)
			logName_.setText(table.logName);
		if (table.tableDesc != null)
			tableDesc_.setText(table.tableDesc);
		if (table.showName != null)
			showName_.setText(table.showName);
	}

	public void menuActionPerformed(ActionEvent e, MyMenuItem menu)
	{
		if (menu == add_js)
		{
			String js = JOptionPane.showInputDialog(this, "??????js?????");
			if (js != null)
				listModel.addElement(js);
		} else
		if (menu == remove_js)
		{
			int index = javascripts_.getSelectedIndex();
			if (index >= 0)
				listModel.remove(index);
		}
	}


}
