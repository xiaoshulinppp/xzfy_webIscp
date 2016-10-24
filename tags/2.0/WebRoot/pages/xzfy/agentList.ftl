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
		<form name="agentForm" id="agentForm" action="createAgent.action">
		<input type="hidden" name="xzfyId" value="${xzfyId}">
		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" id="agentId" name="agentId" value="">
		<input type="hidden" id="textId" name="textId" value="${textId}">
		<input type="hidden" id="countId" name="countId" value="${countId}">	
		<input type="hidden" id="protype" name="protype" value="${protype}">
		<input id="sendValue" name="sendValue" type="hidden" <#if sendValue?has_content> value="${sendValue}" </#if>>
		
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
			<tr>
				<td align="right">
				<#if agentList.size()<2>
					<input type="button" value="新 增" class="button" onclick="gotoCreateAgent();" />
				</#if>
				</td>
			</tr>
		</table>
		</form>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabout">
			<tr>
				<th class="thListNormal" width="15%">姓名</th>
				<th class="thListNormal" width="15%">身份证号(执业证号)</th>
				<th class="thListNormal" width="30%">通讯地址</th>
				<th class="thListNormal" width="30%">电话号码</th>
				<th class="thListNormal" width="10%">操作</th>
				
			</tr>
			<#list agentList as data>
			<#assign index = 1>
			<tr class="trColor">
				<td class="tdlistCenter">
				<#if data.agent_name?has_content>
				${data.agent_name}
				</#if></td>
				<td class="tdlistCenter">
				<#if data.proxytype=='1'>
				<#if data.cer_no?has_content>${data.cer_no}</#if>
				<#else>
				<#if data.agent_id?has_content>${data.agent_id}</#if>
				</#if>
				</td>
				<td class="tdlistCenter"><#if data.mail_address?has_content>${data.mail_address}</#if></td>
				<td class="tdlistCenter"><#if data.mobile?has_content>${data.mobile}</#if></td>
				<td class="tdlistCenter">
				<a href="javascript:updateAgent('${data.id}','${data.proxytype}')">修改</a>&nbsp;
				<a href="javascript:deleteAgent('${data.id}')">删除</a>
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
	countObj.value=${agentCount};
		function gotoCreateAgent(){
			document.agentForm.submit();
		}
		
		function deleteAgent(id){
			if(confirm("您确认要删除吗？")){
				
				document.getElementById("agentId").value=id;
				document.agentForm.action="deleteAgent.action";
				document.agentForm.submit();
			}
		}
		
		function updateAgent(id,type){
				document.getElementById("agentId").value=id;
				document.getElementById("protype").value=type;
				document.agentForm.action="updateAgent.action";
				document.agentForm.submit();
		}
	</script>
	