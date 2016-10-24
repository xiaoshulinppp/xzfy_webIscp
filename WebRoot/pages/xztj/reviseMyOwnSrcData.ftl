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
			<form action="saveReviseResult.action" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
			<table class="z_info_table" width="98%" cellspacing="0" cellpadding="0" border="0" id="table1" style="width:98%;table-layout:fixed;border-collapse:collapse">
				<tr>
					<td colspan="29" style="text-align: center;">
						<br/><br/><font style="font-size:24px;">
						北京市${orgTitle}行政调解案件
						<#--
						<select name="xztjStat.statYear" style="width:5%">
						<#list yearList as y>							
								<option <#if y == xztjStat.statYear>selected</#if> readonly value="${y}">${y}</option>							
						</#list>
						</select>
						-->
						${xztjStat.statYear}
						年度
						<#assign quarterMap={"1":"第一季度","2":"第二季度","3":"第三季度","4":"第四季度","5":"全年"}>
						${quarterMap[xztjStat.quarterOfYear]}
						<#--
						<select name="xztjStat.quarterOfYear" style="width:5%">		
							<#assign qY = xztjStat.quarterOfYear?default('')>
								<option value="" <#if qY == ''>selected readonly</#if>>-请选择-</option>
								<option value="1" <#if qY == '1'>selected readonly</#if>>一</option>
								<option value="2" <#if qY == '2'>selected readonly</#if>>二</option>
								<option value="3" <#if qY == '3'>selected readonly</#if>>三</option>
								<option value="4" <#if qY == '4'>selected readonly</#if>>四</option>						
						</select>
						-->
						统计表</font>
						<div style="padding-top:20px;">（ 填报单位:${xztjStat.appFirm}&nbsp;&nbsp;填报日期:&nbsp;&nbsp;<input type="text" class="" name="xztjStat.appDate" value="${xztjStat.appDate}" readonly style="width:5%"/>&nbsp;&nbsp;填报人:${xztjStat.appPerson}&nbsp;&nbsp;）</div>
						<br/>
					</td>
				</tr>
				
				<tr>
					<td rowspan="3" colspan="2">
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
					<td colspan="2">
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
					<td colspan="2">
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
				
				<tr>
					<td colspan="2">
						输入
					</td>
					<input type="hidden" class="" name="funcCode" value="${funcCode}"/>
					<input type="hidden" class="" id="status" name="xztjStat.status" value="${xztjStat.status}"/>
					
					<input type="hidden" class="" name="xztjStat.statYear" value="${xztjStat.statYear}"/>
					<input type="hidden" class="" name="xztjStat.quarterOfYear" value="${xztjStat.quarterOfYear}"/>
					
					<input type="hidden" class="" name="xztjStat.id" value="${xztjStat.id}"/>
					
					<input type="hidden" class="" name="xztjStat.appId" value="${xztjStat.appId}"/>
					<input type="hidden" class="" name="xztjStat.auditId" value="${xztjStat.auditId}"/>
					
					<input type="hidden" class="" name="xztjStat.locbm"  value="${xztjStat.locbm}" />
					<input type="hidden" class="" name="xztjStat.orgId" value="${xztjStat.orgId}"/>
					
					<input type="hidden" class="" name="xztjStat.appFirm" value="${xztjStat.appFirm}"/>
					<input type="hidden" class="" name="xztjStat.appPerson" value="${xztjStat.appPerson}"/>					
					
					<td>
						<input type="text" id="totalCaseCount" class="" name="xztjStat.totalCaseCount" value="${xztjStat.totalCaseCount}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="tjSuccessCount" class="" name="xztjStat.tjSuccessCount" value="${xztjStat.tjSuccessCount}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="caseInvolvedCount" class="" name="xztjStat.caseInvolvedCount" value="${xztjStat.caseInvolvedCount}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="caseInvolvedSum" class="" name="xztjStat.caseInvolvedSum" value="${xztjStat.caseInvolvedSum}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="civilQuarrelSum" class="" name="xztjStat.civilQuarrelSum" value="${xztjStat.civilQuarrelSum}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="civilQuarrelSuccess" class="" name="xztjStat.civilQuarrelSuccess" value="${xztjStat.civilQuarrelSuccess}" onblur="checkNumber(this.id)"/>
					</td>
					<#--
					<td>
						<input type="text" class="" name="xztjStat.fzbGov_body" value="0"/>
					</td>
					
					<td>
						<input type="text" class="" name="xztjStat.police_body" value="0"/>
					</td>
					
					<td>
						<input type="text" class="" name="xztjStat.icommerce_body" value="0"/>
					</td>
					
					<td>
						<input type="text" class="" name="xztjStat.humanSecurity_body" value="0"/>
					</td>
					
					<td>
						<input type="text" class="" name="xztjStat.cityManage_body" value="0"/>
					</td>
					
					<td>
						<input type="text" class="" name="xztjStat.land_body" value="0"/>
					</td>
					
					<td>
						<input type="text" class="" name="xztjStat.houseBuilding_body" value="0"/>
					</td>
					
					<td>
						<input type="text" class="" name="xztjStat.plan_body" value="0"/>
					</td>
					
					<td>
						<input type="text" class="" name="xztjStat.traffic_body" value="0"/>
					</td>
					
					<td>
						<input type="text" class="" name="xztjStat.judge_body" value="0"/>
					</td>
					
					<td>
						<input type="text" class="" name="xztjStat.wbjOthers_body" value="0"/>
					</td>
					
					<td>
						<input type="text" class="" name="xztjStat.streetTown_body" value="0"/>
					</td>
					-->
					<td>
						<input type="text" id="zatjCivilQuarrel" class="" name="xztjStat.zatjCivilQuarrel" value="${xztjStat.zatjCivilQuarrel}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="travelAccidentQuarrel" class="" name="xztjStat.travelAccidentQuarrel" value="${xztjStat.travelAccidentQuarrel}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="contractQuarrel" class="" name="xztjStat.contractQuarrel" value="${xztjStat.contractQuarrel}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="medicalQuarrel" class="" name="xztjStat.medicalQuarrel" value="${xztjStat.medicalQuarrel}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="consumerProfitQuarrel" class="" name="xztjStat.consumerProfitQuarrel" value="${xztjStat.consumerProfitQuarrel}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="soilQuarrel" class="" name="xztjStat.soilQuarrel" value="${xztjStat.soilQuarrel}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="brandRightsQuarrel" class="" name="xztjStat.brandRightsQuarrel" value="${xztjStat.brandRightsQuarrel}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="environmentPullutionQuarrel" class="" name="xztjStat.environmentPullutionQuarrel" value="${xztjStat.environmentPullutionQuarrel}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="powerQuarrel" class="" name="xztjStat.powerQuarrel" value="${xztjStat.powerQuarrel}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="otherCivilQuarrel" class="" name="xztjStat.otherCivilQuarrel" value="${xztjStat.otherCivilQuarrel}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="adminQuarrelTotal" class="" name="xztjStat.adminQuarrelTotal" value="${xztjStat.adminQuarrelTotal}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="adminQuarrelSuccess" class="" name="xztjStat.adminQuarrelSuccess" value="${xztjStat.adminQuarrelSuccess}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="compensateCount" class="" name="xztjStat.compensateCount" value="${xztjStat.compensateCount}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="offsetCount" class="" name="xztjStat.offsetCount" value="${xztjStat.offsetCount}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="legalQuarrel" class="" name="xztjStat.legalQuarrel" value="${xztjStat.legalQuarrel}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="xzfyCount" class="" name="xztjStat.xzfyCount" value="${xztjStat.xzfyCount}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="xzssCount" class="" name="xztjStat.xzssCount" value="${xztjStat.xzssCount}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="writtenProtocol" class="" name="xztjStat.writtenProtocol" value="${xztjStat.writtenProtocol}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="oralProtocol" class="" name="xztjStat.oralProtocol" value="${xztjStat.oralProtocol}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="judicialCofirm" class="" name="xztjStat.judicialCofirm" value="${xztjStat.judicialCofirm}" onblur="checkNumber(this.id)"/>
					</td>
					
					<td>
						<input type="text" id="performCount" class="" name="xztjStat.performCount" value="${xztjStat.performCount}" onblur="checkNumber(this.id)"/>
					</td>
					
					
				</tr>
				
				<tr>	
					<td colspan="29" style="text-align: left" rowspan="1">					
						<font>注：序号1=序号5+17，序号2=序号6+18=序号24+25，序号5=序号7至16之和，序号17=序号19+20+21=序号22+23</font>
					</td>
				</tr>
				
				<tr>
					<td colspan="29" style="text-align: left" rowspan="1">					
						<font color="red">填表说明：<br/>&nbsp;&nbsp;1、填报内容：各区县只填报所属乡镇政府、街道办事处的行政调解情况，不含委办局；各市属委办局填报本级和本系统行政调解情况；<br/>&nbsp;&nbsp;2、报送时间：每季度报送一次。每季度下一个月的5日前报送，报第四季度数据的同时报全年汇总数据；<br/>&nbsp;&nbsp;3、填报方式：承办人登录北京市政府法制工作系统后，选择行政复议和应诉管理系统→统计查询→行政调解统计→数据采集→右下角点击 “新建”页面上进行填写→提交；本单位审核人审核操作：登录北京市政府法制工作系统后，选择行政复议和应诉管理系统→统计查询→行政调解统计→审核上报→审核→通过（退回）→提交；<br/>&nbsp;&nbsp;4、各区县政府、各部门可参照本表制定本单位的行政调解统计表进行行政调解情况统计。</font>
					</td>
				</tr>
				<#--
				<tr>
					<td rowspan="4">
						年度
					</td>
					<td rowspan="4">
						月份
					</td>
					<td rowspan="4">
						周次
					</td>
					<td rowspan="3" colspan="3">
						当期案件总数
					</td>
					<td colspan="15">
						已审查（件）
					</td>
					<td rowspan="3" colspan="3">
						未审查（件）
					</td>
					<td rowspan="3" colspan="3">
						通知补正待处理（件）
					</td>
				</tr>
				<tr>
					<td rowspan="2" colspan="3">
						受理
					</td>
					<td rowspan="2" colspan="3">
						告知处理
					</td>
					<td rowspan="2" colspan="3">
						不予受理
					</td>
					<td colspan="6">
						其他处理
					</td>
				</tr>
				<tr>
					<td colspan="3">
						案前和解
					</td>
					<td colspan="3">
						未经和解
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
						A
					</td>
					<td>
						B
					</td>
					<td>
						C
					</td>
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
						A
					</td>
					<td>
						B
					</td>
					<td>
						C
					</td>
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
						A
					</td>
					<td>
						B
					</td>
					<td>
						C
					</td>
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
						A
					</td>
					<td>
						B
					</td>
					<td>
						C
					</td>
				</tr>
				<tr>
					<td colspan="3">合计</td>
										
						<td>0</td>
					
				</tr>
				<tr>
					<td colspan="27" style="text-align: center;">					
统计说明：
					
					</td>
				</tr>
				-->
				
				<tr>
					<td colspan="29" style="text-align: left">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;审核结果：&nbsp;&nbsp;&nbsp;&nbsp;已退回
					</td>
				</tr>
				
				<tr id="auditIdea">
					<td colspan="5">
						审核意见：
					</td>
					
					<td colspan="24">
							<textarea class="" id="auditIdea" name="xztjStat.auditIdea" readonly>${xztjStat.auditIdea}</textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="5">
						审核人：
					</td>
					
					<td colspan="8">
						<input type="text" class="" name="xztjStat.auditPerson" readonly value="${xztjStat.auditPerson}" style="width:80%"/>
					</td>
					
					<td colspan="5">
						审核时间：
					</td>
					
					<td colspan="11">
						<input type="text" class="" name="xztjStat.auditDate" value="${xztjStat.auditDate}" readonly style="width:85%"/>
					</td>
				</tr>
				
				<tr>
					<td colspan="29" style="text-align: center">				
						<input type="button" class="ui-btn-normal" value="提交" onclick="submitApp()"/>					
						<#--<input type="button" class="ui-btn-normal" value="导出" onclick="AutomateExcel('table1')"/>-->
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
		if(!effectOrNot()){
			alert("统计项存在未填写项，请检查！");
			return;
		}
		
		if(confirm("确定提交吗？")){
			$('#status').val('0');
			document.form1.submit();
			alert("提交成功！");
		}
	}
	
	//验证是否为空
	function effectOrNot(){
		var textArray = document.getElementsByTagName('input');
		for(var i=0; i<textArray.length; i++){
			if(textArray[i].value==null||textArray[i].value==''){
					return false;				
			}
		}
		return true;
	}
	
	  function checkNumber(input)
	  {
    	 	var re = /^[0-9]+.?[0-9]*$/;   //判断字符串是否为数字     //判断正整数 /^[1-9]+[0-9]*]*$/  
    		var nubmer = $('#'+input).val();
    
    		 if (!re.test(nubmer))
   			 {
        		alert("请输入数字！");
        		$('#'+input).val('');
//       			return false;
     		}
	  }
</script>
	</body>
</html>