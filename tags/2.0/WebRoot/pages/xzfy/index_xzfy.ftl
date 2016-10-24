<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>北京市政府法制系统</title>
	</head>
	<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
	<style type="text/css">
	*{margin:0;padding:0;}
	ul,li{list-style-type:none;}
	body{font:12px/180% Arial, Helvetica, sans-serif;}
	a{color:#333;text-decoration:none;}
	a:hover{color:#3366cc;text-decoration:underline;}
	.demopage{width:960px;margin:0 auto;}
	.demopage h2{font-size:14px;margin:20px 0;}
	/* scrollDiv */
	.scrollDiv{height:25px;/* 必要元素 */line-height:25px;overflow:hidden;/* 必要元素 */}
	.scrollDiv li{height:25px;}
	#s2,#s3{height:200px;}
	#case_1,#case_2,#case_3,#case_4,#case_5{height:125px;}
	
	.leftArr {
		MARGIN-TOP: 2px; MARGIN-right: 2px;WIDTH: 20px;   BACKGROUND: url(../pages/xzfy/images/arrow_up.png) no-repeat 0px 0px; width: 34px; CURSOR: pointer
	}
	.rightArr {
		MARGIN-TOP: 2px; MARGIN-left: 2px;WIDTH: 20px;  BACKGROUND: url(../pages/xzfy/images/arrow_down.png) no-repeat 0px 0px; width: 34px; CURSOR: pointer
	}
	a.leftArr:Hover {
		MARGIN-TOP: 2px; MARGIN-right: 2px;WIDTH: 20px;  BACKGROUND: url(../pages/xzfy/images/arrow_up.png) no-repeat -34px 0px; width: 34px; CURSOR: pointer
	}
	a.rightArr:Hover {
		MARGIN-TOP: 2px; MARGIN-left: 2px;WIDTH: 20px;  BACKGROUND: url(../pages/xzfy/images/arrow_down.png) no-repeat -34px 0px; width: 34px; CURSOR: pointer
	}
	
	/*blank*/
	.blank10_vertical{ height:100%; width:4.7%; font-size:0px;overflow:hidden;float:left;}
	.blank10_horizontal{ height:10px; width:100%; font-size:0px;overflow:hidden;float:left;}
	/*blank end*/
	
	.tabout{
	border-left:1px #bbb solid;
	border-right:1px #bbb solid;
	border-top:1px #bbb solid;
	border-bottom:1px #bbb solid; 
	border-collapse:collapse;
	width:98%;
	}
	
	.tdlistCenter{
	height:24px;
	text-align:center;
	border-bottom:#bbb solid 0px;
	border-top:#bbb solid 0px;
	border-left:#bbb solid 1px;
	border-right:#bbb solid 1px;
	}
	</style>
	
	<!-- javascript脚本添加位置 -->
	<script type="text/javascript" src="../pages/xzfy/js/jquery.js"></script>
	<script type="text/javascript" src="../pages/xzfy/js/rollcontrol.js"></script>
	<!-- javascript脚本添加位置结束 -->
	</head>
<body>

<form name="listForm" action=""  method="post">
<!--复议案件列表表头-->
<table border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
	<tr>
		<td>
		您的位置：行政复议案件管理--&gt;复议案件列表
		</td>
	</tr>
</table>
<table width="98%" border="0"  align="center" cellpadding="0" cellspacing="0" class="tabtitle" >
	<tr>
		<td style="text-align:center;	vertical-align:middle;	" >
			复议案件总览（共计:${xzfyList.size()}件案件待办理）
		</td>
		<td style="text-align:right" width="220">
			<input type="button" name="addBut" value="接待办理"   onClick="reception()"/>
			<input type="button" name="addBut" value="查看全部案件"   onClick="xzfyAll()"/>
		</td>
	</tr>
</table>

<!--案件标题-->
<table width="98%" align="center" cellpadding="3" class="tabout" style="border-bottom:0px ;">
	<tr>
	 	<th class="thListNormal" width="40">序号</th>
			<!--
			<#list displayInfo.fieldNameList as fieldName>
			<th class="thListNormal">${fieldName}</th>
			</#list>
			-->
		<th class="thListNormal" width="80">
			收案日期
		</th>
		<th class="thListNormal" width="80">
			收案方式
		</th>		
		<th class="thListNormal" >
			申请人
		</th>
		<th class="thListNormal" width="300">
			被申请人
		</th>
		<th class="thListNormal" width="90">
			案件状态
		</th>
		<th class="thListNormal" width="110">
			当前办理人
		</th>
		<th class="thListNormal" width="60">
			超期预警
		</th>							
		<th class="thListNormal" width="40">
			查看
		</th>
    </tr>
</table>
<div class="scrollDiv" id="s3">
		<ul>
		<#assign count=1>
		<#list xzfyList as data>
		<li>
		<table width="98%" align="center" cellpadding="3"  class="tabout" style="border-top:0px;">
	   	<#if count%2==1>
	   	<tr class="trcolor" style="background-color:#ffffff;">
		<#else>
		<tr class="trcolor" style="background-color:#f5f0e9;">
		</#if>	   	
			<td class="tdlistCenter" width="40">
			${count}
		   	</td>
		   	<td class="tdlistCenter" width="80">
			${data.receive_date?default("")}
		   	</td>
		   	<td class="tdlistCenter" width="80">
			XXX
		   	</td>		   	
		   	<td class="tdlistCenter" >
		   	<#if data.appdetail?exists>
			${data.appdetail?default("")}
			</#if>
		   	</td>
			<td class="tdlistCenter" width="300">
		   	<#if data.defendant_name?exists>
				<#if data.defendant_type=='1'>
				乡镇政府
				<#elseif data.defendant_type=='2'>
				县级政府
				<#elseif data.defendant_type=='3'>
				县级政府部门
				<#elseif data.defendant_type=='6'>
				省部级行政机关
				<#elseif data.defendant_type=='7'>
				省级政府部门
				<#elseif data.defendant_type=='8'>
				其他
				<#elseif data.defendant_type=='9'>
				市经济技术开发区管委会
				</#if>
			</#if>
		   	</td>
			<td class="tdlistCenter" width="90">
			<#if data.status == "1">
				<input type="button" name="addBut" value="立案"  onClick="caseDeal(1,'${data.id}')" style="width:80px;padding:0px 1px;" />
			<#elseif data.status == "5">
				<input type="button" name="addBut" value="办案"  onClick="caseDeal(5)" style="width:80px;padding:0px 1px;" />
			<#elseif data.status == "9">
				<input type="button" name="addBut" value="结案审批"  onClick="caseDeal(9)" style="width:80px;padding:0px 1px;" />
			</#if>
		   	</td>
			<td class="tdlistCenter" width="110">
			XXX<a href="#"  onclick="window.open('getCurrentUserList.action?funcCode=${funcCode}','creatSub','status=yes,scrollbars=yes,resizable=yes,width=550,height=350')">[重新选择]</a>
		   	</td>		   	
			<td class="tdlistCenter" width="60">
			<font color="green">正常</font>
		   	</td>
		   	<td class="tdlistCenter" width="40">
				<a href="../xzfy/liAnView.action?xzfyId=${data.id}&funcCode=${funcCode}"><img src="../images/16B/sicons/view.gif" alt="查看" width="16" height="16" border="0"> </a>
			</td>
		</tr>
		</table>
		</li>
	   	<#assign count=count+1>
		</#list>
	</ul>
</div>

<!--滚动控制--> 
<table  align="center" class="tabMainBot">
  <tr >
    <td >
        <a id="btn1" class="leftArr" href ="javascript:;"/><a id="btn2" class="rightArr" href ="javascript:;"/>
     </td>
  </tr>
</table>
<hr width="98%">


<!--个人案件待办列表-->
<div style="text-align:center">
	<div style="width:98%;" style="text-align:center" >
		<!--待立案审查-->
		<div class="case_lian" style="width:30%;float:left;">
			<table  align="center" cellpadding="0" cellspacing="0" class="tabtitle" style="width:100%;border-top:1px #bbb solid;	border-left:1px #bbb solid;	border-right:1px #bbb solid;">
				<tr>
					<td style="text-align:center" >
						您有${xzfyList1.size()}件行政复议申请待立案审查
					</td>
				</tr>
			</table>
			<table class="tabout" style="width:100%" >
				<tr>
				 	<th class="thListNormal" width="40">序号</th>
					<th class="thListNormal" width="80">
						收案日期
					</th>
					<th class="thListNormal" >
						申请人
					</th>		
					<th class="thListNormal" style="width:50px">
						立案
					</th>
			    </tr>
			</table>		    
			<div class="scrollDiv" id="case_1">
				<ul>
				<#assign count=1>
				<#list xzfyList1 as data>
				<li>
					<table align="center" cellpadding="3"  class="tabout" style="width:100%;border-top:0px;">
				   	<#if count%2==1>
				   	<tr class="trcolor" style="background-color:#ffffff;">
					<#else>
					<tr class="trcolor" style="background-color:#f5f0e9;">
					</#if>	   	
						<td class="tdlistCenter" width="40">
						${count}
					   	</td>
					   	<td class="tdlistCenter" width="80">
						${data.receive_date?default("")}
					   	</td>
					   	<td class="tdlistCenter">
						${data.appdetail?default("")}
					   	</td>
						<td class="tdlistCenter" style="width:50px">
							<input type="button" name="addBut" value="立案"  onClick="caseDeal(1)" style="padding:0px 1px;"/>
						</td>					
					</tr>
					</table>
				<#assign count=count+1>
				</#list>
				</ul>
			</div>
		<!--滚动控制--> 
		<table  align="center" class="tabMainBot" style="width:100%">
		  <tr >
		    <td >
		        <a id="case1_btnup" class="leftArr" href ="javascript:;"/><a id="case1_btndown" class="rightArr" href ="javascript:;"/>
		     </td>
		  </tr>
		</table>
		</div>
		<!--待立案审查 end-->
		
		<div  class="blank10_vertical" ></div>
		
		<!--案件待审理-->
		<div class="case_lianshenpi" style="width:30%;float:left;">
		<table border="0"  align="center" cellpadding="0" cellspacing="0" class="tabtitle" style="width:100%;border-top:1px #bbb solid;	border-left:1px #bbb solid;	border-right:1px #bbb solid;">
			<tr>
				<td style="text-align:center" >
					您有 15 件行政复议案件待审理
				</td>
			</tr>
		</table>		
		<table border="0" align="center" cellpadding="0" cellspacing="0" class="tabout" style="width:100%" >
			<tr>
			 	<th class="thListNormal" width="40">序号</th>
				<th class="thListNormal" width="80">
					收案日期
				</th>
				<th class="thListNormal" >
					申请人
				</th>		
				<th class="thListNormal" style="width:90px">
					案件办理
				</th>
		    </tr>
		    </table>
			<div class="scrollDiv" id="case_2">
				<ul>
				<#assign count=1>
				<#list 1..5 as record>
				<li>
					<table align="center" cellpadding="3"  class="tabout" style="width:100%;border-top:0px;">
				   	<#if count%2==1>
				   	<tr class="trcolor" style="background-color:#ffffff;">
					<#else>
					<tr class="trcolor" style="background-color:#f5f0e9;">
					</#if>	   	
						<td class="tdlistCenter" width="40">
						${count}
					   	</td>
					   	<td class="tdlistCenter" width="80">
						2013-01-01
					   	</td>
					   	<td class="tdlistCenter">
						丁国玉
					   	</td>
						<td class="tdlistCenter" style="width:90px">
							<input type="button" name="addBut" value="案件办理"  onClick="caseDeal(2)" style="padding:0px 1px;"/>
						</td>					
					</tr>
					</table>
				<#assign count=count+1>
				</#list>
				</ul>
			</div>
		<!--滚动控制--> 
		<table  align="center" class="tabMainBot" style="width:100%">
		  <tr >
		    <td >
		        <a id="case2_btnup" class="leftArr" href ="javascript:;"/><a id="case2_btndown" class="rightArr" href ="javascript:;"/>
		     </td>
		  </tr>
		</table>
		</div>
		<!--案件待审理 end-->
		
		<div  class="blank10_vertical" ></div>
				
		<!--案件待审批-->
		<div class="case_banli" style="width:30%;float:right;">
		<table border="0"  align="center" cellpadding="0" cellspacing="0" class="tabtitle" style="width:100%;border-top:1px #bbb solid;	border-left:1px #bbb solid;	border-right:1px #bbb solid;">
			<tr>
				<td style="text-align:center" >
					您有 15 件行政复议案件待审批
				</td>
			</tr>
		</table>		
		<table border="0" align="center" cellpadding="0" cellspacing="0" class="tabout" style="width:100%" >
			<tr>
			 	<th class="thListNormal" width="40">序号</th>
				<th class="thListNormal" width="80">
					收案日期
				</th>
				<th class="thListNormal" >
					申请人
				</th>		
				<th class="thListNormal" style="width:90px">
					审批
				</th>
		    </tr>
		    </table>
			<div class="scrollDiv" id="case_3">
				<ul>
				<#assign count=1>
				<#list 1..5 as record>
				<li>
					<table align="center" cellpadding="3"  class="tabout" style="width:100%;border-top:0px;">
				   	<#if count%2==1>
				   	<tr class="trcolor" style="background-color:#ffffff;">
					<#else>
					<tr class="trcolor" style="background-color:#f5f0e9;">
					</#if>	   	
						<td class="tdlistCenter" width="40">
						${count}
					   	</td>
					   	<td class="tdlistCenter" width="80">
						2013-01-01
					   	</td>
					   	<td class="tdlistCenter">
						丁国玉
					   	</td>
						<td class="tdlistCenter" style="width:90px">
							<input type="button" name="addBut" value="立案审批"  onClick="caseDeal(3)" style="padding:0px 1px;"/>
						</td>					
					</tr>
					</table>
				<#assign count=count+1>
				</#list>
				</ul>
			</div>
		<!--滚动控制--> 
		<table  align="center" class="tabMainBot" style="width:100%">
		  <tr >
		    <td >
		        <a id="case3_btnup" class="leftArr" href ="javascript:;"/><a id="case3_btndown" class="rightArr" href ="javascript:;"/>
		     </td>
		  </tr>
		</table>
		</div>
		<!--案件待审批 end-->		

	</div>
</div>

<!-- 案件滚动控制 -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#s3").Scroll({line:8,speed:500,timer:12000,up:"btn1",down:"btn2"});
	});
	$(document).ready(function(){
		$("#case_1").Scroll({line:5,speed:500,timer:12000,up:"case1_btnup",down:"case1_btndown"});
	});
	$(document).ready(function(){
		$("#case_2").Scroll({line:5,speed:500,timer:12000,up:"case2_btnup",down:"case2_btndown"});
	});
	$(document).ready(function(){
		$("#case_3").Scroll({line:5,speed:500,timer:12000,up:"case3_btnup",down:"case3_btndown"});
	});
</script>


<script>
//接待首页跳转
function reception(){
	window.location.href="receptionIndex.action?funcCode=${funcCode}";
}

//查看全部案件
function xzfyAll(){
	window.open('xzfyAllIndex.action?funcCode=${funcCode}','creatSub','status=yes,scrollbars=yes,resizable=yes,width=1280,height=768')
}

//案件办理
function caseDeal(stage,id){
	if(stage==1){
		window.location.href="../xzfy/editXzfy.action?funcCode=${funcCode}&xzfyId=" + id;
	}
}

</script>
	</form>
</body>
</html>
