<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../css/style_form.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
	</head>
	<body>
		<div class="ui-title fn-clear">
      <h1 class="ui-title-cnt fn-left">申请人信息录入</h1></div>
		<form id="createForm" action="../jdaj/saveApp.action" method="post" >
		<div class="z_info"> 
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
			<tr>
				<th>姓名</th>
				<td>
					<input type="text" name="jdajApp.name" value="" class="inputTextNormal" id="name"/>
				</td>
				<th>性别</th>
				<td>
					<select name="jdajApp.sex">
					<option value="1" >男</option>
					<option value="2" >女</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>身份证号码</td>
				<td>
					<input type="text" name="jdajApp.idNumber" class="inputTextNormal" />
				</td>
				<th>住所地</th>
				<td>
				<input type="text" name="jdajApp.address" id="address" class="inputTextNormal" />
				</td>
				
			</tr>

			<tr>
				<th>通讯地址</th>
				<td>
					<input type="text" name="jdajApp.postalAddress" id="postalAddress" class="inputTextNormal" />
					<input type="button" id="btn" value="同住所地" onClick="auto()">
				</td>
				<th>邮编</th>
				<td>
					<input type="text" name="jdajApp.postCode" class="inputTextNormal" />
				</td>
			</tr>
			<tr>
				<th>固定电话</th>
				<td>
					<input type="text" name="jdajApp.teleNumber" class="inputTextNormal" />
				</td>
				<th>手机</th>
				<td>
					<input type="text" name="jdajApp.phoneNumber" class="inputTextNormal" />
				</td>
			</tr>
		</table>
		</div>
		<div class="align-center">  
					<input type="button" id="sub" class="button" value="提 交" onclick="createApp();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
		</div>
			<input type="hidden" name="isModify" value="${isModify}">
			<input type="hidden" name="jdajId" value="${jdajId}" />
			<input type="hidden" name="funcCode" value="${funcCode}"/>
			<input type="hidden" id="textId" name="textId" value="${textId}">
		</form>
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