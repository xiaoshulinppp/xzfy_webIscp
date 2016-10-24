<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>信息采集报送平台</title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" style="width:98%;">
			<tr>
				<td height="20">信息采集报送平台 > 用户管理 > 用户管理</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>创建用户</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr>
				<th class="thListNormal">&nbsp;</th>
				<th class="thListNormal">&nbsp;</th>
				<th class="thListNormal">&nbsp;</th>
				<th class="thListNormal">&nbsp;</th>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">用户登录名</td>
				<td class="tdFormInput">
					<input type="text" id="userLogName" value="" class="inputTextNormal" message="用户登录名不能为空！" onchange="judgeFormText(this);" />
				</td>
				<td class="tdFormText">用户密码</td>
				<td class="tdFormInput">
					<input type="text" id="userPassword" value="" class="inputTextNormal" message="用户密码不能为空！" onchange="judgeFormText(this);" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">用户名称</td>
				<td class="tdFormInput">
					<input type="text" id="userName" value="" class="inputTextNormal" message="用户名不能为空！" onchange="judgeFormText(this);" />
				</td>
				<td class="tdFormText">确认密码</td>
				<td class="tdFormInput">
					<input type="text" id="confirmPassword" value="" class="inputTextNormal" onchange="judgeFormPassword();" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">用户地址</td>
				<td class="tdFormInput">
					<input type="text" id="userAddress" value="" class="inputTextNormal" message="用户地址不能为空！" onchange="judgeFormText(this);" />
				</td>
				<td class="tdFormText" rowspan="6">用户角色</td>
				<td class="tdFormInput" rowspan="6">
					<table width="98%">
						<#if roleList?size gt 10>
						<#assign column = 3>
						<#else>
						<#assign column = 2>
						</#if>
						<#assign listIndex = 0>
						<tr>
						<#list roleList as data>
						<#if listIndex == column>
						<#assign listIndex = 0>
						</tr>
						<tr>
						</#if>
							<td>
								<input type="checkbox" name="UserRoles" value="${data.id}" />${data.name}
							</td>
						<#assign listIndex = listIndex + 1>
						</#list>
						</tr>
					</table>
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">邮编</td>
				<td class="tdFormInput">
					<input type="text" id="userPostMan" value="" class="inputTextNormal" message="用户地址邮编不能为空！" onchange="judgeFormText(this);" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">用户电话</td>
				<td class="tdFormInput">
					<input type="text" id="userPhone" value="" class="inputTextNormal" message="用户电话不能为空！" onchange="judgeFormText(this);" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">移动电话</td>
				<td class="tdFormInput">
					<input type="text" id="userMobile" value="" class="inputTextNormal" message="用户移动电话不能为空！" onchange="judgeFormText(this);" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">电子邮件</td>
				<td class="tdFormInput">
					<input type="text" id="userEmail" value="" class="inputTextNormal" message="用户电子邮件不能为空！" onchange="judgeFormText(this);" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">用户类型</td>
				<td class="tdFormInput">
					<#assign typeIndex = 0>
					<#list userTypeList as data>
					<input type="radio" name="userType" value="${data.value}" <#if typeIndex == 0>checked="checked"</#if> />${data.name}
					<#assign typeIndex = typeIndex + 1>
					</#list>
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" class="button" value="提 交" onclick="createUser();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>
		</table>
		<form id="createForm" action="../newUser/createUser.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="orgId" value="${orgId}" />
			<input type="hidden" id="hiddenUserLogName" name="user.logName" value="" />
			<input type="hidden" id="hiddenUserName" name="user.name" value="" />
			<input type="hidden" id="hiddenUserPassword" name="user.password" value="" />
			<input type="hidden" id="hiddenUserAddress" name="user.address" value="" />
			<input type="hidden" id="hiddenUserPostMan" name="user.postMan" value="" />
			<input type="hidden" id="hiddenUserPhone" name="user.phone" value="" />
			<input type="hidden" id="hiddenUserMobile" name="user.mphone" value="" />
			<input type="hidden" id="hiddenUserEmail" name="user.email" value="" />
			<input type="hidden" id="hiddenUserRoles" name="selectedRoles" value="" />
			<input type="hidden" id="hiddenUserType" name="user.type" value="" />
		</form>
	</body>
</html>
<script type="text/javascript">
	/*
	 * 返回上一页面
	 */
	function gotoBack(){
		window.history.back();
	}
	
	/*
	 * 创建用户
	 */
	function createUser(){
		var isInfoTrue = false;
		var roles = selectedRoles();
		var type = selectedType();
		isInfoTrue = judgeFormText(window.document.getElementById("userLogName"));
		if(!isInfoTrue){
			return;
		}
		isInfoTrue = judgeFormText(window.document.getElementById("userName"));
		if(!isInfoTrue){
			return;
		}
		isInfoTrue = judgeFormPassword();
		if(!isInfoTrue){
			return;
		}
		isInfoTrue = judgeFormText(window.document.getElementById("userAddress"));
		if(!isInfoTrue){
			return;
		}
		isInfoTrue = judgeFormText(window.document.getElementById("userPostMan"));
		if(!isInfoTrue){
			return;
		}
		isInfoTrue = judgeFormText(window.document.getElementById("userPhone"));
		if(!isInfoTrue){
			return;
		}
		isInfoTrue = judgeFormText(window.document.getElementById("userMobile"));
		if(!isInfoTrue){
			return;
		}
		isInfoTrue = judgeFormText(window.document.getElementById("userEmail"));
		if(!isInfoTrue){
			return;
		}
		isInfoTrue = judgeFormCheckbox();
		if(!isInfoTrue){
			return;
		}
		window.document.getElementById("hiddenUserLogName").value = window.document.getElementById("userLogName").value;
		window.document.getElementById("hiddenUserName").value = window.document.getElementById("userName").value;
		window.document.getElementById("hiddenUserPassword").value = window.document.getElementById("confirmPassword").value;
		window.document.getElementById("hiddenUserAddress").value = window.document.getElementById("userAddress").value;
		window.document.getElementById("hiddenUserPostMan").value = window.document.getElementById("userPostMan").value;
		window.document.getElementById("hiddenUserPhone").value = window.document.getElementById("userPhone").value;
		window.document.getElementById("hiddenUserMobile").value = window.document.getElementById("userMobile").value;
		window.document.getElementById("hiddenUserEmail").value = window.document.getElementById("userEmail").value;
		window.document.getElementById("hiddenUserRoles").value = roles;
		window.document.getElementById("hiddenUserType").value = type;
		if(isInfoTrue){
			window.document.getElementById("createForm").submit();
		}
	}
	
	/*
	 * 获取用户类型
	 */
	function selectedType(){
		var type = "";
		var radioes = window.document.getElementsByName("userType");
		for(var i = 0; i < radioes.length; i++){
			if(radioes[i].checked == true){
				type = radioes[i].value;
				return type;
			}
		}
	}
	
	/*
	 * 获取用户角色
	 */
	function selectedRoles(){
		var checkBoxes = window.document.getElementsByName("UserRoles");
		var trueIndex = 0;
		var index = 0;
		var roles = "";
		for(var i = 0; i < checkBoxes.length; i++){
			if(checkBoxes[i].checked == true){
				trueIndex = i;
			}
		}
		for(var i = 0; i < checkBoxes.length; i++){
			if(checkBoxes[i].checked == true){
				roles += checkBoxes[i].value;
				if(index != trueIndex){
					roles += ",";
				}
			}
			index++;
		}
		return roles;
	}
	
	/*
	 * 表单文本框验证
	 */
	function judgeFormText(textObject){
		if(textObject.value == ""){
			textObject.value = "";
			alert(textObject.message);
			return false;
		}else{
			return true;
		}
	}
	
	/*
	 * 表单复选框认证
	 */
	function judgeFormCheckbox(){
		var checkBoxes = window.document.getElementsByName("UserRoles");
		var trueIndex = 0;
		var index = 0;
		var roles = "";
		for(var i = 0; i < checkBoxes.length; i++){
			if(checkBoxes[i].checked == true){
				trueIndex = i;
			}
		}
		for(var i = 0; i < checkBoxes.length; i++){
			if(checkBoxes[i].checked == true){
				roles += checkBoxes[i].value;
				if(index != trueIndex){
					roles += ",";
				}
			}
			index++;
		}
		if(roles == ""){
			alert("请选择用户角色！");
			return false;
		}else{
			return true;
		}
	}
	
	/*
	 * 用户表单密码验证
	 */
	function judgeFormPassword(){
		var password = window.document.getElementById("userPassword").value;
		var confirmPassword = window.document.getElementById("confirmPassword").value;
		if(password == ""){
			alert("密码不能为空！");
			return false;
		}else if(confirmPassword == ""){
			alert("请确认密码！");
			return fales;
		}else{
			if(password != confirmPassword){
				alert("密码不一致！");
				return false;
			}else{
				return true;
			}
		}
	}
</script>