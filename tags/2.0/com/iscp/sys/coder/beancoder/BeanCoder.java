// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   BeanCoder.java

package com.iscp.sys.coder.beancoder;

import com.iscp.sys.coder.Coder;
import com.iscp.sys.coder.StringJoiner;
import com.iscp.sys.coder.hbmcoder.HbmColumn;
import com.iscp.sys.coder.model.*;
import java.util.*;

public class BeanCoder
{

	private StringJoiner s;
	private Set tableNameWithMoreThanOneRelation;
	private IdTypeInterface idType__;

	public BeanCoder()
	{
		s = new StringJoiner();
	}

	public String getBeanExpress(TableInterface table, RelationInterface rels[], IdTypeInterface idType)
	{
		idType__ = idType;
		int fsize = table.getFields().size();
		Iterator fit = table.getFields().iterator();
		String classname = firstUpperCase(table.getLogName());
		s.insert("package ");
		for (int i = 0; i < Coder.PACKAGENAMES.length; i++)
			s.insert((new StringBuilder(String.valueOf(Coder.PACKAGENAMES[i]))).append(".").toString());

		s.insertln("bean;");
		s.insertln("import java.util.*;");
		s.insert("public class ");
		s.insertln((new StringBuilder(String.valueOf(classname))).append(" {").toString());
		s.insert(1, "public ");
		s.insertln((new StringBuilder(String.valueOf(classname))).append("() {").toString());
		s.insertln(1, "}");
		for (int i = 0; i < fsize; i++)
		{
			FieldInterface field = (FieldInterface)fit.next();
			insertBeanPropertyExpress(1, field);
		}

		tableNameWithMoreThanOneRelation = new HashSet();
		Set tempTableName = new HashSet();
		for (int i = 0; i < rels.length; i++)
			if (rels[i].getTable_host().equals(table.getTabName()) && !tempTableName.add(rels[i].getTable_related()))
				tableNameWithMoreThanOneRelation.add(rels[i].getTable_related());

		for (int i = 0; i < rels.length; i++)
			if (rels[i].getTable_host().equals(table.getTabName()))
				insertBeanRelationExpress(1, rels[i]);

		s.insertln("}");
		return s.flush();
	}

	public static String firstUpperCase(String name)
	{
		String newname = name.substring(0, 1);
		newname = (new StringBuilder(String.valueOf(newname.toUpperCase()))).append(name.substring(1)).toString();
		return newname;
	}

	private void insertBeanPropertyExpress(int tab, FieldInterface field)
	{
		HbmColumn column = new HbmColumn(field, idType__);
		s.insert(tab, "private ");
		s.insert(column.getValueTypeName_java());
		s.insert(" ");
		s.insert(column.getLogName());
		s.insertln("_p;");
		String methodname = firstUpperCase(column.getLogName());
		s.insert(tab, "public ");
		s.insert(column.getValueTypeName_java());
		s.insert(" get");
		s.insert(methodname);
		s.insertln("() {");
		s.insertln(tab + 1, (new StringBuilder("return ")).append(column.getLogName()).append("_p;").toString());
		s.insertln(tab, "}");
		s.insert(tab, "public void set");
		s.insert(methodname);
		s.insertln((new StringBuilder("(")).append(column.getValueTypeName_java()).append(" ").append(column.getLogName()).append("_p) {").toString());
		s.insertln(tab + 1, (new StringBuilder("this.")).append(column.getLogName()).append("_p = ").append(column.getLogName()).append("_p;").toString());
		s.insertln(tab, "}\r\n");
	}

	private void insertBeanRelationExpress(int tab, RelationInterface rel)
	{
		HbmColumn column = new HbmColumn(rel);
		if (tableNameWithMoreThanOneRelation.contains(rel.getTable_related()))
			column.setNameWithColumn(rel.getColumn_host());
		String typename = "Set";
		if (rel.getType() == 2 || rel.getType() == 0)
			typename = column.getRelatedClass();
		s.insert(tab, "private ");
		s.insert((new StringBuilder(String.valueOf(typename))).append(" ").toString());
		s.insert(column.getName());
		if (rel.getType() == 3 || rel.getType() == 1)
			s.insertln(" = new HashSet();");
		else
			s.insertln(";");
		String methodname = firstUpperCase(column.getName());
		s.insert(tab, "public ");
		s.insert(typename);
		s.insert(" get");
		s.insert(methodname);
		s.insertln("() {");
		s.insertln(tab + 1, (new StringBuilder("return ")).append(column.getName()).append(";").toString());
		s.insertln(tab, "}");
		s.insert(tab, "public void set");
		s.insert(methodname);
		s.insertln((new StringBuilder("(")).append(typename).append(" ").append(column.getName()).append(") {").toString());
		s.insertln(tab + 1, (new StringBuilder("this.")).append(column.getName()).append(" = ").append(column.getName()).append(";").toString());
		s.insertln(tab, "}\r\n");
	}
}
