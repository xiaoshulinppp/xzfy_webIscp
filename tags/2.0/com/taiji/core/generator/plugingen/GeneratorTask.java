// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   GeneratorTask.java

package com.taiji.core.generator.plugingen;

import com.taiji.core.exception.GenerateException;
import com.taiji.core.generator.GenerateParameter;
import com.taiji.core.generator.plugingen.javax.JavaPlugin;
import com.taiji.core.util.ApplicationPath;
import java.io.File;
import java.util.*;

// Referenced classes of package com.taiji.core.generator.plugingen:
//			Generator, PluginFinder, TableElement, Many2ManyElement, 
//			StandardDatabase, JNDIDatabase, GeneratorPopulator, CrossrefElement

public class GeneratorTask
{

	private final Generator _gen = new Generator();
	private boolean _isIncludeViews;
	private String _providerURL;
	private String _initialContextFactory;
	private String _driver;
	private String _databaseURL;
	private String _username;
	private String _password;
	private String _catalog;
	private String _schema;
	private String _databaseType;
	private String _sortColumns;
	private String _classpath;
	private boolean infogather;
	private Map _many2Many;
	private Map _tableMap;
	private Map _tablePrimaryKey;
	private static boolean _singularize = true;
	private static boolean _useDBTableNames = false;
	private static String _dataSourceJNDIName;
	private static String _appName;
	private File _prefsDir;

	public GeneratorTask()
	{
		_isIncludeViews = false;
		_sortColumns = null;
		_many2Many = new HashMap();
		_tableMap = new HashMap();
		_tablePrimaryKey = new HashMap();
		_prefsDir = new File((new StringBuilder(String.valueOf(System.getProperty("user.dir")))).append(File.separator).toString());
		_classpath = getPluginClassPath();
		try
		{
			PluginFinder.registerPlugins(_gen, _classpath);
		}
		catch (ClassCastException e)
		{
			e.printStackTrace();
		}
	}

	public void setCurrentUserPlugin(String destPath, GenerateParameter parameter, Map genParam)
	{
		JavaPlugin plugin;
		for (Iterator iter = parameter.getPlugins().keySet().iterator(); iter.hasNext(); _gen.addPlugin(plugin))
		{
			String pluginName = (String)iter.next();
			Class pluginClass = _gen.getPluginClass(pluginName);
			plugin = null;
			try
			{
				plugin = (JavaPlugin)pluginClass.newInstance();
			}
			catch (InstantiationException e)
			{
				e.printStackTrace();
			}
			catch (IllegalAccessException e)
			{
				e.printStackTrace();
			}
			Map paramMap = (Map)(Map)parameter.getPlugins().get(pluginName);
			if (paramMap == null)
				paramMap = new HashMap();
			if (genParam != null)
			{
				String key;
				for (Iterator iter1 = genParam.keySet().iterator(); iter1.hasNext(); paramMap.put(key, genParam.get(key)))
					key = (String)iter1.next();

			}
			plugin.setPropertySet(paramMap);
			plugin.setName(pluginName);
			plugin.setParameter(parameter);
			plugin.setDestionation(new File(destPath));
			plugin.setFunctionName(parameter.getFunctionName());
		}

	}

	public void setDatabaseType(String databaseType)
	{
		_databaseType = databaseType;
	}

	public void setDatasourceJNDIName(String dataSourceJNDIName)
	{
		_dataSourceJNDIName = dataSourceJNDIName;
	}

	public void setInitialContextFactory(String initialContextFactory)
	{
		_initialContextFactory = initialContextFactory;
	}

	public void setProviderURL(String providerURL)
	{
		_providerURL = providerURL;
	}

	public void setDriver(String driver)
	{
		_driver = driver;
	}

	public void setDatabaseURL(String databaseURL)
	{
		_databaseURL = databaseURL;
	}

	public void setUsername(String username)
	{
		_username = username;
	}

	public void setPassword(String password)
	{
		_password = password;
	}

	public void setSchema(String schema)
	{
		_schema = schema;
	}

	public void setCatalog(String catalog)
	{
		_catalog = catalog;
	}

	public void setIncludeViews(boolean flag)
	{
		_isIncludeViews = flag;
	}

	public void setSortColumns(String value)
	{
		_sortColumns = value;
	}

	public boolean isIncludeViews()
	{
		return _isIncludeViews;
	}

	public void setPrefsdir(File prefsDir)
	{
		_prefsDir = prefsDir;
	}

	public void addConfiguredTable(TableElement tableElement)
	{
		if (_tableMap.get(tableElement.getName()) != null)
		{
			throw new GenerateException((new StringBuilder("already exist tableElement[")).append(tableElement.getName()).append("]").toString());
		} else
		{
			_tableMap.put(tableElement.getName(), tableElement);
			_gen.addTableElement(tableElement);
			return;
		}
	}

	public void addConfiguredTable(String tableName)
	{
		if (_tableMap.get(tableName) != null)
		{
			throw new GenerateException((new StringBuilder("already exist tableElement[")).append(tableName).append("]").toString());
		} else
		{
			TableElement tableElement = new TableElement();
			tableElement.setName(tableName);
			_gen.addTableElement(tableElement);
			_tableMap.put(tableName, tableElement);
			return;
		}
	}

	public void addConfiguredTableNames(Collection tableNames)
	{
		String tableName;
		for (Iterator iter = tableNames.iterator(); iter.hasNext(); addConfiguredTable(tableName))
			tableName = (String)iter.next();

	}

	public void addConfiguredTables(Collection tables)
	{
		for (Iterator iter = tables.iterator(); iter.hasNext(); addConfiguredTable((TableElement)iter.next()));
	}

	public void addTablePrimaryKeys(String tablename, Collection primaryKeys)
	{
		if (_tableMap.get(tablename) == null)
		{
			throw new GenerateException((new StringBuilder("table[")).append(tablename).append("]can't be specified.").toString());
		} else
		{
			_tablePrimaryKey.put(tablename, primaryKeys);
			return;
		}
	}

	public void addConfiguredRelation(String tableName, CrossrefElement relationElement)
	{
		if (_tableMap.get(tableName) == null)
		{
			throw new GenerateException((new StringBuilder("table[")).append(tableName).append("]can't be specified.").toString());
		} else
		{
			TableElement tableElement = (TableElement)_tableMap.get(tableName);
			tableElement.addCrossref(relationElement);
			return;
		}
	}

	public void addConfiguredMany2Many(String tablea, String jointable, String tableb, boolean ctlFlag)
	{
		if (_tableMap.get(tablea) == null)
			throw new GenerateException((new StringBuilder("table[")).append(tablea).append("]can't be specified.").toString());
		if (_tableMap.get(jointable) == null)
			throw new GenerateException((new StringBuilder("table[")).append(jointable).append("]can't be specified.").toString());
		if (_tableMap.get(tableb) == null)
		{
			throw new GenerateException((new StringBuilder("table[")).append(tableb).append("]can't be specified.").toString());
		} else
		{
			TableElement tableElementA = (TableElement)_tableMap.get(tablea);
			TableElement tableElementjointable = (TableElement)_tableMap.get(jointable);
			TableElement tableElementB = (TableElement)_tableMap.get(tableb);
			Many2ManyElement many2manyElement = new Many2ManyElement();
			many2manyElement.setTablea(tableElementA);
			many2manyElement.setTableb(tableElementB);
			many2manyElement.setTablec(tableElementjointable);
			many2manyElement.setControl(ctlFlag);
			addConfiguredMany2Many(many2manyElement);
			return;
		}
	}

	private void addConfiguredMany2Many(Many2ManyElement many2manyElement)
	{
		many2manyElement.order();
		Collection c = (Collection)(Collection)_many2Many.get(many2manyElement.getOrderNamedWithoutJoinTable());
		if (c == null)
		{
			c = new LinkedList();
			_many2Many.put(many2manyElement.getOrderNamedWithoutJoinTable(), c);
		}
		c.add(many2manyElement);
		_gen.addTableElement(many2manyElement.getTablea());
		_gen.addTableElement(many2manyElement.getJoinTable());
		_gen.addTableElement(many2manyElement.getTableb());
	}

	public void execute()
		throws Exception
	{
		validate();
		try
		{
			Database database;
			if (_databaseURL != null)
				database = new StandardDatabase(_driver, _databaseURL, _username, _password);
			else
				database = new JNDIDatabase(_initialContextFactory, _providerURL, _dataSourceJNDIName);
			GeneratorPopulator generatePopulator = new GeneratorPopulator(_gen, database, _schema, _catalog, _many2Many, _tablePrimaryKey, _sortColumns);
			generatePopulator.populate(_gen.getTableElements());
			generatePopulator.closeConnection();
			_gen.validate();
			_gen.decorateAll();
			_gen.writeSource();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public static boolean getSingularize()
	{
		return _singularize;
	}

	private void validate()
		throws Exception
	{
		if (_driver == null && _dataSourceJNDIName == null)
		{
			throw new Exception("You must either specify driver or dataSourceJNDIName");
		} else
		{
			presentRequired(_dataSourceJNDIName, "dataSourceJNDIName", _providerURL, "providerURL");
			presentRequired(_dataSourceJNDIName, "dataSourceJNDIName", _initialContextFactory, "initialContextFactory");
			presentRequired(_databaseURL, "databaseURL", _driver, "driver");
			return;
		}
	}

	private void presentRequired(String presentValue, String presentName, String requiredValue, String requiredName)
		throws Exception
	{
		if (presentValue != null && requiredValue == null)
			throw new Exception((new StringBuilder("When ")).append(presentName).append(" is specified, you also have to specify ").append(requiredName).toString());
		else
			return;
	}

	private String getPluginClassPath()
	{
		String result = "";
		String pluginPath = "com.taiji.core.generator.plugingen.plugins";
		pluginPath = pluginPath.replace(".", File.separator);
		String path = (new StringBuilder(String.valueOf(ApplicationPath.getAppliactionPath()))).append(File.separator).append(pluginPath).toString();
		File pluginRootDir = new File(path);
		File pluginsPath[] = pluginRootDir.listFiles();
		for (int i = 0; i < pluginsPath.length; i++)
		{
			File subFile = pluginsPath[i];
			if (subFile.isDirectory())
				result = (new StringBuilder(String.valueOf(result))).append(subFile.getAbsolutePath()).append(";").toString();
		}

		return result;
	}

}
