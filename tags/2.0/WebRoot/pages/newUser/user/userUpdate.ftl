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
				<td height="20">信息采集报送平台 > 用户管理 > 修改用户</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>修改用户</td>
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
				<td class="tdFormText">用户ID</td>
				<td class="tdFormInput">
					<input type="text" value="" class="inputTextNormal" readonly="true" />
				</td>
				<td class="tdFormText">用户登录名</td>
				<td class="tdFormInput">
					<input type="text" id="userLogName" value="" class="inputTextNormal" message="用户登录名不能为空！" onchange="judgeFormText(this);" />
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
		</table>
	</body>
</html>