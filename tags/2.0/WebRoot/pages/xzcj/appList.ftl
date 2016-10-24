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
		<form name="appForm" id="appForm" action="createApp.action">
		<input type="text" name="xzcjId" value="${xzcjId}" />
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
				<th class="thListNormal" width="15%">姓名</th>
				<th class="thListNormal" width="15%">身份证号码</th>
				<th class="thListNormal" width="10%">性别</th>
				<th class="thListNormal" width="25%">通邮地址</th>
				<th class="thListNormal" width="10%">邮政编码</th>
				<th class="thListNormal" width="15%">电话号码</th>
				<th class="thListNormal" width="10%">操作</th>
				
			</tr>
			<#assign index = 1>
			<#list appList as xzcjApp>
			<tr class="trColor">
				<td class="tdlistCenter"><#if xzcjApp.app_name?has_content>${xzcjApp.app_name}</#if></td>
				<td class="tdlistCenter"><#if xzcjApp.app_id?has_content>${xzcjApp.app_id}</#if></td>
				<td class="tdlistCenter">
					<#if xzcjApp.sexy?has_content>
					<#if xzcjApp.sexy=='1'>
						男
					<#else>
						女
					</#if>
					</#if>
				</td>
				<td class="tdlistCenter"><#if xzcjApp.mail_address?has_content>${xzcjApp.mail_address}</#if></td>
				<td class="tdlistCenter"><#if xzcjApp.mobile?has_content>${xzcjApp.mobile}</#if></td>
				<td class="tdlistCenter"><#if xzcjApp.postcode?has_content>${xzcjApp.postcode}</#if></td>
				<td class="tdlistCenter">
					<a href="javascript:updateApp('${xzcjApp.id}')">修改</a>&nbsp;
					<a href="javascript:deleteApp('${xzcjApp.id}')">删除</a>
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
	//countObj.value=;
		function gotoCreateApp(){
			document.appForm.submit();
		}
		
		function deleteApp(id){
			if(confirm("您确认要删除吗？")){
				document.getElementById("appId").value=id;
				document.appForm.action="deleteApp.action";
				document.appForm.submit();
			}
		}
		
		function updateApp(id){
				document.getElementById("appId").value=id;
				document.appForm.action="updateApp.action";
				document.appForm.submit();
		}
	</script>
	