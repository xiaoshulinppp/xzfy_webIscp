<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/style_anju.css">
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
		<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
	</head>
	<body>
	<form id="createForm" action="../xzfy/shenpiSubmit.action" method="post" >
	<#assign docType=''>
	<#assign docFunc='0'>
		<#if checkDocType=='2'>
		<#list docList3 as dList3>
			<#assign docType='补正通知书'>
			<#assign docFunc='getBuzhengtongzhi()'>
		</#list>	
		<#elseif checkDocType=='3'>
			<#list docList as dList>
			<#assign docType='受理通知书'>
			<#assign docFunc='getShouli()'>
			</#list>
		<#elseif checkDocType=='11'>
					<#if xzfyInfo.stadardResult=='1'>
						<#assign docType='结案文书'>
						<#assign docFunc='getJiean()'>
					<#else>
						<#list docList2 as dList2>
						<#if xzfyInfo.stadardResult=='2'>
							<#assign docFunc='getBushouli()'>
							<#assign docType='不予受理告知书'>
						<#else>
							<#assign docType='不予受理决定书'>
							<#assign docFunc='getBushouli2()'>
						</#if>
						
						</#list>
					</#if>
			
		</#if>
	<script>
	var subcat = new Array();
	
	<#assign count=0>
	 <#list userList as uList>
	 	subcat[${count}]=new Array('${uList.getId()}','${uList.getName()}'); 
	 	<#assign count=count+1>
	 </#list>
	</script>
			<div class="align-right">
		<#if isView=="0">
			<#if docFunc!='0'>
		<a href="javascript:${docFunc}" title="" class="btn-blue btn">${docType}</a>
		</#if>
		</#if>
		
		</div>
	<div class="z_wrap_info">

		<h2 class="z_title">
		<font style="font-family:黑体">${xzfyInfo.break_right}<br>行政复议申请材料处理单</font>
		</h2>
		<div class="z_info">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
			  <tr>
				<th width="20%">申请人<br/>（当事人）</th>
				<td colspan="2" width="30%">${xzfyInfo.app_show?default('')}</td>
				<th width="20%">委托代理人</th>
				<td width="30%">${xzfyInfo.agent_name?default('')}</td>
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
					当面接待
				<#elseif xzfyInfo.receive_type=='2'>
					来信接待
				<#elseif xzfyInfo.receive_type=='3'>
					电子邮件
				</#if>	
				</#if>	
				</td>
				<th>是否提出听证申请</th>
				<td>${xzfyInfo.istingzheng?default('否')}</td>
			  </tr>
			  <tr>
				<th>立案审查人</th>
				<td colspan="2">

					${xzfyInfo.user1_name?default('')}
					<#if xzfyInfo.user4_name?has_content>
						${xzfyInfo.user4_name?default('')}
					</#if>

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
					<div class="f12 c6">审查人意见：</div>
					<div class="mt10 em2">
						<#if checkDocType=='2'>
						<font style="font-family:黑体;font-size:22px;">${xzfyInfo.bzAdvice?default('建议书面补正')}</font>
						</#if>
						<#if checkDocType=='3'>
						<font style="font-family:黑体;font-size:22px;">${xzfyInfo.laAdvice?default('')}</font>
						</#if>
						<#if checkDocType=='11'>
						<font style="font-family:黑体;font-size:22px;">${xzfyInfo.jaAdvice?default('')}</font>
						</#if>						
												
					</div>
					<div class="ml30 mt10 f12 c6">立案审查人：<font style="font-family:黑体"><strong>${xzfyInfo.user1_name}</strong></font>
					<#if checkDocType=='2'>
						${xzfyInfo.buzhengspdate?default('')}
					</#if>
					<#if checkDocType=='3'>
						${xzfyInfo.lianspdate?default('')}
					</#if>
					<#if checkDocType=='11'>
						${xzfyInfo.jieanspdate?default('')}
					</#if>
					提交</div>
				</td>
			  </tr>
			   <tr>
				<td colspan="5">
					<div class="mt10 c6 f12">领导批示：<br><br>
						<#list xzfyCheckList as checkList>
						<font style="font-family:黑体;font-size:22px;">
							<#if checkList.check_name?has_content>
								<#if checkList.check_result=='1'>
									${checkList.check_name}：
								</#if>
							</#if>
							<#if checkList.check_advise?has_content>
								<#if checkList.check_result=='1'>
									${checkList.check_advise}&nbsp;&nbsp;${checkList.check_date}
								</#if>
							</#if>	
							</font>
							<br>					
						</#list>
						<#assign user_name=Session['_USER_LOGIN_'].name>
						
						<div class="mt10 c6 f12">
						
						<font style="font-family:黑体;font-size:22px;">
						${user_name}：</font>
						<textarea class="textarea6" name="xzfyShenpi.check_advise" id="check_advise">同意。</textarea>
						<p align=left>审批时间：<input size="10" style="font-family:宋体;font-size:17px" name="checkDate" id="checkDate" altname="审批日期" type="text" onClick="WdatePicker()"  value="${todate}"></p>
						</div>	
						<#if xzfyCheckList.size()==0>
						<br><br>
						</#if>	
						<br>			
					</div>
					

									<div class="mt10 c6 f12">
					 <select name="xzfyInfo.check_id" id="check_id" class="select-page" onchange="setChecker()">
    <option value="0">请选择审批人</option>
    <#list userList as uList>
    <option value="${uList.getId()}" >${uList.getName()}</option>
    </#list>
    
    </select>

<a href="javascript:createApp()"  class="btn-blue btn">完成</a>
<a href="javascript:returnApp()"  class="btn-blue btn">退回</a>


    </div>
    	
		
				</td>
			  </tr>		

			  <#if isView=="0">			
			  <tr>
				<td colspan="5">
					<div class="mt10 c6 f12">备注：
					
					</div>
					<div class="mt10 em2">
					<font style="font-family:楷体;font-size:20px;">${xzfyInfo.remark?default('')}</font>
					</div>
				</td>
			  </tr>
			  </#if>
			</table>
			
		</div>
	</div>	
			<input type="hidden" name="listkeyword" value="${listkeyword}" />
			<input type="hidden" name="xzfyId" value="${xzfyId}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="pNum" value="${pNum}" />
		</form>

	</body>
</html>

<script type="text/javascript">
			  function setChecker(){
			  	if(document.getElementById("check_id").value==0){
			  		document.getElementById("check_advise").value="同意。";
			  	}else{
			  		for(var i=0;i<subcat.length;i++){
			  			if(document.getElementById("check_id").value==subcat[i][0]){
			  				document.getElementById("check_advise").value="同意  请"+subcat[i][1]+"同志阅示。";
			  			}
			  		}
			  	}
			  }
			  

	function createApp(){
		if(confirm("您确认要审核吗？")){
			//window.document.getElementById("sunbt").disabled=true;;
			window.document.getElementById("createForm").submit();
		}
	}
	
	function returnApp(){
		if(confirm("您确认要退回吗？")){
			//window.document.getElementById("sunbt").disabled=true;;
			document.getElementById("createForm").action="../xzfy/returnSubmit.action";
			window.document.getElementById("createForm").submit();
		}
	}
	
	function getDoc(){
		var url="../fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131017104618&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function docPrint(){
		var url="../fzb_default_shenpidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=${checkDocType}";
		//var url="../fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function getBuzhengtongzhi(){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=buzhengtongzhishu";
	window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function getYnaqi(){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=yanqishenlitongzhishu";
	window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function getShouli(){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=shoulitongzhishu";
	window.open(url,'mainwindow','location=no,resizable=yes');	
	}
	
	function getZhongzhi(){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=zhongzhishenlitongzhishu";
	window.open(url,'mainwindow','location=no,resizable=yes');	
	}
	
	function getHuifu(){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=huifushenlitongzhishu";
	window.open(url,'mainwindow','location=no,resizable=yes');		
	}
	
	function getJiean(){
		var url="../fzb_default_jieanwenshu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="../fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');		
	}
	
	function getJianYi(){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=xingzhengfuyijianyishu";
	window.open(url,'mainwindow','location=no,resizable=yes');	
	}
	
	function getYijian(){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=xingzhengfuyiyijianshu";
	window.open(url,'mainwindow','location=no,resizable=yes');	
	}
	
	function getBushouli(){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=buyushouligaozhishushu";
	window.open(url,'mainwindow','location=no,resizable=yes');		
	}
	
	function getBushouli2(){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=buyushouligaozhishu";
	window.open(url,'mainwindow','location=no,resizable=yes');		
	}	
	
</script>