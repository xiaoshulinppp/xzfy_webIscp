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
		<form id="createForm" action="../jdaj/saveApp.action" method="post" >
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr class="trwhite">
				<td class="tdFormText">姓名</td>
				<td class="tdFormInput">
					<input type="text" name="jdajApp.name" value="" class="inputTextNormal" id="name"/>
				</td>
				<td class="tdFormText">性别</td>
				<td class="tdFormInput">
					<select name="jdajApp.sex">
					<option value="1" >男</option>
					<option value="2" >女</option>
				</select>
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">身份证号码</td>
				<td class="tdFormInput">
					<input type="text" name="jdajApp.idNumber" class="inputTextNormal" />
				</td>
				<td class="tdFormText">住所地</td>
				<td class="tdFormInput">
				<input type="text" name="jdajApp.address" id="address" class="inputTextNormal" />
				</td>
				
			</tr>

			<tr class="trwhite">
				<td class="tdFormText">通讯地址</td>
				<td class="tdFormInput">
					<input type="text" name="jdajApp.postalAddress" id="postalAddress" class="inputTextNormal" />
					<input type="button" id="btn" value="同住所地" onClick="auto()">
				</td>
				<td class="tdFormText">邮编</td>
				<td class="tdFormInput">
					<input type="text" name="jdajApp.postCode" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">固定电话</td>
				<td class="tdFormInput">
					<input type="text" name="jdajApp.teleNumber" class="inputTextNormal" />
				</td>
				<td class="tdFormText">手机</td>
				<td class="tdFormInput">
					<input type="text" name="jdajApp.phoneNumber" class="inputTextNormal" />
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sub" class="button" value="提 交" onclick="createApp();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>
			<input type="hidden" name="isModify" value="${isModify}">
			<input type="hidden" name="jdajId" value="${jdajId}" />
			<input type="hidden" name="funcCode" value="${funcCode}"/>
			<input type="hidden" id="textId" name="textId" value="${textId}">
		</form>
		</table>
	</body>
</html>
<script type="text/javascript">
	function createApp(){
	    if(document.getElementById("name").value==""){
	    alert("请填写申请人姓名");
	    }else{
	    if(confirm("确认提交？")){
			window.document.getElementById("sub").disabled=true;;
			window.document.getElementById("createForm").submit();
		}
		}
	}
	function auto(){
	    if(document.getElementById("address").value==""){
	      alert("请先填写住所地！");
	    }else{
	        document.getElementById("postalAddress").value=document.getElementById("address").value;
	    }
	}
	function gotoBack(){
		window.history.back();
	}
</script>