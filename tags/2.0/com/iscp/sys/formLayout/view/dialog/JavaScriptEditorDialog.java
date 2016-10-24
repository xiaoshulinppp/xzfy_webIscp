// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   JavaScriptEditorDialog.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.model.*;
import com.iscp.sys.formLayout.view.MainPane;
import com.iscp.sys.formLayout.view.dialog.javascripteditor.DefaultScriptEditor;
import com.iscp.sys.formLayout.view.dialog.javascripteditor.ScriptEditor;
import java.awt.*;
import java.util.*;
import javax.swing.JDialog;
import javax.swing.JScrollPane;

public class JavaScriptEditorDialog extends JDialog
{

	private ScriptEditor editor;
	public Map typeMap;

	public JavaScriptEditorDialog(Frame frame, boolean modal, String functionStr, MainPane mainPane)
	{
		super(frame, "javaScript±à¼­Æ÷", modal);
		typeMap = new HashMap();
		setSize(new Dimension(500, 600));
		editor = new DefaultScriptEditor(mainPane);
		editor.setScriptText(mainPane.getTableModel().javaScript);
		JScrollPane scrollPane = new JScrollPane();
		getContentPane().add(scrollPane);
		editor.setParentContainer(scrollPane.getViewport());
		editor.focusToFunctionPosition(functionStr);
		Vector cells = mainPane.getTableModel().cells;
		int size = cells.size();
		Set nameSet = new HashSet();
		for (int i = 0; i < size; i++)
		{
			CellModel cell = (CellModel)cells.get(i);
			String id = null;
			if (cell.getItemModel() != null)
				id = cell.getItemModel().getId();
			if (id != null && id.length() != 0)
			{
				if (!(cell.getItemModel() instanceof TextItemModel))
					nameSet.add(id);
				if (cell.getItemModel() instanceof FieldItemModel)
					putType(id, ((FieldItemModel)cell.getItemModel()).getShowType().toLowerCase());
				nameSet.add((new StringBuilder(String.valueOf(id))).append("_cell").toString());
				putType((new StringBuilder(String.valueOf(id))).append("_cell").toString(), "td");
			}
		}

		String names[] = new String[nameSet.size()];
		Iterator it = nameSet.iterator();
		for (int i = 0; i < names.length; i++)
			names[i] = (String)it.next();

		editor.setFormElementNames(names);
		editor.setFormElementNamesType(typeMap);
	}

	public void putType(String name, String value)
	{
		typeMap.put(name, value);
	}
}
