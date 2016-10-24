// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   FormTag.java

package com.opensymphony.webwork.views.jsp.ui;

import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.webwork.views.jsp.TagUtils;
import com.opensymphony.webwork.views.util.JavaScriptValidationHolder;
import com.opensymphony.webwork.views.util.UrlHelper;
import com.opensymphony.xwork.ObjectFactory;
import com.opensymphony.xwork.config.Configuration;
import com.opensymphony.xwork.config.ConfigurationManager;
import com.opensymphony.xwork.config.RuntimeConfiguration;
import com.opensymphony.xwork.config.entities.ActionConfig;
import com.opensymphony.xwork.util.OgnlValueStack;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

// Referenced classes of package com.opensymphony.webwork.views.jsp.ui:
//			AbstractClosingUITag

public class FormTag extends AbstractClosingUITag
{

	public static final String OPEN_TEMPLATE = "form";
	public static final String TEMPLATE = "form-close";
	Class actionClass;
	List fieldParameters;
	List fieldValidators;
	String actionName;
	JavaScriptValidationHolder javaScriptValidationHolder;
	String actionAttr;
	String targetAttr;
	String enctypeAttr;
	String methodAttr;
	String namespaceAttr;
	String validateAttr;
	String checksubmitAttr;
	String disableSubmitAttr;

	public FormTag()
	{
	}

	public void setAction(String action)
	{
		actionAttr = action;
	}

	public void setTarget(String target)
	{
		targetAttr = target;
	}

	public Class getActionClass()
	{
		return actionClass;
	}

	public String getActionName()
	{
		return actionName;
	}

	public String getDefaultOpenTemplate()
	{
		return "form";
	}

	public void setEnctype(String enctype)
	{
		enctypeAttr = enctype;
	}

	public void setMethod(String method)
	{
		methodAttr = method;
	}

	public void setNamespace(String namespace)
	{
		namespaceAttr = namespace;
	}

	public void setValidate(String validate)
	{
		validateAttr = validate;
	}

	public void setCheckSubmit(String checkSubmit)
	{
		checksubmitAttr = checkSubmit;
	}

	public void setDisableSubmit(String disableSubmit)
	{
		disableSubmitAttr = disableSubmit;
	}

	public void evaluateExtraParams(OgnlValueStack stack)
	{
		super.evaluateExtraParams(stack);
		if (actionAttr != null)
		{
			HttpServletResponse response;
			HttpServletRequest request;
			if (pageContext != null)
			{
				response = (HttpServletResponse)pageContext.getResponse();
				request = (HttpServletRequest)pageContext.getRequest();
			} else
			{
				request = ServletActionContext.getRequest();
				response = ServletActionContext.getResponse();
			}
			String action = findString(actionAttr);
			String namespace;
			if (namespaceAttr == null)
				namespace = TagUtils.buildNamespace(getStack(), (HttpServletRequest)pageContext.getRequest());
			else
				namespace = findString(namespaceAttr);
			if (namespace == null)
				namespace = "";
			ActionConfig actionConfig = ConfigurationManager.getConfiguration().getRuntimeConfiguration().getActionConfig(namespace, action);
			if (actionConfig != null)
			{
				try
				{
					actionClass = ObjectFactory.getObjectFactory().getClassInstance(actionConfig.getClassName());
				}
				catch (ClassNotFoundException classnotfoundexception) { }
				actionName = action;
				String result = UrlHelper.buildUrl((new StringBuilder(String.valueOf(namespace))).append("/").append(action).append(".").append(com.opensymphony.webwork.config.Configuration.get("webwork.action.extension")).toString(), request, response, null);
				addParameter("action", result);
				addParameter("namespace", namespace);
				if (nameAttr == null)
					addParameter("name", action);
				if (id == null)
					addParameter("id", action);
			} else
			if (action != null)
			{
				String result = UrlHelper.buildUrl(action, request, response, null);
				addParameter("action", result);
				int slash = result.lastIndexOf('/');
				if (slash != -1)
					addParameter("namespace", result.substring(0, slash));
				else
					addParameter("namespace", "");
				if (id == null)
				{
					slash = result.lastIndexOf('/');
					int dot = result.indexOf('.', slash);
					if (dot != -1)
						id = result.substring(slash + 1, dot);
					else
						id = result.substring(slash + 1);
					addParameter("id", id);
				}
			}
			if (actionName != null && actionClass != null && javaScriptValidationHolder == null)
				javaScriptValidationHolder = new JavaScriptValidationHolder(actionName, actionClass, getStack());
		}
		if (targetAttr != null)
			addParameter("target", findString(targetAttr));
		if (enctypeAttr != null)
			addParameter("enctype", findString(enctypeAttr));
		if (methodAttr != null)
			addParameter("method", findString(methodAttr));
		if (validateAttr != null)
			addParameter("validate", findValue(validateAttr, java/lang/Boolean));
		if (checksubmitAttr != null)
			addParameter("checkSubmit", findValue(checksubmitAttr, java/lang/Boolean));
		if (disableSubmitAttr != null)
			addParameter("disableSubmit", findValue(disableSubmitAttr));
		if (javaScriptValidationHolder != null && javaScriptValidationHolder.hasValidators())
			addParameter("javascriptValidation", javaScriptValidationHolder.toJavaScript());
		else
			addParameter("javascriptValidation", "// cannot find any applicable validators");
	}

	protected String getDefaultTemplate()
	{
		return "form-close";
	}

	protected boolean evaluateNameValue()
	{
		return false;
	}

	protected void reset()
	{
		super.reset();
		javaScriptValidationHolder = null;
		if (getActionName() != null && getActionClass() != null)
			javaScriptValidationHolder = new JavaScriptValidationHolder(getActionName(), getActionClass(), getStack());
	}

	JavaScriptValidationHolder getJavaScriptValidationHolder()
	{
		return javaScriptValidationHolder;
	}
}
