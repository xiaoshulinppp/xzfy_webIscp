// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   BeanOperPane.java

package com.iscp.sys.coderClient.view.struct;

import com.iscp.sys.coder.model.TemplateCoder;
import com.iscp.sys.coderClient.MapTool;
import com.iscp.sys.coderClient.view.base.DragBar;
import com.iscp.sys.coderClient.view.base.DragContainer;
import com.iscp.sys.coderClient.view.hbm.*;
import com.iscp.sys.coderClient.view.impl.RelationModel;
import com.iscp.sys.coderClient.view.struct.dialog.DialogWriteFile;
import com.iscp.sys.coderClient.view.struct.dialog.DialogWriteFileInfo;
import com.iscp.sys.coderClient.view.struct.dialog.MyOptionPane;
import com.iscp.sys.coderClient.view.struct.dialog.RelationInputDialog;
import com.iscp.sys.coderClient.view.struct.dialog.TextDialog;
import com.iscp.sys.coderClient.view.struct.menu.MyMenu;
import com.iscp.sys.coderClient.view.struct.menu.MyMenuItem;
import com.iscp.sys.coderClient.view.struct.toolbar.MySelectMenu;
import com.iscp.sys.coderClient.view.struct.toolbar.MyToolBar;
import com.iscp.sys.coderMsg.*;
import java.applet.Applet;
import java.awt.*;
import java.awt.event.*;
import java.util.*;
import javax.swing.*;
import netscape.javascript.JSObject;

// Referenced classes of package com.iscp.sys.coderClient.view.struct:
//			PaneWithTool, BeanListPane

public class BeanOperPane extends PaneWithTool
	implements ResizeOper
{

	public static final int BUTTON_CLOSE_ALL = 4;
	public static final int BUTTON_COUNT = 5;
	public static final int BUTTON_RELATION = 3;
	public static final int BUTTON_RELATION_REMOVE = 2;
	public static final int BUTTON_SAVE = 0;
	public static final int BUTTON_WRITEFILE = 1;
	private Applet applet;
	private Set error_relation;
	private GlobeView gv;
	private IdTypeModel idType;
	private Set lack_msg;
	private BeanListPane listPane;
	private JMenuItem m_close;
	private JMenuItem m_relation_detail;
	private JComponent menuSource;
	private Set related_bean_added;
	private static String relation_select_img[] = {
		"relation1.gif", "relation2.gif", "relation4.gif"
	};
	private MySelectMenu relation_select_menu;
	private static String relation_select_tiptext[] = {
		"一对一关联关系", "一对多关联关系", "多对多关联关系"
	};
	private boolean saved;

	public BeanOperPane()
	{
		gv = new GlobeView();
		saved = true;
		idType = new IdTypeModel();
		init();
		gv.setMouseEventTrans(this);
	}

	public BeanView addBeanModel(TableModel table, boolean rootOpen)
		throws Exception
	{
		if (rootOpen)
		{
			error_relation = new HashSet();
			lack_msg = new HashSet();
			related_bean_added = new HashSet();
		}
		BeanView bv = addBeanModelOnly(table, rootOpen);
		if (bv == null)
		{
			MyOptionPane.showMessageDialog(this, (new StringBuilder("打开表")).append(table.getTabName()).append("错误\r\n请确保表").append(table.getTabName()).append("至少含有一个主键").toString());
			return null;
		}
		related_bean_added.add(bv);
		RelModel rm[] = MsgManager.get_rel_list(table, this);
		int size = listPane.getBeanSet().size();
		TableModel tms[] = new TableModel[size];
		Iterator it = listPane.getBeanSet().iterator();
		for (int i = 0; i < size; i++)
			tms[i] = (TableModel)it.next();

		for (int i = 0; i < rm.length; i++)
		{
			if (gv.getBeanView(rm[i].getTable_related()) == null)
			{
				for (int j = 0; j < tms.length; j++)
				{
					TableModel tm = tms[j];
					if (!tm.getTabName().equals(rm[i].getTable_related()))
						continue;
					listPane.open_model(tm, false);
					break;
				}

			}
			if (gv.getBeanView(rm[i].getTable_host()) == null)
			{
				for (int j = 0; j < tms.length; j++)
				{
					TableModel tm = tms[j];
					if (!tm.getTabName().equals(rm[i].getTable_host()))
						continue;
					listPane.open_model(tm, false);
					break;
				}

			}
			if (rm[i].table_host.equals(table.getTabName()))
			{
				boolean host_exist = propertyExist(rm[i].getTable_host(), rm[i].getColumn_host(), rm[i], lack_msg);
				boolean related_exist = propertyExist(rm[i].getTable_related(), rm[i].getColumn_related(), rm[i], lack_msg);
				if (host_exist && related_exist)
				{
					String mbvName = gv.mainBeanView.getModel().getTabName();
					gv.addRelation(rm[i], !rm[i].getTable_host().equals(mbvName) && !rm[i].getTable_related().equals(mbvName));
				} else
				{
					error_relation.add(rm[i]);
				}
			}
		}

		if (rootOpen && !error_relation.isEmpty())
		{
			it = lack_msg.iterator();
			String msg;
			for (msg = "由于在数据库中没有发现以下的表或列:\r\n"; it.hasNext(); msg = (new StringBuilder(String.valueOf(msg))).append(it.next()).append("\r\n").toString());
			msg = (new StringBuilder(String.valueOf(msg))).append("如果继续，需要删除以下关联关").append("系:\r\n").toString();
			for (it = error_relation.iterator(); it.hasNext();)
			{
				RelModel r = (RelModel)it.next();
				msg = (new StringBuilder(String.valueOf(msg))).append(r.getTable_host()).append(".").append(r.getColumn_host()).append("->").append(r.getTable_related()).append(".").append(r.getColumn_related()).append("\r\n").toString();
			}

			if (MyOptionPane.showConfirmDialog(this, msg, "删除", "保留"))
				MsgManager.removeRelation(error_relation, this);
			else
				for (it = related_bean_added.iterator(); it.hasNext();)
				{
					BeanView bv_close = (BeanView)it.next();
					if (bv_close != bv)
					{
						removeBean(bv_close);
					} else
					{
						gv.removeBean(bv_close);
						bv = null;
					}
				}

		}
		repaint();
		return bv;
	}

	private BeanView addBeanModelOnly(TableModel table, boolean rootOpen)
		throws Exception
	{
		ColumnModel propertyModels[] = MsgManager.get_column_list(table, this);
		int primaryKeyCount = 0;
		for (int i = 0; i < propertyModels.length; i++)
			if (propertyModels[i].isKey.equals("1"))
				primaryKeyCount++;

		table.keyCount = primaryKeyCount;
		if (rootOpen && primaryKeyCount == 0)
			return null;
		table.fields = new HashSet();
		for (int j = 0; j < propertyModels.length; j++)
			table.getFields().add(propertyModels[j]);

		BeanView bv = new BeanView(table);
		if (gv.mainBeanView == null)
		{
			gv.mainBeanView = bv;
			bv.setMainBeanView(true);
		} else
		{
			bv.setMainBeanView(false);
		}
		gv.addBeanView(bv);
		return bv;
	}

	private void b_close_all_action()
	{
		if (!saved)
		{
			int ans = MyOptionPane.showInternalConfirmDialog(this, "当前编辑的类可能没有保存，是否保存？", "是", "否", "取消");
			if (ans == 0)
				b_save_rels_action();
			else
			if (ans == 2)
				return;
		}
		BeanView bvs[] = gv.allBeanViews();
		for (int i = 0; i < bvs.length; i++)
			removeBean(bvs[i]);

		repaint();
	}

	private void b_delete_relation()
	{
		gv.removeSelectedRelation();
	}

	private void b_formdesign()
	{
		String param[] = new String[1];
		if (gv.mainBeanView == null)
		{
			return;
		} else
		{
			param[0] = gv.mainBeanView.getModel().tabName;
			callJavaScript("openFormDesign", param);
			return;
		}
	}

	public void b_save_rels_action()
	{
		try
		{
			MsgManager.save_rels(gv, this);
			saved = true;
			myToolBar.setValid(0, false);
			myToolBar.repaint();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public void b_set_id_action()
	{
	}

	private void b_viewcode_action()
	{
		if (gv.mainBeanView == null)
			return;
		try
		{
			TableModel mods[] = gv.allDirectlyRelatedBeans();
			TemplateCoder tc = new TemplateCoder(gv.mainBeanView.getModel(), mods, gv.getRelations(), idType, true);
			String code = tc.toTemplateXML();
			TextDialog dialog = new TextDialog(getFrame(), "编码预览", true, code);
			dialog.setVisible(true);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public void b_writefile_action()
	{
		if (gv.mainBeanView != null)
		{
			if (gv.mainBeanView.getKeyPropertyView() == null)
			{
				MyOptionPane.showMessageDialog(this, "请设定主键\r\n");
				return;
			}
			if (!saved)
				if (MyOptionPane.showConfirmDialog(this, "关联关系尚未保存，是否保存?", "保存", "取消"))
					b_save_rels_action();
				else
					return;
			TableModel table = gv.mainBeanView.getModel();
			String key = "";
			for (Container c = this; c != null;)
			{
				c = c.getParent();
				if (c instanceof MapTool)
				{
					key = ((MapTool)c).getGenerateTemplate();
					break;
				}
			}

			if (key.equalsIgnoreCase("base"))
				DialogWriteFile.showDialogWriteFile(getFrame(), this, table, gv.allBeans());
			if (key.equalsIgnoreCase("infogather"))
				DialogWriteFileInfo.showDialogWriteFile(getFrame(), this, table, gv.allBeans());
		}
	}

	public void buttonClicked(int buttonIndex)
	{
		BeanOperPane _tmp = this;
		switch (buttonIndex)
		{
		case 0: // '\0'
			b_save_rels_action();
			break;

		case 1: // '\001'
			b_writefile_action();
			break;

		case 2: // '\002'
			gvChanged();
			b_delete_relation();
			break;

		case 4: // '\004'
			b_close_all_action();
			break;
		}
	}

	public Object callJavaScript(String function, String param[])
	{
		if (applet == null)
		{
			for (Container c = this; c != null; c = c.getParent())
				if (c instanceof Applet)
					applet = (Applet)c;

		}
		if (applet != null)
		{
			JSObject j = JSObject.getWindow(applet);
			return j.call(function, param);
		} else
		{
			return null;
		}
	}

	public void gvChanged()
	{
		saved = false;
		myToolBar.setValid(0, true);
		myToolBar.repaint();
	}

	private void init()
	{
		IdTypeModel _tmp = idType;
		idType.setType(0);
		JScrollPane scrollPane = new JScrollPane();
		pane.add(scrollPane);
		scrollPane.getViewport().add(gv);
		scrollPane.setBorder(null);
		gv.setResizeOper(this);
	}

	public void initMenu()
	{
		m_close = new MyMenuItem("关闭", "F4");
		m_relation_detail = new MyMenuItem("编辑关联关系", "");
		myMenu.add(m_close);
		myMenu.add(m_relation_detail);
	}

	public void initToolBar()
	{
		relation_select_menu = new MySelectMenu(this, relation_select_img, relation_select_tiptext);
		myToolBar.setButtonCount(5);
		myToolBar.getToolTips()[0] = "保存关联关系配置(Ctrl+s)";
		myToolBar.getButtons()[0] = MyToolBar.getImage("save.gif");
		myToolBar.setValid(0, false);
		myToolBar.getToolTips()[1] = "生成业务(F9)";
		myToolBar.getButtons()[1] = MyToolBar.getImage("writefile.gif");
		myToolBar.getToolTips()[2] = "删除关联关系(Delete)";
		myToolBar.getButtons()[2] = MyToolBar.getImage("remove_relation.gif");
		myToolBar.getToolTips()[3] = "设置关联关系";
		myToolBar.getButtons()[3] = MyToolBar.getImage("relation1.gif");
		myToolBar.setSelectMenu(3, relation_select_menu);
		myToolBar.getToolTips()[4] = "清空编辑面板";
		myToolBar.getButtons()[4] = MyToolBar.getImage("close_all.gif");
	}

	public void keyReleased(KeyEvent e)
	{
		boolean isChangeAction = true;
		KeyEvent _tmp = e;
		if (e.getKeyCode() == 127)
		{
			if (gv.getSelectedProperty() != null)
			{
				menuSource = gv.getSelectedProperty();
				m_close_action();
			} else
			{
				b_delete_relation();
			}
		} else
		{
			KeyEvent _tmp1 = e;
			if (e.getKeyCode() == 27)
			{
				b_close_all_action();
			} else
			{
				KeyEvent _tmp2 = e;
				if (e.getKeyCode() == 115)
				{
					menuSource = gv.getActive();
					if (menuSource != null)
					{
						m_close_action();
						gv.setActive(null);
						repaint();
					}
				} else
				{
					KeyEvent _tmp3 = e;
					if (e.getKeyCode() == 116)
					{
						menuSource = gv.getActive();
						if (menuSource != null)
						{
							menuSource = gv.getActive().getDragBar();
							b_viewcode_action();
						}
					} else
					{
						KeyEvent _tmp4 = e;
						if (e.getKeyCode() == 83 && e.isControlDown())
						{
							b_save_rels_action();
						} else
						{
							KeyEvent _tmp5 = e;
							if (e.getKeyCode() == 120)
								b_writefile_action();
						}
					}
				}
			}
			isChangeAction = false;
		}
		if (isChangeAction)
			gvChanged();
	}

	private void m_close_action()
	{
		Container c = menuSource;
		if (!saved)
		{
			int ans = MyOptionPane.showInternalConfirmDialog(this, "当前编辑的类可能没有保存，是否保存？", "是", "否", "取消");
			if (ans == 0)
				b_save_rels_action();
			else
			if (ans == 2)
				return;
		}
		for (; c == null || !(c instanceof BeanView); c = c.getParent());
		if (c == null)
			return;
		int size = gv.getRelationCount();
		RelationModel rms[] = new RelationModel[size];
		for (int i = 0; i < size; i++)
			rms[i] = gv.getRelation(i);

		BeanView bv = (BeanView)c;
		BeanView bvs[] = gv.allBeanViews();
		BeanView queue[] = new BeanView[bvs.length];
		if (queue.length <= 0)
			return;
		queue[0] = bv;
		int startIndex = 0;
		int endIndex = 1;
		Set tempSet = new HashSet();
		tempSet.add(bv);
		for (; endIndex > startIndex && endIndex < queue.length; startIndex++)
		{
			for (int i = 0; i < size; i++)
			{
				BeanView bv1 = ((PropertyView)rms[i].getP1()).getBeanView();
				BeanView bv2 = ((PropertyView)rms[i].getP2()).getBeanView();
				if (bv1 == queue[startIndex] && tempSet.add(bv2))
					queue[endIndex++] = bv2;
				if (bv2 == queue[startIndex] && tempSet.add(bv1))
					queue[endIndex++] = bv1;
			}

		}

		for (int i = 0; i < endIndex; i++)
			removeBean(queue[i]);

	}

	private void m_relation_detail_action()
	{
		if (gv.getSelectedRelation().getRelationType() == 3)
		{
			Dialog d = new RelationInputDialog(getFrame(), "关联关系", true, gv.getSelectedRelation(), this);
			d.setVisible(true);
			gvChanged();
		}
	}

	private void m_setKey_p_action()
	{
		if (!(menuSource instanceof PropertyView))
			return;
		PropertyView pv = (PropertyView)menuSource;
		if (pv.getBeanView() != gv.mainBeanView)
			return;
		RelationModel rm = gv.setKeyProperty_detailReturn(pv);
		if (rm != null)
		{
			PropertyView pv1 = (PropertyView)rm.getP1();
			PropertyView pv2 = (PropertyView)rm.getP2();
			String errormsg = (new StringBuilder("将")).append(pv.getModel().getName()).append("设为主键时发生冲突:\r\n").toString();
			String pname1 = (new StringBuilder(String.valueOf(pv1.getBeanView().getModel().getTabName()))).append(".").append(pv1.getModel().getName()).toString();
			String pname2 = (new StringBuilder(String.valueOf(pv2.getBeanView().getModel().getTabName()))).append(".").append(pv2.getModel().getName()).toString();
			errormsg = (new StringBuilder(String.valueOf(errormsg))).append("关系(").append(pname1).append("->").append(pname2).append(")\r\n要求").toString();
			PropertyView pv_;
			String pname;
			if (pv1.getBeanView() == pv.getBeanView())
			{
				pv_ = pv1;
				pname = pname1;
			} else
			{
				pv_ = pv2;
				pname = pname2;
			}
			errormsg = (new StringBuilder(String.valueOf(errormsg))).append(pname).toString();
			if (pv_ == pv)
				errormsg = (new StringBuilder(String.valueOf(errormsg))).append("必须不是主键").toString();
			else
				errormsg = (new StringBuilder(String.valueOf(errormsg))).append("必须是主键").toString();
			if (pv_ != pv && (pv.getModel().isOperator || pv_.getModel().isOperator) && !gv.isRelated(pv))
			{
				errormsg = (new StringBuilder(String.valueOf(errormsg))).append("\r\n是否将原主键的关联关系移动").append("到新主键上？").toString();
				if (MyOptionPane.showConfirmDialog(this, errormsg, "移动", "取消"))
				{
					gv.composeRelation(pv, pv_);
					if (!gv.setKeyProperty(pv))
						return;
				} else
				{
					return;
				}
			} else
			{
				MyOptionPane.showMessageDialog(this, errormsg);
				return;
			}
			renewIdType(pv.getModel());
		}
	}

	public void menuActionPerformed(ActionEvent e, JMenuItem item)
	{
		if (item != m_close)
			gvChanged();
		try
		{
			if (item == m_relation_detail)
				m_relation_detail_action();
			else
			if (item == m_close)
				m_close_action();
		}
		catch (Exception ee)
		{
			ee.printStackTrace();
			JOptionPane.showMessageDialog(this, ee.getMessage());
		}
		repaint();
	}

	public void mouseClicked(JComponent c, MouseEvent e)
	{
		super.mouseClicked(c, e);
		MouseEvent _tmp = e;
		if (e.getButton() == 1 && e.getClickCount() == 2 && c == gv && gv.getSelectedRelation() != null)
		{
			menuSource = gv;
			m_relation_detail_action();
		}
	}

	public void mouseEntered(JComponent c, MouseEvent e)
	{
		requestFocus();
	}

	public void mouseReleased(MouseEvent e)
	{
		requestFocus();
	}

	private boolean propertyExist(String tn, String pn, RelModel rm, Set lack_msg)
	{
		BeanView bv = gv.getBeanView(tn);
		if (bv == null)
		{
			lack_msg.add((new StringBuilder("表")).append(tn).toString());
			return false;
		}
		PropertyView pv = bv.getPropertyView(pn);
		if (pv == null)
		{
			lack_msg.add((new StringBuilder("列")).append(tn).append(".").append(pn).toString());
			return false;
		} else
		{
			return true;
		}
	}

	private void removeBean(BeanView bv)
	{
		listPane.sendbackBeanView(bv);
		gv.removeBean(bv);
		if (gv.isEmpty())
		{
			myToolBar.setValid(0, false);
			saved = true;
		}
	}

	private void renewIdType(ColumnModel column)
	{
		if (column.getTypeName().equals("String"))
		{
			IdTypeModel _tmp = idType;
			idType.setType(1);
		} else
		if (column.getTypeName().equals("Integer"))
		{
			IdTypeModel _tmp1 = idType;
			idType.setType(0);
		}
	}

	public void resized(int w, int h)
	{
		gv.setPreferredSize(new Dimension(w, h));
		gv.getParent().validate();
	}

	public void setActive()
	{
	}

	public void setBeanListPane(BeanListPane listPane)
	{
		this.listPane = listPane;
	}

	public void setItemSelect(MySelectMenu menu, int i)
	{
		if (menu == relation_select_menu)
		{
			myToolBar.getButtons()[4] = menu.getImage(i);
			myToolBar.repaint();
			if (i == 0)
				i = 0;
			else
			if (i == 1)
				i = 1;
			else
			if (i == 2)
				i = 3;
			gv.setCurrentRelationType(i);
		}
	}

	protected void setMenuItems(JComponent source)
	{
		menuSource = source;
		m_close.setVisible(false);
		m_relation_detail.setVisible(false);
		if (source == gv)
		{
			if (gv.getSelectedRelation() != null && gv.getSelectedRelation().getRelationType() == 3)
				m_relation_detail.setVisible(true);
		} else
		if (source instanceof DragBar)
			m_close.setVisible(true);
		else
		if (source instanceof PropertyView)
			m_close.setVisible(true);
	}

}
