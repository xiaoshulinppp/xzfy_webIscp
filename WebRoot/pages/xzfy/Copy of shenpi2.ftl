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
	<#assign docFunc=''>
		<#if checkDocType=='2'>
			<#assign docType='补正通知书'>
			<#assign docFunc='getBuzhengtongzhi()'>
		<#elseif checkDocType=='3'>
			<#assign docType='受理通知书'>
			<#assign docFunc='getShouli()'>
		<#elseif checkDocType=='5'>
			<#assign docType='延期通知书'>
			<#assign docFunc='getYnaqi()'>
		<#elseif checkDocType=='7'>
			<#assign docType='中止通知书'>
			<#assign docFunc='getZhongzhi()'>
		<#elseif checkDocType=='9'>
			<#assign docType='恢复审理通知书'>
			<#assign docFunc='getHuifu()'>
		<#elseif checkDocType=='11'>
					<#if xzfyInfo.stadardResult=='1'>
						<#assign docType='结案文书'>
						<#assign docFunc='getJiean()'>
					<#else>
						<#assign docType='不予受理告知书'>
						<#assign docFunc='getBushouli()'>
					</#if>
			
		</#if>
	
	<div class="z_wrap_info">
		<div class="align-right">
		<#if isView=="0">
		<a href="javascript:${docFunc}" title="" class="btn-blue btn">${docType}</a>
		</#if>
		
		<#if checkDocType=='11' && xzfyInfo.stadardResult=='1'>
			<a href="javascript:getYijian()" title="" class="btn-blue btn">行政复议意见书</a>
			<a href="javascript:getJianYi()" title="" class="btn-blue btn">行政复议建议书</a>
		</#if>
		</div>
		<h2 class="z_title">
		行政复议材料处理单
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

						${xzfyInfo.bzTongzhiriqi} <br>&nbsp;&nbsp;至&nbsp;&nbsp;<br>
				
						${xzfyInfo.bzBuqiriqi}

				</td>
				<th>办理文号</th>
				<td>${xzfyInfo.tjzfzh?default('')}</td>
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
			<input type="hidden" name="listkeyword" value="${listkeyword}" />
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
		var url="../bac_default_shenpidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=${checkDocType}";
		//var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function getBuzhengtongzhi(){
		var url="../bac_default_buzhengtongzhishu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function getYnaqi(){
		var url="../bac_default_yanqishenlitongzhishu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');	
	}
	
	function getShouli(){
		var url="../bac_default_shoulitongzhishu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');	
	}
	
	function getZhongzhi(){
		var url="../bac_default_zhongzhishenlitongzhishu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');		
	}
	
	function getHuifu(){
		var url="../bac_default_huifushenlitongzhishu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');		
	}
	
	function getJiean(){
		var url="../bac_default_jieanwenshu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');		
	}
	
	function getJianYi(){
		var url="../bac_default_xzfyjianyishu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');		
	}
	
	function getYijian(){
		var url="../bac_default_xingzhengfuyiyijianshu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');		
	}
	
	function getBushouli(){
		var url="../bac_default_buyushouligaozhishu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');			
	}
	
</script>