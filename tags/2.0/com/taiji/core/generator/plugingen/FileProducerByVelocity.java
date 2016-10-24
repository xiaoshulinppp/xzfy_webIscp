// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   FileProducerByVelocity.java

package com.taiji.core.generator.plugingen;

import com.taiji.core.exception.GenerateException;
import java.io.*;
import java.net.URL;
import java.util.Properties;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.*;

// Referenced classes of package com.taiji.core.generator.plugingen:
//			FileProducer

public final class FileProducerByVelocity extends FileProducer
{

	private VelocityEngine velocityEngine;
	private URL _template;
	private static final Log _log = LogFactory.getLog(com/taiji/core/generator/plugingen/FileProducerByVelocity);

	public FileProducerByVelocity()
	{
	}

	public FileProducerByVelocity(File destinationDir, String destinationFileName, URL template)
	{
		super(destinationDir, destinationFileName);
		setTemplate(template);
		int lastSlash = template.toString().lastIndexOf("/");
		int lastDot = template.toString().lastIndexOf(".");
		String id = template.toString().substring(lastSlash + 1, lastDot);
		setId(id);
	}

	public void setTemplate(URL template)
	{
		_template = template;
	}

	public void setEngine(VelocityEngine velocityEngine)
	{
		this.velocityEngine = velocityEngine;
	}

	public void init(Properties props)
	{
		if (velocityEngine == null)
		{
			velocityEngine = new VelocityEngine();
			try
			{
				velocityEngine.init(props);
			}
			catch (Exception e)
			{
				e.printStackTrace();
				throw new GenerateException(e.getMessage());
			}
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

	public void generate(File outputFile)
	{
		try
		{
			VelocityContext context = new VelocityContext(getContextMap());
			outputFile.getParentFile().mkdirs();
			OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(outputFile), "utf-8");
			java.io.Reader templateReader = new BufferedReader(new InputStreamReader(_template.openStream(), "utf-8"));
			boolean success = velocityEngine.evaluate(context, writer, "generator", templateReader);
			writer.flush();
			writer.close();
			if (!success)
				new GenerateException("file generate fail!!");
		}
		catch (IOException e)
		{
			_log.error(e.getMessage(), e);
			throw new GenerateException(e.getMessage());
		}
		catch (ParseErrorException e)
		{
			_log.error(e.getMessage(), e);
			throw new GenerateException(e.getMessage());
		}
		catch (MethodInvocationException e)
		{
			_log.error(e.getMessage(), e);
			throw new GenerateException(e.getMessage());
		}
		catch (ResourceNotFoundException e)
		{
			_log.error(e.getMessage(), e);
			e.printStackTrace();
			throw new GenerateException(e.getMessage());
		}
	}

}
