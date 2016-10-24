<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>已添加记录</td>
			</tr>
		</table>
		<form name="appForm" id="appForm" action="createLegal.action">
		<input type="hidden" name="xzfyId" value="${xzfyId}">
		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" id="appId" name="appId" value="">
		<input type="hidden" id="protype" name="protype" value="${protype}">
		<input type="hidden" id="textId" name="textId" value="${textId}">
		<input type="hidden" id="countId" name="countId" value="${countId}">
		<input id="sendValue" name="sendValue" type="hidden" <#if sendValue?has_content> value="${sendValue}" </#if>>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
			<tr>
				<td align="right">
					<input type="button" value="新 增" class="button" onclick="gotoCreateApp();" />
				</td>
			</tr>
		</table>
		</form>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabout">
			<tr>
				<th class="thListNormal" width="15%">申请人</th>
				<th class="thListNormal" width="15%">代表人名称</th>
				<th class="thListNormal" width="10%">代表人类别</th>
				<th class="thListNormal" width="15%">住所地</th>
				<th class="thListNormal" width="10%">代表人类别</th>
				<th class="thListNormal" width="15%">电话</th>
				<th class="thListNormal" width="15%">其他情形</th>
				<th class="thListNormal" width="10%">操作</th>
			</tr>
			<#assign index = 1>
			<#list appList as data>
			<tr class="trColor">
				<td class="tdlistCenter">
				<#if data.app_name?has_content>
				${data.app_name}
				</#if></td>
				
				<td class="tdlistCenter">
				<#if data.deputyName?has_content>${data.deputyName}</#if></td>

				<td class="tdlistCenter">
				<#if data.deputyType?has_content>
				<#if data.deputyType=="1">
				法定代表人
				<#elseif data.deputyType=="2">
				负责人
				<#elseif data.deputyType=="3">
				执行合伙事务的合伙人
				<#elseif data.deputyType=="4">
				合伙人
				<#elseif data.deputyType=="5">
				主要负责人
				<#elseif data.deputyType=="6">
				被共同推选的非法人组织其他成员
				</#if>
				</#if></td>
				
				<td class="tdlistCenter">
				<#if data.address?has_content>${data.address}</#if></td>
				
				<td class="tdlistCenter">
				<#if data.postcode?has_content>${data.postcode}</#if></td>
				
				<td class="tdlistCenter">
				<#if data.mobile?has_content>${data.mobile}</#if></td>
				
				<td class="tdlistCenter">
				<#if data.otherType?has_content>
				<#if data.otherType=="1">
				由股东代表大会以股份制企业名义提出申请
				<#elseif data.otherType=="2">
				由董事会以股份制企业名义提出申请
				<#elseif data.otherType=="3">
				其他
				<#elseif data.otherType=="0">
				无
				</#if>
				</#if>
				</td>
	
				<td class="tdlistCenter">
				<a href="javascript:updateApp('${data.id}')">修改</a>&nbsp;
				<a href="javascript:deleteApp('${data.id}')">删除</a>
				</td>
				
			</tr>
			<#assign index = index + 1>
			</#list>
	
		</table>
	<script>
	var api = frameElement.api, W = api.opener, D = W.document; // api.opener 为载加lhgdialog.min.js文件的页面的window对象
	var tObj = D.getElementById('${textId}'); // 通过数据共享的方法获取调用页面文本框对象
	var countObj=D.getElementById('${countId}');
	tObj.value = document.getElementById('sendValue').value;
	countObj.value=${appCount};
	
		function gotoCreateApp(){
			document.appForm.submit();
		}
		
		function deleteApp(id){
			if(confirm("您确认要删除吗？")){
				document.getElementById("appId").value=id;
				document.appForm.action="deleteLegal.action";
				document.appForm.submit();
			}
		}
		
		function updateApp(id){
				document.getElementById("appId").value=id;
				document.appForm.action="updateLegal.action";
				document.appForm.submit();
		}
	</script>
	