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
		<input type="hidden" name="jdajId" value="${jdajId}">
		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" id="textId" name="textId" value="${textId}">
		<input type="hidden" name="isModify" value="${isModify}">
		<input type="hidden" name="appId" id="appId">
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
				<th class="thListNormal">姓名</th>
				<th class="thListNormal">性别</th>				
				<th class="thListNormal">身份证号码</th>
				<th class="thListNormal">住所地</th>
				<th class="thListNormal">通讯地址</th>
				<th class="thListNormal">邮码</th>
				<th class="thListNormal">固定电话</th>
				<th class="thListNormal">手机</th>
				<th class="thListNormal">操作</th>	
			</tr>
			<#assign index = 1>
			<#list appList as data>
			<tr class="trColor">
				<td class="tdlistCenter">
				<#if data.name?has_content>
				${data.name}
				</#if></td>
				<td class="tdlistCenter">
				<#if data.sex=="1">男<#else>女</#if></td>				
				<td class="tdlistCenter">
				<#if data.idNumber?has_content>${data.idNumber}</#if></td>
				<td class="tdlistCenter">
				<#if data.address?has_content>${data.address}</#if></td>
				<td class="tdlistCenter">
				<#if data.postalAddress?has_content>${data.postalAddress}</#if></td>
				<td class="tdlistCenter">
				<#if data.postCode?has_content>${data.postCode}</#if></td>
				<td class="tdlistCenter">
				<#if data.teleNumber?has_content>${data.teleNumber}</#if></td>
				<td class="tdlistCenter">
				<#if data.phoneNumber?has_content>${data.phoneNumber}</#if></td>
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
	    tObj.value = document.getElementById('sendValue').value;
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
	