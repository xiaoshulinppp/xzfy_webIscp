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
		<form id="createForm" action="../xzfy/saveNewLegal.action" method="post" >
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr class="trwhite">
				<td class="tdFormText">申请人</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.app_name" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">代表人名称</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.deputyName" value="" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">代表人类别</td>
				<td class="tdFormInput">
					<@ww.select  name="'xzfyApp.deputyType'" id="deputy_type" headerKey="''" headerValue=""  list="getDictMap('dbrlb')" value="" />
				</td>
				<td class="tdFormText">住所地</td>	
				<td class="tdFormInput">
				<input type="text" name="xzfyApp.Address" value="" class="inputTextNormal" />
			
				</td>
			</tr>
			<input type="hidden" id="protype" name="protype" value="${protype}">
			<tr class="trwhite">
				<td class="tdFormText">邮编</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.postcode" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">电话</td>
				<td class="tdFormInput">
					<input type="text" name="xzfyApp.mobile" value="" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">其他情形</td>
				<td class="tdFormInput">
					<@ww.select  name="'xzfyApp.otherType'" id="other_type" headerKey="''" headerValue=""  list="getDictMap('qtqx')" value="" />
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