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
				<td>待审批菜单</td>
			</tr>
		</table>
		<form name="appForm" id="appForm" action="showshenpiList.action">
		<input type="hidden" id="xzfyId" name="xzfyId" >
		<input type="hidden" name="funcCode" value="${funcCode}">
		<input id="sendValue" name="sendValue" type="hidden" <#if sendValue?has_content> value="${sendValue}" </#if>>
		</form>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabout">
			<tr>
				<th class="thListNormal" width="15%">案号</th>
				<th class="thListNormal" width="15%">收案日期</th>
				<th class="thListNormal" width="20%">申请人类别</th>
				<th class="thListNormal" width="10%">被申请人名称</th>
				<th class="thListNormal" width="15%">立案审查人</th>
				<th class="thListNormal" width="10%">承办人</th>
				<th class="thListNormal" width="10%">案件状态</th>
				<th class="thListNormal" width="5%">案件状态</th>
			</tr>
			<#assign index = 1>

			<#list shenpiList as data>
			<tr class="trColor">
				<td class="tdlistCenter">
				<#if data.tjzfzh?has_content>
				${data.tjzfzh}
				</#if></td>
				<td class="tdlistCenter">
				<#if data.receive_date?has_content>${data.receive_date}</#if></td>
				
				<td class="tdlistCenter">
				<#if data.defendant_type?has_content>
						<#if data.defendant_type=='1'>
						乡镇政府
						<#elseif data.defendant_type=='2'>
						县级政府
						<#elseif data.defendant_type=='3'>
						县级政府部门
						<#elseif data.defendant_type=='6'>
						省部级行政机关
						<#elseif data.defendant_type=='7'>
						省级政府部门
						<#elseif data.defendant_type=='8'>
						其他
						<#elseif data.defendant_type=='9'>
						市经济技术开发区管委会
						</#if>
				<#else>
				&nbsp;
				</#if></td>
				<td class="tdlistCenter">
				<#if data.defendant_name?has_content>${data.defendant_name}</#if></td>
				<td class="tdlistCenter">
				<#if data.user1_name?has_content>${data.user1_name}</#if></td>
				<td class="tdlistCenter">
				庞雷</td>
				<td class="tdlistCenter">
				<#if data.status?has_content>
				<#if data.status=='0'>
					接待阶段
				</#if>
				<#if data.status=='1'>
					立案
				</#if>
				<#if data.status=='2'>
					补正审批
				</#if>
				<#if data.status=='3'>
					立案审批
				</#if>
				<#if data.status=='4'>
					案件办理
				</#if>
				<#if data.status=='5'>
					延期审批
				</#if>
				<#if data.status=='6'>
					案件延期
				</#if>
				<#if data.status=='7'>
					中止审批
				</#if>
				<#if data.status=='8'>
					案件中止
				</#if>
				<#if data.status=='9'>
					恢复审理审批
				</#if>
				<#if data.status=='10'>
					恢复审理
				</#if>
				<#if data.status=='11'>
					结案审批
				</#if>
				<#if data.status=='12'>
					结案
				</#if>
				</#if>
				</td>
				<td class="tdlistCenter">
				<a href="javascript:updateApp('${data.id}','${data.status}')">审批</a>&nbsp;
				</td>
			</tr>
			<#assign index = index + 1>
			</#list>

		</table>
	<script>
		function gotoCreateApp(){
			document.appForm.submit();
		}
		
		
		function updateApp(id,status){
				document.getElementById("xzfyId").value=id;
				/*
				if (status == 2 || status==3) 
					document.appForm.action="shenpi1.action";
				if (status == 5 || status==7 || status==9 || status==11) 
					document.appForm.action="shenpi2.action";
					*/
				document.appForm.action="shenpi2.action";	
				document.appForm.submit();
		}

	</script>
	