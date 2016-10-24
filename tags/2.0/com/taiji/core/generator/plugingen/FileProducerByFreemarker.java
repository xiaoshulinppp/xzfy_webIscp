// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   FileProducerByFreemarker.java

package com.taiji.core.generator.plugingen;

import com.taiji.core.exception.GenerateException;
import freemarker.core.ParseException;
import freemarker.template.*;
import java.io.*;
import java.util.Properties;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

// Referenced classes of package com.taiji.core.generator.plugingen:
//			FileProducer

public final class FileProducerByFreemarker extends FileProducer
{

	private Configuration cfg;
	private String _template;
	private static final Log _log = LogFactory.getLog(com/taiji/core/generator/plugingen/FileProducerByFreemarker);

	public FileProducerByFreemarker()
	{
		cfg = null;
	}

	public FileProducerByFreemarker(File destinationDir, String destinationFileName, String template)
	{
		super(destinationDir, destinationFileName);
		cfg = null;
		_template = template;
		int lastSlash = template.lastIndexOf("/");
		int lastDot = template.lastIndexOf(".");
		String id = template.substring(lastSlash + 1, lastDot);
		setId(id);
	}

	public void init(Properties props)
	{
		if (cfg == null)
		{
			cfg = new Configuration();
			cfg.setDefaultEncoding("utf-8");
		}
		try
		{
			cfg.setSettings(props);
		}
		catch (TemplateException e)
		{
			e.printStackTrace();
			throw new GenerateException(e.getMessage());
		}
	}

	public Configuration getCfg()
	{
		return cfg;
	}

	public void generate(File outputFile)
	{
		Template t = null;
		try
		{
			outputFile.getParentFile().mkdirs();
			t = cfg.getTemplate(_template);
			t.setEncoding("UTF-8");
		}
		catch (FileNotFoundException fe)
		{
			throw new GenerateException((new StringBuilder("Error:The template File could not be found---")).append(_template).toString());
		}
		catch (ParseException pe)
		{
			throw new GenerateException((new StringBuilder("Error:The template(")).append(_template).append(")is syntactically bad").append(pe.getMessage()).toString());
		}
		catch (IOException ioe)
		{
			throw new GenerateException((new StringBuilder("Error:Load the Template generate error--- ")).append(_template).toString());
		}
		try
		{
			OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(outputFile), "utf-8");
			t.process(getContextMap(), writer);
			writer.flush();
			writer.close();
		}
		catch (TemplateException te)
		{
			throw new GenerateException((new StringBuilder("Error: when processing the Template ")).append(_template).append(te.getMessage()).toString());
		}
		catch (IOException e)
		{
			throw new GenerateException((new StringBuilder("Error: when generating file ")).append(outputFile).toString());
		}
	}

	public void validate()
		throws IllegalStateException
	{
		if (_template == null)
		{
			String msg = "Please specify the template attribute in the fileproducer.";
			_log.error(msg);
			throw new IllegalStateException(msg);
		} else
		{
			super.validate();
			return;
		}
	}

}
