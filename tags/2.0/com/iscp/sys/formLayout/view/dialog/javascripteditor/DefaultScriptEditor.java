// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   DefaultScriptEditor.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import com.iscp.sys.formLayout.model.TableModel;
import com.iscp.sys.formLayout.view.MainPane;
import java.awt.Container;
import java.util.Map;
import javax.swing.text.Document;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			ScriptEditor, ScriptTextArea, Editor_TextRenew_adapter, ScriptTextReader

public class DefaultScriptEditor
	implements ScriptEditor
{

	private ScriptTextArea textArea;
	private MainPane mainPane;

	public DefaultScriptEditor(MainPane mainPane)
	{
		textArea = new ScriptTextArea();
		this.mainPane = mainPane;
		textArea.getDocument().addDocumentListener(new Editor_TextRenew_adapter(textArea, mainPane));
		textArea.setScriptEditor(this);
	}

	public void renew()
	{
		mainPane.getTableModel().javaScript = textArea.getText();
		mainPane.setChanged(true);
	}

	public void setFormElementNamesType(Map typeMap)
	{
		textArea.setTypeMap(typeMap);
	}

	private String newFunction(String functionStr)
	{
		StringBuffer sb = new StringBuffer();
		sb.append("function ");
		sb.append(functionStr);
		sb.append("(srcElement){\r\n\t\r\n}\r\n");
		sb.append("//------------------------\r\n\r\n");
		return sb.toString();
	}

	public int findFunctionPosition(String functionStr)
	{
		int pos = textArea.getText().indexOf((new StringBuilder("function ")).append(functionStr).toString());
		if (pos >= 0)
		{
			return pos;
		} else
		{
			setScriptText((new StringBuilder(String.valueOf(newFunction(functionStr)))).append(textArea.getText()).toString());
			return 0;
		}
	}

	public void focusToFunctionPosition(String functionStr)
	{
		int pos = findFunctionPosition(functionStr) + (new StringBuilder("function ")).append(functionStr).append("(srcElement){\r\n\t").toString().length();
		textArea.requestFocus();
		textArea.setSelectionStart(pos);
		textArea.setSelectionEnd(pos);
	}

	public void setScriptText(String script)
	{
		textArea.setText(script);
	}

	public String getScriptText()
	{
		return textArea.getText();
	}

	public void setParentContainer(Container c)
	{
		c.add(textArea);
	}

	public void setFormElementNames(String names[])
	{
		textArea.scriptTextReader.varwords = names;
	}

	public void setEditable(boolean editable)
	{
		textArea.setEditable(editable);
	}

	public void undo()
	{
		textArea.undo();
	}

	public void redo()
	{
		textArea.redo();
	}

	public void search()
	{
		textArea.search();
	}

	public boolean canUndo()
	{
		return textArea.canUndo();
	}

	public boolean canRedo()
	{
		return textArea.canRedo();
	}
}
