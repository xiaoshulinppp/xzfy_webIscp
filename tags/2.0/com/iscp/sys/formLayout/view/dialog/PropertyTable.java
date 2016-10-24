// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   PropertyTable.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.*;
import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.LineBorder;
import javax.swing.table.*;
import javax.swing.text.Document;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			PropertyTableCellEditor, PropertyTableCellRenderer, DetailPane_ItemInputHeadCellRenderer, DetailPane_ItemInputActionListener, 
//			DetailPane_ItemInputDocumentListener, DetailPane

public class PropertyTable extends JTable
{

	private DefaultTableModel model;
	private static final int DEFAULTBUTTONSIZE = 15;
	private static final Border lineBorder = LineBorder.createBlackLineBorder();
	private DetailPane detail;
	private Color backColor;
	private boolean needRevalidate;

	public PropertyTable(DetailPane detail)
	{
		model = new DefaultTableModel();
		backColor = Color.white;
		needRevalidate = true;
		this.detail = detail;
		setModel(model);
		String propertyName = " Ù–‘";
		String valueName = "÷µ";
		model.addColumn(propertyName);
		model.addColumn(valueName);
		getColumn(propertyName).setCellEditor(new PropertyTableCellEditor(this));
		getColumn(valueName).setCellEditor(new PropertyTableCellEditor(this));
		getColumn(valueName).setCellRenderer(new PropertyTableCellRenderer(this));
		getTableHeader().setDefaultRenderer(new DetailPane_ItemInputHeadCellRenderer());
		setOpaque(true);
	}

	public void setContainerEnable(JComponent c, boolean enable)
	{
		for (int i = 0; i < c.getComponentCount(); i++)
			c.getComponent(i).setEnabled(enable);

		c.setEnabled(enable);
	}

	public void setAllEnable(boolean enable)
	{
		for (int i = 0; i < model.getRowCount(); i++)
		{
			Object o = model.getValueAt(i, 1);
			if (o instanceof JComponent)
				setContainerEnable((JComponent)o, enable);
		}

	}

	public JLabel addItem_(String label, JComponent c, JButton b[])
	{
		return addItem_(label, c, b, 15);
	}

	public JLabel addItem_(String label, JComponent c, JButton b)
	{
		return addItem_(label, c, b, 15);
	}

	public JLabel addItem_(String label, JComponent c, JButton b, int buttonWidth)
	{
		JButton bs[] = new JButton[1];
		bs[0] = b;
		return addItem_(label, c, bs, buttonWidth);
	}

	public JLabel addItem_(String label, JComponent c, JButton b[], int buttonWidth)
	{
		JLabel l = addItem(label, c, b, buttonWidth);
		addListener(c);
		for (int i = 0; i < b.length; i++)
			b[i].addActionListener(new DetailPane_ItemInputActionListener(detail, b[i]));

		return l;
	}

	public void addListener(JComponent c)
	{
		if (c instanceof JCheckBox)
		{
			JCheckBox cb = (JCheckBox)c;
			cb.addActionListener(new DetailPane_ItemInputActionListener(detail, cb));
		} else
		if (c instanceof JComboBox)
		{
			JComboBox cb = (JComboBox)c;
			cb.addActionListener(new DetailPane_ItemInputActionListener(detail, cb));
		} else
		if (c instanceof JTextField)
		{
			JTextField cb = (JTextField)c;
			cb.setBorder(null);
			cb.getDocument().addDocumentListener(new DetailPane_ItemInputDocumentListener(detail, cb));
		}
	}

	public JLabel addItem_(String label, JComponent c)
	{
		JLabel l = addItem(label, c);
		addListener(c);
		return l;
	}

	public JLabel addItem(String label, JComponent c, JButton b[], int buttonWidth)
	{
		Box box = Box.createHorizontalBox();
		JPanel p = new JPanel();
		box.setBackground(p.getBackground());
		box.add(c);
		box.add(p);
		p.setBackground(backColor);
		c.setBackground(backColor);
		for (int i = 0; i < b.length; i++)
		{
			b[i].setMaximumSize(new Dimension(buttonWidth, buttonWidth));
			box.add(b[i]);
		}

		JLabel l = addItem(label, ((JComponent) (box)));
		return l;
	}

	public JLabel addItem(String label, JComponent c)
	{
		JLabel l = new JLabel(label);
		Object row[] = new Object[2];
		row[0] = label;
		row[1] = c;
		c.setBackground(backColor);
		model.addRow(row);
		return l;
	}

	public void paint(Graphics g)
	{
		super.paint(g);
		if (needRevalidate)
		{
			revalidate();
			needRevalidate = false;
			super.paint(g);
		}
	}

}
