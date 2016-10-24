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
	<form id="createForm" action="../xzfy/shenpiSubmit.action" method="post" >
	<#assign docType=''>
<#assign stadardResult=xzfyInfo.stadardResult?default('')>
<script>

</script>	
	<div class="z_wrap_info">
		<#assign sdResult=xzfyInfo.stadardResult?default('0')>
		<a href="javascript:docPrint()" title="" class="btn-blue btn">打印</a>

		<span <#if sdResult=="1">style="display:block"<#else>style="display:none"</#if> id="shouli">
		<a href="javascript:savaToGetDoc()" title="" sty class="btn-blue btn">生成受理通知</a>
		</span>
		<span <#if sdResult=="2" ||sdResult=="3" ||sdResult=="5">style="display:block"<#else>style="display:none"</#if> id="bushouli">
		<a href="javascript:savaToGetDoc1()" title="" class="btn-blue1 btn">生成不予受理告知书</a>
		</span>
		
		<h2 class="z_title">
		<#if xzfyInfo.status=="3">立案审批
		<#elseif xzfyInfo.status=="11">结案审批
		<#else>案件信息
		</#if>
		</h2>
		<div class="f12">
		<#assign currentStatus=xzfyInfo.status?number  >
		<#if (currentStatus>3 && currentStatus<11) || (currentStatus==11 && stadardResult=="1") >
		
	    <#elseif currentStatus==3>
	  	  来件处理:&nbsp;&nbsp;受理
	    <#elseif currentStatus==11>
	  	  来件处理:&nbsp;&nbsp;
		  <#if sdResult=='2'>告知</#if>
		  <#if sdResult=='3'>不予受理</#if>
		  <#if sdResult=='5'>其他</#if>
		<#else>
	  	  来件处理:&nbsp;&nbsp;
	  	  <#if sdResult=='1'>受理</#if>
		  <#if sdResult=='2'>告知</#if>
		  <#if sdResult=='3'>不予受理</#if>
		  <#if sdResult=='5'>其他</#if>
	    </#if>
	    </div>
		<div class="z_info">
		
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">			
			  <tr>
				<th width="18%">申请人<br/>（当事人）</th>
				<td colspan="2" width="30%">
				 <#if xzfyInfo.appdetail?has_content>${xzfyInfo.appdetail}</#if>
				</td>
				<th width="20%">委托代理人</th>
				<td width="20%">
				${xzfyInfo.agent_name?default('无')}
				</td>
			  </tr>

			  <tr>
				<th width="18%">第三人</th>
				<td colspan="2" width="30%">
				${xzfyInfo.third?default('无')}
				</td>
				<th width="20%">第三人代理人</th>
				<td width="20%">
				${xzfyInfo.third_agent?default('无')}
				</td>
			  </tr>	  
		  
			  <tr>
				<th width="18%">代表人</th>
				<td colspan="2" width="30%">
				${xzfyInfo.deputy_show?default('无')}
				</td>
				<th width="20%">多人复议</th>
				<td width="20%">
				${xzfyInfo.isMany?default('否')}
				</td>
			  </tr>	  			  
			  <tr>
			  <th>申请人类别</th>
				<td colspan=2>
					<#if xzfyInfo.app_type?has_content>
										<#if xzfyInfo.app_type=='1'>
											公民
										<#elseif xzfyInfo.app_type=='2'>
											法人
										</#if>
									<#else>
										&nbsp;
						</#if>
				</td>
				<th>收件时间</th>
				<td>${xzfyInfo.receive_date}</td>			
			
				  </tr>
			  
			  <tr>
			  	<th >被申请人种类</th>
				<td colspan="2">
 

    <#if xzfyInfo.defendant_type?has_content>
      <#if xzfyInfo.defendant_type=="1">乡镇政府</#if>
	  <#if xzfyInfo.defendant_type=="2">县级政府</#if>
	  <#if xzfyInfo.defendant_type=="3">县级政府部门</#if>
	  <#if xzfyInfo.defendant_type=="6">省部级行政机关</#if>
	  <#if xzfyInfo.defendant_type=="7">省级政府部门</#if>
	  <#if xzfyInfo.defendant_type=="8">其他</#if>
	
	  </#if>
	  	 
   		
  
	     </span>
				</td>
				<th >被申请人<br/>（涉及部门）</th>
				<td >

					  <#if xzfyInfo.defendant_name?has_content>${xzfyInfo.defendant_name}</#if>
				</td>
				
			  </tr>			  
			  
			  <tr>
				<th>申请复议事项</th>
				<td colspan="2">
				  <#assign caseType=xzfyInfo.casetype?default('0')>

     
     <#if caseType=="1">行政处罚</#if>
	 <#if caseType=="2">行政强制措施</#if>
	 <#if caseType=="3">行政征收</#if>
	 <#if caseType=="4">行政许可</#if>
	 <#if caseType=="5">行政确权</#if>
	 <#if caseType=="6">干预经营自主权</#if>
     <#if caseType=="7">信息公开</#if>
	 <#if caseType=="8">行政不作为</#if>
	 <#if caseType=="9">其他</#if>
	
 	 <#if caseType=="1"> 
     <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="1">>拘留</#if>
	 <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="2">>没收</#if>
	 <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="3">>罚款</#if>
	 <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="4">其他</#if>
	</#if>

   <#if caseType=="2">


	 <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="5">>对人身的强制措施</#if>
	 <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="6">>对不动产的强制措施</#if>
	 <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="7">>对其它财产的强制措施</#if>
	</#if>

   <#if caseType=="3">
	 <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="8">>征收土地</#if>
	 <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="9">>版税</#if>
	 <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="10">>收费</#if>
	 <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="11">>要求履行其他义务</#if>
  </#if>
				</td>
				<th>行政管理类别</th>
				<td>
				   <#if xzfyInfo.refer?has_content>
   
	 <#if xzfyInfo.refer=="1">公安</#if>
	 <#if xzfyInfo.refer=="2">国家安全</#if>
	 <#if xzfyInfo.refer=="3">劳动和社会保障</#if>
	 <#if xzfyInfo.refer=="4">司法行政</#if>
	 <#if xzfyInfo.refer=="5">民政</#if>
	 <#if xzfyInfo.refer=="6">农林环资</#if>
	 <#if xzfyInfo.refer=="7">城建</#if>
	 <#if xzfyInfo.refer=="8">工交商事</#if>
	 <#if xzfyInfo.refer=="9">财政金融</#if>
	 <#if xzfyInfo.refer=="10">教科文卫</#if>
	 <#if xzfyInfo.refer=="11">其他</#if>	

    </#if>

    <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="1">
		<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="1">治安</#if>
		<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="2">劳教</#if>
		<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="3">其他</#if>
	</#if>
	 <!--农林环资-->
	 <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="6">

	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="9">土地</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="10">地矿</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="11">环保</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="12">农业</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="13">水利</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="14">林业</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="15">其他</#if>
	
	</#if>
	 <!--城建-->
	 <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="7">

	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="17">规划</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="18">拆迁</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="19">房屋登记</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="20">其他</#if>
	 </#if>
	 <!--工交商事-->
	 <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="8">
	
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="22">工商</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="23">质监</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="24">商务</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="25">物价</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="26">能源</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="27">交通</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="28">信息产业</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="29">邮政</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="30">烟草专买</#if>

	</#if>
	 <!--财政金融-->
	 <#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="9">
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="32">税务</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="33">人民银行</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="34">证监</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="35">保监</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="36">银监</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="37">外汇</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="38">财政</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="39">统计<</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="40">审计</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="41">海关</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="42">商检</#if>

	</#if>
	 <!--教科文卫-->
	<#if xzfyInfo.refer?has_content&&xzfyInfo.refer=="10">
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="44">药监</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="45">卫生</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="46">计划生育</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="47">教育</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="48">文化</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="49">专利</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="50">商标</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="51">版权</#if>
	<#if xzfyInfo.refer2?has_content&&xzfyInfo.refer2=="52">旅游</#if>

    </#if>
     <div   id="divxzgllbinput">
     <#if xzfyInfo.referother?has_content>
     ${xzfyInfo.referother}
     </#if>
    </div>
				</td>
			  </tr>	
			  <tr>
				<th width="18%">
				<span id="sdResult4"<#if sdResult=="1">style="display:block"<#else>style="display:none"</#if>>立案日期</span>
				<span id="sdResult5" <#if sdResult=="2" ||sdResult=="3" ||sdResult=="5">style="display:block"<#else>style="display:none"</#if>>结案日期</span>
				</th>
				<td colspan="2" width="30%">
				
				<#if sdResult=="1">
				${xzfyInfo.lian_date?default('')}
				</#if>
				  
				<#if sdResult=="2" ||sdResult=="3" ||sdResult=="5">${xzfyInfo.finish_date?default('')}</#if>
				</td>
				<th ="18%">办理文号</th>
				<td width="30%">
				${xzfyInfo.tjzfzh?default('')}
				</td>
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
				<td>
				${xzfyInfo.istingzheng?default('否')}
				</td>
			  </tr>
			  
			  <tr>
				<th>立案审查人</th>
				<td colspan="2">
				${xzfyInfo.user1_name?default('')}					
				</td>
				<th>复议前置</th>
				<td>
				${xzfyInfo.isfront?default('否')}
				   
				</td>
			  </tr>			  
			  <tr>
				<th>案前调解</th>
				<td colspan="2">

    	<#if xzfyInfo.istiaojie?has_content>
			<#if xzfyInfo.istiaojie?has_content&&xzfyInfo.istiaojie=="1">案前调解</#if>
			<#if xzfyInfo.istiaojie?has_content&&xzfyInfo.istiaojie=="2">调解</#if>
			<#if xzfyInfo.istiaojie?has_content&&xzfyInfo.istiaojie=="3">否</#if>
    	 </#if>		
     </select>	
				</td>
				<th>调解结果</th>
				<td>
    	<#if xzfyInfo.tiaojie_result?has_content>
			${xzfyInfo.tiaojie_result}
    	 </#if>				
				</td>
			  </tr>
			  
			  <tr>
				<th width="18%">被复议的具体行政行为名称</th>
				<td colspan="2" width="30%">
				 ${xzfyInfo.xwname?default('')}
				</td>
				<th width="20%">被复议的具体行政行为案号</th>
				<td width="20%">
				${xzfyInfo.xwnum?default('')}
				</td>
			  </tr>
			  <tr>
				<td colspan="5">
					<div class="f12 c6">行政复议请求：</div>
					<div class="mt10 em2">
					  ${xzfyInfo.xzfy_requset_retail?default('')}
					</div>
				</td>
			  </tr>			  
			  <tr>
				<td colspan="5">
					<div class="f12 c6">简要内容：</div>
					<div class="mt10 em2">
					${xzfyInfo.content_abstract?default('')}
					</div>
				</td>
			  </tr>
			  <tr>
				<td colspan="5">
					<div class="f12 c6">立案审查人意见：</div>
					<div class="mt10 em2">
				${xzfyInfo.laAdvice?default('')}
					</div>
					<div class="ml30 mt10 f12 c6"></div>
				</td>
			  </tr>
					   <tr>
				<td colspan="5">
					<div class="mt10 c6 f12">领导批示：<br><br>
						<#list xzfyCheckList_la as checkList>
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
		 
		 <#if (currentStatus==3) || (currentStatus==11 && (sdResult=="2" || sdResult=="3" || sdResult=="5")) >
				  <#if xzfyInfo.check_status=="1">
				  <tr>
				<td colspan="5">
					<div class="mt10 c6 f12">请选择审批结果：
					<select name="xzfyShenpi.check_result">
					<option value="1">同意</option>
					<option value="2">退回</option>
					</select> </div>
					<div class="mt10 c6 f12">请填写意见：<textarea name="xzfyShenpi.check_advise"></textarea></div>
					<div class="align-center"><br>
					<a href="javascript:createApp()" title="审核" class="btn-blue2 btn">审核</a></div>
				</td>
			  </tr>
			  </#if>
	</#if>
			</table>
			
		</div>
	</div>	

			<input type="hidden" name="xzfyId" value="${xzfyInfo.id}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="listkeyword" value="${listkeyword}" />
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
		var checkStatus=11;
		<#if stadardResult=="1">
			checkStatus=3
		</#if>	
		var url="../bac_default_shenpidan.jsp?d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&d_checkstatus="+checkStatus;
		//var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131026180850&d_username=panglei&caseId=${xzfyId}";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
function savaToGetDoc(){
		var url="http://localhost:8080/webIscp/bac_default_shoulitongzhishu.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}";
		window.open(url,'mainwindow','location=no,resizable=yes');
}

function savaToGetDoc1(){
		var url="http://localhost:8080/webIscp/bac_default_buyushouligaozhishu.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}";
		window.open(url,'mainwindow','location=no,resizable=yes');
}

	function getBuzhengtongzhi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131021111523&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyInfo.id}&d_type=补正通知";
		window.open(url,'mainwindow','location=no,resizable=yes');
	}
	
</script>