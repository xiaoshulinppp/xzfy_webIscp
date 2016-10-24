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
					<td colspan="39" style="text-align: center;">
						<font style="font-size:24px;"><#if finish_type=="1">全市<#elseif finish_type=="2">区县政府<#elseif finish_type=="3">${orgName}<#elseif finish_type=="4">市政府部门</#if>行政复议结案情况统计</font>
						<div style="padding-top:20px;">（表格生成时间:${sysDate}&nbsp;&nbsp;操作人:${Session["_USER_LOGIN_"].name}&nbsp;&nbsp;统计起止时间:${startDateShow?default('')}-${endDateShow?default('')}）</div>
					</td>
				</tr>
				<tr>
				<!--
					<td rowspan="4">
						年度
					</td>
					<td rowspan="4">
						月份
					</td>
					<td rowspan="4">
						周次
					</td>
				-->
					<td colspan="2" rowspan="3">
						当期案件总数
					</td>
					<td colspan="2" rowspan="3">
						未受理
					</td>
					<td colspan="4">
						受理未审结
					</td>
					<td colspan="28" style="text-align: center;">
						受理已审结
					</td>
				</tr>
				<tr>
					<td rowspan="2" colspan="2">
						办理中
					</td>
					<td rowspan="2" colspan="2">
						中止
					</td>
					<td rowspan="2" colspan="2">
						维持
					</td>
					<td colspan="6">
						驳回
					</td>
					<td rowspan="2" colspan="2">
						撤销
					</td>
					<td rowspan="2" colspan="2">
						变更
					</td>
					<td rowspan="2" colspan="2">
						确认违法
					</td>
					<td rowspan="2" colspan="2">
						责令履责
					</td>
					<td colspan="8">
						终止
					</td>
					<td rowspan="2" colspan="2">
						调解
					</td>
					<td rowspan="2" colspan="2">
						其他处理
					</td>
				</tr>
				<tr>
					<td colspan="2">
						已经履责
					</td>
					<td colspan="2">
						不应当受理
					</td>
					<td colspan="2">
						其他
					</td>
					<td colspan="2">
						和解协议
					</td>
					<td colspan="2">
						自愿撤回
					</td>
					<td colspan="2">
						改变撤回
					</td>
					<td colspan="2">
						其他
					</td>
				</tr>
				<tr>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
					<td>A</td>
					<td>B</td>
				</tr>
<!--
				<#list dataLists as l>
				
				<tr>
					<td>
						${l[0]?default('')}
					</td>
					<td>
						${l[1]?default('')}
					</td>
					<td>
						${l[2]?default('')}
					</td>
					<td>
						${l[3]?default('0')}
					</td>
					<td>
						${l[4]?default('0')}
					</td>
					<td>
						${l[5]?default('0')}
					</td>
					<td>
						${l[6]?default('0')}
					</td>
					<td>
						${l[7]?default('0')}
					</td>
					<td>
						${l[8]?default('0')}
					</td>
					<td>
						${l[9]?default('0')}
					</td>
					<td>
						${l[10]?default('0')}
					</td>
					<td>
						${l[11]?default('0')}
					</td>
					<td>
						${l[12]?default('0')}
					</td>
					<td>
						${l[13]?default('0')}
					</td>
					<td>
						${l[14]?default('0')}
					</td>
					<td>
						${l[15]?default('0')}
					</td>
					<td>
						${l[16]?default('0')}
					</td>
					<td>
						${l[17]?default('0')}
					</td>
					<td>
						${l[18]?default('0')}
					</td>
					<td>
						${l[19]?default('0')}
					</td>
					<td>
						${l[20]?default('0')}
					</td>
					<td>
						${l[21]?default('0')}
					</td>
					<td>
						${l[22]?default('0')}
					</td>
					<td>
						${l[23]?default('0')}
					</td>
					<td>
						${l[24]?default('0')}
					</td>
					<td>
						${l[25]?default('0')}
					</td>
					<td>
						${l[26]?default('0')}
					</td>
					<td>
						${l[27]?default('0')}
					</td>
					<td>
						${l[28]?default('0')}
					</td>
					<td>
						${l[29]?default('0')}
					</td>
					<td>
						${l[30]?default('0')}
					</td>
					<td>
						${l[31]?default('0')}
					</td>
					<td>
						${l[32]?default('0')}
					</td>
					<td>
						${l[33]?default('0')}
					</td>
					<td>
						${l[34]?default('0')}
					</td>
					<td>
						${l[35]?default('0')}
					</td>
					<td>
						${l[36]?default('0')}
					</td>
					<td>
						${l[37]?default('0')}
					</td>
					<td>
						${l[38]?default('0')}
					</td>
					
				</tr>
				</#list>
-->
				<tr>
				<!--
					<td colspan="3">
						合计
					</td>				
					
				-->
					<#list totalList as l>
						<td>
							${l?default('0')}
						</td>
					</#list>
				</tr>
				<tr>
					<td colspan="39" style="text-align: center;">
						统计说明：A：本期新收; B：上期结转
					</td>
				</tr>
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