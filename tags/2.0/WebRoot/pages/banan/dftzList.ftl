<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
			<!--                       Javascripts 注意不要改变顺序                      -->
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
	</head>
	<body>

		
		
		
		<form name="Form1" id="Form1" action="">
			<br/>
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<table width="98%" border="0" cellpadding="0" cellspacing="0" align="center" class="tabMainTop">
				<tr>
					<td class="tdFormInput">&nbsp;发送记录&nbsp;&nbsp;&nbsp;共计:${dftzList.size()}条</td>
				</tr> 
			</table>
			<div class="ui-list-nobtnbar fn-clear ">
				<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed " >
					
					<tr>  
						<th >发送通知日期</th>
						<th >返回答复日期</th>
						<th >查看通知</th>
						<th >查看答复</th>
						<th >证明材料1</th>
						<th >证明材料2</th>
						<th >证明材料3</th>
					</tr>
								
					
					<#list dftzList as xzfyDftz>
						<tr class="trcolor">
							<td>&nbsp;<#if xzfyDftz.sentanswerdate?has_content>${xzfyDftz.sentanswerdate}</#if></td>				
							<td>
								<#if xzfyDftz.status?has_content && xzfyDftz.status=="0"><#if xzfyDftz.receiveanswerdate?has_content>${xzfyDftz.receiveanswerdate}</#if>
								<#else>未答复
								</#if>
							</td>
							<td  id="cxs" style="display:block" >
								<a href="../banan/xx.action?tempid=${tempid}&funcCode=${funcCode}">查看通知</a>&nbsp;		
							</td>
							<td  id="cxs" style="display:block" >
								<#if xzfyDftz.status?has_content && xzfyDftz.status=="0">
									<a href="../banan/xx.action?tempid=${tempid}&funcCode=${funcCode}">查看答复</a>&nbsp;		
								<#else>未答复
								</#if>
							</td>
							<td  >
								<#if xzfyDftz.status?has_content && xzfyDftz.status=="0">
								<a href="<#if xzfyDftz.fujian11?has_content>${xzfyDftz.fujian11}</#if>" target="_blank" ><#if xzfyDftz.fujian1?has_content>${xzfyDftz.fujian1}</#if></a>
								<#else>未上传
								</#if>
							</td>	
							<td  >
								<#if xzfyDftz.status?has_content && xzfyDftz.status=="0">
								<a href="<#if xzfyDftz.fujian22?has_content>${xzfyDftz.fujian22}</#if>" target="_blank" ><#if xzfyDftz.fujian2?has_content>${xzfyDftz.fujian2}</#if></a>
								<#else>未上传
								</#if>
							</td>
							<td  >
								<#if xzfyDftz.status?has_content && xzfyDftz.status=="0">
								<a href="<#if xzfyDftz.fujian33?has_content>${xzfyDftz.fujian33}</#if>" target="_blank" ><#if xzfyDftz.fujian3?has_content>${xzfyDftz.fujian3}</#if></a>
								<#else>未上传
								</#if>
							</td>
						</tr>
					</#list>
				</table>
			</div>
			
			
		</form>
		
	</body>
</html>
		
	
	<script>


		
	</script>
	