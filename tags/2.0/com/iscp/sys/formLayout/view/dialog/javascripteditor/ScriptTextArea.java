// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ScriptTextArea.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import java.awt.*;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.util.Map;
import javax.swing.JList;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import javax.swing.text.Caret;
import javax.swing.text.Document;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			ColoredTextArea, ScriptAnalyser, ShowProperty_menu, ScriptEditorAssistant_documentListener, 
//			ScriptTextArea_mouseListener, ScriptTextArea_keyListener

public class ScriptTextArea extends ColoredTextArea
{

	private ShowProperty_menu propertyMenu;
	private Point caretPosition;
	private ScriptAnalyser analyser;
	boolean dotTyped;
	private boolean propertySelectOn;
	private int propertySelectStringStartPosition;
	private static final int SELECT_BUTTON[] = {
		40, 38, 10, 27, 34, 33, 36, 35
	};

	public void setTypeMap(Map typeMap)
	{
		analyser.setVarType(typeMap);
	}

	public ScriptTextArea()
	{
		propertyMenu = new ShowProperty_menu(this);
		analyser = new ScriptAnalyser(this);
		dotTyped = false;
		propertySelectOn = false;
		propertySelectStringStartPosition = 0;
		setLayout(null);
		add(propertyMenu);
		getDocument().addDocumentListener(new ScriptEditorAssistant_documentListener(this));
		addMouseListener(new ScriptTextArea_mouseListener(this));
		addKeyListener(new ScriptTextArea_keyListener(this));
		addCaretListener(new CaretListener() {

			final ScriptTextArea this$0;

			public void caretUpdate(CaretEvent e)
			{
				if (getCaret() != null)
				{
					Point p = getCaret().getMagicCaretPosition();
					if (p != null)
						caretPosition = p;
				}
				if (dotTyped)
				{
					setPropertySelect(true);
					dotTyped = false;
				}
			}

			
			{
				this$0 = ScriptTextArea.this;
				super();
			}
		});
	}

	public void setText(String text)
	{
		String oldText = super.getText();
		int len = oldText.length();
		if (!oldText.equals(text))
		{
			super.setText(text);
			super.resetUndo();
		}
	}

	public void setPropertySelect(boolean propertySelectOn)
	{
		if (this.propertySelectOn == propertySelectOn)
			return;
		this.propertySelectOn = propertySelectOn;
		if (propertySelectOn)
		{
			int currPos = getCaretPosition();
			javax.swing.ListModel list = analyser.getTypeList(currPos);
			if (list == null)
			{
				this.propertySelectOn = false;
				return;
			}
			int x = caretPosition.x;
			int y = caretPosition.y;
			int width = propertyMenu.getBounds().width;
			FontMetrics fm = getFontMetrics(getFont());
			propertyMenu.setBounds(x + fm.stringWidth("."), y + fm.getHeight(), width, 100);
			propertyMenu.setModel(list);
			propertyMenu.setVisible(true);
			propertyMenu.list.setSelectedIndex(0);
			propertySelectStringStartPosition = currPos;
		} else
		{
			propertyMenu.setVisible(false);
		}
	}

	private static boolean isSelect_Button(int keyCode)
	{
		for (int i = 0; i < SELECT_BUTTON.length; i++)
			if (SELECT_BUTTON[i] == keyCode)
				return true;

		return false;
	}

	public static boolean isDivideChar(char c)
	{
		if (c >= 'a' && c <= 'z')
			return false;
		if (c >= 'A' && c <= 'Z')
			return false;
		if (c >= '0' && c <= '9')
			return false;
		return c != '_';
	}

	public void keyPressed(KeyEvent e)
	{
		int keyCode = e.getKeyCode();
		if (isSelect_Button(keyCode) && propertySelectOn)
		{
			if (keyCode == 27)
				setPropertySelect(false);
			else
			if (keyCode == 10)
			{
				setPropertySelect(false);
				propertyMenu.selectionProcess(propertySelectStringStartPosition);
			} else
			if (keyCode == 38)
				propertyMenu.moveUp();
			else
			if (keyCode == 40)
				propertyMenu.moveDown();
			else
			if (keyCode == 33)
				propertyMenu.movePageUp();
			else
			if (keyCode == 34)
				propertyMenu.movePageDown();
			else
			if (keyCode == 36)
				propertyMenu.moveHome();
			else
			if (keyCode == 35)
				propertyMenu.moveEnd();
			e.setKeyCode(0);
		} else
		{
			char c = e.getKeyChar();
			boolean goProcess = isDivideChar(c);
			if (e.isActionKey())
				goProcess = false;
			if (c == '\b' || c == '\177' || c == '\uFFFF')
				goProcess = false;
			int cp = getCaretPosition();
			if (propertySelectOn && goProcess && cp >= propertySelectStringStartPosition)
			{
				setPropertySelect(false);
				propertyMenu.selectionProcess(propertySelectStringStartPosition);
			}
			if (c == '\n')
			{
				String extendSpace = "";
				String text = getText();
				int curr;
				for (curr = cp - 1; curr >= 0 && text.charAt(curr) == '\r' || text.charAt(curr) == '\n'; curr--);
				if (curr < 0)
					return;
				char currChar = text.charAt(curr);
				if (currChar == '{')
					extendSpace = "\t";
				int spacestart = curr;
				int spaceend = curr;
				for (; curr < text.length() && curr >= 0; curr--)
				{
					char ch = text.charAt(curr);
					if (ch == '\n')
					{
						curr++;
						break;
					}
					if (ch != ' ' && ch != '\t')
						spaceend = curr;
				}

				if (curr < 0)
					curr = 0;
				spacestart = curr;
				try
				{
					getDocument().insertString(getCaretPosition(), (new StringBuilder("\n")).append(extendSpace).append(text.substring(spacestart, spaceend)).toString(), null);
					e.setKeyCode(0);
				}
				catch (Exception ee)
				{
					ee.printStackTrace();
				}
			}
		}
	}

	public void keyReleased(KeyEvent e)
	{
		int keyCode = e.getKeyCode();
		if (!isSelect_Button(keyCode))
			propertyMenu.autoFit(propertySelectStringStartPosition);
	}

	public void keyTyped(KeyEvent keyevent)
	{
	}

	public void mouseReleased(MouseEvent e)
	{
		setPropertySelect(false);
	}

	public void paint(Graphics g)
	{
		super.paint(g);
		if (propertyMenu.isVisible())
		{
			Rectangle r = propertyMenu.getBounds();
			g.translate(r.x, r.y);
			propertyMenu.paint(g);
			g.translate(-r.x, -r.y);
		}
	}


}
