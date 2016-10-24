// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   InfoGatherConfigureServiceImpl.java

package com.taiji.core.generator.configen.service.impl;

import com.taiji.core.generator.GenerateParameter;
import com.taiji.core.generator.configen.service.IConfigService;
import com.taiji.core.generator.formgen.component.RelationshipObject;
import com.taiji.core.generator.plugingen.FileProducerByFreemarker;
import com.taiji.core.util.FileOperator;
import freemarker.template.Configuration;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import org.hibernate.tool.hbm2ddl.SchemaExport;

// Referenced classes of package com.taiji.core.generator.configen.service.impl:
//			ConfigureServiceImpl

public class InfoGatherConfigureServiceImpl extends ConfigureServiceImpl
	implements IConfigService
{

	private final String CHECK_POST = "Check";

	public InfoGatherConfigureServiceImpl()
	{
	}

	public String getActionConfigure(GenerateParameter parameter)
	{
		String className = parameter.getClassName();
		StringBuffer buffer = new StringBuffer();
		String temp = "";
		temp = (new StringBuilder("\t<action name=\"to")).append(className).append("Query\" class=\"").append(parameter.getAcitionPackageName()).append(".List").append(className).append("QueryAction\" method=\"link\">\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/query").append(className).append(".ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"do")).append(className).append("Query\" class=\"").append(parameter.getAcitionPackageName()).append(".List").append(className).append("QueryAction\" >\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/query").append(className).append("List.ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"historyGet")).append(className).append("QueryDetail\" class=\"").append(parameter.getAcitionPackageName()).append(".List").append(className).append("QueryHistoryAction\" >\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/query").append(className).append("HistoryList.ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"viewGet")).append(className).append("QueryDetail\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("QueryDetailAction\" >\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/query").append(className).append("Detail.ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"doCreate")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"save\">\n").toString();
		buffer.append(temp);
		temp = "\t\t<result name=\"success\" type=\"chain\">\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t\t\t<param name=\"actionName\">listn")).append(className).append("</param>\n").toString();
		buffer.append(temp);
		temp = "\t\t</result>\n";
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"doUpdate")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"update\">\n").toString();
		buffer.append(temp);
		temp = "\t\t<result name=\"success\" type=\"chain\">\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t\t\t<param name=\"actionName\">listn")).append(className).append("</param>\n").toString();
		buffer.append(temp);
		temp = "\t\t</result>\n";
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"create")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" >\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/create").append(className).append(".ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"delete")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"delete\">\n").toString();
		buffer.append(temp);
		temp = "\t\t<result name=\"success\" type=\"chain\">\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t\t\t<param name=\"actionName\">listn")).append(className).append("</param>\n").toString();
		buffer.append(temp);
		temp = "\t   \t</result>\n";
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"view")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"detail\">\n").toString();
		buffer.append(temp);
		temp = "\t\t<interceptor-ref name=\"autowireValidationNoSession\"/>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/update").append(className).append(".ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"update")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"detail\">\n").toString();
		buffer.append(temp);
		temp = "\t\t<interceptor-ref name=\"autowireValidationNoSession\"/>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/update").append(className).append(".ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"doSubmit")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"submit\">\n").toString();
		buffer.append(temp);
		temp = "\t\t\t<result name=\"success\" type=\"chain\">\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t\t\t\t<param name=\"actionName\">listn")).append(className).append("</param>\n").toString();
		buffer.append(temp);
		temp = "\t\t\t</result>\n";
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"submit")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"detail\">\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/submit").append(className).append(".ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"listn")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".List").append(className).append("Action\" method=\"listn\">\n").toString();
		buffer.append(temp);
		temp = (new StringBuilder("\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/listn").append(className).append(".ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"check")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"check\">\n").toString();
		buffer.append(temp);
		temp = "\t\t<interceptor-ref name=\"autowireValidationNoSession\"/>\n";
		buffer.append(temp);
		temp = "\t\t\t<result name=\"success\" type=\"chain\">\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t\t\t\t<param name=\"actionName\">listc")).append(className).append("</param>\n").toString();
		buffer.append(temp);
		temp = "\t\t\t</result>\n";
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"checkAll")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"check\">\n").toString();
		buffer.append(temp);
		temp = "\t<interceptor-ref name=\"autowireValidationNoSession\"/>\n";
		buffer.append(temp);
		temp = "\t<result name=\"success\" type=\"chain\">\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t\t<param name=\"actionName\">listac")).append(className).append("</param>\n").toString();
		buffer.append(temp);
		temp = "\t</result>\n";
		buffer.append(temp);
		temp = "</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("<action name=\"viewc")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"detail\">\n").toString();
		buffer.append(temp);
		temp = "\t<interceptor-ref name=\"autowireValidationNoSession\"/>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/").append(className).append("DetailC.ftl</result>\n").toString();
		buffer.append(temp);
		temp = "</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"viewac")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"detail\">\n").toString();
		buffer.append(temp);
		temp = "\t\t<interceptor-ref name=\"autowireValidationNoSession\"/>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/").append(className).append("DetailCA.ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"checkc")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"detail\">\n").toString();
		buffer.append(temp);
		temp = "\t<interceptor-ref name=\"autowireValidationNoSession\"/>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/").append(className).append("DetailCU.ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"checkac")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".").append(className).append("Action\" method=\"detail\">\n").toString();
		buffer.append(temp);
		temp = "\t<interceptor-ref name=\"autowireValidationNoSession\"/>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/").append(className).append("DetailCUA.ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"listc")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".List").append(className).append("Action\" method=\"listc\">\n").toString();
		buffer.append(temp);
		temp = "\t<interceptor-ref name=\"autowireValidationNoSession\"/>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/listc").append(className).append(".ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t<action name=\"listac")).append(className).append("\" class=\"").append(parameter.getAcitionPackageName()).append(".List").append(className).append("Action\" method=\"listac\">\n").toString();
		buffer.append(temp);
		temp = "\t<interceptor-ref name=\"autowireValidationNoSession\"/>\n";
		buffer.append(temp);
		temp = (new StringBuilder("\t\t<result name=\"success\">/")).append(parameter.getWebPath()).append("/listac").append(className).append(".ftl</result>\n").toString();
		buffer.append(temp);
		temp = "\t</action>\n";
		buffer.append(temp);
		return buffer.toString();
	}

	public String getServiceConfigure(GenerateParameter parameter)
	{
		StringBuffer buffer = new StringBuffer();
		String temp = (new StringBuilder("    <bean id =\"")).append(parameter.getObjectName()).append("Service\" class=\"").append(parameter.getServicePackageName()).append(".impl.").append(parameter.getClassName()).append("ServiceImpl\" autowire=\"byName\"/>\n").toString();
		buffer.append(temp);
		return buffer.toString();
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
		cfg = (new StringBuilder("         <mapping resource=\"")).append(parameter.getDomainPath()).append("//").append(parameter.getClassName()).append(".hbm.xml\"/>\n").toString();
		cfg = (new StringBuilder(String.valueOf(cfg))).append("         <mapping resource=\"").append(parameter.getDomainPath()).append("//").append(parameter.getClassName()).append("History.hbm.xml\"/>\n").toString();
		cfg = (new StringBuilder(String.valueOf(cfg))).append("         <mapping resource=\"").append(parameter.getDomainPath()).append("//").append(parameter.getClassName()).append("Check.hbm.xml\"/>\n").toString();
		String relationName;
		for (cfg = (new StringBuilder(String.valueOf(cfg))).append("         <mapping resource=\"").append(parameter.getDomainPath()).append("//").append(parameter.getClassName()).append("CheckHistory.hbm.xml\"/>\n").toString(); iter.hasNext(); cfg = (new StringBuilder(String.valueOf(cfg))).append("  <mapping resource=\"").append(parameter.getDomainPath()).append("//").append(relationName).append("History.hbm.xml\"/>\n").toString())
		{
			RelationshipObject relation = (RelationshipObject)iter.next();
			relationName = relation.getTableRelatedClassName();
			cfg = (new StringBuilder(String.valueOf(cfg))).append("  <mapping resource=\"").append(parameter.getDomainPath()).append("//").append(relationName).append(".hbm.xml\"/>\n").toString();
		}

		return cfg;
	}

	public void specialProcess(GenerateParameter parameter)
	{
		genCheckhbm(parameter);
		genCheckDomain(parameter);
		genInfoGatherHistory(parameter);
		genInfoGatherRelationHistory(parameter);
		updateInfoGather(parameter);
	}

	private void genCheckhbm(GenerateParameter parameter)
	{
		String path = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(parameter.javaCodePath).toString();
		String domaindestPath = (new StringBuilder(String.valueOf(path))).append(File.separator).append(parameter.getDomainPath()).append(File.separator).toString();
		String checkTableName = (new StringBuilder(String.valueOf(parameter.getTableName()))).append("Check").toString();
		String className = (new StringBuilder(String.valueOf(parameter.getClassName()))).append("Check").toString();
		String fileName = (new StringBuilder(String.valueOf(className))).append(".hbm.xml").toString();
		File file = new File((new StringBuilder(String.valueOf(domaindestPath))).append(fileName).toString());
		Properties props = new Properties();
		Map context = new HashMap();
		context.put("classname", className);
		context.put("tablename", checkTableName);
		context.put("infoClass", parameter.getClassName());
		context.put("infoObject", parameter.getObjectName());
		FileProducerByFreemarker producer = new FileProducerByFreemarker(new File(domaindestPath), fileName, "checkhbm.ftl");
		producer.init(props);
		producer.getCfg().setClassForTemplateLoading(getClass(), "");
		producer.addContextMap(context);
		producer.generate(file);
		checkTableName = (new StringBuilder(String.valueOf(parameter.getTableName()))).append("Check").append("History").toString();
		className = (new StringBuilder(String.valueOf(parameter.getClassName()))).append("CheckHistory").toString();
		fileName = (new StringBuilder(String.valueOf(className))).append(".hbm.xml").toString();
		file = new File((new StringBuilder(String.valueOf(domaindestPath))).append(fileName).toString());
		context.clear();
		context.put("classname", className);
		context.put("tablename", checkTableName);
		context.put("infoClass", (new StringBuilder(String.valueOf(parameter.getClassName()))).append("History").toString());
		context.put("infoObject", (new StringBuilder(String.valueOf(parameter.getObjectName()))).append("History").toString());
		FileProducerByFreemarker producer_history = new FileProducerByFreemarker(new File(domaindestPath), fileName, "checkhbm.ftl");
		producer_history.init(props);
		producer_history.getCfg().setClassForTemplateLoading(getClass(), "");
		producer_history.addContextMap(context);
		producer_history.generate(file);
	}

	private void genCheckDomain(GenerateParameter parameter)
	{
		String path = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(parameter.javaCodePath).toString();
		String domaindestPath = (new StringBuilder(String.valueOf(path))).append(File.separator).append(parameter.getDomainPath()).append(File.separator).toString();
		String checkTableName = (new StringBuilder(String.valueOf(parameter.getTableName()))).append("Check").toString();
		String className = (new StringBuilder(String.valueOf(parameter.getClassName()))).append("Check").toString();
		String fileName = (new StringBuilder(String.valueOf(className))).append(".java").toString();
		File file = new File((new StringBuilder(String.valueOf(domaindestPath))).append(fileName).toString());
		Properties props = new Properties();
		Map context = new HashMap();
		context.put("classname", className);
		context.put("tablename", checkTableName);
		context.put("infoClass", parameter.getClassName());
		context.put("infoObject", parameter.getObjectName());
		FileProducerByFreemarker producer = new FileProducerByFreemarker(new File(domaindestPath), fileName, "checkpojo.ftl");
		producer.init(props);
		producer.getCfg().setClassForTemplateLoading(getClass(), "");
		producer.addContextMap(context);
		producer.generate(file);
		checkTableName = (new StringBuilder(String.valueOf(parameter.getTableName()))).append("Check").append("History").toString();
		className = (new StringBuilder(String.valueOf(parameter.getClassName()))).append("CheckHistory").toString();
		fileName = (new StringBuilder(String.valueOf(className))).append(".java").toString();
		file = new File((new StringBuilder(String.valueOf(domaindestPath))).append(fileName).toString());
		context.clear();
		context.put("classname", className);
		context.put("tablename", checkTableName);
		context.put("infoClass", (new StringBuilder(String.valueOf(parameter.getClassName()))).append("History").toString());
		context.put("infoObject", (new StringBuilder(String.valueOf(parameter.getObjectName()))).append("History").toString());
		FileProducerByFreemarker producer_history = new FileProducerByFreemarker(new File(domaindestPath), fileName, "checkpojo.ftl");
		producer_history.init(props);
		producer_history.getCfg().setClassForTemplateLoading(getClass(), "");
		producer_history.addContextMap(context);
		producer_history.generate(file);
	}

	private void genInfoGatherHistory(GenerateParameter parameter)
	{
		genInfoGatherHbmHistroy(parameter);
		genInfoGatherJavaHistory(parameter);
	}

	private void genInfoGatherHbmHistroy(GenerateParameter parameter)
	{
		String path = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(parameter.javaCodePath).toString();
		String domaindestPath = (new StringBuilder(String.valueOf(path))).append(File.separator).append(parameter.getDomainPath()).append(File.separator).toString();
		String oldfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(parameter.getClassName()).append(".hbm.xml").toString();
		String newfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(parameter.getClassName()).append("History.hbm.xml").toString();
		String checkHistroyTableName = (new StringBuilder(String.valueOf(parameter.getTableName()))).append("Check").append("History").toString();
		String checkHistroyClassName = (new StringBuilder(String.valueOf(parameter.getClassName()))).append("CheckHistory").toString();
		String checkHistroyObjectName = (new StringBuilder(String.valueOf(parameter.getObjectName()))).append("CheckHistory").toString();
		FileOperator.copyFile(oldfilename, newfilename);
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(newfilename));
			StringBuffer inputBuffer = new StringBuffer();
			String line = "";
			String flagString = "</class>";
			String appendString = " ";
			while ((line = reader.readLine()) != null) 
			{
				inputBuffer.append(line);
				inputBuffer.append("\n");
			}
			reader.close();
			String content = inputBuffer.toString();
			appendString = (new StringBuilder("<one-to-one name=\"")).append(checkHistroyObjectName).append("\" class=\"").append(checkHistroyClassName).append("\" cascade=\"all\" property-ref=\"").append(parameter.getObjectName()).append("History\"/>\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("<many-to-one name=\"").append(parameter.getObjectName()).append("\" column=\"infoid\" class=\"").append(parameter.getClassName()).append("\" />\n").toString();
			for (Iterator iter = parameter.getRelationshipList().iterator(); iter.hasNext();)
			{
				RelationshipObject relation = (RelationshipObject)iter.next();
				int type = relation.getType();
				switch (type)
				{
				case 0: // '\0'
					content = content.replaceAll(relation.getTableRelatedClassName(), (new StringBuilder(String.valueOf(relation.getTableRelatedClassName()))).append("History").toString());
					content = content.replaceAll(relation.getTableRelatedObjectName(), (new StringBuilder(String.valueOf(relation.getTableRelatedObjectName()))).append("History").toString());
					break;

				case 1: // '\001'
					content = content.replaceAll(relation.getTableRelatedClassName(), (new StringBuilder(String.valueOf(relation.getTableRelatedClassName()))).append("History").toString());
					content = content.replaceAll(relation.getTableRelatedObjectName(), (new StringBuilder(String.valueOf(relation.getTableRelatedObjectName()))).append("History").toString());
					break;
				}
			}

			content = content.replaceAll(parameter.getClassName(), (new StringBuilder(String.valueOf(parameter.getClassName()))).append("History").toString());
			content = content.replaceAll(parameter.getTableName(), (new StringBuilder(String.valueOf(parameter.getTableName()))).append("history").toString());
			int index = content.lastIndexOf(flagString);
			StringBuffer buffer = new StringBuffer();
			buffer.append(content.substring(0, index));
			buffer.append("\n");
			buffer.append(appendString);
			buffer.append("\n");
			buffer.append(content.substring(index));
			BufferedWriter writer = new BufferedWriter(new FileWriter(newfilename));
			writer.write(buffer.toString());
			writer.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private void genInfoGatherJavaHistory(GenerateParameter parameter)
	{
		String path = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(parameter.javaCodePath).toString();
		String domaindestPath = (new StringBuilder(String.valueOf(path))).append(File.separator).append(parameter.getDomainPath()).append(File.separator).toString();
		String oldfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(parameter.getClassName()).append(".java").toString();
		String newfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(parameter.getClassName()).append("History.java").toString();
		String checkHistroyTableName = (new StringBuilder(String.valueOf(parameter.getTableName()))).append("Check").append("History").toString();
		String checkHistroyClassName = (new StringBuilder(String.valueOf(parameter.getClassName()))).append("CheckHistory").toString();
		String checkHistroyObjectName = (new StringBuilder(String.valueOf(parameter.getObjectName()))).append("CheckHistory").toString();
		FileOperator.copyFile(oldfilename, newfilename);
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(newfilename));
			StringBuffer inputBuffer = new StringBuffer();
			String line = "";
			String flagString = "}";
			while ((line = reader.readLine()) != null) 
			{
				inputBuffer.append(line);
				inputBuffer.append("\n");
			}
			reader.close();
			String content = inputBuffer.toString();
			String appendString = (new StringBuilder(" private ")).append(parameter.getClassName()).append(" ").append(parameter.getObjectName()).append(";\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append(" private ").append(checkHistroyClassName).append(" ").append(checkHistroyObjectName).append(";\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("public ").append(parameter.getClassName()).append(" get").append(parameter.getClassName()).append("() {\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("    return ").append(parameter.getObjectName()).append(";\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("}\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("public void set").append(parameter.getClassName()).append("(").append(parameter.getClassName()).append(" ").append(parameter.getObjectName()).append(") {\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("\tthis.").append(parameter.getObjectName()).append(" = ").append(parameter.getObjectName()).append(";\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("}\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("public ").append(checkHistroyClassName).append(" get").append(checkHistroyClassName).append("() {\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("    return ").append(checkHistroyObjectName).append(";\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("}\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("public void set").append(checkHistroyClassName).append("(").append(checkHistroyClassName).append(" ").append(checkHistroyObjectName).append(") {\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("\tthis.").append(checkHistroyObjectName).append(" = ").append(checkHistroyObjectName).append(";\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("}\n").toString();
			for (Iterator iter = parameter.getRelationshipList().iterator(); iter.hasNext();)
			{
				RelationshipObject relation = (RelationshipObject)iter.next();
				int type = relation.getType();
				switch (type)
				{
				case 0: // '\0'
					content = content.replaceAll(relation.getTableRelatedClassName(), (new StringBuilder(String.valueOf(relation.getTableRelatedClassName()))).append("History").toString());
					content = content.replaceAll(relation.getTableRelatedObjectName(), (new StringBuilder(String.valueOf(relation.getTableRelatedObjectName()))).append("History").toString());
					break;

				case 1: // '\001'
					content = content.replaceAll(relation.getTableRelatedClassName(), (new StringBuilder(String.valueOf(relation.getTableRelatedClassName()))).append("History").toString());
					content = content.replaceAll(relation.getTableRelatedObjectName(), (new StringBuilder(String.valueOf(relation.getTableRelatedObjectName()))).append("History").toString());
					break;
				}
			}

			content = content.replaceAll(parameter.getClassName(), (new StringBuilder(String.valueOf(parameter.getClassName()))).append("History").toString());
			int index = content.lastIndexOf(flagString);
			StringBuffer buffer = new StringBuffer();
			buffer.append(content.substring(0, index));
			buffer.append("\n");
			buffer.append(appendString);
			buffer.append("\n");
			buffer.append(content.substring(index));
			BufferedWriter writer = new BufferedWriter(new FileWriter(newfilename));
			writer.write(buffer.toString());
			writer.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private void genInfoGatherRelationHistory(GenerateParameter parameter)
	{
		for (Iterator iter = parameter.getRelationshipList().iterator(); iter.hasNext();)
		{
			RelationshipObject relation = (RelationshipObject)iter.next();
			int type = relation.getType();
			switch (type)
			{
			case 0: // '\0'
				genInfoGatherOne2OneRelationHbmHistroy(relation, parameter);
				genInfoGatherOne2OneRelationJavaHistory(relation, parameter);
				break;

			case 1: // '\001'
				genInfoGatherOne2ManyRelationHbmHistroy(relation, parameter);
				genInfoGatherOne2ManyRelationJavaHistory(relation, parameter);
				break;

			case 2: // '\002'
				genInfoGatherMany2ManyRelationHbmHistroy(relation, parameter);
				genInfoGatherMany2ManyRelationJavaHistory(relation, parameter);
				break;
			}
		}

	}

	private void genInfoGatherOne2OneRelationHbmHistroy(RelationshipObject relation, GenerateParameter parameter)
	{
		String path = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(parameter.javaCodePath).toString();
		String domaindestPath = (new StringBuilder(String.valueOf(path))).append(File.separator).append(parameter.getDomainPath()).append(File.separator).toString();
		String oldfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(relation.getTableRelatedClassName()).append(".hbm.xml").toString();
		String newfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(relation.getTableRelatedClassName()).append("History.hbm.xml").toString();
		FileOperator.copyFile(oldfilename, newfilename);
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(newfilename));
			StringBuffer inputBuffer = new StringBuffer();
			for (String line = ""; (line = reader.readLine()) != null;)
			{
				inputBuffer.append(line);
				inputBuffer.append("\n");
			}

			reader.close();
			String content = inputBuffer.toString();
			content = content.replaceAll(parameter.getClassName(), (new StringBuilder(String.valueOf(parameter.getClassName()))).append("History").toString());
			content = content.replaceAll(parameter.getObjectName(), (new StringBuilder(String.valueOf(parameter.getObjectName()))).append("History").toString());
			content = content.replaceAll(relation.getTableRelatedClassName(), (new StringBuilder(String.valueOf(relation.getTableRelatedClassName()))).append("History").toString());
			content = content.replaceAll(relation.getTableRelatedName(), (new StringBuilder(String.valueOf(relation.getTableRelatedName()))).append("history").toString());
			BufferedWriter writer = new BufferedWriter(new FileWriter(newfilename));
			writer.write(content);
			writer.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private void genInfoGatherOne2OneRelationJavaHistory(RelationshipObject relation, GenerateParameter parameter)
	{
		String path = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(parameter.javaCodePath).toString();
		String domaindestPath = (new StringBuilder(String.valueOf(path))).append(File.separator).append(parameter.getDomainPath()).append(File.separator).toString();
		String oldfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(relation.getTableRelatedClassName()).append(".java").toString();
		String newfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(relation.getTableRelatedClassName()).append("History.java").toString();
		FileOperator.copyFile(oldfilename, newfilename);
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(newfilename));
			StringBuffer inputBuffer = new StringBuffer();
			for (String line = ""; (line = reader.readLine()) != null;)
			{
				inputBuffer.append(line);
				inputBuffer.append("\n");
			}

			reader.close();
			String content = inputBuffer.toString();
			content = content.replaceAll(relation.getTableRelatedClassName(), (new StringBuilder(String.valueOf(relation.getTableRelatedClassName()))).append("History").toString());
			content = content.replaceAll(relation.getTableRelatedObjectName(), (new StringBuilder(String.valueOf(relation.getTableRelatedObjectName()))).append("History").toString());
			content = content.replaceAll(parameter.getClassName(), (new StringBuilder(String.valueOf(parameter.getClassName()))).append("History").toString());
			content = content.replaceAll(parameter.getObjectName(), (new StringBuilder(String.valueOf(parameter.getObjectName()))).append("History").toString());
			BufferedWriter writer = new BufferedWriter(new FileWriter(newfilename));
			writer.write(content);
			writer.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private void genInfoGatherOne2ManyRelationHbmHistroy(RelationshipObject relation, GenerateParameter parameter)
	{
		String path = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(parameter.javaCodePath).toString();
		String domaindestPath = (new StringBuilder(String.valueOf(path))).append(File.separator).append(parameter.getDomainPath()).append(File.separator).toString();
		String oldfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(relation.getTableRelatedClassName()).append(".hbm.xml").toString();
		String newfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(relation.getTableRelatedClassName()).append("History.hbm.xml").toString();
		FileOperator.copyFile(oldfilename, newfilename);
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(newfilename));
			StringBuffer inputBuffer = new StringBuffer();
			for (String line = ""; (line = reader.readLine()) != null;)
			{
				inputBuffer.append(line);
				inputBuffer.append("\n");
			}

			reader.close();
			String content = inputBuffer.toString();
			content = content.replaceAll(parameter.getClassName(), (new StringBuilder(String.valueOf(parameter.getClassName()))).append("History").toString());
			content = content.replaceAll(parameter.getObjectName(), (new StringBuilder(String.valueOf(parameter.getObjectName()))).append("History").toString());
			content = content.replaceAll(relation.getTableRelatedClassName(), (new StringBuilder(String.valueOf(relation.getTableRelatedClassName()))).append("History").toString());
			content = content.replaceAll(relation.getTableRelatedName(), (new StringBuilder(String.valueOf(relation.getTableRelatedName()))).append("history").toString());
			BufferedWriter writer = new BufferedWriter(new FileWriter(newfilename));
			writer.write(content);
			writer.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private void genInfoGatherOne2ManyRelationJavaHistory(RelationshipObject relation, GenerateParameter parameter)
	{
		String path = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(parameter.javaCodePath).toString();
		String domaindestPath = (new StringBuilder(String.valueOf(path))).append(File.separator).append(parameter.getDomainPath()).append(File.separator).toString();
		String oldfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(relation.getTableRelatedClassName()).append(".java").toString();
		String newfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(relation.getTableRelatedClassName()).append("History.java").toString();
		FileOperator.copyFile(oldfilename, newfilename);
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(newfilename));
			StringBuffer inputBuffer = new StringBuffer();
			for (String line = ""; (line = reader.readLine()) != null;)
			{
				inputBuffer.append(line);
				inputBuffer.append("\n");
			}

			reader.close();
			String content = inputBuffer.toString();
			content = content.replaceAll(relation.getTableRelatedClassName(), (new StringBuilder(String.valueOf(relation.getTableRelatedClassName()))).append("History").toString());
			content = content.replaceAll(relation.getTableRelatedObjectName(), (new StringBuilder(String.valueOf(relation.getTableRelatedObjectName()))).append("History").toString());
			content = content.replaceAll(parameter.getClassName(), (new StringBuilder(String.valueOf(parameter.getClassName()))).append("History").toString());
			content = content.replaceAll(parameter.getObjectName(), (new StringBuilder(String.valueOf(parameter.getObjectName()))).append("History").toString());
			BufferedWriter writer = new BufferedWriter(new FileWriter(newfilename));
			writer.write(content);
			writer.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private void genInfoGatherMany2ManyRelationHbmHistroy(RelationshipObject relationshipobject, GenerateParameter generateparameter)
	{
	}

	private void genInfoGatherMany2ManyRelationJavaHistory(RelationshipObject relationshipobject, GenerateParameter generateparameter)
	{
	}

	private void updateInfoGather(GenerateParameter parameter)
	{
		updateInfoGatherHbm(parameter);
		updateInfoGatherJava(parameter);
	}

	private void updateInfoGatherHbm(GenerateParameter parameter)
	{
		String path = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(parameter.javaCodePath).toString();
		String domaindestPath = (new StringBuilder(String.valueOf(path))).append(File.separator).append(parameter.getDomainPath()).append(File.separator).toString();
		String filename = (new StringBuilder(String.valueOf(domaindestPath))).append(parameter.getClassName()).append(".hbm.xml").toString();
		String checkTableName = (new StringBuilder(String.valueOf(parameter.getTableName()))).append("Check").toString();
		String checkClassName = (new StringBuilder(String.valueOf(parameter.getClassName()))).append("Check").toString();
		String checkObjectName = (new StringBuilder(String.valueOf(parameter.getObjectName()))).append("Check").toString();
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(filename));
			StringBuffer inputBuffer = new StringBuffer();
			String line = "";
			String flagString = "</class>";
			String appendString = " ";
			appendString = (new StringBuilder("<one-to-one name=\"")).append(checkObjectName).append("\" class=\"").append(checkClassName).append("\" cascade=\"all\" property-ref=\"").append(parameter.getObjectName()).append("\"/>\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("<set name=\"").append(parameter.getObjectName()).append("History\" inverse=\"true\" cascade=\"save-update\">\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("\t<key column=\"").append(parameter.getTableNameKeyColumn()).append("\"  />\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("\t<one-to-many class=\"").append(parameter.getClassName()).append("History\" />\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("</set>\n").toString();
			while ((line = reader.readLine()) != null) 
			{
				inputBuffer.append(line);
				inputBuffer.append("\n");
			}
			reader.close();
			String content = inputBuffer.toString();
			int index = content.lastIndexOf(flagString);
			StringBuffer buffer = new StringBuffer();
			buffer.append(content.substring(0, index));
			buffer.append("\n");
			buffer.append(appendString);
			buffer.append("\n");
			buffer.append(content.substring(index));
			BufferedWriter writer = new BufferedWriter(new FileWriter(filename));
			writer.write(buffer.toString());
			writer.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private void updateInfoGatherJava(GenerateParameter parameter)
	{
		String path = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(parameter.javaCodePath).toString();
		String domaindestPath = (new StringBuilder(String.valueOf(path))).append(File.separator).append(parameter.getDomainPath()).append(File.separator).toString();
		String filename = (new StringBuilder(String.valueOf(domaindestPath))).append(parameter.getClassName()).append(".java").toString();
		String checkTableName = (new StringBuilder(String.valueOf(parameter.getTableName()))).append("Check").toString();
		String checkClassName = (new StringBuilder(String.valueOf(parameter.getClassName()))).append("Check").toString();
		String checkObjectName = (new StringBuilder(String.valueOf(parameter.getObjectName()))).append("Check").toString();
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(filename));
			StringBuffer inputBuffer = new StringBuffer();
			String line = "";
			String flagString = "}";
			String appendString = (new StringBuilder(" private Set ")).append(parameter.getObjectName()).append("History = new LinkedHashSet();\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append(" private ").append(checkClassName).append(" ").append(checkObjectName).append(";\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("public Set  get").append(parameter.getClassName()).append("History() {\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("    return ").append(parameter.getObjectName()).append("History;\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("}\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("public void set").append(parameter.getClassName()).append("History(").append("Set ").append(parameter.getObjectName()).append("History) {\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("\tthis.").append(parameter.getObjectName()).append("History = ").append(parameter.getObjectName()).append("History;\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("}\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("public ").append(checkClassName).append(" get").append(checkClassName).append("() {\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("    return ").append(checkObjectName).append(";\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("}\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("public void set").append(checkClassName).append("(").append(checkClassName).append(" ").append(checkObjectName).append(") {\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("\tthis.").append(checkObjectName).append(" = ").append(checkObjectName).append(";\n").toString();
			appendString = (new StringBuilder(String.valueOf(appendString))).append("}\n").toString();
			while ((line = reader.readLine()) != null) 
			{
				inputBuffer.append(line);
				inputBuffer.append("\n");
			}
			reader.close();
			String content = inputBuffer.toString();
			int index = content.lastIndexOf(flagString);
			StringBuffer buffer = new StringBuffer();
			buffer.append(content.substring(0, index));
			buffer.append("\n");
			buffer.append(appendString);
			buffer.append("\n");
			buffer.append(content.substring(index));
			BufferedWriter writer = new BufferedWriter(new FileWriter(filename));
			writer.write(buffer.toString());
			writer.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	private void buildTable(GenerateParameter parameter)
	{
		String path = (new StringBuilder(String.valueOf(parameter.getDestRootDir()))).append(parameter.javaCodePath).toString();
		String domaindestPath = (new StringBuilder(String.valueOf(path))).append(File.separator).append(parameter.getDomainPath()).append(File.separator).toString();
		String newfileHistoryname = (new StringBuilder(String.valueOf(domaindestPath))).append(parameter.getClassName()).append("History.hbm.xml").toString();
		String filename = (new StringBuilder(String.valueOf(domaindestPath))).append(parameter.getClassName()).append(".hbm.xml").toString();
		String checkTableName = (new StringBuilder(String.valueOf(parameter.getTableName()))).append("Check").toString();
		String checkClassName = (new StringBuilder(String.valueOf(parameter.getClassName()))).append("Check").toString();
		String checkHbmfileName = (new StringBuilder(String.valueOf(checkClassName))).append(".hbm.xml").toString();
		String newcheckfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(checkHbmfileName).toString();
		String checkHistoryTableName = (new StringBuilder(String.valueOf(parameter.getTableName()))).append("Check").append("History").toString();
		String checkHistoryClassName = (new StringBuilder(String.valueOf(parameter.getClassName()))).append("CheckHistory").toString();
		String checkHIstoryHbmfileName = (new StringBuilder(String.valueOf(checkHistoryClassName))).append(".hbm.xml").toString();
		String newcheckhistoryfilename = (new StringBuilder(String.valueOf(domaindestPath))).append(checkHIstoryHbmfileName).toString();
		org.hibernate.cfg.Configuration currentCfg = (new org.hibernate.cfg.Configuration()).configure();
		org.hibernate.cfg.Configuration cfg = new org.hibernate.cfg.Configuration();
		cfg.addFile(filename);
		cfg.addFile(newfileHistoryname);
		cfg.addFile(newcheckfilename);
		cfg.addFile(newcheckhistoryfilename);
		String relationFileHistory;
		for (Iterator iter = parameter.getRelationshipList().iterator(); iter.hasNext(); cfg.addFile(relationFileHistory))
		{
			RelationshipObject relation = (RelationshipObject)iter.next();
			String relationFile = (new StringBuilder(String.valueOf(domaindestPath))).append(relation.getTableRelatedClassName()).append(".hbm.xml").toString();
			cfg.addFile(relationFile);
			relationFileHistory = (new StringBuilder(String.valueOf(domaindestPath))).append(relation.getTableRelatedClassName()).append("History.hbm.xml").toString();
		}

		Properties props = currentCfg.getProperties();
		cfg.setProperty("hibernate.connection.driver_class", props.getProperty("hibernate.connection.driver_class"));
		cfg.setProperty("hibernate.connection.url", props.getProperty("hibernate.connection.url"));
		cfg.setProperty("hibernate.connection.username", props.getProperty("hibernate.connection.username"));
		cfg.setProperty("hibernate.connection.password", props.getProperty("hibernate.connection.password"));
		cfg.setProperty("hibernate.dialect", props.getProperty("hibernate.dialect"));
		SchemaExport dbExport = new SchemaExport(cfg);
		dbExport.create(true, true);
	}
}
