<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/style_anju.css">

<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
		<style type="text/css">.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
	</head>
	<body>
	<form id="createForm" action="../xzfy/buzhengSubmit.action" method="post" >
		<#assign docType='补正通知书'>
		
	<div class="z_wrap_info">
		<div class="align-right">
		<a href="javascript:docPrint()" title="" class="btn-blue btn">打印</a>
		<#if isView=="0">
		<a href="javascript:savaToGetDoc()" title="" class="btn-blue btn">${docType}</a>
		<#else>
		<a href="javascript:getDoc()" title="" class="btn-blue btn">${docType}</a>
		</#if>
		</div>
		<h2 class="z_title">

			<strong>行政复议申请材料处理单</strong>
		
		</h2>
		<div class="z_info">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
			  <tr>
				<th width="18%">申请人<br/>（当事人）</th>
				<td colspan="2" width="32%">${xzfyInfo.appdetail?default('')}</td>
				<th width="18%">委托代理人</th>
				<td width="32%">${xzfyInfo.agent_name?default('')}</td>
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
					<#if ((xzfyInfo.status=="1" && xzfyInfo.isBuzheng=="0")|| xzfyInfo.status=="2")   && xzfyInfo.check_status=="0">
						 <input name="xzfyInfo.bzTongzhiriqi" class="z_input1" id="addbegin" onClick="WdatePicker()" altname="通知补正日期"
 	     bzcheck="y" value="${xzfyInfo.bzTongzhiriqi?default('')}" >
						 至
					
						 <input name="xzfyInfo.bzBuqiriqi" class="z_input1" id="addend" onClick="WdatePicker()" altname="补齐材料日期"
 	     bzcheck="y" value="${xzfyInfo.bzBuqiriqi?default('')}" >
					
					<#else>
					${xzfyInfo.bzTongzhiriqi?default('')}&nbsp;&nbsp; 至  &nbsp;&nbsp;
					${xzfyInfo.bzBuqiriqi?default('')}
					
					</#if>
				</td>
				<th>办理文号</th>
				<td>${xzfyInfo.tjzfzh?default('')}</td>
			  </tr>
 <textarea class="textarea" style="display:none"  name="xzfyInfo.jdBzContent" id="bznr" ><#if xzfyInfo.jdBzContent?has_content>${xzfyInfo.jdBzContent}<#else>该行政复议申请中有如下材料欠缺或表达不清，根据《中华人民共和国行政复议法实施条例》第29条的规定，请申请人于接待之日起5个工作日内补正。无正当理由逾期不补正的，视为放弃行政复议申请。补正申请材料所用时间不计入行政复议案件审理期限。</#if></textarea>	

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
					<#if ((xzfyInfo.status=="1" && xzfyInfo.isBuzheng=="0")|| xzfyInfo.status=="2")   && xzfyInfo.check_status=="0">
						<textarea class="textarea" name="xzfyInfo.bzAdvice" id="bzAdvice" class="textarea" >${xzfyInfo.bzAdvice?default('')}</textarea>	
					<#else>
						${xzfyInfo.bzAdvice?default('')}
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
		 <#assign checkUserId=xzfyInfo.check_id?default('0')>
		<#if (xzfyInfo.status=="1" && xzfyInfo.isBuzheng=="0")|| xzfyInfo.status=="2" >
			  <tr>
				<td colspan="5">
					<div class="mt10 c6 f12">
					请选择审批人：
					 <select name="xzfyInfo.check_id" id="check_id" >
    <option value="0">未指定审批人</option>
    <#list userList as uList>
    <option value="${uList.getId()}" <#if uList.getId().toString()==checkUserId>selected</#if>>${uList.getName()}</option>
    </#list>
    
    </select>
    </div>
					<div class="align-center"><br>
					<#if (xzfyInfo.status=="1" && xzfyInfo.isBuzheng=="0")|| xzfyInfo.status=="2" >
						<#if xzfyInfo.check_status=="0" >
						<a href="javascript:createApp()" title="提交审批" class="btn-blue btn">提交审批</a>
						<a href="javascript:finishApp()" title="结束审批" class="btn-blue btn">结束审批</a>
						<#else>
							<a href="javascript:cancleApp()" title="取消审批" class="btn-blue btn">取消审批</a>
						</#if>
					</#if>
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
		</form>

	</body>
</html>
<script type="text/javascript">
	function createApp(){
		if(document.getElementById("addbegin").value==""){
			alert("请填写通知补正日期");
			return ;
		}else if(document.getElementById("addend").value==""){
			alert("请填写补齐材料日期");
			return ;
		}else if(document.getElementById("bzAdvice").value==""){
			alert("请填写意见");
			return ;
		}else if(document.getElementById("bznr").value==""){
			alert("请填写补正内容");
			return ;
		}else if(document.getElementById("check_id").value=="0"){
			alert("请指定审批人");
			return ;
		}else if(confirm("您确认要提交审批吗？")){
			document.getElementById("createForm").submit();
		}
	}
	
	function finishApp(){
		if(document.getElementById("addbegin").value==""){
			alert("请填写通知补正日期");
			return ;
		}else if(document.getElementById("addend").value==""){
			alert("请填写补齐材料日期");
			return ;
		}else if(document.getElementById("bznr").value==""){
			alert("请填写补正内容");
			return ;
		}else if(document.getElementById("bzAdvice").value==""){
			alert("请填写意见");
			return ;
		}else if(confirm("您确认要结束审批吗？")){
			document.getElementById("createForm").action="../xzfy/buzhengFinish.action";
			document.getElementById("createForm").submit();
		}
	}	
	
	function cancleApp(){
		if(confirm("您确认要取消审批吗？")){
			document.getElementById("createForm").action="../xzfy/buzhengCancle.action";
			document.getElementById("createForm").submit();
		}
	}
	
function savaToGetDoc(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var callBackMethod;
				var options = { 
					url:'buzhengSave.action', //提交给哪个执行 
					type:'POST', 
					success: getBuzhengtongzhi //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
}

	function getDoc(){
		var url="../bac_default_shenpidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function getBuzhengtongzhi(){
		var url="../bac_default_buzhengtongzhishu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function docPrint(){
		if(confirm("打印前，将会对当前操作进行保存，您确认要保存吗？")){
			var callBackMethod;
				var options = { 
					url:'buzhengSave.action', //提交给哪个执行 
					type:'POST', 
					success: getPrint //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
}
	
	function getPrint(){
		var url="../bac_default_shenpidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
function opendg(dgurl,dgw,dgh)
{
  $.dialog({ 
    title:'请选择补正内容',
    width: dgw,
    height: dgh,
    content:'url:'+ dgurl});
}
	
</script>