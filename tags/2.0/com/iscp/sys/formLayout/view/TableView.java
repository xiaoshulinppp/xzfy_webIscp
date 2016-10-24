// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TableView.java

package com.iscp.sys.formLayout.view;

import com.iscp.sys.formLayout.model.*;
import com.iscp.sys.formLayout.view.base.ItemEditor;
import com.iscp.sys.formLayout.view.base.MouseEventComponent;
import com.iscp.sys.formLayout.view.base.MyMenu;
import com.iscp.sys.formLayout.view.base.MyMenuItem;
import com.iscp.sys.formLayout.view.base.SizeRect;
import com.iscp.sys.formLayout.view.dialog.CssDialog;
import java.awt.*;
import java.awt.event.*;
import java.io.PrintStream;
import java.net.URL;
import java.util.Vector;
import javax.swing.*;

// Referenced classes of package com.iscp.sys.formLayout.view:
//			MyMenuSourcePane, CellView, MainPane, formLayoutClient, 
//			TableViewKeyListener, TableViewDetailShowManager

public class TableView extends MouseEventComponent
	implements MyMenuSourcePane
{

	private ItemEditor itemEditor;
	private TableModel model;
	private Vector cells;
	private static SizeRect sizeRect_for_draw_only = new SizeRect(0, 0, 0);
	public CellView current_cellView;
	private boolean changed;
	private MainPane mainPane;
	private String urlRelated;
	private static int urlBackLimit = 0;
	private static boolean painting = false;
	private int mouse_down_x;
	private int mouse_down_y;
	private JComponent mouse_down_component;
	private FieldItemModel mouse_down_fim;
	private Rectangle selectionRect;
	private CellView webEditingCell;
	private Cursor normal_cursor;
	private Cursor cross_cursor;
	private int mouse_drag_x;
	private int mouse_drag_y;
	private SizeRect current_sizeRect;
	private SizeRect size_east;
	private SizeRect size_south;
	private SizeRect size_west;
	private SizeRect size_north;
	private SizeRect size_south_east;
	private SizeRect size_south_west;
	private SizeRect size_north_east;
	private SizeRect size_north_west;
	private boolean key_ctrl_down;
	private boolean tabTravelOrderModel;
	private MyMenu menu;
	private MyMenuItem remove_cell_m;
	private MyMenuItem edit_table_css_m;
	private MyMenuItem edit_cell_css_m;
	private MyMenuItem edit_item_css_m;
	private MyMenuItem edit_item_id_m;
	private MyMenuItem edit_item_action_m;
	private MyMenuItem hidden_item_action_m;
	private MyMenuItem web_editor_open_m;
	private TableViewDetailShowManager detailShowManager;
	private String detail[][];
	private int detail_x;
	private int detail_y;

	public ItemEditor getItemEditor()
	{
		return itemEditor;
	}

	public FieldItemModel getSelectedFieldItem()
	{
		if (current_cellView == null)
			return null;
		ItemModel item = current_cellView.getModel().getItemModel();
		if (item instanceof FieldItemModel)
			return (FieldItemModel)item;
		else
			return null;
	}

	public void setChanged(boolean changed)
	{
		if (mainPane != null)
			mainPane.setChanged(changed);
		this.changed = changed;
	}

	public boolean getChanged()
	{
		return changed;
	}

	public void setMainPane(MainPane mainPane)
	{
		this.mainPane = mainPane;
		urlRelated = mainPane.applet.getCodeBase().toString();
		int index = urlRelated.length();
		if (urlRelated.lastIndexOf("/") == index - 1)
			index--;
		for (int i = 0; i < urlBackLimit; i++)
			index = urlRelated.lastIndexOf("/", index - 1);

		urlRelated = urlRelated.substring(0, index);
		urlRelated = (new StringBuilder(String.valueOf(urlRelated.replaceAll("file:/", "file:///")))).append("/").toString();
	}

	public TableView(TableModel model)
	{
		itemEditor = new ItemEditor();
		cells = new Vector();
		current_cellView = null;
		changed = false;
		mouse_down_x = 0;
		mouse_down_y = 0;
		mouse_down_component = null;
		mouse_down_fim = null;
		normal_cursor = new Cursor(0);
		cross_cursor = new Cursor(1);
		size_east = new SizeRect(0, 0, 11);
		size_south = new SizeRect(0, 0, 9);
		size_west = new SizeRect(0, 0, 10);
		size_north = new SizeRect(0, 0, 8);
		size_south_east = new SizeRect(0, 0, 5);
		size_south_west = new SizeRect(0, 0, 4);
		size_north_east = new SizeRect(0, 0, 7);
		size_north_west = new SizeRect(0, 0, 6);
		key_ctrl_down = false;
		tabTravelOrderModel = false;
		menu = new MyMenu(this);
		remove_cell_m = new MyMenuItem("???", "");
		edit_table_css_m = new MyMenuItem("???\361?????", "");
		edit_cell_css_m = new MyMenuItem("???\365???????", "");
		edit_item_css_m = new MyMenuItem("??????????", "");
		edit_item_id_m = new MyMenuItem("???????id", "");
		edit_item_action_m = new MyMenuItem("???\374?????", "");
		hidden_item_action_m = new MyMenuItem("????/??????", "");
		web_editor_open_m = new MyMenuItem("???????", "");
		setModel(model);
		initMenu();
		add(itemEditor);
		itemEditor.setVisible(false);
		addKeyListener(new TableViewKeyListener(this));
		detailShowManager = new TableViewDetailShowManager(this);
		detailShowManager.start();
	}

	private void addCell(CellView view)
	{
		cells.add(view);
		setCellPosition(view);
	}

	private void addCell(CellModel model)
	{
		URL url = null;
		try
		{
			url = mainPane.getURL();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		addCell(new CellView(model, this, url));
	}

	private void removeCell(CellView view)
	{
		if (!mainPane.Ability_FieldItemRemove && (view.getModel().getItemModel() instanceof FieldItemModel))
			return;
		if (!mainPane.Ability_FieldTextItemRemoveAndInsert && (view.getModel().getItemModel() instanceof FieldTextItemModel))
			return;
		if (!mainPane.Ability_TextItemEdit && (view.getModel().getItemModel() instanceof TextItemModel))
		{
			return;
		} else
		{
			remove(view);
			cells.remove(view);
			getModel().cells.remove(view.getModel());
			return;
		}
	}

	public void setModel(TableModel model)
	{
		if (this.model == model)
			return;
		this.model = model;
		setPreferredSize(new Dimension(model.width + 1, model.height + 1));
		setBounds(0, 0, model.width + 1, model.height + 1);
		cells.removeAllElements();
		int size = model.cells.size();
		for (int i = 0; i < size; i++)
			addCell((CellModel)model.cells.get(i));

	}

	public TableModel getModel()
	{
		return model;
	}

	public void setCellsPosition()
	{
		int size = cells.size();
		for (int i = 0; i < size; i++)
			setCellPosition((CellView)cells.get(i));

	}

	public void setCellPosition(CellView cellView)
	{
		CellModel cellModel = cellView.getModel();
		int x = model.columns[cellModel.left];
		int w = model.columns[cellModel.left + cellModel.colspan] - model.columns[cellModel.left];
		int y = model.rows[cellModel.top];
		int h = model.rows[cellModel.top + cellModel.rowspan] - model.rows[cellModel.top];
		cellView.setFittedBounds(x, y, w, h);
	}

	public void paint(Graphics g)
	{
		if (painting)
			return;
		painting = true;
		int w = getBounds().width;
		int h = getBounds().height;
		g.setColor(new Color(239, 238, 228));
		g.fillRect(0, 0, w, h);
		g.setColor(Color.white);
		for (int i = 0; i < model.rowCount; i++)
			g.drawLine(model.columns[0], getRows(i, h), w, getRows(i, h));

		for (int i = 0; i < model.columnCount; i++)
			g.drawLine(getColumns(i, w), 0, getColumns(i, w), h);

		int size = cells.size();
		for (int i = 0; i < size; i++)
		{
			CellView view = (CellView)cells.get(i);
			if (!view.isSelected())
			{
				int x = view.getBounds().x;
				int y = view.getBounds().y;
				g.translate(x, y);
				view.paint(g);
				g.translate(-x, -y);
			}
		}

		for (int i = 0; i < size; i++)
		{
			CellView view = (CellView)cells.get(i);
			if (view.isSelected())
			{
				int x = view.getBounds().x;
				int y = view.getBounds().y;
				g.translate(x, y);
				view.paint(g);
				g.translate(-x, -y);
			}
		}

		for (int i = 0; i < size; i++)
		{
			CellView view = (CellView)cells.get(i);
			if (view.isSelected())
				paintSelectedCellViewSizeRects(g, view);
		}

		if (tabTravelOrderModel)
		{
			for (int i = 0; i < size; i++)
			{
				CellView cv = (CellView)cells.get(i);
				ItemModel im = cv.getModel().getItemModel();
				g.setColor(Color.red);
				int source_x = cv.getBounds().x + cv.getBounds().width / 2;
				int source_y = cv.getBounds().y + cv.getBounds().height / 2;
				if (im != null && (im instanceof FieldItemModel))
					if (im == mouse_down_fim && mouse_down_fim != null)
					{
						g.drawLine(mouse_drag_x + 2, mouse_drag_y + 2, source_x, source_y);
						g.fillArc(mouse_drag_x, mouse_drag_y, 5, 5, 0, 360);
					} else
					{
						ItemModel _im = ((FieldItemModel)im).tabNext;
						for (int j = 0; j < size; j++)
						{
							CellView _cv = (CellView)cells.get(j);
							if (_cv.getModel().getItemModel() != _im)
								continue;
							int object_x = _cv.getBounds().x + _cv.getBounds().width / 2;
							int object_y = _cv.getBounds().y + _cv.getBounds().height / 2;
							g.drawLine(object_x - 15, object_y, source_x, source_y);
							g.drawLine(object_x - 15, object_y, object_x, object_y);
							g.drawLine(object_x - 5, object_y + 3, object_x, object_y);
							g.drawLine(object_x - 5, object_y - 3, object_x, object_y);
							break;
						}

					}
			}

		}
		if (itemEditor.isVisible())
		{
			int x = itemEditor.getBounds().x;
			int y = itemEditor.getBounds().y;
			g.translate(x, y);
			itemEditor.paint(g);
			g.translate(-x, -y);
		}
		if (selectionRect != null)
		{
			g.setColor(new Color(0, 128, 255, 64));
			g.fillRect(selectionRect.x, selectionRect.y, selectionRect.width, selectionRect.height);
			g.setColor(Color.blue);
			g.drawRect(selectionRect.x, selectionRect.y, selectionRect.width, selectionRect.height);
		}
		if (detail != null && detail[0] != null && detail[1] != null)
		{
			g.setFont(getFont());
			FontMetrics fm = g.getFontMetrics();
			int detail_w_title = 0;
			int detail_w_value = 0;
			int detail_h = fm.getHeight() * detail[0].length;
			for (int i = 0; i < detail[0].length; i++)
				if (detail[0][i] != null && detail[1][i] != null)
				{
					int temp_w_title = fm.stringWidth(detail[0][i]);
					int temp_w_value = fm.stringWidth(detail[1][i]);
					if (temp_w_title > detail_w_title)
						detail_w_title = temp_w_title;
					if (temp_w_value > detail_w_value)
						detail_w_value = temp_w_value;
				}

			int detail_w = (detail_w_title += 3) + detail_w_value;
			g.setColor(new Color(192, 255, 230, 128));
			g.fill3DRect(detail_x - 3, detail_y - 3, detail_w + 7, detail_h + 7, true);
			int y = detail_y + g.getFont().getSize();
			for (int dx = -1; dx < 2; dx++)
			{
				for (int dy = -1; dy < 2; dy++)
				{
					y = detail_y + g.getFont().getSize();
					for (int i = 0; i < detail[0].length; i++)
						if (detail[0][i] != null && detail[1][i] != null)
						{
							g.drawString(detail[0][i], detail_x + dx, y + dy);
							g.drawString(detail[1][i], detail_x + dx + detail_w_title, y + dy);
							y += fm.getHeight();
						}

				}

			}

			g.setColor(new Color(0, 128, 0));
			y = detail_y + g.getFont().getSize();
			for (int i = 0; i < detail[0].length; i++)
				if (detail[0][i] != null && detail[1][i] != null)
				{
					g.drawString(detail[0][i], detail_x, y);
					g.drawString(detail[1][i], detail_x + detail_w_title, y);
					y += fm.getHeight();
				}

		}
		g.setColor(Color.gray);
		for (int i = 0; i < model.rowCount; i++)
			if (model.rowtips[i] != null)
			{
				g.drawLine(model.columns[0], getRows(i, h), w, getRows(i, h));
				g.drawLine(model.columns[0], getRows(i, h), model.columns[0], getRows(i, h) + 5);
			}

		painting = false;
	}

	private void paintSelectedCellViewSizeRects(Graphics g, CellView cv)
	{
		Rectangle rect = cv.getBounds();
		sizeRect_for_draw_only.drawOnly = cv != current_cellView;
		if (cv != current_cellView)
		{
			return;
		} else
		{
			int x1 = rect.x;
			int y1 = rect.y;
			int x3 = rect.x + rect.width;
			int y3 = rect.y + rect.height;
			int x2 = (x1 + x3) / 2;
			int y2 = (y1 + y3) / 2;
			sizeRect_for_draw_only.setPosition(x3, y2);
			sizeRect_for_draw_only.paint(g);
			sizeRect_for_draw_only.setPosition(x3, y3);
			sizeRect_for_draw_only.paint(g);
			sizeRect_for_draw_only.setPosition(x2, y3);
			sizeRect_for_draw_only.paint(g);
			sizeRect_for_draw_only.setPosition(x1, y3);
			sizeRect_for_draw_only.paint(g);
			sizeRect_for_draw_only.setPosition(x1, y2);
			sizeRect_for_draw_only.paint(g);
			sizeRect_for_draw_only.setPosition(x3, y1);
			sizeRect_for_draw_only.paint(g);
			sizeRect_for_draw_only.setPosition(x2, y1);
			sizeRect_for_draw_only.paint(g);
			sizeRect_for_draw_only.setPosition(x1, y1);
			sizeRect_for_draw_only.paint(g);
			return;
		}
	}

	private void unselectedAllCellViews()
	{
		int size = cells.size();
		for (int i = 0; i < size; i++)
			((CellView)cells.get(i)).setSelected(false);

	}

	public void mousePressed(MouseEvent e)
	{
		if (!itemEditor.isVisible())
			requestFocus();
		mouse_down_x = e.getX();
		mouse_down_y = e.getY();
		mouse_drag_x = e.getX();
		mouse_drag_y = e.getY();
		if (e.getButton() == 1)
		{
			JComponent c = getComponentSource(e.getX(), e.getY());
			mouse_down_component = c;
			if (current_cellView != null && (c instanceof SizeRect))
				current_sizeRect = (SizeRect)c;
			mouse_down_fim = null;
			if (c == null && !key_ctrl_down)
				unselectedAllCellViews();
			else
			if (c instanceof CellView)
			{
				CellView cv = (CellView)c;
				if (tabTravelOrderModel)
				{
					ItemModel im = cv.getModel().getItemModel();
					if (im instanceof FieldItemModel)
						mouse_down_fim = (FieldItemModel)im;
				} else
				if (!cv.isSelected() && !key_ctrl_down)
				{
					unselectedAllCellViews();
					cv.setSelected(true);
					current_cellView = cv;
					setSizeRects(cv);
				}
			}
		}
	}

	private void fitCellView(CellView cv, boolean moveOnly)
	{
		setChanged(true);
		Rectangle rect = cv.getBounds();
		int x1 = rect.x;
		int y1 = rect.y;
		int x2 = rect.x + rect.width;
		int y2 = rect.y + rect.height;
		int w = getBounds().width;
		int h = getBounds().height;
		CellModel cm = cv.getModel();
		TableModel tm = getModel();
		for (int i = 1; i < tm.columnCount; i++)
		{
			if (getColumns(i, w) <= x1)
				continue;
			if (getColumns(i, w) - x1 > x1 - getColumns(i - 1, w))
				cm.left = i - 1;
			else
				cm.left = i;
			break;
		}

		if (!moveOnly)
		{
			for (int i = cm.left + 1; i < tm.columnCount; i++)
			{
				if (getColumns(i, w) <= x2)
					continue;
				if (getColumns(i, w) - x2 > x2 - getColumns(i - 1, w))
					cm.colspan = i - 1 - cm.left;
				else
					cm.colspan = i - cm.left;
				break;
			}

		}
		for (int i = 1; i < tm.rowCount; i++)
		{
			if (getRows(i, h) <= y1)
				continue;
			if (getRows(i, h) - y1 > y1 - getRows(i - 1, h))
				cm.top = i - 1;
			else
				cm.top = i;
			break;
		}

		if (!moveOnly)
		{
			for (int i = cm.top + 1; i < tm.rowCount; i++)
			{
				if (getRows(i, h) <= y2)
					continue;
				if (getRows(i, h) - y2 > y2 - getRows(i - 1, h))
					cm.rowspan = i - 1 - cm.top;
				else
					cm.rowspan = i - cm.top;
				break;
			}

		}
		if (cm.colspan <= 0)
			cm.colspan = 1;
		if (cm.rowspan <= 0)
			cm.rowspan = 1;
		if (cm.left <= 0)
			cm.left = 0;
		if (cm.top <= 0)
			cm.top = 0;
		if (cm.left + cm.colspan >= tm.columnCount)
		{
			cm.colspan = tm.columnCount - cm.left - 1;
			if (cm.colspan <= 0)
			{
				cm.colspan = 1;
				cm.left = tm.columnCount - 2;
			}
		}
		if (cm.top + cm.rowspan >= tm.rowCount)
		{
			cm.rowspan = tm.rowCount - cm.top - 1;
			if (cm.rowspan <= 0)
			{
				cm.rowspan = 1;
				cm.top = tm.rowCount - 2;
			}
		}
	}

	public void mouseClicked(MouseEvent e)
	{
		JComponent c = getComponentSource(e.getX(), e.getY());
		if (e.getButton() == 3)
		{
			if (c == null)
				unselectedAllCellViews();
			else
			if (c instanceof CellView)
			{
				CellView cv = (CellView)c;
				if (!cv.isSelected())
				{
					unselectedAllCellViews();
					cv.setSelected(true);
					current_cellView = cv;
					setSizeRects(cv);
				}
			}
			resetMenuItems();
			menu.show(e.getX(), e.getY());
		}
		if (!tabTravelOrderModel)
		{
			if (e.getButton() == 1 && e.getClickCount() == 1)
				if (c == null)
				{
					current_cellView = null;
					unselectedAllCellViews();
				} else
				if (c instanceof CellView)
				{
					CellView cv = (CellView)c;
					if (key_ctrl_down)
					{
						cv.setSelected(!cv.isSelected());
					} else
					{
						current_cellView = cv;
						unselectedAllCellViews();
						cv.setSelected(true);
						setSizeRects(cv);
					}
				}
			if (e.getButton() == 1 && e.getClickCount() == 2)
			{
				if (mouse_down_component instanceof CellView)
				{
					CellView cv = (CellView)mouse_down_component;
					ItemModel item = cv.getModel().getItemModel();
					if (item instanceof FieldTextItemModel)
					{
						if (!mainPane.Ability_FieldTextItemEdit)
						{
							JOptionPane.showMessageDialog(this, "?????????§Ò???¦Á??????????");
							return;
						}
						itemEditor.setCellView(cv);
						itemEditor.setVisible(true);
						itemEditor.requestFocus();
					} else
					if (item instanceof TextItemModel)
					{
						if (!mainPane.Ability_TextItemEdit)
						{
							JOptionPane.showMessageDialog(this, "?????????§Ò?????????????");
							return;
						}
						webEditorStart();
					}
				}
			} else
			if (itemEditor.isVisible())
			{
				itemEditor.setVisible(false);
				FieldTextItemModel m = itemEditor.getItem();
				mainPane.renewDatabaseTree(m.field, m.text);
			}
			if (e.getClickCount() == 3)
				System.out.println(getModel().toString());
			renewCursor(e);
			repaint();
		}
		mainPane.renewSelectItem();
	}

	public void fetchWebEditorResult()
	{
		if (webEditingCell != null)
		{
			ItemModel itemModel = webEditingCell.getModel().getItemModel();
			if (itemModel instanceof TextItemModel)
			{
				TextItemModel item = (TextItemModel)itemModel;
				String html = mainPane.getHTMLEditorInnerHTML().toString();
				html = html.replaceAll(urlRelated, "");
				item.setText(html);
			}
			webEditingCell = null;
		}
	}

	public void mouseReleased(MouseEvent e)
	{
		if (!itemEditor.isVisible())
			requestFocus();
		if (tabTravelOrderModel)
		{
			JComponent c = getComponentSource(e.getX(), e.getY());
			if (c != null && (c instanceof CellView) && mouse_down_fim != null)
			{
				ItemModel im = ((CellView)c).getModel().getItemModel();
				if (im != mouse_down_fim && (im instanceof FieldItemModel))
				{
					FieldItemModel fim = (FieldItemModel)im;
					mouse_down_fim.setTabNext(fim);
					setChanged(true);
				}
			}
			mouse_down_fim = null;
			repaint();
		} else
		if (e.getButton() == 1)
		{
			current_sizeRect = null;
			int size = cells.size();
			if (mouse_down_component == null && selectionRect != null)
			{
				if (!key_ctrl_down)
					unselectedAllCellViews();
				int min_dis = -1;
				int x = e.getX();
				int y = e.getY();
				for (int i = 0; i < size; i++)
				{
					CellView cv = (CellView)cells.get(i);
					Rectangle cv_rect = cv.getBounds();
					if (cv_rect.intersects(selectionRect))
					{
						cv.setSelected(true);
						int curr_dis = -1;
						if (cv_rect.contains(x, y))
						{
							curr_dis = 0;
						} else
						{
							int t_x = Math.min(Math.abs(cv_rect.x - x), Math.abs((cv_rect.x + cv_rect.width) - x));
							int t_y = Math.min(Math.abs(cv_rect.y - y), Math.abs((cv_rect.y + cv_rect.height) - y));
							curr_dis = Math.max(t_x, t_y) * 1000 + Math.min(t_x, t_y);
						}
						if (min_dis > curr_dis || min_dis < 0)
						{
							min_dis = curr_dis;
							current_cellView = cv;
						}
					}
				}

				selectionRect = null;
			} else
			{
				boolean moveOnly = mouse_down_component instanceof CellView;
				for (int i = 0; i < size; i++)
				{
					CellView cv = (CellView)cells.get(i);
					if (cv.isSelected())
						fitCellView(cv, moveOnly);
				}

				boolean needRecover = false;
				for (int i = 0; i < size; i++)
				{
					CellView cv = (CellView)cells.get(i);
					if (cv.isSelected())
					{
						for (int j = 0; j < size; j++)
						{
							CellView cv_ = (CellView)cells.get(j);
							if (cv_ == cv || !cv.getModel().intersects(cv_.getModel()))
								continue;
							needRecover = true;
							break;
						}

					}
				}

				if (needRecover)
				{
					for (int i = 0; i < size; i++)
					{
						CellView cv = (CellView)cells.get(i);
						if (cv.isSelected())
							cv.recoverBounds();
					}

				} else
				{
					for (int i = 0; i < size; i++)
					{
						CellView cv = (CellView)cells.get(i);
						if (cv.isSelected())
							setCellPosition(cv);
					}

				}
			}
			if (current_cellView != null)
				setSizeRects(current_cellView);
			repaint();
		}
		mainPane.renewSelectItem();
	}

	private int getRows(int index, int height)
	{
		return model.rows[index];
	}

	private int getColumns(int index, int width)
	{
		return model.columns[index];
	}

	private void setSizeRects(CellView cv)
	{
		Rectangle rect = cv.getBounds();
		if (cv == current_cellView && itemEditor.isVisible() && itemEditor.getCellView() == cv)
		{
			itemEditor.setBounds(rect);
			itemEditor.revalidate();
		}
		int x1 = rect.x;
		int y1 = rect.y;
		int x3 = rect.x + rect.width;
		int y3 = rect.y + rect.height;
		int x2 = (x1 + x3) / 2;
		int y2 = (y1 + y3) / 2;
		size_east.setPosition(x3, y2);
		size_south_east.setPosition(x3, y3);
		size_south.setPosition(x2, y3);
		size_south_west.setPosition(x1, y3);
		size_west.setPosition(x1, y2);
		size_north_east.setPosition(x3, y1);
		size_north.setPosition(x2, y1);
		size_north_west.setPosition(x1, y1);
	}

	public void mouseDragged(MouseEvent e)
	{
		mouse_drag_x = e.getX();
		mouse_drag_y = e.getY();
		if (tabTravelOrderModel)
		{
			if (mouse_down_fim != null)
				repaint();
		} else
		if (mouse_down_component != null)
		{
			int dx = e.getX() - mouse_down_x;
			int dy = e.getY() - mouse_down_y;
			if (mouse_down_component instanceof CellView)
			{
				CellView cellView = (CellView)mouse_down_component;
				if (cellView.isSelected())
				{
					int size = cells.size();
					for (int i = 0; i < size; i++)
					{
						CellView cv = (CellView)cells.get(i);
						if (cv.isSelected())
						{
							Rectangle rect = cv.getBounds();
							rect.x += dx;
							rect.y += dy;
							cv.setBounds(rect);
						}
					}

					mouse_down_x = e.getX();
					mouse_down_y = e.getY();
				}
			} else
			if (current_sizeRect != null && current_cellView != null)
			{
				Rectangle rect = current_cellView.getBounds();
				int x1 = rect.x;
				int y1 = rect.y;
				int x2 = rect.x + rect.width;
				int y2 = rect.y + rect.height;
				if (current_sizeRect == size_east)
					x2 += dx;
				else
				if (current_sizeRect == size_south)
					y2 += dy;
				else
				if (current_sizeRect == size_west)
					x1 += dx;
				else
				if (current_sizeRect == size_north)
					y1 += dy;
				else
				if (current_sizeRect == size_south_east)
				{
					x2 += dx;
					y2 += dy;
				} else
				if (current_sizeRect == size_south_west)
				{
					x1 += dx;
					y2 += dy;
				} else
				if (current_sizeRect == size_north_east)
				{
					x2 += dx;
					y1 += dy;
				} else
				if (current_sizeRect == size_north_west)
				{
					x1 += dx;
					y1 += dy;
				}
				mouse_down_x = e.getX();
				mouse_down_y = e.getY();
				if (x2 < x1)
				{
					mouse_down_x += (x1 + 3) - x2;
					x2 = x1 + 3;
				}
				if (y2 < y1)
				{
					mouse_down_y += (y1 + 3) - y2;
					y2 = y1 + 3;
				}
				current_cellView.setBounds(x1, y1, x2 - x1, y2 - y1);
				setSizeRects(current_cellView);
			}
			repaint();
		} else
		if (mouse_down_component == null)
		{
			int x1 = Math.min(mouse_down_x, e.getX());
			int x2 = Math.max(mouse_down_x, e.getX());
			int y1 = Math.min(mouse_down_y, e.getY());
			int y2 = Math.max(mouse_down_y, e.getY());
			if (selectionRect == null)
				selectionRect = new Rectangle();
			selectionRect.x = x1;
			selectionRect.y = y1;
			selectionRect.width = x2 - x1;
			selectionRect.height = y2 - y1;
			repaint();
		}
	}

	private void renewCursor(MouseEvent e)
	{
		JComponent c = getComponentSource(e.getX(), e.getY());
		if (tabTravelOrderModel)
		{
			if (c != null && (c instanceof CellView))
			{
				CellModel cm = ((CellView)c).getModel();
				if (cm != null && cm.getItemModel() != null && (cm.getItemModel() instanceof FieldItemModel))
				{
					setCursor(cross_cursor);
					return;
				}
			}
			setCursor(normal_cursor);
		} else
		if (c == null)
			setCursor(normal_cursor);
		else
			setCursor(c.getCursor());
	}

	public void mouseMoved(MouseEvent e)
	{
		detailShowManager.mouseMoved(e);
		renewCursor(e);
	}

	public JComponent getComponentSource(int x, int y)
	{
		if (current_cellView != null)
		{
			if (size_east.contain(x, y))
				return size_east;
			if (size_south.contain(x, y))
				return size_south;
			if (size_west.contain(x, y))
				return size_west;
			if (size_north.contain(x, y))
				return size_north;
			if (size_south_east.contain(x, y))
				return size_south_east;
			if (size_south_west.contain(x, y))
				return size_south_west;
			if (size_north_east.contain(x, y))
				return size_north_east;
			if (size_north_west.contain(x, y))
				return size_north_west;
		}
		int size = cells.size();
		for (int i = 0; i < size; i++)
		{
			CellView cv = (CellView)cells.get(i);
			if (cv.getBounds().contains(x, y))
				return cv;
		}

		return null;
	}

	public void keyPressed(KeyEvent e)
	{
		if (e.getKeyCode() == 17)
			key_ctrl_down = true;
		else
		if (e.getKeyCode() == 127)
		{
			remove_cell_m_action();
			setChanged(true);
		}
	}

	public void keyReleased(KeyEvent e)
	{
		if (e.getKeyCode() == 17)
			key_ctrl_down = false;
	}

	public void addNoPositionCells(CellModel cellModels[])
	{
		setChanged(true);
		CellView cvs[] = new CellView[cellModels.length];
		URL url = null;
		try
		{
			url = mainPane.getURL();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		for (int i = 0; i < cvs.length; i++)
			cvs[i] = new CellView(cellModels[i], this, url);

		model.addNoPositionCells(cellModels);
		unselectedAllCellViews();
		for (int i = 0; i < cvs.length; i++)
		{
			cells.add(cvs[i]);
			setCellPosition(cvs[i]);
			cvs[i].setSelected(true);
		}

		setPreferredSize(new Dimension(model.width + 1, model.height + 1));
		setSize(model.width + 1, model.height + 1);
		for (Container c = this; c != null; c = c.getParent())
		{
			if (!(c instanceof JSplitPane))
				continue;
			((JSplitPane)c).revalidate();
			break;
		}

		repaint();
	}

	public void cmd_align(int align)
	{
		setChanged(true);
		int size = cells.size();
		for (int i = 0; i < size; i++)
		{
			CellView cv = (CellView)cells.get(i);
			if (cv.isSelected())
				cv.getModel().setAlign(align);
		}

	}

	public void cmd_valign(int valign)
	{
		setChanged(true);
		int size = cells.size();
		for (int i = 0; i < size; i++)
		{
			CellView cv = (CellView)cells.get(i);
			if (cv.isSelected())
				cv.getModel().setValign(valign);
		}

	}

	public void setTabTravelOrderModel(boolean tabTravelOrderModel)
	{
		if (tabTravelOrderModel)
			setCursor(cross_cursor);
		else
			setCursor(normal_cursor);
		this.tabTravelOrderModel = tabTravelOrderModel;
		repaint();
	}

	public boolean getTabTravelOrderModel()
	{
		return tabTravelOrderModel;
	}

	public void initMenu()
	{
		menu.add(remove_cell_m);
		menu.add(edit_table_css_m);
		menu.add(edit_cell_css_m);
		menu.add(edit_item_css_m);
		menu.add(edit_item_id_m);
		menu.add(edit_item_action_m);
		menu.add(hidden_item_action_m);
	}

	private boolean can_edit_cell_css_m_valid()
	{
		int size = cells.size();
		for (int i = 0; i < size; i++)
		{
			CellView cv = (CellView)cells.get(i);
			if (cv.isSelected())
				return true;
		}

		return false;
	}

	private boolean can_edit_item_css_m_valid()
	{
		int size = cells.size();
		for (int i = 0; i < size; i++)
		{
			CellView cv = (CellView)cells.get(i);
			if (cv.isSelected() && (cv.getModel().item instanceof FieldItemModel))
				return true;
		}

		return false;
	}

	private void resetMenuItems()
	{
		int size = cells.size();
		boolean init = size > 0;
		remove_cell_m.setVisible(init);
		edit_table_css_m.setVisible(true);
		edit_cell_css_m.setVisible(init);
		edit_item_css_m.setVisible(false);
		edit_item_id_m.setVisible(init);
		edit_item_action_m.setVisible(false);
		hidden_item_action_m.setVisible(init);
		for (int i = 0; i < size; i++)
		{
			CellView cv = (CellView)cells.get(i);
			if (cv.isSelected())
			{
				ItemModel im = cv.getModel().item;
				if (!(im instanceof FieldItemModel))
				{
					edit_item_action_m.setVisible(false);
					hidden_item_action_m.setVisible(false);
					return;
				}
			}
		}

	}

	public void menuActionPerformed(ActionEvent e, MyMenuItem item)
	{
		setChanged(true);
		if (item == remove_cell_m)
			remove_cell_m_action();
		else
		if (item == edit_table_css_m)
		{
			String css_class = (new CssDialog(getFrame(this), 0, getModel().css_class, "???\361?????", true)).getCss();
			if (css_class != null)
				getModel().css_class = css_class;
		} else
		if (item == edit_cell_css_m)
		{
			int size = cells.size();
			String css_ = null;
			for (int i = 0; i < size; i++)
			{
				CellView cv = (CellView)cells.get(i);
				if (!cv.isSelected())
					continue;
				String temp_css = cv.getModel().css_class;
				if (temp_css == null || temp_css.length() <= 0)
					continue;
				css_ = cv.getModel().css_class;
				break;
			}

			String css_class = (new CssDialog(getFrame(this), 1, css_, "???\361?????", true)).getCss();
			if (css_class != null)
			{
				if (css_class.length() == 0)
					css_class = null;
				for (int i = 0; i < size; i++)
				{
					CellView cv = (CellView)cells.get(i);
					if (cv.isSelected())
						cv.getModel().setCss_class(css_class);
				}

			}
		} else
		if (item == edit_item_css_m)
		{
			int size = cells.size();
			String css_ = null;
			for (int i = 0; i < size; i++)
			{
				CellView cv = (CellView)cells.get(i);
				if (cv.isSelected() && (cv.getModel().item instanceof FieldItemModel))
				{
					FieldItemModel fim = (FieldItemModel)cv.getModel().item;
					if (fim.css_class != null && fim.css_class.length() > 0)
						css_ = fim.css_class;
				}
			}

			String css_class = (new CssDialog(getFrame(this), 2, css_, "???\361?????", true)).getCss();
			if (css_class != null)
			{
				if (css_class.length() == 0)
					css_class = null;
				for (int i = 0; i < size; i++)
				{
					CellView cv = (CellView)cells.get(i);
					if (cv.isSelected() && (cv.getModel().item instanceof FieldItemModel))
						((FieldItemModel)cv.getModel().item).css_class = css_class;
				}

			}
		} else
		if (item == edit_item_id_m)
		{
			int size = cells.size();
			String id_ = null;
			for (int i = 0; i < size; i++)
			{
				CellView cv = (CellView)cells.get(i);
				if (cv.isSelected())
				{
					ItemModel fim = cv.getModel().item;
					if (fim.getId() != null && fim.getId().length() > 0)
						id_ = fim.getId();
				}
			}

			String id = JOptionPane.showInputDialog(this, "???????id", id_);
			if (id != null)
			{
				if (id.length() == 0)
					id = null;
				for (int i = 0; i < size; i++)
				{
					CellView cv = (CellView)cells.get(i);
					if (cv.isSelected())
						cv.getModel().item.setId(id);
				}

			}
		} else
		if (item == edit_item_action_m)
		{
			int size = cells.size();
			String action_ = null;
			for (int i = 0; i < size; i++)
			{
				CellView cv = (CellView)cells.get(i);
				if (cv.isSelected() && (cv.getModel().item instanceof FieldItemModel))
				{
					FieldItemModel fim = (FieldItemModel)cv.getModel().item;
					if (fim.action != null && fim.action.length() > 0)
						action_ = fim.action;
				}
			}

			String action = JOptionPane.showInputDialog(this, "??????¦Ì?????", action_);
			if (action != null)
			{
				if (action.length() == 0)
					action = null;
				for (int i = 0; i < size; i++)
				{
					CellView cv = (CellView)cells.get(i);
					if (cv.isSelected() && (cv.getModel().item instanceof FieldItemModel))
						((FieldItemModel)cv.getModel().item).action = action;
				}

			}
		} else
		if (item == hidden_item_action_m)
		{
			int size = cells.size();
			boolean hidden = false;
			for (int i = 0; i < size; i++)
			{
				CellView cv = (CellView)cells.get(i);
				if (!cv.isSelected() || !(cv.getModel().item instanceof FieldItemModel) || ((FieldItemModel)cv.getModel().item).hidden)
					continue;
				hidden = true;
				break;
			}

			for (int i = 0; i < size; i++)
			{
				CellView cv = (CellView)cells.get(i);
				if (cv.isSelected() && (cv.getModel().item instanceof FieldItemModel))
					((FieldItemModel)cv.getModel().item).hidden = hidden;
			}

		}
	}

	private void webEditorStart()
	{
		webEditingCell = current_cellView;
		Rectangle r = webEditingCell.getBounds();
		if (current_cellView != null)
		{
			ItemModel itemModel = current_cellView.getModel().getItemModel();
			if (itemModel instanceof TextItemModel)
			{
				int align = webEditingCell.getModel().align;
				int valign = webEditingCell.getModel().valign;
				String valignStr;
				if (valign == 2)
					valignStr = "bottom";
				else
				if (valign == 1)
					valignStr = "center";
				else
					valignStr = "top";
				String alignStr;
				if (align == 0)
					alignStr = "left";
				else
				if (align == 1)
					alignStr = "center";
				else
					alignStr = "right";
				mainPane.setHTMLEditorInnerHTML(itemModel.getText(), alignStr, valignStr);
			}
		}
	}

	public static Frame getFrame(Container c)
	{
		do
		{
			if (c == null || (c instanceof Frame))
				return (Frame)c;
			c = c.getParent();
		} while (true);
	}

	private void remove_cell_m_action()
	{
		Vector selectedCells = new Vector();
		boolean valid = true;
		for (int i = 0; i < cells.size(); i++)
		{
			CellView cv = (CellView)cells.get(i);
			if (cv.isSelected())
			{
				selectedCells.add(cv);
				if (!mainPane.Ability_FieldItemRemove && (cv.getModel().getItemModel() instanceof FieldItemModel))
					valid = false;
				if (!mainPane.Ability_FieldTextItemRemoveAndInsert && (cv.getModel().getItemModel() instanceof FieldTextItemModel))
					valid = false;
				if (!mainPane.Ability_TextItemEdit && (cv.getModel().getItemModel() instanceof TextItemModel))
					valid = false;
			}
		}

		if (!valid && JOptionPane.showConfirmDialog(this, "??????????????????§Ö????\r\n?????????????????????????????", "??????", 0) != 0)
			return;
		for (int i = 0; i < selectedCells.size(); i++)
		{
			CellView cv = (CellView)selectedCells.get(i);
			ItemModel item = cv.getModel().item;
			if (item instanceof FieldItemModel)
			{
				FieldItemModel fim = (FieldItemModel)item;
				if (fim.tabLast != null)
					fim.tabLast.tabNext = fim.tabNext;
				if (fim.tabNext != null)
					fim.tabNext.tabLast = fim.tabLast;
				fim.tabLast = null;
				fim.tabNext = null;
			}
			removeCell(cv);
		}

		repaint();
	}

	public void finalize()
	{
		detailShowManager.end();
	}

	void showDetail(int x, int y)
	{
		JComponent c = getComponentSource(x, y);
		if (c != null && (c instanceof CellView))
		{
			CellView cv = (CellView)c;
			detail = cv.getDetailMsg();
			detail_x = x;
			detail_y = y + 20;
		} else
		{
			detail = null;
		}
		repaint();
	}

	void closeDetail()
	{
		detail = null;
		repaint();
	}

}
