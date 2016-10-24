// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TableOpenDialog.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.msg.MsgManager;
import com.iscp.sys.formLayout.msg.MsgTable;
import com.iscp.sys.formLayout.view.MainPane;
import com.iscp.sys.formLayout.view.TableView;
import com.iscp.sys.formLayout.view.base.MyMenu;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.MouseEvent;
import java.util.HashSet;
import java.util.Set;
import javax.swing.*;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			TableOpenDialog_ActionListener, LayoutListRenderer, Layout_listMouseListener, LayoutListNode

public class TableOpenDialog extends JDialog
{

	private MainPane mainPane;
	private DefaultListModel layout_list_model;
	private JList layout_list;
	private MsgTable table;
	private MyMenu menu;
	private JButton cmd_ok;
	private JButton cmd_cancel;

	public TableOpenDialog(MainPane mainPane)
	{
		super(TableView.getFrame(mainPane), "??????", true);
		cmd_ok = new JButton("???");
		cmd_cancel = new JButton("???");
		this.mainPane = mainPane;
		setSize(300, 200);
		initList();
		Box box = Box.createVerticalBox();
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.getViewport().add(layout_list);
		box.add(scrollPane);
		JPanel pane = new JPanel();
		box.add(pane);
		cmd_ok.addActionListener(new TableOpenDialog_ActionListener(this, cmd_ok));
		cmd_cancel.addActionListener(new TableOpenDialog_ActionListener(this, cmd_cancel));
		pane.add(cmd_ok);
		pane.add(cmd_cancel);
		pane.setMaximumSize(new Dimension(200, 20));
		getContentPane().add(box);
	}

	private void initList()
	{
		layout_list_model = new DefaultListModel();
		layout_list = new JList();
		layout_list.setModel(layout_list_model);
		layout_list.setCellRenderer(new LayoutListRenderer());
		layout_list.addMouseListener(new Layout_listMouseListener(this));
		try
		{
			MsgTable mt[] = MsgManager.getTableList(mainPane);
			Set set = new HashSet();
			for (int i = 0; i < mt.length; i++)
				if (set.add(mt[i].getName()))
					layout_list_model.addElement(new LayoutListNode(mt[i]));

		}
		catch (Exception e)
		{
			MainPane.showErrorMessageDialog(this, "????????งา????", e);
		}
	}

	public void layout_tree_mouseClicked(MouseEvent e)
	{
		if (e.getButton() == 3)
			menu.show(this, e.getX(), e.getY());
		else
		if (e.getClickCount() == 2)
			openLayout();
	}

	private void openLayout()
	{
		table = null;
		LayoutListNode node = (LayoutListNode)layout_list.getSelectedValue();
		if (node != null)
		{
			table = node.getTable();
			setVisible(false);
		}
	}

	public static MsgTable openLayout(MainPane mainPane)
	{
		TableOpenDialog d = new TableOpenDialog(mainPane);
		d.setVisible(true);
		return d.table;
	}

	void actionPerformed(ActionEvent e, JButton b)
	{
		if (b == cmd_ok)
			openLayout();
		else
		if (b == cmd_cancel)
			setVisible(false);
	}

	public void layout_list_mouseClicked(MouseEvent e)
	{
		if (e.getButton() == 1 && e.getClickCount() == 2)
			openLayout();
	}
}
