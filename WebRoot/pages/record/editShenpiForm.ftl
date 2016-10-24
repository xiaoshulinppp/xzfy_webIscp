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
	<form id="createForm" action="../xzfy/subCheckCase.action" method="post" >
		<#assign user_id=Session['_USER_LOGIN_'].id>
		<#assign uid=xzfyInfo.user1_id?default('0')>
		<#assign user1_id=uid?number>
		<#assign docType='补正通知书'>
		<#if checkDocType=='3'>
				<#assign docType='受理通知书'>
		</#if>
		<#if checkDocType=='11'>
			<#if resultType=='2'>
				<#assign docType='不予受理告知书'>			
			<#else>
				<#assign docType='不予受理决定书'>
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
	<#assign handleReason=xzfyInfo.handleReason?default('0')>		
			<div class="align-right">
			<#if resultType=='1' || resultType=='5'>
		<input type="hidden" id="handleReason" value="1">
	<#else>
		<#if xzfyInfo.caseorg=='0000'>
		 <select name="xzfyInfo.handleReason"  id="handleReason" class="select-page">
		 	<option value="0">请选择未受理原因</option>
		 	<option value="1" <#if handleReason=="1">selected</#if>>无明确的申请人和符合规定的被申请人</option>
		 	<option value="2" <#if handleReason=="2">selected</#if>>申请人与具体行政行为无利害关系</option>
		 	<option value="3" <#if handleReason=="3">selected</#if>>超过法定复议申请期限</option>
		 	<option value="4" <#if handleReason=="4">selected</#if>>不属于本机构的职责范围</option>
		 	<option value="5" <#if handleReason=="5">selected</#if>>无具体的行政复议请求和理由</option>
		 	<option value="6" <#if handleReason=="6">selected</#if>>其他机关受理同一申请法院受理同一诉讼</option>
		 	<option value="7" <#if handleReason=="7">selected</#if>>抽象行政行为</option>
		 	<option value="8" <#if handleReason=="8">selected</#if>>行政处分人事处理决定</option>
		 	<option value="9" <#if handleReason=="9">selected</#if>>行政机关对民事纠纷调解、处理</option>
		 	<option value="10" <#if handleReason=="10">selected</#if>>国防外交行为</option>
		 	<option value="11" <#if handleReason=="11">selected</#if>>交通医疗事故责任认定</option>
		 	<option value="12" <#if handleReason=="12">selected</#if>>司法鉴定</option>
		 	<option value="13" <#if handleReason=="13">selected</#if>>刑事司法行为</option>
		 	<option value="14" <#if handleReason=="14">selected</#if>>民事行为</option>
		 	<option value="15" <#if handleReason=="15">selected</#if>>信访行为</option>
		 	<option value="16" <#if handleReason=="16">selected</#if>>行政机关内部行为</option>
		 	<option value="17" <#if handleReason=="17">selected</#if>>不具有强制力的行政指导</option>
		 	<option value="18" <#if handleReason=="18">selected</#if>>其他复议机关对复议申请的处理</option>
		 	<option value="19" <#if handleReason=="19">selected</#if>>其他</option>
		 </select>
		 <#else>
		 	<input type="hidden" id="handleReason" value='1'>
		</#if>
	</#if>
	<#if user_id==user1_id>	
		<#if isView=="0">
		<#if resultType=='1'>
			<a href="javascript:getPrint()" title="" class="btn-blue btn">打印</a>
			<a href="javascript:getPrint4()" title="" class="btn-blue btn">打印模版一</a>
			<a href="javascript:getPrint5()" title="" class="btn-blue btn">打印模版二</a>
		<#else>
			<a href="javascript:getPrint1()" title="" class="btn-blue btn">打印</a>
			<a href="javascript:getPrint4()" title="" class="btn-blue btn">打印模版一</a>
			<a href="javascript:getPrint5()" title="" class="btn-blue btn">打印模版二</a>
		</#if>
		<span <#if resultType=="1">style="display:block"<#else>style="display:none"</#if>>
		<a href="javascript:getBuzhengtongzhi1()" title="" class="btn-blue btn">${docType}</a>
		</span>
		<span <#if resultType=="2" >style="display:block"<#else>style="display:none"</#if>>
		<a href="javascript:getBuzhengtongzhi3()" title="" class="btn-blue btn">${docType}</a>
		</span>
		<span <#if resultType=="3" ||resultType=="5">style="display:block"<#else>style="display:none"</#if>>
		<a href="javascript:getBuzhengtongzhi2()" title="" class="btn-blue btn">${docType}</a>
		</span>		
		<#else>
		<span <#if resultType=="0">style="display:block"<#else>style="display:none"</#if>>
		<a href="javascript:savaToGetDoc()" title="" class="btn-blue btn">${docType}</a>
		<a href="javascript:docPrint()" title="" class="btn-blue btn">打印</a>
		<a href="javascript:getPrint4()" title="" class="btn-blue btn">打印模版一</a>
		<a href="javascript:getPrint5()" title="" class="btn-blue btn">打印模版二</a>
		</span>
		<span <#if resultType=="1">style="display:block"<#else>style="display:none"</#if> >
		<a href="javascript:savaToGetDoc1()" title="" sty class="btn-blue btn">受理通知书</a>
		<a href="javascript:docPrint()" title="" class="btn-blue btn">打印</a>
		<a href="javascript:getPrint4()" title="" class="btn-blue btn">打印模版一</a>
		<a href="javascript:getPrint5()" title="" class="btn-blue btn">打印模版二</a>
		</span>
		<span <#if resultType=="2" ||resultType=="3" ||resultType=="5">style="display:block"<#else>style="display:none"</#if>>
		<#if resultType=="2" ><a href="javascript:savaToGetDoc3()" title="" class="btn-blue1 btn">不予受理告知书</a>
		<#else>
			<a href="javascript:savaToGetDoc2()" title="" class="btn-blue1 btn">不予受理决定书</a>
		</#if>
		<a href="javascript:docPrint1()" title="" class="btn-blue btn">打印</a>
		<a href="javascript:getPrint4()" title="" class="btn-blue btn">打印模版一</a>
		<a href="javascript:getPrint5()" title="" class="btn-blue btn">打印模版二</a>
		</span>		
		

		</#if>
	<#else>	
	<!--
		<#if resultType=='1'>
			<a href="javascript:getPrint()" title="" class="btn-blue btn">打印</a>
		<#else>
			<a href="javascript:getPrint1()" title="" class="btn-blue btn">打印</a>
		</#if>	
		-->
		<#if docList.size() gt 0>
		<span <#if resultType=="1">style="display:block"<#else>style="display:none"</#if>>
		<a href="javascript:getBuzhengtongzhi1()" title="" class="btn-blue btn">${docType}</a>
		</span>
		</#if>
		<#if docList2.size() gt 0>
		<span <#if resultType=="2" >style="display:block"<#else>style="display:none"</#if>>
		<a href="javascript:getBuzhengtongzhi3()" title="" class="btn-blue btn">${docType}</a>
		</span>
		<span <#if resultType=="3" ||resultType=="5">style="display:block"<#else>style="display:none"</#if>>
		<a href="javascript:getBuzhengtongzhi2()" title="" class="btn-blue btn">${docType}</a>
		</span>
		</#if>
	</#if>	

		
		</div>
	<div class="z_wrap_info">

	
	
		<h2 class="z_title">

			<strong>${xzfyInfo.break_right}<br>行政复议申请材料处理单</strong>
		
		</h2>
		<div class="z_info">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
			  <tr>
				<th width="18%">申请人<br/>（当事人）</th>
				<td colspan="2" width="32%">${xzfyInfo.app_show?default('')}</td>
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
					当面接待
				<#elseif xzfyInfo.receive_type=='2'>
					来信接待
				<#elseif xzfyInfo.receive_type=='3'>
					电子邮件
				</#if>	
				</#if>	
				</td>
				<th><!--是否提出听证申请-->补正</th>
				<td><#--${xzfyInfo.istingzheng?default('否')}-->
					<#if xzfyInfo.isBuzheng?default('0')=='1'>
						<#if xzfyInfo.bzTongzhiriqi?default('')!="">通知日期：${xzfyInfo.bzTongzhiriqi?default('')}</#if>
						<#if xzfyInfo.bzBuqiriqi?default('')!=""><br/>补正时间：${xzfyInfo.bzBuqiriqi?default('')}</#if>
					</#if>	
				</td>
			  </tr>
	   <#assign caseNum=''>
	   <#if xzfyInfo.tjzfzh?has_content>
	   		<#assign caseNum=xzfyInfo.tjzfzh>
	   	<#else>
	   		<#assign caseNum=xzfyCom.caseNum?default('')+'〔'+year+'〕'+'  号'>
	   	</#if>			  
			  <tr>
				<th>立案审查人</th>
				<td colspan="2">

					${xzfyInfo.user1_name?default('')}
					<#if xzfyInfo.user4_name?has_content>
						${xzfyInfo.user4_name?default('')}
					</#if>

				</td>
				<th>办理文号</th>
				<td>
				<input type="text" style="font-family:仿宋;font-size:16px;" name="xzfyInfo.tjzfzh" value="${caseNum?default('')}" id="tjzfzh">
				</td>
			  </tr>
			  <#assign currentStatus=xzfyInfo.status?number>
			  <tr>
				<td colspan="5">
						<div class="f12 c6">简要内容：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span id="jynr" style="color:red;display:none">(还可以输入)</span><br>
				<#assign content_abstract='   '+xzfyInfo.content_abstract?default('')?trim>
						<textarea onchange="checkContent()" <#if isView='1'>class="textarea5"<#else>class="textarea5"</#if> 
						name="xzfyInfo.content_abstract" id="content_abstract"  onpropertychange='this.style.posHeight=this.scrollHeight'
						<#if (currentStatus==1 || currentStatus==3 || currentStatus==11) && xzfyInfo.check_status=='0'>
						
						<#else>
							readonly
						</#if>
						>${content_abstract?default('')}</textarea>					
					</div>
				</td>
			  </tr>
			  <script>
			  //checkContent();
			  
			  function checkContent(){
			  	//if(document.getElementById("content_abstract").value.length>150)
			  		//document.getElementById("content_abstract").value=document.getElementById("content_abstract").value.substring(0,150);
			  	//var maxLength=150-document.getElementById("content_abstract").value.length;
			  	//document.getElementById("jynr").innerHTML="（还可以输入"+maxLength+"个字）"
			  }
			  </script>
			  <tr>
				<td colspan="5">
					<div class="f12 c6">审查人意见：</div>
					<div class="mt10 em2">
					<#assign currentStatus=xzfyInfo.status?number>
<#if resultType=='1'>
						<textarea <#if isView='1'>class="textarea3"<#else>class="textarea"</#if> name="xzfyInfo.laAdvice" id="laAdvice" class="textarea"
						<#if (currentStatus==1 || currentStatus==3 || currentStatus==11) && xzfyInfo.check_status=='0'>
						
						<#else>
							readonly
							
						</#if>
						 >${xzfyInfo.laAdvice?default('符合受理条件，建议立案。')}</textarea>
						
						
<#else>
<textarea <#if isView='1'>class="textarea3"<#else>class="textarea"</#if> name="xzfyInfo.jaAdvice" id="laAdvice" class="textarea"
						<#if (currentStatus==1 || currentStatus==3 || currentStatus==11) && xzfyInfo.check_status=='0'>
						
						<#else>
							readonly
							
						</#if>
						><#if resultType=='2'>
	<#if xzfyInfo.jaAdvice?has_content>
		<#if xzfyInfo.jaAdvice?index_of("告知处理")==-1>
不符合受理条件，建议告知处理。	
		<#else>
${xzfyInfo.jaAdvice?default('不符合受理条件，建议告知处理。')}
		</#if>
	</#if>
</#if>
<#if resultType=='3'>
	<#if xzfyInfo.jaAdvice?has_content>
		<#if xzfyInfo.jaAdvice?index_of("不予受理")==-1>
不符合受理条件，建议不予受理。	
		<#else>
${xzfyInfo.jaAdvice?default('不符合受理条件，建议不予受理。')}
		</#if>
	</#if>
</#if>
<#if resultType=='5'>
	<#if xzfyInfo.jaAdvice?has_content>
		<#if xzfyInfo.jaAdvice?index_of("其他处理")==-1>
不符合受理条件，建议其他处理。	
		<#else>
${xzfyInfo.jaAdvice?default('不符合受理条件，建议其他处理。')}
		</#if>
	</#if>
</#if></textarea>						
</#if>						
					</div>
	<#if user_id==user1_id>						
									 <#assign checkUserId=xzfyInfo.check_id?default('0')>
		<#if xzfyInfo.status=="1" || xzfyInfo.status=="3" || (xzfyInfo.status=="11" && (resultType=='2' || resultType=='3' || resultType=='5')) >
									<div class="mt10 c6 f12">
					 <select name="xzfyInfo.check_id" id="check_id" class="select-page" onchange="setChecker('${resultType}')">
    <option value="0">请选择审批人</option>
    <#list userList as uList>
    <option value="${uList.getId()}" <#if uList.getId().toString()==checkUserId>selected</#if>>${uList.getName()}</option>
    </#list>
    
    </select>
    

						<#if xzfyInfo.check_status=="0" >
							<#if isView=='1'>
								<a href="javascript:createApp('${resultType}')" title="提交审批" class="btn-blue btn">提交审批</a>
								<a href="javascript:zancun()" class="btn-blue3" >暂存</a>
								<#if xzfyInfo.status=="3">
									<a href="javascript:save6()" class="btn-blue3 btn" >完成</a>
									<a href="javascript:cancleApp()" title="取消审批" class="btn-blue3 btn">取消</a>
								<#elseif xzfyInfo.status=="11">
									<a href="javascript:save12()" class="btn-blue3 btn" >完成</a>
									<a href="javascript:cancleApp()" title="取消审批" class="btn-blue3 btn">取消</a>
								</#if>
							</#if>
						<!--<a href="javascript:finishApp('${resultType}')" title="结束审批" class="btn-blue btn">结束审批</a>-->
						<#else>
							<a href="javascript:cancleApp()" title="取消审批" class="btn-blue btn">取消审批</a>
						</#if>
						<p align=right><input size="10" style="font-family:宋体;font-size:17px" name="shenpiDate" id="shenpiDate" altname="提交审批日期" type="text" onClick="WdatePicker()"  value="${todate}">提交</p>
		
    </div>
    	
					</#if>	
	</#if>		
	<#if xzfyInfo.check_status=="1">
	立案审查人：<font style="font-family:黑体"><strong>${xzfyInfo.user1_name}</strong></font>
					<#if checkDocType=='2'   >
						${xzfyInfo.buzhengspdate?default('')}提交
					</#if>
					<#if checkDocType=='3'>
						${xzfyInfo.lianspdate?default('')}提交
					</#if>
					<#if checkDocType=='11' >
						${xzfyInfo.jieanspdate?default('')}提交
					</#if>
		</#if>					
				</td>
			  </tr>
			   <tr>
				<td colspan="5">
					<div class="mt10 c6 f12">领导批示：<br><br>
					<#if xzfyCheckList.size()==0>
					<br><br><br>
					</#if>
						<#list xzfyCheckList as checkList>
						<font style="font-family:黑体">
							<#if checkList.check_name?has_content>
								
									&nbsp;&nbsp;&nbsp;&nbsp;${checkList.check_name}：
								
							</#if>
							<#if checkList.check_advise?has_content>
								
									${checkList.check_advise}&nbsp;&nbsp;${checkList.check_date}
									<#if checkList.check_result=='2'>(退回)</#if>
								
							</#if>	
							</font>
									<br>		
						</#list>
						<br><br>					
					</div>

				</td>
			  </tr>		
			   <tr>
				<td colspan="5">
					<div class="mt10 c6 f12">备注：</div>
					<div class="mt10 em2">
						<textarea <#if isView='1'>class="textarea2"<#else>class="textarea2"</#if> name="xzfyInfo.remark" id="remark" 
					
						><#if xzfyInfo.remark?has_content>${xzfyInfo.remark}</#if></textarea>			
					</div>

				</td>
			  </tr>	
			</table>
			
		</div>
	</div>	
			<input type="hidden" name="listkeyword" value="${listkeyword}" />
			<input type="hidden" name="xzfyId" value="${xzfyId}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="xzfyInfo.stadardResult" id="resultType" value="${resultType}" />
		</form>

	</body>
</html>
<script type="text/javascript">
			  function setChecker(type){

			  	for(var i=0;i<subcat.length;i++){
			  		if(document.getElementById("check_id").value==subcat[i][0]){
			  			if(type==1)
			  				document.getElementById("laAdvice").value="符合受理条件，建议立案，请"+subcat[i][1]+"同志阅示。";
			  			if(type==2)
			  				document.getElementById("laAdvice").value="不符合受理条件，建议告知处理，请"+subcat[i][1]+"同志阅示。";
			  			if(type==3)
			  				document.getElementById("laAdvice").value="不符合受理条件，建议不予受理，请"+subcat[i][1]+"同志阅示。";
			  			if(type==5)
			  				document.getElementById("laAdvice").value="不符合受理条件，建议其他处理，请"+subcat[i][1]+"同志阅示。";
			  		}
			  	}
			  }

		function createApp(type){
		
	if(document.getElementById("laAdvice").value==""){
			alert("请填写意见");
			return ;
	}else if(document.getElementById("check_id").value=="0"){
			alert("请指定审批人");
			return ;
	}else if(document.getElementById("handleReason").value=="0"){
			alert("请选择未受理原因");
			return ;
	}else if(confirm("您确认要提交审批吗？")){
			document.getElementById("createForm").submit();
		}
	}
	
	function finishApp(type){
		if(document.getElementById("laAdvice").value==""){
			alert("请填写意见");
			return ;
		}else if(document.getElementById("handleReason").value=="0"){
			alert("请选择未受理原因");
			return ;
		}else if(confirm("您确认要结束审批吗？")){
			if(document.getElementById("resultType").value==1){
				document.getElementById("createForm").action="../xzfy/finishLianInfo1.action";
				document.getElementById("createForm").submit();
			}else{
				document.getElementById("createForm").action="../xzfy/finishJieanInfo1.action";
				document.getElementById("createForm").submit();
			}
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
		var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		<#if user_id!=user1_id>
			var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2&actiontype=yuedu";
		</#if>
		
		window.open(url,'mainwindow1','location=no,resizable=yes');
	}
	
	function getBuzhengtongzhi(){

		var url="../bac_default_buzhengtongzhishu.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2";
		//var url="../fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";

		window.open(url,'mainwindow2','location=no,resizable=yes');
	}
	
	function docPrint(){
		//if(confirm("打印前，将会对当前操作进行保存，您确认要保存吗？")){
			var callBackMethod;
				var options = { 
					url:'saveCase.action', //提交给哪个执行 
					type:'POST', 
					success: getPrint //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		//}
}
	
	function docPrint1(){
		if(confirm("打印前，将会对当前操作进行保存，您确认要保存吗？")){
			var callBackMethod;
				var options = { 
					url:'saveCase.action', //提交给哪个执行 
					type:'POST', 
					success: getPrint1 //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
}	
	function docPrint2(){
		if(confirm("打印前，将会对当前操作进行保存，您确认要保存吗？")){
			var callBackMethod;
				var options = { 
					url:'saveCase.action', //提交给哪个执行 
					type:'POST', 
					success: getPrint2 //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
}	
	
	
	function zancun(){
			var callBackMethod;
				var options = { 
					url:'saveCase.action', //提交给哪个执行 
					type:'POST', 
					success: zancun_success //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 	
	}
	
	function zancun_success(){
		alert("保存成功！");
	}
	
	function getPrint(){
	<#if xzfyCheckList.size()==0>
		var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=3&mstype=chulidanweishenpi";
	<#else>
		var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=3&mstype=chulidan1";
	</#if>	
	<#if user_id!=user1_id>
		url=url+"&actiontype=yuedu";
	</#if>	
		window.open(url,'mainwindow3','location=no,resizable=yes');
	}
	
	function getPrint1(){
	<#if xzfyCheckList.size()==0>

	var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=11&mstype=chulidanweishenpi";
<#else>
		var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=11&mstype=chulidan1";
</#if>
	<#if user_id!=user1_id>
		url=url+"&actiontype=yuedu";
	</#if>	
		window.open(url,'mainwindow4','location=no,resizable=yes');

	}
		function getPrint2(){
<#if xzfyCheckList.size()==0>
		var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=11&mstype=chulidanweishenpi";
<#else>
		var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=11&mstype=chulidan1";
</#if>

	<#if user_id!=user1_id>
		url=url+"&actiontype=yuedu";
	</#if>	
		window.open(url,'mainwindow5','location=no,resizable=yes');
	}
	function getPrint4(){
	var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=11&mstype=chulidanweishenpi1";
	<#if user_id!=user1_id>
		url=url+"&actiontype=yuedu";
	</#if>	
		window.open(url,'mainwindow4','location=no,resizable=yes');

	}
	function getPrint5(){
	var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=11&mstype=chulidanweishenpi2";
	<#if user_id!=user1_id>
		url=url+"&actiontype=yuedu";
	</#if>	
		window.open(url,'mainwindow4','location=no,resizable=yes');
	}		
function opendg(dgurl,dgw,dgh)
{
  $.dialog({ 
    title:'请选择补正内容',
    width: dgw,
    height: dgh,
    content:'url:'+ dgurl});
}

	function save12(){
		if(confirm('请进入“案件信息”中核查相关信息填写无误后，点击蓝色结案按钮。')){
			 parent.location.reload();
		
		}
	}
	
	
	function save6(){
		if(confirm('请进入“案件信息”中核查相关信息填写无误后，点击完成按钮，进入案件审理阶段。')){
			 parent.location.reload();
		
		}
	}	
	
function savaToGetDoc1(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var callBackMethod;
				var options = { 
					url:'saveCase.action', //提交给哪个执行 
					type:'POST', 
					success: getBuzhengtongzhi1 //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
}

function savaToGetDoc2(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var callBackMethod;
				var options = { 
					url:'saveCase.action', //提交给哪个执行 
					type:'POST', 
					success: getBuzhengtongzhi2 //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
}
function savaToGetDoc3(){
		if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var callBackMethod;
				var options = { 
					url:'saveCase.action', //提交给哪个执行 
					type:'POST', 
					success: getBuzhengtongzhi3 //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
}
	function getBuzhengtongzhi2(){

		var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=buyushouligaozhishu";
		<#if user_id!=user1_id>	
			url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=buyushouligaozhishu&actiontype=yuedu";
		</#if>
		window.open(url,'mainwindow6','location=no,resizable=yes');
	}
	function getBuzhengtongzhi3(){

		var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=buyushouligaozhishushu";
	<#if user_id!=user1_id>
		url=url+"&actiontype=yuedu";
	</#if>	
		window.open(url,'mainwindow7','location=no,resizable=yes');
	}
	function getBuzhengtongzhi1(){

		var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=shoulitongzhishu";
		<#if user_id!=user1_id>	
			url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=shoulitongzhishu&actiontype=yuedu";
		</#if>
		window.open(url,'mainwindow8','location=no,resizable=yes');
	}
		
</script>