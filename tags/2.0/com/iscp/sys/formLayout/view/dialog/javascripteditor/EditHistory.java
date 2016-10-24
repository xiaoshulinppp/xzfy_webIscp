// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ColoredTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import javax.swing.event.DocumentEvent;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			EditListItem, EditModel, ColoredTextArea

class EditHistory
{

	private EditListItem tail;
	private EditListItem head;
	private EditListItem current;
	private ColoredTextArea textarea;
	private static final int MAXSIZE = 50000;
	private int size;

	public EditHistory(ColoredTextArea textarea)
	{
		tail = new EditListItem(null);
		head = new EditListItem(null);
		current = head;
		size = 0;
		this.textarea = textarea;
		current.append(tail);
	}

	public boolean canUndo()
	{
		return current != head;
	}

	public boolean canRedo()
	{
		return current.getNext() != tail;
	}

	public void put()
	{
		current.setEnd();
	}

	public void add(EditModel edit)
	{
		EditListItem item = new EditListItem(edit);
		for (EditListItem temp = current; temp.getNext() != tail;)
		{
			temp = temp.getNext();
			if (temp.getEdit() != null)
				size -= temp.getEdit().getLength();
		}

		current.append(item);
		item.append(tail);
		current = item;
		EditListItem listItem;
		for (size += edit.getLength(); size > 50000 && head.getNext().getEdit() != null; head.append(listItem))
		{
			size -= head.getNext().getEdit().getLength();
			listItem = head.getNext().getNext();
		}

	}

	public void add(DocumentEvent e)
	{
		EditModel editModel = new EditModel(e, textarea);
		add(editModel);
	}

	public void undo()
	{
		current = current.undo(textarea);
		textarea.lastText = textarea.getText();
	}

	public void redo()
	{
		if (current.getNext() != null && current.getNext() != tail)
			current = current.getNext().redo(textarea);
		textarea.lastText = textarea.getText();
	}
}
