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
		<form id="createForm" action="../xzfy/saveNewApp.action" method="post" >
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr class="trwhite">
				<td class="tdFormText">姓名</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.app_name" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText"> 身份证号码</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.app_id" value="" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">住所地</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.address" id="address" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">性别</td>
				<td class="tdFormInput">
					<select name="xzfyApp.sexy">
					<option value="1" >男</option>
					<option value="2" >女</option>
					</select>
				</td>
			</tr>
			<input type="hidden" id="protype" name="protype" value="${protype}">
			<tr class="trwhite">
				<td class="tdFormText">通邮地址</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.mail_address" id="mail_address" value="" class="inputTextNormal" />
					<input type="button" value="同住所地" onclick="setMa()" class="button"/>
				</td>
				<td class="tdFormText">电话号码</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.mobile" value="" class="inputTextNormal" />
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
			<input type="hidden" name="textId" value="${textId}" />
			<input type="hidden" name="countId" value="${countId}">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="xzfyApp.proxytype" value="1" />
		</form>
	</body>
</html>
<script type="text/javascript">
	function setMa(){
		window.document.getElementById("mail_address").value = window.document.getElementById("address").value;
	}

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