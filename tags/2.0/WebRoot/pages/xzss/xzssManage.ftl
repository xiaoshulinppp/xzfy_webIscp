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
				<td>诉讼案件管理</td>
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
				<td class="tdFormInput">&nbsp;&nbsp;&nbsp;&nbsp;共计:${xzssList.size()}条</td>
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
					<th class="thListNormal">应诉机关</th>
					<th class="thListNormal">项目状态</th>
					<th class="thListNormal">操作</th>
					</tr>
					<#list xzssList as xzssInfo>
					<tr class="trcolor">
					<td class="tdlistCenter" >&nbsp;<#if xzssInfo.id?has_content>${xzssInfo.id}</#if></td>				
					<td class="tdlistCenter" >&nbsp;<#if xzssInfo.receive_date?has_content>${xzssInfo.receive_date}</#if></td>
					<td class="tdlistCenter" >&nbsp;<#if xzssInfo.undertaker_name?has_content>${xzssInfo.undertaker_name}</#if></td>
					<td class="tdlistCenter" >&nbsp;<#if xzssInfo.app_name?has_content>${xzssInfo.app_name}</#if></td>
					<td class="tdlistCenter" >&nbsp;<#if xzssInfo.defendant?has_content>${xzssInfo.defendant}</#if></td>
					<td class="tdlistCenter" >&nbsp;<#if xzssInfo.jiguan?has_content>${xzssInfo.jiguan}</#if></td>
					<td class="tdlistCenter" >&nbsp;<#if xzssInfo.status?has_content>${xzssInfo.status}</#if></td>
					<td class="tdlistCenter" id="cxs" style="display:block" >
						<a href="../xzss/showxzss.action?tempid=${xzssInfo.id}&funcCode=${funcCode}">查看</a>&nbsp;
						<a href="../xzss/updatexzss.action?tempid=${xzssInfo.id}&funcCode=${funcCode}">修改</a>&nbsp;
						<a href="../xzss/deletexzss.action?tempid=${xzssInfo.id}&funcCode=${funcCode}">删除</a>&nbsp;
						<a href="#" onclick="contactPeople('${xzssInfo.id}');" style="display:none" id="guanlian" >关联</a>&nbsp;			
					</td>
					<input type="hidden" id="panduanGL" name="panduanGL" value="${panduanGL}" />
					<td class="tdlistCenter" id="gl" <#if panduanGL != "1" && panduanGL != "2">style="display:none"</#if> >
						<input type="button" id="sunbt" class="button" value="关联" onclick="contactPeople('${xzssInfo.id}');" />
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
			if(document.getElementById("panduanGL").value == "1")
				parent.document.getElementById("shen1").value=peopleId;
			else
				parent.document.getElementById("shen2").value=peopleId;
		}
			function updatexzss(id){
				//document.getElementById("tempid").value=id;
				tempid = id;
				document.Form1.action="updatexzss.action";
				document.Form1.submit();
		}
	
	</script>
	