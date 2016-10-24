<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
		<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>
	</head>
	<body>

		<div class="ui-title fn-clear">
     	<span class="ui-title-icon fn-left"><img src="../sys_theme/images/icons/crumb.png"/></span>
      	<h2 class="ui-title-cnt fn-left">申请人管理</h2>  
       </div>
		<form name="appForm" id="appForm" action="createApp.action">
		<input type="hidden" name="jdajId" value="${jdajId}">
		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" id="textId" name="textId" value="${textId}">
		<input type="hidden" name="isModify" value="${isModify}">
		<input type="hidden" name="appId" id="appId">
		<input id="sendValue" name="sendValue" type="hidden" <#if sendValue?has_content> value="${sendValue}" </#if>>
		<input type="button" value="添加" class="ui-btn ui-btn-yellow" onClick="gotoCreateApp()"/>
		<div class="ui-list-nobtnbar fn-clear ">
		<table class="ui-table  ui-table-list  list-fixed " >
			<tr>
				<th>姓名</th>
				<th>性别</th>				
				<th>身份证号码</th>
				<th>住所地</th>
				<th>通讯地址</th>
				<th>邮码</th>
				<th>固定电话</th>
				<th>手机</th>
				<th>操作</th>	
			</tr>
			<#assign index = 1>
			<#list appList as data>
			<tr>
				<td>
				<#if data.name?has_content>
				${data.name}
				</#if></td>
				<td>
				<#if data.sex=="1">男<#else>女</#if></td>				
				<td>
				<#if data.idNumber?has_content>${data.idNumber}</#if></td>
				<td>
				<#if data.address?has_content>${data.address}</#if></td>
				<td>
				<#if data.postalAddress?has_content>${data.postalAddress}</#if></td>
				<td>
				<#if data.postCode?has_content>${data.postCode}</#if></td>
				<td>
				<#if data.teleNumber?has_content>${data.teleNumber}</#if></td>
				<td>
				<#if data.phoneNumber?has_content>${data.phoneNumber}</#if></td>
				<td>
				<a href="javascript:updateApp('${data.id}')">修改</a>&nbsp;
				<a href="javascript:deleteApp('${data.id}')">删除</a>				
				</td>				
			</tr>
			<#assign index = index + 1>
			</#list>
	    
		</table>
		</form>
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
	