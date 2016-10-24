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
      <h1 class="ui-title-cnt fn-left">申请人信息修改</h1></div>
		<form id="updateForm" action="../jdaj/doUpdateApp.action" method="post" >
		<input type="hidden" name="jdajApp.id" value="${jdajApp.id}" />
		<input type="hidden" id="textId" name="textId" value="${textId}">
		<div class="z_info"> 
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
			<tr>
				<th>姓名</th>
				<td>
					<input type="text" name="jdajApp.name" value="<#if jdajApp.name?has_content>${jdajApp.name}</#if>" class="inputTextNormal" />
				</td>
				<th>性别</th>
				<td>
					<select name="jdajApp.sex">
					<option value="1" <#if jdajApp.sex=="1">selected</#if>>男</option>
					<option value="2" <#if jdajApp.sex=="2">selected</#if>>女</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>身份证号码</th>
				<td>
					<input type="text" name="jdajApp.idNumber" value="<#if jdajApp.idNumber?has_content>${jdajApp.idNumber}</#if>" class="inputTextNormal" />
				</td>
				<th>住所地</th>
				<td>
				<input type="text" name="jdajApp.address" id="address" value="<#if jdajApp.address?has_content>${jdajApp.address}</#if>" class="inputTextNormal" />
				</td>
				
			</tr>

			<tr>
				<th>通讯地址</th>
				<td>
					<input type="text" name="jdajApp.postalAddress" id="postalAddress" class="inputTextNormal" value="<#if jdajApp.postalAddress?has_content>${jdajApp.postalAddress}</#if>"/>
					<input type="button" id="btn" value="同住所地" onClick="auto()">
				</td>
				<th>邮编</th>
				<td>
					<input type="text" name="jdajApp.postCode" value="<#if jdajApp.postCode?has_content>${jdajApp.postCode}</#if>" class="inputTextNormal" />
				</td>
			</tr>
			<tr>
				<th>固定电话</th>
				<td>
					<input type="text" name="jdajApp.teleNumber" value="<#if jdajApp.teleNumber?has_content>${jdajApp.teleNumber}</#if>" class="inputTextNormal" />
				</td>
				<th>手机</th>
				<td>
					<input type="text" name="jdajApp.phoneNumber" value="<#if jdajApp.phoneNumber?has_content>${jdajApp.phoneNumber}</#if>" class="inputTextNormal" />
				</td>
			</tr>
		</table>
		</div>
		<div class="align-center">
					<input type="button" id="sub" class="button" value="提 交" onclick="updateApp();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
		</div>
			<input type="hidden" name="jdajId" value="${jdajId}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
		</form>
		</table>
	</body>
</html>
<script type="text/javascript">
	function updateApp(){
		if(confirm("确认修改？")){
			window.document.getElementById("sub").disabled=true;;
			window.document.getElementById("updateForm").submit();
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