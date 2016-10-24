// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   HTMLEditor.java

package com.iscp.sys.formLayout.view.htmleditor;

import java.awt.Color;
import java.io.PrintStream;
import javax.swing.JEditorPane;
import javax.swing.text.*;
import javax.swing.text.html.HTMLDocument;
import javax.swing.text.html.HTMLEditorKit;

public class HTMLEditor extends JEditorPane
{

	private HTMLDocument doc;
	private HTMLEditorKit kit;
	private int innerHTMLStart;
	private int innerHTMLEnd;
	boolean f;

	public HTMLEditor()
	{
		doc = new HTMLDocument();
		kit = new HTMLEditorKit();
		f = false;
		setEditorKit(kit);
		setDocument(doc);
	}

	public void setForeColor(int offset, int length, Color color)
	{
		StyleContext sc = StyleContext.getDefaultStyleContext();
		AttributeSet s = sc.addAttribute(SimpleAttributeSet.EMPTY, StyleConstants.Foreground, color);
		doc.setParagraphAttributes(offset, length, s, true);
	}

	public void setBackColor(int offset, int length, Color color)
	{
		StyleContext sc = StyleContext.getDefaultStyleContext();
		AttributeSet oldAttr = doc.getCharacterElement(offset).getAttributes();
		AttributeSet attr = sc.addAttribute(oldAttr, StyleConstants.Bold, color);
		doc.setCharacterAttributes(offset, length, attr, true);
	}

	public void setBlod()
	{
	}

	public void setItalic()
	{
		setValueToOppositeAttr(StyleConstants.Italic, javax.swing.text.html.CSS.Attribute.FONT_VARIANT);
	}

	public AttributeSet removeAttribute(AttributeSet attrSet, Object key)
	{
		throw new Error("Unresolved compilation problems: \n\tEnumeration cannot be resolved\n\tSyntax error on token \"enum\", delete this token\n\tSyntax error on token \"enum\", invalid Expression\n\tSyntax error on token \"enum\", invalid Expression\n");
	}

	public void setValueToOppositeAttr(Object key, Object attrName)
	{
		int offset = getSelectionStart();
		int length = getSelectionEnd() - offset;
		StyleContext sc = StyleContext.getDefaultStyleContext();
		AttributeSet oldAttr = doc.getCharacterElement(offset).getAttributes();
		AttributeSet attr = oldAttr;
		if (oldAttr.getAttribute(attrName) == null)
		{
			attr = sc.addAttribute(oldAttr, key, new Boolean(true));
			System.out.println("adding");
		} else
		{
			attr = removeAttribute(oldAttr, attrName);
			attr = removeAttribute(oldAttr, key);
			System.out.println((new StringBuilder("removing")).append(attr.getAttribute(attrName)).toString());
		}
		try
		{
			String text = doc.getText(offset, length);
			doc.remove(offset, length);
			doc.insertString(offset, text, attr);
			setSelectionStart(offset);
			setSelectionEnd(offset + length);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public void setSelectedAttr(Object key, Object value)
	{
		int offset = getSelectionStart();
		int length = getSelectionEnd() - offset;
		StyleContext sc = StyleContext.getDefaultStyleContext();
		AttributeSet oldAttr = doc.getCharacterElement(offset).getAttributes();
		AttributeSet attr = sc.removeAttribute(oldAttr, javax.swing.text.html.CSS.Attribute.FONT_WEIGHT);
		if (value != null)
		{
			attr = sc.addAttribute(oldAttr, key, value);
			Object o = attr.getAttribute(javax.swing.text.html.CSS.Attribute.FONT_WEIGHT);
			System.out.println(o);
		}
		try
		{
			doc.setCharacterAttributes(offset, length, attr, true);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public String getText()
	{
		String text = super.getText();
		Element es[] = doc.getRootElements();
		System.out.println(text);
		return text;
	}
}
