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
			<table class="z_info_table" width="80%" cellspacing="0" cellpadding="0" border="0" id="table1">
				<tr>
					<td colspan="20" style="text-align: center;">
						<font style="font-size:20px;">北京市<#if fyjgType=='1'>市政府<#elseif fyjgType=='2'>区县政府<#elseif fyjgType=='3'>市政府部门</#if>行政复议案件办理公正指标统计（${justYear}年度）</font>
						<div style="padding-top:5px;">（ 表格生成时间:${sysDate}&nbsp;&nbsp;操作人:${Session["_USER_LOGIN_"].name}）</div>
					</td>
				</tr>
				<tr>
					<td rowspan="3">
						区县
					</td>
					<td colspan="3">
						年度案件量
					</td>
					<td colspan="4">
						经过实地调查
					</td>
					<td colspan="4">
						经过听证
					</td>					
					<td colspan="4">
						查阅案卷
					</td>					
					<td colspan="4">
						召开复议委员会案审会
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						总量
					</td>
					<td colspan="2">
						受理案件
					</td>
					
					<td rowspan="2">
						件数
					</td>
					<td rowspan="2">
						占受理案件比例%
					</td>
					<td rowspan="2">
						纠错率%
					</td>
					<td rowspan="2">
						与综合纠错率对比
					</td>
					
					<td rowspan="2">
						件数
					</td>
					<td rowspan="2">
						占受理案件比例%
					</td>
					<td rowspan="2">
			                                纠错率%
					</td>
					<td rowspan="2">
						与综合纠错率对比
					</td>
					<!--查阅案卷-->
					<td rowspan="2">
						件数
					</td>
					<td rowspan="2">
						占受理案件比例%
					</td>
					<td rowspan="2">
						纠错率%
					</td>
					<td rowspan="2">
						与综合纠错率对比
					</td>
					<!--查阅案卷-->
					<td rowspan="2">
						件数
					</td>
					<td rowspan="2">
						占受理案件比例%
					</td>
					<td rowspan="2">
						纠错率%
					</td>
					<td rowspan="2">
						与综合纠错率对比
					</td>
				</tr>
				<tr>
					<td>
						件数
					</td>
					<td>
						综合纠错率%
					</td>					
				</tr>
				
				<#list justIndexList as d>
						<tr>
							<#list d as dd>
								<td>${dd}</td>
							</#list>
						</tr>
				</#list>

				<tr>
					<td colspan="22" style="text-align: center;">
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