<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>

		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>裁决案件管理</td>
			</tr>
		</table>
	<form name="form0" id="form0" action="" method="post">
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
			<tr>
				<th class="thListNormal">请输入承办人：</th>
				<td class="tdFormInput">	
					<input type="text" name="undertaker"  value="" class="inputTextNormal" />
					<input type="button" value="查找 " class="button" onclick="search();" />
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		function search(){
			
			window.form0.action="showUndertakerList.action?funcCode=${funcCode}";
			window.form0.submit();
			
		}
	</script>
		
	<form name="Form1" id="Form1" action="">
		
		<input type="hidden" name="funcCode" value="${funcCode}" />
		<table width="98%" border="0" cellpadding="0" cellspacing="0" align="center" class="tabMainTop">
			<tr>
				<td class="tdFormInput">&nbsp;&nbsp;&nbsp;&nbsp;共计:${xzcjList.size()}条</td>
			</tr> 
			<tr>
				<td>
					<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
					<tr>  
					<th class="thListNormal">序号</th>
					<th class="thListNormal">收案日期</th>
					<th class="thListNormal">承办人</th>
					<th class="thListNormal">原告姓名</th>
					<th class="thListNormal">被告姓名</th>
					<th class="thListNormal">项目状态</th>
					<th class="thListNormal">结案日期</th>
					<th class="thListNormal">操作</th>
					</tr>
					<#list xzcjList as xzcjInfo>
					<tr class="trcolor">
					<td class="tdlistCenter" >&nbsp;<#if xzcjInfo.id?has_content>${xzcjInfo.id}</#if></td>				
					<td class="tdlistCenter" >&nbsp;<#if xzcjInfo.receive_date?has_content>${xzcjInfo.receive_date}</#if></td>
					<td class="tdlistCenter" >&nbsp;<#if xzcjInfo.undertaker_name?has_content>${xzcjInfo.undertaker_name}</#if></td>
					<td class="tdlistCenter" >&nbsp;<#if xzcjInfo.app_name?has_content>${xzcjInfo.app_name}</#if></td>
					<td class="tdlistCenter" >&nbsp;<#if xzcjInfo.jiguan?has_content>${xzcjInfo.jiguan}</#if></td>	
					<td class="tdlistCenter" >&nbsp;<#if xzcjInfo.status?has_content>${xzcjInfo.status}</#if></td>
					<td class="tdlistCenter" >&nbsp;<#if xzcjInfo.jieandate?has_content>${xzcjInfo.jieandate}</#if></td>
					<td class="tdlistCenter" id="cxs" style="display:block" >
						<a href="../xzcj/showxzcj.action?tempid=${xzcjInfo.id}&funcCode=${funcCode}">查看</a>&nbsp;
						<a href="../xzcj/updatexzcj.action?tempid=${xzcjInfo.id}&funcCode=${funcCode}">修改</a>&nbsp;
						<a href="../xzcj/deletexzcj.action?tempid=${xzcjInfo.id}&funcCode=${funcCode}">删除</a>&nbsp;
						<a href="#" onclick="contactPeople('${xzcjInfo.id}');">关联</a>&nbsp;			
					</td>
					<td class="tdlistCenter" id="gl" style="display:none">
						<input type="button" id="sunbt" class="button" value="关联" onclick="createXzss();" />
					</td>
					</tr>
					</#list>
					</table>
			  	</td>
		 	</tr>
		</table>
		
	</form>
		
		
		
	
	<script>
		function contactPeople(peopleId){
			parent.document.getElementById("shen1").value=peopleId;
		}
			function updatexzss(id){
				//document.getElementById("tempid").value=id;
				tempid = id;
				document.Form1.action="updatexzss.action";
				document.Form1.submit();
		}
	
	</script>
	