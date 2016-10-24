// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   LayoutOpenDialog.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.msg.MsgManager;
import com.iscp.sys.formLayout.msg.MsgTable;
import com.iscp.sys.formLayout.view.*;
import com.iscp.sys.formLayout.view.base.MyMenu;
import com.iscp.sys.formLayout.view.base.MyMenuItem;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.MouseEvent;
import java.util.*;
import javax.swing.*;
import javax.swing.tree.*;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			LayoutOpenDialog_ActionListener, Layout_treeRenderer, LayoutTreeNode, Layout_treeMouseListener

public class LayoutOpenDialog extends JDialog
	implements MyMenuSourcePane
{

	private MainPane mainPane;
	private DefaultTreeModel layout_tree_model;
	private DefaultMutableTreeNode layout_tree_root;
	private JTree layout_tree;
	private MsgTable table;
	private MyMenu menu;
	private JButton cmd_ok;
	private JButton cmd_cancel;
	private MyMenuItem remove_table_m;

	public LayoutOpenDialog(MainPane mainPane)
	{
		super(TableView.getFrame(mainPane), "??????", true);
		cmd_ok = new JButton("???");
		cmd_cancel = new JButton("???");
		remove_table_m = new MyMenuItem("????", "");
		this.mainPane = mainPane;
		setSize(300, 500);
		initTree();
		initMenu();
		table = null;
		Box box = Box.createVerticalBox();
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.getViewport().add(layout_tree);
		box.add(scrollPane);
		JPanel pane = new JPanel();
		box.add(pane);
		cmd_ok.addActionListener(new LayoutOpenDialog_ActionListener(this, cmd_ok));
		cmd_cancel.addActionListener(new LayoutOpenDialog_ActionListener(this, cmd_cancel));
		pane.add(cmd_ok);
		pane.add(cmd_cancel);
		getContentPane().add(box);
	}

	private void initMenu()
	{
		menu = new MyMenu(this);
		menu.add(remove_table_m);
	}

	private void initTree()
	{
		layout_tree_root = new DefaultMutableTreeNode("???????");
		layout_tree_model = new DefaultTreeModel(layout_tree_root);
		layout_tree = new JTree();
		layout_tree.setAutoscrolls(true);
		layout_tree.setModel(layout_tree_model);
		layout_tree.setCellRenderer(new Layout_treeRenderer());
		try
		{
			MsgTable tables[] = MsgManager.getTableList(mainPane);
			Map map = new HashMap();
			for (int i = 0; i < tables.length; i++)
				if (map.get(tables[i].name) == null)
				{
					DefaultMutableTreeNode node = new DefaultMutableTreeNode(tables[i].name);
					layout_tree_root.add(node);
					map.put(tables[i].name, node);
				}

			for (int i = 0; i < tables.length; i++)
				((DefaultMutableTreeNode)map.get(tables[i].name)).add(new LayoutTreeNode(tables[i]));

			layout_tree.addMouseListener(new Layout_treeMouseListener(this));
			layout_tree.expandRow(0);
		}
		catch (Exception e)
		{
			e.printStackTrace();
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
		TreePath path = layout_tree.getSelectionPath();
		if (path == null)
			return;
		Object o = path.getLastPathComponent();
		if (path.getPathCount() == 3 && (o instanceof LayoutTreeNode))
		{
			LayoutTreeNode node = (LayoutTreeNode)o;
			table = node.getTable();
			if (table != null)
				setVisible(false);
		}
	}

	public static MsgTable openLayout(MainPane mainPane)
	{
		LayoutOpenDialog d = new LayoutOpenDialog(mainPane);
		d.setVisible(true);
		return d.table;
	}

	public void menuActionPerformed(ActionEvent e, MyMenuItem item)
	{
		if (item == remove_table_m)
		{
			TreePath path[] = layout_tree.getSelectionPaths();
			StringBuffer tableToRemoveMsg = new StringBuffer();
			Vector tableToRemove = new Vector();
			for (int i = 0; i < path.length; i++)
			{
				Object o = path[i].getLastPathComponent();
				if (o instanceof LayoutTreeNode)
				{
					LayoutTreeNode node = (LayoutTreeNode)o;
					tableToRemove.add(node);
					if (tableToRemove.size() > 0)
						tableToRemoveMsg.append(",");
					tableToRemoveMsg.append(node.getTable().logTable);
				}
			}

			if (tableToRemove.size() == 0)
				return;
			int confirmResult = JOptionPane.showConfirmDialog(this, (new StringBuilder("??????????§Ó??????")).append(tableToRemoveMsg).toString(), "???", 0);
			if (confirmResult == 1)
				return;
			try
			{
				for (int i = 0; i < tableToRemove.size(); i++)
				{
					LayoutTreeNode node = (LayoutTreeNode)tableToRemove.get(i);
					MsgManager.removeTable(mainPane, node.getTable());
					((DefaultMutableTreeNode)node.getParent()).remove(node);
				}

			}
			catch (Exception ee)
			{
				MainPane.showErrorMessageDialog(mainPane, ee);
			}
			layout_tree.updateUI();
		}
	}

	void actionPerformed(ActionEvent e, JButton b)
	{
		if (b == cmd_ok)
			openLayout();
		else
		if (b == cmd_cancel)
			setVisible(false);
	}
}
