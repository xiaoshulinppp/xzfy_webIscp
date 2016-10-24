// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyFileDialog.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.model.TableModel;
import com.iscp.sys.formLayout.msg.MsgManager;
import com.iscp.sys.formLayout.view.MainPane;
import com.iscp.sys.formLayout.view.MyMenuSourcePane;
import com.iscp.sys.formLayout.view.base.MyMenu;
import com.iscp.sys.formLayout.view.base.MyMenuItem;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.MouseEvent;
import java.util.HashMap;
import java.util.Map;
import javax.swing.*;
import javax.swing.event.TreeExpansionEvent;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.tree.*;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			FileList_Renderer, FileList_mouseListener, Directory_treeWillExpandListener, Directory_treeExpansionListener, 
//			Directory_treeSelectionListener, Directory_treeMouseListener, Directory_treeRenderer, ButtonActionListener

public class MyFileDialog extends JDialog
	implements MyMenuSourcePane
{

	public static final int OPEN_FILE = 0;
	public static final int SAVE_FILE = 1;
	public static final int SAVE_AS = 2;
	public Map fileListMap;
	public JList fileList;
	public JTree directoryTree;
	public JTextField fileNameField;
	private JComponent msgComponent;
	private TableModel tableModel;
	private int type;
	private MainPane mainPane;
	private JButton b_ok;
	private JButton b_cancel;
	private MyMenu menu;
	private MyMenuItem directory_renew_m;
	private MyMenuItem directory_create_m;
	private MyMenuItem directory_remove_m;
	private MyMenuItem file_remove_m;

	public MyFileDialog(Frame frame, MainPane mainPane, int type, String title)
	{
		this(frame, mainPane.getTableModel(), ((JComponent) (mainPane)), type, title, true, mainPane);
	}

	public MyFileDialog(Frame frame, TableModel tableModel, JComponent msgComponent, int type, String title, boolean modal, MainPane mainPane)
	{
		super(frame, title, modal);
		fileListMap = new HashMap();
		fileList = new JList();
		directoryTree = new JTree();
		fileNameField = new JTextField();
		b_ok = new JButton("???");
		b_cancel = new JButton("???");
		this.tableModel = tableModel;
		this.msgComponent = msgComponent;
		this.type = type;
		this.mainPane = mainPane;
		if (type == 2)
			b_ok.setText("????");
		else
		if (type == 0)
			b_ok.setText("??");
		init();
		initMenu();
		try
		{
			String fileNameList[] = MsgManager.getFileList(msgComponent, "/layout");
			fileList.setModel(new DefaultListModel());
			for (int i = 0; i < fileNameList.length; i++)
				((DefaultListModel)fileList.getModel()).addElement(fileNameList[i]);

			DefaultMutableTreeNode root = new DefaultMutableTreeNode("layout");
			directoryTree.setModel(new DefaultTreeModel(root));
			TreePath treePath = directoryTree.getPathForRow(0);
			expandPath(treePath);
			directoryTree.expandPath(treePath);
			directoryTree.setSelectionPath(treePath);
		}
		catch (Exception e)
		{
			MainPane.showErrorMessageDialog(this, e);
		}
	}

	public String getFilePath(TreePath path)
	{
		Object o[] = path.getPath();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < o.length; i++)
			sb.append((new StringBuilder("/")).append(o[i].toString()).toString());

		return sb.toString();
	}

	public void expandPath(TreePath path)
		throws Exception
	{
		DefaultMutableTreeNode root = (DefaultMutableTreeNode)path.getLastPathComponent();
		String directoryList[] = MsgManager.getDirectoryList(msgComponent, getFilePath(path));
		root.removeAllChildren();
		for (int i = 0; i < directoryList.length; i++)
		{
			DefaultMutableTreeNode node = new DefaultMutableTreeNode(directoryList[i]);
			node.add(new DefaultMutableTreeNode("**"));
			root.add(node);
		}

	}

	private void init()
	{
		setSize(600, 500);
		JSplitPane splitPane = new JSplitPane();
		splitPane.setDividerLocation(100);
		getContentPane().add(splitPane);
		JScrollPane fileListScrollPane = new JScrollPane();
		fileListScrollPane.getViewport().add(fileList);
		fileList.setCellRenderer(new FileList_Renderer());
		Box box = Box.createVerticalBox();
		fileNameField.setMaximumSize(new Dimension(10000, 30));
		box.add(fileListScrollPane);
		splitPane.setRightComponent(box);
		JPanel panel = new JPanel();
		panel.setLayout(new BoxLayout(panel, 0));
		box.add(panel);
		JLabel b = new JLabel("?????:");
		b.setMaximumSize(new Dimension(150, 30));
		panel.add(b);
		panel.add(fileNameField);
		panel = new JPanel();
		panel.setLayout(new BoxLayout(panel, 0));
		box.add(panel);
		panel.add(b_ok);
		panel.add(b_cancel);
		fileList.addMouseListener(new FileList_mouseListener(this));
		directoryTree.addTreeWillExpandListener(new Directory_treeWillExpandListener(this));
		directoryTree.addTreeExpansionListener(new Directory_treeExpansionListener(this));
		directoryTree.addTreeSelectionListener(new Directory_treeSelectionListener(this));
		directoryTree.addMouseListener(new Directory_treeMouseListener(this));
		directoryTree.setCellRenderer(new Directory_treeRenderer());
		JScrollPane directoryListScrollPane = new JScrollPane();
		directoryListScrollPane.getViewport().add(directoryTree);
		splitPane.setLeftComponent(directoryListScrollPane);
		b_ok.addActionListener(new ButtonActionListener(this, b_ok));
		b_cancel.addActionListener(new ButtonActionListener(this, b_cancel));
	}

	void directory_treeWillExpand(TreeExpansionEvent e)
	{
		try
		{
			TreePath path = e.getPath();
			DefaultMutableTreeNode node = (DefaultMutableTreeNode)path.getLastPathComponent();
			if (node.getChildAt(0).toString().equals("**"))
				expandPath(e.getPath());
		}
		catch (Exception ee)
		{
			MainPane.showErrorMessageDialog(this, ee);
		}
	}

	void directory_treeExpanded(TreeExpansionEvent treeexpansionevent)
	{
	}

	private void renewFileList(String path)
	{
		try
		{
			DefaultListModel listModel = (DefaultListModel)fileList.getModel();
			String fileNameList[] = MsgManager.getFileList(msgComponent, path);
			listModel.removeAllElements();
			for (int i = 0; i < fileNameList.length; i++)
				listModel.addElement(fileNameList[i]);

		}
		catch (Exception ee)
		{
			MainPane.showErrorMessageDialog(this, ee);
		}
	}

	void directory_tree_valueChanged(TreeSelectionEvent e)
	{
		String path = getFilePath(e.getPath());
		renewFileList(path);
	}

	private void initMenu()
	{
		menu = new MyMenu(this);
		directory_renew_m = new MyMenuItem("???", "");
		directory_create_m = new MyMenuItem("?\275??????", "");
		directory_remove_m = new MyMenuItem("????????", "");
		file_remove_m = new MyMenuItem("??????", "");
		menu.add(directory_renew_m);
		menu.add(directory_create_m);
		menu.add(directory_remove_m);
		menu.add(file_remove_m);
	}

	private void renewMenu(JComponent c)
	{
		directory_renew_m.setVisible(false);
		directory_create_m.setVisible(false);
		directory_remove_m.setVisible(false);
		file_remove_m.setVisible(false);
		if (c == directoryTree)
		{
			directory_renew_m.setVisible(true);
			directory_create_m.setVisible(true);
			directory_remove_m.setVisible(true);
		} else
		if (c == fileList)
			file_remove_m.setVisible(true);
	}

	public void menuActionPerformed(ActionEvent e, MyMenuItem item)
	{
		TreePath path = directoryTree.getSelectionPath();
		if (path != null)
		{
			String filePath = getFilePath(path);
			if (item == directory_renew_m)
				try
				{
					expandPath(path);
					directoryTree.updateUI();
				}
				catch (Exception ee)
				{
					MainPane.showErrorMessageDialog(this, ee);
				}
			else
			if (item == directory_create_m)
				try
				{
					String directory_name = JOptionPane.showInputDialog(this, "???????\275?????????");
					if (directory_name != null)
					{
						MsgManager.newDirectory(msgComponent, getFilePath(path), directory_name);
						expandPath(path);
						directoryTree.updateUI();
					}
				}
				catch (Exception ee)
				{
					MainPane.showErrorMessageDialog(this, ee);
				}
			else
			if (item == directory_remove_m)
			{
				if (JOptionPane.showConfirmDialog(this, (new StringBuilder("????????\274")).append(filePath).append("??").toString(), "????\274", 0) == 0)
					try
					{
						if (MsgManager.isDirectoryEmpty(msgComponent, filePath) || JOptionPane.showConfirmDialog(this, (new StringBuilder("?\274")).append(filePath).append("???????????????????").toString(), "????\274", 0) == 0)
							MsgManager.removeDirectory(msgComponent, filePath);
						expandPath(path.getParentPath());
						directoryTree.updateUI();
					}
					catch (Exception ee)
					{
						MainPane.showErrorMessageDialog(this, ee);
					}
			} else
			if (item == file_remove_m)
			{
				Object files[] = fileList.getSelectedValues();
				if (files != null && files.length > 0 && JOptionPane.showConfirmDialog(this, "?????????§Ö??????", "??????", 0) == 0)
					try
					{
						for (int i = 0; i < files.length; i++)
							MsgManager.removeDirectory(msgComponent, (new StringBuilder(String.valueOf(filePath))).append("/").append(files[i]).toString());

						JOptionPane.showMessageDialog(this, "????????");
						renewFileList(filePath);
					}
					catch (Exception ee)
					{
						MainPane.showErrorMessageDialog(this, "??????????", ee);
					}
			}
		}
	}

	void directory_tree_mouseClicked(MouseEvent e)
	{
		if (e.getButton() == 3)
		{
			renewMenu(directoryTree);
			menu.show(directoryTree, e.getX(), e.getY());
		}
	}

	void fileList_mouseClicked(MouseEvent e)
	{
		if (e.getButton() == 3)
		{
			renewMenu(fileList);
			menu.show(directoryTree, e.getX(), e.getY());
		} else
		if (e.getButton() == 1)
		{
			fileNameField.setText((String)fileList.getSelectedValue());
			if (e.getClickCount() == 2)
				button_actionPerformed(null, b_ok);
		}
	}

	void button_actionPerformed(ActionEvent e, JButton button)
	{
		if (button == b_ok)
		{
			TreePath path = directoryTree.getSelectionPath();
			if (path != null)
			{
				String filePath = getFilePath(path);
				if (type == 2)
					try
					{
						String fileName = fileNameField.getText();
						if (fileName.toLowerCase().indexOf(".lay") < 0)
						{
							fileName = (new StringBuilder(String.valueOf(fileName))).append(".lay").toString();
							fileNameField.setText(fileName);
						}
					}
					catch (Exception ee)
					{
						MainPane.showErrorMessageDialog(this, ee);
					}
				else
				if (type == 0)
					try
					{
						mainPane.setTableModelFromFile(filePath, fileNameField.getText());
						setVisible(false);
					}
					catch (Exception ee)
					{
						MainPane.showErrorMessageDialog(this, ee);
					}
			}
		} else
		if (button == b_cancel)
			setVisible(false);
	}
}
