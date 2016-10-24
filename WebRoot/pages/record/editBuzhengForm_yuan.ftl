<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/style_anju.css">
		<link href="../pages/xzfy/css/index.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>

<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
		<style type="text/css">.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
	</head>
	<body>
	<form id="createForm" action="../xzfy/buzhengSubmit.action" method="post" >
		<#assign docType='补正通知书'>
		<#assign user_id=Session['_USER_LOGIN_'].id>
		<#assign user1_id=xzfyInfo.user1_id?number>

	<script>
	var subcat = new Array();
	
	<#assign count=0>
	 <#list userList as uList>
	 	subcat[${count}]=new Array('${uList.getId()}','${uList.getName()}'); 
	 	<#assign count=count+1>
	 </#list>
	</script>		
			<div class="align-right">
<#if user_id==user1_id>
		<#if isView=="0">
		<a href="javascript:getPrint()" title="" class="btn-blue btn">打印</a>
		<a href="javascript:getPrint4()" title="" class="btn-blue btn">打印模板一</a>
		<a href="javascript:getPrint5()" title="" class="btn-blue btn">打印模板二</a>
		<a href="javascript:getDoc()" title="" class="btn-blue btn">${docType}</a>
		<#else>
		<span >
		<a href="javascript:getBzContent()" title="" class="btn-blue btn">添加补正内容</a>
		<a href="javascript:savaToGetDoc()" title="" class="btn-blue btn">${docType}</a>
		<a href="javascript:docPrint()" title="" class="btn-blue btn">打印</a>
		<a href="javascript:getPrint4()" title="" class="btn-blue btn">打印模板一</a>
		<a href="javascript:getPrint5()" title="" class="btn-blue btn">打印模板二</a>
		</span>
		<#-- 添加在线补正内容-->
		<#if xzfyInfo.receive_type=='4'>
			<span>
				<a href="javascript:addContentType()"title="" class="btn-blue btn">添加在线补证内容</a>
			</span>
		</#if>
		</#if>
<#else>
		<!--<a href="javascript:getPrint()" title="" class="btn-blue btn">打印</a>-->
		<#if docList3.size() gt 0>
			<a href="javascript:getDoc()" title="" class="btn-blue btn">${docType}</a>
		</#if>
</#if>



		</div>	
	<div class="z_wrap_info">

		<h2 class="z_title">

			<strong>
			${xzfyInfo.break_right}<br>
			行政复议申请材料处理单</strong>
		
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
				<td>${xzfyInfo.receive_date?default('')[0..9]}</td>
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
			  <#--添加在线补正内容 -->
			  <tr>
			  	<th>在线补正内容</th>
			  	<td colspan="4">
			  		<textarea id="bztext" style="width: 500px;height: 50px;max-width: 900px;max-height: 100px;"></textarea>
			  		<input type="hidden" name="bzCon" id="bzNeiRong" value=""></input>
			  	</td>
			  </tr>
 

			  <tr>
				<td colspan="5">
					<div class="f12 c6">简要内容：<br>
				<#assign content_abstract='   '+xzfyInfo.content_abstract?default('')?trim>
						<textarea <#if isView='1'>class="textarea5"<#else>class="textarea5"</#if> name="xzfyInfo.content_abstract" id="content_abstract" 
						<#if ((xzfyInfo.status=="1" &&  xzfyInfo.isBuzhengshenpi?default('0')=="0")|| xzfyInfo.status=="2")   && xzfyInfo.check_status=="0">
						
						<#else>
							readonly
						</#if>
						>${content_abstract?default('')}</textarea>					
					</div>
					
				</td>
			  </tr>
			  <tr>
				<td colspan="5">
					<div class="f12 c6">审查人意见：</div>
					<div class="mt10 em2">
					
						<textarea <#if isView='1'>class="textarea3"<#else>class="textarea"</#if> name="xzfyInfo.bzAdvice" id="bzAdvice" class="textarea"
						<#if ((xzfyInfo.status=="1" &&  xzfyInfo.isBuzhengshenpi?default('0')=="0")|| xzfyInfo.status=="2")   && xzfyInfo.check_status=="0">
						
						<#else>
							readonly
						</#if>
						>${xzfyInfo.bzAdvice?default('建议书面补正')}</textarea>
					</div>
									 <#assign checkUserId=xzfyInfo.check_id?default('0')>
									 <!--  &&xzfyInfo.isBuzhengshenpi?default('0')=="0")  -->
		<#if xzfyInfo.status=="1"|| xzfyInfo.status=="2" >
									<div class="mt10 c6 f12">
					 <select name="xzfyInfo.check_id" id="check_id" class="select-page" onchange="setChecker()">
    <option value="0">请选择审批人</option>
    <#list userList as uList>
    <option value="${uList.getId()}" <#if uList.getId().toString()==checkUserId>selected</#if>>${uList.getName()}</option>
    </#list>
    
    </select>
    <#if user_id==user1_id>	<!--  &&xzfyInfo.isBuzhengshenpi?default('0')=="0")  -->
 					<#if xzfyInfo.status=="1" || xzfyInfo.status=="2" >
						<#if xzfyInfo.check_status=="0" && isView=='1'>
						<a href="javascript:createApp()" title="提交审批" class="btn-blue btn">提交审批</a>
						<a href="javascript:zancun()" class="btn-blue3" >暂存</a>
						<#if xzfyInfo.status=='2' && isView=='1'>
						<a href="javascript:finishApp()" title="结束审批" class="btn-blue btn">结束审批</a>
						</#if>
						<#else>
							<a href="javascript:cancleApp()" title="取消审批" class="btn-blue btn">取消审批</a>
						</#if>
					</#if>
					<p align=right><input size="10" style="font-family:宋体;font-size:17px" name="shenpiDate" id="shenpiDate" altname="提交审批日期" type="text" onClick="WdatePicker()"  value="${todate}">提交</p>
		</#if>
    </div>
    	
					</#if>	
				</td>
			  </tr>
			   <tr>
				<td colspan="5">
					<div class="mt10 c6 f12">领导批示：
					<#if xzfyCheckList.size()==0>
					<br><br><br>
					</#if>
					<br><br>
						<#list xzfyCheckList as checkList>
						<font style="font-family:黑体">
							<#if checkList.check_name?has_content>

									&nbsp;&nbsp;&nbsp;&nbsp;${checkList.check_name}：
							
							</#if>
							<#if checkList.check_advise?has_content>
								
									${checkList.check_advise}&nbsp;&nbsp;${checkList.check_date}
									<#if checkList.check_result=='2'>(退回)</#if>
								
							</#if>	
							</strong></font>
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
						<#if ((xzfyInfo.status=="1" &&  xzfyInfo.isBuzhengshenpi?default('0')=="0")|| xzfyInfo.status=="2")   && xzfyInfo.check_status=="0">
						
						<#else>
							readonly
						</#if>
						><#if xzfyInfo.remark?has_content>${xzfyInfo.remark}</#if></textarea>		
					</div>

				</td>
			  </tr>		
			</table>
			
		</div>
	</div>	
<textarea class="textarea5" style="display:block" name="xzfyInfo.jdBzContent" id="bznr" ><#if xzfyInfo.jdBzContent?has_content>${xzfyInfo.jdBzContent}<#else>该行政复议申请中有如下材料欠缺或表达不清，根据《中华人民共和国行政复议法实施条例》第29条的规定，请申请人于接待之日起5个工作日内补正。无正当理由逾期不补正的，视为放弃行政复议申请。补正申请材料所用时间不计入行政复议案件审理期限。</#if></textarea>	
			<input type="hidden" name="listkeyword" value="${listkeyword}" />
			<input type="hidden" name="xzfyId" value="${xzfyId}" />
			<input type="hidden" name="xzfyStatus" value="2" />
			<input type="hidden" name="stadardResult" value="0" />
			<input type="hidden" name="funcCode" value="${funcCode}" />

		<!-- 补正内容-->
		<div class="formDiv" id="bzTable" style="width:610px;position:absolute;display:none;">
	    		<table style="width:600px;">
	      	 		<tbody>
						<tr><td>
							●申请人是公民，无申请人身份证明；<input value="1" id="check1" name="bzContent" type="checkbox" class="checkbox">
							<span id="appDiv123"  style="display:none">
								<table style="width:580px;">
									<#list mapApp?keys as key>
										<tr>
											<td>${mapApp[key]}</td>
											<td>${key}</td>
											<td><input name="app" type="checkbox" value="${key}"></input></td>
										</tr>
									</#list>
									<#if xzfyInfo.agent?has_content>
										<#if xzfyInfo.agent=='1'>
											<tr>
												<td>${xzfyInfo.agent_name?default("")}</td>
												<td>代理人</td>
												<td><input name="app" type="checkbox" value="0"></input></td>
											<tr>
										</#if>
									</#if>
								</table>
							</span>
						</td></tr>
						<#if xzfyInfo.agent?has_content>
							<#if xzfyInfo.agent=='1'>
								<tr><td class="fn-text-left">
								●授权委托书；<input value="2" name="bzContent" type="checkbox" class="checkbox">
								</td></tr>
							</#if>
						</#if>
						<tr><td class="fn-text-left">
						●行政行为材料；<input value="3" name="bzContent" type="checkbox" class="checkbox"">
						</td></tr>
						<tr><td class="fn-text-left">
						●其他需要补正的情形；<input value="4" name="bzContent" type="checkbox" class="checkbox">
						</td></tr>
	 				</tbody>
	 				<div class="btn">
						<div class="fr">
							<a href="javascript:finishBz()">完成</a>
							<a href="javascript:close()">关闭</a>
						</div>
					</div>
	     		</table>
			</div>
		</form>

	</body>
</html>
<script type="text/javascript">

			  function setChecker(){
			  	for(var i=0;i<subcat.length;i++){
			  		if(document.getElementById("check_id").value==subcat[i][0]){
			  			document.getElementById("bzAdvice").value="建议书面补正，请"+subcat[i][1]+"同志阅示。";
			  		}
			  	}
			  }
	/*添加补正内容弹出框*/
	function addContentType(){
		var left = ($(window).width() - $("#bzTable").width())/2;    
   		var scrollTop = $(document).scrollTop();    
    	var scrollLeft = $(document).scrollLeft();    
    	$("#bzTable").css( { position : 'absolute', 'top' : 80, 'left' : left + scrollLeft } ).show();   
	}
	
	$(function(){
		
		var br = $("#check1");
		br.click(function(){
			if(br[0].checked){
				document.getElementById("appDiv123").style.display="";
			}
			else{
				document.getElementById("appDiv123").style.display="none";
				var objCheckBox = document.getElementsByName("app");
				for(var i=0;i<objCheckBox.length;i++){
					if(objCheckBox[i].checked){
						objCheckBox[i].checked=false;
					}
				}
			}
		});
		
	});
	function isChecked(checkName){
		var obj = document.getElementsByName(checkName);
		var objYON = false;
		for(var i=0;i<obj.length;i++){
			if(obj[i].checked){
				objYON = true;
				break;
			}
		}
		return objYON;
	}
	
	function close(){
		$("#bzTable")[0].style.display="none";
	}
	
	function finishBz(){
		var s="";
		if(isChecked("bzContent")==false){
			alert("请选择补证内容！");
		}
		else{
			var $checkBox = $(".checkbox");
			if($checkBox[0].checked){
				if(isChecked("app")==false){
					alert("请选择需要补证的人员！");
				}
				else{
					s = s+"1,";
					var obj = document.getElementsByName("bzContent");
					var bz = "";
					for(var i=1;i<obj.length;i++){
						if(obj[i].checked){
							s = s+obj[i].value+","
							if(i==1){
								bz = bz +"（二）行政行为材料；";
							}
							if(i==2){
								bz = bz +"（三）授权委托书；";
							}
							if(i==3){
								bz = bz +"（四）其他需要补正的情形；";
							}
						}
					}
					s += "|";
					var objCheckBox = document.getElementsByName("app");
					var td="";
					for(var i=0;i<objCheckBox.length;i++){
						if(objCheckBox[i].checked){
							td =td+ $(objCheckBox[i]).parent().parent().find("td").eq(0).text()+" ";
							s=s+objCheckBox[i].value+",";
						}
					}
					$("#bzNeiRong").val(s);
					$("#bztext").val("（一）申请人是公民，无申请人身份证明："+td+";"+bz);
					$("#bzTable")[0].style.display="none";
				}
			}
			else{
				var obj = document.getElementsByName("bzContent");
				var bz = "";
				for(var i=1;i<obj.length;i++){
					if(obj[i].checked){
						s = s+obj[i].value+",";
						if(i==1){
							bz = bz +"（二）行政行为材料；";
						}
						if(i==2){
							bz = bz +"（三）授权委托书；";
						}
						if(i==3){
							bz = bz +"（四）其他需要补正的情形；";
						}
					}
				}
				s = s+"|";
				$("#bztext").val(bz);
				$("#bzNeiRong").val(s);
				$("#bzTable")[0].style.display="none";
			}
		}
	}
	

	function createApp(){
		if(document.getElementById("bzAdvice").value==""){
				alert("请填写意见");
				return ;
			}else if(document.getElementById("check_id").value=="0"){
				alert("请指定审批人");
				return ;
			}else if(document.getElementById("bztext").value==""){
				alert("请选择在线补正内容");
				return;
			}else if(confirm("您确认要提交审批吗？")){
				document.getElementById("createForm").submit();
		}
	}
	
	function finishApp(){
		if(document.getElementById("bzAdvice").value==""){
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
			var callBackMethod;
				var options = { 
					url:'buzhengSave.action', //提交给哪个执行 
					type:'POST', 
					success: getBuzhengtongzhi //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
}

	function getDoc(){
		var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=buzhengtongzhishu&d_checkstatus=2";
		<#if user_id!=user1_id>	
			url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=buzhengtongzhishu&d_checkstatus=2&actiontype=yuedu";
		</#if>
		window.open(url,'mainwindow1','location=no,resizable=yes');
	}
	
	function getBuzhengtongzhi(){
		var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=buzhengtongzhishu";
		//var url="../fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		<#if user_id!=user1_id>	
			url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=buzhengtongzhishu&actiontype=yuedu";
		</#if>
		window.open(url,'mainwindow2','location=no,resizable=yes');
	}
	
	function docPrint(){
			var callBackMethod;
				var options = { 
					url:'buzhengSave.action', //提交给哪个执行 
					type:'POST', 
					success: getPrint //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
}
	function docPrint2(){
			var callBackMethod;
				var options = { 
					url:'buzhengSave.action', //提交给哪个执行 
					type:'POST', 
					success: getPrint2 //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
}
	
	function docPrint1(){
			var callBackMethod;
				var options = { 
					url:'buzhengSave.action', //提交给哪个执行 
					type:'POST', 
					success: getPrint1 //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
}	
	function docPrint4(){
			var callBackMethod;
				var options = { 
					url:'buzhengSave.action', //提交给哪个执行 
					type:'POST', 
					success: getPrint4 //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
}
	function docPrint5(){
			var callBackMethod;
				var options = { 
					url:'buzhengSave.action', //提交给哪个执行 
					type:'POST', 
					success: getPrint5 //显示操作提示 
				}; 
				$('#createForm').ajaxSubmit(options); 
				return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
}			
	function getPrint(){
	<#if xzfyCheckList.size()==0>
		var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2&mstype=chulidanweishenpi";
		<#if user_id!=user1_id>
			url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2&mstype=chulidanweishenpi&actiontype=yuedu";
		</#if>
		window.open(url,'mainwindow3','location=no,resizable=yes');
	<#else>
		var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2&mstype=chulidan1";
		<#if user_id!=user1_id>
			url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2&mstype=chulidan1&actiontype=yuedu";
		</#if>
		window.open(url,'mainwindow4','location=no,resizable=yes');	
	</#if>
	}
	function getPrint2(){
	<#if xzfyCheckList.size()==0>
		var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2&mstype=chulidanweishenpi";
		<#if user_id!=user1_id>
			url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2&mstype=chulidanweishenpi&actiontype=yuedu";
		</#if>
		window.open(url,'mainwindow3','location=no,resizable=yes');
	<#else>
		var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2&mstype=chulidan1";
		<#if user_id!=user1_id>
			url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2&mstype=chulidan1&actiontype=yuedu";
		</#if>
		window.open(url,'mainwindow4','location=no,resizable=yes');	
	</#if>
	}
	
	function getPrint1(){
		var url="../fzb_default_shenpidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=3";
		window.open(url,'mainwindow5','location=no,resizable=yes');
	}
	function getPrint4(){
		var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2&mstype=chulidanweishenpi1";
		<#if user_id!=user1_id>
			url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2&mstype=chulidanweishenpi1&actiontype=yuedu";
		</#if>
		window.open(url,'mainwindow3','location=no,resizable=yes');
	}	
	function getPrint5(){
		var url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2&mstype=chulidanweishenpi2";
		<#if user_id!=user1_id>
			url="../fzb_default_cailiaochulidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus=2&mstype=chulidanweishenpi2&actiontype=yuedu";
		</#if>
		window.open(url,'mainwindow3','location=no,resizable=yes');
	}		
function opendg(dgurl,dgw,dgh)
{
  $.dialog({ 
    title:'请选择补正内容',
    width: dgw,
    height: dgh,
    content:'url:'+ dgurl});
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

	function getBuzhengtongzhi2(){
		var url="../fzb_default_buyushouligaozhishu.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}";
		window.open(url,'mainwindow6','location=no,resizable=yes');
	}

	function getBuzhengtongzhi1(){
		var url="../fzb_default_shoulitongzhishu.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}";
		window.open(url,'mainwindow7','location=no,resizable=yes');
	}
	
	function getBzContent(){
		var url="../xzfy/addBzContent.action?textId=bznr&funcCode=${funcCode}";
		opendg(url,800,600);
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
		
</script>