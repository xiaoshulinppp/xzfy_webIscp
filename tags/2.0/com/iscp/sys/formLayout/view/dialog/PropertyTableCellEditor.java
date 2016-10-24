// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   PropertyTable.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.Component;
import javax.swing.*;
import javax.swing.table.TableModel;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			PropertyTable

class PropertyTableCellEditor extends DefaultCellEditor
{

	private Component c;
	private JLabel text;
	private PropertyTable host;

	public PropertyTableCellEditor(PropertyTable host)
	{
		super(new JTextField());
		this.host = host;
		setClickCountToStart(0);
		text = new JLabel();
	}

	public Object getCellEditorValue()
	{
		if (c == text)
			return text.getText();
		else
			return c;
	}

	public Component getTableCellEditorComponent(JTable table, Object value, boolean isSelected, int row, int column)
	{
		Object o = host.getModel().getValueAt(row, column);
		if (column == 1)
		{
			c = (Component)o;
		} else
		{
			text.setText(o.toString());
			c = text;
		}
		return c;
	}
}
