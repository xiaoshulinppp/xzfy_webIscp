<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>行政复议信息管理系统</title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<link href="../${Session['_USER_STYLE_'].cssPath}/notice_style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<input type="hidden" name="funcCode" value="${funcCode}" />
		<table border="0" align="center" cellpadding="0" cellspacing="0" class="successTab">
			<tr>
				<td valign="top" class="titleTopTd">
					<div class="titleChn">系统提示</div>
				</td>
			</tr>
			<tr>
				<td valign="top">
					<table width="300" border="0" align="right" cellpadding="0" cellspacing="5" class="successWordTab">
						<tr>
							<td class="noticeWord">${messageContent?default('')}</td>
						</tr>
						<tr>
							<td align="right">
								<input type="button" class="button" value="确 定" onclick="gotoBack();" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
<script type="text/javascript">
	function gotoBack(){
		var actionUrl = "../dxal/dxal_list.action&funcCode=${funcCode}";
		window.location.href = actionUrl;
	}
	
	window.onload = function(){
		${onloadCode?default('')}
	}
</script>