<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
	</head>
	<body>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>添加</td>
			</tr>
		</table>
		<form id="createForm" action="../xzcj/saveNewApp.action" method="post" >
		<input type="hidden" name="xzcjId" value="${xzcjId}" />
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr class="trwhite">
				<td class="tdFormText">姓名</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjApp.app_name" value="<#if xzcjApp.app_name?has_content>${xzcjApp.app_name}</#if>" class="inputTextNormal" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*必填项
				</td>
				<td class="tdFormText">性别</td>
				<td class="tdFormInput">
					<select name="xzcjApp.sexy">
					<option value="1" <#if xzcjApp.sexy == "1" >selected</#if> >男</option>
					<option value="2" <#if xzcjApp.sexy == "2" >selected</#if> >女</option>
					</select>
				</td>
				
			</tr>
			<tr class="trwhite">
				<td class="tdFormText"> 身份证号码</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjApp.app_id" value="<#if xzcjApp.app_id?has_content>${xzcjApp.app_id}</#if>" class="inputTextNormal" />
				</td>
				<td class="tdFormText">住所地</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjApp.address" value="<#if xzcjApp.address?has_content>${xzcjApp.address}</#if>" class="inputTextNormal" />
				</td>
				
				
			</tr>
			<!--
			<input type="hidden" id="protype" name="protype" value="${protype}">
			-->
			<tr class="trwhite">
				<td class="tdFormText">通邮地址</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjApp.mail_address" value="<#if xzcjApp.mail_address?has_content>${xzcjApp.mail_address}</#if>" class="inputTextNormal" />
				</td>
				<td class="tdFormText">电话号码</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjApp.telephone" value="<#if xzcjApp.telephone?has_content>${xzcjApp.telephone}</#if>" class="inputTextNormal" />
				</td>
				
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">手机号码</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjApp.mobile" value="<#if xzcjApp.mobile?has_content>${xzcjApp.mobile}</#if>" class="inputTextNormal" />
				</td>
				<td class="tdFormText">邮政编码</td>
				<td class="tdFormInput">
					<input type="text" name="xzcjApp.postcode" value="<#if xzcjApp.postcode?has_content>${xzcjApp.postcode}</#if>" class="inputTextNormal" />
				</td>
				
			</tr>
			
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="修改" onclick="updateApp();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>
			
			<input type="hidden" name="textId" value="${textId}" />
			<input type="hidden" name="countId" value="${countId}">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="xzfyApp.proxytype" value="1" />
		</form>
		</table>
	</body>
</html>
<script type="text/javascript">
	function updateApp(){
		if(confirm("确认修改？")){
			window.document.getElementById("sunbt").disabled=true;;
			window.document.getElementById("createForm").submit();
		}
	}
	
	function gotoBack(){
		window.history.back();
	}
</script>