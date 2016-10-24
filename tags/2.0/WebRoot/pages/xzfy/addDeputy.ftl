<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
				<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
		<link href="../css/style_form.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>	
		<form name="appForm" id="appForm" action="saveDeputy.action">
	<input type="hidden" name="xzfyId" value="${xzfyId}">
		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" id="appId" name="appId" value="">
		<input type="hidden" id="protype" name="protype" value="${protype}">
		<input type="hidden" id="textId" name="textId" value="${textId}">
		<input id="sendValue" name="sendValue" type="hidden" <#if sendValue?has_content> value="${sendValue}" </#if>>
		
		<div class="ui-title fn-clear">
		<span class="ui-title-icon fn-left"><img src="../${Session['_USER_STYLE_'].imagePath}/icons/crumb.png"/></span>
	  	<h2 class="ui-title-cnt fn-left">选择代表人</h2>
		
		
	<!--search box end-->
	<span class="x-line fn-clear"><img src="../${Session['_USER_STYLE_'].imagePath}/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
	</div>
	<div class="ui-list-nobtnbar fn-clear ">
	<table class="ui-table  ui-table-list  list-fixed " >
	  <thead class=""  id="" name="" >
			<tr>
				<th class="thListNormal" width="15%">姓名</th>
				<th class="thListNormal" width="15%">身份证号码</th>
				<th class="thListNormal" width="10%">性别</th>
				<th class="thListNormal" width="15%">住所地</th>
				<th class="thListNormal" width="20%">送达地址</th>
				<th class="thListNormal" width="10%">电话号码</th>
				<th class="thListNormal" width="5%">代表人</th>
				
			</tr>
			</thead>
      	 	<tbody class="discolor">
			<#assign index = 1>
			<#list appList as data>
			<tr class="trColor">
				<input type="hidden" id="appIds" name="appIds" value="${data.id}">	
				<td class="tdlistCenter">
				<#if data.app_name?has_content>
				${data.app_name}
				</#if></td>
				<td class="tdlistCenter">
				<#if data.app_id?has_content>${data.app_id}</#if></td>
				
				<td class="tdlistCenter">
				<#if data.sexy?has_content>
				<#if data.sexy=='1'>
					男
				<#else>
					女
				</#if>
				</#if>
				</td>
				<td class="tdlistCenter"><#if data.address?has_content>${data.address}</#if></td>
				<td class="tdlistCenter"><#if data.mail_address?has_content>${data.mail_address}</#if></td>
				<td class="tdlistCenter"><#if data.mobile?has_content>${data.mobile}</#if></td>
				<td class="tdlistCenter">
				 <select name="deputy" id="deputy" >
				 	<#if data.isdeputy == "1">
					 <option value="1">是</option>
			      	 <option value="0">否</option>
			      	<#else>
			      	 <option value="0">否</option>
					 <option value="1">是</option>
			      	</#if>
		 	     </select>
				</td>
				
			</tr>
			<#assign index = index + 1>
			</#list>
	</tbody>
		</table>
		</div>
		
		</form>
		<br>
<div class="align-center">
<a href="#" title="提 交" class="btn-blue btn" onclick="addDeputy()">提 交</a>
<a href="#" title="返 回" class="btn-blue btn" onclick="gotoBack()">返 回</a>
</div>
	<script>
	var api = frameElement.api, W = api.opener, D = W.document; // api.opener 为载加lhgdialog.min.js文件的页面的window对象
	var tObj = D.getElementById('${textId}'); // 通过数据共享的方法获取调用页面文本框对象
	tObj.value = document.getElementById('sendValue').value;
		
	function gotoBack(){
		window.history.back();
	}
	
	function addDeputy(){
		if(confirm("确认提交？")){
			window.document.getElementById("sunbt").disabled=true;;
			window.document.getElementById("appForm").submit();
		}
	}
	</script>
	