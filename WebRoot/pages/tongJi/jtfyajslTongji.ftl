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
					<td colspan="14" style="text-align: center;">
						<font style="font-size:24px;">北京市人民政府集体复议案件数量</font>
						<div style="padding-top:20px;">（ 表格生成时间:${sysDate}&nbsp;&nbsp;操作人:${Session["_USER_LOGIN_"].name}&nbsp;&nbsp;统计起止时间:${startDateShow?default('')}-${endDateShow?default('')}）</div>
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						年度
					</td>
					<td rowspan="2">
						月份
					</td>
					<td rowspan="2">
						本期新收案件
					</td>
					<td rowspan="2">
						非自然人
					</td>
					<td colspan="10">
						申请人人数（自然人）
					</td>
				</tr>
				<tr>
					<td rowspan="1">
						1-3
					</td>
					<td rowspan="1">
						4-10
					</td>
					<td rowspan="1">
						11-20
					</td>
					<td rowspan="1">
						21-30
					</td>
					<td rowspan="1">
						31-50
					</td>
					<td rowspan="1">
						50-80
					</td>
					<td rowspan="1">
						80-100
					</td>
					<td rowspan="1">
						>100
					</td>
					<td rowspan="1">
						合计
					</td>
					<td rowspan="1">
						最大值
					</td>
				</tr>
				<#list dataList as data>
				
				<tr>
					<#list data as l>
					<td>
						<#if l_index lt 2 >
						${l?default('')}
						<#else>
						<#if l=="null">0<#else>${l}</#if>
						</#if>
						
					</td>
					</#list>
				</tr>
				</#list>
				<tr>
					<td colspan="2">
						合计
					</td>
					<#list heji as l>
						<td>
						${l}
						</td>
					</#list>
				</tr>
				<tr>
					<td colspan="14" style="text-align: center;">
						统计说明：“本期新收案件”= “非自然人”+“合计”
					</td>
				</tr>
				<tr>
					<td colspan="14" style="text-align: center;">
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