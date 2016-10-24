// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   JavaScriptDict.java

package com.iscp.sys.formLayout.view.dialog.javascripteditor;

import java.io.InputStream;
import java.net.URL;
import java.util.*;
import javax.swing.DefaultListModel;

// Referenced classes of package com.iscp.sys.formLayout.view.dialog.javascripteditor:
//			PropertyModel

public class JavaScriptDict
{

	public Map dict;
	private char charBuffer[];
	private char charBufferBack[];
	private int charBufferIndex;
	private int fileIndex;
	private byte byteBuffer[];
	private boolean endOfFile;
	private String curr_superType;
	private String curr_returnType;
	private String curr_type;
	private String curr_method;
	private Vector curr_paramType;
	private Vector curr_param;
	private char defaultFilter[] = {
		'\r', '\n', ' '
	};
	private static final int PROPERTY_READING_STEP_RETURNTYPE = 0;
	private static final int PROPERTY_READING_STEP_NAME = 1;
	private static final int PROPERTY_READING_STEP_PARAMTYPE = 2;
	private static final int PROPERTY_READING_STEP_PARAM = 3;
	private static final int PROPERTY_READING_STEP_PARAM_END = 4;
	int lineCount;

	public JavaScriptDict()
	{
		dict = new HashMap();
		charBuffer = new char[10000];
		charBufferBack = new char[10000];
		charBufferIndex = 0;
		fileIndex = 0;
		byteBuffer = new byte[10];
		endOfFile = false;
		lineCount = 0;
		dict = new HashMap();
		try
		{
			loadFromFile();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		_dict_reset();
	}

	private DefaultListModel _dict_get_list(String type)
	{
		DefaultListModel list = null;
		Object o = dict.get(type);
		if (o == null || !(o instanceof DefaultListModel))
		{
			list = new DefaultListModel();
			dict.put(type, list);
		} else
		{
			list = (DefaultListModel)o;
		}
		return list;
	}

	private void _dict_add_p(String returnType, String type, String property)
	{
		DefaultListModel list = _dict_get_list(type);
		PropertyModel p = new PropertyModel(property);
		p.returnType = returnType;
		list.addElement(p);
	}

	private void _dict_add_m(String type, String method)
	{
		DefaultListModel list = _dict_get_list(type);
		list.addElement(new PropertyModel(method, true));
	}

	private void _dict_add_m(String returnType, String type, String method, String paramType[], String param[])
	{
		DefaultListModel list = _dict_get_list(type);
		PropertyModel m = new PropertyModel(method);
		m.method = true;
		m.param = param;
		m.paramType = paramType;
		m.returnType = returnType;
		list.addElement(m);
	}

	private void loadFromFile()
		throws Exception
	{
		URL url = com/iscp/sys/formLayout/view/dialog/javascripteditor/JavaScriptDict.getResource("JavaScriptDict.txt");
		loadGlobe(url.openStream());
	}

	private char readChar(InputStream is)
		throws Exception
	{
		int i = is.read(byteBuffer, 0, 1);
		i = is.available();
		if (i == 0)
		{
			endOfFile = true;
			return '\0';
		}
		if (byteBuffer[0] == 10)
			lineCount++;
		if (byteBuffer[0] < 0)
		{
			i = is.read(byteBuffer, 1, 1);
			if (i == 0)
			{
				endOfFile = true;
				return '\0';
			}
			charBuffer[charBufferIndex] = (char)((byteBuffer[0] + 128) * 256 + byteBuffer[1]);
		} else
		{
			charBuffer[charBufferIndex] = (char)byteBuffer[0];
		}
		charBufferIndex++;
		return charBuffer[charBufferIndex - 1];
	}

	private String getBufferedString()
	{
		String str = (new String(charBuffer, 0, charBufferIndex)).trim();
		charBuffer[0] = charBuffer[charBufferIndex];
		charBufferIndex = 1;
		return str;
	}

	private String getNormalBufferedString()
	{
		int validCharCount = 0;
		for (int i = 0; i < charBufferIndex - 1; i++)
			if (isNormalChar(charBuffer[i]))
			{
				charBufferBack[validCharCount] = charBuffer[i];
				validCharCount++;
			}

		String str = (new String(charBufferBack, 0, validCharCount)).trim();
		charBuffer[0] = charBuffer[charBufferIndex - 1];
		charBufferIndex = 1;
		return str;
	}

	private String getBufferedString(char filter[])
	{
		int validCharCount = 0;
		boolean valid = true;
		for (int i = 0; i < charBufferIndex; i++)
		{
			valid = true;
			for (int j = 0; j < filter.length; j++)
			{
				if (charBuffer[i] != filter[j])
					continue;
				valid = false;
				break;
			}

			if (valid)
			{
				charBufferBack[validCharCount] = charBuffer[i];
				validCharCount++;
			}
		}

		String str = (new String(charBufferBack, 0, validCharCount)).trim();
		charBuffer[0] = charBuffer[charBufferIndex];
		charBufferIndex = 1;
		return str;
	}

	private void loadGlobe(InputStream is)
		throws Exception
	{
		do
		{
			char c = readChar(is);
			if (endOfFile)
				return;
			if (c == ':')
			{
				curr_type = getNormalBufferedString();
				charBufferIndex = 0;
			} else
			if (c == '{')
			{
				if (curr_type == null)
				{
					curr_type = getNormalBufferedString();
				} else
				{
					curr_superType = getNormalBufferedString();
					_dict_extends_type(curr_type, curr_superType);
				}
				charBufferIndex = 0;
				loadType(is);
			}
		} while (true);
	}

	private void loadType(InputStream is)
		throws Exception
	{
		do
		{
			char c = readChar(is);
			if (endOfFile)
			{
				curr_type = null;
				return;
			}
			if (isNormalChar(c))
			{
				loadProperty(is);
			} else
			{
				if (c == '}')
				{
					curr_type = null;
					charBufferIndex = 0;
					return;
				}
				charBufferIndex = 0;
			}
		} while (true);
	}

	private boolean isNormalChar(char c)
	{
		if (c >= 'a' && c <= 'z')
			return true;
		if (c >= 'A' && c <= 'Z')
			return true;
		if (c >= '0' && c <= '9')
			return true;
		return c == '_' || c == '-';
	}

	private void loadProperty(InputStream is)
		throws Exception
	{
		int property_reading_step = 0;
		curr_param = null;
		curr_paramType = null;
		curr_method = null;
		curr_returnType = null;
		char c;
		do
		{
			c = readChar(is);
			if (endOfFile)
				return;
			if (!isNormalChar(c))
			{
				if (charBufferIndex > 0)
				{
					if (property_reading_step == 0)
					{
						curr_returnType = getNormalBufferedString();
						property_reading_step = 1;
					} else
					if (property_reading_step == 1)
					{
						curr_method = getNormalBufferedString();
						property_reading_step = 2;
					} else
					if (property_reading_step == 2)
					{
						String paramTypeStr = getNormalBufferedString();
						if (paramTypeStr.length() > 0)
						{
							curr_paramType.add(paramTypeStr);
							property_reading_step++;
						}
					} else
					if (property_reading_step == 3)
					{
						String paramStr = getNormalBufferedString();
						if (paramStr.length() > 0)
						{
							curr_param.add(paramStr);
							property_reading_step = 2;
						}
					}
				} else
				{
					charBufferIndex = 0;
				}
				if (c == '(')
				{
					curr_param = new Vector();
					curr_paramType = new Vector();
				}
			}
		} while (c != ';');
		if (curr_param == null)
		{
			_dict_add_p(curr_returnType, curr_type, curr_method);
		} else
		{
			int size = curr_param.size();
			if (size != curr_paramType.size())
				throw new Exception((new StringBuilder("第")).append(lineCount).append("行:").append(curr_returnType).append(" ").append(curr_type).append(".").append(curr_method).append("表达式错误").toString());
			String curr_param_array[] = new String[size];
			String curr_paramType_array[] = new String[size];
			for (int i = 0; i < size; i++)
			{
				curr_param_array[i] = (String)curr_param.get(i);
				curr_paramType_array[i] = (String)curr_paramType.get(i);
			}

			_dict_add_m(curr_returnType, curr_type, curr_method, curr_paramType_array, curr_param_array);
		}
	}

	private void _dict_extends_type(String type, String superType)
	{
		DefaultListModel superList = _dict_get_list(superType);
		DefaultListModel list = _dict_get_list(type);
		if (list != null)
		{
			for (int i = 0; i < superList.size(); i++)
				list.addElement(superList.get(i));

		}
	}

	private void _dict_reset()
	{
		Object type;
		DefaultListModel list;
		for (Iterator types = dict.keySet().iterator(); types.hasNext(); dict.put(type, list))
		{
			type = types.next();
			list = _dict_get_list((String)type);
			if (list == null)
				return;
			Object value[] = list.toArray();
			Arrays.sort(value);
			list.removeAllElements();
			for (int i = 0; i < value.length; i++)
				list.addElement(value[i]);

		}

	}
}
