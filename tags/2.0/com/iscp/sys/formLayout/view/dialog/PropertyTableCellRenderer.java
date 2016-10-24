// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   PropertyTable.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.Component;
import java.awt.Font;
import javax.swing.*;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableModel;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			PropertyTable

class PropertyTableCellRenderer
	implements TableCellRenderer
{

	private JTextArea stringView;
	private JCheckBox booleanView;
	private JComboBox selectView;
	private PropertyTable host;

	public PropertyTableCellRenderer(PropertyTable host)
	{
		stringView = new JTextArea();
		this.host = host;
	}

	public void setTypeNames(String typeNames[])
	{
		selectView.removeAllItems();
		for (int i = 0; i < typeNames.length; i++)
			selectView.addItem(typeNames[i]);

	}

	public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column)
	{
		Object o = host.getModel().getValueAt(row, column);
		Component c;
		if (o instanceof Component)
		{
			c = (Component)o;
		} else
		{
			stringView.setText(o.toString());
			c = stringView;
		}
		return c;
	}

	public void setFont(Font f)
	{
		stringView.setFont(f);
		booleanView.setFont(f);
		selectView.setFont(f);
	}
}
