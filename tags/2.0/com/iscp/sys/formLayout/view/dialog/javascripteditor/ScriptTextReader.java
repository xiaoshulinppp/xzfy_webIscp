// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ScriptTextReader.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import java.awt.Color;
import java.io.PrintStream;
import java.util.LinkedList;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			ColoredTextArea, ColoredTextPainter

public class ScriptTextReader extends Thread
{

	public static String KEYWORDS[] = {
		"var", "function", "array", "return", "alert", "if", "else", "switch", "case", "this", 
		"new", "for", "null", "break", "continue"
	};
	public static String SYSVARWORDS[] = {
		"document", "window"
	};
	public String varwords[];
	public static Color keyColor = new Color(0, 0, 255);
	public static Color sysvarColor = new Color(255, 0, 0);
	public static Color varColor = new Color(192, 0, 0);
	public static Color textColor = new Color(128, 0, 255);
	public static Color intrColor = new Color(0, 128, 0);
	public ColoredTextArea host;
	public boolean alive;
	public String textch;
	private char tempCh;
	int begin;
	int end;
	LinkedList paint;
	int length;

	public ScriptTextReader(ColoredTextArea host)
	{
		varwords = new String[0];
		this.host = host;
	}

	public void run()
	{
		alive = true;
		while (alive) 
		{
			if (host.needRenew)
			{
				host.needRenew = false;
				host.setPainter(read(host.getText()));
				host.repaint();
			}
			try
			{
				sleep(100L);
			}
			catch (Exception e)
			{
				System.out.println(e);
			}
		}
	}

	private boolean compare(String str, int begin)
	{
		if (str.length() + begin > textch.length())
			return false;
		for (int i = 0; i < str.length(); i++)
			if (str.charAt(i) != textch.charAt(begin + i))
				return false;

		return true;
	}

	private boolean compare(String str, int begin, int end)
	{
		if (str.length() != end - begin)
			return false;
		for (int i = 0; i < str.length(); i++)
			if (str.charAt(i) != textch.charAt(begin + i))
				return false;

		return true;
	}

	private boolean normalChar(int pos)
	{
		tempCh = textch.charAt(pos);
		if (tempCh >= 'a' && tempCh <= 'z')
			return true;
		if (tempCh >= 'A' && tempCh <= 'Z')
			return true;
		if (tempCh >= '0' && tempCh <= '9')
			return true;
		return tempCh == '_';
	}

	private boolean checkSpecialWord(String word[], int begin, int end, LinkedList paint, Color foreColor)
	{
		for (int i = 0; i < word.length; i++)
			if (compare(word[i], begin, end))
			{
				paint.add(new ColoredTextPainter(null, foreColor, begin));
				paint.add(new ColoredTextPainter(null, Color.black, end));
				return true;
			}

		return false;
	}

	private synchronized void intrRead()
	{
		for (begin++; begin < length && textch.charAt(begin) != '\n'; begin++);
	}

	private synchronized void intrRead2()
	{
		for (begin++; begin + 1 < length; begin++)
			if (compare("*/", begin))
				break;

	}

	private synchronized void textRead(char end)
	{
		for (begin++; begin < length && textch.charAt(begin) != end; begin++)
			if (textch.charAt(begin) == '\\')
				begin++;

	}

	private synchronized ColoredTextPainter[] read(String text)
	{
		if (text == null)
			return null;
		paint = new LinkedList();
		textch = text;
		length = text.length();
		if (length > 0x1e8480)
			return null;
		try
		{
			begin = 0;
			for (end = 0; begin < length && end < length; begin = end)
			{
				while (begin < length && !normalChar(begin)) 
				{
					char ch = textch.charAt(begin);
					if (ch == '\'' || ch == '"')
					{
						paint.add(new ColoredTextPainter(null, textColor, begin));
						textRead(ch);
						if (begin < length)
							begin++;
						paint.add(new ColoredTextPainter(null, Color.black, begin));
					} else
					if (ch == '/' && begin < length - 1 && textch.charAt(begin + 1) == '/')
					{
						paint.add(new ColoredTextPainter(null, intrColor, begin));
						intrRead();
						if (begin < length)
							begin++;
						paint.add(new ColoredTextPainter(null, Color.black, begin));
					} else
					if (ch == '/' && begin < length - 1 && textch.charAt(begin + 1) == '*')
					{
						paint.add(new ColoredTextPainter(null, intrColor, begin));
						intrRead2();
						if (begin < length)
							begin++;
						paint.add(new ColoredTextPainter(null, Color.black, begin));
					} else
					{
						begin++;
					}
				}
				for (end = begin; end < length && normalChar(end); end++);
				if (!checkSpecialWord(KEYWORDS, begin, end, paint, keyColor) && !checkSpecialWord(SYSVARWORDS, begin, end, paint, sysvarColor))
					checkSpecialWord(varwords, begin, end, paint, varColor);
			}

		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		int lineIndexLength = 0;
		for (int i = 0; i < length; i++)
		{
			tempCh = textch.charAt(i);
			if (tempCh == '\n')
				lineIndexLength++;
		}

		int lineIndex[] = new int[lineIndexLength + 1];
		lineIndex[0] = -1;
		lineIndexLength = 1;
		for (int i = 0; i < length; i++)
		{
			tempCh = textch.charAt(i);
			if (tempCh == '\n')
				lineIndex[lineIndexLength++] = i;
		}

		host.linePosIndex = lineIndex;
		int paintLength = paint.size();
		ColoredTextPainter arrayPaint[] = new ColoredTextPainter[paint.size()];
		for (int i = 0; i < paintLength; i++)
		{
			arrayPaint[i] = (ColoredTextPainter)paint.getFirst();
			paint.removeFirst();
		}

		return arrayPaint;
	}

}
