// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   TextItemModel.java

package com.iscp.sys.formLayout.model;

import java.awt.Font;

// Referenced classes of package com.iscp.sys.formLayout.model:
//			ItemModel

public class TextItemModel
	implements ItemModel
{

	public String text;
	public String id;
	public Font font;

	public TextItemModel()
	{
	}

	public TextItemModel(String text)
	{
		this.text = text;
	}

	public void setText(String text)
	{
		this.text = text;
	}

	private String specialCharExpress(char c)
	{
		switch (c)
		{
		case 13: // '\r'
			return "";

		case 10: // '\n'
			return "<br>";

		case 32: // ' '
			return "&nbsp;";

		case 60: // '<'
			return "&lt;";

		case 62: // '>'
			return "&gt;";

		case 38: // '&'
			return "&amp;";

		case 34: // '"'
			return "&quot;";
		}
		return null;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getText()
	{
		return text;
	}

	public String toString()
	{
		return text;
	}

	public Font getFont()
	{
		return font;
	}
}
