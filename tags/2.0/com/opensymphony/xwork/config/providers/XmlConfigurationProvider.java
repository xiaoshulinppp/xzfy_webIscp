// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   XmlConfigurationProvider.java

package com.opensymphony.xwork.config.providers;

import com.opensymphony.util.*;
import com.opensymphony.xwork.ActionSupport;
import com.opensymphony.xwork.ObjectFactory;
import com.opensymphony.xwork.config.*;
import com.opensymphony.xwork.config.entities.*;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.*;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.w3c.dom.*;
import org.xml.sax.*;

// Referenced classes of package com.opensymphony.xwork.config.providers:
//			XmlHelper, InterceptorBuilder

public class XmlConfigurationProvider
	implements ConfigurationProvider
{

	private static final Log LOG = LogFactory.getLog(com/opensymphony/xwork/config/providers/XmlConfigurationProvider);
	private Configuration configuration;
	private Set includedFileNames;
	private String configFileName;

	public XmlConfigurationProvider()
	{
		includedFileNames = new HashSet();
		configFileName = "xwork.xml";
	}

	public XmlConfigurationProvider(String filename)
	{
		includedFileNames = new HashSet();
		configFileName = "xwork.xml";
		configFileName = filename;
	}

	public void destroy()
	{
	}

	public boolean equals(Object o)
	{
		if (this == o)
			return true;
		if (!(o instanceof XmlConfigurationProvider))
		{
			return false;
		} else
		{
			XmlConfigurationProvider xmlConfigurationProvider = (XmlConfigurationProvider)o;
			return configFileName != null ? configFileName.equals(xmlConfigurationProvider.configFileName) : xmlConfigurationProvider.configFileName == null;
		}
	}

	public int hashCode()
	{
		return configFileName != null ? configFileName.hashCode() : 0;
	}

	public void init(Configuration configuration)
	{
		this.configuration = configuration;
		includedFileNames.clear();
		try
		{
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			dbf.setValidating(true);
			dbf.setNamespaceAware(true);
			DocumentBuilder db = dbf.newDocumentBuilder();
			db.setEntityResolver(new EntityResolver() {

				final XmlConfigurationProvider this$0;

				public InputSource resolveEntity(String publicId, String systemId)
					throws SAXException, IOException
				{
					if ("-//OpenSymphony Group//XWork 1.0//EN".equals(publicId))
						return new InputSource(ClassLoaderUtil.getResourceAsStream("xwork-1.0.dtd", com/opensymphony/xwork/config/providers/XmlConfigurationProvider));
					else
						return null;
				}

			
			{
				this$0 = XmlConfigurationProvider.this;
				super();
			}
			});
			db.setErrorHandler(new ErrorHandler() {

				final XmlConfigurationProvider this$0;

				public void warning(SAXParseException saxparseexception1)
					throws SAXException
				{
				}

				public void error(SAXParseException exception)
					throws SAXException
				{
					XmlConfigurationProvider.LOG.error((new StringBuilder(String.valueOf(exception.getMessage()))).append(" at (").append(exception.getLineNumber()).append(":").append(exception.getColumnNumber()).append(")").toString());
					throw exception;
				}

				public void fatalError(SAXParseException exception)
					throws SAXException
				{
					XmlConfigurationProvider.LOG.fatal((new StringBuilder(String.valueOf(exception.getMessage()))).append(" at (").append(exception.getLineNumber()).append(":").append(exception.getColumnNumber()).append(")").toString());
					throw exception;
				}

			
			{
				this$0 = XmlConfigurationProvider.this;
				super();
			}
			});
			loadConfigurationFile(configFileName, db);
		}
		catch (Exception e)
		{
			LOG.fatal("Could not load XWork configuration file, failing", e);
			throw new ConfigurationException((new StringBuilder("Error loading configuration file ")).append(configFileName).toString(), e);
		}
	}

	public boolean needsReload()
	{
		boolean needsReload = FileManager.fileNeedsReloading(configFileName);
		String fileName;
		for (Iterator fileNameIterator = includedFileNames.iterator(); !needsReload && fileNameIterator.hasNext(); needsReload = FileManager.fileNeedsReloading(fileName))
			fileName = (String)fileNameIterator.next();

		return needsReload;
	}

	protected InputStream getInputStream(String fileName)
	{
		return FileManager.loadFile(fileName, getClass());
	}

	protected void addAction(Element actionElement, PackageConfig packageContext)
		throws ConfigurationException
	{
		String name = actionElement.getAttribute("name");
		String className = actionElement.getAttribute("class");
		String methodName = actionElement.getAttribute("method");
		methodName = methodName.trim().length() > 0 ? methodName.trim() : null;
		if (!TextUtils.stringSet(className))
			className = com/opensymphony/xwork/ActionSupport.getName();
		try
		{
			if (ObjectFactory.getObjectFactory().isNoArgConstructorRequired())
			{
				ActionConfig actionConfig = new ActionConfig(null, className, null, null, null);
				ObjectFactory.getObjectFactory().buildAction(actionConfig);
			} else
			{
				ObjectFactory.getObjectFactory().getClassInstance(className);
			}
		}
		catch (Exception e)
		{
			LOG.error((new StringBuilder("Action class [")).append(className).append("] not found, skipping action [").append(name).append("]").toString(), e);
			return;
		}
		HashMap actionParams = XmlHelper.getParams(actionElement);
		Map results;
		try
		{
			results = buildResults(actionElement, packageContext);
		}
		catch (ConfigurationException e)
		{
			throw new ConfigurationException((new StringBuilder("Error building results for action ")).append(name).append(" in namespace ").append(packageContext.getNamespace()).toString(), e);
		}
		List interceptorList = buildInterceptorList(actionElement, packageContext);
		List externalrefs = buildExternalRefs(actionElement, packageContext);
		ActionConfig actionConfig = new ActionConfig(methodName, className, actionParams, results, interceptorList, externalrefs, packageContext.getName());
		packageContext.addActionConfig(name, actionConfig);
		if (LOG.isDebugEnabled())
			LOG.debug((new StringBuilder("Loaded ")).append(TextUtils.stringSet(packageContext.getNamespace()) ? (new StringBuilder(String.valueOf(packageContext.getNamespace()))).append("/").toString() : "").append(name).append(" in '").append(packageContext.getName()).append("' package:").append(actionConfig).toString());
	}

	protected void addPackage(Element packageElement)
		throws ConfigurationException
	{
		PackageConfig newPackage = buildPackageContext(packageElement);
		if (LOG.isDebugEnabled())
			LOG.debug((new StringBuilder("Loaded ")).append(newPackage).toString());
		addResultTypes(newPackage, packageElement);
		loadInterceptors(newPackage, packageElement);
		loadDefaultInterceptorRef(newPackage, packageElement);
		loadGlobalResults(newPackage, packageElement);
		NodeList actionList = packageElement.getElementsByTagName("action");
		for (int i = 0; i < actionList.getLength(); i++)
		{
			Element actionElement = (Element)actionList.item(i);
			addAction(actionElement, newPackage);
		}

		configuration.addPackageConfig(newPackage.getName(), newPackage);
	}

	protected void addResultTypes(PackageConfig packageContext, Element element)
	{
		NodeList resultTypeList = element.getElementsByTagName("result-type");
		for (int i = 0; i < resultTypeList.getLength(); i++)
		{
			Element resultTypeElement = (Element)resultTypeList.item(i);
			String name = resultTypeElement.getAttribute("name");
			String className = resultTypeElement.getAttribute("class");
			String def = resultTypeElement.getAttribute("default");
			try
			{
				Class clazz = ClassLoaderUtil.loadClass(className, com/opensymphony/xwork/config/providers/XmlConfigurationProvider);
				ResultTypeConfig resultType = new ResultTypeConfig(name, clazz);
				packageContext.addResultTypeConfig(resultType);
				if ("true".equals(def))
					packageContext.setDefaultResultType(name);
			}
			catch (ClassNotFoundException e)
			{
				LOG.error((new StringBuilder("Result class [")).append(className).append("] doesn't exist (ClassNotFoundException), ignoring").toString());
			}
			catch (NoClassDefFoundError e)
			{
				LOG.error((new StringBuilder("Result class [")).append(className).append("] doesn't exist (NoClassDefFoundError), ignoring").toString());
			}
		}

	}

	protected List buildExternalRefs(Element element, PackageConfig context)
		throws ConfigurationException
	{
		List refs = new ArrayList();
		NodeList externalRefList = element.getElementsByTagName("external-ref");
		String refName = null;
		String refValue = null;
		String requiredTemp = null;
		for (int i = 0; i < externalRefList.getLength(); i++)
		{
			Element refElement = (Element)externalRefList.item(i);
			if (refElement.getParentNode().equals(element))
			{
				refName = refElement.getAttribute("name");
				if (refElement.getChildNodes().getLength() > 0)
					refValue = refElement.getChildNodes().item(0).getNodeValue();
				requiredTemp = refElement.getAttribute("required");
				boolean required;
				if (requiredTemp == null || "".equals(requiredTemp))
					required = true;
				else
					required = Boolean.valueOf(requiredTemp).booleanValue();
				refs.add(new ExternalReference(refName, refValue, required));
			}
		}

		return refs;
	}

	protected List buildInterceptorList(Element element, PackageConfig context)
		throws ConfigurationException
	{
		List interceptorList = new ArrayList();
		NodeList interceptorRefList = element.getElementsByTagName("interceptor-ref");
		for (int i = 0; i < interceptorRefList.getLength(); i++)
		{
			Element interceptorRefElement = (Element)interceptorRefList.item(i);
			if (interceptorRefElement.getParentNode().equals(element))
			{
				List interceptors = lookupInterceptorReference(context, interceptorRefElement);
				interceptorList.addAll(interceptors);
			}
		}

		return interceptorList;
	}

	protected PackageConfig buildPackageContext(Element packageElement)
	{
		String parent = packageElement.getAttribute("extends");
		String abstractVal = packageElement.getAttribute("abstract");
		boolean isAbstract = Boolean.valueOf(abstractVal).booleanValue();
		String name = TextUtils.noNull(packageElement.getAttribute("name"));
		String namespace = TextUtils.noNull(packageElement.getAttribute("namespace"));
		ExternalReferenceResolver erResolver = null;
		String externalReferenceResolver = TextUtils.noNull(packageElement.getAttribute("externalReferenceResolver"));
		if (!"".equals(externalReferenceResolver))
			try
			{
				erResolver = (ExternalReferenceResolver)ObjectFactory.getObjectFactory().buildBean(externalReferenceResolver);
			}
			catch (ClassNotFoundException e)
			{
				String msg = (new StringBuilder("Could not find External Reference Resolver: ")).append(externalReferenceResolver).append(". ").append(e.getMessage()).toString();
				LOG.error(msg);
				throw new ConfigurationException(msg, e);
			}
			catch (Exception e)
			{
				String msg = (new StringBuilder("Could not create External Reference Resolver: ")).append(externalReferenceResolver).append(". ").append(e.getMessage()).toString();
				LOG.error(msg);
				throw new ConfigurationException(msg, e);
			}
		if (!TextUtils.stringSet(TextUtils.noNull(parent)))
			return new PackageConfig(name, namespace, isAbstract, erResolver);
		List parents = ConfigurationUtil.buildParentsFromString(configuration, parent);
		if (parents.size() <= 0)
		{
			LOG.error((new StringBuilder("Unable to find parent packages ")).append(parent).toString());
			return new PackageConfig(name, namespace, isAbstract, erResolver);
		} else
		{
			return new PackageConfig(name, namespace, isAbstract, erResolver, parents);
		}
	}

	protected Map buildResults(Element element, PackageConfig packageContext)
	{
		NodeList resultEls = element.getElementsByTagName("result");
		Map results = new HashMap();
		for (int i = 0; i < resultEls.getLength(); i++)
		{
			Element resultElement = (Element)resultEls.item(i);
			if (resultElement.getParentNode().equals(element))
			{
				String resultName = resultElement.getAttribute("name");
				String resultType = resultElement.getAttribute("type");
				if (!TextUtils.stringSet(resultName))
					resultName = "success";
				if (!TextUtils.stringSet(resultType))
					resultType = packageContext.getFullDefaultResultType();
				ResultTypeConfig config = (ResultTypeConfig)packageContext.getAllResultTypeConfigs().get(resultType);
				if (config == null)
					throw new ConfigurationException((new StringBuilder("There is no result type defined for type '")).append(resultType).append("' mapped with name '").append(resultName).append("'").toString());
				Class resultClass = config.getClazz();
				if (resultClass == null)
					LOG.error((new StringBuilder("Result type '")).append(resultType).append("' is invalid. Modify your xwork.xml file.").toString());
				HashMap params = XmlHelper.getParams(resultElement);
				if (params.size() == 0 && resultElement.getChildNodes().getLength() == 1 && resultElement.getChildNodes().item(0).getNodeType() == 3)
				{
					params = new HashMap();
					try
					{
						String paramName = (String)resultClass.getField("DEFAULT_PARAM").get(null);
						String paramValue = resultElement.getChildNodes().item(0).getNodeValue();
						if (paramValue != null)
							paramValue = paramValue.trim();
						params.put(paramName, paramValue);
					}
					catch (Throwable throwable) { }
				}
				ResultConfig resultConfig = new ResultConfig(resultName, resultClass, params);
				results.put(resultConfig.getName(), resultConfig);
			}
		}

		return results;
	}

	protected void loadDefaultInterceptorRef(PackageConfig packageContext, Element element)
	{
		NodeList resultTypeList = element.getElementsByTagName("default-interceptor-ref");
		if (resultTypeList.getLength() > 0)
		{
			Element defaultRefElement = (Element)resultTypeList.item(0);
			packageContext.setDefaultInterceptorRef(defaultRefElement.getAttribute("name"));
		}
	}

	protected void loadGlobalResults(PackageConfig packageContext, Element packageElement)
	{
		NodeList globalResultList = packageElement.getElementsByTagName("global-results");
		if (globalResultList.getLength() > 0)
		{
			Element globalResultElement = (Element)globalResultList.item(0);
			Map results = buildResults(globalResultElement, packageContext);
			packageContext.addGlobalResultConfigs(results);
		}
	}

	protected InterceptorStackConfig loadInterceptorStack(Element element, PackageConfig context)
		throws ConfigurationException
	{
		String name = element.getAttribute("name");
		InterceptorStackConfig config = new InterceptorStackConfig(name);
		NodeList interceptorRefList = element.getElementsByTagName("interceptor-ref");
		for (int j = 0; j < interceptorRefList.getLength(); j++)
		{
			Element interceptorRefElement = (Element)interceptorRefList.item(j);
			List interceptors = lookupInterceptorReference(context, interceptorRefElement);
			config.addInterceptors(interceptors);
		}

		return config;
	}

	protected void loadInterceptorStacks(Element element, PackageConfig context)
		throws ConfigurationException
	{
		NodeList interceptorStackList = element.getElementsByTagName("interceptor-stack");
		for (int i = 0; i < interceptorStackList.getLength(); i++)
		{
			Element interceptorStackElement = (Element)interceptorStackList.item(i);
			InterceptorStackConfig config = loadInterceptorStack(interceptorStackElement, context);
			context.addInterceptorStackConfig(config);
		}

	}

	protected void loadInterceptors(PackageConfig context, Element element)
		throws ConfigurationException
	{
		NodeList interceptorList = element.getElementsByTagName("interceptor");
		for (int i = 0; i < interceptorList.getLength(); i++)
		{
			Element interceptorElement = (Element)interceptorList.item(i);
			String name = interceptorElement.getAttribute("name");
			String className = interceptorElement.getAttribute("class");
			Map params = XmlHelper.getParams(interceptorElement);
			InterceptorConfig config = null;
			try
			{
				config = new InterceptorConfig(name, className, params);
				ObjectFactory.getObjectFactory().buildInterceptor(config, new HashMap());
				context.addInterceptorConfig(config);
			}
			catch (ConfigurationException e)
			{
				String s = (new StringBuilder("Unable to load class ")).append(className).append(" for interceptor name ").append(name).append(". This interceptor will not be available.").toString();
				LOG.error(s);
				throw e;
			}
			context.addInterceptorConfig(config);
		}

		loadInterceptorStacks(element, context);
	}

	private void loadConfigurationFile(String fileName, DocumentBuilder db)
	{
		Document doc;
		InputStream is;
		if (includedFileNames.contains(fileName))
			break MISSING_BLOCK_LABEL_384;
		if (LOG.isDebugEnabled())
			LOG.debug((new StringBuilder("Loading xwork configuration from: ")).append(fileName).toString());
		includedFileNames.add(fileName);
		doc = null;
		is = null;
		try
		{
			is = getInputStream(fileName);
			if (is == null)
				throw new Exception((new StringBuilder("Could not open file ")).append(fileName).toString());
			doc = db.parse(is);
		}
		catch (Exception e)
		{
			String s = (new StringBuilder("Caught exception while loading file ")).append(fileName).toString();
			LOG.error(s, e);
			throw new ConfigurationException(s, e);
		}
		break MISSING_BLOCK_LABEL_190;
		Exception exception;
		exception;
		if (is != null)
			try
			{
				is.close();
			}
			catch (IOException e)
			{
				LOG.error("Unable to close input stream", e);
			}
		throw exception;
		if (is != null)
			try
			{
				is.close();
			}
			catch (IOException e)
			{
				LOG.error("Unable to close input stream", e);
			}
		Element rootElement = doc.getDocumentElement();
		NodeList children = rootElement.getChildNodes();
		int childSize = children.getLength();
		for (int i = 0; i < childSize; i++)
		{
			Node childNode = children.item(i);
			if (childNode instanceof Element)
			{
				Element child = (Element)childNode;
				String nodeName = child.getNodeName();
				if (nodeName.equals("package"))
					addPackage(child);
				else
				if (nodeName.equals("include"))
				{
					String includeFileName = child.getAttribute("file");
					loadConfigurationFile(includeFileName, db);
				}
			}
		}

		if (LOG.isDebugEnabled())
			LOG.debug((new StringBuilder("Loaded xwork configuration from: ")).append(fileName).toString());
	}

	private List lookupInterceptorReference(PackageConfig context, Element interceptorRefElement)
		throws ConfigurationException
	{
		String refName = interceptorRefElement.getAttribute("name");
		Map refParams = XmlHelper.getParams(interceptorRefElement);
		return InterceptorBuilder.constructInterceptorReference(context, refName, refParams);
	}


}
