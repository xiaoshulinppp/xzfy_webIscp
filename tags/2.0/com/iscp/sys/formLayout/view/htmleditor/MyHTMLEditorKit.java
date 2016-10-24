// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   MyHTMLEditorKit.java

package com.iscp.sys.formLayout.view.htmleditor;

import java.io.Writer;
import javax.swing.text.*;
import javax.swing.text.html.HTMLDocument;
import javax.swing.text.html.HTMLEditorKit;

public class MyHTMLEditorKit extends HTMLEditorKit
{

	private String text;

	public MyHTMLEditorKit()
	{
	}

	public void write(Writer out, Document document, int pos, int len)
	{
		HTMLDocument doc = (HTMLDocument)document;
		Element roots[] = doc.getRootElements();
		try
		{
			text = doc.getText(0, doc.getEndPosition().getOffset());
			for (int i = 0; i < roots.length; i++)
				if (roots[i].getName().toLowerCase().equals("html"))
					writeElement(out, roots[i], true);

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public boolean writeElement(Writer out, Element e, boolean write)
		throws Exception
	{
		throw new Error("Unresolved compilation problems: \n\tEnumeration cannot be resolved\n\tSyntax error on token \"enum\", delete this token\n\tSyntax error on token \"enum\", invalid Expression\n\tSyntax error on token \"enum\", invalid Expression\n\tSyntax error on token \"enum\", invalid Expression\n\tSyntax error on token \"enum\", invalid Expression\n\tSyntax error on token \"enum\", invalid Expression\n");
	}

	public void writeContent(Writer out, Element e)
		throws Exception
	{
		int start = e.getStartOffset();
		int end = e.getEndOffset();
		for (int i = start; i < end; i++)
		{
			char c = text.charAt(i);
			switch (c)
			{
			case 60: // '<'
				out.write("&lt;");
				break;

			case 62: // '>'
				out.write("&gt;");
				break;

			case 38: // '&'
				out.write("&amp;");
				break;

			case 34: // '"'
				out.write("&quot;");
				break;

			case 10: // '\n'
				out.write("<br>");
				break;

			case 32: // ' '
				out.write("&nbsp;");
				break;

			default:
				out.write(new char[] {
					c
				});
				break;

			case 9: // '\t'
			case 13: // '\r'
				break;
			}
		}

	}
}
