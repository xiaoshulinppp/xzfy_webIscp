// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   AbstractUITag.java

package com.opensymphony.webwork.views.jsp.ui;

import com.opensymphony.webwork.config.Configuration;
import com.opensymphony.webwork.views.jsp.ParameterizedTagSupport;
import com.opensymphony.webwork.views.jsp.ui.template.TemplateEngine;
import com.opensymphony.webwork.views.jsp.ui.template.TemplateEngineManager;
import com.opensymphony.webwork.views.jsp.ui.template.TemplateRenderingContext;
import com.opensymphony.webwork.views.util.JavaScriptValidationHolder;
import com.opensymphony.xwork.config.ConfigurationException;
import com.opensymphony.xwork.util.OgnlValueStack;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

// Referenced classes of package com.opensymphony.webwork.views.jsp.ui:
//			FormTag

public abstract class AbstractUITag extends ParameterizedTagSupport
{

	private static final Log LOG = LogFactory.getLog(com/opensymphony/webwork/views/jsp/ui/AbstractUITag);
	protected String cssClassAttr;
	protected String cssStyleAttr;
	protected String disabledAttr;
	protected String labelAttr;
	protected String labelPositionAttr;
	protected String nameAttr;
	protected String requiredAttr;
	protected String tabindexAttr;
	protected String templateAttr;
	protected String templateDir;
	protected String theme;
	protected String themeAttr;
	protected String valueAttr;
	protected String onclickAttr;
	protected String ondblclickAttr;
	protected String onmousedownAttr;
	protected String onmouseupAttr;
	protected String onmouseoverAttr;
	protected String onmousemoveAttr;
	protected String onmouseoutAttr;
	protected String onfocusAttr;
	protected String onblurAttr;
	protected String onkeypressAttr;
	protected String onkeydownAttr;
	protected String onkeyupAttr;
	protected String onselectAttr;
	protected String onchangeAttr;

	public AbstractUITag()
	{
	}

	public void setCssClass(String aCssClass)
	{
		cssClassAttr = aCssClass;
	}

	public void setCssStyle(String aCssStyle)
	{
		cssStyleAttr = aCssStyle;
	}

	public void setDisabled(String disabled)
	{
		disabledAttr = disabled;
	}

	public void setLabel(String aLabel)
	{
		labelAttr = aLabel;
	}

	public void setLabelposition(String aLabelPosition)
	{
		labelPositionAttr = aLabelPosition;
	}

	public void setName(String aName)
	{
		nameAttr = aName;
	}

	public void setRequired(String required)
	{
		requiredAttr = required;
	}

	public void setTabindex(String tabindex)
	{
		tabindexAttr = tabindex;
	}

	public void setTemplate(String aName)
	{
		templateAttr = aName;
	}

	public String getTemplateDir()
	{
		if (templateDir == null || templateDir == "")
			templateDir = setupPath((String)pageContext.findAttribute("templateDir"), true);
		if (templateDir == null || templateDir == "")
			templateDir = setupPath(Configuration.getString("webwork.ui.templateDir"), true);
		if (templateDir == null || templateDir == "")
			templateDir = "/template/";
		return templateDir;
	}

	public void setTheme(String aName)
	{
		themeAttr = aName;
	}

	public String getTheme()
	{
		if (themeAttr != null)
			theme = setupPath(findString(themeAttr), false);
		if (theme == null || theme == "")
			theme = setupPath((String)pageContext.findAttribute("theme"), false);
		if (theme == null || theme == "")
			theme = setupPath(Configuration.getString("webwork.ui.theme"), false);
		return theme;
	}

	public void setValue(String aValue)
	{
		valueAttr = aValue;
	}

	public void setOnclick(String onclick)
	{
		onclickAttr = onclick;
	}

	public void setOndblclick(String ondblclick)
	{
		ondblclickAttr = ondblclick;
	}

	public void setOnmousedown(String onmousedown)
	{
		onmousedownAttr = onmousedown;
	}

	public void setOnmouseup(String onmouseup)
	{
		onmouseupAttr = onmouseup;
	}

	public void setOnmouseover(String onmouseover)
	{
		onmouseoverAttr = onmouseover;
	}

	public void setOnmousemove(String onmousemove)
	{
		onmousemoveAttr = onmousemove;
	}

	public void setOnmouseout(String onmouseout)
	{
		onmouseoutAttr = onmouseout;
	}

	public void setOnfocus(String onfocus)
	{
		onfocusAttr = onfocus;
	}

	public void setOnblur(String onblur)
	{
		onblurAttr = onblur;
	}

	public void setOnkeypress(String onkeypress)
	{
		onkeypressAttr = onkeypress;
	}

	public void setOnkeydown(String onkeydown)
	{
		onkeydownAttr = onkeydown;
	}

	public void setOnkeyup(String onkeyup)
	{
		onkeyupAttr = onkeyup;
	}

	public void setOnselect(String onselect)
	{
		onselectAttr = onselect;
	}

	public void setOnchange(String onchange)
	{
		onchangeAttr = onchange;
	}

	public int doEndTag()
		throws JspException
	{
		OgnlValueStack stack = getStack();
		evaluateParams(stack);
		boolean isInVisible = processTag();
		if (!isInVisible)
			break MISSING_BLOCK_LABEL_26;
_L1:
		reset();
		return 6;
		try
		{
			mergeTemplate(getTemplateName());
		}
		catch (Exception e)
		{
			throw new JspException((new StringBuilder("Fatal exception caught in ")).append(getClass().getName()).append(" tag class, doEndTag: ").append(e.getMessage()).toString(), e);
		}
		  goto _L1
		Exception exception;
		exception;
		reset();
		throw exception;
	}

	public int doStartTag()
		throws JspException
	{
		return 1;
	}

	protected boolean processTag()
	{
		boolean isInvisible = false;
		Object name = null;
		if (nameAttr != null)
			name = findString(nameAttr);
		HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();
		Map tagPerm = (Map)req.getAttribute("fieldPerm");
		if (tagPerm != null)
		{
			String opType = (String)tagPerm.get(String.valueOf(name).toLowerCase());
			if (opType != null && opType.equals("0"))
				isInvisible = true;
			if (opType != null && opType.equals("1"))
				addParameter("disabled", Boolean.valueOf("true"));
			if (opType != null && opType.equals("2"))
			{
				addParameter("disabled", Boolean.valueOf("true"));
				Map paramMap = getParameters();
				String nameValueTemp = (String)paramMap.get("nameValue");
				addParameter("nameValue", conveterHideValue(nameValueTemp.length()));
			}
		}
		return isInvisible;
	}

	private String conveterHideValue(int len)
	{
		String result = "";
		for (int i = 0; i < len; i++)
			result = (new StringBuilder(String.valueOf(result))).append("*").toString();

		return result;
	}

	protected abstract String getDefaultTemplate();

	protected String getTemplateName()
	{
		return buildTemplateName(templateAttr, getDefaultTemplate());
	}

	protected Class getValueClassType()
	{
		return java/lang/String;
	}

	protected String buildTemplateName(String myTemplate, String myDefaultTemplate)
	{
		String template = myDefaultTemplate;
		if (myTemplate != null)
		{
			template = findString(myTemplate);
			if (template == null)
			{
				LOG.warn("template attribute evaluated to null; using value as-is for backwards compatibility");
				template = myTemplate;
			}
		}
		return (new StringBuilder(String.valueOf(getTemplateDir()))).append(getTheme()).append(template).toString();
	}

	protected void evaluateExtraParams(OgnlValueStack ognlvaluestack)
	{
	}

	protected boolean evaluateNameValue()
	{
		return true;
	}

	protected void evaluateParams(OgnlValueStack stack)
	{
		Object name = null;
		if (nameAttr != null)
		{
			name = findString(nameAttr);
			addParameter("name", name);
		}
		if (labelAttr != null)
			addParameter("label", findString(labelAttr));
		if (labelPositionAttr != null)
			addParameter("labelposition", findString(labelPositionAttr));
		if (requiredAttr != null)
			addParameter("required", findValue(requiredAttr, java/lang/Boolean));
		if (disabledAttr != null)
			addParameter("disabled", findValue(disabledAttr, java/lang/Boolean));
		if (tabindexAttr != null)
			addParameter("tabindex", findString(tabindexAttr));
		if (onclickAttr != null)
			addParameter("onclick", findString(onclickAttr));
		if (ondblclickAttr != null)
			addParameter("ondblclick", findString(ondblclickAttr));
		if (onmousedownAttr != null)
			addParameter("onmousedown", findString(onmousedownAttr));
		if (onmouseupAttr != null)
			addParameter("onmouseup", findString(onmouseupAttr));
		if (onmouseoverAttr != null)
			addParameter("onmouseover", findString(onmouseoverAttr));
		if (onmousemoveAttr != null)
			addParameter("onmousemove", findString(onmousemoveAttr));
		if (onmouseoutAttr != null)
			addParameter("onmouseout", findString(onmouseoutAttr));
		if (onfocusAttr != null)
			addParameter("onfocus", findString(onfocusAttr));
		if (onblurAttr != null)
			addParameter("onblur", findString(onblurAttr));
		if (onkeypressAttr != null)
			addParameter("onkeypress", findString(onkeypressAttr));
		if (onkeydownAttr != null)
			addParameter("onkeydown", findString(onkeydownAttr));
		if (onkeyupAttr != null)
			addParameter("onkeyup", findString(onkeyupAttr));
		if (onselectAttr != null)
			addParameter("onselect", findString(onselectAttr));
		if (onchangeAttr != null)
			addParameter("onchange", findString(onchangeAttr));
		if (cssClassAttr != null)
			addParameter("cssClass", findString(cssClassAttr));
		if (cssStyleAttr != null)
			addParameter("cssStyle", findString(cssStyleAttr));
		if (evaluateNameValue())
		{
			Class valueClazz = getValueClassType();
			if (valueClazz != null)
			{
				if (valueAttr != null)
					addParameter("nameValue", findValue(valueAttr, valueClazz));
				else
				if (name != null)
				{
					String expr = name.toString();
					if (ALT_SYNTAX)
						expr = (new StringBuilder("%{")).append(expr).append("}").toString();
					addParameter("nameValue", findValue(expr, valueClazz));
				}
			} else
			if (valueAttr != null)
				addParameter("nameValue", findValue(valueAttr));
			else
			if (name != null)
				addParameter("nameValue", findValue(name.toString()));
		}
		FormTag formTag = (FormTag)findAncestorWithClass(this, com/opensymphony/webwork/views/jsp/ui/FormTag);
		if (id != null)
			addParameter("id", id);
		else
		if (formTag != null)
			addParameter("id", (new StringBuilder()).append(formTag.getParameters().get("id")).append("_").append(name).toString());
		if (formTag != null)
		{
			addParameter("form", formTag.getParameters());
			Boolean validate = (Boolean)formTag.getParameters().get("validate");
			if (validate != null && validate.booleanValue() && name != null && formTag.getJavaScriptValidationHolder() != null)
				formTag.getJavaScriptValidationHolder().registerValidateField((String)name, getParameters());
		}
		evaluateExtraParams(stack);
	}

	protected void mergeTemplate(String templateName)
		throws Exception
	{
		TemplateEngine engine = TemplateEngineManager.getTemplateEngine(templateName);
		if (engine == null)
			throw new ConfigurationException((new StringBuilder("Unable to find a TemplateEngine for template ")).append(templateName).toString());
		String finalTemplateName = engine.getFinalTemplateName(templateName);
		if (LOG.isDebugEnabled())
			LOG.debug((new StringBuilder("Got template engine ")).append(engine.getClass().getName()).append(" for template '").append(templateName).append("'").append(templateName.equals(finalTemplateName) ? null : (new StringBuilder(" final template name '")).append(finalTemplateName).append("'").toString()).toString());
		TemplateRenderingContext context = new TemplateRenderingContext(finalTemplateName, pageContext, getStack(), getParameters(), this);
		engine.renderTemplate(context);
	}

	private String setupPath(String path, boolean prefix)
	{
		if (path != null && path != "")
		{
			if (prefix && !path.startsWith("/"))
				path = (new StringBuilder("/")).append(path).toString();
			if (!path.endsWith("/"))
				path = (new StringBuilder(String.valueOf(path))).append("/").toString();
		}
		return path;
	}

}
