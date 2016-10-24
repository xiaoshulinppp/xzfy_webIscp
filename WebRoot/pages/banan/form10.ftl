<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=7" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>行政复议信息管理系统</title>
		<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
		<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
		<link href="../css/style_anju.css" rel="stylesheet" type="text/css" />
		<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
		<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
		<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
		<!--[if lte IE 6]>
			<script src="script/png.js" type="text/javascript"></script>
		    <script type="text/javascript">
		        	DD_belatedPNG.fix('div, ul, img, li, input , a');
		    </script>
		<![endif]-->
		<style>
			.z_info_table2 td{
				text-align:center;
				padding: 0px;
			}
		</style>
	</head>
	<body>
		<div class="z_info">
			<table class="z_info_table" width="90%" cellspacing="0" cellpadding="0" border="0" id="table1">
				<tr>
					<td colspan="17" style="text-align:center;">
						<font style="font-size:24px;"><#if finish_type=="1">全市<#elseif finish_type=="2">区县政府<#elseif finish_type=="3">${orgName}<#elseif finish_type=="4">市政府部门</#if>行政复议案件登记表</font>
						<div style="padding-top:20px;">（表格生成时间:${sysDate}&nbsp;&nbsp;操作人:${Session["_USER_LOGIN_"].name}&nbsp;&nbsp;统计起止时间:${startDateShow?default('')}-${endDateShow?default('')}）</div>
					</td>
				</tr>
				<tr>
				
					<td width="2%">序号</td>
					<td width="7%">收件日期</td>
					<td width="6%">收件方式</td>
					<td width="8%">立案审查人</td>
					<td width="8%">京政复字号</td>
					<td width="8%">申请人</td>
					<td width="10%">被申请人</td>
					<td width="15%">案件事由</td>
					<td width="7%">行政管理类别</td>
					<td width="7%">案件类型</td>
					<td>是否补正</td>
					<td width="7%">立案日期</td>
					<td width="7%">承办人</td>
					<td>第二承办人</td>
					<td width="7%">结案日期</td>
					<td width="8%">结案种类</td>
					<td width="8%">备注</td>	
					<!--
					序号
					收件日期
					收件方式
					审理期限开始计算日期
					立案审查人
					京政复字号
					申请人
					被申请人
					案件事由
					行政管理类别
					案件类型
					立案日期
					办案处室
					承办人
					第二承办人
					结案日期
					结案种类
					市领导批示
					-->
					
					
					
					
					
					
					
					
			<!--		<td>审理期限开始日期</td>
					<td width="7%">办案处室</td>
					
					  -->
					
					
					<!--<td width="10%">被复议的具体行政行为名称</td>-->
					
			<!--		<td>具体行政行为</td> 
			<td width="12%">被复议的具体行政行为文号</td>
			 -->
					
			<!--		<td>第二审查人</td>  -->
			<!--		 -->
					
			<!--		  -->
					
			<!--		<td>办理状态</td>
			<td width="3%">查看</td> -->
					 
				</tr>
				<#assign account=1>
			<#list form10List as xzfyInfo>
				<#assign handleAction='0'>
					<#assign handleText='0'>
					<#assign handleUser=''>
					<#assign handlType=''>
					<#assign handleOp=''>
					<#assign handleOpType=''>
						<#if xzfyInfo.status=="1">										
							<#assign handlType='立案审查'>
							<#assign handleAction='../xzfy/getlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
							
						<#elseif xzfyInfo.status=="2">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}'>
							<#assign handleText='审批'>
							<#assign handlType='补正审批'>
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='补正已审批'>
							<#assign handleAction='../xzfy/getlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
						</#if>										
						<#elseif xzfyInfo.status=="3">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}'>
							<#assign handleText='审批'>
							<#assign handlType='立案审批'>
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='立案已审批'>
							<#assign handleAction='../xzfy/getlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
						</#if>		
							
						<#elseif xzfyInfo.status=="4">
							<#assign handleAction='../banan/bananform.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}'>
							<#assign handleText='办理'>	
							<#assign handlType='案件办理'>	
							<#assign handleOp='选择承办人'>	
							<#assign handleOpType='2'>						
							
						<#elseif xzfyInfo.status=="5">
						<#if  xzfyInfo.check_status=='1'>
								<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}'>
								<#assign handleText='审批'>
								<#assign handlType='延期审批'>		
								<#assign handleOp='转审批'>
								<#assign handleOpType='3'>
						<#else>
							<#assign handlType='延期已审批'>
							<#assign handleAction='../banan/bananform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
						
						<#elseif xzfyInfo.status=="6">
							<#assign handleAction='../banan/bananform.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}'>
							<#assign handleText='办理'>	
							<#assign handlType='案件延期'>	
							<#assign handleOp='选择承办人'>	
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="7">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}'>
							<#assign handleText='审批'>
							<#assign handlType='中止审批'>	
							<#assign handleOp='转审批'>	
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='中止已审批'>
							<#assign handleAction='../banan/bananform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
							
						<#elseif xzfyInfo.status=="8">
							<#assign handleAction='../banan/bananform.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}'>
							<#assign handleText='办理'>	
							<#assign handlType='案件中止'>		
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="9">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}'>
							<#assign handleText='审批'>
							<#assign handlType='恢复审理审批'>
							<#assign handleOp='转审批'>		
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='待恢复'>
							<#assign handleAction='../banan/bananform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
							
						<#elseif xzfyInfo.status=="10">
							<#assign handleAction='../banan/bananform.action?tempid=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}'>
							<#assign handleText='办理'>	
							<#assign handlType='恢复审理'>	
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="11">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleAction='../xzfy/shenpiInfo.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}&listkeyword=${listkeyword}'>
							<#assign handleText='审批'>
							<#assign handlType='结案审批'>	
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#if xzfyInfo.stadardResult=='1'>
							<#assign handlType='结案已审批'>
							<#assign handleAction='../banan/bananform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							<#else>
							<#assign handlType='结案已审批'>
							<#assign handleAction='../xzfy/getlian.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
							</#if>
						</#if>											
						</#if>
				<tr>
					<td>${account}</td>   <!-- 序号-->
					<td>${xzfyInfo.receive_date?default('')}</td><!--收件日期 -->
					<td><!--收件方式 -->
						<#assign receive_type = xzfyInfo.receive_type?default('')>
						<#if receive_type=="1">当面</#if>
						<#if receive_type=="2">信件</#if>
						<#if receive_type=="3">邮件</#if>
					</td>
					<td>${xzfyInfo.user1_name?default('')}<#if xzfyInfo.user4_name?has_content>，${xzfyInfo.user4_name?default('')}</#if></td>
					<td>${xzfyInfo.tjzfzh?default('')}</td>
					<td>${xzfyInfo.app_show?default('')}</td>
					<td>${xzfyInfo.defendant_name?default('')}</td><!--被申请人 -->
					<td>${xzfyInfo.content_abstract?default('')}</td><!-- 案件事由-->
					<td><!--行政管理类别 -->
						<#if xzfyInfo.refer?default('0')=="1">公安</#if>
						<#if xzfyInfo.refer?default('0')=="2">国家安全</#if>
						<#if xzfyInfo.refer?default('0')=="3">劳动和社会保障</#if>
						<#if xzfyInfo.refer?default('0')=="4">司法行政</#if>
						<#if xzfyInfo.refer?default('0')=="5">民政</#if>
						<#if xzfyInfo.refer?default('0')=="6">土地</#if>
						<#if xzfyInfo.refer?default('0')=="7">地矿</#if>
						<#if xzfyInfo.refer?default('0')=="8">环保</#if>
						<#if xzfyInfo.refer?default('0')=="9">农业</#if>
						<#if xzfyInfo.refer?default('0')=="10">水利</#if>
						<#if xzfyInfo.refer?default('0')=="11">林业</#if>
						<#if xzfyInfo.refer?default('0')=="12">城市规划</#if>
						<#if xzfyInfo.refer?default('0')=="13">房屋拆迁</#if>
						<#if xzfyInfo.refer?default('0')=="14">房屋登记</#if>
						<#if xzfyInfo.refer?default('0')=="15">工商</#if>
						<#if xzfyInfo.refer?default('0')=="16">质监</#if>
						<#if xzfyInfo.refer?default('0')=="17">商务</#if>
						<#if xzfyInfo.refer?default('0')=="18">物价</#if>
						<#if xzfyInfo.refer?default('0')=="19">能源</#if>
						<#if xzfyInfo.refer?default('0')=="20">交通</#if>
						<#if xzfyInfo.refer?default('0')=="21">信息产业</#if>
						<#if xzfyInfo.refer?default('0')=="22">邮政</#if>
					    <#if xzfyInfo.refer?default('0')=="23">烟草专卖</#if>
						<#if xzfyInfo.refer?default('0')=="24">税务</#if>
						<#if xzfyInfo.refer?default('0')=="25">人民银行</#if>
						<#if xzfyInfo.refer?default('0')=="26">证监</#if>
						<#if xzfyInfo.refer?default('0')=="27">保监</#if>
						<#if xzfyInfo.refer?default('0')=="28">银监</#if>
						<#if xzfyInfo.refer?default('0')=="29">外汇</#if>
						<#if xzfyInfo.refer?default('0')=="30">财政</#if>
						<#if xzfyInfo.refer?default('0')=="31">统计</#if>
						<#if xzfyInfo.refer?default('0')=="32">审计</#if>
						<#if xzfyInfo.refer?default('0')=="33">海关</#if>
						<#if xzfyInfo.refer?default('0')=="34">商检</#if>
						<#if xzfyInfo.refer?default('0')=="35">药监</#if>
						<#if xzfyInfo.refer?default('0')=="36">卫生</#if>
						<#if xzfyInfo.refer?default('0')=="37">计划生育</#if>
						<#if xzfyInfo.refer?default('0')=="38">教育</#if>
						<#if xzfyInfo.refer?default('0')=="39">文化</#if>
						<#if xzfyInfo.refer?default('0')=="40">专利</#if>
						<#if xzfyInfo.refer?default('0')=="41">商标</#if>
						<#if xzfyInfo.refer?default('0')=="42">版权</#if>	
						<#if xzfyInfo.refer?default('0')=="43">旅游</#if>	
						<#if xzfyInfo.refer?default('0')=="44">其他</#if>
					</td>
					<td><!-- 案件类型-->
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
					</td>
					<#assign isBuzheng=xzfyInfo.isBuzheng?default('0')>
					<td><#if isBuzheng=='0'>否<#else>是</#if></td><!--是否补正 -->
					<td>${xzfyInfo.lian_date?default('')}</td><!--立案日期 -->
					<td>${xzfyInfo.user2_name?default('')}</td><!--承办人 -->
					<td>${xzfyInfo.user3_name?default('')}</td><!--第二承办人 -->
					<!--
					<td>${xzfyInfo.user2_name?default('')}<#if xzfyInfo.user3_name?has_content>，${xzfyInfo.user3_name?default('')}</#if></td> 
					-->				
					<td>${xzfyInfo.finish_date?default('')}</td><!-- 结案日期-->
					<td><!-- 结案种类-->
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
					</td>
					<td></td>
					
				</tr>
				<#assign account=account+1>
			</#list>
				<tr>
					<td colspan="17" style="text-align: center;">
						<input type="button" value="导出Excel" onclick="AutomateExcel('table1')"/>
					</td>
				</tr>
			</table>	
            </div>
		</body>
</html>
<script>
function AutomateExcel(tableid) {//整个表格拷贝到EXCEL中 
    var curTbl = document.getElementById(tableid); 
    var oXL = new ActiveXObject("Excel.Application"); 
    //创建AX对象excel 
    var oWB = oXL.Workbooks.Add(); 
    //获取workbook对象 
        var oSheet = oWB.ActiveSheet; 
    //激活当前sheet 
    var sel = document.body.createTextRange(); 
    sel.moveToElementText(curTbl); 
    //把表格中的内容移到TextRange中 
    sel.select(); 
    //全选TextRange中内容 
    sel.execCommand("Copy"); 
    //复制TextRange中内容 
    oSheet.Paste(); 
    //粘贴到活动的EXCEL中       
    oXL.Visible = true; 
    //设置excel可见属性 
} 

<#--
<td>${xzfyInfo.xwname?default('')}</td>
<td>
						
						<#if finish_type=="1">全市<#elseif finish_type=="2">区县政府
						<#elseif finish_type=="3">${orgName}<#elseif finish_type=="4">市政府部门</#if>
					</td>
<td>${xzfyInfo.receive_date?default('')}</td>
<td>&nbsp;${xzfyInfo.app_show?default('')}</td>
<td>&nbsp;${xzfyInfo.xwnum?default('')}</td>

<td>
	<#if xzfyInfo.refer?exists && xzfyInfo.refer=="0"></#if>
	<#if xzfyInfo.refer?exists && xzfyInfo.refer=="1">公安</#if>
	<#if xzfyInfo.refer?exists && xzfyInfo.refer=="2">国家安全</#if>
	<#if xzfyInfo.refer?exists && xzfyInfo.refer=="3">劳动和社会保障</#if>
	<#if xzfyInfo.refer?exists && xzfyInfo.refer=="4">司法行政</#if>
	<#if xzfyInfo.refer?exists && xzfyInfo.refer=="5">民政</#if>
	<#if xzfyInfo.refer?exists && xzfyInfo.refer=="6">农林环资</#if>
	<#if xzfyInfo.refer?exists && xzfyInfo.refer=="7">城建</#if>
	<#if xzfyInfo.refer?exists && xzfyInfo.refer=="8">工交商事</#if>
	<#if xzfyInfo.refer?exists && xzfyInfo.refer=="9">财政金融</#if>
	<#if xzfyInfo.refer?exists && xzfyInfo.refer=="10">教科文卫</#if>
	<#if xzfyInfo.refer?exists && xzfyInfo.refer=="11">其他</#if>
</td>

<td>${xzfyInfo.require_fy?default('')}</td>
<td>${handlType}</td>
<td>
						<a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}" target="_blank" ><font color="green">查看</font></a>
					</td>
-->
</script>
