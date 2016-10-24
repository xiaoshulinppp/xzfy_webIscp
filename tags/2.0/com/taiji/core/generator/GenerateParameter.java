// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   GenerateParameter.java

package com.taiji.core.generator;

import com.iscp.sys.formLayout.msg.RelModel;
import com.taiji.core.generator.configen.service.IConfigService;
import com.taiji.core.generator.formgen.component.RelationshipObject;
import com.taiji.core.generator.plugingen.DbNameConverter;
import com.taiji.core.generator.plugingen.Util;
import com.taiji.core.util.ApplicationPath;
import java.io.File;
import java.util.*;
import org.dom4j.*;
import org.dom4j.io.SAXReader;

public class GenerateParameter
{

	public String javaCodePath;
	public String webCodePath;
	private static String actionKey = "action";
	private static String serviceKey = "service";
	private static String domainKey = "domain";
	private static String webworkKey = "webwork";
	private String bussissKey;
	private String actionPath;
	private String domainPath;
	private String servicePath;
	private String webPath;
	private String acitionPackageName;
	private String domainPackageName;
	private String servicePackageName;
	private String serviceImplPackageName;
	private String className;
	private String objectName;
	private String tableName;
	private String tableNameKeyColumn;
	private List relationshipList;
	private boolean genFlag;
	private String actionCfgFilePathName;
	private String serviceCfgFilePathName;
	private String hibernateCfgFilePathName;
	private String appPath;
	private String destRootDir;
	private IConfigService cfgService;
	private Element root;
	private Map plugins;
	private String packageName;
	private String functionName;
	private Map showListType;

	public GenerateParameter(String destRootDir)
	{
		javaCodePath = (new StringBuilder(String.valueOf(System.getProperty("file.separator")))).append("java").toString();
		webCodePath = (new StringBuilder(String.valueOf(System.getProperty("file.separator")))).append("web").toString();
		genFlag = true;
		packageName = "";
		showListType = new HashMap();
		appPath = ApplicationPath.getAppliactionPath();
		setDestRootDir(destRootDir);
		initCfgParameter();
		createPluginParameter();
	}

	public GenerateParameter(String tableName, List relationList, String destRootDir)
	{
		javaCodePath = (new StringBuilder(String.valueOf(System.getProperty("file.separator")))).append("java").toString();
		webCodePath = (new StringBuilder(String.valueOf(System.getProperty("file.separator")))).append("web").toString();
		genFlag = true;
		packageName = "";
		showListType = new HashMap();
		appPath = ApplicationPath.getAppliactionPath();
		setTableName(tableName);
		setRelationshipList(relationList);
		setDestRootDir(destRootDir);
		initCfgParameter();
		createCfgService();
		createPluginParameter();
	}

	public String getTableName()
	{
		return tableName;
	}

	public void setTableName(String tableName)
	{
		this.tableName = tableName;
		className = getClassName(tableName);
		objectName = getObjectName(tableName);
	}

	public String getClassName()
	{
		return className;
	}

	public String getObjectName()
	{
		return objectName;
	}

	public String getActionPath()
	{
		return actionPath;
	}

	public String getDomainPath()
	{
		return domainPath;
	}

	public String getServicePath()
	{
		return servicePath;
	}

	public String getWebPath()
	{
		return webPath;
	}

	public String getAcitionPackageName()
	{
		return acitionPackageName;
	}

	public String getDomainPackageName()
	{
		return domainPackageName;
	}

	public String getServicePackageName()
	{
		return servicePackageName;
	}

	public String getServiceImplPackageName()
	{
		return serviceImplPackageName;
	}

	public String getBussissKey()
	{
		return bussissKey;
	}

	public List getRelationshipList()
	{
		return relationshipList;
	}

	public void setRelationshipList(List relationList)
	{
		relationshipList = switchToRelationObject(relationList);
	}

	public boolean getGenFlag()
	{
		return getGenFlag();
	}

	public void setGenFlag(boolean genAll)
	{
		genFlag = genAll;
	}

	public String getActionCfgFilePathName()
	{
		return actionCfgFilePathName;
	}

	public String getServiceCfgFilePathName()
	{
		return serviceCfgFilePathName;
	}

	public String getHibernateCfgFilePathName()
	{
		return hibernateCfgFilePathName;
	}

	public String getAppPath()
	{
		return appPath;
	}

	public String getDestRootDir()
	{
		return destRootDir;
	}

	public void setDestRootDir(String dir)
	{
		destRootDir = dir;
	}

	public void setTableNameKeyColumn(String tableNameKeyColumn)
	{
		this.tableNameKeyColumn = tableNameKeyColumn;
	}

	public String getTableNameKeyColumn()
	{
		return tableNameKeyColumn;
	}

	public IConfigService getConfigureSerivce()
	{
		return cfgService;
	}

	public Map getPlugins()
	{
		return plugins;
	}

	public String getPackage()
	{
		return packageName;
	}

	public String getFunctionName()
	{
		return functionName;
	}

	public Map getShowListType()
	{
		return showListType;
	}

	public void setShowListType(Map showListType)
	{
		this.showListType = showListType;
	}

	private List switchToRelationObject(List relationList)
	{
		List result = null;
		if (relationList != null)
		{
			result = new ArrayList();
			RelationshipObject relation;
			for (Iterator iter = relationList.iterator(); iter.hasNext(); result.add(relation))
			{
				RelModel rel = (RelModel)iter.next();
				relation = new RelationshipObject();
				relation.setTableHostClassName(getClassName(rel.getTable_host()));
				relation.setTableHostObjectName(getObjectName(rel.getTable_host()));
				relation.setTablRelatedClassName(getClassName(rel.getTable_related()));
				relation.setTablRelatedObjectName(getObjectName(rel.getTable_related()));
				relation.setTableHostName(rel.getTable_host());
				relation.setTablRelatedName(rel.getTable_related());
				relation.setColumnHostClassName(getColumnClassName(rel.getColumn_host()));
				relation.setColumnHostObjectName(getColumnObjectName(rel.getColumn_host()));
				relation.setColumnRelatedClassName(getColumnClassName(rel.getColumn_related()));
				relation.setColumnRelatedObjectName(getColumnObjectName(rel.getColumn_related()));
				relation.setType(rel.getType());
				relation.setInverse(rel.getInverse());
				relation.setShowListType(rel.getListType());
				if (rel.getMid_table() != null)
				{
					relation.setMidTableClassName(getClassName(rel.getMid_table()));
					relation.setMidTableObjectName(getObjectName(rel.getMid_table()));
					relation.setMidTableName(rel.getMid_table());
				}
			}

		}
		return result;
	}

	private String getColumnClassName(String columnName)
	{
		return Util.capitalise(DbNameConverter.getInstance().columnNameToVariableName(columnName));
	}

	private String getColumnObjectName(String columnName)
	{
		return Util.decapitalise(DbNameConverter.getInstance().columnNameToVariableName(columnName));
	}

	private void createPluginParameter()
	{
		plugins = new HashMap();
		Element pluginsElement = root.element("plugins");
		String pluginName;
		Map props;
		for (Iterator iter = pluginsElement.elementIterator(); iter.hasNext(); plugins.put(pluginName, props))
		{
			Element pluginElement = (Element)iter.next();
			pluginName = pluginElement.attributeValue("name");
			Element propsElement = pluginElement.element("props");
			props = null;
			if (propsElement != null)
			{
				Iterator iter1 = propsElement.elementIterator();
				props = new HashMap();
				String key;
				String value;
				for (; iter1.hasNext(); props.put(key, value))
				{
					Element prop = (Element)iter1.next();
					key = prop.attributeValue("key");
					value = prop.elementText("prop");
				}

			}
		}

	}

	private void initCfgParameter()
	{
		String filename = (new StringBuilder(String.valueOf(appPath))).append(File.separator).append("generate.xml").toString();
		SAXReader reader = new SAXReader();
		try
		{
			Document doc = reader.read(new File(filename));
			root = doc.getRootElement();
			packageName = root.elementText("packageName");
			webPath = root.elementText("webPath");
			functionName = root.elementText("displayName");
		}
		catch (DocumentException e)
		{
			e.printStackTrace();
		}
		String tempString = packageName.replace(".", File.separator);
		actionPath = (new StringBuilder(String.valueOf(tempString))).append(File.separator).append(webworkKey).append(File.separator).append(actionKey).toString();
		domainPath = (new StringBuilder(String.valueOf(tempString))).append(File.separator).append(domainKey).toString();
		servicePath = (new StringBuilder(String.valueOf(tempString))).append(File.separator).append(serviceKey).toString();
		servicePackageName = (new StringBuilder(String.valueOf(packageName))).append(".").append(serviceKey).toString();
		serviceImplPackageName = (new StringBuilder(String.valueOf(servicePackageName))).append(".impl").toString();
		acitionPackageName = (new StringBuilder(String.valueOf(packageName))).append(".").append(webworkKey).append(".").append(actionKey).toString();
		domainPackageName = (new StringBuilder(String.valueOf(packageName))).append(".").append(domainKey).toString();
		bussissKey = packageName.substring(packageName.lastIndexOf(".") + 1);
	}

	private void createCfgService()
	{
		Element beans = root.element("beans");
		for (Iterator iter = beans.elementIterator(); iter.hasNext();)
		{
			Element beanElement = (Element)iter.next();
			String beanId = beanElement.attributeValue("id");
			if (beanId.equalsIgnoreCase("configService"))
			{
				String beanClass = beanElement.attributeValue("class");
				serviceCfgFilePathName = (new StringBuilder(String.valueOf(appPath))).append(File.separator).append(beanElement.elementText("serviceCfgFilePathName")).toString();
				actionCfgFilePathName = (new StringBuilder(String.valueOf(appPath))).append(File.separator).append(beanElement.elementText("actionCfgFilePathName")).toString();
				hibernateCfgFilePathName = (new StringBuilder(String.valueOf(appPath))).append(File.separator).append(beanElement.elementText("hibernateCfgFilePathName")).toString();
				try
				{
					cfgService = (IConfigService)Class.forName(beanClass).newInstance();
				}
				catch (InstantiationException e1)
				{
					e1.printStackTrace();
				}
				catch (IllegalAccessException e1)
				{
					e1.printStackTrace();
				}
				catch (ClassNotFoundException e1)
				{
					e1.printStackTrace();
				}
			}
		}

	}

	private String getClassName(String tableName)
	{
		return Util.capitalise(DbNameConverter.getInstance().tableNameToVariableName(tableName));
	}

	private String getObjectName(String tableName)
	{
		return Util.decapitalise(DbNameConverter.getInstance().tableNameToVariableName(tableName));
	}

}
