// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CellView.java

package com.iscp.sys.formLayout.view;

import java.awt.Graphics;
import java.net.URL;
import javax.swing.JEditorPane;
import javax.swing.text.html.HTMLDocument;

class HTMLShower extends JEditorPane
{

	private String html;
	private boolean valid;
	private static String headString;

	public HTMLShower(URL url)
	{
		valid = false;
		setEnabled(false);
		setContentType("text/html");
		((HTMLDocument)getDocument()).setBase(url);
	}

	public void setHtml(String html)
	{
		if (this.html == null || !this.html.equals(html))
		{
			this.html = html;
			valid = true;
			setText((new StringBuilder(String.valueOf(headString))).append(html).append("</html>").toString());
		}
	}

	public void paint(Graphics g)
	{
		if (valid)
			try
			{
				super.paint(g);
			}
			catch (Exception e)
			{
				valid = false;
			}
		else
			g.drawString("HTML??????????", 0, 0);
	}

	static 
	{
		StringBuffer sb = new StringBuffer();
		sb.append("<html>");
		sb.append("<head>");
		sb.append("<link rel=\"stylesheet\" href=\"css/12B/style.css\" type=\"text/css\">");
		sb.append("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
		sb.append("<title>\r\n</title>\r\n</head>\r\n");
		headString = sb.toString();
	}
}
