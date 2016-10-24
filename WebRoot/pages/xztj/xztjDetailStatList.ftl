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
			<form action="saveAuditResult.action" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
			<table class="z_info_table" width="98%" cellspacing="0" cellpadding="0" border="0" id="table1" style="width:98%;table-layout:fixed;border-collapse:collapse">
				<tr>
					<#assign quarterMap={"1":"第一季度","2":"第二季度","3":"第三季度","4":"第四季度","5":"全年"}>
					<td colspan="30" style="text-align: center;">
						<br/><font style="font-size:24px;">
						北京市政府各区县行政调解案件${xztjStat.statYear}年度${quarterMap[xztjStat.quarterOfYear]}统计表
						<div style="padding-top:10px;">&nbsp;</div>										
					</td>
				</tr>
				
				<tr>
					<td rowspan="3" colspan="3">
						项目
					</td>
					
					<td rowspan="3">
						案件总数
					</td rowspan="3">
					
					<td rowspan="3">
						调解成功数
					</td>
					
					<td rowspan="3">
						涉案人数
					</td>
					
					<td rowspan="3">
						调解成功金额
					</td>
					
					<td colspan="12">
						民事纠纷
					</td>
					
					<td colspan="7">
						行政争议
					</td>
					
					<td colspan="2">
						协议形式
					</td>
					
					<td colspan="2">
						履行情况
					</td>
				</tr>
				
				<tr>
					<td rowspan="2">
						民事纠纷总数
					</td>
					
					<td rowspan="2">
						调解成功总数
					</td>
					
					<td rowspan="1" colspan="10">
						纠纷类型
					</td>
					
					<td rowspan="2" colspan="1">
						行政争议总数
					</td>
					
					<td rowspan="2">
						调解成功总数
					</td>
					
					<td rowspan="1" colspan="3">
						争议类型
					</td>
					
					<td rowspan="1" colspan="2">
						调解阶段
					</td>
					
					<td rowspan="2" colspan="1">
						书面协议
					</td>
					
					<td rowspan="2" colspan="1">
						口头协议
					</td>
					
					<td rowspan="2" colspan="1">
						司法确认
					</td>
					
					<td rowspan="2" colspan="1">
						已履行
					</td>
				</tr>
				
				<tr>					
					<td>
						治安调解的民间纠纷
					</td>
					
					<td>
						交通事故损害赔偿纠纷
					</td>
					
					<td>
						合同纠纷
					</td>
					
					<td>
						医疗事故赔偿纠纷
					</td>
					
					<td>
						消费者权益保护纠纷、产品质量纠纷
					</td>
					
					<td>
						土地承包经营纠纷
					</td>
					
					<td>
						侵犯知识产权赔偿纠纷
					</td>
					
					<td>
						环境污染赔偿纠纷
					</td>
					
					<td>
						电力、水事纠纷
					</td>
					
					<td>
						其他民事纠纷
					</td>
					
					<td>
						赔偿案件
					</td>
					
					<td>
						补偿案件
					</td>
					
					<td>
						法定自由裁量产生的争议
					</td>
					
					<td>
						行政复议
					</td>
					
					<td>
						行政诉讼
					</td>
				</tr>					
				
				<tr>
					<td colspan="3">
						单位
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
				
					<td>
						人
					</td>
					
					<td>
						万元
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					<td>
						件
					</td>
					
					
				</tr>
					
				<tr>
					<td colspan="3">
						序号
					</td>
					
					<td>
						1
					</td>
					
					<td>
						2
					</td>
					
					<td>
						3
					</td>
					
					<td>
						4
					</td>
					
					<td>
						5
					</td>
								
					<td>
						6
					</td>
					
					<td>
						7
					</td>
					
					<td>
						8
					</td>
					
					<td>
						9
					</td>
					
					<td>
						10
					</td>
					
					<td>
						11
					</td>
					
					<td>
						12
					</td>
					
					<td>
						13
					</td>
					
					<td>
						14
					</td>
					
					<td>
						15
					</td>
					
					<td>
						16
					</td>
					
					<td>
						17
					</td>
					
					<td>
						18
					</td>
					
					<td>
						19
					</td>
					
					<td>
						20
					</td>
					
					<td>
						21
					</td>
					
					<td>
						22
					</td>
					
					<td>
						23
					</td>
					
					<td>
						24
					</td>
					
					<td>
						25
					</td>	
					
					<td>
						26
					</td>
					
					<td>
						27
					</td>						
					
				</tr>
				
				<#assign deptNameMap = {"0000":"市法制办","0100":"东城区","0200":"西城区","0500":"朝阳区","0600":"海淀区","0700":"丰台区","0800":"石景山区","0900":"门头沟区","1000":"房山区","1100":"通州区","1200":"顺义区","1300":"大兴区","1400":"昌平区","1500":"平谷区","1600":"怀柔区","1700":"密云县","1800":"延庆县","1850":"合计1","1900":"市发改委","2000":"市教委","2100":"市科委","2200":"市民委","2300":"市公安局","2500":"市民政局","2600":"市司法局","2700":"市财政局","2900":"市人社局","3000":"市国土局","3100":"市规划委","3200":"市住建委","3300":"市市政市容委","3400":"市交通委","3500":"市水务局","3600":"市农委","3800":"市文化局","3900":"市卫计委","4100":"市审计局","4300":"市国资委","4400":"市地税局","4500":"市工商局","4600":"市质监局","4700":"市环保局","5100":"市新闻出版广电局","5200":"市文物局","5300":"市体育局","5400":"市统计局","5500":"市园林绿化局","5600":"市食药监督局","5700":"市安全监管局","5800":"市旅游委","5900":"市政府侨办","6000":"市民防局","6200":"市城管执法局","6900":"市文化执法总队","7200":"市知识产权局","7400":"公积金管理中心","8300":"开发区管委会","8700":"市商务委","9000":"市经信委","9200":"市信访办","9300":"市文资办","9500":"合计2","9999":"总合计"}>
				<#list xztjDetailList as xztj>
				<tr>
					
					<td colspan="3" <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${deptNameMap[xztj.locbm]}</td>
															
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.totalCaseCount}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.tjSuccessCount}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.caseInvolvedCount}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.caseInvolvedSum}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.civilQuarrelSum}</td>
					
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.civilQuarrelSuccess}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.zatjCivilQuarrel}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.travelAccidentQuarrel}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.contractQuarrel}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.medicalQuarrel}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.consumerProfitQuarrel}</td>
					
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.soilQuarrel}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.brandRightsQuarrel}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.environmentPullutionQuarrel}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.powerQuarrel}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.otherCivilQuarrel}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.adminQuarrelTotal}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.adminQuarrelSuccess}</td>
					
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.compensateCount}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.offsetCount}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.legalQuarrel}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.xzfyCount}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.xzssCount}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.writtenProtocol}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.oralProtocol}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.judicialCofirm}</td>
					<td <#if xztj.locbm == '1850'||xztj.locbm == '9500'||xztj.locbm == '9999'>style="border-top:5px solid #155eb0;border-bottom:5px solid #155eb0;font-weight:bold;color:#155eb0;"<#else>style="font-weight:bold;color:green;"</#if>>${xztj.performCount}</td>			
				</tr>				
				</#list>
				
				<tr>	
					<td colspan="30" style="text-align: left" rowspan="1">					
						<font>注：序号1=序号5+17，序号2=序号6+18=序号24+25，序号5=序号7至16之和，序号17=序号19+20+21=序号22+23</font>
					</td>
				</tr>
				
				<tr>
					<td colspan="30" style="text-align: left" rowspan="1">					
						<font color="red">填表说明：<br/>&nbsp;&nbsp;1、填报内容：各区县只填报所属乡镇政府、街道办事处的行政调解情况，不含委办局；各市属委办局填报本级和本系统行政调解情况；<br/>&nbsp;&nbsp;2、报送时间：每季度报送一次。每季度下一个月的5日前报送，报第四季度数据的同时报全年汇总数据；<br/>&nbsp;&nbsp;3、填报方式：承办人登录北京市政府法制工作系统后，选择行政复议和应诉管理系统→统计查询→行政调解统计→数据采集→右下角点击 “新建”页面上进行填写→提交；本单位审核人审核操作：登录北京市政府法制工作系统后，选择行政复议和应诉管理系统→统计查询→行政调解统计→审核上报→审核→通过（退回）→提交；<br/>&nbsp;&nbsp;4、各区县政府、各部门可参照本表制定本单位的行政调解统计表进行行政调解情况统计。</font>
					</td>
				</tr>
				
				<tr>
					<td colspan="30" style="text-align: center">				
						<#--<input type="button" class="ui-btn-normal" value="提交" onclick="auditSubmitApp()"/>-->					
						<input type="button" class="ui-btn-normal" value="导出" onclick="AutomateExcel('table1')"/>
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
			$('#status').val('0');
			document.form1.action="saveXztjStatNew.action";
			document.form1.submit();
			alert("提交成功！");
		}
	}

	function changeArrange(value){
		if(value==1){
			$('#status').val('1');
		}
		else{
			document.getElementById("auditIdea").style.display="block";
			$('#status').val('2');
		}
	}
	
	function auditSubmitApp(){
		if(!checkRadioOrNot()){
			alert(请选择是否通过！)
			return;
		}
		

		if($('#r2').checked == true){
			if($.trim($('#auditIdea').val())==''){
				alert("请填写审核意见！");
				return;
			}
		}
		
		if(confirm("确定提交审核吗？")){
			document.form1.submit();
			alert("提交成功！");
		}

	}
	
	function checkRadioOrNot(){
		var a = document.getElementsByName("checkRadio");
		for(var i=0; i<a.length; i++){
			if(a[i].checked==true){
				return true;
			}
		}
		return false;
	}
</script>
	</body>
</html>