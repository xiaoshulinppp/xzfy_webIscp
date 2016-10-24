// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   JavaScriptEditorPane.java

package com.iscp.sys.formLayout.view.dialog;

import com.iscp.sys.formLayout.model.*;
import com.iscp.sys.formLayout.view.MainPane;
import com.iscp.sys.formLayout.view.dialog.javascripteditor.DefaultScriptEditor;
import com.iscp.sys.formLayout.view.dialog.javascripteditor.ScriptEditor;
import java.util.*;
import javax.swing.JScrollPane;
import javax.swing.JViewport;

public class JavaScriptEditorPane extends JScrollPane
{

	private ScriptEditor editor;
	private MainPane mainPane;
	public Map typeMap;

	public JavaScriptEditorPane(MainPane mainPane)
	{
		typeMap = new HashMap();
		editor = new DefaultScriptEditor(mainPane);
		JScrollPane scrollPane = new JScrollPane();
		setBorder(null);
		getViewport().add(scrollPane);
		editor.setParentContainer(scrollPane.getViewport());
		editor.setEditable(mainPane.Ability_JavaScriptEdit);
		this.mainPane = mainPane;
	}

	public void reset()
	{
		editor.setScriptText(mainPane.getTableModel().javaScript);
		Set nameSet = new HashSet();
		Vector cells = mainPane.getTableModel().cells;
		int size = cells.size();
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

		RowTip rowtips[] = mainPane.getTableModel().rowtips;
		for (int i = 0; i < rowtips.length; i++)
			if (rowtips[i] != null && rowtips[i].id != null)
				putType(rowtips[i].id, "tbody");

		putType("document", "document");
		putType("window", "window");
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

	public void setFunctionString(String functionString)
	{
		if (functionString != null)
			editor.focusToFunctionPosition(functionString);
	}

	public ScriptEditor getEditor()
	{
		return editor;
	}
}
