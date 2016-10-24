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
						<#assign docType='不予受理决定书'>
						<#assign docFunc='getBushouli()'>
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
			<#if checkDocType=='5' && docList4.size() gt 0>
				<a href="javascript:${docFunc}" title="" class="btn-blue btn">${docType}</a>
			</#if>
			<#if checkDocType=='7' && docList4.size() gt 0>
				<a href="javascript:${docFunc}" title="" class="btn-blue btn">${docType}</a>
			</#if>
			<#if checkDocType=='9' && docList4.size() gt 0>
				<a href="javascript:${docFunc}" title="" class="btn-blue btn">${docType}</a>
			</#if>		
			<#if checkDocType=='11' && docList4.size() gt 0>
				<a href="javascript:${docFunc}" title="" class="btn-blue btn">${docType}</a>
			</#if>		
		</#if>
		
		<#if checkDocType=='11' && xzfyInfo.stadardResult=='1'>
			<#if docList5.size() gt 0>
			<a href="javascript:getYijian()" title="" class="btn-blue btn">行政复议意见书</a>
			</#if>
			<#if docList6.size() gt 0>
			<a href="javascript:getJianYi()" title="" class="btn-blue btn">行政复议建议书</a>
			</#if>
		</#if>
		</div>
	<div class="z_wrap_info">

		<h2 class="z_title">
		<font style="font-family:宋体;font-size:24px">${xzfyInfo.break_right?default('')}行政复议案件<br>
		<#assign docTitle=''>
		<#if checkDocType=='5'>
			<#assign docTitle='处理（延期）呈报表'>
		</#if>
		<#if checkDocType=='7'>
			<#assign docTitle='处理（中止）呈报表'>
		</#if>
		<#if checkDocType=='9'>
			<#assign docTitle='处理（恢复审理）呈报表'>
		</#if>
		<#if checkDocType=='11'>
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="1"><#assign docTitle='处理（驳回）呈报表'></#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="2"><#assign docTitle='处理（维持）呈报表'></#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="3"><#assign docTitle='处理（确认违法）呈报表'></#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="4"><#assign docTitle='处理（撤销）呈报表'></#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="5"><#assign docTitle='处理（变更）呈报表'></#if>
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="6"><#assign docTitle='处理（责令履行）呈报表'></#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="7"><#assign docTitle='处理（调解）呈报表'></#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="8"><#assign docTitle='处理（终止）呈报表'></#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="9"><#assign docTitle='处理（其他）呈报表'></#if> 
			
		</#if>
		${docTitle}</font>
		</h2>
		<div style="float:right;font-size:12pt;font-family:宋体;">${xzfyInfo.tjzfzh?default('')}</div>
		<div class="z_info">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
			  <tr>
				<th width="20%">申请人</th>
				<td colspan="3" width="20%">${xzfyInfo.app_show?default('')}</td>
			  </tr>
			  <tr>
				<th >被申请人</th>
				<td colspan="3">${xzfyInfo.defendant_name?default('')}</td>
			  </tr>
			  <#assign caseType=xzfyInfo.casetype?default('0')>
			  <tr>
				<th width="20%">第三人</th>
				<td width="30%">
				     ${xzfyInfo.third?default('')}
				</td>
				<th width="20%">案件类型</th>
				<td width="30%">
				     <#if caseType=="1">行政处罚</#if>
	 				 <#if caseType=="2">行政强制措施</#if>
	 				 <#if caseType=="3">行政征收</#if>
	 				 <#if caseType=="4">行政许可</#if>
	 				 <#if caseType=="5">行政确权</#if>
	 				 <#if caseType=="6">干预经营自主权</#if>
     				 <#if caseType=="7">信息公开</#if>
	 				 <#if caseType=="8">行政不作为</#if>
	 				 <#if caseType=="9">其他</#if>
	 				  <#if caseType=="10">行政确认</#if>
		 				 <#if caseType=="11">举报投诉处理</#if>
				</td>
			  </tr>
			  
			  <tr>
				<th width="20%">收案日期</th>
				<td width="30%">
				     ${xzfyInfo.receive_date?default('')}
				</td>
				<th width="20%">立案日期</th>
				<td width="30%">
				    ${xzfyInfo.lian_date?default('')}
				</td>
			  </tr>

			  <tr>
				<td colspan="4">
					<div class="f12 c6">承办人意见：<br>
					
						<#if checkDocType=='5'>
						<textarea name="delay_detail" type="text" class="textarea7" value="" readonly >${xzfyInfo.delay_detail?default('')}</textarea>
						</#if>
						<#if checkDocType=='7'>
						<textarea name="stop_detail" type="text" class="textarea7" readonly>${xzfyInfo.stop_detail?default('')}</textarea>
						</#if>
						<#if checkDocType=='9'>
						<textarea name="stop_reason" type="text" class="textarea7" value="" readonly>${xzfyInfo.stop_reason?default('')}</textarea>
						</#if>				
						<#if checkDocType=='11'>
						<textarea name="jaAdvice" type="text" class="textarea7" value="" readonly>${xzfyInfo.jaAdvice?default('')}</textarea>
						</#if>			
												
					</div>
					<div class="ml30 mt10 f12 c6">承办人：<font style="font-family:黑体"><strong>${xzfyInfo.user2_name}</strong></font>
					<#if checkDocType=='5'>
						${xzfyInfo.yanqispdate?default('')}
					</#if>
					<#if checkDocType=='7'>
						${xzfyInfo.zhongzhispdate?default('')}
					</#if>
					<#if checkDocType=='9'>
						${xzfyInfo.huifuspdate?default('')}
					</#if>
					<#if checkDocType=='11'>
						${xzfyInfo.jieanspdate?default('')}
					</#if>
					提交</div>
				</td>
			  </tr>
		<#assign user_id=Session['_USER_LOGIN_'].id>
		<#assign check_id=xzfyInfo.check_id?number>			  
			   <tr>
				<td colspan="4">
					<div class="mt10 c6 f12">领导批示：<br><br>
						<#list xzfyCheckList as checkList>
						<font style="font-family:黑体;font-size:18px;">
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
						<#if user_id==check_id && xzfyInfo.status?default('0')==checkDocType?default('0')>
						<div class="mt10 c6 f12">
						
						<font style="font-family:黑体;font-size:22px;">
						${user_name}：</font>
						
						<textarea  class="textarea6"  name="xzfyShenpi.check_advise" id="check_advise">同意。</textarea>
						<p align=left>审批时间：<input size="10" style="font-family:宋体;font-size:17px" name="checkDate" id="checkDate" altname="审批日期" type="text" onClick="WdatePicker()"  value="${todate}"></p>
						</div>	
						 </#if>		
						<#if xzfyCheckList.size()==0>
						<br><br>
						</#if>	
						<br>		
					</div>
					
<#if user_id==check_id && xzfyInfo.status?default('0')==checkDocType?default('0')>
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
    	
	</#if>	
				</td>
			  </tr>		

			  <#if isView=="0">			
			  <tr>
				<td colspan="5">
					<div class="mt10 c6 f12">备注：
					
					</div>
					<div class="mt10 em2">
					<font style="font-family:楷体;font-size:20px;">
					<#if checkDocType?default('0')=='5'>
					<textarea name="pifuyijian" type="text" class="textarea2" value="" readonly >${xzfyInfo.pifuyijian?default('')}</textarea>
					</#if>
					<#if checkDocType?default('0')=='7'>
					<textarea name="pifuyijian1" type="text" class="textarea2" value="" readonly >${xzfyInfo.pifuyijian1?default('')}</textarea>
					</#if>	
					<#if checkDocType?default('0')=='9'>
					<textarea name="pifuyijian2" type="text" class="textarea2" value="" readonly >${xzfyInfo.pifuyijian2?default('')}</textarea>
					</#if>	
					<#if checkDocType?default('0')=='11'>
					<textarea name="pifuyijian3" type="text" class="textarea2" value="" readonly >${xzfyInfo.pifuyijian3?default('')}</textarea>
					</#if>					
					</font>
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
		var url="../fzb_default_buzhengtongzhishu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="../fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function getYnaqi(){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=yanqishenlitongzhishu";
	window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
	function getShouli(){
		var url="../fzb_default_shoulitongzhishu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="../fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
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
			var docTitle='${docTitle?default('')}'
			if(docTitle=="处理（调解）呈报表")	
				var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=xingzhengfuyitiaojie";
			else if(docTitle=="处理（终止）呈报表")	
				var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=xingzhengfuyizhongzhi";
			else
				var url ="../fzb_default_dafutongzhijiean.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=xingzhengfuyijuedingshu&finish_type=${xzfyInfo.finish_type?default('0')}";
		
		
		//var url="../fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
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
		var url="../fzb_default_buyushouligaozhishu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="../fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');			
	}
	
</script>