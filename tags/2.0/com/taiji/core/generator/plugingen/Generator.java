// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Generator.java

package com.taiji.core.generator.plugingen;

import com.taiji.core.exception.GenerateException;
import com.taiji.core.generator.plugingen.javax.JavaPlugin;
import java.io.File;
import java.util.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

// Referenced classes of package com.taiji.core.generator.plugingen:
//			Plugin, DbTable, TableElement, Many2ManyElement, 
//			Relation

public class Generator
{

	private Map _tableElements;
	private final Map _tables = new HashMap();
	private final List _relations = new LinkedList();
	private final Collection _plugins = new LinkedList();
	private final Map _pluginClasses = new HashMap();
	private File _rootDir;
	private Map _many2Many;
	private static final Log log = LogFactory.getLog(com/taiji/core/generator/plugingen/Generator);

	public Generator()
	{
		_tableElements = new HashMap();
		_many2Many = new HashMap();
		registerPlugin("simple", com/taiji/core/generator/plugingen/Plugin);
		registerPlugin("java", com/taiji/core/generator/plugingen/javax/JavaPlugin);
		registerPlugin("plugin", com/taiji/core/generator/plugingen/Plugin);
	}

	public Map getTableElements()
	{
		return _tableElements;
	}

	public Collection getTables()
	{
		return _tables.values();
	}

	public Collection getTables(Plugin plugin)
	{
		Collection result = new LinkedList();
		for (Iterator iter = getTables().iterator(); iter.hasNext(); result.add(plugin.decorate((DbTable)iter.next())));
		return result;
	}

	public List getRelations()
	{
		return _relations;
	}

	public Plugin getPlugin(String name)
	{
		for (Iterator iter = getPlugins().iterator(); iter.hasNext();)
		{
			Plugin plugin = (Plugin)iter.next();
			if (plugin.getName().equals(name))
				return plugin;
		}

		return null;
	}

	public Collection getPlugins()
	{
		return _plugins;
	}

	public DbTable getTable(String tableName)
	{
		DbTable result = (DbTable)_tables.get(tableName);
		if (result == null)
			throw new IllegalArgumentException("table can't be null");
		else
			return result;
	}

	public boolean constainTable(String table)
	{
		return _tables.get(table.toLowerCase()) != null;
	}

	public Class getPluginClass(String pluginName)
	{
		return (Class)(Class)_pluginClasses.get(pluginName);
	}

	public void addPlugin(Plugin plugin)
	{
		_plugins.add(plugin);
		plugin.setGenerator(this);
	}

	public void addTableElement(TableElement tableElement)
	{
		_tableElements.put(tableElement.getName(), tableElement);
	}

	public void addCinfiguredMany2Many(Many2ManyElement many2manyElement)
	{
		many2manyElement.order();
		Collection c = (Collection)(Collection)_many2Many.get(many2manyElement.getOrderNamedWithoutJoinTable());
		if (c == null)
		{
			c = new LinkedList();
			_many2Many.put(many2manyElement.getOrderNamedWithoutJoinTable(), c);
		}
		addTableElement(many2manyElement.getTablea());
		addTableElement(many2manyElement.getJoinTable());
		addTableElement(many2manyElement.getTableb());
	}

	public void clear()
	{
		_tables.clear();
		_relations.clear();
	}

	public void addTable(DbTable table)
	{
		_tables.put(table.getName(), table);
	}

	public void addRelation(Relation relation)
	{
		_relations.add(relation);
	}

	public void removeRelation(Relation relation)
	{
		_relations.remove(relation);
	}

	public void registerPlugin(String pluginName, Class pluginClass)
	{
		_pluginClasses.put(pluginName, pluginClass);
	}

	public void decorateAll()
	{
		Plugin plugin;
		for (Iterator iter = getPlugins().iterator(); iter.hasNext(); plugin.decorateAll(getTables()))
			plugin = (Plugin)iter.next();

	}

	public void validate()
		throws GenerateException
	{
		Set pluginNames = new HashSet();
		Plugin plugin;
		for (Iterator iter = getPlugins().iterator(); iter.hasNext(); plugin.validate())
		{
			plugin = (Plugin)iter.next();
			if (pluginNames.contains(plugin.getName()))
			{
				String msg = (new StringBuilder("already exist plugin:")).append(plugin.getName()).toString();
				throw new GenerateException(msg);
			}
			pluginNames.add(plugin.getName());
		}

	}

	public void writeSource()
		throws GenerateException
	{
		Plugin plugin;
		for (Iterator iter = getPlugins().iterator(); iter.hasNext(); plugin.generate())
			plugin = (Plugin)iter.next();

	}

}
