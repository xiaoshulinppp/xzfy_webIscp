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
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
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
			.ui-btn-normal{
				background:url(../sys_theme/images/button_bg.png) top no-repeat ;
				background-position:-6px -44px;
				color:#0c1d3d;
	
			}
		</style>
	</head>
	<body>
		<div class="z_info">
		<br>
			<form action="saveXztjStatNew.action" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
			<table class="z_info_table" width="98%" cellspacing="0" cellpadding="0" border="0" id="table1" style="width:98%;table-layout:fixed;border-collapse:collapse">
				<tr>
					<td colspan="15" style="text-align: center">
						<br/><font style="font-size:24px;">北京市政府各部门行政调解案件
						<select name="" style="width:5%">
						<#list yearList as y>
							<option <#if y == currentYear>selected</#if> value="${y}">${y}</option>
						</#list>
						</select>
						年度第（
						<select name="" style="width:5%">
							<option value="">-请选择-</option>
							<option value="1">一</option>
							<option value="2">二</option>
							<option value="3">三</option>
							<option value="4">四</option>
						</select>
						）季度统计表</font>
						<div style="padding-top:20px;">（ 填报单位:北京市人民政府&nbsp;&nbsp;填报日期:&nbsp;&nbsp;<input type="text" class="" name="xztjStat.appDate" value="2015-04-25" style="width:5%" onClick="WdatePicker()"/>&nbsp;&nbsp;填报人:${Session["_USER_LOGIN_"].name}&nbsp;&nbsp;）</div>
					</td>
				</tr>
				
				<tr>
					<td>
						<img src="../pages/xztj/images/cabImages.png"/>
					</td>
					
					<td>
						类别
					</td>
					
					<td>
						调整数量
					</td>
					
					<td>
						复议前调解
					</td>
					
					<td>
						复议中调解
					</td>
					
					<td>
						依职权主动调解
					</td>
					
					<td>
						依申请调解
					</td>
					
					<td>
						口头协议
					</td>
					
					<td>
						自动履行
					</td>
					
					<td>
						司法确认
					</td>
					
					<td>
						当事人数
					</td>
					
					<td>
						其中3人以上当事人
					</td>
					
					<td>
						涉及金额
					</td>
					
					<td>
						书面协议
					</td>					
					
					<td>
						预防效果
					</td>
				</tr>
				
				<tr>
					<td style="text-align: center">
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>公安</option>
							<option>工商</option>
							<option>人力社保</option>
							<option>城管</option>
							<option>国土</option>
							<option>房屋住建</option>
							<option>规划</option>
							<option>交通</option>	
							<option>司法</option>	
							<option>其它</option>							
						<select>
					</td>
					
					<td>
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>公安</option>
							<option>土地</option>
							<option>房屋拆迁</option>
							<option>工商</option>
							<option>劳动与社会保障</option>
							<option>城市规划</option>
							<option>婚姻家庭纠纷</option>
							<option>邻里纠纷</option>
							<option>房屋宅基地纠纷</option>
							<option>合同纠纷</option>
							<option>生产经营纠纷</option>
							<option>损害赔偿纠纷</option>
							<option>山林土地纠纷</option>
							<option>征地拆迁纠纷</option>
							<option>环境保护纠纷</option>
							<option>拖欠农民工工资纠纷</option>
							<option>旅游纠纷</option>
							<option>电子商务纠纷</option>
							<option>医疗纠纷</option>
							<option>道路交通纠纷</option>
							<option>物业纠纷</option>
							<option>其它纠纷</option>
						<select>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>					
					
					<td>
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>排查纠纷</option>
							<option>预防纠纷</option>
							<option>防止民间纠纷引起自杀</option>
							<option>防止民间纠纷转化为刑事案件</option>
							<option>防止群体性上访</option>
							<option>防止群体性械斗</option>							
						<select>
					</td>
				</tr>
				
				<tr>
					<td style="text-align: center">
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>公安</option>
							<option>工商</option>
							<option>人力社保</option>
							<option>城管</option>
							<option>国土</option>
							<option>房屋住建</option>
							<option>规划</option>
							<option>交通</option>	
							<option>司法</option>	
							<option>其它</option>							
						<select>
					</td>
					
					<td>
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>公安</option>
							<option>土地</option>
							<option>房屋拆迁</option>
							<option>工商</option>
							<option>劳动与社会保障</option>
							<option>城市规划</option>
							<option>婚姻家庭纠纷</option>
							<option>邻里纠纷</option>
							<option>房屋宅基地纠纷</option>
							<option>合同纠纷</option>
							<option>生产经营纠纷</option>
							<option>损害赔偿纠纷</option>
							<option>山林土地纠纷</option>
							<option>征地拆迁纠纷</option>
							<option>环境保护纠纷</option>
							<option>拖欠农民工工资纠纷</option>
							<option>旅游纠纷</option>
							<option>电子商务纠纷</option>
							<option>医疗纠纷</option>
							<option>道路交通纠纷</option>
							<option>物业纠纷</option>
							<option>其它纠纷</option>
						<select>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>					
					
					<td>
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>排查纠纷</option>
							<option>预防纠纷</option>
							<option>防止民间纠纷引起自杀</option>
							<option>防止民间纠纷转化为刑事案件</option>
							<option>防止群体性上访</option>
							<option>防止群体性械斗</option>							
						<select>
					</td>
				</tr>
				
				<tr>
					<td style="text-align: center">
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>公安</option>
							<option>工商</option>
							<option>人力社保</option>
							<option>城管</option>
							<option>国土</option>
							<option>房屋住建</option>
							<option>规划</option>
							<option>交通</option>	
							<option>司法</option>	
							<option>其它</option>							
						<select>
					</td>
					
					<td>
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>公安</option>
							<option>土地</option>
							<option>房屋拆迁</option>
							<option>工商</option>
							<option>劳动与社会保障</option>
							<option>城市规划</option>
							<option>婚姻家庭纠纷</option>
							<option>邻里纠纷</option>
							<option>房屋宅基地纠纷</option>
							<option>合同纠纷</option>
							<option>生产经营纠纷</option>
							<option>损害赔偿纠纷</option>
							<option>山林土地纠纷</option>
							<option>征地拆迁纠纷</option>
							<option>环境保护纠纷</option>
							<option>拖欠农民工工资纠纷</option>
							<option>旅游纠纷</option>
							<option>电子商务纠纷</option>
							<option>医疗纠纷</option>
							<option>道路交通纠纷</option>
							<option>物业纠纷</option>
							<option>其它纠纷</option>
						<select>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>					
					
					<td>
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>排查纠纷</option>
							<option>预防纠纷</option>
							<option>防止民间纠纷引起自杀</option>
							<option>防止民间纠纷转化为刑事案件</option>
							<option>防止群体性上访</option>
							<option>防止群体性械斗</option>							
						<select>
					</td>
				</tr>
				
				<tr>
					<td style="text-align: center">
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>公安</option>
							<option>工商</option>
							<option>人力社保</option>
							<option>城管</option>
							<option>国土</option>
							<option>房屋住建</option>
							<option>规划</option>
							<option>交通</option>	
							<option>司法</option>	
							<option>其它</option>							
						<select>
					</td>
					
					<td>
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>公安</option>
							<option>土地</option>
							<option>房屋拆迁</option>
							<option>工商</option>
							<option>劳动与社会保障</option>
							<option>城市规划</option>
							<option>婚姻家庭纠纷</option>
							<option>邻里纠纷</option>
							<option>房屋宅基地纠纷</option>
							<option>合同纠纷</option>
							<option>生产经营纠纷</option>
							<option>损害赔偿纠纷</option>
							<option>山林土地纠纷</option>
							<option>征地拆迁纠纷</option>
							<option>环境保护纠纷</option>
							<option>拖欠农民工工资纠纷</option>
							<option>旅游纠纷</option>
							<option>电子商务纠纷</option>
							<option>医疗纠纷</option>
							<option>道路交通纠纷</option>
							<option>物业纠纷</option>
							<option>其它纠纷</option>
						<select>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>					
					
					<td>
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>排查纠纷</option>
							<option>预防纠纷</option>
							<option>防止民间纠纷引起自杀</option>
							<option>防止民间纠纷转化为刑事案件</option>
							<option>防止群体性上访</option>
							<option>防止群体性械斗</option>							
						<select>
					</td>
				</tr>
				
				<tr>
					<td style="text-align: center">
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>公安</option>
							<option>工商</option>
							<option>人力社保</option>
							<option>城管</option>
							<option>国土</option>
							<option>房屋住建</option>
							<option>规划</option>
							<option>交通</option>	
							<option>司法</option>	
							<option>其它</option>							
						<select>
					</td>
					
					<td>
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>公安</option>
							<option>土地</option>
							<option>房屋拆迁</option>
							<option>工商</option>
							<option>劳动与社会保障</option>
							<option>城市规划</option>
							<option>婚姻家庭纠纷</option>
							<option>邻里纠纷</option>
							<option>房屋宅基地纠纷</option>
							<option>合同纠纷</option>
							<option>生产经营纠纷</option>
							<option>损害赔偿纠纷</option>
							<option>山林土地纠纷</option>
							<option>征地拆迁纠纷</option>
							<option>环境保护纠纷</option>
							<option>拖欠农民工工资纠纷</option>
							<option>旅游纠纷</option>
							<option>电子商务纠纷</option>
							<option>医疗纠纷</option>
							<option>道路交通纠纷</option>
							<option>物业纠纷</option>
							<option>其它纠纷</option>
						<select>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>
					
					<td>
						<input type="text" class="" name="" value="11" style="width:80%;text-align:center"/>
					</td>					
					
					<td>
						<select style="width:80%;text-align:center">
							<option>-请选择-</option>
							<option>排查纠纷</option>
							<option>预防纠纷</option>
							<option>防止民间纠纷引起自杀</option>
							<option>防止民间纠纷转化为刑事案件</option>
							<option>防止群体性上访</option>
							<option>防止群体性械斗</option>							
						<select>
					</td>
				</tr>
				
				<tr>
					<td style="text-align: center">
						说明
					</td>
					
					<td colspan="14" style="text-align: left">
						&nbsp;&nbsp;1．类别：填写调解的案件类型，如公安、土地、房屋拆迁、工商、劳动与社会保障、城市规划、婚姻家庭纠纷、邻里纠纷、房屋宅基地纠纷、合同纠纷、生产经营纠纷、损害赔偿纠纷、山林土地纠纷、征地拆迁纠纷、环境保护纠纷、拖欠农民工工资纠纷、旅游纠纷、电子商务纠纷、医疗纠纷、道路交通纠纷、物业纠纷等。以上没有的类别可填写为“其他纠纷”；<br/>
						&nbsp;&nbsp;2．调解主体：填写主持进行行政调解工作人的单位。<br/>
						&nbsp;&nbsp;3．预防效果：填写排查纠纷、预防纠纷、防止民间纠纷引起自杀、防止民间纠纷转化为刑事案件、防止群体性上访、防止群体性械斗。			
					</td>
				</tr>
				
				<tr>
					<td colspan="15" style="text-align: center">
						<input type="button" class="ui-btn-normal" value="提交" onclick="submitApp()"/>
						<#--input type="button" class="ui-btn-normal" value="导出" onclick="AutomateExcel('table1')"/>-->
					</td>
				</tr>
			</table>
			</form>
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

	function submitApp(){
		if(confirm("确定提交吗？")){
			document.form1.submit();
			alert("提交成功！");
		}
	}

</script>
	</body>
</html>