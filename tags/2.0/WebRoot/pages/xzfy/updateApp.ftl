<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>申请人管理</title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
	</head>
	<body>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>修改</td>
			</tr>
		</table>
		<form id="createForm" action="../xzfy/doUpdateApp.action" method="post" >
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr class="trwhite">
				<td class="tdFormText">姓名</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.app_name" value="${xzfyApp.app_name}" class="inputTextNormal" />
				</td>
				<td class="tdFormText"> 身份证号码</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.app_id" value="${xzfyApp.app_id?default("")}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">通邮地址</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.mail_address" value="${xzfyApp.mail_address?default("")}" class="inputTextNormal" />
				</td>
				<td class="tdFormText">性别</td>
				<td class="tdFormInput">
					<select name="xzfyApp.sexy">
					<option value="1" <#if xzfyApp.sexy=='1'>selectd</#if>>男</option>
					<option value="2" <#if xzfyApp.sexy=='2'>selectd</#if>>女</option>
					</select>
				</td>
			</tr>
			<input type="hidden" id="protype" name="protype" value="${protype?default("")}">
			<tr class="trwhite">
				<td class="tdFormText">邮政编码</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.postcode" value="${xzfyApp.postcode?default("")}" class="inputTextNormal" />
				</td>
				<td class="tdFormText">电话号码</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.mobile" value="${xzfyApp.mobile?default("")}" class="inputTextNormal" />
				</td>
			</tr>
			
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="提 交" onclick="createApp();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>
		</table>
			<input type="hidden" name="xzfyId" value="${xzfyId}" />
			<input type="hidden" name="xzfyApp.id" value="${xzfyApp.id}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="xzfyApp.proxytype" value="${protype}" />
			<input type="hidden" name="textId" value="${textId}" />
			<input type="hidden" name="countId" value="${countId}">
		</form>
	</body>
</html>
<script type="text/javascript">
	function createApp(){
		if(confirm("确认提交？")){
			window.document.getElementById("sunbt").disabled=true;;
			window.document.getElementById("createForm").submit();
		}
	}
	
	function gotoBack(){
		window.history.back();
	}
</script>