// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MainPane.java

package com.iscp.sys.formLayout.view;

import com.iscp.sys.formLayout.model.*;
import com.iscp.sys.formLayout.msg.*;
import com.iscp.sys.formLayout.view.base.MyMenu;
import com.iscp.sys.formLayout.view.base.MyMenuItem;
import com.iscp.sys.formLayout.view.base.MyOperPane;
import com.iscp.sys.formLayout.view.base.MySelectMenu;
import com.iscp.sys.formLayout.view.base.MyToolBar;
import com.iscp.sys.formLayout.view.base.ui.MyUIConfig;
import com.iscp.sys.formLayout.view.dialog.DetailPane;
import com.iscp.sys.formLayout.view.dialog.ErrorMessageDialog;
import com.iscp.sys.formLayout.view.dialog.JavaScriptEditorPane;
import com.iscp.sys.formLayout.view.dialog.TableDialog;
import com.iscp.sys.formLayout.view.dialog.TableOpenDialog;
import com.iscp.sys.formLayout.view.dialog.javascripteditor.ScriptEditor;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.MouseEvent;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.tree.*;
import netscape.javascript.JSObject;

// Referenced classes of package com.iscp.sys.formLayout.view:
//			MyMenuSourcePane, TableView, TipView, formLayoutClient, 
//			Database_treeRenderer, Database_treeWillExpandListener, Database_treeMouseListener, DatabaseTableTreeNode, 
//			DatabaseFieldTreeNode

public class MainPane extends JSplitPane
	implements MyOperPane, MsgComponent, MyMenuSourcePane
{

	public boolean Ability_FieldItemRemove;
	public boolean Ability_FieldItemInsert;
	public boolean Ability_FieldItemPropertyEdit;
	public boolean Ability_FieldItemEventEdit;
	public boolean Ability_FieldTextItemEdit;
	public boolean Ability_FieldTextItemRemoveAndInsert;
	public boolean Ability_JavaScriptEdit;
	public boolean Ability_TextItemEdit;
	private TableView tv;
	private JTree database_tree;
	private MyToolBar toolbar;
	public formLayoutClient applet;
	private DetailPane detail;
	private JTabbedPane editTabbedPanel;
	private JavaScriptEditorPane scriptPane;
	private JLabel current_information_label;
	private DefaultMutableTreeNode database_tree_root;
	private DefaultTreeModel database_tree_model;
	private String fileName;
	private String filePath;
	private static final int LOAD_T = 0;
	private static final int SAVE_T = 1;
	private static final int WRITE_FILE_T = 2;
	private static final int TABLE_DETAIL_EDIT = 3;
	private static final int INSERT_TEXT_CELL_T = 4;
	private static final int TAB_TRAVEL_T = 5;
	private static final int JAVASCRIPT_UNDO_T = 6;
	private static final int JAVASCRIPT_REDO_T = 7;
	private static final int JAVASCRIPT_SEARCH_T = 8;
	private static final int TOOLBAR_ITEM_COUNT = 9;
	private boolean changed;
	private MyMenuItem insert_m;
	private MyMenuItem renew_m;
	private MyMenuItem open_m;
	private MyMenu menu;

	public TableView getTableView()
	{
		return tv;
	}

	public MainPane(TableView tv, formLayoutClient applet)
	{
		Ability_FieldItemRemove = false;
		Ability_FieldItemInsert = false;
		Ability_FieldItemPropertyEdit = false;
		Ability_FieldItemEventEdit = false;
		Ability_FieldTextItemEdit = false;
		Ability_FieldTextItemRemoveAndInsert = false;
		Ability_JavaScriptEdit = true;
		Ability_TextItemEdit = false;
		editTabbedPanel = new JTabbedPane();
		current_information_label = new JLabel();
		fileName = null;
		filePath = null;
		changed = false;
		insert_m = new MyMenuItem("????", "");
		renew_m = new MyMenuItem("???", "");
		open_m = new MyMenuItem("??", "");
		menu = new MyMenu(this);
		setDividerLocation(150);
		this.applet = applet;
		this.tv = tv;
		tv.setMainPane(this);
		detail = new DetailPane(tv.getSelectedFieldItem(), this);
		database_tree = new JTree();
		JSplitPane splitPane = new JSplitPane();
		splitPane.setOrientation(0);
		JScrollPane __sp = new JScrollPane();
		__sp.getViewport().add(database_tree);
		splitPane.setTopComponent(__sp);
		JPanel __p = new JPanel();
		__p.setLayout(new BorderLayout());
		splitPane.setBottomComponent(detail);
		splitPane.setDividerLocation(200);
		setLeftComponent(splitPane);
		JPanel operator_pane = new JPanel();
		operator_pane.setLayout(new BoxLayout(operator_pane, 1));
		initToolBar();
		initTree();
		operator_pane.add(toolbar);
		__sp = new JScrollPane();
		__sp.getViewport().add(tv);
		operator_pane.add(editTabbedPanel);
		current_information_label.setEnabled(false);
		current_information_label.setBorder((new JTextField()).getBorder());
		current_information_label.setText("<html><font color=\"#666666\">??¦Ä?????????</font></html>");
		Box current_information_label_box = Box.createHorizontalBox();
		current_information_label_box.add(current_information_label);
		operator_pane.add(current_information_label_box);
		__sp.setRowHeader((new TipView(this)).getViewport());
		editTabbedPanel.add(__sp, "?????");
		scriptPane = new JavaScriptEditorPane(this);
		editTabbedPanel.add(scriptPane, "JavaScript???");
		setRightComponent(operator_pane);
		editTabbedPanel.setTabPlacement(3);
		setChanged(false);
		editTabbedPanel.addChangeListener(new ChangeListener() {

			final MainPane this$0;

			public void stateChanged(ChangeEvent e)
			{
				if (editTabbedPanel.getSelectedComponent() == scriptPane)
					scriptPane.reset();
				resetToolbar();
			}

			
			{
				this$0 = MainPane.this;
				super();
			}
		});
		menuInit();
	}

	private void resetToolbar()
	{
		boolean scriptEditing = editTabbedPanel.getSelectedComponent() == scriptPane;
		toolbar.setValid(1, changed);
		toolbar.setValid(4, tv.getModel().tabName != null);
		toolbar.setValid(5, tv.getModel().tabName != null);
		toolbar.setValid(6, scriptEditing && scriptPane.getEditor().canUndo());
		toolbar.setValid(7, scriptEditing && scriptPane.getEditor().canRedo());
		toolbar.setValid(8, scriptEditing);
		toolbar.repaint();
	}

	public void showScript(String functionStr)
	{
		editTabbedPanel.setSelectedComponent(scriptPane);
		scriptPane.reset();
		scriptPane.setFunctionString(functionStr);
	}

	public void renewSelectItem()
	{
		detail.setFieldItem(tv.getSelectedFieldItem());
		detail.repaint();
	}

	public void hideToolBar()
	{
		toolbar.setVisible(false);
	}

	public Object setHTMLEditorInnerHTML(String html, String align, String valign)
	{
		String param[] = new String[3];
		param[0] = html;
		param[1] = align;
		param[2] = valign;
		callJavaScript("setHTMLEditorInnerHTML", param);
		return null;
	}

	public Object getHTMLEditorInnerHTML()
	{
		String param[] = new String[0];
		return callJavaScript("getHTMLEditorInnerHTML", param);
	}

	public Object callJavaScript(String function, String param[])
	{
		JSObject j = JSObject.getWindow(applet);
		return j.call(function, param);
	}

	public boolean preview()
	{
		try
		{
			String html = MsgManager.preview(this, tv.getModel());
			JSObject j = JSObject.getWindow(applet);
			String param[] = new String[1];
			param[0] = html;
			j.call("change", param);
		}
		catch (Exception e)
		{
			showErrorMessageDialog(this, "??4???", e);
			return false;
		}
		return true;
	}

	public void setItemSelect(MySelectMenu myselectmenu, int i)
	{
	}

	public URL getURL()
		throws Exception
	{
		return applet.getURL();
	}

	private void initTree()
	{
		database_tree_root = new DefaultMutableTreeNode("??????");
		database_tree_model = new DefaultTreeModel(database_tree_root);
		database_tree.setModel(database_tree_model);
		database_tree.setCellRenderer(new Database_treeRenderer());
		try
		{
			database_tree.addTreeWillExpandListener(new Database_treeWillExpandListener(this));
			database_tree.addMouseListener(new Database_treeMouseListener(this));
			database_tree.expandRow(0);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	private void renewTableList()
	{
		try
		{
			database_tree_root.removeAllChildren();
			MsgTable table[] = MsgManager.getTableList(this);
			for (int i = 0; i < table.length; i++)
			{
				DefaultMutableTreeNode tableNode = new DatabaseTableTreeNode(table[i]);
				tableNode.add(new DatabaseFieldTreeNode(null));
				database_tree_root.add(tableNode);
			}

		}
		catch (Exception e)
		{
			showErrorMessageDialog(this, e);
		}
	}

	private void renewFields(DatabaseTableTreeNode node)
	{
		try
		{
			MsgField fields[] = MsgManager.getFieldList(this, node.table);
			node.removeAllChildren();
			for (int i = 0; i < fields.length; i++)
			{
				DatabaseFieldTreeNode dftn = new DatabaseFieldTreeNode(fields[i]);
				if (fields[i].getRelatedTable() != null)
					dftn.add(new DatabaseFieldTreeNode(null));
				node.add(dftn);
			}

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	private void renewFields(DatabaseFieldTreeNode node)
	{
		try
		{
			MsgTable mt = new MsgTable();
			mt.setName(node.field.getRelatedTable());
			MsgField fields[] = MsgManager.getFieldList(this, mt);
			node.removeAllChildren();
			for (int i = 0; i < fields.length; i++)
				if (fields[i].getRelatedTable() == null)
					node.add(new DatabaseFieldTreeNode(fields[i]));

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	void database_tree_mouseClicked(MouseEvent e)
	{
		if (e.getButton() == 1 && e.getClickCount() == 2)
			addTreeNode_to_TableView(database_tree.getSelectionPath());
		else
		if (e.getButton() == 3)
		{
			boolean selected = database_tree.getSelectionPath() != null;
			int row = 0;
			if (selected)
				row = database_tree.getSelectionPath().getPathCount();
			renew_m.setVisible(selected && row == 2);
			insert_m.setVisible(selected && row > 2 || selected && database_tree.getSelectionPaths().length > 1);
			if (!Ability_FieldItemInsert)
				insert_m.setVisible(false);
			menu.show(database_tree, e.getX(), e.getY());
		}
	}

	void database_tree_mousePressed(MouseEvent e)
	{
		e.getButton();
	}

	void database_tree_mouseReleased(MouseEvent e)
	{
		e.getButton();
	}

	public void paint(Graphics g)
	{
		super.paint(g);
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
		correctFieldItem(fim);
	}

	private boolean loadLayoutFile(MsgTable mt)
	{
		String tableName = mt.name;
		String logTableName = mt.logTable;
		String showName = mt.showName;
		String desc = mt.desc;
		String path = (new StringBuilder("/layout/")).append(tableName).append("/").toString();
		try
		{
			TableModel model;
			if (logTableName != null && path != null)
			{
				model = MsgManager.loadFile(this, path, (new StringBuilder(String.valueOf(logTableName))).append(".lay").toString());
			} else
			{
				model = new TableModel();
				model.tabName = tableName;
				model.logName = logTableName;
			}
			tv.setModel(model);
			MsgTable t = new MsgTable();
			model.tabName = tableName;
			model.logName = logTableName;
			t.name = model.tabName;
			t.logTable = model.logName;
			database_tree_root = (DefaultMutableTreeNode)database_tree_model.getRoot();
			database_tree_root.removeAllChildren();
			DatabaseTableTreeNode tableNode = new DatabaseTableTreeNode(t);
			tableNode.add(new DatabaseFieldTreeNode(null));
			database_tree_root.add(tableNode);
			database_tree.updateUI();
			database_tree.expandRow(0);
			database_tree.expandRow(1);
			setChanged(false);
			String logTable = logTableName;
			if (logTableName == null)
				logTable = "?\262???";
			if (showName == null)
				showName = "¦Ä????";
			current_information_label.setToolTipText(desc);
			current_information_label.setText((new StringBuilder("<html><font color=\"#666666\">????????????</font><font color=\"#cc6666\">")).append(showName).append("</font>&nbsp;<font color=\"#666666\">????????????</font><font color=\"#cc6666\">").append(tableName).append("</font></html>").toString());
			current_information_label.setFont(MyUIConfig.getDefaultFont());
			scriptPane.reset();
			resetToolbar();
		}
		catch (Exception e)
		{
			return false;
		}
		return true;
	}

	private FieldItemModel addTreeNode_to_TableView(DatabaseFieldTreeNode f)
	{
		CellModel cms[] = new CellModel[2];
		cms[0] = new CellModel();
		FieldTextItemModel ftim = new FieldTextItemModel();
		ftim.text = f.field.byName;
		ftim.field = f.field.name;
		ftim.table = f.field.logTableName;
		cms[0].setItemModel(ftim);
		cms[0].setCss_class("tdFormText");
		FieldItemModel fim = new FieldItemModel();
		importMsgFieldIntoFieldItem(f.field, fim);
		cms[1] = new CellModel();
		cms[1].setItemModel(fim);
		cms[1].setCss_class("tdFormInput");
		if (!Ability_FieldItemInsert)
		{
			return fim;
		} else
		{
			tv.addNoPositionCells(cms);
			return fim;
		}
	}

	private DatabaseFieldTreeNode getDatabaseTreeNode(String fieldName)
	{
		DatabaseTableTreeNode nod = (DatabaseTableTreeNode)database_tree_root.getChildAt(0);
		int size = nod.getChildCount();
		for (int i = 0; i < size; i++)
		{
			DatabaseFieldTreeNode node = (DatabaseFieldTreeNode)nod.getChildAt(i);
			if (node != null && node.field != null && node.field.getName().equals(fieldName))
				return node;
		}

		return null;
	}

	public void renewDatabaseTree(String fieldName, String newName)
	{
		DatabaseFieldTreeNode node = getDatabaseTreeNode(fieldName);
		node.field.byName = newName;
		node.setField(node.field);
		database_tree.updateUI();
		updateUI();
	}

	private void addTreeNode_to_TableView(TreePath path)
	{
		if (path == null)
			return;
		if (path.getPathCount() == 3)
		{
			Object o = path.getLastPathComponent();
			if (o instanceof DatabaseFieldTreeNode)
			{
				DatabaseFieldTreeNode f = (DatabaseFieldTreeNode)o;
				if (f.field.getRelatedTable() == null)
					addTreeNode_to_TableView(f);
			}
		} else
		if (path.getPathCount() == 4)
		{
			Object o = path.getLastPathComponent();
			MsgField field = null;
			if (o instanceof DatabaseFieldTreeNode)
			{
				DatabaseFieldTreeNode f = (DatabaseFieldTreeNode)o;
				field = f.field;
			}
			o = path.getParentPath().getLastPathComponent();
			if (o instanceof DatabaseFieldTreeNode)
			{
				DatabaseFieldTreeNode f = (DatabaseFieldTreeNode)o;
				FieldItemModel fim = addTreeNode_to_TableView(f);
				if (field != null)
				{
					fim.sourceTable = f.field.getRelatedTable();
					fim.sourceId = f.field.getRelatedId();
					fim.sourceName = field.getName();
					fim.targetRelationType = f.field.targetRelationType;
					correctFieldItem(fim);
				}
			}
		}
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

	void database_treeWillExpand(TreeExpansionEvent e)
	{
		if (e.getPath().getPathCount() == 2)
		{
			Object o = e.getPath().getLastPathComponent();
			if (o instanceof DatabaseTableTreeNode)
			{
				DatabaseTableTreeNode t = (DatabaseTableTreeNode)o;
				if (t.getChildCount() > 0)
				{
					DatabaseFieldTreeNode f = (DatabaseFieldTreeNode)t.getFirstChild();
					if (f != null && f.field == null)
						renewFields(t);
				}
			}
		} else
		if (e.getPath().getPathCount() == 3)
		{
			Object o = e.getPath().getLastPathComponent();
			if (o instanceof DatabaseFieldTreeNode)
			{
				DatabaseFieldTreeNode t = (DatabaseFieldTreeNode)o;
				if (t.getChildCount() > 0)
				{
					DatabaseFieldTreeNode f = (DatabaseFieldTreeNode)t.getFirstChild();
					if (f != null && f.field == null)
						renewFields(t);
				}
			}
		}
	}

	public void setFileInformation(String filePath, String fileName)
	{
		this.fileName = fileName;
		this.filePath = filePath;
		if (fileName != null && filePath != null)
			current_information_label.setText((new StringBuilder("????????????:")).append(filePath).append("/").append(fileName).toString());
		else
			current_information_label.setText("??¦Ä?????????");
	}

	public void setTableModelFromFile(String filePath, String fileName)
	{
		try
		{
			TableModel tableModel = MsgManager.loadFile(this, filePath, fileName);
			tv.setModel(tableModel);
			setFileInformation(filePath, fileName);
			setChanged(false);
		}
		catch (Exception e)
		{
			showErrorMessageDialog(this, e);
		}
	}

	private void saveTableModel()
	{
		try
		{
			boolean renewTableNeeded = tv.getModel().logName == null;
			if (MsgManager.saveFile(this, tv.getModel()))
			{
				if (renewTableNeeded)
				{
					MsgTable mt = new MsgTable();
					TableModel tm = tv.getModel();
					mt.name = tm.tabName;
					mt.showName = tm.showName;
					mt.logTable = tm.logName;
					mt.desc = tm.tableDesc;
					loadLayoutFile(mt);
				}
				setChanged(false);
			}
		}
		catch (Exception e)
		{
			showErrorMessageDialog(this, e);
		}
	}

	public static void showErrorMessageDialog(Container c, Exception e)
	{
		showErrorMessageDialog(c, null, e);
	}

	public static void showErrorMessageDialog(Container c, String msg, Exception e)
	{
		StringWriter sw = new StringWriter();
		PrintWriter s = new PrintWriter(sw);
		e.printStackTrace(s);
		if (msg == null)
			msg = "???????";
		(new ErrorMessageDialog(TableView.getFrame(c), "????", true, msg, sw.toString())).setVisible(true);
	}

	private void initToolBar()
	{
		toolbar = new MyToolBar(this);
		toolbar.setButtonCount(9);
		toolbar.getButtons()[0] = MyToolBar.getImage("load.gif");
		toolbar.getToolTips()[0] = "??";
		toolbar.getButtons()[1] = MyToolBar.getImage("save.gif");
		toolbar.getToolTips()[1] = "????";
		toolbar.getButtons()[2] = MyToolBar.getImage("t_write_file.gif");
		toolbar.getToolTips()[2] = "??????";
		toolbar.getButtons()[3] = MyToolBar.getImage("t_table_property.gif");
		toolbar.getToolTips()[3] = "????";
		toolbar.getButtons()[4] = MyToolBar.getImage("t_text_cell.gif");
		toolbar.getToolTips()[4] = "????????????";
		toolbar.getButtons()[5] = MyToolBar.getImage("t_tab_travel.gif");
		toolbar.getToolTips()[5] = "Tab?????????";
		toolbar.getButtons()[6] = MyToolBar.getImage("javascript_undo.gif");
		toolbar.getToolTips()[6] = "????";
		toolbar.getButtons()[7] = MyToolBar.getImage("javascript_redo.gif");
		toolbar.getToolTips()[7] = "????";
		toolbar.getButtons()[8] = MyToolBar.getImage("javascript_search.gif");
		toolbar.getToolTips()[8] = "????";
		toolbar.setPreferredSize(new Dimension(10, toolbar.getButtonSize() + 5));
		int width = toolbar.getMaximumSize().width;
		toolbar.setMaximumSize(new Dimension(width, 36));
	}

	public void bindWithTable(String tableName)
	{
		try
		{
			MsgTable mts[] = MsgManager.getTableList(this);
			MsgTable mt = new MsgTable();
			mt.name = tableName;
			for (int i = 0; i < mts.length; i++)
			{
				if (!mts[i].name.equals(tableName))
					continue;
				mt = mts[i];
				break;
			}

			loadLayoutFile(mt);
			toolbar.setValid(0, false);
		}
		catch (Exception e)
		{
			showErrorMessageDialog(this, e);
		}
	}

	public TableModel getTableModel()
	{
		return tv.getModel();
	}

	public void setChanged(boolean changed)
	{
		this.changed = changed;
		resetToolbar();
	}

	public void buttonClicked(int index)
	{
		if (!toolbar.getValid(index))
			return;
		if (index != 0 && tv.getModel().tabName == null)
			return;
		if (index == 3)
		{
			(new TableDialog(TableView.getFrame(this), getTableModel(), "????????", false)).setVisible(true);
			setChanged(true);
		} else
		if (index == 0)
		{
			if (changed)
			{
				int ans = JOptionPane.showConfirmDialog(this, "????????????¦Ä???—¨??????", "???", 1);
				if (ans == 2)
					return;
				if (ans == 0)
				{
					saveTableModel();
					if (changed)
						return;
				}
			}
			MsgTable table = TableOpenDialog.openLayout(this);
			if (table != null)
			{
				loadLayoutFile(table);
				TableModel tm = getTableModel();
				tm.tableDesc = table.desc;
				tm.showName = table.showName;
			}
		} else
		if (index == 1)
			saveTableModel();
		else
		if (index == 2)
			try
			{
				MsgManager.writefile(this, getTableModel());
			}
			catch (Exception e)
			{
				showErrorMessageDialog(this, e);
			}
		else
		if (index == 4)
		{
			CellModel cms[] = new CellModel[1];
			cms[0] = new CellModel();
			cms[0].setItemModel(new TextItemModel(""));
			tv.addNoPositionCells(cms);
		} else
		if (index == 5)
		{
			boolean t = !tv.getTabTravelOrderModel();
			toolbar.setSelected(5, t);
			if (t)
				toolbar.getToolTips()[5] = "?????????";
			else
				toolbar.getToolTips()[5] = "Tab?????????";
			tv.setTabTravelOrderModel(t);
		} else
		if (index == 6)
			scriptPane.getEditor().undo();
		else
		if (index == 7)
			scriptPane.getEditor().redo();
		else
		if (index == 8)
			scriptPane.getEditor().search();
		tv.repaint();
	}

	private void menuInit()
	{
		menu.add(insert_m);
		menu.add(renew_m);
		menu.add(open_m);
	}

	public void menuActionPerformed(ActionEvent e, MyMenuItem item)
	{
		if (item == insert_m)
			insert_m_action();
		else
		if (item == renew_m)
			renew_m_action();
		else
		if (item == open_m)
			open_m_action();
	}

	private void renew_m_action()
	{
		Object o = database_tree.getSelectionPath().getLastPathComponent();
		if (o instanceof DatabaseTableTreeNode)
		{
			DatabaseTableTreeNode table = (DatabaseTableTreeNode)o;
			renewFields(table);
			database_tree.updateUI();
		}
	}

	private void insert_m_action()
	{
		TreePath path[] = database_tree.getSelectionPaths();
		for (int i = 0; i < path.length; i++)
			if (path[i].getPathCount() >= 3)
				addTreeNode_to_TableView(path[i]);
			else
			if (path[i].getPathCount() == 2)
			{
				Object o = path[i].getLastPathComponent();
				if (o instanceof DatabaseTableTreeNode)
				{
					DatabaseTableTreeNode table = (DatabaseTableTreeNode)o;
					if (table.getChildCount() > 0)
					{
						DatabaseFieldTreeNode firstfield = (DatabaseFieldTreeNode)table.getFirstChild();
						if (firstfield != null && firstfield.field == null)
							renewFields(table);
					}
					int size = table.getChildCount();
					for (int j = 0; j < size; j++)
					{
						Object o_ = table.getChildAt(j);
						if (o_ != null && (o_ instanceof DatabaseFieldTreeNode))
						{
							DatabaseFieldTreeNode f = (DatabaseFieldTreeNode)o_;
							addTreeNode_to_TableView(f);
						}
					}

				}
			}

	}

	private void open_m_action()
	{
		Object o = database_tree.getSelectionPath().getLastPathComponent();
		if (database_tree.getSelectionPath().getPathCount() == 2 && (o instanceof DatabaseTableTreeNode))
		{
			MsgTable table = ((DatabaseTableTreeNode)o).table;
			if (changed)
			{
				int confirmResult = JOptionPane.showConfirmDialog(this, "??????????????????????????", "??????", 1);
				if (confirmResult == 0)
					try
					{
						if (!MsgManager.saveFile(this, tv.getModel()))
							return;
					}
					catch (Exception e)
					{
						return;
					}
				else
				if (confirmResult == 2)
					return;
			}
			loadLayoutFile(table);
			tv.revalidate();
			tv.repaint();
		}
	}



}
