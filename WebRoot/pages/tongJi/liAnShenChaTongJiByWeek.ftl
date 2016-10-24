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
		<br>
			<table class="z_info_table" width="98%" cellspacing="0" cellpadding="0" border="0" id="table1">
				<tr>
					<td colspan="27" style="text-align: center;">
						<font style="font-size:24px;">${orgName}复议立案审查工作统计</font>
						<div style="padding-top:20px;">（ 表格生成时间:${sysDate}&nbsp;&nbsp;操作人:${Session["_USER_LOGIN_"].name}&nbsp;&nbsp;）</div>
					</td>
				</tr>
				<tr>
					<td rowspan="4">
						年度
					</td>
					<td rowspan="4">
						月份
					</td>
					<td rowspan="4">
						周次
					</td>
					<td rowspan="3" colspan="3">
						当期案件总数
					</td>
					<td colspan="15">
						已审查（件）
					</td>
					<td rowspan="3" colspan="3">
						未审查（件）
					</td>
					<td rowspan="3" colspan="3">
						通知补正待处理（件）
					</td>
				</tr>
				<tr>
					<td rowspan="2" colspan="3">
						受理
					</td>
					<td rowspan="2" colspan="3">
						告知处理
					</td>
					<td rowspan="2" colspan="3">
						不予受理
					</td>
					<td colspan="6">
						其他处理
					</td>
				</tr>
				<tr>
					<td colspan="3">
						案前和解
					</td>
					<td colspan="3">
						未经和解
					</td>
				</tr>
				<tr>
					<td>
						A
					</td>
					<td>
						B
					</td>
					<td>
						C
					</td>
					<td>
						A
					</td>
					<td>
						B
					</td>
					<td>
						C
					</td>
					<td>
						A
					</td>
					<td>
						B
					</td>
					<td>
						C
					</td>
					<td>
						A
					</td>
					<td>
						B
					</td>
					<td>
						C
					</td>
					<td>
						A
					</td>
					<td>
						B
					</td>
					<td>
						C
					</td>
					<td>
						A
					</td>
					<td>
						B
					</td>
					<td>
						C
					</td>
					<td>
						A
					</td>
					<td>
						B
					</td>
					<td>
						C
					</td>
					<td>
						A
					</td>
					<td>
						B
					</td>
					<td>
						C
					</td>
				</tr>
				<tr>
					<td colspan="3">合计</td>
					<#assign totalList=action.getLiAnShenChaTongJiList('${startDate}','${endDate}','${handleId}')>
					<#list totalList as total>
						<td>${total?default('0')}</td>
					</#list>
				</tr>
				<tr>
					<td colspan="27" style="text-align: center;">
					 数据来源：<#if handleId!='0'>${handleName}<#else>${orgName}</#if><br>
统计起止时间:${startDateShow?default('')}-${endDateShow?default('')}<br>
统计说明：A:本期新收；B：上期结转；C：合计(A + B)
					
					</td>
				</tr>
				<tr>
					<td colspan="27" style="text-align: center;">
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