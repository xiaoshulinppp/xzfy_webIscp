// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TipView.java

package com.iscp.sys.formLayout.view;

import com.iscp.sys.formLayout.model.RowTip;
import com.iscp.sys.formLayout.model.TableModel;
import com.iscp.sys.formLayout.view.base.MouseEventComponent;
import com.iscp.sys.formLayout.view.base.MyMenu;
import com.iscp.sys.formLayout.view.base.MyMenuItem;
import com.iscp.sys.formLayout.view.base.RectPattern;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.MouseEvent;
import javax.swing.JOptionPane;
import javax.swing.JViewport;

// Referenced classes of package com.iscp.sys.formLayout.view:
//			MyMenuSourcePane, MainPane, TableView

public class TipView extends MouseEventComponent
	implements MyMenuSourcePane
{

	private MyMenu menu;
	private TableView tv;
	private TableModel tm;
	private JViewport viewport;
	private int selectedTipIndex;
	private int selectedTipY;
	private MainPane mainPane;
	private int tipWidth;
	private boolean changed;
	private int mousedownY;
	private MyMenuItem insert_m;
	private MyMenuItem edit_m;
	private MyMenuItem remove_m;

	public TipView(MainPane mainPane)
	{
		menu = new MyMenu(this);
		tipWidth = 1;
		insert_m = new MyMenuItem("?????งา?", "");
		edit_m = new MyMenuItem("????id", "");
		remove_m = new MyMenuItem("????งา?", "");
		this.mainPane = mainPane;
		tv = mainPane.getTableView();
		tm = tv.getModel();
		viewport = new JViewport();
		viewport.add(this);
		changed = true;
		initMenu();
	}

	public JViewport getViewport()
	{
		return viewport;
	}

	public void paint(Graphics g)
	{
		TableModel model = tv.getModel();
		if (changed || tm != tv.getModel())
		{
			tipWidth = 10;
			for (int i = 0; i < model.rowCount; i++)
				if (model.rowtips[i] != null && model.rowtips[i].id != null)
				{
					int w = g.getFontMetrics().stringWidth(model.rowtips[i].id);
					if (tipWidth < 20)
						tipWidth = 20;
					if (w > tipWidth)
						tipWidth = w;
				}

			tm = tv.getModel();
			changed = false;
			setPreferredSize(new Dimension(tipWidth + 3, 1000));
			viewport.setPreferredSize(new Dimension(tipWidth + 3, 1000));
			revalidate();
		}
		Color background = Color.lightGray;
		Color foreground = Color.gray;
		for (int i = 0; i < model.rowCount; i++)
		{
			int y = model.rows[i];
			paintTip(g, i, y, background, foreground);
		}

		background = RectPattern.MYBLUE;
		if (selectedTipIndex >= 0 && tv.getModel().rowtips[selectedTipIndex] != null)
			paintTip(g, selectedTipIndex, selectedTipY, background, foreground);
	}

	private void paintTip(Graphics g, int index, int y, Color background, Color foreground)
	{
		TableModel model = tv.getModel();
		int height = g.getFont().getSize();
		if (index < 0 || index >= model.rowtips.length)
			return;
		if (model.rowtips[index] != null)
		{
			g.setColor(background);
			g.fillRect(1, y, tipWidth + 1, height + 1);
			g.setColor(foreground);
			g.drawRect(0, y - 1, tipWidth + 2, height + 2);
			if (model.rowtips[index].id != null)
				g.drawString(model.rowtips[index].id, 1, y + height);
		}
	}

	private int getTipIndexWithY(int y)
	{
		TableModel model = tv.getModel();
		for (int i = 0; i < model.rowCount - 2; i++)
			if (model.rows[i + 1] > y)
				return i;

		return 0;
	}

	public void mousePressed(MouseEvent e)
	{
		selectedTipIndex = -1;
		if (e.getButton() == 1 || e.getButton() == 3)
		{
			TableModel model = tv.getModel();
			int i = getTipIndexWithY(e.getY());
			selectedTipIndex = i;
			selectedTipY = model.rows[i];
			mousedownY = selectedTipY - e.getY();
			repaintWithTableView();
		}
		if (e.getButton() == 3)
		{
			resetMenu();
			menu.show(e.getX(), e.getY());
		}
	}

	public void mouseReleased(MouseEvent e)
	{
		if (e.getButton() == 1 || e.getButton() == 3)
		{
			TableModel model = tv.getModel();
			int i = getTipIndexWithY(e.getY());
			if (model.rowtips[i] == null)
			{
				model.rowtips[i] = model.rowtips[selectedTipIndex];
				model.rowtips[selectedTipIndex] = null;
			}
			if (e.getButton() == 1)
				selectedTipIndex = -1;
			repaintWithTableView();
		}
	}

	private void repaintWithTableView()
	{
		repaint();
		tv.repaint();
	}

	public void mouseDragged(MouseEvent e)
	{
		if (selectedTipIndex >= 0 && tv.getModel().rowtips[selectedTipIndex] != null)
		{
			selectedTipY = mousedownY + e.getY();
			repaint();
			mainPane.setChanged(true);
		}
	}

	private void initMenu()
	{
		menu.add(insert_m);
		menu.add(edit_m);
		menu.add(remove_m);
	}

	private void resetMenu()
	{
		TableModel model = tv.getModel();
		if (selectedTipIndex >= 0)
		{
			insert_m.setVisible(model.rowtips[selectedTipIndex] == null);
			edit_m.setVisible(model.rowtips[selectedTipIndex] != null);
			remove_m.setVisible(model.rowtips[selectedTipIndex] != null);
		}
	}

	private void edit_m_action()
	{
		TableModel model = tv.getModel();
		String initId = model.rowtips[selectedTipIndex].id;
		if (initId == null)
			initId = "";
		String id = JOptionPane.showInputDialog(this, "????id", initId);
		if (id != null)
			if (id.length() == 0)
				model.rowtips[selectedTipIndex].id = null;
			else
				model.rowtips[selectedTipIndex].id = id;
	}

	public void menuActionPerformed(ActionEvent e, MyMenuItem item)
	{
		TableModel model = tv.getModel();
		if (selectedTipIndex < 0)
			return;
		mainPane.setChanged(true);
		if (item == insert_m)
			model.rowtips[selectedTipIndex] = new RowTip();
		else
		if (item == edit_m)
			edit_m_action();
		else
		if (item == remove_m)
			model.rowtips[selectedTipIndex] = null;
		changed = true;
		selectedTipIndex = -1;
		repaintWithTableView();
	}
}
