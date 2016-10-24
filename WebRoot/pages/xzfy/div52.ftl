<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=7" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>行政复议信息管理系统</title>
		<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
		<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
		<link href="http://localhost:8080/webIscp/css/style_anju.css" rel="stylesheet" type="text/css" />
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
			<table class="z_info_table" width="90%" cellspacing="0" width="90%" cellpadding="0" border="0" id="table1">
				<tr>
					<td colspan="12" style="text-align: center;">
						<font style="font-size:24px;">个人案件办理工作统计</font>
						<div style="padding-top:20px;">生成时间:${todayShow}  数据来源:${admit_name}  统计起止时间:${startDateShow?default('')}至${endDateShow?default('')}</div>
					</td>
				</tr>
				<tr>
					<td width="5%">序号</td>
					<td width="7%">收件日期</td>
					<td width="5%">收件方式</td>
					<td width="5%">是否补正</td>
					<td width="10%">被申请人</td>
					<td width="15%">具体行政行为</td>
					<td width="12%">具体行政行为</td>
					<td width="10%">立案审查人</td>
					<td width="10%">承办人</td>
					<td width="7%">结案日期</td>
					<td width="6%">结案种类</td>
					<td width="6%">办理状态</td>
				</tr>
				<#assign account=1>
			<#list div52List as xzfyInfo>
					<#assign handleText='0'>
					<#assign handleUser=''>
					<#assign handlType=''>
					<#assign handleOp=''>
					<#assign handleOpType=''>
						<#if xzfyInfo.status=="1">										
							<#assign handlType='立案审查'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
							
						<#elseif xzfyInfo.status=="2">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleText='审批'>
							<#assign handlType='补正审批'>
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='补正已审批'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
						</#if>										
						<#elseif xzfyInfo.status=="3">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleText='审批'>
							<#assign handlType='立案审批'>
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='立案已审批'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
						</#if>		
							
						<#elseif xzfyInfo.status=="4">
							<#assign handleText='办理'>	
							<#assign handlType='案件办理'>	
							<#assign handleOp='选择承办人'>	
							<#assign handleOpType='2'>						
							
						<#elseif xzfyInfo.status=="5">
						<#if  xzfyInfo.check_status=='1'>
								<#assign handleText='审批'>
								<#assign handlType='延期审批'>		
								<#assign handleOp='转审批'>
								<#assign handleOpType='3'>
						<#else>
							<#assign handlType='延期已审批'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
						
						<#elseif xzfyInfo.status=="6">
							<#assign handleText='办理'>	
							<#assign handlType='案件延期'>	
							<#assign handleOp='选择承办人'>	
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="7">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleText='审批'>
							<#assign handlType='中止审批'>	
							<#assign handleOp='转审批'>	
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='中止已审批'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
							
						<#elseif xzfyInfo.status=="8">
							<#assign handleText='办理'>	
							<#assign handlType='案件中止'>		
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="9">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleText='审批'>
							<#assign handlType='恢复审理审批'>
							<#assign handleOp='转审批'>		
							<#assign handleOpType='3'>
						<#else>
							<#assign handlType='待恢复'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
						</#if>	
							
						<#elseif xzfyInfo.status=="10">
							<#assign handleText='办理'>	
							<#assign handlType='恢复审理'>	
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							
						<#elseif xzfyInfo.status=="11">
						<#if  xzfyInfo.check_status=='1'>
							<#assign handleText='审批'>
							<#assign handlType='结案审批'>	
							<#assign handleOp='转审批'>
							<#assign handleOpType='3'>
						<#else>
							<#if xzfyInfo.stadardResult=='1'>
							<#assign handlType='结案已审批'>
							<#assign handleText='办理'>
							<#assign handleOp='选择承办人'>
							<#assign handleOpType='2'>
							<#else>
							<#assign handlType='结案已审批'>
							<#assign handleText='立案审查'>
							<#assign handleOp='选择审查人'>
							<#assign handleOpType='1'>
							</#if>
						</#if>											
						</#if>
				<tr>
					<td>${account}</td>   <!-- 序号-->
					<td>${xzfyInfo.receive_date?default('')}</td><!--收件日期receive_real_date -->
					<td><!--收件方式 -->
						<#assign receive_type = xzfyInfo.receive_type?default('')>
						<#if receive_type=="1">当面</#if>
						<#if receive_type=="2">信件</#if>
						<#if receive_type=="3">邮件</#if>
					</td>
					<#assign buzheng=xzfyInfo.isBuzheng?default('0')>
					<td><#if buzheng=='0'>否<#else>是</#if></td><!--审理期限开始日期 -->
	
					<td>${xzfyInfo.defendant_name?default('')}</td><!--被申请人 -->
					<td>${xzfyInfo.xwname?default('')}</td><!--具体行政行为 -->
					<td>${xzfyInfo.xwnum?default('')}</td><!--具体行政行为 -->
					<td>${xzfyInfo.user1_name?default('')}&nbsp;${xzfyInfo.user4_name?default('')}</td><!--立案审查人 -->
					<td>${xzfyInfo.user2_name?default('')}&nbsp;${xzfyInfo.user3_name?default('')}</td><!--承办人 -->
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
					<td>${handlType}</td><!--办理状态 -->
				</tr>
				<#assign account=account+1>
			</#list>
			<tr>
					<td colspan="18" style="text-align: center;">
						<input type="button" value="导出Excel" onclick="AutomateExcel('table1')"/>
					</td>
				</tr>
			</table>
		</div>
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

</script>
	</body>
</html>