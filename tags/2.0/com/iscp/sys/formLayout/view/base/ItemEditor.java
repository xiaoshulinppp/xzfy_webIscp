// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ItemEditor.java

package com.iscp.sys.formLayout.view.base;

import com.iscp.sys.formLayout.model.CellModel;
import com.iscp.sys.formLayout.model.FieldTextItemModel;
import com.iscp.sys.formLayout.view.CellView;
import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.text.Document;

// Referenced classes of package com.iscp.sys.formLayout.view.base:
//			ItemEditorDocumentListener

public class ItemEditor extends JScrollPane
{

	private CellView cellView;
	private FieldTextItemModel item;
	public JTextArea coderEditor;

	public ItemEditor()
	{
		coderEditor = new JTextArea();
		coderEditor.getDocument().addDocumentListener(new ItemEditorDocumentListener(this));
		JScrollPane scrollPane = this;
		scrollPane.getViewport().add(coderEditor);
	}

	public CellView getCellView()
	{
		return cellView;
	}

	public FieldTextItemModel getItem()
	{
		return item;
	}

	public void setCellView(CellView cellView)
	{
		this.cellView = cellView;
		setBounds(cellView.getBounds());
		setFont(cellView.getFont());
		if (cellView.getModel().getItemModel() instanceof FieldTextItemModel)
		{
			item = (FieldTextItemModel)cellView.getModel().getItemModel();
			int align = cellView.getModel().align;
			int valign = cellView.getModel().valign;
			String alignStr = "";
			String valignStr = "";
			if (valign == 2)
				valignStr = "bottom";
			if (valign == 1)
				valignStr = "center";
			if (valign == 0)
				valignStr = "top";
			if (align == 0)
				alignStr = "left";
			if (align == 1)
				alignStr = "center";
			if (align == 2)
				alignStr = "right";
			setText(item.getText());
		}
	}

	public void setText(String text)
	{
		coderEditor.setText(text);
	}

	public String getText()
	{
		return coderEditor.getText();
	}

	public void documentChange(DocumentEvent e)
	{
		item.setText(getText());
	}

	public void setBlod()
	{
	}
}
