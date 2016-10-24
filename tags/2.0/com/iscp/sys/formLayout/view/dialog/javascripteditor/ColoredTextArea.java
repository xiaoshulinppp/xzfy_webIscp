// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ColoredTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import java.awt.*;
import javax.swing.JTextArea;
import javax.swing.text.DefaultStyledDocument;
import javax.swing.text.Document;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			EditHistory, ScriptTextReader, TextRenew_adapter, Text_undo_adapter, 
//			Text_key_adapter, ColoredTextPainter, DefaultScriptEditor

public class ColoredTextArea extends JTextArea
{

	BorderLayout borderLayout1;
	ColoredTextPainter painter[];
	EditHistory undoEdit;
	String lastText;
	DefaultScriptEditor scriptEditor;
	public boolean needRenew;
	public ScriptTextReader scriptTextReader;
	public int linePosIndex[];
	public int linePaintIndex[];
	private boolean isRedoing;
	private boolean isUndoing;
	String match;
	int grammar;
	private Text_key_adapter actionKeyListener;

	public void setScriptEditor(DefaultScriptEditor scriptEditor)
	{
		this.scriptEditor = scriptEditor;
	}

	public ColoredTextArea()
	{
		borderLayout1 = new BorderLayout();
		painter = null;
		undoEdit = new EditHistory(this);
		needRenew = true;
		scriptTextReader = new ScriptTextReader(this);
		linePosIndex = null;
		linePaintIndex = null;
		isRedoing = false;
		isUndoing = false;
		match = null;
		try
		{
			DefaultStyledDocument a = new DefaultStyledDocument();
			setDocument(a);
			jbInit();
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
	}

	public void resetUndo()
	{
		undoEdit = new EditHistory(this);
	}

	private void jbInit()
		throws Exception
	{
		setLayout(borderLayout1);
		getDocument().addDocumentListener(new TextRenew_adapter(this));
		getDocument().addUndoableEditListener(new Text_undo_adapter(this));
		resetUndo();
		scriptTextReader.start();
		setTabSize(3);
	}

	public void setActionKeyListener(Text_key_adapter actionKeyListener)
	{
		this.actionKeyListener = actionKeyListener;
		addKeyListener(actionKeyListener);
	}

	public boolean isRedoing()
	{
		return isRedoing;
	}

	public void redo()
	{
		isRedoing = true;
		undoEdit.redo();
		renew();
		isRedoing = false;
	}

	public boolean isUndoing()
	{
		return isUndoing;
	}

	public void undo()
	{
		isUndoing = true;
		undoEdit.undo();
		renew();
		isUndoing = false;
	}

	public void search()
	{
		actionKeyListener.searchAction();
	}

	public boolean canUndo()
	{
		return undoEdit.canUndo();
	}

	public boolean canRedo()
	{
		return undoEdit.canRedo();
	}

	public void paint(Graphics g)
	{
		super.paint(g);
		int x = (int)getVisibleRect().getX();
		int y = (int)getVisibleRect().getY();
		int w = (int)getVisibleRect().getWidth();
		int h = (int)getVisibleRect().getHeight();
		String str = getText();
		g.setFont(getFont());
		if (painter == null || painter.length == 0)
		{
			return;
		} else
		{
			g.setColor(getBackground());
			paintString(g, str);
			return;
		}
	}

	public void setPainter(ColoredTextPainter _painter[])
	{
		painter = _painter;
	}

	public void paintString(Graphics g, String str)
	{
		int viewx1;
		int viewy1;
		int viewx2;
		int viewy2;
		FontMetrics fontMetrics;
		int charHeight;
		int x;
		int y;
		int len;
		int pInd;
		int selectionStart;
		int selectionEnd;
		int paintStart;
		int midPos;
label0:
		{
			viewx1 = getVisibleRect().x;
			viewy1 = getVisibleRect().y;
			viewx2 = getVisibleRect().width + viewx1;
			viewy2 = getVisibleRect().height + viewy1;
			fontMetrics = g.getFontMetrics(g.getFont());
			charHeight = fontMetrics.getHeight();
			viewy2 += charHeight;
			selectionStart = getSelectionStart();
			selectionEnd = getSelectionEnd();
			char chr[] = new char[1];
			Color foreColor = Color.black;
			Color backColor = Color.white;
			len = str.length();
			pInd = 0;
			ColoredTextPainter tempPainter = painter[pInd];
			if (linePosIndex == null)
				return;
			int startLine = viewy1 / charHeight;
			int endLine = viewy2 / charHeight;
			int linePosLength = linePosIndex.length;
			if (startLine > linePosLength - 1)
				startLine = linePosIndex.length - 1;
			if (startLine < 0)
				startLine = 0;
			x = 0;
			y = startLine * charHeight + g.getFont().getSize() + 1;
			if (endLine > linePosLength - 1)
				endLine = linePosIndex.length - 1;
			if (endLine < 0)
				endLine = 0;
			paintStart = linePosIndex[startLine] + 1;
			int paintEnd = linePosIndex[endLine] + 1;
			int paintLength = painter.length;
			int maxPos = paintLength;
			int minPos = 0;
			midPos = 0;
			do
			{
				midPos = (maxPos + minPos) / 2;
				if (painter[midPos].i < paintStart)
				{
					minPos = midPos;
					continue;
				}
				if (painter[midPos].i > paintStart)
				{
					maxPos = midPos;
					continue;
				}
				if (painter[midPos].i == paintStart)
					break label0;
			} while (maxPos - minPos >= 2);
			midPos = minPos;
		}
		pInd = midPos;
		g.setColor(painter[pInd].foreColor);
		int pos = paintStart;
		int start = pos;
		boolean needPaint = true;
		int startx = x;
		int starty = y;
		Color color = painter[pInd].foreColor;
		int tabSize = getTabSize();
		int lineCharCount = 0;
		for (; pos < len; pos++)
		{
			int oldx = x;
			int oldy = y;
			while (pInd < painter.length - 1 && painter[pInd + 1].i <= pos && pos < len) 
			{
				pInd++;
				needPaint = true;
			}
			char ch = str.charAt(pos);
			if (ch == '\n')
			{
				y += charHeight;
				x = 0;
				lineCharCount = 0;
				oldx = x;
				oldy = y;
				needPaint = true;
				if (y > viewy2)
					break;
			} else
			if (ch == '\t')
			{
				int tabLength = fontMetrics.charWidth('%') * tabSize;
				x = (x / tabLength + 1) * tabLength;
				lineCharCount = 0;
				oldx = x;
				oldy = y;
				needPaint = true;
			} else
			if (pos == len - 1)
			{
				pos++;
				needPaint = true;
			} else
			{
				x += fontMetrics.charWidth(ch);
				lineCharCount++;
				if (x < viewx1 || x > viewx2)
					needPaint = true;
			}
			if (needPaint)
			{
				if ((viewx1 < x && viewx2 > startx || ch == '\n' || ch == '\t') && viewy1 < y && viewy2 > y)
				{
					g.setColor(color);
					if (pos < selectionStart || start >= selectionEnd)
						g.drawString(str.substring(start, pos), startx, starty);
					else
					if (pos >= selectionStart && start < selectionStart)
					{
						g.drawString(str.substring(start, selectionStart), startx, starty);
						if (pos > selectionEnd)
							g.drawString(str.substring(selectionEnd, pos), startx + fontMetrics.stringWidth(str.substring(start, selectionEnd)), starty);
					} else
					if (start < selectionEnd && pos > selectionEnd)
					{
						String temp = str.substring(selectionEnd, pos);
						g.drawString(temp, startx + fontMetrics.stringWidth(str.substring(start, selectionEnd)), starty);
					}
				}
				color = painter[pInd].foreColor;
				startx = oldx;
				starty = oldy;
				start = pos;
				needPaint = false;
			}
		}

	}

	public void renew()
	{
		needRenew = true;
		scriptEditor.renew();
	}
}
