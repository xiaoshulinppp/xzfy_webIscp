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
			<table class="z_info_table" width="80%" cellspacing="0" cellpadding="0" border="0" id="table1">
				<tr>
					<td colspan="22" style="text-align: center;">
						<font style="font-size:20px;font-family:黑体">${orgName}行政复议接待工作统计</font>
						<div style="padding-top:5px;">（ 表格生成时间:${sysDate}&nbsp;&nbsp;操作人:${Session["_USER_LOGIN_"].name}&nbsp;&nbsp;统计起止时间:${startDateShow?default('')}-${endDateShow?default('')}）</div>
					</td>
				</tr>
				<tr>
					<td rowspan="5" style="text-align: center;">
						年度
					</td>
					<td rowspan="5">
						月份
					</td>
					<td rowspan="5" >
						周次
					</td>
					<td colspan="14" style="text-align: center;">
						当面接待
					</td>
					<td colspan="5" style="text-align: center;">
						接收复议申请（件）
					</td>
				</tr>
				<tr>
					<td rowspan="3" style="text-align: center;">
						总起次
					</td>
					<td rowspan="3" style="text-align: center;">
						总人数
					</td>
					<td colspan="8" style="text-align: center;">
						协助案件审理
					</td>
					<td colspan="2" rowspan="2" style="text-align: center;">
						一般接待
					</td>
					<td colspan="2" rowspan="2" style="text-align: center;">
						接收申请
					</td>
					<td rowspan="3" style="text-align: center;">
						总数
					</td>
					<td rowspan="3" style="text-align: center;">
						当面
					</td>
					<td rowspan="3" style="text-align: center;">
						来信
					</td>
					<td rowspan="3" style="text-align: center;">
						互联网
					</td>
					<td rowspan="3" style="text-align: center;">
						其他
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						阅卷
					</td>
					<td colspan="2" style="text-align: center;">
						送达
					</td>
					<td colspan="2" style="text-align: center;">
						转接材料
					</td>
					<td colspan="2">
						谈话调查
					</td>
				</tr>
				<tr>
					<td>
						起次
					</td>
					<td>
						人数
					</td>
					<td>
						起次
					</td>
					<td>
						人数
					</td>
					<td>
						起次
					</td>
					<td>
						人数
					</td>
					<td>
						起次
					</td>
					<td>
						人数
					</td>
					<td>
						起次
					</td>
					<td>
						人数
					</td>
					<td>
						起次
					</td>
					<td>
						人数
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
						D
					</td>
					<td>
						E
					</td>
					<td>
						F
					</td>
					<td>
						G
					</td>
					<td>
						H
					</td>
					<td>
						I
					</td>
					<td>
						J
					</td>
					<td>
						K
					</td>
					<td>
						L
					</td>
					<td>
						M
					</td>
					<td>
						N
					</td>
					<td>
						P
					</td>
					<td>
						Q
					</td>
					<td>
						R
					</td>
					<td>
						S
					</td>
					<td>
						T
					</td>
				</tr>
				<#list dataLists as data>
				<tr>
					<#list data as l>
					<td width="${(100/data.size())?string("0.##")}%">
						<#if data_index lt 3 >
						${l?default('')}
						<#else>
						${l?default('0')}
						</#if>
						
					</td>
					</#list>
				</tr>
				</#list>
				<tr>
					<td colspan="3">
						合计
					</td>
					<#assign totalList=action.getJieDaiTongJiTotalList('${startDate}','${endDate}','${handleName}','${handleId}')>
					<#list totalList as l>
						<td>
							${l?default('0')}
						</td>
					</#list>
				</tr>
				<tr>
					<td colspan="22" style="text-align: center;">
						统计说明：A=C+E+G+I+K+M&nbsp;&nbsp;&nbsp;&nbsp;B=D+F+H+J+L+N&nbsp;&nbsp;&nbsp;&nbsp;P=Q+R+S+T
						M=P
					</td>
				</tr>
				<#if handleId!='0'>
				<tr>
					<td colspan="22" style="text-align: center;">
						 数据来源：${handleName}<br>
						统计起止时间:${startDateShow?default('')}-${endDateShow?default('')}<br>
					</td>
				</tr>				
				</#if>
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