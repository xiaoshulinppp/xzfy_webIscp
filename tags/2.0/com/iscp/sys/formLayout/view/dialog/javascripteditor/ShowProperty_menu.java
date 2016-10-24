// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ScriptTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import java.awt.*;
import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.LineBorder;
import javax.swing.text.Document;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			ShowProperty_menu_listCellRenderer, PropertyModel, ColoredTextArea, ScriptTextArea

class ShowProperty_menu extends JScrollPane
{

	ColoredTextArea textarea;
	ListModel lastModel;
	JList list;
	private static Border lineBorder = LineBorder.createBlackLineBorder();

	public ShowProperty_menu(ColoredTextArea textarea)
	{
		list = new JList();
		list.setCellRenderer(new ShowProperty_menu_listCellRenderer());
		setVisible(false);
		getViewport().add(list);
		this.textarea = textarea;
		setBorder(lineBorder);
	}

	private char getDictCharAt(int x, int y)
	{
		if (y > list.getModel().getSize())
			return '\177';
		if (y < 0)
			return '\201';
		Object o = list.getModel().getElementAt(y);
		if (!(o instanceof PropertyModel))
			return '\0';
		String d = ((PropertyModel)o).name;
		if (d.length() > x)
			return d.charAt(x);
		else
			return '\0';
	}

	public void autoFit(int start)
	{
		int end = textarea.getCaretPosition();
		int length = end - start;
		if (length < 0)
		{
			if (textarea instanceof ScriptTextArea)
				((ScriptTextArea)textarea).setPropertySelect(false);
			return;
		}
		String text = textarea.getText();
		int max = list.getModel().getSize();
		int min = 0;
		int newMax = max;
		int newMin = min;
		int curr = max + min >> 1;
		if (length == 0)
			curr = 0;
		for (int i = 0; i < length; i++)
		{
			if (i + start < 0 || i + start > text.length())
				return;
			char t = text.charAt(i + start);
			max = newMax;
			min = newMin;
			int lastMax = max;
			int lastMin = min;
			do
			{
				curr = max + min >> 1;
				char c = getDictCharAt(i, curr);
				char cn = getDictCharAt(i, curr - 1);
				if (c > t && cn <= t)
					break;
				if (c <= t)
				{
					if (min == curr)
					{
						curr = max;
						break;
					}
					min = curr;
					continue;
				}
				if (max == curr)
					break;
				max = curr;
			} while (true);
			newMax = curr;
			min = lastMin;
			max = lastMax;
			do
			{
				curr = max + min >> 1;
				char c = getDictCharAt(i, curr);
				char cn = getDictCharAt(i, curr - 1);
				if (c >= t && cn < t)
					break;
				if (c < t)
				{
					if (min == curr)
						break;
					min = curr;
					continue;
				}
				if (max == curr)
				{
					curr = min;
					break;
				}
				max = curr;
			} while (true);
			newMin = curr;
			if (newMax - newMin > 1)
				continue;
			curr = newMin;
			break;
		}

		list.ensureIndexIsVisible(curr);
		list.setSelectedIndex(curr);
	}

	public void selectionProcess(int start)
	{
		int i = start;
		String text;
		for (text = textarea.getText(); i < text.length() && !ScriptTextArea.isDivideChar(text.charAt(i)); i++);
		int end = i;
		try
		{
			PropertyModel pro = (PropertyModel)list.getSelectedValue();
			String insertStr = pro.name;
			int backPosition = 1;
			if (pro.method)
				if (end < text.length() && text.charAt(end) == '(')
				{
					backPosition = -1;
				} else
				{
					insertStr = (new StringBuilder(String.valueOf(insertStr))).append("()").toString();
					if ("void".equals(pro.returnType))
					{
						insertStr = (new StringBuilder(String.valueOf(insertStr))).append(";").toString();
						backPosition = 2;
					}
				}
			textarea.getDocument().remove(start, end - start);
			textarea.getDocument().insertString(start, insertStr, null);
			if (pro.method && pro.param.length > 0)
				textarea.setCaretPosition((start + insertStr.length()) - backPosition);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public void moveEnd()
	{
		int size = list.getModel().getSize();
		list.ensureIndexIsVisible(size);
		list.setSelectedIndex(size);
	}

	public void moveHome()
	{
		list.ensureIndexIsVisible(0);
		list.setSelectedIndex(0);
	}

	public void movePageUp()
	{
		move(-5);
	}

	public void movePageDown()
	{
		move(5);
	}

	public void moveUp()
	{
		move(-1);
	}

	public void moveDown()
	{
		move(1);
	}

	private void move(int step)
	{
		int index = list.getSelectedIndex();
		int size = list.getModel().getSize();
		index += step;
		if (index < 0)
			index = 0;
		if (index >= size)
			index = size - 1;
		list.ensureIndexIsVisible(index);
		list.setSelectedIndex(index);
	}

	public void paint(Graphics g)
	{
		if (lastModel != list.getModel())
		{
			lastModel = list.getModel();
			DefaultListModel model = (DefaultListModel)lastModel;
			FontMetrics fm = g.getFontMetrics();
			int max = 0;
			for (int i = 0; i < model.size(); i++)
			{
				int w = fm.stringWidth(((PropertyModel)model.get(i)).getExpress());
				if (max < w)
					max = w;
			}

			Rectangle r = getBounds();
			if (max > 200)
				max = 200;
			setBounds(r.x, r.y, max + 30, r.height);
		}
		super.paint(g);
	}

	public void setModel(ListModel model)
	{
		list.setModel(model);
	}

	public void requestFocus()
	{
		list.requestFocus();
	}

}
