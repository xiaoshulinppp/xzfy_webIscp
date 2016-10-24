// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ColoredTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import java.io.PrintStream;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			EditModel, ColoredTextArea

class EditListItem
{

	private EditListItem last;
	private EditListItem next;
	private EditModel edit;
	private boolean end;

	public EditListItem getNext()
	{
		return next;
	}

	public void setEnd()
	{
		end = true;
	}

	public EditListItem(EditModel edit)
	{
		end = false;
		this.edit = edit;
	}

	public void append(EditListItem item)
	{
		next = item;
		item.last = this;
	}

	public EditModel getEdit()
	{
		return edit;
	}

	public EditListItem undo(ColoredTextArea textarea)
	{
		EditListItem item;
		for (item = this; item != null && (!item.end || item == this) && item.getEdit() != null; item = item.last)
			try
			{
				item.getEdit().undo(textarea);
			}
			catch (Exception e)
			{
				System.out.print("error");
				return item;
			}

		return item;
	}

	public EditListItem redo(ColoredTextArea textarea)
	{
		EditListItem item = this;
		do
		{
			if (item.getEdit() == null)
				return this;
			try
			{
				item.getEdit().redo(textarea);
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			if ((!item.end || item == this) && (item.next == null || item.next.getEdit() != null))
				item = item.next;
			else
				return item;
		} while (true);
	}
}
