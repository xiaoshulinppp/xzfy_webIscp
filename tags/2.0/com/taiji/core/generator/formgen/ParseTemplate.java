// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ParseTemplate.java

package com.taiji.core.generator.formgen;

import com.taiji.core.generator.formgen.component.CheckBox;
import com.taiji.core.generator.formgen.component.Element;
import com.taiji.core.generator.formgen.component.Hidden;
import com.taiji.core.generator.formgen.component.Input;
import com.taiji.core.generator.formgen.component.InputFile;
import com.taiji.core.generator.formgen.component.Radio;
import com.taiji.core.generator.formgen.component.Select;
import com.taiji.core.generator.formgen.component.ShowList;
import com.taiji.core.generator.formgen.component.Textarea;
import java.io.*;
import java.util.*;

public class ParseTemplate
{

	private static String HiddenTokenBegin = "[$hidden]";
	private static String HiddenTokenEnd = "[/$hidden]";
	private static String ElementTokenBegin = "[$element]";
	private static String ElementokenEnd = "[/$element]";
	private static String FormPathTokenBegin = "[$formpath]";
	private static String FormPathTokenEnd = "[/$formpath]";
	private File inputFile;
	private String inputString;
	private static String defaultStatic[] = {
		"Р§зг1", "Р§зг2", "Р§зг3"
	};

	public ParseTemplate(File midFile)
	{
		inputString = null;
		inputFile = midFile;
		StringBuffer inputBuffer = new StringBuffer();
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(inputFile));
			for (String line = ""; (line = reader.readLine()) != null;)
				inputBuffer.append(line);

			reader.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		inputString = inputBuffer.toString();
	}

	public ParseTemplate(String inputString)
	{
		this.inputString = null;
		this.inputString = inputString;
	}

	public String getWebPath()
	{
		int start = inputString.lastIndexOf(FormPathTokenBegin) + FormPathTokenBegin.length();
		int end = inputString.lastIndexOf(FormPathTokenEnd);
		if (start > 0 && end > 0)
			return inputString.substring(start, end);
		else
			return "";
	}

	public String generateTemplate()
	{
		StringBuffer outputBuffer = new StringBuffer();
		int lastHiddenIndex = inputString.lastIndexOf(HiddenTokenEnd);
		String elementStrings;
		if (lastHiddenIndex > 0)
		{
			String hiddenString = inputString.substring(0, lastHiddenIndex + HiddenTokenEnd.length());
			outputBuffer.append(getHiddenElementTemplate(hiddenString));
			elementStrings = inputString.substring(lastHiddenIndex + HiddenTokenEnd.length() + 1);
		} else
		{
			elementStrings = inputString;
		}
		int lastFormPathIndex = elementStrings.lastIndexOf(FormPathTokenEnd);
		if (lastFormPathIndex > 0)
			elementStrings = elementStrings.substring(lastFormPathIndex + FormPathTokenEnd.length() + 1);
		ArrayList elementList = (ArrayList)splitString(elementStrings, ElementokenEnd);
		Iterator iter = elementList.iterator();
		Element element = new Element();
		while (iter.hasNext()) 
		{
			String elementString = (String)iter.next();
			int start = elementString.indexOf(ElementTokenBegin);
			outputBuffer.append(elementString.substring(0, start));
			element.setSourceString(elementString);
			String showType = element.getFieldShowType();
			if (showType.equals("input"))
			{
				Input input = new Input(element);
				outputBuffer.append(input.getTemplateElement());
			} else
			if (showType.equals("textarea"))
			{
				Textarea area = new Textarea(element);
				outputBuffer.append(area.getTemplateElement());
			} else
			if (showType.equals("radio"))
			{
				Radio radio = new Radio(element);
				outputBuffer.append(radio.getTemplateElement());
			} else
			if (showType.equals("checkbox"))
			{
				CheckBox checkbox = new CheckBox(element);
				outputBuffer.append(checkbox.getTemplateElement());
			} else
			if (showType.equals("select"))
			{
				Select select = new Select(element);
				outputBuffer.append(select.getTemplateElement());
			} else
			if (showType.equals("inputfile"))
			{
				InputFile file = new InputFile(element);
				outputBuffer.append(file.getTemplateElement());
			} else
			if (showType.equals("list"))
			{
				ShowList list = new ShowList(elementString);
				outputBuffer.append(list.getTemplateElement());
			}
		}
		int elementIndex = elementStrings.lastIndexOf(ElementokenEnd);
		outputBuffer.append(elementStrings.substring(elementIndex + ElementokenEnd.length()));
		return outputBuffer.toString();
	}

	public String getSourceFileString(File srcFile)
	{
		StringBuffer inputBuffer = new StringBuffer();
		try
		{
			InputStreamReader reader1 = new InputStreamReader(new FileInputStream(srcFile), "utf-8");
			BufferedReader reader = new BufferedReader(reader1);
			for (String line = ""; (line = reader.readLine()) != null;)
				inputBuffer.append((new StringBuilder(String.valueOf(line))).append("\r\n").toString());

			reader.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		return inputBuffer.toString();
	}

	private String getScript(String sourceString)
	{
		int index = sourceString.indexOf("onblur");
		if (index >= 0)
		{
			int bIndex = sourceString.substring(index).indexOf("\"") + index;
			int eIndex = sourceString.substring(bIndex + 1).indexOf("\"") + bIndex;
			return sourceString.substring(index, eIndex + 2);
		}
		index = sourceString.indexOf("onclick");
		if (index >= 0)
		{
			int bIndex = sourceString.substring(index).indexOf("\"") + index;
			int eIndex = sourceString.substring(bIndex + 1).indexOf("\"") + bIndex;
			return sourceString.substring(index, eIndex + 2);
		}
		index = sourceString.indexOf("onfocus");
		if (index >= 0)
		{
			int bIndex = sourceString.substring(index).indexOf("\"") + index;
			int eIndex = sourceString.substring(bIndex + 1).indexOf("\"") + bIndex;
			return sourceString.substring(index, eIndex + 2);
		} else
		{
			return "";
		}
	}

	public String generateTemplate(File srcFile)
	{
		StringBuffer outputBuffer = new StringBuffer();
		String sourceFileString = getSourceFileString(srcFile);
		int lastHiddenIndex = inputString.lastIndexOf(HiddenTokenEnd);
		String elementStrings;
		if (lastHiddenIndex > 0)
		{
			String hiddenString = inputString.substring(0, lastHiddenIndex + HiddenTokenEnd.length());
			outputBuffer.append(getHiddenElementTemplate(hiddenString));
			elementStrings = inputString.substring(lastHiddenIndex + HiddenTokenEnd.length() + 1);
		} else
		{
			elementStrings = inputString;
		}
		int lastFormPathIndex = elementStrings.lastIndexOf(FormPathTokenEnd);
		if (lastFormPathIndex > 0)
			elementStrings = elementStrings.substring(lastFormPathIndex + FormPathTokenEnd.length() + 1);
		ArrayList elementList = (ArrayList)splitString(elementStrings, ElementokenEnd);
		Iterator iter = elementList.iterator();
		Element element = new Element();
		while (iter.hasNext()) 
		{
			String elementString = (String)iter.next();
			int start = elementString.indexOf(ElementTokenBegin);
			element.setSourceString(elementString);
			String showType = element.getFieldShowType();
			int elementSourceIndex = sourceFileString.indexOf((new StringBuilder("'")).append(element.getTableName()).append(".").append(element.getFieldName()).append("'").toString());
			String scriptString = "";
			String genString = "";
			int beginElementIndex = 0;
			int endElementIndex = 0;
			String replaceString = "";
			if (elementSourceIndex >= 0)
			{
				String tempS = sourceFileString.substring(0, elementSourceIndex);
				beginElementIndex = tempS.lastIndexOf(">");
				String endS = sourceFileString.substring(beginElementIndex + 1);
				endElementIndex = beginElementIndex + endS.indexOf(">");
				replaceString = sourceFileString.substring(beginElementIndex + 1, endElementIndex + 2);
				scriptString = getScript(replaceString);
			}
			if (showType.equals("input"))
			{
				Input input = new Input(element);
				genString = input.getTemplateElement();
				if (elementSourceIndex >= 0)
				{
					int genEndIndex = genString.lastIndexOf("/>");
					String tempString = (new StringBuilder(String.valueOf(genString.substring(0, genEndIndex)))).append(scriptString).append("/>").toString();
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString.substring(0, beginElementIndex + 1)))).append(tempString).append(sourceFileString.substring(endElementIndex + 2)).toString();
				} else
				{
					int addEndIndex = sourceFileString.indexOf("</tbody>");
					int trIndex = elementString.indexOf("<tr");
					int trEndIndex = sourceFileString.lastIndexOf("</tr>");
					String headString = "";
					if (trIndex > 0 && addEndIndex - trEndIndex > 5)
						headString = elementString.substring(trIndex, start);
					else
						headString = elementString.substring(0, start);
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString.substring(0, addEndIndex)))).append(headString).append(genString).append(sourceFileString.substring(addEndIndex)).toString();
				}
			} else
			if (showType.equals("textarea"))
			{
				Textarea area = new Textarea(element);
				genString = area.getTemplateElement();
				if (elementSourceIndex >= 0)
				{
					int genEndIndex = genString.lastIndexOf("/>");
					String tempString = (new StringBuilder(String.valueOf(genString.substring(0, genEndIndex)))).append(scriptString).append("/>").toString();
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString.substring(0, beginElementIndex + 1)))).append(tempString).append(sourceFileString.substring(endElementIndex + 2)).toString();
				} else
				{
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString))).append(elementString.substring(0, start)).append(genString).append("</td>").toString();
				}
			} else
			if (showType.equals("radio"))
			{
				Radio radio = new Radio(element);
				genString = radio.getTemplateElement();
				if (elementSourceIndex >= 0)
				{
					int genEndIndex = genString.lastIndexOf("/>");
					String tempString = (new StringBuilder(String.valueOf(genString.substring(0, genEndIndex)))).append(scriptString).append("/>").toString();
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString.substring(0, beginElementIndex + 1)))).append(tempString).append(sourceFileString.substring(endElementIndex + 2)).toString();
				} else
				{
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString))).append(elementString.substring(0, start)).append(genString).append("</td>").toString();
				}
			} else
			if (showType.equals("checkbox"))
			{
				CheckBox checkbox = new CheckBox(element);
				genString = checkbox.getTemplateElement();
				if (elementSourceIndex >= 0)
				{
					int genEndIndex = genString.lastIndexOf("/>");
					String tempString = (new StringBuilder(String.valueOf(genString.substring(0, genEndIndex)))).append(scriptString).append("/>").toString();
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString.substring(0, beginElementIndex + 1)))).append(tempString).append(sourceFileString.substring(endElementIndex + 2)).toString();
				} else
				{
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString))).append(elementString.substring(0, start)).append(genString).append("</td>").toString();
				}
			} else
			if (showType.equals("select"))
			{
				Select select = new Select(element);
				genString = select.getTemplateElement();
				if (elementSourceIndex >= 0)
				{
					int genEndIndex = genString.lastIndexOf("/>");
					String tempString = (new StringBuilder(String.valueOf(genString.substring(0, genEndIndex)))).append(scriptString).append("/>").toString();
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString.substring(0, beginElementIndex + 1)))).append(tempString).append(sourceFileString.substring(endElementIndex + 2)).toString();
				} else
				{
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString))).append(elementString.substring(0, start)).append(genString).append("</td>").toString();
				}
			} else
			if (showType.equals("inputfile"))
			{
				InputFile file = new InputFile(element);
				genString = file.getTemplateElement();
				if (elementSourceIndex >= 0)
				{
					int genEndIndex = genString.lastIndexOf("/>");
					String tempString = (new StringBuilder(String.valueOf(genString.substring(0, genEndIndex)))).append(scriptString).append("/>").toString();
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString.substring(0, beginElementIndex + 1)))).append(tempString).append(sourceFileString.substring(endElementIndex + 2)).toString();
				} else
				{
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString))).append(elementString.substring(0, start)).append(genString).append("</td>").toString();
				}
			} else
			if (showType.equals("list"))
			{
				ShowList list = new ShowList(elementString);
				genString = list.getTemplateElement();
				if (elementSourceIndex >= 0)
				{
					int genEndIndex = genString.lastIndexOf("/>");
					String tempString = (new StringBuilder(String.valueOf(genString.substring(0, genEndIndex)))).append(scriptString).append("/>").toString();
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString.substring(0, beginElementIndex + 1)))).append(tempString).append(sourceFileString.substring(endElementIndex + 2)).toString();
				} else
				{
					sourceFileString = (new StringBuilder(String.valueOf(sourceFileString))).append(elementString.substring(0, start)).append(genString).append("</td>").toString();
				}
			}
		}
		int addEndIndex = sourceFileString.indexOf("</tbody>");
		sourceFileString = (new StringBuilder(String.valueOf(sourceFileString.substring(0, addEndIndex)))).append("</td></tr>").append(sourceFileString.substring(addEndIndex)).toString();
		return sourceFileString;
	}

	public String getHtml()
	{
		StringBuffer outputBuffer = new StringBuffer();
		int lastHiddenIndex = inputString.lastIndexOf(HiddenTokenEnd);
		String elementStrings;
		if (lastHiddenIndex > 0)
		{
			String hiddenString = inputString.substring(0, lastHiddenIndex + HiddenTokenEnd.length());
			outputBuffer.append(getHiddenElementHtml(hiddenString));
			elementStrings = inputString.substring(lastHiddenIndex + HiddenTokenEnd.length());
		} else
		{
			elementStrings = inputString;
		}
		ArrayList elementList = (ArrayList)splitString(elementStrings, ElementokenEnd);
		Iterator iter = elementList.iterator();
		Element element = new Element();
		while (iter.hasNext()) 
		{
			String elementString = (String)iter.next();
			int start = elementString.indexOf(ElementTokenBegin);
			outputBuffer.append(elementString.substring(0, start));
			element.setSourceString(elementString);
			String showType = element.getFieldShowType();
			if (showType.equals("input"))
			{
				Input input = new Input(element);
				outputBuffer.append(input);
			} else
			if (showType.equals("textarea"))
			{
				Textarea area = new Textarea(element);
				outputBuffer.append(area);
			} else
			if (showType.equals("radio"))
			{
				Radio radio = new Radio(element);
				outputBuffer.append(radio);
			} else
			if (showType.equals("checkbox"))
			{
				CheckBox checkbox = new CheckBox(element);
				outputBuffer.append(checkbox);
			} else
			if (showType.equals("select"))
			{
				Select select = new Select(element);
				outputBuffer.append(select);
			} else
			if (showType.equals("inputfile"))
			{
				InputFile file = new InputFile(element);
				outputBuffer.append(file);
			} else
			if (showType.equals("list"))
			{
				ShowList list = new ShowList(elementString);
				outputBuffer.append(list);
			}
		}
		int elementIndex = elementStrings.lastIndexOf(ElementokenEnd);
		outputBuffer.append(elementStrings.substring(elementIndex + ElementokenEnd.length()));
		return outputBuffer.toString();
	}

	protected String getHiddenElementHtml(String inputvalue)
	{
		StringBuffer result = new StringBuffer();
		ArrayList list = (ArrayList)splitString(inputvalue, HiddenTokenEnd);
		Iterator it = list.iterator();
		Element element = new Element();
		Hidden hidden;
		for (; it.hasNext(); result.append(hidden))
		{
			String hiddenString = (String)it.next();
			element.setSourceString(hiddenString);
			hidden = new Hidden(element);
		}

		return result.toString();
	}

	protected String getHiddenElementTemplate(String inputvalue)
	{
		StringBuffer result = new StringBuffer();
		ArrayList list = (ArrayList)splitString(inputvalue, HiddenTokenBegin);
		Iterator it = list.iterator();
		Element element = new Element();
		Hidden hidden;
		for (; it.hasNext(); result.append(hidden.getTemplateElement()))
		{
			String hiddenString = (String)it.next();
			element.setSourceString(hiddenString);
			hidden = new Hidden(element);
		}

		return result.toString();
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

	public static String[] getShow(String str)
	{
		if (str == null)
			return defaultStatic;
		Vector s = new Vector();
		int start = 0;
		int end = -1;
		do
		{
			start = end + 1;
			end = str.indexOf("|", start);
			if (end < 0)
			{
				if (start >= str.length())
					break;
				end = str.length();
			}
			String p = str.substring(start, end);
			int div = p.indexOf(":");
			if (div >= 0)
				s.add(p.substring(0, div));
		} while (true);
		int size = s.size();
		if (size == 0)
			return defaultStatic;
		String show[] = new String[size];
		for (int i = 0; i < size; i++)
			show[i] = (String)s.get(i);

		return show;
	}

}
