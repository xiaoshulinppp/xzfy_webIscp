<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="../pages/xzfy/css/style_anju1.css">
<script type="text/javascript" src="../pages/xzfy/js/html5.js"></script>
<script type="text/javascript" src="../pages/xzfy/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../pages/xzfy/js/treeJs.js"></script>
<title></title>

<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../pages/xzfy/css/ie-css3.htc);} </style> 
<style>
.btn{border:none;cursor:pointer;border-radius:3px}
.btn-blue{display:block; width:107px; height:27px;<!--background: url(../images/sideNavBg.gif);-->line-height:27px; text-align:center; border:#eeeded solid 1px; margin-left:36px;margin-top:10px;float:left;}
.btn-blue:link,.btn-blue:visited{color:#000;}
</style>
</head>
<body>

<form name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
	<input type="hidden" name="funcCode" value="${funcCode}">
	<input type="hidden" name="xzssInfo.id" value="${xzssInfo.id}">
	<input type="hidden" name="xzssId" value="${xzssInfo.id}">
	<input type="hidden" name="xzssInfo.shen_level" value="<#if xzssInfo.shen_level?has_content>${xzssInfo.shen_level}</#if>">
	<input type="hidden" name="xzssInfo.case_num" value="<#if xzssInfo.case_num?has_content>${xzssInfo.case_num}</#if>">
	<input type="hidden" name="xzssInfo.case_numType" value="<#if xzssInfo.case_numType?has_content>${xzssInfo.case_numType}</#if>">
	<input type="hidden" name="xzssInfo.case_numNum" value="<#if xzssInfo.case_numNum?has_content>${xzssInfo.case_numNum}</#if>">
	<input type="hidden" name="xzssInfo.case_numYear" value="<#if xzssInfo.case_numYear?has_content>${xzssInfo.case_numYear}</#if>">
	<input type="hidden" name="xzssInfo.case_org" value="<#if xzssInfo.case_org?has_content>${xzssInfo.case_org}</#if>">
	<input type="hidden" name="xzssInfo.isFuyi" value="<#if xzssInfo.isFuyi?has_content>${xzssInfo.isFuyi}</#if>">
	<input type="hidden" name="xzssInfo.fuyiCaseNum" value="<#if xzssInfo.fuyiCaseNum?has_content>${xzssInfo.fuyiCaseNum}</#if>">
	<input type="hidden" name="xzssInfo.shen2" value="<#if xzssInfo.shen2?has_content>${xzssInfo.shen2}</#if>">
	<input type="hidden" name="xzssInfo.shen1" value="<#if xzssInfo.shen1?has_content>${xzssInfo.shen1}</#if>">
	<input type="hidden" name="xzssInfo.shen1_id" value="<#if xzssInfo.shen1_id?has_content>${xzssInfo.shen1_id}</#if>">
	<input type="hidden" name="xzssInfo.shen2_id" value="<#if xzssInfo.shen2_id?has_content>${xzssInfo.shen2_id}</#if>">
	<input type="hidden" name="xzssInfo.fuyi_id" value="<#if xzssInfo.fuyi_id?has_content>${xzssInfo.fuyi_id}</#if>">
	<input type="hidden" name="xzssInfo.status" value="<#if xzssInfo.status?has_content>${xzssInfo.status}</#if>">
	<input type="hidden" name="xzssInfo.jieanType" value="<#if xzssInfo.jieanType?has_content>${xzssInfo.jieanType}</#if>">
	<input type="hidden" name="xzssInfo.panjue" value="<#if xzssInfo.panjue?has_content>${xzssInfo.panjue}</#if>">
	<input type="hidden" name="xzssInfo.caiding" value="<#if xzssInfo.caiding?has_content>${xzssInfo.caiding}</#if>">
	<input type="hidden" name="xzssInfo.issifajianyi" value="<#if xzssInfo.issifajianyi?has_content>${xzssInfo.issifajianyi}</#if>">
	<input type="hidden" name="xzssInfo.jieandate" value="<#if xzssInfo.jieandate?has_content>${xzssInfo.jieandate}</#if>">
	<input type="hidden" name="xzssInfo.tiaojie" value="<#if xzssInfo.tiaojie?has_content>${xzssInfo.tiaojie}</#if>">	
	<input type="hidden" name="xzssInfo.beigao" value="<#if xzssInfo.beigao?has_content>${xzssInfo.beigao}</#if>"/>
	<input type="hidden" name="userOrg" value="<#if userOrg?has_content>${userOrg}</#if>"/>
		<div class="z_wrap_info">
		<div class="z_info">
		<h2 class="z_title" style="padding:30px 10px 0">
		<strong>北京市人民政府行政应诉案件<br><#if xzssInfo.shen_level=="1">一<#elseif xzssInfo.shen_level=="2">二<#elseif xzssInfo.shen_level=="3">再</#if>审批办单</strong>
		</h2>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
			<tr>
				<th>案号</th>
				<td colspan=2 width=""><#if xzssInfo.case_num?has_content>${xzssInfo.case_num}</#if></td>
				<th>专报号</th>
				<td ><#if xzssInfo.zhuanbaohao?has_content>
				   <select name="xzssInfo.zhuanbaohao" id="zhuanbaohao" onchange="" class="select-page" style="width:50px">
				   <#list zhuanbaohaoList as list>
				   <option value="${list}" <#if list==xzssInfo.zhuanbaohao>selected</#if>>${list}</option>
				   </#list>
			   </select>
				</#if>
				</td>
			</tr>
			<tr>
				<th>应诉通知书</th>
				<td colspan=4>
				<textarea type="text" name="xzssInfo.ystz" id="ystz"  class="inputTextNormal" style="width:96%;font-size:14px;font-family:仿宋" ><#if xzssInfo.ystz?has_content>${xzssInfo.ystz}</#if></textarea>
				</td>
			</tr>
			<tr>
				<th>受理法院</th>
				<td colspan=4>
				<select name="xzssInfo.court" class="select-page" id="fayuan" onchange="setCourt()"  style="width:200px">
				<option value="0">----请选择----</option>
				<option value="1" <#if xzssInfo.court?default('0')=="1">selected</#if>>北京市高级人民法院</option>
		<option value="2" <#if xzssInfo.court?default('0')=="2">selected</#if>>北京市第一中级人民法院 </option>
		<option value="3" <#if xzssInfo.court?default('0')=="3">selected</#if>>北京市第二中级人民法院 </option>
		<option value="4" <#if xzssInfo.court?default('0')=="4">selected</#if>>北京市第三中级人民法院 </option>
		<option value="5" <#if xzssInfo.court?default('0')=="5">selected</#if>>北京市第四中级人民法院（铁中院）</option>
		<option value="6" <#if xzssInfo.court?default('0')=="6">selected</#if>>北京市东城区法院</option>
		<option value="7" <#if xzssInfo.court?default('0')=="7">selected</#if>>北京市西城区法院</option>
		<option value="8" <#if xzssInfo.court?default('0')=="8">selected</#if>>北京市朝阳区法院</option>
		<option value="9" <#if xzssInfo.court?default('0')=="9">selected</#if>>北京市海淀区法院</option>
		<option value="10" <#if xzssInfo.court?default('0')=="10">selected</#if>>北京市平谷区法院</option>
		<option value="11" <#if xzssInfo.court?default('0')=="11">selected</#if>>北京市石景山区法院</option>
		<option value="12" <#if xzssInfo.court?default('0')=="12">selected</#if>>北京市门头沟区法院</option>
		<option value="13" <#if xzssInfo.court?default('0')=="13">selected</#if>>北京市房山区法院 </option>
		<option value="14" <#if xzssInfo.court?default('0')=="14">selected</#if>>北京市大兴区法院 </option>
		<option value="15" <#if xzssInfo.court?default('0')=="15">selected</#if>>北京市通州区法院</option>
		<option value="16" <#if xzssInfo.court?default('0')=="16">selected</#if>>北京市昌平区法院</option>
		<option value="17" <#if xzssInfo.court?default('0')=="17">selected</#if>>北京市顺义区法院</option>
		<option value="18" <#if xzssInfo.court?default('0')=="18">selected</#if>>北京市怀柔区法院</option>
		<option value="19" <#if xzssInfo.court?default('0')=="19">selected</#if>>北京市平谷区法院</option>
		<option value="20" <#if xzssInfo.court?default('0')=="20">selected</#if>>北京市密云县法院</option>
		<option value="21" <#if xzssInfo.court?default('0')=="21">selected</#if>>北京市延庆县法院</option>
		<option value="22" <#if xzssInfo.court?default('0')=="22">selected</#if>>北京市铁路运输法院</option>
		</select>
				</td>
				<!--
				<td><textarea type="text" name="xzssInfo.court" class="inputTextNormal" style="width:96%;font-size:14px;font-family:仿宋"></textarea></td>
			     -->
			</tr>
			<tr>
				<th>原告</th>
				<td colspan=4>
				<input type="radio" name="xzssInfo.app_type" id="app_type1" value="1"   <#if xzssInfo.app_type?default('')=="1">checked</#if>/>公民&nbsp;&nbsp;
				<input type="radio" name="xzssInfo.app_type" id="app_type2" value="2"  <#if xzssInfo.app_type?default('')=="2">checked</#if>/>法人、其他组织
				<br/><br/>
				<textarea type="text" name="xzssInfo.app_name" rows="1" id="app_name"  class="inputTextNormal" style="width:96%;font-size:14px;font-family:仿宋 ;text-align:left" ><#if xzssInfo.app_name?has_content>${xzssInfo.app_name}</#if></textarea>
				</td>
			</tr>
			<tr>
				<th >被告</th>
				<td colspan=4><textarea type="text" name="xzssInfo.defendant" id="defendant" rows="1"  class="inputTextNormal" style="width:96%;font-size:14px;font-family:仿宋" ><#if xzssInfo.defendant?has_content>${xzssInfo.defendant}</#if></textarea></td>
			</tr>
			<tr>
				<th>案由</th>
				<td colspan=4><textarea  type="text" name="xzssInfo.case_cause" id="case_cause" cols="" rows="4" style="width:96%;font-size:14px;font-family:仿宋" value=""  ><#if xzssInfo.case_cause?has_content>${xzssInfo.case_cause}</#if></textarea></td>
			</tr>
			<tr>
				<th>行政赔偿</th>
				<td colspan=4>
				<input type="radio" name="xzssInfo.ismoney" value="1" <#if  xzssInfo.ismoney?has_content&&xzssInfo.ismoney=="1">checked</#if> />提起行政赔偿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="xzssInfo.ismoney" value="0" <#if xzssInfo.ismoney?has_content&&(xzssInfo.ismoney=="0"||xzssInfo.ismoney=="")>checked</#if> />   未提起行政赔偿
				</td>
			</tr>
			<tr>
				<th>应诉通知书<br><br>签收日期</th>
				<td colspan=4>
				<input name="xzssInfo.notice_receiptDate" class="input2"  id="receiptdate" <#if xzssInfo.notice_receiptDate?has_content>value="${xzssInfo.notice_receiptDate}"</#if>   type="text" onClick="getTime();"  />
				</td>
			</tr>
			<tr>
				<th>书面答辩提交<br><br>截止日期</th>
				<td colspan=4>
				<input name="xzssInfo.dabian_endDate"  class="input2" <#if xzssInfo.dabian_endDate?has_content>value="${xzssInfo.dabian_endDate}"</#if>  id="endDate"  readonly type="text"  >
				</td>
			</tr>
			<tr>
				<th>案件登记部门<br/><br/>意见</th>
				<#if userOrg=="0000">
				<td colspan=4>建议批请应诉工作小组
				<select name="xzssInfo.djbmyj" class="select-page" id="djbmyj1" onchange="" style="width:90px">
				<option value="0">----请选择----</option>
				<option value="1"  <#if xzssInfo.djbmyj?default('0')=="1">selected</#if>>伊宏伟</option>
				<option value="2"  <#if xzssInfo.djbmyj?default('0')=="2">selected</#if>>谢波</option>
				<option value="3"  <#if xzssInfo.djbmyj?default('0')=="3">selected</#if>>史静</option>
				<option value="4"  <#if xzssInfo.djbmyj?default('0')=="4">selected</#if>>张童</option>
				</select>
				办理
				<#else>
				<td colspan=4>建议批请<input type="text" style="height:20px;font-size:14px;font-family:仿宋" name="xzssInfo.djbmyj" id="djbmyj" value="<#if xzssInfo.djbmyj?has_content>${xzssInfo.djbmyj}</#if>" class="inputTextNormal"  />办理
				</#if>
				<br/><br/><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr style="height:100px">
				<th>主管领导<br><br/>批示</th>
				<td colspan=4>
		        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font >
				年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</font>
		        </td>
			</tr>
			<tr>
				<th>应诉承办人</th>
				<td colspan=4>
				<input type="text" style="height:20px;font-size:14px;font-family:仿宋" id="ysundertaker_name" name="xzssInfo.ysundertaker_name" value="<#if xzssInfo.ysundertaker_name?has_content>${xzssInfo.ysundertaker_name}</#if>" class="inputTextNormal"  />
		        </td>
			</tr>
			<tr>
				<th>备注</th>
				<td colspan=4>
				<input  type="text" name="xzssInfo.beizhu" style="width:400px;height:20px;font-size:14px;font-family:仿宋" value="<#if xzssInfo.beizhu?has_content>${xzssInfo.beizhu}</#if> " />
				</td>
			</tr>
			 <tr>
			<th width="">行政类别</th>
			<td width="" >
				<select name="xzssInfo.manage_type" class="select-page" id="manage_type" onchange="" style="width:150px">
				<option value="0">----请选择----</option>
				<option value="1"  <#if xzssInfo.manage_type?default('0')=="1">selected</#if>>公安</option>
				<option value="2"  <#if xzssInfo.manage_type?default('0')=="2">selected</#if>>国家安全</option>
				<option value="3"  <#if xzssInfo.manage_type?default('0')=="3">selected</#if>>劳动和社会保障</option>
				<option value="4"  <#if xzssInfo.manage_type?default('0')=="4">selected</#if>>司法行政</option>
				<option value="5"  <#if xzssInfo.manage_type?default('0')=="5">selected</#if>>民政</option>
				<option value="6"  <#if xzssInfo.manage_type?default('0')=="6">selected</#if>>土地</option>
				<option value="7"  <#if xzssInfo.manage_type?default('0')=="7">selected</#if>>地矿</option>
				<option value="8"  <#if xzssInfo.manage_type?default('0')=="8">selected</#if>>环保</option>
				<option value="9"  <#if xzssInfo.manage_type?default('0')=="9">selected</#if>>农业</option>
				<option value="10" <#if xzssInfo.manage_type?default('0')=="10">selected</#if>>水利</option>
				<option value="11"  <#if xzssInfo.manage_type?default('0')=="11">selected</#if>>林业</option>
				<option value="12"  <#if xzssInfo.manage_type?default('0')=="12">selected</#if>>城市规划</option>
				<option value="13"  <#if xzssInfo.manage_type?default('0')=="13">selected</#if>>房屋拆迁</option>
				<option value="14" <#if xzssInfo.manage_type?default('0')=="14">selected</#if>>房屋登记</option>
				<option value="15" <#if xzssInfo.manage_type?default('0')=="15">selected</#if>>工商</option>
				<option value="16" <#if xzssInfo.manage_type?default('0')=="16">selected</#if>>质监</option>
				<option value="17" <#if xzssInfo.manage_type?default('0')=="17">selected</#if>>商务</option>
				<option value="18" <#if xzssInfo.manage_type?default('0')=="18">selected</#if>>物价</option>
				<option value="19" <#if xzssInfo.manage_type?default('0')=="19">selected</#if>>能源</option>
				<option value="20" <#if xzssInfo.manage_type?default('0')=="20">selected</#if>>交通</option>
				<option value="21" <#if xzssInfo.manage_type?default('0')=="21">selected</#if>>信息产业</option>
				<option value="22" <#if xzssInfo.manage_type?default('0')=="22">selected</#if>>邮政</option>
				<option value="23" <#if xzssInfo.manage_type?default('0')=="23">selected</#if>>烟草专卖</option>
				<option value="24" <#if xzssInfo.manage_type?default('0')=="24">selected</#if>>税务</option>
				<option value="25" <#if xzssInfo.manage_type?default('0')=="25">selected</#if>>人民银行</option>
				<option value="26" <#if xzssInfo.manage_type?default('0')=="26">selected</#if>>证监</option>
				<option value="27" <#if xzssInfo.manage_type?default('0')=="27">selected</#if>>保监</option>
				<option value="28" <#if xzssInfo.manage_type?default('0')=="28">selected</#if>>银监</option>
				<option value="29" <#if xzssInfo.manage_type?default('0')=="29">selected</#if>>外汇</option>
				<option value="30" <#if xzssInfo.manage_type?default('0')=="30">selected</#if>>财政</option>
				<option value="31" <#if xzssInfo.manage_type?default('0')=="31">selected</#if>>统计</option>
				<option value="32" <#if xzssInfo.manage_type?default('0')=="32">selected</#if>>审计</option>
				<option value="33" <#if xzssInfo.manage_type?default('0')=="33">selected</#if>>海关</option>
				<option value="34" <#if xzssInfo.manage_type?default('0')=="34">selected</#if>>商检</option>
				<option value="35" <#if xzssInfo.manage_type?default('0')=="35">selected</#if>>药监</option>
				<option value="36" <#if xzssInfo.manage_type?default('0')=="36">selected</#if>>卫生</option>
				<option value="37" <#if xzssInfo.manage_type?default('0')=="37">selected</#if>>计划生育</option>
				<option value="38" <#if xzssInfo.manage_type?default('0')=="38">selected</#if>>教育</option>
				<option value="39" <#if xzssInfo.manage_type?default('0')=="39">selected</#if>>文化</option>
				<option value="40" <#if xzssInfo.manage_type?default('0')=="40">selected</#if>>专利</option>
				<option value="41" <#if xzssInfo.manage_type?default('0')=="41">selected</#if>>商标</option>
				<option value="42" <#if xzssInfo.manage_type?default('0')=="42">selected</#if>>版权</option>	
				<option value="43" <#if xzssInfo.manage_type?default('0')=="43">selected</#if>>旅游</option>	
				<option value="44" <#if xzssInfo.manage_type?default('0')=="44">selected</#if>>其他</option>
		    </select>
			</td>
			<th width="">案件类别</th>
			<td width=""  colspan=2>
			<select name="xzssInfo.case_type" class="select-page" id="case_type" onchange="" style="width:150px">
			<option value="0">----请选择----</option>
			<option value="1" <#if xzssInfo.case_type?default('0')=="1">selected</#if>>行政处罚</option>
			<option value="2" <#if xzssInfo.case_type?default('0')=="2">selected</#if>>行政强制措施</option>
			<option value="3" <#if xzssInfo.case_type?default('0')=="3">selected</#if>>行政征收</option>
			<option value="4" <#if xzssInfo.case_type?default('0')=="4">selected</#if>>行政许可</option>
			<option value="5" <#if xzssInfo.case_type?default('0')=="5">selected</#if>>行政确权</option>
			<option value="6" <#if xzssInfo.case_type?default('0')=="6">selected</#if>>干预经营自主权</option>
			<option value="7" <#if xzssInfo.case_type?default('0')=="7">selected</#if>>信息公开</option>
			<option value="8" <#if xzssInfo.case_type?default('0')=="8">selected</#if>>行政不作为</option>
			<option value="9" <#if xzssInfo.case_type?default('0')=="9">selected</#if>>其他</option>
			</select>
			</td>
			</tr>
			<tr >
				<td colspan=5 align="center"><br/>
				<input type="button"  style="border:1px solid;color:white;background:green;padding:3px;font-size:15px" value="保存" onClick="savexzss()">
				</td>
			 </tr>
			</table>
		</div>
		<br/>
	</div>
</form>
</body>
</html>
<script>
//alert("viewxzss="+${viewxzss})
function savexzss(){
	if($.trim($("#ystz").val())==""){
		alert("请填写应诉通知书内容");
		return false;
	}
	if($("#fayuan").val()=="0"){
		alert("请选择受理法院");
		return false;
	}
	if(!$("input[name='xzssInfo.app_type']:checked").val()){
	   alert("请选择原告类别");
		return false;
	}
	if($.trim($("#app_name").val())==""){
		alert("请填写原告姓名");
		return false;
	}
	if($.trim($("#defendant").val())==""){
		alert("请填写被告姓名");
		return false;
	}
	if($.trim($("#case_cause").val())==""){
		alert("请填写案由");
		return false;
	}
	if(!$("input[name='xzssInfo.ismoney']:checked").val()){
	   alert("请选择是否提起行政赔偿");
		return false;
	}
	if($.trim($("#receiptdate").val())==""){
		alert("请选择应诉通知书签收日期");
		return false;
	}
	if($.trim($("#endDate").val())==""){
		alert("请选择书面答辩提交截止日期");
		return false;
	}
	<#assign user=userOrg>
	<#if user=="0000">
	if($("#djbmyj1").val()=="0"){
		alert("请选择登记部门意见");
		return false;
	}
	<#else>
	if($.trim($("#djbmyj").val())==""){
		alert("请填写案件登记部门意见");
		return false;
	}
	</#if>
	
	if($("#manage_type").val()=="0"){
		alert("请选择行政类别");
		return false;
	}
	if($("#case_type").val()=="0"){
		alert("请选择案件类别");
		return false;
	}
	if(confirm("确认保存？")){
	document.form1.action="../xzss/doeditxzss.action";
	document.form1.submit();
	}
}
function getTime(){
	WdatePicker();
	var endDateStr=document.getElementById("receiptdate").value;
	endDateStr = endDateStr.replace(/-/g, '/'); 
	var date = new Date(endDateStr);
	date.setDate(date.getDate() + 15);
	var month=parseInt(date.getMonth()) + 1;
	var date1=parseInt(date.getDate());
	if(month<10){
		month='0'+month;
	}
	if(date<10){
		date1='0'+date;
	}
	endDateStr = date.getFullYear() + '-'+ month + '-'+ date1;
	document.getElementById("endDate").value=endDateStr;
}
function setCourt(){
    var court=document.getElementById("fayuan");
    var courtText=court.options[court.selectedIndex].text
    if($("#fayuan").val()=="0"){
    parent.document.getElementById("shenlifayuan").innerHTML="";
    }
    else{
	parent.document.getElementById("shenlifayuan").innerHTML=courtText;
	}
}
$(document).ready(function(){
$("#ysundertaker_name").blur(function(){
    if($.trim($(this).val())=="")
   		parent.document.getElementById("yscbr").innerHTML="无";
    else{
    //alert($(this).val())
		parent.document.getElementById("yscbr").innerHTML=$(this).val();
		}
});

});
</script>