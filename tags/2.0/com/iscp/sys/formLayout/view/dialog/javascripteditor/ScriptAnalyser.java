// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ScriptAnalyser.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import java.io.PrintStream;
import java.util.*;
import javax.swing.*;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			JavaScriptDict, PropertyModel, ScriptTextArea

public class ScriptAnalyser
{

	private Map dict;
	private Map propertyModelMap;
	private Map typeMap;
	private JTextArea textarea;

	public ScriptAnalyser(ScriptTextArea textarea)
	{
		dict = (new JavaScriptDict()).dict;
		Iterator it = dict.keySet().iterator();
		propertyModelMap = new HashMap();
		String typeName;
		Map properties;
		for (; it.hasNext(); propertyModelMap.put(typeName, properties))
		{
			typeName = (String)it.next();
			DefaultListModel list = (DefaultListModel)dict.get(typeName);
			properties = new HashMap();
			for (int i = 0; i < list.size(); i++)
			{
				PropertyModel pm = (PropertyModel)list.getElementAt(i);
				String key;
				if (pm.method)
					key = (new StringBuilder("@#")).append(pm.name).append("$").append(pm.param.length).toString();
				else
					key = (new StringBuilder("@#")).append(pm.name).toString();
				properties.put(key, list.getElementAt(i));
			}

		}

		this.textarea = textarea;
	}

	public PropertyModel getMethodModel(String typeName, String methodName, int paramCount)
	{
		Map map = (Map)(Map)propertyModelMap.get(typeName);
		if (map != null)
			return (PropertyModel)map.get((new StringBuilder("@#")).append(methodName).append("$").append(paramCount).toString());
		else
			return null;
	}

	public PropertyModel getPropertyModel(String typeName, String propertyName)
	{
		Map map = (Map)(Map)propertyModelMap.get(typeName);
		if (map != null)
			return (PropertyModel)map.get((new StringBuilder("@#")).append(propertyName).toString());
		else
			return null;
	}

	public void setVarType(Map typeMap)
	{
		this.typeMap = typeMap;
	}

	private String getMethodType(String type, String text, int start, int end)
	{
		if (type == null)
			return "";
		char c = text.charAt(start);
		int begin = start;
		int bracketCount = 0;
		int paramCount = 0;
		int methodNameEnd = start;
		while (start < end) 
		{
			if (c == ',' && bracketCount == 1)
				paramCount++;
			else
			if (!isDivideChar(c) && paramCount == 0)
				paramCount++;
			else
			if (c == '(')
			{
				if (bracketCount == 0)
					methodNameEnd = start;
				bracketCount++;
			} else
			if (c == ')')
				bracketCount--;
			else
			if (c == '"' || c == '\'')
				forwardString(text, start, end, c);
			start++;
			c = text.charAt(start);
		}
		PropertyModel pm = getMethodModel(type, text.substring(begin, methodNameEnd), paramCount);
		if (pm != null)
			return pm.returnType;
		else
			return "";
	}

	private String getItemType(String type, String text, int start, int end)
	{
		if (start >= end)
			return "";
		if (start < 0)
			start = 0;
		if (text.charAt(end - 1) == ']')
		{
			int count = 1;
			while (end > start) 
			{
				end--;
				if (text.charAt(end - 1) == ']')
				{
					count++;
					continue;
				}
				if (text.charAt(end - 1) != '[' || --count != 0)
					continue;
				if (end > start)
					end--;
				break;
			}
		}
		System.out.println(text.substring(start, end));
		if (text.charAt(start) == '(' && text.charAt(end - 1) == ')')
			return getType(null, text, start + 1, end - 1);
		if (text.charAt(start) != '(' && text.charAt(end - 1) == ')')
			return getMethodType(type, text, start, end);
		if (text.charAt(start) != '(' && text.charAt(end - 1) != ')')
		{
			if (type == null)
				return (String)typeMap.get(text.substring(start, end));
			PropertyModel pm = getPropertyModel(type, text.substring(start, end));
			if (pm != null)
				return pm.returnType;
			else
				return "";
		} else
		{
			return "";
		}
	}

	private String getType(String type, String text, int start, int end)
	{
		if (start < 0)
			start = 0;
		int begin = start;
		char c = text.charAt(start);
		int bracketCount = 0;
		while (start <= end && c != '\n') 
		{
			if ((c == '.' || start == end) && bracketCount == 0)
			{
				type = getItemType(type, text, begin, start);
				begin = start + 1;
			} else
			if (c == '(')
				bracketCount++;
			else
			if (c == ')')
				bracketCount--;
			else
			if (c == '"' || c == '\'')
				forwardString(text, start, end, c);
			if (++start < end)
				c = text.charAt(start);
		}
		return type;
	}

	private int forwardString(String text, int start, int end, char quotation)
	{
		for (char c = text.charAt(start); start < end && c != '\n'; start++)
		{
			c = text.charAt(start);
			if (c == '\'' || c == '"')
				start++;
			else
			if (c == quotation)
				return start;
		}

		return start;
	}

	private int backwardString(String text, int end, char quotation)
	{
		for (char c = text.charAt(end); end >= 0 && c != '\n'; end--)
		{
			c = text.charAt(end);
			if (c == quotation && (end < 1 || text.charAt(end - 1) != '\\'))
				return end;
		}

		return end;
	}

	private int getStateFirstPosition(String text, int end)
	{
		char c = text.charAt(end);
		int bracketCount = 0;
		for (; end >= 0 && c != '\n'; end--)
		{
			c = text.charAt(end);
			if (c == ')')
				bracketCount++;
			else
			if (c == '(')
			{
				if (--bracketCount < 0)
					return end + 1;
			} else
			if (c == '"' || c == '\'')
			{
				end = backwardString(text, end - 1, c);
				if (text.charAt(end) == '\n' || end <= 0)
					return end;
			}
			if (bracketCount == 0 && !isVarnameChar(c))
				return end + 1;
		}

		return end;
	}

	public String getType(int end)
	{
		String text = textarea.getText();
		int currPos = end - 1;
		int lastDivPos = currPos - 1;
		int begin = getStateFirstPosition(text, currPos);
		if (begin < 0)
			begin = 0;
		String type = getType(null, text, begin, currPos);
		return type;
	}

	public ListModel getTypeList(int end)
	{
		DefaultListModel list = null;
		String type = getType(end);
		if (type != null)
			list = (DefaultListModel)dict.get(type);
		return list;
	}

	public static boolean isVarnameChar(char c)
	{
		if (c >= 'a' && c <= 'z')
			return true;
		if (c >= 'A' && c <= 'Z')
			return true;
		if (c >= '0' && c <= '9')
			return true;
		if (c == ')')
			return true;
		if (c == '(')
			return true;
		if (c == ']')
			return true;
		if (c == '[')
			return true;
		if (c == '.')
			return true;
		return c == '_';
	}

	public static boolean isDivideChar(char c)
	{
		if (c >= 'a' && c <= 'z')
			return false;
		if (c >= 'A' && c <= 'Z')
			return false;
		if (c >= '0' && c <= '9')
			return false;
		return c != '_' && c != '[' && c != ']';
	}
}
