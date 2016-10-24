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
			.z_info_table td{
				text-align:center;
				padding: 0px;
				
			}
		</style>
	</head>
	<body>
		<div class="z_info">
			<table class="z_info_table" width="98%" cellspacing="0" cellpadding="0" border="0" id="table1">
				<tr>
					<td colspan="49">
						<font style="font-size:24px;">个人案件办理工作统计</font>
						<div style="padding-top:20px;">生成时间:${todayShow}  数据来源:${admit_name}  统计起止时间:${startDateShow?default('')}至${endDateShow?default('')}</div>
					</td>
				</tr>
				<tr>
					<td rowspan="3" colspan="2">
						受理案件总数
					</td>
					<td rowspan="1" colspan="4">
						受理未审结
					</td>
					<td rowspan="1" colspan="28">
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
					<td rowspan="1" colspan="6">
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
					<td rowspan="1" colspan="8">
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
					<td rowspan="1" colspan="2">
						已经履责
					</td>
					<td rowspan="1" colspan="2">
						不应受理
					</td>
					<td rowspan="1" colspan="2">
						其他
					</td>
					<td rowspan="1" colspan="2">
						和解协议
					</td>
					<td rowspan="1" colspan="2">
						自愿撤回
					</td>
					<td rowspan="1" colspan="2">
						改变撤回
					</td>
					<td rowspan="1" colspan="2">
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
				</tr>
				<tr>
				<#list 0..33 as a> 
				<td>
				<#if div51List[a]?has_content>
				${div51List[a]}
				<#else>
				0
				</#if>
				</td>
				</#list>
				</tr>
				<tr>
					<td colspan="34" style="text-align: center;">
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