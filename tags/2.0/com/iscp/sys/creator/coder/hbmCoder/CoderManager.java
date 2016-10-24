// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CoderManager.java

package com.iscp.sys.creator.coder.hbmCoder;

import com.iscp.sys.creator.coder.CodeOutput;
import com.iscp.sys.creator.model.BeanMod;
import java.io.*;
import org.dom4j.DocumentFactory;
import org.dom4j.Element;
import org.dom4j.io.XMLWriter;

// Referenced classes of package com.iscp.sys.creator.coder.hbmCoder:
//			BeanXMLCoder

public class CoderManager
{

	static String hbmTitle = "<?xml version=\"1.0\"?><!DOCTYPE hibernate-mapping PUBLIC \"-//Hibernate/Hibernate Mapping DTD 2.0//EN\" \"http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd\">\r\n";
	public static final int ONE_ATTR_ONE_LINE = 0;
	public static final int ALL_ATTR_ONE_LINE = 1;
	public static final int DEFAULT_ATTR_STYLE = 2;
	private static int attrStyle = 2;

	public CoderManager()
	{
	}

	private static String getFilePath(BeanMod model)
	{
		String beanName = model.getName();
		beanName = beanName.replace('.', '/');
		String fileName = (new StringBuilder(String.valueOf(CodeOutput.basepath))).append(beanName).toString();
		if (fileName.indexOf("file:/") >= 0)
			fileName = fileName.substring(6);
		else
		if (fileName.indexOf("file:") >= 0)
			fileName = fileName.substring(5);
		return fileName;
	}

	public static void writeBeanHbm(BeanMod model)
		throws Exception
	{
		String fileName = (new StringBuilder(String.valueOf(getFilePath(model)))).append(".hbm.xml").toString();
		writeBeanHbm(model, fileName);
	}

	public static void writeBeanHbm(BeanMod model, String fileName)
		throws Exception
	{
		File file = new File(fileName);
		OutputStream outputStream = new FileOutputStream(file);
		XMLWriter writer = new XMLWriter();
		writer.setOutputStream(outputStream);
		outputStream.write(hbmTitle.getBytes());
		BeanXMLCoder coder = new BeanXMLCoder();
		writer.write(coder.getElementExpress(model));
	}

	private static String getTabSpace(int tab)
	{
		String temp = "";
		for (int i = 0; i < tab; i++)
			temp = (new StringBuilder(String.valueOf(temp))).append("   ").toString();

		return temp;
	}

	public static void nextLine(Element element, int tab)
	{
		element.addText((new StringBuilder("\r\n")).append(getTabSpace(tab)).toString());
	}

	public static int getAttrStyle()
	{
		return attrStyle;
	}

	public static void getAttrStyle(int _attrStyle)
	{
		attrStyle = _attrStyle;
	}

	public static void addAttr(Element element, String name, String value, int tab, int style)
	{
		if (value != null)
		{
			if (style == 0)
				name = (new StringBuilder("\r\n")).append(getTabSpace(tab)).append(" ").append(name).toString();
			org.dom4j.Attribute attr = DocumentFactory.getInstance().createAttribute(element, name, value);
			element.add(attr);
		}
	}

}
