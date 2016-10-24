<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

	
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/style_anju.css">
	<script type="text/javascript" src="../js/html5.js"></script>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/treeJs.js"></script>	
		<style type="text/css">z_wrap_ml,.z_wrap_ml{behavior: url(../css/ie-css3.htc);}</style> 
	</head>
	<body>
	<#assign page=1>
	<div class="z_wrap_ml">
		<h2 class="z_title">案卷目录</h2>
		<dl class="z_ml_cont jsMlCont">
			<dt><span class="z_ml_text fl"><a href="#" class="z_jian"></a><a href="../xzfy/viewXzfyInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}" >接待阶段</a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dt>
			<dd><span class="z_ml_text fl"><a href="../xzfy/viewXzfyInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}" >接待信息</a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dd>
			<dd><span class="z_ml_text fl"><a href="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131021070651&d_username=${Session['_USER_LOGIN_'].name}&caseId=${xzfyId}" target="_blank">接待笔录</a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dd>
		</dl>
		<dl class="z_ml_cont jsMlCont">
			<dt><span class="z_ml_text fl"><a href="#" class="z_jian"></a><a  href="../xzfy/editlian.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}">立案阶段</a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dt>
			<dd><span class="z_ml_text fl"><a  href="../xzfy/viewlian.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}">立案信息</a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dd>
			<#if xzfyInfo.isBuzheng=='1'>
			<dd><span class="z_ml_text fl" ><a href="../xzfy/viewBuzheng.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}" >补正审理信息</a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dd>
			</#if>
			<#assign sdr='1'>
			<#if sdr=='1'>
			<dd><span class="z_ml_text fl" ><a href="../xzfy/viewShouLi.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}" >立案审理信息</a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dd>
			</#if>
			<#if sdr!='1'>
			<dd><span class="z_ml_text fl" ><a href="../xzfy/viewBuShouLi.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}" >结案审理信息</a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dd>
			</#if>
		</dl>
		<#if sdr=='1'>
		<dl class="z_ml_cont jsMlCont">
			<dt><span class="z_ml_text fl"><a href="#" class="z_jian"></a><a href="../xzfy/viewBananMian.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}" >办案阶段</a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dt>
			<dd><span class="z_ml_text fl"><a href="../xzfy/viewBanan.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}" >办案信息</a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dd>
			<#assign isdelay=xzfyInfo.isdelay?default('0')>
			<#assign isstop=xzfyInfo.isstop?default('0')>
			<#if isdelay=="1">
			<dd><span class="z_ml_text fl" style="display:<#if isdelay=="1">block<#else>none</#if>">
			<a href="../xzfy/viewYanqi.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}" >延期审理</a></span><span class="z_ml_num fr"><#if isdelay=="1">${page}<#assign page=page+1></#if></span></dd>
			</#if>
			<#if isstop=="1">
			<dd><span class="z_ml_text fl" ><a href="../xzfy/viewZhongzhi.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}" >中止审理</a></span><span class="z_ml_num fr"><#if isstop=="1">${page}<#assign page=page+1></#if></span></dd>
			<dd><span class="z_ml_text fl" ><a href="../xzfy/viewHuifu.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}" >恢复审理</a></span><span class="z_ml_num fr"><#if isstop=="1">${page}<#assign page=page+1></#if></span></dd>
			</#if>
			<!--
			<dd><span class="z_ml_text fl"><a href="#" >结案审理</a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dd>
			-->
		</dl>
		</#if>
		<dl class="z_ml_cont jsMlCont">
			<dt><span class="z_ml_text fl"><a href="#" class="z_jian"></a><a href="../ajgl/viewAttachment.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}">案卷信息</a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dt>
			<#list attachmentList as a>
			<dd><span class="z_ml_text fl"><a href="${a.realFilePath}" target="_blank"><#if a.inputFileName?has_content>${a.inputFileName}<#else>${a.fileName}</#if></a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dd>
			</#list>
		</dl>

		<dl class="z_ml_cont jsMlCont">
			<dt><span class="z_ml_text fl"><a href="../xzfy/showLogList.action?xzfyId=${xzfyId}&funcCode=${funcCode}" >操作日志</a></span><span class="z_ml_num fr">${page}<#assign page=page+1></span></dt>
		</dl>
	</div>
	</body>
</html>
