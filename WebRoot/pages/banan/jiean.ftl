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
	<form id="form1" action="" method="post" ENCTYPE="multipart/form-data" >
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
			<input type="hidden" id="checksize" value="${shenpiList3.size()}" />
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
			<a href="javascript:saveToDocPrint()" title="在线审批专用" class="btn-blue3 btn" >呈报表一</a>
			<a href="javascript:saveToDocPrint1()" title="两级审批专用" class="btn-blue4 btn">呈报表二</a>
			<a href="javascript:saveToDocPrint2()" title="三级审批专用" class="btn-blue4 btn">呈报表三</a>
			<a href="javascript:saveToDocPrint3()" title="区县四级审批专用" class="btn-blue4 btn" >呈报表四</a>
			<a href="javascript:saveToJieanDoc()" title="" <#if xzfyInfo.check_status != "0">disabled</#if> class="btn-blue4 btn">结案文书</a>
			<a href="javascript:saveToYijianDoc()" title="" <#if xzfyInfo.check_status != "0">disabled</#if> class="btn-blue4 btn">意见书</a>
			<a href="javascript:saveToJianyiDoc()" title="" <#if xzfyInfo.check_status != "0">disabled</#if> class="btn-blue4 btn">建议书</a>
		<#elseif isView==0>
			<a href="javascript:saveToDocPrint()" title="在线审批专用" class="btn-blue3 btn">呈报表一</a>
			<a href="javascript:saveToDocPrint1()" title="两级审批专用" class="btn-blue4 btn">呈报表二</a>
			<a href="javascript:saveToDocPrint2()" title="三级审批专用" class="btn-blue4 btn">呈报表三</a>
			<a href="javascript:saveToDocPrint3()" title="区县四级审批专用" class="btn-blue4 btn" >呈报表四</a>
			<#if docjieanNum != 0 || docjieanNum1 != 0 || docjieanNum2 != 0 || docjieanNum3 != 0 >
			<a href="javascript:getJieanshenqingshu()" title=""  class="btn-blue btn">查看结案文书</a>
			</#if>
			<#if docyijianNum != 0>
			<a href="javascript:getYijianshu()" title=""  class="btn-blue3 btn">意见书</a>
			</#if>
			<#if docjianyiNum != 0>
			<a href="javascript:getJianyishu()" title=""  class="btn-blue3 btn">建议书</a>
			</#if>
		</#if>
	<#else>
		<#if docjieanNum != 0 || docjieanNum1 != 0 || docjieanNum2 != 0 || docjieanNum3 != 0 >
		<a href="javascript:getJieanshenqingshu()" title=""  class="btn-blue btn">查看结案文书</a>
		</#if>
		<#if docyijianNum != 0>
		<a href="javascript:getYijianshu()" title=""  class="btn-blue3 btn">意见书</a>
		</#if>
		<#if docjianyiNum != 0>
		<a href="javascript:getJianyishu()" title=""  class="btn-blue3 btn">建议书</a>
		</#if>
	</#if>	
</div>			
			
	<div class="z_wrap_info" id="banan">
	

			
			<h2 class="z_title"><font style="font-family:宋体;font-size:24px">${xzfyInfo.break_right?default('')}行政复议案件<br/>
			结案（<span id="biaotou">
		 			<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="0"></#if>
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="1">驳回</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="2">维持</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="3">确认违法</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="4">撤销</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="5">变更</#if>
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="6">责令履行</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="7">调解</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="8">终止</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="9">其他</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="10">行政确认</#if> 
					<#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="11">举报投诉处理</#if> 
				</span>）呈报表</font></h2>
			<p align=left>
				<font face=宋体>结案方式：</font>
				<select name="finish_type" id="jafs" onchange="jafss()" >
				  <option value="0" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="0">selected</#if> >----请选择----</option>
				  <option value="1" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="1">selected</#if> >驳回</option>
				  <option value="2" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="2">selected</#if> >维持</option>
				  <option value="3" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="3">selected</#if> >确认违法</option>
				  <option value="4" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="4">selected</#if> >撤销</option>
				  <option value="5" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="5">selected</#if> >变更</option>
				  <option value="6" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="6">selected</#if> >责令履行</option>
				  <option value="7" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="7">selected</#if> >调解</option>
				  <option value="8" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="8">selected</#if> >终止</option>
				  
			      <option value="10" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="10">selected</#if> >行政确认</option>
				  <option value="11" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="11">selected</#if> >举报投诉处理</option>		 
				  
				  <option value="9" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="9">selected</#if> >其他</option>		 
			      
			   
			    
			    </select>
			    <input type="hidden" name="finishBreakType" id="finishBreakType" value="" />
			    <select name="" id="jafs1" onchange="jafs11()" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="8">style="display:''" <#else>style="display:none"</#if>>
				  <option value="0" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="0">selected</#if> >----请选择----</option>
				  <option value="1" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="1">selected</#if> >和解协议</option>
				  <option value="5" <#if xzfyInfo.finishBreakType?exists && (xzfyInfo.finishBreakType=="2" ||  xzfyInfo.finishBreakType=="3" )>selected</#if> >撤回申请 </option>
				<#--  <option value="3" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="3">selected</#if> >被申请人改变后撤回申请</option>-->
				  <option value="4" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="4">selected</#if> >其他</option>		 
			    </select>
			    <select name="" id="jafs2" onchange="jafs22()" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="1">style="display:''" <#else>style="display:none"</#if>>
				  <option value="0" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="0">selected</#if> >----请选择----</option>
				  <option value="5" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="5">selected</#if> >已经履行法定职责</option>
				  <option value="6" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="6">selected</#if> >不应当受理 </option>
				  <option value="7" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="7">selected</#if> >其他</option>	 
			    </select>
			</p>
			
			<p align=right><font style="font-family:宋体;font-size:16px">${xzfyInfo.tjzfzh?default('')}</font></p>
			
			<div class="z_info">
		  	<table id="jiean" width="100%" cellpadding="0" cellspacing="0" border="0" class="z_info_table">	  			
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
				<input type="hidden" id="jaAdvice1" value="${xzfyInfo.jaAdvice?default('')}" />
				<input type="hidden" id="jaAdvice2" value="${xzfyInfo.content_abstract?default('')}" />
	 			
					<td colspan="4">
						<!--class="f12 c6"   class="mt10 em2" -->
						<div class="f12 c6">承办人意见：<br/>
						
							<!--onpropertychange="if(this.scrollHeight>80) this.style.posHeight=this.scrollHeight+5"-->
							<#if xzfyInfo.jaAdvice?has_content>
								<textarea onkeyup="checkLen(this)" name="jaAdvice" id="jaAdvice00" type="text" class="textarea4" value="" >${xzfyInfo.jaAdvice?default('')}</textarea>
								<textarea name="jaAdvice" id="jaAdvice0" type="text" class="textarea4" style="display:none" ></textarea>
							<#else>
								<textarea onkeyup="checkLen(this)" name="jaAdvice" id="jaAdvice0" type="text" class="textarea4" value="" >  ${xzfyInfo.content_abstract?default('')}。经审查：根据《中华人民共和国行政复议法》第  条、《中华人民共和国行政复议法实施条例》第  条的规定，建议</textarea>
							</#if>	
							<div align="right"><font style="font-size:15px">您还可以输入 <span id="count"></span> 个文字</font></div>			
						</div>
						<script type="text/javascript">
							function checkLen(obj) 
							{
							 var maxChars = 245;//最多字符数
							 if (obj.value.length > maxChars)
							 obj.value = obj.value.substring(0,maxChars);
							 var curr = maxChars - obj.value.length;
							 document.getElementById("count").innerHTML = curr.toString();
							}
						</script>
						<div class="mt10 c6 f12">	
							<select name="" class="select-page" id="jieanspr" onchange="setChecker('${xzfyInfo.jaAdvice?default('')}')">
								<option value="0">未指定审批人</option>
								<#list shenpirenList as uList>
								<option value="${uList.getId()}" >${uList.getName()}</option>
								</#list>
							</select>
							<!--<a href="javascript:spr()" class="btn-blue btn" >选择审批人</a>-->	
							<script>
								a=1
								function spr(){
									if(a==1){
										document.getElementById('jieanspr').style.display="block";
										a=0;}
									else{
										document.getElementById('jieanspr').style.display="none";
										a=1;}
								}
							</script>
					
						<#if user_id==user2_id || user_id==user3_id>			
							<#if xzfyInfo.check_status=="1">
								<a href="javascript:withdrawsp()" class="btn-blue btn" >取消审批</a>
							<#else>
								<#if xzfyInfo.status?exists && xzfyInfo.status != "4" && xzfyInfo.status != "6" && xzfyInfo.status != "11" && xzfyInfo.status != "10" || xzfyInfo.check_status != "0" >
								<#else>
									<a href="javascript:tijiaoshenpi11()" class="btn-blue btn"  >提交审批</a>
								</#if>	
							</#if>
							
							<#if xzfyInfo.status=="11" && xzfyInfo.check_status != "1">
								<a href="javascript:save12()" class="btn-blue3 btn" <#if xzfyInfo.status?exists && xzfyInfo.status != "4" && xzfyInfo.status != "6" && xzfyInfo.status != "11" && xzfyInfo.status != "10" || xzfyInfo.check_status != "0" >disabled</#if> >结案</a>
							</#if>
							<#if isView==1>
								<a href="javascript:zancun()" class="btn-blue3" >暂存</a>
							</#if>
						</#if>
					
							<!--<#if xzfyInfo.jieanspdate?has_content><p align=right>${xzfyInfo.user2_name?default('')}:${xzfyInfo.jieanspdate?default('')}提交</p></#if>-->
							<p align=right>${xzfyInfo.user2_name?default('')}:<input size="10" style="font-family:宋体;font-size:17px" name="shenpiDate" id="shenpiDate" altname="提交审批日期" type="text" onClick="WdatePicker()"  value="<#if xzfyInfo.jieanspdate?exists>${xzfyInfo.jieanspdate?default('')}<#else>${todate}</#if>">提交</p>
						</div>

					</td>
				</tr>
				<tr>
					<td colspan="4" style="height:220px">
						<div class="mt10 c6 f12">领导批示：<br><br>
							<#list shenpiList3 as xzfyShenpi>
								<font style="font-family:黑体;font-size:18px;">
								&nbsp;&nbsp;&nbsp;${xzfyShenpi.check_name?default('')}:&nbsp;${xzfyShenpi.check_advise?default('')}&nbsp;${xzfyShenpi.check_date?default('')}&nbsp;<#if xzfyShenpi.check_result?has_content && xzfyShenpi.check_result=="2">退回</#if></font><br>
							</#list>
							<#if shenpiList3.size()==0>
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
							<textarea name="pifuyijian3" type="text" class="textarea2" value="" >${xzfyInfo.pifuyijian3?default('')}</textarea>							
						</div>
					
					</td>
				</tr>
					<#if isView==1>
						<#if xzfyInfo.status == "10" || xzfyInfo.status == "11">
		  		
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
		  		
		  		
		  		
		  		
		  		
		  		
		  		
		  		
		  	<!--
				<tr>
					<th>结案日期</th>
					<td colspan="2">
						<input name="finish_date" class="z_input1"  id="jieandate"
					     	   value="<#if xzfyInfo.finish_date?has_content>${xzfyInfo.finish_date}</#if>" onClick="WdatePicker()" >
					</td>
					<th>办理文号</th>
					<td>${xzfyInfo.tjzfzh?default('')}</td>
				</tr>
				-->
			
			<!--
				<tr>      
		     		<th>国家赔偿</th>
				    <td colspan=2 >
				    	<input type="radio" name="nationMoney" value="0" id="gjpc" <#if xzfyInfo.nationMoney?exists && xzfyInfo.nationMoney == "0" || !xzfyInfo.nationMoney?exists >checked</#if> onclick="gjpcc()" />  否
				    	<input type="radio" name="nationMoney" value="1" id="gjpc1" <#if xzfyInfo.nationMoney?exists && xzfyInfo.nationMoney == "1" >checked</#if> onclick="gjpcc1()" />  是
				    </td>
				    <th>赔偿金额</th>
					<td>
						<input type="text" name="nationMoneyDetail" value="<#if xzfyInfo.nationMoneyDetail?has_content>${xzfyInfo.nationMoneyDetail}</#if>" id="pcje" class="inputTextNormal" disabled />
					</td>
		  		</tr>
		  		-->
		  		
			
				
				
			<!--
				<tr>
					<td colspan="5">
						<div class="mt10 c6 f12">领导批示：<br><br>
							<#list shenpiList3 as xzfyShenpi><br/>
							<#if xzfyShenpi.check_result == "1" >
								${xzfyShenpi.check_name}：已通过
							<#elseif xzfyShenpi.check_result == "2">
								${xzfyShenpi.check_name}：已拒绝
							<#else>
								${xzfyShenpi.check_name}：未审批
							</#if>
						</#list>					
						</div>
					</td>
				</tr>
				-->	
		  		
				<input type="hidden" id="pizhunren3" name="pizhunren3" />
		  		<!--
		  		<tr class="trcolor" id="jieanpz" style="display:block" >      
				    <td colspan="5">	
						<div class="mt10 c6 f12">请选择批准人：
							<select name="pizhunren3" class="select" id="" onchange="">
								<option value="0">未指定批准人</option>
								<#list shenpirenList as uList>
								<option value="${uList.getId()}" >${uList.getName()}</option>
								</#list>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<#if xzfyInfo.pizhunren3?has_content>批准人为：${xzfyInfo.pizhunren3}</#if>
						</div>
				    </td>			    					
		  		</tr>	
		  		-->

			</table>
			</div>
		</div>		
			
		</form>

	</body>
	</html>
	<script type="text/javascript">

	function gotoBack(){
		window.history.back();
	}

	function isjieansp(){
		//通过选择延期审批人控制批准人批复意见框是否显示
		if(document.getElementById("jieanspr").value=="0"){
			document.getElementById("jieanpz").style.display="block";			
		}
		else{
			document.getElementById("jieanpz").style.display="none";
		}
	}
	function jafss(){
		var biaotou;
		if(document.getElementById("jafs").value=="1")	
			biaotou="驳回";
		else if(document.getElementById("jafs").value=="2")	
			biaotou="维持";
		else if(document.getElementById("jafs").value=="3")	
			biaotou="确认违法";
		else if(document.getElementById("jafs").value=="4")	
			biaotou="撤销";
		else if(document.getElementById("jafs").value=="5")	
			biaotou="变更";
		else if(document.getElementById("jafs").value=="6")	
			biaotou="责令履行";
		else if(document.getElementById("jafs").value=="7")	
			biaotou="调解";
		else if(document.getElementById("jafs").value=="8")	
			biaotou="终止";
		else if(document.getElementById("jafs").value=="10")	
			biaotou="行政确认";
		else if(document.getElementById("jafs").value=="11")	
			biaotou="举报投诉处理";
		else	
			biaotou="其他";
		document.getElementById("biaotou").innerHTML=biaotou;
		if(document.getElementById("jafs").value=="8"){
			document.getElementById("jafs1").style.display="block";
			document.getElementById("jafs2").style.display="none";
		}
		else if(document.getElementById("jafs").value=="1"){
			document.getElementById("jafs2").style.display="block";
			document.getElementById("jafs1").style.display="none";
		}
		else{
			document.getElementById("jafs1").style.display="none";
			document.getElementById("jafs2").style.display="none";
		}
		var x;
		var y=document.getElementById("jaAdvice2").value;
		var z='。经审查：根据《中华人民共和国行政复议法》第  条、《中华人民共和国行政复议法实施条例》第  条的规定，建议';

		if(document.getElementById("jaAdvice1").value==''){
			if(document.getElementById("jafs").value=="1")	
				x="驳回";
			else if(document.getElementById("jafs").value=="2")	
				x="维持";
			else if(document.getElementById("jafs").value=="3")	
				x="确认该行政行为违法";
			else if(document.getElementById("jafs").value=="4")	
				x="撤销";
			else if(document.getElementById("jafs").value=="5")	
				x="变更";
			else if(document.getElementById("jafs").value=="6")	
				x="责令履行";
			else if(document.getElementById("jafs").value=="7")	
				x="调解";
			else if(document.getElementById("jafs").value=="8")	
				x="终止";
			else if(document.getElementById("jafs").value=="10")	
				x="行政确认";
			else if(document.getElementById("jafs").value=="11")	
				x="举报投诉处理";
			else	
				x="其他";
			x='  '+y+z+x+'。';
			document.getElementById("jaAdvice0").innerText=x;
		}
		else{
			if(confirm("更改结案方式将覆盖已经填好的承办人意见，请确认")){
				if(document.getElementById("jafs").value=="1")	
					x="驳回";
				else if(document.getElementById("jafs").value=="2")	
					x="维持";
				else if(document.getElementById("jafs").value=="3")	
					x="确认该行政行为违法";
				else if(document.getElementById("jafs").value=="4")	
					x="撤销";
				else if(document.getElementById("jafs").value=="5")	
					x="变更";
				else if(document.getElementById("jafs").value=="6")	
					x="责令履行";
				else if(document.getElementById("jafs").value=="7")	
					x="调解";
				else if(document.getElementById("jafs").value=="8")	
					x="终止";
				else if(document.getElementById("jafs").value=="10")	
					x="行政确认";
				else if(document.getElementById("jafs").value=="11")	
					x="举报投诉处理";
					
				else	
					x="其他";
				x='  '+y+z+x+"。";
				document.getElementById("jaAdvice00").innerText=x;
			}
			else{
				document.getElementById("jafs").options[${xzfyInfo.finish_type?default('0')}].selected=true;
				var xx=${xzfyInfo.finishBreakType?default('0')};
				xx = parseFloat(xx);
				if(xx < 5){
					document.getElementById("jafs1").style.display="block";
					document.getElementById("jafs2").style.display="none";
					document.getElementById("jafs1").options[xx].selected=true;
				}
				else{
					xx=xx-4;
					document.getElementById("jafs1").style.display="none";
					document.getElementById("jafs2").style.display="block";
					document.getElementById("jafs2").options[xx].selected=true;
				}
			}
		}
	}
	
	function jafs11(){
		document.getElementById("finishBreakType").value=document.getElementById("jafs1").value;
	}
	
	function jafs22(){
		document.getElementById("finishBreakType").value=document.getElementById("jafs2").value;
	}

	function gjpcc(){
			document.getElementById("pcje").disabled=true;
	}
	function gjpcc1(){
			document.getElementById("pcje").disabled=false;
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
	
	function save12(){
		if(confirm('请进入“案件信息”中核查相关信息填写无误后，点击蓝色结案按钮。')){
			parent.location="../banan/bananform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}";
		
		}
		
		//if(document.getElementById("jieanspr").value==0){	
		//	alert("请选择审批人");
		//	return;
		//}
		//if(document.getElementById("jieandate").value==""){	
		//	alert("请输入结案日期");
		//	return;
		//}
		//if(document.getElementById("jieanspdate").value==""){	
		//	alert("请输入审批日期");
		//	return;
		//}
		/*
		if(document.getElementById("jafs").value=="0"){	
			alert("请选择结案方式");
			return;
		}
		if(confirm("确认提交？")){
			document.getElementById("pizhunren3").value=document.getElementById("jieanspr").value;
			window.form1.action="savebanan.action?tempstatus=12&tempcheckstatus=0&listkeyword=${listkeyword}";
			window.form1.submit();
			alert("操作已完成！");
		}
		*/
	}

	function tijiaoshenpi11(){
		//提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("jieanspr").value==0){	
			alert("请选择审批人");
			return;
		}
		//if(document.getElementById("jieandate").value==""){	
		//	alert("请输入结案日期");
		//	return;
		//}
		if(document.getElementById("jafs").value=="0"){	
			alert("请选择结案方式");
			return;
		}
		if(document.getElementById("jafs").value=="1"){	
			if(document.getElementById("jafs2").value=="0"){	
			alert("请选择驳回方式");
			return;
		}
		}
		if(document.getElementById("jafs").value=="8"){	
			if(document.getElementById("jafs1").value=="0"){	
			alert("请选择终止方式");
			return;
		}
		}
		if(confirm("确认提交？")){
			document.getElementById("checkid").value=document.getElementById("jieanspr").value;		
			window.form1.action="saveshenpi.action?tempstatus=11&xzfyShenpi.check_type=11&tempcheckstatus=1&listkeyword=${listkeyword}";	
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

	function saveToJieanDoc(){
		if(document.getElementById("jafs").value=="0"){
			alert("请选择结案方式");
			return;
		}if(document.getElementById("jafs").value=="1"){	
			if(document.getElementById("jafs2").value=="0"){	
			alert("请选择驳回方式");
			return;
		}
		}
		if(document.getElementById("jafs").value=="8"){	
			if(document.getElementById("jafs1").value=="0"){	
			alert("请选择终止方式");
			return;
		}
		}
		//if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savebanan.action', //提交给哪个执行 
				type:'POST', 
				success: getJieanshenqingshu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		//}
	}	
	function getJieanshenqingshu(){
		var isView=document.getElementById("isView").value;
		if(isView=="0")
		{
			var b = document.getElementById("jafs").value;
			if(document.getElementById("jafs").value=="1")	
				var url ="../fzb_default_dafutongzhijiean.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyijuedingshu&actiontype=yuedu&finish_type="+b;
			else if(document.getElementById("jafs").value=="2" || document.getElementById("jafs").value=="3" || document.getElementById("jafs").value=="4" || document.getElementById("jafs").value=="5" || document.getElementById("jafs").value=="9")	
				var url ="../fzb_default_dafutongzhijiean.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyijuedingshu&actiontype=yuedu&finish_type="+b;
			else if(document.getElementById("jafs").value=="6")	
				var url ="../fzb_default_dafutongzhijiean.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyijuedingshu&actiontype=yuedu&finish_type="+b;
			else if(document.getElementById("jafs").value=="7")	
				var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyitiaojie&actiontype=yuedu";
			else if(document.getElementById("jafs").value=="8")	
				var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyizhongzhi&actiontype=yuedu";
			else
				var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyizelinglvxing&actiontype=yuedu";
		}
		else{
			var b = document.getElementById("jafs").value;
			if(document.getElementById("jafs").value=="1")	
				var url ="../fzb_default_dafutongzhijiean.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyijuedingshu&actiontype=1&finish_type="+b;
			else if(document.getElementById("jafs").value=="2" || document.getElementById("jafs").value=="3" || document.getElementById("jafs").value=="4" || document.getElementById("jafs").value=="5" || document.getElementById("jafs").value=="9")	
				var url ="../fzb_default_dafutongzhijiean.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyijuedingshu&actiontype=1&finish_type="+b;
			else if(document.getElementById("jafs").value=="6")	
				var url ="../fzb_default_dafutongzhijiean.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyijuedingshu&actiontype=1&finish_type="+b;
			else if(document.getElementById("jafs").value=="7")	
				var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyitiaojie&actiontype=1";
			else if(document.getElementById("jafs").value=="8")	
				var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyizhongzhi&actiontype=1";
			else
				var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyizelinglvxing&actiontype=1";
		}

		//var url="http://localhost:8080/webIscp/fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow1','location=no,resizable=yes');
	}
	
	function saveToYijianDoc(){
	if(document.getElementById("jafs").value=="0"){
			alert("请选择结案方式");
			return;
		}if(document.getElementById("jafs").value=="1"){	
			if(document.getElementById("jafs2").value=="0"){	
			alert("请选择驳回方式");
			return;
		}
		}
		if(document.getElementById("jafs").value=="8"){	
			if(document.getElementById("jafs1").value=="0"){	
			alert("请选择终止方式");
			return;
		}
		}
		//if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savebanan.action', //提交给哪个执行 
				type:'POST', 
				success: getYijianshu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		//}
	}	
	function getYijianshu(){
		var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyiyijianshu";
		//var url="http://localhost:8080/webIscp/fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow2','location=no,resizable=yes');
	}
	
	function saveToJianyiDoc(){
	if(document.getElementById("jafs").value=="0"){
			alert("请选择结案方式");
			return;
		}if(document.getElementById("jafs").value=="1"){	
			if(document.getElementById("jafs2").value=="0"){	
			alert("请选择驳回方式");
			return;
		}
		}
		if(document.getElementById("jafs").value=="8"){	
			if(document.getElementById("jafs1").value=="0"){	
			alert("请选择终止方式");
			return;
		}
		}
		//if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savebanan.action', //提交给哪个执行 
				type:'POST', 
				success: getJianyishu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		//}
	}	
	function getJianyishu(){
		var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&mstype=xingzhengfuyijianyishu";
		//var url="http://localhost:8080/webIscp/fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow3','location=no,resizable=yes');
	}
function saveToDocPrint(){
if(document.getElementById("jafs").value=="0"){
			alert("请选择结案方式");
			return;
		}if(document.getElementById("jafs").value=="1"){	
			if(document.getElementById("jafs2").value=="0"){	
			alert("请选择驳回方式");
			return;
		}
		}
		if(document.getElementById("jafs").value=="8"){	
			if(document.getElementById("jafs1").value=="0"){	
			alert("请选择终止方式");
			return;
		}
		}
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
		var a = document.getElementById("jafs").value;
		if(a=="0"){
			alert("请选择结案方式");
			return;
		}
		if(document.getElementById("checksize").value==0){
		
			var url="../fzb_default_shenpidanweishenpi.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_checkstatus=11&mstype=jieanshenpidan&finish_type="+a;
		window.open(url,'mainwindow4','location=no,resizable=yes');
		}	
		
		else{
		var url="../fzb_default_shenpidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_checkstatus=11&mstype=jieanshenpidan3&finish_type="+a;
		//var url="http://localhost:8080/webIscp/fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyInfo.id}";
		window.open(url,'mainwindow4','location=no,resizable=yes');
		}
	}
				  function setChecker(xx){
			  	for(var i=0;i<subcat.length;i++){
			  		if(document.getElementById("jieanspr").value==subcat[i][0]){
			  		if(xx==""){
			  				document.getElementById("jaAdvice0").value=document.getElementById("jaAdvice0").value+"请"+subcat[i][1]+"同志阅示。";
			  			}else{
			  				document.getElementById("jaAdvice00").value=document.getElementById("jaAdvice00").value+"请"+subcat[i][1]+"同志阅示。";
			  			}
			  	}
			  }
	}
	function saveToDocPrint1(){
if(document.getElementById("jafs").value=="0"){
			alert("请选择结案方式");
			return;
		}if(document.getElementById("jafs").value=="1"){	
			if(document.getElementById("jafs2").value=="0"){	
			alert("请选择驳回方式");
			return;
		}
		}
		if(document.getElementById("jafs").value=="8"){	
			if(document.getElementById("jafs1").value=="0"){	
			alert("请选择终止方式");
			return;
		}
		}
		//if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savechengbaobiao.action', //提交给哪个执行 
				type:'POST', 
				success: docPrint1 //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		//}
	}
	function docPrint1(){
		var a = document.getElementById("jafs").value;
		if(a=="0"){
			alert("请选择结案方式");
			return;
		}
		
			var url="../fzb_default_shenpidanweishenpi.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_checkstatus=11&mstype=jieanshenpidan1&finish_type="+a;

		//var url="http://localhost:8080/webIscp/fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyInfo.id}";
		window.open(url,'mainwindow4','location=no,resizable=yes');
	}
	function saveToDocPrint2(){
if(document.getElementById("jafs").value=="0"){
			alert("请选择结案方式");
			return;
		}if(document.getElementById("jafs").value=="1"){	
			if(document.getElementById("jafs2").value=="0"){	
			alert("请选择驳回方式");
			return;
		}
		}
		if(document.getElementById("jafs").value=="8"){	
			if(document.getElementById("jafs1").value=="0"){	
			alert("请选择终止方式");
			return;
		}
		}
		//if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savechengbaobiao.action', //提交给哪个执行 
				type:'POST', 
				success: docPrint2 //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		//}
	}
	function docPrint2(){
		var a = document.getElementById("jafs").value;
		if(a=="0"){
			alert("请选择结案方式");
			return;
		}

			var url="../fzb_default_shenpidanweishenpi.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_checkstatus=11&mstype=jieanshenpidan4&finish_type="+a;

		//var url="http://localhost:8080/webIscp/fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyInfo.id}";
		window.open(url,'mainwindow4','location=no,resizable=yes');
	}
	function saveToDocPrint3(){
if(document.getElementById("jafs").value=="0"){
			alert("请选择结案方式");
			return;
		}if(document.getElementById("jafs").value=="1"){	
			if(document.getElementById("jafs2").value=="0"){	
			alert("请选择驳回方式");
			return;
		}
		}
		if(document.getElementById("jafs").value=="8"){	
			if(document.getElementById("jafs1").value=="0"){	
			alert("请选择终止方式");
			return;
		}
		}
		//if(confirm("生成文书前，将会对当前操作进行保存，您确认要生成吗？")){
			var options = { 
				url:'savechengbaobiao.action', //提交给哪个执行 
				type:'POST', 
				success: docPrint3 //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return ; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		//}
	}
	function docPrint3(){
		var a = document.getElementById("jafs").value;
		if(a=="0"){
			alert("请选择结案方式");
			return;
		}

			var url="../fzb_default_shenpidanweishenpi.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_checkstatus=11&mstype=jieanshenpidan2&finish_type="+a;

		//var url="http://localhost:8080/webIscp/fzb_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyInfo.id}";
		window.open(url,'mainwindow4','location=no,resizable=yes');
	}
</script>