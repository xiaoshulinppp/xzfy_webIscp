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
		<form id="createForm" action="../meet/appFYfaceInsert1" method="post" >
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr class="trwhite">
				<td class="tdFormText">来信人姓名</td>
				<td class="tdFormInput">
					<input type="text" name="Client.Client_name" value="" class="inputTextNormal" />
				</td>
    			<td class="tdFormText" width="25%">收到来信日期</td>
    			<td class="tdFormInput" width="25%">
    			<input name="Meet.Face_time" type="text"
    			class="inputTextNormal"  value="${todate}"
    			onClick="WdatePicker()" altname="接待时间" >
      			</td>
  			</tr>
			<tr class="trwhite">
				<td class="tdFormText">来信人通信地址</td>
				<td class="tdFormInput">
				<input type="text" name="Client.Client_address" value="" class="inputTextNormal" />
			    </td>
			    <td class="tdFormText">来信人邮编</td>
				<td class="tdFormInput">
					<input type="text" name="Meet.Face_allnumber" value="" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">来信人电话</td>
				<td class="tdFormInput">
				<input type="text" name="Client.Client_address" value="" class="inputTextNormal" />
			    </td>
			    <td class="tdFormText">来文编号</td>
				<td class="tdFormInput">
					<input type="text" name="Meet.Face_allnumber" value="" class="inputTextNormal" />
				</td>
			</tr>
 <tr class="trcolor">
 <td class="tdFormText">来信主要内容：<br>(鼠标双击添加对话)</td>
    <td class="tdFormInput" colspan=3>
        <textarea name="Meet.Face_content" id="otheradvice" class="textarea" style="overflow-y:visible;" altname="意见" ondblclick="getValue1(this)"></textarea>
    </td>
 </tr>
			<input type="hidden" id="protype" name="protype" value="${protype}">
			
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="提 交" onclick="createClient();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="接收监督案件" onclick="createClient();" />
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