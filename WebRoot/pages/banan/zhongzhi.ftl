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
		<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
	</head>
	<body>
	<form id="form1" action="" method="post" >
	<#assign isde=xzfyInfo.isdelay?default('0')>
			<#assign isde=xzfyInfo.isdelay?default('0')>
			<#assign isst=xzfyInfo.isstop?default('0')>		
			<#assign withdrawsp=xzfyInfo.check_status?default('0')>	
			<input type="hidden" name="listkeyword" value="${listkeyword}" />
			<input type="hidden" name="xzfyDftz.sentanswerdate" value="${todate}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="tempid" value="${xzfyInfo.id}" />
			<input type="hidden" name="xzfyInfo.id" value="${xzfyInfo.id}" />
			<input type="hidden" id="checkstatus" name="tempchsta" value="${xzfyInfo.check_status}" />		
			<input type="hidden" id="zidongzhanshi" name="" value="${xzfyInfo.status}" />			
			<input type="hidden" id="checkid" name="checkid" value="" />			
			<input type="hidden" name="xzfySenpi.sqspren_id" value="<#if xzfyInfo.user2_id?has_content>${xzfyInfo.user2_id}</#if>" />
			<input type="hidden" name="xzfySenpi.sqspren_name" value="<#if xzfyInfo.user2_name?has_content>${xzfyInfo.user2_name}</#if>" />
			<input type="hidden" name="admit_name" value="${admit_name}" />
			<input type="hidden" id="isView" name="isView" value="${isView}" />
			<#assign user_id=Session['_USER_LOGIN_'].id>
			<#assign user2_id=xzfyInfo.user2_id?default(0)>
			<#assign user2_id=user2_id?number>
			<#assign user3_id=xzfyInfo.user3_id?default(0)>
			<#assign user3_id=user3_id?number>
			<input type="hidden" id="checksize" value="${shenpiList1.size()}" />
			<input type="hidden" name="pNum" value="${pNum}" />
<div class="align-right">
		<script>
	var subcat = new Array();
	
	<#assign count=0>
	 <#list shenpirenList as uList>
	 	subcat[${count}]=new Array('${uList.getId()}','${uList.getName()}'); 
	 	<#assign count=count+1>
	 </#list>
	</script>
	<#if user_id==user2_id || user_id==user3_id>
		<#if isView==1>
			<#if isst != "1">
				<a href="javascript:saveToDocPrint()" title="" class="btn-blue btn">打印</a>
				<a href="javascript:saveToZhongzhiDoc()" <#if xzfyInfo.check_status != "0">disabled</#if> title="" class="btn-blue btn">生成中止通知书</a>
			<#else>
				<a href="javascript:saveToDocPrint()" title="" class="btn-blue btn">打印</a>
				<#if doczhongzhiNum != 0>
				<a href="javascript:getZhongzhishenqingshu()" <#if xzfyInfo.check_status != "0">disabled</#if> title="" class="btn-blue btn">查看中止通知书</a>
				</#if>
			</#if>
		<#elseif isView==0>
			<a href="javascript:saveToDocPrint()" title="" class="btn-blue btn">打印</a>
			<#if doczhongzhiNum != 0>
			<a href="javascript:getZhongzhishenqingshu()" <#if xzfyInfo.check_status != "0">disabled</#if> title="" class="btn-blue btn">查看中止通知书</a>
			</#if>
		</#if>
	<#else>
		<#if doczhongzhiNum != 0>
		<a href="javascript:getZhongzhishenqingshu()"  title="" class="btn-blue btn">查看中止通知书</a>
		</#if>
	</#if>
</div>			
			
	<div class="z_wrap_info" id="banan">
	

			<h2 class="z_title"><font style="font-family:宋体;font-size:24px">${xzfyInfo.break_right?default('')}行政复议案件<br/>处理（中止审理）呈报表</font></h2>
			<p align=right><font style="font-family:宋体;font-size:16px">${xzfyInfo.tjzfzh?default('')}</font></p>
			<div class="z_info">
		  	<table id="zhongzhi"  width="100%" cellpadding="0" cellspacing="0" border="0" class="z_info_table">	  			
		  		<tr>
					<th width="18%">申请人</td>
					<td colspan="3" width="82%">${xzfyInfo.app_show?default('')}</td>
				</tr>
				<tr>
					<th width="18%">被申请人</td>
					<td colspan="3" width="82%">${xzfyInfo.defendant_name?default('')}</td>
				</tr>
				<tr>
					<th width="18%">第三人</td>
					<td width="32%">${xzfyInfo.third?default('')}</td>
					<th width="18%">案件类型</td>
					<td width="32%"><#assign caseType=xzfyInfo.casetype?default('0')>
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
					<th>收案日期</td>
					<td>${xzfyInfo.receive_date?default('')}</td>
					<th>立案日期</td>
					<td>${xzfyInfo.lian_date?default('')}</td>
				</tr>
				<tr>
				<#assign stop_detail='    因出现法定中止事由，建议中止该行政复议案件的审理。'>
				<#if xzfyInfo.stop_detail?has_content>
					<#assign stop_detail='    '+xzfyInfo.stop_detail?trim>
				</#if>
					<td colspan="4">
						<!--class="f12 c6"   class="mt10 em2" -->
						<div class="f12 c6">承办人意见：<br>
						
							<!--onpropertychange="if(this.scrollHeight>80) this.style.posHeight=this.scrollHeight+5"-->
							
							<textarea onkeyup="checkLen(this)" name="stop_detail" type="text" class="textarea5" value="" id="stop_detail" >${stop_detail}</textarea>
							<div align="right"><font style="font-size:15px">您还可以输入 <span id="count"></span> 个文字</font></div>							
						</div>
						<script type="text/javascript">
							function checkLen(obj) 
							{
							 var maxChars = 105;//最多字符数
							 if (obj.value.length > maxChars)
							 obj.value = obj.value.substring(0,maxChars);
							 var curr = maxChars - obj.value.length;
							 document.getElementById("count").innerHTML = curr.toString();
							}
						</script>
						<div class="mt10 c6 f12">
							<select name="" class="select-page" id="zhongzhispr" onchange="setChecker('${stop_detail}')">
								<option value="0">未指定审批人</option>
								<#list shenpirenList as uList>
								<option value="${uList.getId()}" >${uList.getName()}</option>
								</#list>
							</select>	
							<!--<a href="javascript:spr()" class="btn-blue btn" >选择审批人</a>	-->
							<script>
								a=1
								function spr(){
									if(a==1){
										document.getElementById('zhongzhispr').style.display="block";
										a=0;}
									else{
										document.getElementById('zhongzhispr').style.display="none";
										a=1;}
								}
							</script>	
					
						<#if user_id==user2_id || user_id==user3_id>		
							<#if xzfyInfo.check_status=="1">
								<a href="javascript:withdrawsp()" class="btn-blue btn" >取消审批</a>
							<#else>
								<#if xzfyInfo.status?exists && xzfyInfo.status != "4" && xzfyInfo.status != "6" && xzfyInfo.status != "7" && xzfyInfo.status != "10" || xzfyInfo.check_status != "0" || isst != "0"  >
								<#else>	
									<a href="javascript:tijiaoshenpi7()" class="btn-blue btn"  >提交审批</a>
								</#if>
							</#if>
							
							<#if xzfyInfo.status=="7" && xzfyInfo.check_status != "1" && isst != "1">
								<a href="javascript:save8()" class="btn-blue3 btn" <#if xzfyInfo.status?exists && xzfyInfo.status != "4" && xzfyInfo.status != "6" && xzfyInfo.status != "7" && xzfyInfo.status != "10" || xzfyInfo.check_status != "0" || isst != "0" >disabled</#if> >完成</a>
							</#if>
							<#if isView==1>						
								<#if isst != "1">					
									<a href="javascript:zancun()" class="btn-blue3" >暂存</a>
								</#if>						
							</#if>
						</#if>
					
							<!--<#if xzfyInfo.zhongzhispdate?has_content><p align=right>${xzfyInfo.user2_name?default('')}:${xzfyInfo.zhongzhispdate?default('')}提交</p></#if>-->
							<p align=right>${xzfyInfo.user2_name?default('')}:<input size="10" style="font-family:宋体;font-size:17px" name="shenpiDate" id="shenpiDate" altname="提交审批日期" type="text" onClick="WdatePicker()"  value="<#if xzfyInfo.zhongzhispdate?exists>${xzfyInfo.zhongzhispdate?default('')}<#else>${todate}</#if>">提交</p>
						</div>
						<div class="mt10 c6 f12" align=left>
												
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="height:220px">
						<div class="mt10 c6 f12">领导批示：<br><br>
							<#list shenpiList1 as xzfyShenpi>
								<font style="font-family:黑体;font-size:18px;">&nbsp;&nbsp;&nbsp;${xzfyShenpi.check_name?default('')}:&nbsp;${xzfyShenpi.check_advise?default('')}&nbsp;${xzfyShenpi.check_date?default('')}&nbsp;<#if xzfyShenpi.check_result?has_content && xzfyShenpi.check_result=="2">退回</#if></font><br>
							</#list>	
							<#if shenpiList1.size()==0>
							<br><br><br><br>
							</#if>	
							<br><br>				
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div class="f12 c6">备注：</div>
						<div class="mt10 em2">
							<textarea name="pifuyijian1" type="text" class="textarea2" value=""  >${xzfyInfo.pifuyijian1?default('')}</textarea>							
						</div>
					
					</td>
				</tr>
				<#if isView==1>
						
							<#if isst != "1">
		  		<tr style="display:none">
					<td colspan="4">
						<div class="align-center"><br>
					
								<a href="javascript:zancun()" class="btn-blue btn" >暂存</a>
						
						</div>
					</td>
				</tr>
					</#if>

						
					</#if>
		  		<input type="hidden" id="pizhunren1" name="pizhunren1" />			  						
			</table>
			</div>
		</div>			
			
		</form>
	</body>
	</html>
	<script >

	function gotoBack(){
		window.history.back();
	}

	function iszhongzhisp(){
		//通过选择延期审批人控制批准人批复意见框是否显示
		if(document.getElementById("zhongzhispr").value=="0"){
			document.getElementById("zhongzhipz").style.display="block";			
		}
		else{
			document.getElementById("zhongzhipz").style.display="none";
		}
	}
	
	function opendg(dgurl,dgw,dgh)
	{
	//alert(1111);
	  $.dialog({ 
	    title:'',
	    width: dgw,
	    height: dgh,
	    content:'url:'+ dgurl});
	}

	function save8(){
		//if(document.getElementById("zhongzhispr").value==0){	
		//	alert("请选择审批人");
		//	return;
		//}
		//if(document.getElementById("zhongzhispdate").value==""){	
		//	alert("请输入审批日期");
		//	return;
		//}
		//if(document.getElementById("zhongzhidate").value==""){	
		//	alert("请输入中止日期");
		//	return;
		//}
		if(confirm("确认提交？")){
			document.getElementById("pizhunren1").value=document.getElementById("zhongzhispr").value;
			window.form1.action="savebanan.action?tempstatus=8&tempcheckstatus=0&isstop=1&listkeyword=${listkeyword}" ;
			window.form1.submit();
			alert("操作已完成！");
		}
	}

	function tijiaoshenpi7(){
		//提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("zhongzhispr").value==0){	
			alert("请选择审批人");
			return;
		}
		//if(document.getElementById("zhongzhidate").value==""){	
		//	alert("请输入中止日期");
		//	return;
		//}
		if(confirm("确认提交？")){	
			document.getElementById("checkid").value=document.getElementById("zhongzhispr").value;	
			window.form1.action="saveshenpi.action?tempstatus=7&xzfyShenpi.check_type=7&tempcheckstatus=1&listkeyword=${listkeyword}";	
			window.form1.submit();
		}
	}

	function withdrawsp(){
		if(document.getElementById("checkstatus").value==0){	
			alert("您未提交审批");
			return;
		}
		if(confirm("确认取消？")){	
			window.form1.action="withdrawsp.action";	
			window.form1.submit();
		}
	}
	
		function zancun(){
		if(confirm("确认暂存？")){
			window.form1.action="savechengbaobiao.action";	
			window.form1.submit();
		}
	}

	function saveToZhongzhiDoc(){
		//if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savebanan.action', //提交给哪个执行 
				type:'POST', 
				success: getZhongzhishenqingshu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		//}
	}	
	function getZhongzhishenqingshu(){
		var isView=document.getElementById("isView").value;
		if(isView=="0")
		{
			var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=zhongzhishenlitongzhishu&actiontype=yuedu";
		}
		else{
			var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=zhongzhishenlitongzhishu&actiontype=1";
		}
		//var url="http://localhost:8080/webIscp/fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow2','location=no,resizable=yes');
	}
	
function saveToDocPrint(){
		//if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savechengbaobiao.action', //提交给哪个执行 
				type:'POST', 
				success: docPrint //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		//}
	}
	function docPrint(){
			if(document.getElementById("checksize").value==0)
			var url="../fzb_default_shenpidanweishenpi.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_checkstatus=7";
		else
		var url="../fzb_default_shenpidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_checkstatus=7";
		//var url="http://localhost:8080/webIscp/fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyInfo.id}";
		window.open(url,'mainwindow1','location=no,resizable=yes');
	}
			  function setChecker(xx){
			  	for(var i=0;i<subcat.length;i++){
			  		if(document.getElementById("zhongzhispr").value==subcat[i][0]){
			  				document.getElementById("stop_detail").value=document.getElementById("stop_detail").value+"请"+subcat[i][1]+"同志阅示。";
			  	}
			  }
	}	
	
</script>