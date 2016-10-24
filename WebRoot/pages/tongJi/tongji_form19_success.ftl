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
			}
		</style>
	</head>
	<body>
		<div class="z_info">
			<table class="z_info_table" width="90%" cellspacing="0" cellpadding="0" border="0" id="table1">
				<tr>
					<td colspan="19" style="text-align: center;">
						<font style="font-size:24px;">区县政府部门（全系统）作为行政复议被申请人案件统计</font>
						<div style="padding-top:20px;">（ 所属市级政府部门:${orgName}&nbsp;&nbsp;行政复议事项:<#if shixiang=='1'>行政处罚<#elseif shixiang=='2'>行政强制措施<#elseif shixiang=='3'>行政征收<#elseif shixiang=='4'>行政许可
					<#elseif shixiang=='5'>行政确权<#elseif shixiang=='6'>干预经营自主权<#elseif shixiang=='7'>信息公开<#elseif shixiang=='8'>行政不作为<#else>其他</#if>&nbsp;&nbsp;生成时间:${sysDate?default('')}&nbsp;&nbsp;操作人:${Session["_USER_LOGIN_"].name}&nbsp;&nbsp;统计起止时间:${startDateShow?default('')}-${endDateShow?default('')}）</div>
					</td>
				</tr>
				<tr>
					<td rowspan="3" width="5%">
						区县
					</td>
					<td rowspan="3" width="10%">
						复议机关
					</td>
					<td rowspan="3" width="5%">
						当期受理案件总数
					</td>
					<td colspan="2" width="10%">
						受理未审结
					</td>
					<td colspan="14" width="70%" style="text-align: center;">
						受理已审结
					</td>
				</tr>
				<tr>
					<td rowspan="2" width="5%">
						办理中
					</td>
					<td rowspan="2" width="5%">
						中止
					</td>
					<td rowspan="2" width="5%">
						维持
					</td>
					<td colspan="3" width="15%">
						驳回
					</td>
					<td rowspan="2" width="5%">
						撤销
					</td>
					<td rowspan="2" width="5%">
						变更
					</td>
					<td rowspan="2" width="5%">
						确认违法
					</td>
					<td rowspan="2" width="5%">
						责令履责
					</td>
					<td colspan="4" width="20%">
						终止
					</td>
					<td rowspan="2" width="5%">
						调解
					</td>
					<td rowspan="2" width="5%">
						其他处理
					</td>
				</tr>
				<tr>
					<td width="5%">
						已经履责
					</td>
					<td width="5%">
						不应受理
					</td>
					<td width="5%">
						其他
					</td>
					<td width="5%">
						和解协议
					</td>
					<td width="5%">
						自愿撤回
					</td>
					<td width="5%">
						改变撤回
					</td>
					<td width="5%">
						其他
					</td>
				</tr>
				<#list dataList as data>
				<tr>
				<#if data_index%2=0>
				<td rowspan="2">${arrayList[data_index/2]}</td>
				</#if>
				<#list data as d>
				<td>${d?default('0')}</td>
				</#list>
				</tr>
				</#list>
				<tr>
					<td colspan="19" style="text-align: center;">
						<input type="button" value="导出Excel" onclick="AutomateExcel('table1')"/>
					</td>
				</tr>
			</table>
		</div>

</body>
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
</html>