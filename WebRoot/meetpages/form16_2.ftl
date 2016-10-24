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
					<td colspan="39">
						<font style="font-size:24px;">${bumen}行政复议结案情况统计</font>
						<div style="padding-top:20px;">（表格生成时间:${sysDate}&nbsp;&nbsp;操作人:${Session["_USER_LOGIN_"].name}&nbsp;&nbsp;统计起止时间:${startDateShow?default('')}-${endDateShow?default('')}）</div>
					</td>
				</tr>
				<tr>
					<td rowspan="3">
						自定义统计关键词
					</td>
					<td rowspan="3">
						当期案件总数
					</td>
					<td rowspan="3">
						未受理
					</td>
					<td colspan="2">
						受理未审结
					</td>
					<td colspan="14">
						受理已审结
					</td>
				</tr>
				<tr>
					<td rowspan="2" >
						办理中
					</td>
					<td rowspan="2" >
						中止
					</td>
					<td rowspan="2" >
						维持
					</td>
					<td colspan="3">
						驳回
					</td>
					<td rowspan="2" >
						撤销
					</td>
					<td rowspan="2" >
						变更
					</td>
					<td rowspan="2" >
						确认违法
					</td>
					<td rowspan="2" >
						责令履责
					</td>
					<td colspan="4">
						终止
					</td>
					<td rowspan="2" >
						调解
					</td>
					<td rowspan="2" >
						其他处理
					</td>
				</tr>
				<tr>
				<td>
						已经履责
					</td>
					<td>
						不应当受理
					</td>
					<td>
						其他
					</td>
					<td>
						和解协议
					</td>
					<td>
						自愿撤回
					</td>
					<td>
						改变撤回
					</td>
					<td>
						其他
					</td>
				</tr>




				<#list totalList as l>
				<tr>
				<td rowspan="1">${keywordListname[l_index]?default('总计')}</td>
				<#list l as ll>
						<td>
							${ll?default('0')}
						</td>
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