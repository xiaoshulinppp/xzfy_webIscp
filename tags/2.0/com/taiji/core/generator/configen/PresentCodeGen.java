// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   PresentCodeGen.java

package com.taiji.core.generator.configen;

import com.taiji.core.generator.GenerateParameter;
import com.taiji.core.generator.configen.service.IConfigService;
import com.taiji.core.generator.formgen.ParseTemplate;
import com.taiji.core.generator.formgen.component.RelationshipObject;
import com.taiji.core.generator.plugingen.DbNameConverter;
import com.taiji.core.generator.plugingen.Util;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.FileOperator;
import java.io.*;
import java.util.*;

// Referenced classes of package com.taiji.core.generator.configen:
//			Compiler

public class PresentCodeGen
{

	private File _templateFile;
	private String _templateString;
	private GenerateParameter parameter;

	public PresentCodeGen(GenerateParameter parameter)
	{
		this.parameter = parameter;
	}

	public PresentCodeGen(GenerateParameter parameter, File file)
	{
		_templateFile = file;
		this.parameter = parameter;
	}

	public PresentCodeGen(GenerateParameter parameter, String templateString)
	{
		_templateString = templateString;
		this.parameter = parameter;
	}

	public String getHtml()
	{
		ParseTemplate parse = new ParseTemplate(_templateFile);
		return parse.getHtml();
	}

	private String getFieldVariableName(String columnName)
	{
		return Util.decapitalise(DbNameConverter.getInstance().columnNameToVariableName1(columnName));
	}

	private String getTableVariableName(String tableName)
	{
		return Util.decapitalise(DbNameConverter.getInstance().tableNameToVariableName1(tableName));
	}

	private String getFieldString(String srcString, List fieldList)
	{
		String result = "";
		for (int i = 0; i < fieldList.size(); i++)
		{
			String field = (String)fieldList.get(i);
			String fieldObject = getTableVariableName(field);
			String classfieldObject = (new StringBuilder(String.valueOf(fieldObject.substring(0, 1).toUpperCase()))).append(fieldObject.substring(1)).toString();
			if (srcString.indexOf((new StringBuilder("get")).append(classfieldObject).toString()) < 0)
			{
				result = (new StringBuilder(String.valueOf(result))).append("private String ").append(fieldObject).append(";\r\n").toString();
				result = (new StringBuilder(String.valueOf(result))).append("public String get").append(classfieldObject).append("() {\r\n").toString();
				result = (new StringBuilder(String.valueOf(result))).append("\treturn ").append(fieldObject).append(";\r\n").toString();
				result = (new StringBuilder(String.valueOf(result))).append("}\r\n").toString();
				result = (new StringBuilder(String.valueOf(result))).append("public void set").append(classfieldObject).append("(String ").append(fieldObject).append(") {\r\n").toString();
				result = (new StringBuilder(String.valueOf(result))).append("\tthis.").append(fieldObject).append(" = ").append(fieldObject).append(";\r\n").toString();
				result = (new StringBuilder(String.valueOf(result))).append("}\r\n").toString();
			}
		}

		return result;
	}

	private String getFieldHbmString(String srcString, List fieldList)
	{
		String result = "";
		for (int i = 0; i < fieldList.size(); i++)
		{
			String field = (String)fieldList.get(i);
			if (srcString.indexOf((new StringBuilder("column=\"")).append(field).append("\"").toString()) < 0)
				result = (new StringBuilder(String.valueOf(result))).append("<property name=\"").append(getFieldVariableName(field)).append("\" type=\"java.lang.String\" column=\"").append(field).append("\"  />\r\n").toString();
		}

		return result;
	}

	public void gererateHbmJavaFile(List fieldList)
	{
		if (fieldList.size() <= 0)
			return;
		String sourceDir = (new StringBuilder(String.valueOf(ApplicationPath.getAppliactionPath()))).append(File.separator).append(parameter.getDomainPath()).toString();
		String className = parameter.getClassName();
		String fileName = (new StringBuilder(String.valueOf(sourceDir))).append(File.separator).append(className).append(".java").toString();
		File javaFile = new File(fileName);
		String javaFileString = getSourceFileString(javaFile);
		if (javaFileString.equalsIgnoreCase(""))
			return;
		int index = javaFileString.lastIndexOf("}");
		String fieldString = getFieldString(javaFileString, fieldList);
		if (fieldString.equalsIgnoreCase(""))
			return;
		javaFileString = (new StringBuilder(String.valueOf(javaFileString.substring(0, index)))).append(fieldString).append("\r\n}").toString();
		try
		{
			OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(fileName), "utf-8");
			writer.write(javaFileString);
			writer.flush();
			writer.close();
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		fileName = (new StringBuilder(String.valueOf(sourceDir))).append(File.separator).append(className).append(".hbm.xml").toString();
		javaFile = new File(fileName);
		javaFileString = getSourceFileString(javaFile);
		index = javaFileString.lastIndexOf("</class>");
		fieldString = getFieldHbmString(javaFileString, fieldList);
		javaFileString = (new StringBuilder(String.valueOf(javaFileString.substring(0, index)))).append(fieldString).append("\r\n</class>\r\n</hibernate-mapping>").toString();
		try
		{
			OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(fileName), "utf-8");
			writer.write(javaFileString);
			writer.flush();
			writer.close();
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		List source = new ArrayList();
		source.add((new StringBuilder(String.valueOf(sourceDir))).append(File.separator).append(className).append(".java").toString());
		String path = ApplicationPath.getAppliactionPath();
		List classpath = getComplieLibList(parameter);
		try
		{
			Compiler.compile(source, path, classpath);
		}
		catch (Exception e)
		{
			try
			{
				throw new Exception((new StringBuilder("compile error:")).append(e.getMessage()).toString());
			}
			catch (Exception e1)
			{
				e1.printStackTrace();
			}
		}
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

	public void generatePropertyFile()
		throws IOException
	{
		String destDir = (new StringBuilder(String.valueOf(ApplicationPath.getRootPath()))).append(System.getProperty("file.separator")).append(parameter.getWebPath()).toString();
		String fileName = (new StringBuilder(String.valueOf(parameter.getObjectName()))).append("Property.ftl").toString();
		String pathName = (new StringBuilder(String.valueOf(destDir))).append(System.getProperty("file.separator")).append(fileName).toString();
		File dir = new File(destDir);
		if (!dir.exists())
			dir.mkdir();
		String template = "";
		File file = new File(pathName);
		if (!file.exists())
			template = generateTemplate();
		else
			template = generateTemplate(file);
		OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(pathName), "utf-8");
		template = addHeadInfo(template);
		writer.write(template);
		writer.flush();
		writer.close();
	}

	private String addHeadInfo(String template)
	{
		StringBuffer buffer = new StringBuffer();
		if (template.indexOf("opName?has_content") < 0)
		{
			buffer.append("<#assign showState = \"false\">\n");
			buffer.append("<#if opName?has_content>\n");
			buffer.append("<#if opName == \"view\">\n");
			buffer.append("<#assign showState=\"true\">\n");
			buffer.append("</#if>\n");
			buffer.append("</#if>\n");
		}
		buffer.append(template);
		return buffer.toString();
	}

	protected String generateTemplate()
	{
		ParseTemplate parse = null;
		if (_templateFile != null)
			parse = new ParseTemplate(_templateFile);
		else
		if (_templateString != null)
			parse = new ParseTemplate(_templateString);
		return parse.generateTemplate();
	}

	protected String generateTemplate(File file)
	{
		ParseTemplate parse = null;
		if (_templateFile != null)
			parse = new ParseTemplate(_templateFile);
		else
		if (_templateString != null)
			parse = new ParseTemplate(_templateString);
		return parse.generateTemplate(file);
	}

	public void process()
		throws Exception
	{
		try
		{
			parameter.getConfigureSerivce().specialProcess(parameter);
			compile();
		}
		catch (Exception e)
		{
			throw new Exception((new StringBuilder("compile error:")).append(e.getMessage()).toString());
		}
		copyFileToPath();
		FileOperator.delFolder(parameter.getDestRootDir());
		if (parameter.getActionCfgFilePathName() != null)
			updateActionCfgFile();
		if (parameter.getServiceCfgFilePathName() != null)
			updateServiceCfgFile();
		if (parameter.getHibernateCfgFilePathName() != null)
			updateHibernateCfgFile();
	}

	private void compile()
		throws Exception
	{
		List source = getSourceFileList(parameter);
		String path = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(parameter.javaCodePath).toString();
		List classpath = getComplieLibList(parameter);
		try
		{
			Compiler.compile(source, path, classpath);
		}
		catch (Exception e)
		{
			throw new Exception((new StringBuilder("compile error:")).append(e.getMessage()).toString());
		}
	}

	private void copyFileToPath()
	{
		String sourceJavaPath = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(System.getProperty("file.separator")).append(parameter.javaCodePath).toString();
		String sourceWebPath = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(System.getProperty("file.separator")).append(parameter.webCodePath).toString();
		String destJavaPath = ApplicationPath.getAppliactionPath();
		String destWebPath = ApplicationPath.getRootPath();
		if (parameter.getRelationshipList().size() == 0)
		{
			FileOperator.copyFolderNotKeyFile(sourceJavaPath, destJavaPath, "InLine");
			FileOperator.copyFolderNotKeyFile(sourceWebPath, destWebPath, "InLine");
		} else
		{
			removeNoUseFile(sourceJavaPath, sourceWebPath);
			FileOperator.copyFolder(sourceJavaPath, destJavaPath);
			FileOperator.copyFolder(sourceWebPath, destWebPath);
		}
	}

	private void removeNoUseFile(String sourceJavaPath, String sourceWebPath)
	{
		List relationList = parameter.getRelationshipList();
		Iterator iter = relationList.iterator();
		FileOperator fop = new FileOperator();
		while (iter.hasNext()) 
		{
			RelationshipObject relation = (RelationshipObject)iter.next();
			int type = relation.getType();
			if (type != 1)
			{
				FileOperator.delAllFile(fop.searchFileByKey(sourceJavaPath, (new StringBuilder(String.valueOf(relation.getTableRelatedClassName()))).append("InLine").toString(), "java"));
				FileOperator.delAllFile(fop.searchFileByKey(sourceWebPath, (new StringBuilder(String.valueOf(relation.getTableRelatedClassName()))).append("InLine").toString(), "ftl"));
			}
		}
		FileOperator.delAllFile(fop.searchFileByKey(sourceJavaPath, (new StringBuilder(String.valueOf(parameter.getClassName()))).append("InLine").toString(), "java"));
		FileOperator.delAllFile(fop.searchFileByKey(sourceWebPath, (new StringBuilder(String.valueOf(parameter.getClassName()))).append("InLine").toString(), "ftl"));
	}

	private void appendFile(String fileName, String flagString, String appendString)
	{
		if (flagString.equalsIgnoreCase(""))
		{
			BufferedWriter writer = new BufferedWriter(new FileWriter(fileName));
			writer.write(appendString);
			writer.close();
			return;
		}
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(fileName));
			StringBuffer inputBuffer = new StringBuffer();
			for (String line = ""; (line = reader.readLine()) != null;)
			{
				inputBuffer.append(line);
				inputBuffer.append("\n");
			}

			reader.close();
			String content = inputBuffer.toString();
			int index = content.lastIndexOf(flagString);
			StringBuffer buffer = new StringBuffer();
			buffer.append(content.substring(0, index));
			buffer.append(appendString);
			buffer.append(content.substring(index));
			BufferedWriter writer = new BufferedWriter(new FileWriter(fileName));
			writer.write(buffer.toString());
			writer.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		return;
	}

	private void updateHibernateCfgFile()
	{
		String cfg = parameter.getConfigureSerivce().getHibernateConfigure(parameter);
		appendFile(parameter.getHibernateCfgFilePathName(), "</session-factory>", cfg);
	}

	private void updateActionCfgFile()
	{
		String cfg = parameter.getConfigureSerivce().getActionConfigure(parameter);
		for (Iterator iter = parameter.getRelationshipList().iterator(); iter.hasNext();)
		{
			RelationshipObject relation = (RelationshipObject)iter.next();
			String relationClassName = relation.getTableRelatedClassName();
			cfg = (new StringBuilder(String.valueOf(cfg))).append(parameter.getConfigureSerivce().getActionRelationConfigure(parameter, relation)).toString();
		}

		File cfgFile = new File(parameter.getActionCfgFilePathName());
		if (!cfgFile.exists())
			createActionCfgFile(cfgFile);
		appendFile(parameter.getActionCfgFilePathName(), "</package>", cfg);
	}

	private void createActionCfgFile(File cfgFile)
	{
		try
		{
			cfgFile.createNewFile();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append("<!DOCTYPE xwork\n");
		buffer.append("PUBLIC\n");
		buffer.append("\"-//OpenSymphony Group//XWork 1.0//EN\"\n");
		buffer.append(" \"http://www.opensymphony.com/xwork/xwork-1.0.dtd\">\n");
		buffer.append("<xwork>  \n");
		buffer.append((new StringBuilder("<package name=\"")).append(parameter.getBussissKey()).append("\" extends=\"default\" namespace=\"/").append(parameter.getBussissKey()).append("\">\n").toString());
		buffer.append("<default-interceptor-ref name=\"autowireDefault\"/>\n");
		buffer.append("</package> \n");
		buffer.append("</xwork>\n");
		appendFile(parameter.getActionCfgFilePathName(), "", buffer.toString());
	}

	private void updateServiceCfgFile()
	{
		String cfg = parameter.getConfigureSerivce().getServiceConfigure(parameter);
		if (cfg.equalsIgnoreCase(""))
			return;
		File cfgFile = new File(parameter.getServiceCfgFilePathName());
		if (!cfgFile.exists())
			createServiceCfgFile(cfgFile);
		appendFile(parameter.getServiceCfgFilePathName(), "</beans>", cfg);
	}

	private void createServiceCfgFile(File cfgFile)
	{
		try
		{
			cfgFile.createNewFile();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
		buffer.append("<!DOCTYPE beans PUBLIC \"-//SPRING//DTD BEAN//EN\" \"http://www.springframework.org/dtd/spring-beans.dtd\">\n");
		buffer.append("<beans>\n");
		buffer.append("</beans>\n");
		appendFile(parameter.getServiceCfgFilePathName(), "", buffer.toString());
	}

	private List getSourceFileList(GenerateParameter parameter)
	{
		List source = new ArrayList();
		FileOperator fop = new FileOperator();
		String path = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(parameter.javaCodePath).toString();
		if (parameter.getRelationshipList().size() == 0)
			return fop.removeFileByKey(path, "InLine", "java");
		else
			return getHasRelationSourceFileList(path, fop, parameter);
	}

	private List getHasRelationSourceFileList(String path, FileOperator fop, GenerateParameter parameter)
	{
		List relationList = parameter.getRelationshipList();
		Iterator iter = relationList.iterator();
		List resultList = new ArrayList();
		while (iter.hasNext()) 
		{
			RelationshipObject relation = (RelationshipObject)iter.next();
			int type = relation.getType();
			if (type == 2)
				resultList.addAll(fop.searchFileByKey(path, (new StringBuilder(String.valueOf(relation.getTableRelatedClassName()))).append("InLine").toString(), "java"));
		}
		resultList.addAll(fop.removeFileByKey(path, (new StringBuilder(String.valueOf(parameter.getClassName()))).append("InLine").toString(), "java"));
		return resultList;
	}

	private List getComplieLibList(GenerateParameter parameter)
	{
		List classpath = new ArrayList();
		String libPath = (new StringBuilder(String.valueOf(ApplicationPath.getRootPath()))).append(System.getProperty("file.separator")).append("WEB-INF").append(System.getProperty("file.separator")).append("lib").append(System.getProperty("file.separator")).toString();
		File file = new File(libPath);
		String listFile[] = file.list();
		for (int i = 0; i < listFile.length; i++)
		{
			String filename = listFile[i];
			if (filename.indexOf("commons") >= 0 || filename.indexOf("xwork") >= 0 || filename.indexOf("hibernate") >= 0 || filename.indexOf("spring") >= 0 || filename.indexOf("webwork") >= 0 || filename.indexOf("servlet") >= 0 || filename.indexOf("comcore") >= 0)
				classpath.add((new StringBuilder(String.valueOf(libPath))).append(listFile[i]).toString());
		}

		classpath.add(parameter.getAppPath());
		return classpath;
	}
}
