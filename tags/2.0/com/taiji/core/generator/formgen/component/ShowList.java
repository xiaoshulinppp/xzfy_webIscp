// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ShowList.java

package com.taiji.core.generator.formgen.component;

import com.taiji.core.generator.plugingen.*;
import com.taiji.core.util.ApplicationPath;
import freemarker.template.Configuration;
import java.io.File;
import java.util.*;

public class ShowList
{

	private String _tableName;
	private String _className;
	private String _id;
	private String _perm;
	private List fieldList;
	private String _mainTable;
	private String _mainClass;
	private String _type;
	private String _simpleDictAbbr;
	private String _dictField;
	private static String TableTokenBegin = "[$table]";
	private static String TableTokenEnd = "[/$table]";
	private static String IDTokenBegin = "[$id]";
	private static String IDTokenEnd = "[/$id]";
	private static String permTokenBegin = "[$perm]";
	private static String permTokenEnd = "[/$perm]";
	private static String FieldTokenBegin = "[$field]";
	private static String FieldTokenEnd = "[/$field]";
	private static String NameTokenBegin = "[$name]";
	private static String NameTokenEnd = "[/$name]";
	private static String ByNameTokenBegin = "[$byname]";
	private static String ByNameTokenEnd = "[/$byname]";
	private static String WidthTokenBegin = "[$width]";
	private static String WidthTokenEnd = "[/$width]";
	private static String mainTableTokenBegin = "[$primaryTable]";
	private static String mainTableTokenEnd = "[/$primaryTable]";
	private static String typeTokenBegin = "[$type]";
	private static String typeTokenEnd = "[/$type]";
	private static String fieldShowTypeTokenBegin = "[$listfieldshowtype]";
	private static String fieldShowTypeTokenEnd = "[/$listfieldshowtype]";
	private static String dictListIdTokenBegin = "[$dictlistid]";
	private static String dictListIdTokenEnd = "[/$dictlistid]";
	private static String dictTypeTokenBegin = "[$dicttype]";
	private static String dictTypeTokenEnd = "[/$dicttype]";
	private static String dictvalgettypeTokenBegin = "[$dictvalgettype]";
	private static String dictvalgettypeTokenEnd = "[/$dictvalgettype]";
	private static String scriptTokenBegin = "[$script]";
	private static String scriptTokenEnd = "[/$script]";
	private static String templateFile = "showList.ftl";
	private static String templatePermFile = "showListPerm.ftl";
	private static String WEBINFOPATH = "pages/info";

	public ShowList(String element)
	{
		init(element);
	}

	public void init(String inputString)
	{
		_tableName = getTableVariableName(getTableName(inputString));
		_className = getClassName(getTableName(inputString));
		_mainTable = getTableVariableName(getMainTableName(inputString));
		_mainClass = getClassName(getMainTableName(inputString));
		_id = getFieldVariableName(getID(inputString));
		_perm = getPerm(inputString);
		_type = getType(inputString);
		fieldList = getFieldList(inputString);
	}

	private String getTableName(String inputString)
	{
		return getParseValue(inputString, TableTokenBegin, TableTokenEnd);
	}

	private String getMainTableName(String inputString)
	{
		return getParseValue(inputString, mainTableTokenBegin, mainTableTokenEnd);
	}

	private String getID(String inputString)
	{
		return getParseValue(inputString, IDTokenBegin, IDTokenEnd);
	}

	private String getPerm(String inputString)
	{
		return getParseValue(inputString, permTokenBegin, permTokenEnd);
	}

	private String getType(String inputString)
	{
		return getParseValue(inputString, typeTokenBegin, typeTokenEnd);
	}

	private List getFieldList(String inputString)
	{
		List result = new ArrayList();
		int startIndex = inputString.indexOf(FieldTokenBegin);
		int endIndex = inputString.lastIndexOf(FieldTokenEnd) + 9;
		String fields = inputString.substring(startIndex, endIndex);
		ArrayList list = (ArrayList)splitString(fields, FieldTokenEnd);
		Iterator it = list.iterator();
		int count = 0;
		Map field;
		for (; it.hasNext(); result.add(field))
		{
			String fieldString = (String)it.next();
			String name = getFieldVariableName(getParseValue(fieldString, NameTokenBegin, NameTokenEnd));
			String byname = getParseValue(fieldString, ByNameTokenBegin, ByNameTokenEnd);
			String width = getParseValue(fieldString, WidthTokenBegin, WidthTokenEnd);
			field = new HashMap();
			field.put("name", name);
			field.put("byname", byname);
			field.put("width", width);
			if (!_type.equalsIgnoreCase("normal"))
				processDictList(fieldString, field);
		}

		return result;
	}

	private void processDictList(String fieldString, Map field)
	{
		String fieldshowtype = getParseValue(fieldString, fieldShowTypeTokenBegin, fieldShowTypeTokenEnd);
		String dictlistid = getParseValue(fieldString, dictListIdTokenBegin, dictListIdTokenEnd);
		String dicttype = getParseValue(fieldString, dictTypeTokenBegin, dictTypeTokenEnd);
		String dictvalgettype = getParseValue(fieldString, dictvalgettypeTokenBegin, dictvalgettypeTokenEnd);
		String script = getParseValue(fieldString, scriptTokenBegin, scriptTokenEnd);
		field.put("fieldshowtype", fieldshowtype);
		field.put("dictlistid", dictlistid);
		field.put("dicttype", dicttype);
		field.put("dictvalgettype", dictvalgettype);
		if (script != null && !script.equalsIgnoreCase(""))
			field.put("script", script);
		if (fieldshowtype.equalsIgnoreCase("dict"))
		{
			_simpleDictAbbr = dictlistid;
			_dictField = (String)field.get("name");
		}
	}

	public String getTemplateElement()
	{
		StringBuffer buffer = new StringBuffer();
		if (_perm.equals("true"))
		{
			if (_type.equalsIgnoreCase("normal"))
			{
				String temp = "<#if query?has_content >\n";
				temp = (new StringBuilder(String.valueOf(temp))).append("<IFRAME border=0 frameBorder=0 frameSpacing=0 height=300 name=\"").append(_tableName).append("\" scrolling=\"auto\"\n").toString();
				buffer.append(temp);
				temp = (new StringBuilder("src=\"")).append(_className).append("QueryList.action?funcCode=${funcCode}&opName=${opName}&id=${infoId}\" width=766 hspale=\"0\" vspale=\"0\" >\n").toString();
				buffer.append(temp);
				temp = "</IFRAME><br>\n";
				temp = (new StringBuilder(String.valueOf(temp))).append("<#else>\n").toString();
				temp = (new StringBuilder(String.valueOf(temp))).append("<IFRAME border=0 frameBorder=0 frameSpacing=0 height=300 name=\"").append(_tableName).append("\" scrolling=\"auto\"\n").toString();
				buffer.append(temp);
				temp = (new StringBuilder("src=\"list")).append(_className).append("InLine.action?funcCode=${funcCode}&opName=${opName}&").append(_mainTable).append("Id=${entityId}&listType=").append(_type).append("\" width=766 hspale=\"0\" vspale=\"0\" >\n").toString();
				buffer.append(temp);
				temp = "</IFRAME><br>\n";
				temp = (new StringBuilder(String.valueOf(temp))).append("</#if>\n").toString();
				buffer.append(temp);
			} else
			{
				if (_type.equalsIgnoreCase("dict"))
				{
					String templateFile = "listDictInsertTemplate.ftl";
					String filename = (new StringBuilder("list")).append(_className).append("InsertInLineModule.ftl").toString();
					generateListFile(filename, templateFile);
					templateFile = "listDictUpdateTemplate.ftl";
					filename = (new StringBuilder("list")).append(_className).append("UpdateInLineModule.ftl").toString();
					generateListFile(filename, templateFile);
					String temp = "<#if opName?has_content>\n";
					buffer.append(temp);
					temp = "<#if opName == \"create\">\n";
					buffer.append(temp);
					temp = (new StringBuilder("<#include \"list")).append(_className).append("InsertInLineModule.ftl\">\n").toString();
					buffer.append(temp);
					temp = "<#else>\n";
					buffer.append(temp);
					temp = (new StringBuilder("<#include \"list")).append(_className).append("UpdateInLineModule.ftl\">\n").toString();
					buffer.append(temp);
					temp = "</#if>\n";
					buffer.append(temp);
					temp = "</#if>\n";
					buffer.append(temp);
				}
				if (_type.equalsIgnoreCase("simple"))
				{
					String templateFile = "listSimpleTemplate.ftl";
					String filename = (new StringBuilder("list")).append(_className).append("DictInLineModule.ftl").toString();
					generateListFile(filename, templateFile);
					templateFile = "listSimpleMiddleInsertTemplate.ftl";
					filename = (new StringBuilder("list")).append(_className).append("InsertInLineModule.ftl").toString();
					generateListFile(filename, templateFile);
					templateFile = "listSimpleMiddleUpdateTemplate.ftl";
					filename = (new StringBuilder("list")).append(_className).append("UpdateInLineModule.ftl").toString();
					generateListFile(filename, templateFile);
					String temp = "<#if opName?has_content>\n";
					buffer.append(temp);
					temp = "<#if opName == \"create\">\n";
					buffer.append(temp);
					temp = "<#if dictAbbr?has_content>\n";
					buffer.append(temp);
					temp = (new StringBuilder(" <#include \"list")).append(_className).append("DictInLineModule.ftl\">\n").toString();
					buffer.append(temp);
					temp = "<#else>\n";
					buffer.append(temp);
					temp = (new StringBuilder("<#include \"list")).append(_className).append("InsertInLineModule.ftl\">\n").toString();
					buffer.append(temp);
					temp = "</#if>\n";
					buffer.append(temp);
					temp = "<#else>\n";
					buffer.append(temp);
					temp = "<#if dictAbbr?has_content>\n";
					buffer.append(temp);
					temp = (new StringBuilder(" <#include \"list")).append(_className).append("DictInLineModule.ftl\">\n").toString();
					buffer.append(temp);
					temp = "<#else>\n";
					buffer.append(temp);
					temp = (new StringBuilder("<#include \"list")).append(_className).append("UpdateInLineModule.ftl\">\n").toString();
					buffer.append(temp);
					temp = "</#if>\n";
					buffer.append(temp);
					temp = "</#if>\n";
					buffer.append(temp);
					temp = "</#if>\n";
					buffer.append(temp);
				}
			}
		} else
		{
			String temp = "<table width=\"98%\" border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"0\" class=\"tabout\" id=\"color_table\">\n";
			buffer.append(temp);
			temp = " <tr>\n";
			buffer.append(temp);
			temp = " <th width=\"40\" class=\"thListNormal\">Ñ¡Ôñ</th>\n";
			buffer.append(temp);
			Iterator iter;
			for (iter = fieldList.iterator(); iter.hasNext(); buffer.append(temp))
			{
				Map fields = (Map)(Map)iter.next();
				String byname = (String)fields.get("byname");
				temp = (new StringBuilder("  <th class=\"thListNormal\">")).append(byname).append("</th>\n").toString();
			}

			temp = " <th width=\"40\" class=\"thListNormal\"></th>\n";
			temp = (new StringBuilder(String.valueOf(temp))).append(" </tr>\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("<#list ")).append(_tableName).append("ListResult as ").append(_tableName).append(" >\n").toString();
			buffer.append(temp);
			iter = fieldList.iterator();
			temp = " <tr class=\"trcolor\">\n";
			buffer.append(temp);
			temp = (new StringBuilder("<td class=\"tdlistCenter\"><@ww.checkboxvalue name=\"'selectRecord'\" fieldValue=\"'${")).append(_tableName).append(".").append(_id).append("}'\" list =\"getAllCustom").append(_className).append("s()\" disabled =\"'${showState}'\"/></td>\n").toString();
			buffer.append(temp);
			for (; iter.hasNext(); buffer.append(temp))
			{
				Map fields = (Map)(Map)iter.next();
				String name = (String)fields.get("name");
				String fieldName = (new StringBuilder(String.valueOf(_tableName))).append(".").append(name).toString();
				temp = (new StringBuilder("  <td class=\"tdlistCenter\">${")).append(fieldName).append("}").toString();
				temp = (new StringBuilder(String.valueOf(temp))).append("  </td>").toString();
			}

			temp = (new StringBuilder("<td class=\"tdlistCenter\"><a href=\"javascript:scan(${")).append(_tableName).append(".").append(_id).append("})\">²é¿´</a></td>").toString();
			temp = (new StringBuilder(String.valueOf(temp))).append(" </tr>\n").toString();
			temp = (new StringBuilder(String.valueOf(temp))).append("</#list>\n").toString();
			temp = (new StringBuilder(String.valueOf(temp))).append("</table>\n").toString();
			buffer.append(temp);
			temp = "<script language=\"javascript\">\n";
			buffer.append(temp);
			temp = "function scan(id) {\n";
			temp = (new StringBuilder(String.valueOf(temp))).append("\twindow.open(\"view").append(_className).append(".action?").append(_tableName).append("Id=\"+id+\"&funcCode=${funcCode}&opName=view&inLine=true\",\"\",\"width=500,height=300,resizable=1,scrollbars=1,left=240,top=200\")\n").toString();
			temp = (new StringBuilder(String.valueOf(temp))).append("}\n").toString();
			temp = (new StringBuilder(String.valueOf(temp))).append("</script>\n").toString();
			buffer.append(temp);
		}
		return buffer.toString();
	}

	private void generateListFile(String filename, String template)
	{
		String destDir = (new StringBuilder(String.valueOf(ApplicationPath.getRootPath()))).append(System.getProperty("file.separator")).append(WEBINFOPATH).toString();
		File dest = new File(destDir);
		File outFile = new File(destDir, filename);
		FileProducerByFreemarker fm = new FileProducerByFreemarker(dest, filename, template);
		Properties props = new Properties();
		Map context = new HashMap();
		context.put("tableName", _tableName);
		context.put("className", _className);
		context.put("mainClass", _mainClass);
		context.put("mainTable", _mainTable);
		context.put("id", _id);
		context.put("fieldList", fieldList);
		context.put("type", _type);
		if (_simpleDictAbbr != null)
			context.put("simpleDictAbbr", _simpleDictAbbr);
		if (_dictField != null)
			context.put("dictField", _dictField);
		fm.addContextMap(context);
		fm.init(props);
		fm.getCfg().setClassForTemplateLoading(getClass(), "");
		fm.generate(outFile);
	}

	public String toString()
	{
		StringBuffer buffer = new StringBuffer();
		String temp = "<table width=\"98%\" border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"0\" class=\"tabout\" id=\"color_table\">\n";
		buffer.append(temp);
		temp = " <tr>\n";
		buffer.append(temp);
		for (Iterator iter = fieldList.iterator(); iter.hasNext(); buffer.append(temp))
		{
			Map fields = (Map)(Map)iter.next();
			String byname = (String)fields.get("byname");
			temp = (new StringBuilder("  <th class=\"thListNormal\">")).append(byname).append("</th>\n").toString();
		}

		temp = " </tr>\n";
		buffer.append(temp);
		int size = fieldList.size();
		for (int i = 0; i < 5; i++)
		{
			temp = "<tr class=\"trcolor\">\n";
			for (int j = 0; j < size; j++)
				temp = (new StringBuilder(String.valueOf(temp))).append("  <td class=\"tdlistCenter\">test</td>\n").toString();

			temp = (new StringBuilder(String.valueOf(temp))).append(" </tr>\n").toString();
			buffer.append(temp);
		}

		temp = "</table>\n";
		buffer.append(temp);
		return buffer.toString();
	}

	private Collection splitString(String mainString, String substring)
	{
		int startIndex = 0;
		Collection substringList = new ArrayList();
		int subIndex;
		for (; startIndex < mainString.length(); startIndex = subIndex + substring.length())
		{
			subIndex = mainString.indexOf(substring, startIndex);
			if (subIndex < 0)
				break;
			String elementstring = mainString.substring(startIndex, subIndex + substring.length());
			substringList.add(elementstring);
		}

		return substringList;
	}

	private String getParseValue(String inputString, String startToken, String endToken)
	{
		int start = inputString.lastIndexOf(startToken) + startToken.length();
		int end = inputString.lastIndexOf(endToken);
		if (start > 0 && end > 0)
			return inputString.substring(start, end);
		else
			return "";
	}

	private String getTableVariableName(String tableName)
	{
		return Util.decapitalise(DbNameConverter.getInstance().tableNameToVariableName(tableName));
	}

	private String getFieldVariableName(String fieldName)
	{
		return Util.decapitalise(DbNameConverter.getInstance().columnNameToVariableName(fieldName));
	}

	private String getClassName(String tableName)
	{
		return Util.capitalise(DbNameConverter.getInstance().tableNameToVariableName(tableName));
	}

}
