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
		<form name="appForm" id="appForm" action="createLegal1.action">
		<input type="hidden" name="Main_id" value="${Main_id}">
		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" id="clientid" name="clientid" value="">
		<input type="hidden" id="protype" name="protype" value="${protype}">
		<input type="hidden" name="textId" <#if textId ?has_content>value="${textId}"</#if>>
		<input type="hidden" name="countId"<#if countId ?has_content>value="${countId}"</#if>>

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
				<th class="thListNormal" width="15%">住所地</th>
				<th class="thListNormal" width="10%">邮编</th>
				<th class="thListNormal" width="15%">电话</th>
				<th class="thListNormal" width="10%">操作</th>
				
			</tr>
			<#assign index = 1>
			<#list ClientList as data>
			<tr class="trColor">
				<td class="tdlistCenter">
				<#if data.Client_name?has_content>
				${data.Client_name}
				</#if></td>
				
				<td class="tdlistCenter">
				<#if data.Client_address?has_content>${data.Client_address}</#if></td>
				
				<td class="tdlistCenter">
				<#if data.Client_zipcode?has_content>${data.Client_zipcode}</#if></td>
				
				<td class="tdlistCenter">
				<#if data.Client_phonenum?has_content>${data.Client_phonenum}</#if></td>
							
				<td class="tdlistCenter">
				<a href="javascript:updateApp1('${data.clientid}')">修改</a>&nbsp;
				<a href="javascript:deleteApp1('${data.clientid}')">删除</a>
				
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
	countObj.value=${Face_allnumber};
		function gotoCreateApp(){
			document.appForm.submit();
		}
		
		function deleteApp(id){
			if(confirm("您确认要删除吗？")){
				document.getElementById("clientid").value=id;
				document.appForm.action="deleteLegal1.action";
				document.appForm.submit();
			}
		}
		
		function updateApp(id){
				document.getElementById("clientid").value=id;
				document.appForm.action="updateLegal1.action";
				document.appForm.submit();
		}
	</script>
	