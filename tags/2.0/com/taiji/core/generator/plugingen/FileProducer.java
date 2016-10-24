// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   FileProducer.java

package com.taiji.core.generator.plugingen;

import java.io.File;
import java.text.MessageFormat;
import java.util.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

// Referenced classes of package com.taiji.core.generator.plugingen:
//			TableElement, TableDecorator

public abstract class FileProducer
{

	private File _destinationDir;
	private String _destinationFileName;
	private final Map _contexMap;
	private Map _tableElements;
	private String _id;
	private boolean _isCustom;
	private String packageName;
	private static final Log _log = LogFactory.getLog(com/taiji/core/generator/plugingen/FileProducer);

	public FileProducer()
	{
		_contexMap = new HashMap();
		_tableElements = new HashMap();
		_isCustom = true;
	}

	public FileProducer(File destinationDir, String destinationFileName)
	{
		_contexMap = new HashMap();
		_tableElements = new HashMap();
		if (destinationDir == null)
			throw new IllegalArgumentException("destinationDir can't be null");
		if (destinationFileName == null)
		{
			throw new IllegalArgumentException("destinationFileName can't be null");
		} else
		{
			setDestinationDir(destinationDir);
			setDestinationFileName(destinationFileName);
			return;
		}
	}

	public void setId(String id)
	{
		_id = id;
	}

	public void setDestinationDir(File destinationDir)
	{
		_destinationDir = destinationDir;
	}

	public void setDestinationFileName(String destinationFileName)
	{
		_destinationFileName = destinationFileName;
	}

	protected Map getContextMap()
	{
		return _contexMap;
	}

	public void addContextMap(Map context)
	{
		_contexMap.putAll(context);
	}

	public String getId()
	{
		return _id;
	}

	public boolean isGenerationPerTable()
	{
		return _destinationFileName.indexOf("{0}") != -1;
	}

	public void validate()
		throws IllegalStateException
	{
		if (_isCustom)
			if (getId() != null)
			{
				if (_destinationDir != null)
				{
					String msg = (new StringBuilder("In fileproducer with id=\"")).append(getId()).append("\", destination should *not* be specified. ").append("The fileproducer is overriding an existing template in the plugin, ").append("but the plugin should still decide where to store the generated file. ").append(_destinationDir.getAbsolutePath()).toString();
					_log.error(msg);
					throw new IllegalStateException(msg);
				}
				if (_destinationFileName != null)
				{
					String msg = (new StringBuilder("In fileproducer with id=\"")).append(getId()).append("\", filename should *not* be specified. ").append("The fileproducer is overriding an existing template in the plugin, ").append("but the plugin should still decide how to name the generated file. ").append(_destinationFileName).toString();
					_log.error(msg);
					throw new IllegalStateException(msg);
				}
			} else
			{
				if (_destinationDir == null)
				{
					String msg = "Please specify the destination attribute in the fileproducer.";
					_log.error(msg);
					throw new IllegalStateException(msg);
				}
				if (_destinationDir == null)
				{
					String msg = "Please specify the filename attribute in the fileproducer.";
					_log.error(msg);
					throw new IllegalStateException(msg);
				}
			}
	}

	public void addConfigureTable(TableElement tableElement)
	{
		_tableElements.put(tableElement.getName(), tableElement);
	}

	public void generateForTable(TableDecorator tableDecorator)
	{
		String destionationFileName = MessageFormat.format(_destinationFileName, new String[] {
			tableDecorator.getReplaceName()
		});
		File outFile = new File(_destinationDir, destionationFileName);
		Map context = new HashMap();
		getContextMap().put("table", tableDecorator);
		generate(outFile);
	}

	public void copyPropsFrom(FileProducer other)
	{
		_destinationDir = other._destinationDir;
		_destinationFileName = other._destinationFileName;
	}

	boolean accept(TableDecorator tableDecorator)
	{
		if (_tableElements == null)
			return true;
		else
			return _tableElements.containsKey(tableDecorator.getSqlName());
	}

	public abstract void init(Properties properties);

	protected abstract void generate(File file);

}
