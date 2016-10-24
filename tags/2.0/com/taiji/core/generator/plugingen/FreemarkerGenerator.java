// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   FreemarkerGenerator.java

package com.taiji.core.generator.plugingen;

import com.taiji.core.exception.GenerateException;
import freemarker.core.ParseException;
import freemarker.template.*;
import java.io.*;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class FreemarkerGenerator
{

	private final Log logger;
	private Configuration cfg;
	private Map context;

	public FreemarkerGenerator()
	{
		logger = LogFactory.getLog(getClass());
		cfg = null;
		cfg = new Configuration();
	}

	public FreemarkerGenerator(Map context)
	{
		logger = LogFactory.getLog(getClass());
		cfg = null;
		cfg = new Configuration();
		cfg.setDefaultEncoding("UTF-8");
		this.context = context;
	}

	public void setContext(Map context)
	{
		this.context = context;
	}

	public Configuration getConfiguration()
	{
		return cfg;
	}

	public void setTemplateLoadPath(String path)
	{
		try
		{
			cfg.setDirectoryForTemplateLoading(new File(path));
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	public void generate(String templateFileName, String outDir, String outputfile)
	{
		Template t;
		OutputStreamWriter writer;
		System.out.println("generate template file");
		t = null;
		try
		{
			(new File(outDir)).mkdirs();
			t = cfg.getTemplate(templateFileName);
			t.setEncoding("UTF-8");
		}
		catch (FileNotFoundException fe)
		{
			throw new GenerateException((new StringBuilder("Error:The template File could not be found---")).append(templateFileName).toString());
		}
		catch (ParseException pe)
		{
			throw new GenerateException((new StringBuilder("Error:The template(")).append(templateFileName).append(")is syntactically bad").toString());
		}
		catch (IOException ioe)
		{
			throw new GenerateException((new StringBuilder("Error:Load the Template generate error--- ")).append(templateFileName).toString());
		}
		writer = null;
		try
		{
			writer = new OutputStreamWriter(new FileOutputStream((new StringBuilder(String.valueOf(outDir))).append(File.separator).append(outputfile).toString()), "utf-8");
			t.process(context, writer);
		}
		catch (TemplateException te)
		{
			throw new GenerateException((new StringBuilder("Error: when processing the Template ")).append(templateFileName).toString());
		}
		catch (IOException e)
		{
			throw new GenerateException((new StringBuilder("Error: when generating file ")).append(outputfile).toString());
		}
		break MISSING_BLOCK_LABEL_262;
		Exception exception;
		exception;
		try
		{
			writer.flush();
			writer.close();
		}
		catch (IOException e1)
		{
			e1.printStackTrace();
		}
		throw exception;
		try
		{
			writer.flush();
			writer.close();
		}
		catch (IOException e1)
		{
			e1.printStackTrace();
		}
		return;
	}

	public PrintWriter createPrintWriter(String outDir, String filename)
	{
		if (filename == null)
			throw new IllegalArgumentException("create PrintWriter:the filename couldn't be null");
		PrintWriter writer = null;
		FileOutputStream fileOutputStream = null;
		File outputFile = new File(outDir, filename);
		File directoryFile = new File(outDir);
		directoryFile.mkdir();
		boolean bDoesnotAlreadyExists = false;
		try
		{
			bDoesnotAlreadyExists = outputFile.createNewFile();
		}
		catch (Throwable exc)
		{
			throw new GenerateException((new StringBuilder("count not create outputFile,because ")).append(exc).toString());
		}
		try
		{
			fileOutputStream = new FileOutputStream(outputFile);
		}
		catch (FileNotFoundException fe)
		{
			throw new GenerateException("count not find outputFile", fe);
		}
		writer = new PrintWriter(fileOutputStream);
		return writer;
	}
}
