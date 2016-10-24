// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CssDialog.java

package com.iscp.sys.formLayout.view.dialog;

import java.awt.Frame;
import javax.swing.JComboBox;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog:
//			InputDialog

public class CssDialog extends InputDialog
{

	public static final int TABLE_CSS = 0;
	public static final int CELL_CSS = 1;
	public static final int ITEM_CSS = 2;
	private int type;
	private static String css_classes_table[] = {
		"??", "tabout"
	};
	private static String css_classes_cell[] = {
		"??", "tdFormText", "tdFormInput"
	};
	private static String css_classes_item[] = {
		"??", "textarea"
	};
	private static JComboBox cssSelect;
	private String css_result;

	public CssDialog(Frame frame, int type, String default_css, String title, boolean modal)
	{
		super(frame, title, modal);
		this.type = type;
		if (type == 0)
			cssSelect = new JComboBox(css_classes_table);
		else
		if (type == 1)
			cssSelect = new JComboBox(css_classes_cell);
		else
		if (type == 2)
			cssSelect = new JComboBox(css_classes_item);
		if (default_css != null)
			cssSelect.setSelectedItem(default_css);
		else
			cssSelect.setSelectedIndex(0);
		init();
	}

	private void init()
	{
		cssSelect.setBorder(null);
		addItem("css???", cssSelect);
	}

	public void cmd_ok()
	{
		if (cssSelect.getSelectedIndex() <= 0)
			css_result = "";
		else
			css_result = cssSelect.getSelectedItem().toString();
		setVisible(false);
	}

	public void cmd_cancel()
	{
		setVisible(false);
	}

	public String getCss()
	{
		setVisible(true);
		return css_result;
	}

}
