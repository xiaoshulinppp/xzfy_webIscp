<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>案件办理</title>
		

		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
		<link href="../css/style_form.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/16B/prototype.js"></script>
		<script type="text/javascript" src="../js/16B/function.js"></script>
		
			<!--                       Javascripts 注意不要改变顺序                      -->
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
		<!-- 组件template -->
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
		<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>

		<style>
			.diva{
			BORDER:#bfceff 1px solid;
			height:22;
			FILTER:progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr='#ddecfb',endColorStr='#ffffff');
			PADDING-TOP: 3px; 
			}
			.divb{
			BORDER: #bfceff 1px solid;
			PADDING-TOP: 10px; 
			PADDING-LEFT: 10px;
			FONT-SIZE: 12px;
			HEIGHT: 100px;
			width:180;
			border-top:0;
			}
		</style>
		<SCRIPT language=JavaScript src="../pages/xzfy/js/function.js"></SCRIPT>
	</head>
	
	
	
	
	<!-- 
			xzfyShenpi.check_result默认应设为0
			isdelay,isstop  默认设为0
	 -->
	
	
	
	
	
	
	
	
	
	<body>	

		<span class="x-line fn-clear"><img src="../${Session['_USER_STYLE_'].imagePath}/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
		
		

		
		<div class="ui-flod-title fn-clear" >
			<a href="javascript:slideFlod(page1)" >
				<span class="fn-left"><img src=	"../${Session['_USER_STYLE_'].imagePath}/icons/panel_display.png"/></span>
				<h2 class="fn-left">办案信息</h2></a>       
		</div>
		
		<div class="ui-flod-cnt fn-clear" id="page1">
		<form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">
		
		
			<#assign isde=xzfyInfo.isdelay?default('0')>
			<#assign isst=xzfyInfo.isstop?default('0')>
			
			<input type="hidden" name="xzfyDftz.sentanswerdate" value="${todate}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="tempid" value="${xzfyInfo.id}" />
			<input type="hidden" name="xzfyInfo.id" value="${xzfyInfo.id}" />
			<input type="hidden" id="checkstatus" name="tempchsta" value="${xzfyInfo.check_status}" />		
			<input type="hidden" id="zidongzhanshi" name="" value="${xzfyInfo.status}" />
			
			<input type="hidden" id="checkid" name="checkid" value="" />
			
			<input type="hidden" name="xzfySenpi.sqspren_id" value="<#if xzfyInfo.user2_id?has_content>${xzfyInfo.user2_id}</#if>" />
			<input type="hidden" name="xzfySenpi.sqspren_name" value="<#if xzfyInfo.user2_name?has_content>${xzfyInfo.user2_name}</#if>" />
			<input type="hidden" name="admit_name" value="admit_name" />
			<#assign isdelay=xzfyInfo.isdelay?default('0')>
			<#assign isstop=xzfyInfo.isstop?default('0')>
			<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
				<tr class="trcolor" align="center"> 
					<input type="button"  value="答复通知" class="ui-btn ui-btn-normal" <#if xzfyInfo.status!="4"&&xzfyInfo.status!="5"&&xzfyInfo.status!="6"&&xzfyInfo.status!="7"&&xzfyInfo.status!="8"&&xzfyInfo.status!="9"&&xzfyInfo.status!="10"&&xzfyInfo.status!="11"></#if> onclick="dftz()" />&nbsp;&nbsp;
					<input type="button"  value="延期信息" class="ui-btn ui-btn-normal" <#if isdelay=='0'>disabled</#if> onclick="yanqi()" />&nbsp;&nbsp;
					<input type="button"  value="中止信息" class="ui-btn ui-btn-normal" <#if isstop=='0'>disabled</#if>  onclick="zhongzhi()" />&nbsp;&nbsp;
					<input type="button"  value="恢复审理" class="ui-btn ui-btn-normal" <#if isstop=='0'>disabled</#if>  onclick="huifushenli()"  />&nbsp;
					<input type="button"  value="结案信息" class="ui-btn ui-btn-normal" <#if xzfyInfo.status!="4"&&xzfyInfo.status!="6"&&xzfyInfo.status!="11"&&xzfyInfo.status!="10"></#if> onclick="jiean()" />
				</tr>
			</table>
			
		
					
		<!-- start---添加答复通知---start -->
		<div class="ui-form fn-clear">
			<table id="dftz" style="display:none" width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table ui-table-form">	  			
		  		<tr >  
		  			<div>    
		     			<h1 align="center"><font color="red">答复通知</font></h1>
		     		</div>
		  		</tr>
		  		<tr class="trcolor"   >  			   
					<th class="tdFormText" width="20%" >请输入通知内容</td>
					<td class="tdFormText" width="80%" colspan="3">
						
						
						<input type="button" value="查看记录" class="ui-btn ui-btn-normal" onclick="opendg('banan/showDftzList.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}&xzfyInfo.id=${xzfyInfo.id}',900,600)" >
					</td>     		
		  		</tr>
		  		<tr class="trcolor" style="display:none" >  			   
					<td class="tdFormText" width="25%" colspan="4">
						<div align="center">
							
						</div>
					</td>      		
		  		</tr>
		  				
			</table>
		</div>
		
<!--========-- end---添加答复通知---end =======================-- end---添加答复通知---end --=======================-- end---添加答复通知---end --=======================================================================================-->		
<!--=============================================================================================================================================-->	
<!--========-- start---申请延期---start ======================-- start---申请延期---start --======================-- start---申请延期---start --=========================================================================================-->		
		
		<div class="ui-form fn-clear">
			<table id="yanqi" <#if xzfyInfo.status=="5">style="display:block"</#if> style="display:none" width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table ui-table-form">	  			
		  		<tr >  
		  			<div>    
		     			<h1 align="center"><font color="red">延期审理</font></h1>
		     		</div>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >延期事由</td>
				    <td class="tdFormInput" width="30%" colspan=3 >			
				    	 <textarea name="delay_detail" type="text" value="" class="textarea" id="" ischeck="y" altname="" ><#if xzfyInfo.delay_detail?has_content>${xzfyInfo.delay_detail}</#if></textarea>
				    </td>					   
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >审批人</td>
				    <td class="tdFormInput" width="30%" colspan=2>
						<select name="" id="yanqispr" onchange="isyanqisp()">
						    <option value="0">未指定审批人</option>
						    <!--  <#list xzfyInfo.getXzfyShenpis() as list>						    
						    </#list>  -->
						    <#list shenpirenList as uList>
						    <option value="${uList.getId()}" >${uList.getName()}</option>
						    </#list>
					    </select>
				    </td>				    
					<td class="tdFormInput" width="30%" >
						审批状态:
						<#list shenpiList as xzfyShenpi>
							<br/>
								<#if xzfyShenpi.check_result == "1" >
									<font color="red">${xzfyShenpi.check_name}：已通过</font>
								<#elseif xzfyShenpi.check_result == "2">
									<font color="red">${xzfyShenpi.check_name}：已拒绝</font>
								<#else>
									<font color="red">${xzfyShenpi.check_name}：未审批</font>
								</#if>
						</#list>
					</td>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >延期申请书</td>
				    <td class="tdFormInput" width="30%" >				    	
				    	<input type="button" value="生成" class="ui-btn ui-btn-normal" <#if xzfyInfo.check_status != "0">disabled</#if> onclick="saveToYanqiDoc()" >
				    </td>
				    <th class="tdFormText" width="20%" >延期审批单</td>
					<td class="tdFormInput" width="30%" >					
						<a href="../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&checkDocType=5&isView=1&funcCode=${funcCode}" target="_blank">生成</a>
					</td>
		  		</tr>
		  		<tr class="trcolor" id="yanqipz" style="display:block" >      
		     		<th class="tdFormText" width="20%" >批准人</td> 
				    <td class="tdFormInput" width="30%" >				  
			    		<input type="text" name="pizhunren" value="<#if xzfyInfo.pizhunren?has_content>${xzfyInfo.pizhunren}</#if>" class="inputTextNormal" />				   		
				    </td>			    
				    <th class="tdFormText" width="20%" >批复意见</td>
					<td class="tdFormInput" width="30%" colspan=3 >			 
				    	 <textarea name="pifuyijian" type="text" value="" class="textarea" ><#if xzfyInfo.pifuyijian?has_content>${xzfyInfo.pifuyijian}</#if></textarea>
				    </td>					
		  		</tr>
		  		<!--
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >延期开始日期</td>
				    <td class="tdFormInput" width="30%" >
				    	<input name="isdelay_From" type="text" class="inputTextNormal"  
					     	   value="<#if xzfyInfo.isdelay_from?has_content>${xzfyInfo.isdelay_from}</#if>" onClick="WdatePicker()" altname="" >
				    </td>
				    <th class="tdFormText" width="20%" >延期结束日期</td>
					<td class="tdFormInput" width="30%" >
						<input name="isdelay_To" type="text" class="inputTextNormal"  
					     	   value="<#if xzfyInfo.isdelay_to?has_content>${xzfyInfo.isdelay_to}</#if>" onClick="WdatePicker()" altname="" >
					</td>
		  		</tr>
			  	-->			  		
				
			</table>
		</div>
<!--===========end---申请延期---end================end---申请延期---end===================end---申请延期---end===============end---申请延期---end================================================================================-->		
<!--=============================================================================================================================================-->		
<!--===========start---申请中止---start==============start---申请中止---start===============start---申请中止---start==========start---申请中止---start===========================================================================================-->		
		<div class="ui-form fn-clear">
			<table id="zhongzhi" <#if xzfyInfo.status=="7">style="display:block"</#if> style="display:none" width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table ui-table-form">	  			
		  		<tr >  
		  			<div>    
		     			<h1 align="center"><font color="red">中止审理</font></h1>
		     		</div>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >中止日期</td>
				    <td class="tdFormInput" width="30%" >
				    	<input name="isstop_from" type="text" class="inputTextNormal"  
					     	   value="<#if xzfyInfo.isstop_from?has_content>${xzfyInfo.isstop_from}</#if>" onClick="WdatePicker()" altname="" >
				    </td>
				    <th class="tdFormText" width="20%" ></td>
				    <td class="tdFormInput" width="30%"  >									
				    </td>
		  		</tr>
		  		<tr class="trcolor" id="" > 
		  			<th class="tdFormText" width="20%" >中止事由</td>
				    <td class="tdFormInput" width="30%" colspan=3 >
				    	 <textarea name="stop_detail" type="text" value="" class="textarea" id="" ischeck="y" altname="" ><#if xzfyInfo.stop_detail?has_content>${xzfyInfo.stop_detail}</#if></textarea>
				    </td>     		     		
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >审批人</td>
				    <td class="tdFormInput" width="30%" colspan=2 >
						<select name="" id="zhongzhispr" onchange="iszhongzhisp()">
						    <option value="0">未指定审批人</option>
						    <#list shenpirenList as uList>
						    <option value="${uList.getId()}" >${uList.getName()}</option>
						    </#list>
					    </select>			
				    </td>
					<td class="tdFormInput" width="30%" >
						审批状态:
						<#list shenpiList1 as xzfyShenpi><br/>
								<#if xzfyShenpi.check_result == "1" >
									<font color="red">${xzfyShenpi.check_name}：已通过</font>
								<#elseif xzfyShenpi.check_result == "2">
									<font color="red">${xzfyShenpi.check_name}：已拒绝</font>
								<#else>
									<font color="red">${xzfyShenpi.check_name}：未审批</font>
								</#if>
						</#list>
					</td>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >中止申请书</td>
				    <td class="tdFormInput" width="30%" >
				    	<input type="button" value="生成" class="ui-btn ui-btn-normal" <#if xzfyInfo.check_status != "0">disabled</#if> onclick="saveToZhongzhiDoc()" >
				    </td>
				    <th class="tdFormText" width="20%" >中止审批单</td>
					<td class="tdFormInput" width="30%" >
						<a href="../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&checkDocType=7&isView=1&funcCode=${funcCode}" target="_blank">生成</a>
					</td>
		  		</tr>
		  		<tr class="trcolor" id="zhongzhipz" style="display:block"  >      
		     		<th class="tdFormText" width="20%" >中止批准人</td>
				    <td class="tdFormInput" width="30%" >		
					    <input type="text" name="pizhunren1" value="<#if xzfyInfo.pizhunren1?has_content>${xzfyInfo.pizhunren1}</#if>" class="inputTextNormal" />	
				    </td>
				    <th class="tdFormText" width="20%" >中止批复意见</td>
				    <td class="tdFormInput" width="30%"  >				
				    	 <textarea name="pifuyijian1" type="text" value="" class="textarea" ><#if xzfyInfo.pifuyijian1?has_content>${xzfyInfo.pifuyijian1}</#if></textarea>						
				    </td>
		  		</tr>		  		
				
			</table>
		</div>
	
<!--========-- end---申请中止---end --=====================-- end---申请中止---end --=====================-- end---申请中止---end --===========================================================================================-->	
<!--=============================================================================================================================================-->	
<!--========-- start---恢复审理---start --=================-- start---恢复审理---start --=================-- start---恢复审理---start --===================================================================================================-->		
		
		<div class="ui-form fn-clear">
			<table id="huifushenli" <#if xzfyInfo.status=="9">style="display:block"</#if> style="display:none" width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table ui-table-form">	  			
		  		<tr >  
		  			<div>    
		     			<h1 align="center"><font color="red">恢复审理</font></h1>
		     		</div>
		  		</tr>
		  		<tr class="trcolor" id="" >      
				    <th class="tdFormText" width="20%" >回复审理日期</td>
					<td class="tdFormInput" width="30%" >
						<input name="breakTo" type="text" class="inputTextNormal"  
					     	   value="<#if xzfyInfo.breakTo?has_content>${xzfyInfo.breakTo}</#if>" onClick="WdatePicker()" altname="" >
					</td>
					<th class="tdFormText" width="20%" ></td>
					<td class="tdFormInput" width="30%" >
					</td>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >恢复审理事由</td>
				    <td class="tdFormInput" width="30%" colspan=3 >		    
				    	<textarea name="stop_reason" type="text" value="" class="textarea" id="" ischeck="y" altname="" ><#if xzfyInfo.stop_reason?has_content>${xzfyInfo.stop_reason}</#if></textarea>
				    </td>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >审批人</td>
				    <td class="tdFormInput" width="30%" >
						<select name="" id="huifuspr" onchange="ishuifusp()">
						    <option value="0">未指定审批人</option>
						    <#list shenpirenList as uList>
						    <option value="${uList.getId()}" >${uList.getName()}</option>
						    </#list>
					    </select>			
				    </td>
				    <th class="tdFormText" width="20%" >审批状态</td>
					<td class="tdFormInput" width="30%" >
						审批状态:
						<#list shenpiList2 as xzfyShenpi><br/>
								<#if xzfyShenpi.check_result == "1" >
									<font color="red">${xzfyShenpi.check_name}：已通过</font>
								<#elseif xzfyShenpi.check_result == "2">
									<font color="red">${xzfyShenpi.check_name}：已拒绝</font>
								<#else>
									<font color="red">${xzfyShenpi.check_name}：未审批</font>
								</#if>
						</#list>
					</td>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >回复审理申请书</td>
				    <td class="tdFormInput" width="30%" >
				    	<input type="button" value="生成" class="ui-btn ui-btn-normal" <#if xzfyInfo.check_status != "0">disabled</#if> onclick="saveToHuifuDoc()" >
				    </td>
				    <th class="tdFormText" width="20%" >回复审理审批单</td>
					<td class="tdFormInput" width="30%" >
						<a href="../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&checkDocType=9&isView=1&funcCode=${funcCode}" target="_blank">生成</a>
					</td>
		  		</tr>
		  		<tr class="trcolor" id="huifupz" style="display:block" >      
		     		<th class="tdFormText" width="20%" >恢复审理批准人</td>
				    <td class="tdFormInput" width="30%" >
					    <input type="text" name="pizhunren2" value="<#if xzfyInfo.pizhunren2?has_content>${xzfyInfo.pizhunren2}</#if>" class="inputTextNormal" />				 
				    </td>
					<th class="tdFormText" width="20%" >恢复审理批复意见</td>
				    <td class="tdFormInput" width="30%"  >
				    	 <textarea name="pifuyijian2" type="text" value="" class="textarea" ><#if xzfyInfo.pifuyijian2?has_content>${xzfyInfo.pifuyijian2}</#if></textarea>
				    </td>
		  		</tr>		  		
				
			</table>
		</div>
		
<!--=======-- end---恢复审理---end --=================================-- end---恢复审理---end --=======================-- end---恢复审理---end --==============================================================================-->		
<!--=============================================================================================================================================-->		
<!--======-- start---申请结案---start --===========================-- start---申请结案---start --====================-- start---申请结案---start --========================================================================================-->		
	
		<div class="ui-form fn-clear">
			<table id="jiean" <#if xzfyInfo.status=="11">style="display:block"</#if> style="display:none" width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table ui-table-form">	  			
		  		<tr >  
		  			<div>    
		     			<h1 align="center"><font color="red">结案</font></h1>
		     		</div>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >结案日期</td>
				    <td class="tdFormInput" width="30%" >
						<input name="finish_date" type="text" class="inputTextNormal"  
					     	   value="<#if xzfyInfo.finish_date?has_content>${xzfyInfo.finish_date}</#if>" onClick="WdatePicker()" altname="" >
					</td>
				    <th class="tdFormText" width="20%" >结案方式</td>
				    <td class="tdFormInput" width="30%" >	
						<select name="finish_type" id="jafs"  onchange="jafss()">
						  <option value="0" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="0">selected</#if> >----请选择----</option>
						  <option value="1" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="1">selected</#if> >驳回</option>
						  <option value="2" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="2">selected</#if> >维持</option>
						  <option value="3" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="3">selected</#if> >确认违法</option>
						  <option value="4" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="4">selected</#if> >撤销</option>
						  <option value="5" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="5">selected</#if> >变更</option>
						  <option value="6" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="6">selected</#if> >责令履行</option>
						  <option value="7" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="7">selected</#if> >调解</option>
						  <option value="8" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="8">selected</#if> >终止</option>
						  <option value="9" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="9">selected</#if> >其他</option>		 
					    </select>
					    <select name="finishBreakType" id="jafs1"  style="display:none">
						  <option value="0" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="0">selected</#if> >----请选择----</option>
						  <option value="1" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="1">selected</#if> >和解协议</option>
						  <option value="2" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="2">selected</#if> >资源撤回申请 </option>
						  <option value="3" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="3">selected</#if> >被申请人改变后撤回申请</option>
						  <option value="4" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="4">selected</#if> >其他</option>		 
					    </select>
			    	</td>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >结案意见</td>
				    <td class="tdFormInput" width="30%" colspan=3 >			
				    	 <textarea name="jaAdvice" type="text" value="" class="textarea" id="" ischeck="y" altname="" ><#if xzfyInfo.jaAdvice?has_content>${xzfyInfo.jaAdvice}</#if></textarea>
				    </td>					   
		  		</tr>
		  		<tr class="trcolor">      
		     		<th class="tdFormText" width="20%" >国家赔偿</td>
				    <td class="tdFormInput" width="30%" >
				    	&nbsp;&nbsp;&nbsp;&nbsp;
				    	<input type="radio" name="nationMoney" value="0" id="gjpc" <#if xzfyInfo.nationMoney?exists && xzfyInfo.nationMoney == "0" >checked</#if> onclick="gjpcc()" />  否
				    	<input type="radio" name="nationMoney" value="1" id="gjpc1" <#if xzfyInfo.nationMoney?exists && xzfyInfo.nationMoney == "1" >checked</#if> onclick="gjpcc1()" />  是
				    </td>
				    <th class="tdFormText" width="20%" >赔偿金额</td>
					<td class="tdFormInput" width="30%" >
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="nationMoneyDetail" value="<#if xzfyInfo.nationMoneyDetail?has_content>${xzfyInfo.nationMoneyDetail}</#if>" id="pcje" class="inputTextNormal" disabled />
					</td>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >审批人</td>
				    <td class="tdFormInput" width="30%" colspan=2 >
				  		<select name="" id="jieanspr" onchange="isjieansp()">
						    <option value="0">未指定审批人</option>
						    <#list shenpirenList as uList>
						    <option value="${uList.getId()}" >${uList.getName()}</option>
						    </#list>
					    </select>
				    </td>
					<td class="tdFormInput" width="30%" >
						审批状态:
						<#list shenpiList3 as xzfyShenpi><br/>
							<#if xzfyShenpi.check_result == "1" >
								<font color="red">${xzfyShenpi.check_name}：已通过</font>
							<#elseif xzfyShenpi.check_result == "2">
								<font color="red">${xzfyShenpi.check_name}：已拒绝</font>
							<#else>
								<font color="red">${xzfyShenpi.check_name}：未审批</font>
							</#if>
						</#list>
					</td>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >结案文书</td>
				    <td class="tdFormInput" width="30%" >
				    	<input type="button" value="生成" class="ui-btn ui-btn-normal" <#if xzfyInfo.check_status != "0">disabled</#if> onclick="saveToJieanDoc()" >
				    </td>
				    <th class="tdFormText" width="20%" >预览结案审批单</td>
					<td class="tdFormInput" width="30%" >
						<a href="../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&checkDocType=11&isView=1&funcCode=${funcCode}" target="_blank">查看</a>
					</td>
		  		</tr>
		  		<tr class="trcolor" id="" >      
		     		<th class="tdFormText" width="20%" >生成行政复议意见书</td>
				    <td class="tdFormInput" width="30%" >
				    	<input type="button" value="生成" class="ui-btn ui-btn-normal" <#if xzfyInfo.check_status != "0">disabled</#if> onclick="saveToYijianDoc()" >
				    </td>
				    <th class="tdFormText" width="20%" >生成行政复议建议书</td>
					<td class="tdFormInput" width="30%" >
						<input type="button" value="生成" class="ui-btn ui-btn-normal" <#if xzfyInfo.check_status != "0">disabled</#if> onclick="saveToJianyiDoc()" >
					</td>
		  		</tr>
		  		<tr class="trcolor" id="jieanpz" style="display:block" >      
		     		<th class="tdFormText" width="20%" >结案批准人</td>
				    <td class="tdFormInput" width="30%" >		
					    <input type="text" name="pizhunren3" value="<#if xzfyInfo.pizhunren3?has_content>${xzfyInfo.pizhunren3}</#if>" class="inputTextNormal" />		 
				    </td>
					<th class="tdFormText" width="20%" >结案批复意见</td>
				    <td class="tdFormInput" width="30%"  >
				    	 <textarea name="pifuyijian3" type="text" value="" class="textarea" ><#if xzfyInfo.pifuyijian3?has_content>${xzfyInfo.pifuyijian3}</#if></textarea>
				    </td>
		  		</tr>
				
			</table>
		</div>
		<!-- end---申请结案---end -->
<!--=============================================================================================================================================-->
<!--=============================================================================================================================================-->		
<!--=============================================================================================================================================-->		
		<br/><br/>
		<!-- start---办案信息---start -->
		<div class="ui-form fn-clear">
			<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table ui-table-form">	
		  		<tr class="trcolor">      
		     		<th class="tdFormText" width="20%" >听证记录</td>
				    <td class="tdFormInput" width="30%" >
						<a href="javascript:opendg('tzjl/tzjlInfoList.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}',900,600)" style="display:block" id="">添加</a>
				    	已有:&nbsp;<#if tzjlList.size()?has_content>${tzjlList.size()}</#if>条
				    </td>
				    <th class="tdFormText" width="20%" >现场调查</td>
					<td class="tdFormInput" width="30%" >
						<input type="file" name="upFile" class="inputTextFile" />
						<a href="javascript:addxcdc()">添加</a>
						<a href="javascript:checkxcdc()">查看</a>
							<script type="text/javascript">
								var a=1;
								function checkxcdc(){
									if(a==1){
										document.getElementById("checkxcdc").style.display="block";
										a=0;
									}
									else{
										document.getElementById("checkxcdc").style.display="none";
										a=1;
									}
								}
							</script>
						<div id="addxcdc"></div>
						<div id="checkxcdc" style="display:none">
						<#list xcdcList as xzfyXcdc>
							<br/><a href="<#if xzfyXcdc.xcdcfile1?has_content>${xzfyXcdc.xcdcfile1}</#if>" target="_blank" ><#if xzfyXcdc.xcdcfile?has_content>${xzfyXcdc.xcdcfile}</#if></a>							
						</#list>
						</div>
					</td>
		  		</tr>
		  		
		  		<tr class="trcolor">      
		     		<th class="tdFormText" width="20%" >召开复议委员会案审会</td>
				    <td class="tdFormInput" width="30%" >
					    <a href="javascript:opendg('ashjl/showAshjlList.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}',900,600)" style="display:block" id="">添加</a>
				    	已有:&nbsp;<#if ashjlList.size()?has_content>${ashjlList.size()}</#if>条
				    </td>
				    <th class="tdFormText" width="20%" >调解记录</td>
					<td class="tdFormInput" width="30%" >
						<!--
						<select name="xzfyInfo.mid_tiaojie" id="tj" onchange="tiaojie()" >
							<option value="0" >否</option>
							<option value="1" >是</option>			
						</select>
						-->
						<input type="file" name="upFile1" value="" class="inputTextFile" id="tj1" style="display:block" />
						<br/><a href="<#if xzfyInfo.tiaojiejilu1?has_content>${xzfyInfo.tiaojiejilu1}</#if>" target="_blank" ><#if xzfyInfo.tiaojiejilu?has_content>${xzfyInfo.tiaojiejilu}</#if></a>
						<input type="hidden" name="tiaojiejilu" value="<#if xzfyInfo.taiojiejilu?has_content>${xzfyInfo.tiaojiejilu}</#if>" />
						<input type="hidden" name="tiaojiejilu1" value="<#if xzfyInfo.taiojiejilu?has_content>${xzfyInfo.tiaojiejilu1}</#if>" />
					</td>
					
		  		</tr>
		  		
		  		<tr class="trcolor">      
		     		<th class="tdFormText" width="20%" >审理方式</td>
				    <td class="tdFormInput" width="30%" >	
				    	&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="trailMode" id="slfsid"  onchange="slfs()">
						  <option value="0" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="0">selected</#if> >无</option>
						  <option value="1" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="1">selected</#if> >设置听证</option>
						  <option value="2" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="2">selected</#if> >会商</option>
						  <option value="3" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="3">selected</#if> >会审</option>
						  <option value="4" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="4">selected</#if> >专家论证会</option>
						  <option value="5" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="5">selected</#if> >协调会</option>
						  <option value="6" <#if xzfyInfo.trailMode?exists && xzfyInfo.trailMode=="6">selected</#if> >其他审理方式</option>		 
					    </select>
				    </td>
				    <th class="tdFormText" width="20%" ></td>
				    <td class="tdFormInput" width="30%" >
				    </td>
		  		</tr>	
		  	</table>	
		  	</div>  		
		  	<!-- end---办案信息---end -->				  	


		</form>
		
		</div>
				<div class="ui-flod-title fn-clear" >
			<a href="javascript:slideFlod(page2);dyniframesize('ifm')" >
				<span class="fn-left"><img src=	"../${Session['_USER_STYLE_'].imagePath}/icons/panel_display.png"/></span>
				<h2 class="fn-left">立案信息</h2></a>       
		</div>		
		<div class="ui-flod-cnt fn-clear" id="page2" style="display:none">
  		 <iframe src="../xzfy/viewlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isView=1" 
  		 frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="auto" id="ifm" name="ifm" onload="javascript:dyniframesize('ifm');" width="100%"></iframe>		
		</div>
		
<#if xzfyInfo.isBuzheng=='1'>
		<div class="ui-flod-title fn-clear" >
			<a href="javascript:slideFlod(page3);dyniframesize('ifm1')" >
				<span class="fn-left"><img src=	"../${Session['_USER_STYLE_'].imagePath}/icons/panel_display.png"/></span>
				<h2 class="fn-left">补正信息</h2></a>       
		</div>		
		<div class="ui-flod-cnt fn-clear" id="page3" style="display:none">
   		<iframe src="../xzfy/viewBuzheng.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isView=1" 
  		 frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="auto" id="ifm1" name="ifm1" onload="javascript:dyniframesize('ifm1');" width="100%"></iframe>		
		</div>
</#if>

		<div class="ui-flod-title fn-clear" >
			<a href="javascript:slideFlod(page4);dyniframesize('ifm2')" >
				<span class="fn-left"><img src=	"../${Session['_USER_STYLE_'].imagePath}/icons/panel_display.png"/></span>
				<h2 class="fn-left">立案审理信息</h2></a>       
		</div>		
		<div class="ui-flod-cnt fn-clear" id="page4" style="display:none">
   		<iframe src="../xzfy/viewShouLi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isView=1" 
  		 frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="auto" id="ifm2" name="ifm2" onload="javascript:dyniframesize('ifm2');" width="100%"></iframe>		
		</div>	
				<div class="align-center">
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" >
					<tr class="trcolor" >
						<td class="tdFormText" width="25%" colspan="4">
						<div align="center">
							
							<input type="button" class="ui-btn ui-btn-normal"  value="返 回" onclick="gotoBack();" />
							</div>
						</td>
					</tr>				
				</table>
			</div>		
	</body>
</html>

<script type="text/javascript">
	var aaaa = 1;
	var bbbb = 1;
	var cccc = 1;
	var dddd = 1;
	var eeee = 1;
	//var temp = 0;
	function gotoBack(){
		window.history.back();
	}
	
	function dftz(){
		document.getElementById("yanqi").style.display="none";
		bbbb=1;
		document.getElementById("zhongzhi").style.display="none";
		cccc=1;
		document.getElementById("huifushenli").style.display="none";
		dddd=1;
		document.getElementById("jiean").style.display="none";
		eeee=1;
		if(aaaa==1){
			document.getElementById("dftz").style.display="block";
			aaaa=0;
		}
		else{
			document.getElementById("dftz").style.display="none";
			aaaa=1;
		}
		temp=1;
	}

	function yanqi(){
		document.getElementById("dftz").style.display="none";
		aaaa=1;
		document.getElementById("zhongzhi").style.display="none";
		cccc=1;
		document.getElementById("huifushenli").style.display="none";
		dddd=1;
		document.getElementById("jiean").style.display="none";
		eeee=1;
		if(bbbb==1){
			document.getElementById("yanqi").style.display="block";
			bbbb=0;
		}
		else{
			document.getElementById("yanqi").style.display="none";
			bbbb=1;
		}
		temp=2;
		temp1=2;
	}

	function zhongzhi(){
		document.getElementById("dftz").style.display="none";
		aaaa=1;
		document.getElementById("yanqi").style.display="none";
		bbbb=1;
		document.getElementById("huifushenli").style.display="none";
		dddd=1;
		document.getElementById("jiean").style.display="none";
		eeee=1;
		if(cccc==1){
			document.getElementById("zhongzhi").style.display="block";
			cccc=0;
		}
		else{
			document.getElementById("zhongzhi").style.display="none";
			cccc=1;
		}
		temp=3;
		temp1=3;
	}

	function huifushenli(){
		document.getElementById("dftz").style.display="none";
		aaaa=1;
		document.getElementById("yanqi").style.display="none";
		bbbb=1;
		document.getElementById("zhongzhi").style.display="none";
		cccc=1;
		document.getElementById("jiean").style.display="none";
		eeee=1;
		if(dddd==1){
			document.getElementById("huifushenli").style.display="block";
			dddd=0;
		}
		else{
			document.getElementById("huifushenli").style.display="none";
			dddd=1;
		}
		temp=4;
	}

	function jiean(){
		document.getElementById("dftz").style.display="none";
		aaaa=1;
		document.getElementById("yanqi").style.display="none";
		bbbb=1;
		document.getElementById("zhongzhi").style.display="none";
		cccc=1;
		document.getElementById("huifushenli").style.display="none";
		dddd=1;
		if(eeee==1){
			document.getElementById("jiean").style.display="block";
			eeee=0;
		}
		else{
			document.getElementById("jiean").style.display="none";
			eeee=1;
		}
		temp=5;
	}

	function isyanqisp(){
		//通过选择延期审批人控制批准人批复意见框是否显示
		if(document.getElementById("yanqispr").value=="0"){
			document.getElementById("yanqipz").style.display="block";			
		}
		else{
			document.getElementById("yanqipz").style.display="none";
		}
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
	function ishuifusp(){
		//通过选择延期审批人控制批准人批复意见框是否显示
		if(document.getElementById("huifuspr").value=="0"){
			document.getElementById("huifupz").style.display="block";			
		}
		else{
			document.getElementById("huifupz").style.display="none";
		}
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
		if(document.getElementById("jafs").value==8){
			document.getElementById("jafs1").style.display="block";
		}
		else{
			document.getElementById("jafs1").style.display="none";
		}
	}
	function tiaojie(){
		if(document.getElementById("tj").value==0){
			document.getElementById("tj1").style.display="none";
		}
		else{
			document.getElementById("tj1").style.display="block";
		}
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
	
</script>
<script type="text/javascript">
	function save(){
		if(confirm("确认提交？")){	
			window.form1.action="savebanan.action?tempstatus=0";
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function save6(){
		if(confirm("确认提交？")){	
			window.form1.action="savebanan.action?tempstatus=6&tempcheckstatus=0&isdelay=1 ";
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function save8(){
		if(confirm("确认提交？")){
			window.form1.action="savebanan.action?tempstatus=8&tempcheckstatus=0&isstop=1" ;
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function save10(){
		if(confirm("确认提交？")){	
			window.form1.action="savebanan.action?tempstatus=10&tempcheckstatus=0";
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function save12(){
		if(confirm("确认提交？")){
			window.form1.action="savebanan.action?tempstatus=12&tempcheckstatus=0";
			window.form1.submit();
			alert("操作已完成！");
		}
	}
	function tijiaoshenpi5(){
	    //提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("yanqispr").value==0){	
			alert("请选择审批人");
			return;
		}
		if(confirm("确认提交？")){
			document.getElementById("checkid").value=document.getElementById("yanqispr").value;	
			window.form1.action="saveshenpi.action?tempstatus=5&xzfyShenpi.check_type=5&tempcheckstatus=1";	
			window.form1.submit();
		}
	}
	function tijiaoshenpi7(){
		//提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("zhongzhispr").value==0){	
			alert("请选择审批人");
			return;
		}
		if(confirm("确认提交？")){	
			document.getElementById("checkid").value=document.getElementById("zhongzhispr").value;	
			window.form1.action="saveshenpi.action?tempstatus=7&xzfyShenpi.check_type=7&tempcheckstatus=1";	
			window.form1.submit();
		}
	}
	function tijiaoshenpi9(){
		//提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("huifuspr").value==0){	
			alert("请选择审批人");
			return;
		}
		if(confirm("确认提交？")){	
			document.getElementById("checkid").value=document.getElementById("huifuspr").value;	
			window.form1.action="saveshenpi.action?tempstatus=9&xzfyShenpi.check_type=9&tempcheckstatus=1";	
			window.form1.submit();
		}
	}
	function tijiaoshenpi11(){
		//提交延期审批，若未选择审批人，则提示请选择审批人
		if(document.getElementById("jieanspr").value==0){	
			alert("请选择审批人");
			return;
		}
		if(confirm("确认提交？")){
			document.getElementById("checkid").value=document.getElementById("jieanspr").value;		
			window.form1.action="saveshenpi.action?tempstatus=11&xzfyShenpi.check_type=11&tempcheckstatus=1";	
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
	
	
	var count=0;
	function addxcdc(){
		var e=document.createElement('div');
		e.id="div"+count;
		e.innerHTML="<input type=\"file\" name=\"upFile\" class=\"inputTextFile\" />"+"<a href=\"javascript:del(\'"+e.id+"\')\">删除</a>";
		document.getElementById("addxcdc").appendChild(e);
		count++;
	}
	function del(id){
		var e=document.getElementById(id);
		document.getElementById("addxcdc").removeChild(e);
	}
	
	function saveToDftzDoc(){	
		if(confirm("点击确定就将发送答复通知，请务必保存文书。")){
			var options = { 
				url:'savedftz.action', //提交给哪个执行 
				type:'POST', 
				success: getYanqishenqingshu //显示操作提示 
			}; 
			$('#form1').ajaxSubmit(options); 
			return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
		}
	}
	function getDftzshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${admit_name}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	
	function saveToYanqiDoc(){
		getYanqishenqingshu()
	}	
	function getYanqishenqingshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${admit_name}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	function saveToZhongzhiDoc(){
		getZhongzhishenqingshu()
	}	
	function getZhongzhishenqingshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${admit_name}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	function saveToHuifuDoc(){
		getHuifushenqingshu();
	}	
	function getHuifushenqingshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${admit_name}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	function saveToJieanDoc(){
		getJieanshenqingshu()
	}	
	function getJieanshenqingshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${admit_name}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	function saveToYijianDoc(){
		getYijianshu();
	}	
	function getYijianshu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${admit_name}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	function saveToJianyiDoc(){
		getJianyishu()
	}	
	function getJianyishu(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${admit_name}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
	
	//模板
	function savaToGetDoc(){
		getBuzhengtongzhi()
	}	
	function getBuzhengtongzhi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=${admit_name}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url);
	}
	
function dyniframesize(down) { 
	var pTar = null; 
	if (document.getElementById){ 
		pTar = document.getElementById(down); 
	} 
	else{ 
		eval('pTar = ' + down + ';'); 
	} 
	if (pTar && !window.opera){ 
	//begin resizing iframe 
		pTar.style.display="block" 
		if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight){ 
	//ns6 syntax 
			pTar.height = pTar.contentDocument.body.offsetHeight +20; 
			pTar.width = pTar.contentDocument.body.scrollWidth+20; 
		} 
		else if (pTar.Document && pTar.Document.body.scrollHeight){ 
	//ie5+ syntax 
			pTar.height = pTar.Document.body.scrollHeight; 
			pTar.width = pTar.Document.body.scrollWidth; 
		} 
	} 
} 
	
	
	function getFacePage(id){

		window.open('../xzfy/viewXzfyInfo.action?xzfyId='+id+'&funcCode=${funcCode}');

}
</script>