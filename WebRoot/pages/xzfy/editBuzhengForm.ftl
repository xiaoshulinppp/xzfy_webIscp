<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/style_anju.css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
		<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
	</head>
	<body>
	<form id="createForm" action="../xzfy/shenpiSubmit.action" method="post" >
	<#assign docType=''>

			<#assign docType='补正通知书'>
		
	<div class="z_wrap_info">
		<div class="align-right">
		<a href="javascript:docPrint()" title="" class="btn-blue btn">打印</a>
		<#if isView=="0">
		<a href="javascript:getDoc()" title="" class="btn-blue btn">查看${docType}</a>
		</#if>
		</div>
		<h2 class="z_title">

			补正审批
		
		</h2>
		<div class="z_info">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
			  <tr>
				<th width="18%">申请人<br/>（当事人）</th>
				<td colspan="2" width="20%">${xzfyInfo.app_show?default('')}</td>
				<th width="20%">委托代理人</th>
				<td width="20%">${xzfyInfo.agent_name?default('')}</td>
			  </tr>
			  <tr>
				<th >被申请人<br/>（涉及部门）</th>
				<td colspan="2">${xzfyInfo.defendant_name?default('')}</td>
				<th>收件时间</th>
				<td>${xzfyInfo.receive_date?default('')}</td>
			  </tr>
			  <tr>
				<th>收件方式</th>
				<td colspan="2">
				<#if xzfyInfo.receive_type?has_content>
				<#if xzfyInfo.receive_type=='1'>
					当面
				<#elseif xzfyInfo.receive_type=='2'>
					来信
				<#elseif xzfyInfo.receive_type=='3'>
					电子邮件
				</#if>	
				</#if>	
				</td>
				<th>是否提出听证申请</th>
				<td>${xzfyInfo.istingzheng?default('否')}</td>
			  </tr>
			  <tr>
				<th>补正期限</th>
				<td colspan="2">
					<#if xzfyInfo.bzTongzhiriqi?has_content>
						${xzfyInfo.bzTongzhiriqi} 至
					<#else>
						无
					</#if>
					<#if xzfyInfo.bzBuqiriqi?has_content>
						${xzfyInfo.bzBuqiriqi}
					</#if>
				</td>
				<th>办理文号</th>
				<td>${xzfyInfo.tjzfzh?default('')}</td>
			  </tr>
			  <tr>
				<th>承办人</th>
				<td colspan="2">
				<#if xzfyInfo.status=='2' || xzfyInfo.status=='3'>
					${xzfyInfo.user1_name?default('')}
				</#if>	
				<#if xzfyInfo.status=='11' >
					<#if xzfyInfo.stadardResult=='1'>
						${xzfyInfo.user2_name?default('')}
					<#else>
						${xzfyInfo.user1_name?default('')}
					</#if>
				</#if>	
				<#if xzfyInfo.status=='5' || xzfyInfo.status=='7' || xzfyInfo.status=='9'>
					${xzfyInfo.user2_name?default('')}
				</#if>					
				</td>
				<th>调解</th>
				<td>
				<#if xzfyInfo.istiaojie?has_content>
					<#if xzfyInfo.istiaojie=='1'>
						案前调解：
					<#elseif xzfyInfo.istiaojie=='2'>
						调解：
					<#elseif xzfyInfo.istiaojie=='3'>
						否
					</#if>
					<#if xzfyInfo.istiaojie=='1' || xzfyInfo.istiaojie=='2'>
						${xzfyInfo.tiaojie_result?default('')}
					</#if>
				</#if>
				</td>
			  </tr>
			  <tr>
				<td colspan="5">
					<div class="f12 c6">简要内容：</div>
					<div class="mt10 em2">${xzfyInfo.content_abstract?default('')}</div>
				</td>
			  </tr>
			  <tr>
				<td colspan="5">
					<div class="f12 c6">承办人人意见：</div>
					<div class="mt10 em2">
				<#if xzfyInfo.status=='2'>
					${xzfyInfo.bzAdvice?default('')}
				</#if>
				<#if xzfyInfo.status=='3'>
					${xzfyInfo.laAdvice?default('')}
				</#if>		
				<#if xzfyInfo.status=='11' >
					<#if xzfyInfo.stadardResult=='1'>
						${xzfyInfo.jaAdvice?default('')}
					<#else>
						${xzfyInfo.jaAdvice?default('')}
					</#if>
				</#if>	
				
				<#if xzfyInfo.status=='5'>
					${xzfyInfo.delay_detail?default('')}
				</#if>				
				<#if xzfyInfo.status=='7'>
					${xzfyInfo.stop_detail?default('')}
				</#if>		
				<#if xzfyInfo.status=='9'>
					${xzfyInfo.stop_reason?default('')}
				</#if>					

					</div>
					<div class="ml30 mt10 f12 c6"></div>
				</td>
			  </tr>
			   <tr>
				<td colspan="5">
					<div class="mt10 c6 f12">领导批示：<br><br>
						<#list xzfyCheckList as checkList>
							<#if checkList.check_name?has_content>
								<#if checkList.check_result=='1'>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${checkList.check_name}：
								</#if>
							</#if>
							<#if checkList.check_advise?has_content>
								<#if checkList.check_result=='1'>
									${checkList.check_advise}
								</#if>
							</#if>	
							<br>					
						</#list>					
					</div>
				</td>
			  </tr>		
			  <#if isView=="0">			
			  <tr>
				<td colspan="5">
					<div class="mt10 c6 f12">请选择审批结果：
					<select name="xzfyShenpi.check_result">
					<option value="1">同意</option>
					<option value="2">退回</option>
					</select></div>
					<div class="mt10 c6 f12">请填写意见：<textarea name="xzfyShenpi.check_advise"></textarea></div>
					<div class="align-center"><br>
					<a href="javascript:createApp()" title="审核" class="btn-blue btn">审核</a></div>
				</td>
			  </tr>
			  </#if>
			</table>
			
		</div>
	</div>	

			<input type="hidden" name="xzfyId" value="${xzfyId}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
		</form>

	</body>
</html>
<script type="text/javascript">
	function createApp(){
		if(confirm("您确认要审核吗？")){
			//window.document.getElementById("sunbt").disabled=true;;
			window.document.getElementById("createForm").submit();
		}
	}
	
	function getDoc(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131017104618&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function docPrint(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	
</script>