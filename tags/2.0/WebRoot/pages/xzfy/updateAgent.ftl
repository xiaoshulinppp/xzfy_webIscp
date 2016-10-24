<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>代理人管理</title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
	</head>
	<body>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>修改</td>
			</tr>
		</table>
		<form id="createForm" action="../xzfy/doUpdateAgent.action" method="post" >
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr class="trwhite">
				<td class="tdFormText">姓名</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyAgent.agent_name" value="${xzfyAgent.agent_name}" class="inputTextNormal" />
				</td>
				
				<#if protype=='1'>
					<td class="tdFormText">执业证号</td>
					<td class="tdFormInput">
						<input type="text" name="xzfyAgent.cer_no" value="${xzfyAgent.cer_no?default("")}" class="inputTextNormal" />
					</td>
				<#else>
					<td class="tdFormText">身份证号</td>
					<td class="tdFormInput">
						<input type="text" name="xzfyAgent.agent_id" value="${xzfyAgent.agent_id?default("")}" class="inputTextNormal" />
					</td>
				</#if> 
				
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">通邮地址</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyAgent.mail_address" value="${xzfyAgent.mail_address}" class="inputTextNormal" />
				</td>
				<td class="tdFormText">电话号码</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyAgent.mobile" value="${xzfyAgent.mobile}" class="inputTextNormal" />
				</td>
			</tr>
			<#if protype=='1'>
			<tr class="trwhite">
				<td class="tdFormText">所在律所</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyAgent.work_address"  value="${xzfyAgent.work_address?default("")}" class="inputTextNormal" />
				</td>
				<td class="tdFormText">&nbsp;</td>
				<td class="tdFormInput">&nbsp;</td>
			</tr>
			</#if>
			<input type="hidden" id="protype" name="protype" value="${protype}">
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="提 交" onclick="createAgent();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>
		</table>
			<input type="hidden" name="xzfyId" value="${xzfyId}" />
			<input type="hidden" name="xzfyAgent.id" value="${xzfyAgent.id}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="xzfyAgent.proxytype" value="${protype}" />
			<input type="hidden" name="textId" value="${textId}" />
			<input type="hidden" name="countId" value="${countId}">
		</form>
	</body>
</html>
<script type="text/javascript">
	function createAgent(){
		if(confirm("确认提交？")){
			window.document.getElementById("sunbt").disabled=true;;
			window.document.getElementById("createForm").submit();
		}
	}
	
	function gotoBack(){
		window.history.back();
	}
</script>