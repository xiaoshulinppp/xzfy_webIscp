// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ConfigureServiceImpl.java

package com.taiji.core.generator.configen.service.impl;

import com.taiji.core.generator.GenerateParameter;
import com.taiji.core.generator.configen.service.IConfigService;
import com.taiji.core.generator.formgen.component.RelationshipObject;
import java.util.Iterator;
import java.util.List;

public class ConfigureServiceImpl
	implements IConfigService
{

	public ConfigureServiceImpl()
	{
	}

	public String getActionConfigure(GenerateParameter parameter)
	{
		String className = parameter.getClassName();
		StringBuffer buffer = new StringBuffer();
		String temp = "";
		temp = (new StringBuilder("    <action name=\"create")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\">\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("       <result name=\"success\">/")).append(parameter.getWebPath()).append("/create").append(className).append(".ftl</result>\n").toString();
		buffer.append(temp);
		temp = "    </action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("    <action name=\"doCreate")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"save\">\n").toString();
		buffer.append(temp);
		temp = "    <interceptor-ref name=\"autowireValidation\"/>\n";
		buffer.append(temp);
		temp = (new StringBuilder("       <result name=\"input\">/")).append(parameter.getWebPath()).append("/create").append(className).append(".ftl</result>\n").toString();
		buffer.append(temp);
		temp = "       <result name=\"success\" type=\"chain\">\n";
		buffer.append(temp);
		temp = (new StringBuilder("          <param name=\"actionName\">list")).append(className).append("</param>\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("          <param name=\"namespace\">/")).append(parameter.getBussissKey()).append("</param>\n").toString();
		buffer.append(temp);
		temp = "       </result>\n";
		buffer.append(temp);
		temp = "    </action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("    <action name=\"update")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\">\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("       <result name=\"success\">/")).append(parameter.getWebPath()).append("/update").append(className).append(".ftl</result>\n").toString();
		buffer.append(temp);
		temp = "   </action>";
		buffer.append(temp);
		temp = (new StringBuilder("   <action name=\"doUpdate")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"update\">\n").toString();
		buffer.append(temp);
		temp = "   <interceptor-ref name=\"autowireValidation\"/>\n";
		buffer.append(temp);
		temp = (new StringBuilder("      <result name=\"input\">/")).append(parameter.getWebPath()).append("/update").append(className).append(".ftl</result>\n").toString();
		buffer.append(temp);
		temp = "      <result name=\"success\" type=\"chain\">\n";
		buffer.append(temp);
		temp = (new StringBuilder("         <param name=\"actionName\">list")).append(className).append("</param>\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("         <param name=\"namespace\">/")).append(parameter.getBussissKey()).append("</param>\n").toString();
		buffer.append(temp);
		temp = "      </result>\n";
		buffer.append(temp);
		temp = "    </action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("    <action name=\"delete")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"delete\">\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("       <result name=\"success\" type=\"redirect\">../")).append(parameter.getBussissKey()).append("/list").append(className).append(".action?funcCode=${funcCode}\n").toString();
		buffer.append(temp);
		temp = "       </result>\n";
		buffer.append(temp);
		temp = "    </action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("    <action name=\"list")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".List").append(className).append("Action\">\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("       <result name=\"success\">/")).append(parameter.getWebPath()).append("/list").append(className).append("Module.ftl</result>\n").toString();
		buffer.append(temp);
		temp = "    </action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("   <action name=\"view")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\">\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("      <result name=\"success\">/")).append(parameter.getWebPath()).append("/update").append(className).append(".ftl</result>\n").toString();
		buffer.append(temp);
		temp = "   </action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("   <action name=\"")).append(className).append("QueryTerm\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("QueryTermAction\">\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("      <result name=\"success\">/")).append(parameter.getWebPath()).append("/").append(className).append("QueryModule.ftl</result>\n").toString();
		buffer.append(temp);
		temp = "   </action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("   <action name=\"")).append(className).append("Query\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("QueryAction\">\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("      <result name=\"success\">/")).append(parameter.getWebPath()).append("/list").append(className).append("QueryModule.ftl</result>\n").toString();
		buffer.append(temp);
		temp = "   </action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("   <action name=\"view")).append(className).append("Query\" class=\"").append(parameter.getAcitionPackageName()).append(".View").append(className).append("QueryAction\">\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("      <result name=\"success\">/")).append(parameter.getWebPath()).append("/view").append(className).append("QueryModule.ftl</result>\n").toString();
		buffer.append(temp);
		temp = "   </action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("<action name=\"")).append(className).append("AdvancedQueryTerm\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("QueryTermAction\" method=\"advancedSearch\">\n").toString();
		buffer.append(temp);
		temp = "\t <result name=\"success\">/pages/search/searchQuery.ftl</result>\n";
		buffer.append(temp);
		temp = "  </action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("  <action name=\"")).append(className).append("AdvancedQuery\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("QueryAction\" method=\"advancedSearch\">\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("\t <result name=\"success\">/")).append(parameter.getWebPath()).append("/list").append(className).append("AdvancedQueryModule.ftl</result>\n").toString();
		buffer.append(temp);
		temp = "  </action>\t\n";
		buffer.append(temp);
		temp = (new StringBuilder("   <action name=\"view")).append(className).append("AdvancedQuery\" class=\"").append(parameter.getAcitionPackageName()).append(".View").append(className).append("QueryAction\">\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("      <result name=\"success\">/")).append(parameter.getWebPath()).append("/view").append(className).append("AdvancedQueryModule.ftl</result>\n").toString();
		buffer.append(temp);
		temp = "   </action>\n";
		buffer.append(temp);
		return buffer.toString();
	}

	public String getServiceConfigure(GenerateParameter parameter)
	{
		return "";
	}

	public String getActionRelationConfigure(GenerateParameter parameter, RelationshipObject relation)
	{
		StringBuffer buffer = new StringBuffer();
		int type = relation.getType();
		String relationClassName = relation.getTableRelatedClassName();
		String relationObjectName = relation.getTableRelatedObjectName();
		if (type == 3)
		{
			String temp = (new StringBuilder("    <action name=\"create")).append(relationClassName).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("Action\">\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("       <result name=\"success\">/")).append(parameter.getWebPath()).append("/create").append(relationClassName).append(".ftl</result>\n").toString();
			buffer.append(temp);
			temp = "    </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("    <action name=\"doCreate")).append(relationClassName).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("Action\" method=\"save\">\n").toString();
			buffer.append(temp);
			temp = "    <interceptor-ref name=\"autowireValidation\"/>\n";
			buffer.append(temp);
			temp = (new StringBuilder("       <result name=\"input\">/")).append(parameter.getWebPath()).append("/create").append(relationClassName).append(".ftl</result>\n").toString();
			buffer.append(temp);
			temp = "       <result name=\"success\" type=\"chain\">\n";
			buffer.append(temp);
			temp = (new StringBuilder("          <param name=\"actionName\">list")).append(relationClassName).append("</param>\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("          <param name=\"namespace\">/")).append(parameter.getBussissKey()).append("</param>\n").toString();
			buffer.append(temp);
			temp = "       </result>\n";
			buffer.append(temp);
			temp = "    </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("    <action name=\"update")).append(relationClassName).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("Action\">\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("       <result name=\"success\">/")).append(parameter.getWebPath()).append("/update").append(relationClassName).append(".ftl</result>\n").toString();
			buffer.append(temp);
			temp = "   </action>";
			buffer.append(temp);
			temp = (new StringBuilder("   <action name=\"doUpdate")).append(relationClassName).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("Action\" method=\"update\">\n").toString();
			buffer.append(temp);
			temp = "   <interceptor-ref name=\"autowireValidation\"/>\n";
			buffer.append(temp);
			temp = (new StringBuilder("      <result name=\"input\">/")).append(parameter.getWebPath()).append("/update").append(relationClassName).append(".ftl</result>\n").toString();
			buffer.append(temp);
			temp = "      <result name=\"success\" type=\"chain\">\n";
			buffer.append(temp);
			temp = (new StringBuilder("         <param name=\"actionName\">list")).append(relationClassName).append("</param>\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("         <param name=\"namespace\">/")).append(parameter.getBussissKey()).append("</param>\n").toString();
			buffer.append(temp);
			temp = "      </result>\n";
			buffer.append(temp);
			temp = "    </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("    <action name=\"delete")).append(relationClassName).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("Action\" method=\"delete\">\n").toString();
			buffer.append(temp);
			temp = "       <result name=\"success\" type=\"chain\">\n";
			buffer.append(temp);
			temp = (new StringBuilder("          <param name=\"actionName\">list")).append(relationClassName).append("</param>\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("          <param name=\"namespace\">/")).append(parameter.getBussissKey()).append("</param>\n").toString();
			buffer.append(temp);
			temp = "       </result>\n";
			buffer.append(temp);
			temp = "       <result name=\"inline\" type=\"chain\">\n";
			buffer.append(temp);
			temp = (new StringBuilder("          <param name=\"actionName\">list")).append(relationClassName).append("InLine</param>\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("          <param name=\"namespace\">/")).append(parameter.getBussissKey()).append("</param>\n").toString();
			buffer.append(temp);
			temp = "       </result>\n";
			buffer.append(temp);
			temp = "    </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("    <action name=\"list")).append(relationClassName).append("\" class=\"com.taiji.info.webwork.action.List").append(relationClassName).append("Action\">\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("       <result name=\"success\">/")).append(parameter.getWebPath()).append("/list").append(relationClassName).append("Module.ftl</result>\n").toString();
			buffer.append(temp);
			temp = "    </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("   <action name=\"view")).append(relationClassName).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("Action\">\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("      <result name=\"success\">/")).append(parameter.getWebPath()).append("/update").append(relationClassName).append(".ftl</result>\n").toString();
			buffer.append(temp);
			temp = "   </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("   <action name=\"")).append(relationClassName).append("QueryTerm\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("QueryTermAction\">\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("      <result name=\"success\">/")).append(parameter.getWebPath()).append("/").append(relationClassName).append("QueryModule.ftl</result>\n").toString();
			buffer.append(temp);
			temp = "   </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("   <action name=\"")).append(relationClassName).append("Query\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("QueryAction\">\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("      <result name=\"success\">/")).append(parameter.getWebPath()).append("/list").append(relationClassName).append("AdvancedQueryModule.ftl</result>\n").toString();
			buffer.append(temp);
			temp = "   </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("   <action name=\"view")).append(relationClassName).append("Query\" class=\"com.taiji.info.webwork.action.View").append(relationClassName).append("QueryAction\">\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("      <result name=\"success\">/")).append(parameter.getWebPath()).append("/view").append(relationClassName).append("QueryModule.ftl</result>\n").toString();
			buffer.append(temp);
			temp = "   </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("<action name=\"")).append(relationClassName).append("AdvancedQueryTerm\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("QueryTermAction\" method=\"advancedSearch\">\n").toString();
			buffer.append(temp);
			temp = "\t <result name=\"success\">/pages/search/searchQuery.ftl</result>\n";
			buffer.append(temp);
			temp = "  </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("  <action name=\"")).append(relationClassName).append("AdvancedQuery\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("QueryAction\" method=\"advancedSearch\">\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("\t <result name=\"success\">/")).append(parameter.getWebPath()).append("/list").append(relationClassName).append("QueryModule.ftl</result>\n").toString();
			buffer.append(temp);
			temp = "  </action>\t\n";
			buffer.append(temp);
			temp = (new StringBuilder("   <action name=\"view")).append(relationClassName).append("AdvancedQuery\" class=\"com.taiji.info.webwork.action.View").append(relationClassName).append("QueryAction\">\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("      <result name=\"success\">/")).append(parameter.getWebPath()).append("/view").append(relationClassName).append("AdvancedQueryModule.ftl</result>\n").toString();
			buffer.append(temp);
			temp = "   </action>\n";
			buffer.append(temp);
		}
		if (type == 1)
		{
			String temp = (new StringBuilder("    <action name=\"create")).append(relationClassName).append("InLine\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("InLineAction\">\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("       <result name=\"success\">/")).append(parameter.getWebPath()).append("/create").append(relationClassName).append("InLine.ftl</result>\n").toString();
			buffer.append(temp);
			temp = "    </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("    <action name=\"doCreate")).append(relationClassName).append("InLine\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("InLineAction\" method=\"save\">\n").toString();
			buffer.append(temp);
			temp = "    <interceptor-ref name=\"autowireValidation\"/>\n";
			buffer.append(temp);
			temp = (new StringBuilder("       <result name=\"input\">/")).append(parameter.getWebPath()).append("/create").append(relationClassName).append("InLine.ftl</result>\n").toString();
			buffer.append(temp);
			temp = "       <result name=\"success\">/common/openreload.ftl</result>\n";
			buffer.append(temp);
			temp = "    </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("    <action name=\"update")).append(relationClassName).append("InLine\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("InLineAction\">\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("       <result name=\"success\">/")).append(parameter.getWebPath()).append("/update").append(relationClassName).append("InLine.ftl</result>\n").toString();
			buffer.append(temp);
			temp = "   </action>";
			buffer.append(temp);
			temp = (new StringBuilder("   <action name=\"view")).append(relationClassName).append("InLine\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("InLineAction\">\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("      <result name=\"success\">/")).append(parameter.getWebPath()).append("/update").append(relationClassName).append("InLine.ftl</result>\n").toString();
			buffer.append(temp);
			temp = "   </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("   <action name=\"doUpdate")).append(relationClassName).append("InLine\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("InLineAction\" method=\"update\">\n").toString();
			buffer.append(temp);
			temp = "   <interceptor-ref name=\"autowireValidation\"/>\n";
			buffer.append(temp);
			temp = (new StringBuilder("      <result name=\"input\">/")).append(parameter.getWebPath()).append("/update").append(relationClassName).append("InLine.ftl</result>\n").toString();
			buffer.append(temp);
			temp = "      <result name=\"success\">/common/openreload.ftl</result>\n";
			buffer.append(temp);
			temp = "    </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("    <action name=\"delete")).append(relationClassName).append("InLine\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(relationClassName).append("InLineAction\" method=\"delete\">\n").toString();
			buffer.append(temp);
			temp = "       <result name=\"success\" type=\"chain\">\n";
			buffer.append(temp);
			temp = (new StringBuilder("          <param name=\"actionName\">list")).append(relationClassName).append("InLine</param>\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("          <param name=\"namespace\">/")).append(parameter.getBussissKey()).append("</param>\n").toString();
			buffer.append(temp);
			temp = "       </result>\n";
			buffer.append(temp);
			temp = "    </action>\n";
			buffer.append(temp);
			temp = (new StringBuilder("    <action name=\"list")).append(relationClassName).append("InLine\" class=\"").append(parameter.getAcitionPackageName()).append(".List").append(relationClassName).append("InLineAction\">\n").toString();
			buffer.append(temp);
			temp = (new StringBuilder("       <result name=\"success\">/")).append(parameter.getWebPath()).append("/list").append(relationClassName).append("${urlFlag}InLineModule.ftl</result>\n").toString();
			buffer.append(temp);
			temp = "    </action>\n";
			buffer.append(temp);
		}
		return buffer.toString();
	}

	public String getHibernateConfigure(GenerateParameter parameter)
	{
		String cfg = "";
		Iterator iter = parameter.getRelationshipList().iterator();
		String relationName;
		for (cfg = (new StringBuilder("        <mapping resource=\"")).append(parameter.getDomainPath()).append("//").append(parameter.getClassName()).append(".hbm.xml\"/>\n").toString(); iter.hasNext(); cfg = (new StringBuilder(String.valueOf(cfg))).append("  <mapping resource=\"").append(parameter.getDomainPath()).append("//").append(relationName).append(".hbm.xml\"/>\n").toString())
		{
			RelationshipObject relation = (RelationshipObject)iter.next();
			relationName = relation.getTableRelatedClassName();
		}

		return cfg;
	}

	public void specialProcess(GenerateParameter generateparameter)
	{
	}
}
