// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyToolBar.java

package com.iscp.sys.formLayout.view.base;

import com.iscp.sys.formLayout.view.icon.MyIcon;
import java.awt.*;
import java.awt.event.MouseEvent;
import javax.swing.JComponent;

// Referenced classes of package com.iscp.sys.formLayout.view.base:
//			MouseEventComponent, MySelectMenu, GrayImageFilter, MyOperPane, 
//			RectPattern

public class MyToolBar extends MouseEventComponent
{

	private Image buttons[];
	private Image buttons_invalid[];
	private MySelectMenu selectMenu[];
	private boolean selected[];
	private boolean valid[];
	private String toolTips[];
	private int buttonSize;
	private MyOperPane pane;
	private boolean mousedown;
	private int leftBlankSize;
	private int mouse_x;
	private static Color SELECTEDCOLOR = new Color(192, 255, 128);
	private static Image titleIcon = getImage("title.gif");
	private static String title = "?????????????";

	public void setSelected(int selectedIndex, boolean selected)
	{
		this.selected[selectedIndex] = selected;
	}

	public void setValid(int validIndex, boolean valid)
	{
		this.valid[validIndex] = valid;
	}

	public boolean getValid(int validIndex)
	{
		return valid[validIndex];
	}

	public void setSelectMenu(int index, MySelectMenu selectMenu)
	{
		this.selectMenu[index] = selectMenu;
	}

	public void setButtonCount(int buttonCount)
	{
		selectMenu = new MySelectMenu[buttonCount];
		buttons = new Image[buttonCount];
		buttons_invalid = new Image[buttonCount];
		selected = new boolean[buttonCount];
		valid = new boolean[buttonCount];
		toolTips = new String[buttonCount];
		for (int i = 0; i < buttonCount; i++)
			valid[i] = true;

	}

	private Image getButton_invalid(int index)
	{
		if (buttons_invalid[index] == null)
			buttons_invalid[index] = GrayImageFilter.getImage(buttons[index], this);
		return buttons_invalid[index];
	}

	public void setButtonSize(int buttonSize)
	{
		this.buttonSize = buttonSize;
	}

	public int getButtonSize()
	{
		return buttonSize;
	}

	public String[] getToolTips()
	{
		return toolTips;
	}

	public MyToolBar(MyOperPane pane)
	{
		buttonSize = 23;
		mousedown = false;
		leftBlankSize = 6;
		mouse_x = -1;
		this.pane = pane;
		setBackground(new Color(128, 192, 255));
	}

	public void mousePressed(MouseEvent e)
	{
		super.mousePressed(e);
		if (e.getButton() == 1)
		{
			int index = (e.getX() - leftBlankSize) / buttonSize;
			if (valid != null && index < valid.length && valid[index] && selectMenu[index] != null)
			{
				Component c = this;
				int x = index * buttonSize + leftBlankSize;
				for (; c != pane; c = c.getParent())
					x += c.getBounds().x;

				selectMenu[index].show((JComponent)pane, x, getBounds().height);
				return;
			}
		}
		mousedown = true;
		repaint();
	}

	public void mouseReleased(MouseEvent e)
	{
		super.mouseReleased(e);
		mousedown = false;
		repaint();
	}

	public void mouseExited(MouseEvent e)
	{
		super.mouseExited(e);
		mouse_x = -1;
		repaint();
	}

	public void mouseEntered(MouseEvent e)
	{
		super.mouseEntered(e);
		mouse_x = e.getX();
		repaint();
	}

	public void mouseMoved(MouseEvent e)
	{
		mouse_x = e.getX();
		int index = (e.getX() - leftBlankSize) / buttonSize;
		if (toolTips != null && index < toolTips.length && toolTips[index] != null)
			setToolTipText(toolTips[index]);
		else
			setToolTipText("");
		repaint();
	}

	public void mouseDragged(MouseEvent e)
	{
		mouse_x = -1;
		repaint();
	}

	public void mouseClicked(MouseEvent e)
	{
		super.mouseClicked(e);
		if (e.getButton() == 1)
		{
			int index = (e.getX() - leftBlankSize) / buttonSize;
			if (valid != null && index < valid.length && valid[index])
				pane.buttonClicked(index);
		}
	}

	public void paint(Graphics g)
	{
		int x = leftBlankSize;
		int width = getBounds().width;
		int height = getBounds().height;
		if (buttons != null && selected != null)
		{
			RectPattern.paintBack(g, 0, 0, width, height, getBackground(), this);
			int titleLen = g.getFontMetrics().stringWidth(title);
			g.setColor(new Color(0, 128, 192));
			for (int i = 0; i < buttons.length; i++)
			{
				int w = buttons[i].getWidth(this);
				int h = buttons[i].getHeight(this);
				int tx = x + (buttonSize - w) / 2;
				int ty = (height - h) / 2;
				int ry = ((height - buttonSize) + 3) / 2;
				if (valid[i])
				{
					if (!selected[i] && mouse_x < x + buttonSize && mouse_x > x)
					{
						g.setColor(getBackground());
						g.draw3DRect(x + 1, ry, buttonSize - 3, buttonSize - 3, !mousedown);
					} else
					if (selected[i])
					{
						g.setColor(SELECTEDCOLOR);
						g.fillRect(x + 1, ry, buttonSize - 3, buttonSize - 3);
						g.setColor(getBackground());
						g.draw3DRect(x + 1, ry, buttonSize - 3, buttonSize - 3, false);
					}
					g.drawImage(buttons[i], tx, ty + 1, this);
				} else
				{
					g.drawImage(getButton_invalid(i), tx, ty + 1, this);
				}
				x += buttonSize;
			}

		}
	}

	public void setButtons(Image buttons[])
	{
		this.buttons = buttons;
	}

	public Image[] getButtons()
	{
		return buttons;
	}

	public static Image getImage(String fileName)
	{
		return MyIcon.getImage(fileName);
	}

}
