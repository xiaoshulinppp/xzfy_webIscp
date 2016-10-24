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
					<td colspan="21" style="text-align: center;">
					<#if handleResult=="2">
						<font style="font-size:20px;">${orgName}告知处理案件原因统计</font>
					<#elseif handleResult=="3">
						<font style="font-size:20px;">${orgName}不予受理案件原因统计</font>
					</#if>
						
						<div style="padding-top:5px;">（ 表格生成时间:${sysDate}&nbsp;&nbsp;操作人:${Session["_USER_LOGIN_"].name}&nbsp;&nbsp;统计起止时间:${startDateShow?default('')}-${endDateShow?default('')}）</div>
					</td>
				</tr>
				
				<tr>
					<td rowspan="2">年度</td>
					<td rowspan="2">月份</td>
					<td rowspan="2">无明确的申请人和符合规定的被申请人</td>
					<td rowspan="2">申请人与具体行政行为无利害关系</td>
					<td rowspan="2">超过法定复议申请期限</td>
					<td rowspan="2">不属于本机构的职责范围</td>
					<td rowspan="2">无具体的行政复议请求和理由</td>
					<td rowspan="2">其他机关受理同一申请法院受理同一诉讼</td>
					<td colspan="13">不属于行政复议法规定的行政复议范围</td>
				</tr>
				<tr>
					<td>抽象行政行为</td>
					<td>行政处分人事处理决定</td>
					<td>行政机关对民事纠纷调解、处理</td>
					<td>国防外交行为</td>
					<td>交通医疗事故责任认定</td>
					<td>司法鉴定</td>
					<td>刑事司法行为</td>
					<td>民事行为</td>
					<td>信访行为</td>
					<td>行政机关内部行为</td>
					<td>不具有强制力的行政指导</td>
					<td>其他复议机关对复议申请的处理</td>
					<td>其他</td>
				</tr>
				<#list dataLists as data>
					<tr>
						<#if !data_has_next>
							<td colspan="2">合计</td>
						</#if>
						<#list data as d>
							<td width="${(100/data.size())?string("0.##")}%">${d?default('0')}</td>	
						</#list>
					</tr>
				</#list>
				<tr>
					<td colspan="21" style="text-align: center;">
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