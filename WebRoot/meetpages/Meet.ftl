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
		<form id="createForm" action="../meet/saveNewApp1" method="post" >
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr class="trwhite">
				<td class="tdFormText">姓名</td>
				<td class="tdFormInput">
					<input type="text" name="Client.Client_name" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText"> 身份证号码</td>
				<td class="tdFormInput">
					<input type="text" name="Client.Client_idcard" value="" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">通邮地址</td>
				<td class="tdFormInput">
					<input type="text" name="Client.Client_address" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">性别</td>
				<td class="tdFormInput">
					<select name="Client.Client_sex">
					<option value="1" >男</option>
					<option value="2" >女</option>
					</select>
				</td>
			</tr>
			<input type="hidden" id="protype" name="protype" value="${protype}">
			<tr class="trwhite">
				<td class="tdFormText">邮政编码</td>
				<td class="tdFormInput">
					<input type="text" name="Client.Client_zipcode" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">电话号码</td>
				<td class="tdFormInput">
					<input type="text" name="Client.Client_phonenum" value="" class="inputTextNormal" />
				</td>
			</tr>
			 <td class="tdFormText">被接待人意见：<br>(鼠标双击添加对话)</td>
    <td class="tdFormInput">
    <textarea name="app_face.otheradvice" id="otheradvice" class="textarea" style="overflow-y:visible;" altname="意见" ondblclick="getValue1(this)"></textarea>
    </td>
			
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="提 交" onclick="createClient();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>

			<input type="hidden" name="Main_id" value="${Main_id}"/>
			<input type="hidden" name="textId" <#if textId ?has_content>value="${textId}"</#if>>
			<input type="hidden" name="countId"<#if countId ?has_content>value="${countId}"</#if>>
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="Client.proxytype" value="1" />
		</form>
		</table>
	</body>
</html>
<script type="text/javascript">
	function createClient(){
		if(confirm("确认提交？")){
			window.document.getElementById("sunbt").disabled=true;;
			window.document.getElementById("createForm").submit();
		}
	}
	
	function gotoBack(){
		window.history.back();
	}
</script>