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
			<table class="z_info_table" width="90%" cellspacing="0" cellpadding="0" border="0" id="table1">
				<tr>
					<td colspan="39" style="text-align: center;">
						<font style="font-size:24px;">北京市<#if fyjgType=='1'>市政府<#elseif fyjgType=='2'>区县政府<#elseif fyjgType=='3'>市政府部门</#if>行政复议案件办理效率指标统计（${tjyear[0..3]}年<#if tjyear[4]=='0'>全年<#elseif tjyear[4]=='1'>上半年<#else>下半年</#if>）</font>
						<div style="padding-top:20px;">（生成时间:${sysDate}&nbsp;&nbsp;操作人:${Session["_USER_LOGIN_"].name}&nbsp;&nbsp）</div>
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						区县
					</td>
					<td rowspan="2">
						专兼职复议人员
					</td>
					<td colspan="4">
						受理数量
					</td>
					<td colspan="4">
						结案情况
					</td>
					<td colspan="3">
						办案效率
					</td>
				</tr>
				<tr>
					<td>
						本期新收
					</td>
					<td>
						上期结转
					</td>
					<td>
						总数
					</td>
					<td>
						人均办案
					</td>
					<td>
						未审结
					</td>
					<td>
						已审结
					</td>
					<td>
						结案率%
					</td>
					<td>
						人均结案数量
					</td>
					<td>
						60日内办结率%
					</td>
					<td>
						延期办结率%
					</td>
					<td>
						平均结案时间（天）
					</td>
				</tr>

				
					<#list eftIndexList as d>
						<tr>
							<#list d as dd>
								<td>${dd}</td>
							</#list>
						</tr>
					</#list>

				

				<tr>
					<td colspan="39" style="text-align: center;">
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