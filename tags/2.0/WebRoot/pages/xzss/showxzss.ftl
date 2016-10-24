<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
	</head>
	<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
	<body>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>诉讼案件录入</td>
			</tr>
		</table>
		
		
		
		<form id="form1" name="form1" action="''" method="post" >
		
		<input type="hidden" name="funcCode" value="${funcCode}" />

		
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
		
			<tr class="trcolor">      
	     		<td class="tdFormText" width="25%">收案日期：</td>
			    <td class="tdFormInput" width="25%">
				    <#if xzssInfo.receive_date?has_content>${xzssInfo.receive_date}</#if>
			    </td>
			    <td class="tdFormText">承办人</td>
				<td class="tdFormInput">
					<#if xzssInfo.undertaker_name?has_content>${xzssInfo.undertaker_name}</#if>
				</td>
	  		</tr>
			
			<tr class="trwhite">
				
				<td class="tdFormText">复议承办人</td>
				<td class="tdFormInput">
					<#if xzssInfo.fyundertaker_name?has_content>${xzssInfo.fyundertaker_name}</#if>
				</td>
				<td class="tdFormText">原告姓名</td>
				<td class="tdFormInput">
					<#if xzssInfo.app_name?has_content>${xzssInfo.app_name}</#if>
				</td>
			</tr>
		
			<tr class="trwhite">
				
				<td class="tdFormText">原告总数</td>
				<td class="tdFormInput">
					<#if xzssInfo.app_num?has_content>${xzssInfo.app_num}</#if>
				</td>
				<td class="tdFormText">原告类别</td>
				<td class="tdFormInput">
					<#if xzssInfo.app_type?has_content>${xzssInfo.app_type}</#if>
				</td>
			</tr>
>
			
			<tr class="trwhite">
				<td class="tdFormText">被告姓名</td>
				<td class="tdFormInput">
					<#if xzssInfo.defendant?has_content>${xzssInfo.defendant}</#if>
				</td>
				<td class="tdFormText">代理人</td>
				<td class="tdFormInput">
					<#if xzssInfo.agent?has_content>${xzssInfo.agent}</#if>
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">应诉机关类别</td>
				<td class="tdFormInput">
					<#if xzssInfo.jiguan_type?has_content>${xzssInfo.jiguan_type}</#if>
				</td>
				<td class="tdFormText">应诉机关级别</td>
				<td class="tdFormInput">
					<#if xzssInfo.jiguan_level?has_content>${xzssInfo.jiguan_level}</#if>
				</td>
			</tr>
			<tr class="trwhite">	
				<td class="tdFormText">应诉机关</td>
				<td class="tdFormInput">
					<#if xzssInfo.jiguan?has_content>${xzssInfo.jiguan}</#if>
				</td>
				<td class="tdFormText">诉讼请求</td>
				<td class="tdFormInput">
					<#if xzssInfo.request?has_content>${xzssInfo.request}</#if>
				</td>
			</tr>
			
			<tr class="trwhite">
				
				<td class="tdFormText">行政管理类别</td>
				<td class="tdFormInput">
					<#if xzssInfo.manage_type?has_content>${xzssInfo.manage_type}</#if>
				</td>
				<td class="tdFormText">是否行政赔偿</td>
				<td class="tdFormInput">
					<#if xzssInfo.ismoney?has_content>${xzssInfo.ismoney}</#if>
				</td>
			</tr>

			
			<tr class="trwhite">
				<td class="tdFormText">被诉具体行政行为名称</td>
				<td class="tdFormInput">
					<#if xzssInfo.action_name?has_content>${xzssInfo.action_name}</#if>
				</td>
				<td class="tdFormText">被诉具体行政行为案号</td>
				<td class="tdFormInput">
					<#if xzssInfo.action_id?has_content>${xzssInfo.action_id}</#if>
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">司法建议</td>
				<td class="tdFormInput">
					<#if xzssInfo.issifajianyi?has_content>${xzssInfo.issifajianyi}</#if>
				</td>
				<td class="tdFormText">应诉通知</td>
				<td class="tdFormInput">
					<#if xzssInfo.yingsutongzhi?has_content>${xzssInfo.yingsutongzhi}</#if>
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">结案文书</td>
				<td class="tdFormInput">
					<#if xzssInfo.jieanwenshu?has_content>${xzssInfo.jieanwenshu}</#if>
				</td>
				<td class="tdFormText">结案日期</td>
				<td class="tdFormInput">
					<#if xzssInfo.jieandate?has_content>${xzssInfo.jieandate}</#if>
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">是否复议</td>
				<td class="tdFormInput">
					<#if xzssInfo.fuyi_id?has_content>${xzssInfo.fuyi_id}</#if>
				</td>
				<td class="tdFormText">是否一审</td>
				<td class="tdFormInput">
					<#if xzssInfo.shen1?has_content>${xzssInfo.shen1}</#if>
				</td>
			</tr>
			
			
			<tr class="trwhite">
				<td class="tdFormText">是否二审</td>
				<td class="tdFormInput">
					<#if xzssInfo.shen2?has_content>${xzssInfo.shen2}</#if>
				</td>
					<td class="tdFormText">是否三审</td>
				<td class="tdFormInput">
					<#if xzssInfo.shen3?has_content>${xzssInfo.shen3}</#if>
				</td>
			</tr>

			
			
			
			
			
			
			
			
			
			
		
			
		

			
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="提 交" onclick="createXzss();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>
			
		</form>
		</table>
	</body>
</html>


<script type="text/javascript">
	function createXzss(){
		if(confirm("确认提交？")){
			window.form1.action="saveXzss.action";
			window.form1.submit();
		}
	}
	function gotoBack(){
		window.history.back();
	}
</script>