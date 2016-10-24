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
				<td>裁决案件</td>
			</tr>
		</table>
		
		
		
		<form id="form1" name="form1" action="''" method="post" >
		
		<input type="hidden" name="funcCode" value="${funcCode}" />

		
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
		
			<tr class="trcolor">      
	     		<td class="tdFormText" width="25%">收案日期：</td>
			    <td class="tdFormInput" width="25%">
				    <#if xzcjInfo.receive_date?has_content>${xzcjInfo.receive_date}</#if>
			    </td>
			    <td class="tdFormText">承办人</td>
				<td class="tdFormInput">
					<#if xzcjInfo.undertaker_name?has_content>${xzcjInfo.undertaker_name}</#if>
				</td>
	  		</tr>
		
			<tr class="trwhite">
				
				<td class="tdFormText">复议承办人</td>
				<td class="tdFormInput">
					<#if xzcjInfo.fyundertaker_name?has_content>${xzcjInfo.fyundertaker_name}</#if>
				</td>
				<td class="tdFormText">申请人类别</td>
				<td class="tdFormInput">
					<#if xzcjInfo.app_type?has_content>${xzcjInfo.app_type}</#if>
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">申请人</td>
				<td class="tdFormInput">
					
				</td>
			</tr>
		
			<tr class="trwhite">
				
				<td class="tdFormText">原告总数</td>
				<td class="tdFormInput">
					<#if xzcjInfo.app_num?has_content>${xzcjInfo.app_num}</#if>
				</td>
				<td class="tdFormText">被申请人类别</td>
				<td class="tdFormInput">
					<#if xzcjInfo.jiguan_type?has_content>${xzcjInfo.jiguan_type}</#if>
				</td>
			</tr>
>
			
			<tr class="trwhite">
				<td class="tdFormText">被申请人姓名</td>
				<td class="tdFormInput">
					<#if xzcjInfo.jiguan?has_content>${xzcjInfo.jiguan}</#if>
				</td>
				<td class="tdFormText">代理人</td>
				<td class="tdFormInput">
					<#if xzcjInfo.agent?has_content>${xzcjInfo.agent}</#if>
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">答复通知</td>
				<td class="tdFormInput">
					<#if xzcjInfo.dafutongzhi?has_content>${xzcjInfo.dafutongzhi}</#if>
				</td>
				<td class="tdFormText">裁决请求</td>
				<td class="tdFormInput">
					
					<#if xzcjInfo.request?has_content>${xzcjInfo.request}</#if>
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">是否行政赔偿</td>
				<td class="tdFormInput">
					<#if xzcjInfo.ismoney?has_content>${xzcjInfo.ismoney}</#if>
				</td>
				<td class="tdFormText">被诉具体行政行为名称</td>
				<td class="tdFormInput">
					<#if xzcjInfo.action_name?has_content>${xzcjInfo.action_name}</#if>
				</td>
			</tr>
			
			<tr class="trwhite">	
				<td class="tdFormText">被诉具体行政行为案号</td>
				<td class="tdFormInput">
					<#if xzcjInfo.action_id?has_content>${xzcjInfo.action_id}</#if>
				</td>
				<td class="tdFormText">行政管理类别</td>
				<td class="tdFormInput">
					<#if xzcjInfo.manage_type?has_content>${xzcjInfo.manage_type}</#if>
				</td>
			</tr>
			
			<tr class="trwhite">	
				<td class="tdFormText">复议文书</td>
				<td class="tdFormInput">
					<#if xzcjInfo.fuyiwenshu?has_content>${xzcjInfo.fuyiwenshu}</#if>
				</td>
				<td class="tdFormText">复议结论</td>
				<td class="tdFormInput">
					<#if xzcjInfo.fuyijielun?has_content>${xzcjInfo.fuyijielun}</#if>
				</td>
			</tr>
			
			<tr class="trwhite">	
				<td class="tdFormText">裁决文书</td>
				<td class="tdFormInput">
					<#if xzcjInfo.caijuewenshu?has_content>${xzcjInfo.caijuewenshu}</#if>
				</td>
				<td class="tdFormText">裁决结论</td>
				<td class="tdFormInput">
					<#if xzcjInfo.caijuejielun?has_content>${xzcjInfo.caijuejielun}</#if>
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">结案日期</td>
				<td class="tdFormInput">
					<#if xzcjInfo.jieandate?has_content>${xzcjInfo.jieandate}</#if>
				</td>
			</tr>
			
			

		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<!-- <input type="button" id="sunbt" class="button" value="提 交" onclick="createXzss();" />
					-->
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