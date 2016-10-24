<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<!--
		<link rel="stylesheet" type="text/css" href="../css/style_anju.css">
		-->
		<link rel="stylesheet" type="text/css" href="../pages/xzfy/css/style_anju1.css">
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
<style>
.btn{border:none;cursor:pointer;border-radius:3px}
.btn-blue{display:block; width:107px; height:27px;background: url(../images/sideNavBg.gif);line-height:27px; text-align:center; border:#eeeded solid 1px; margin-left:36px;margin-top:10px;float:left;}
.btn-blue:link,.btn-blue:visited{color:#000;}
</style>
	</head>
	<body>
	
	<form id="Form1" name="Form1"action="" method="post" target="_parent">
	<input type="hidden" name="funcCode" value="${funcCode}">
	<input type="hidden" name="xzssInfo.id" value="${tempid}" />
	<!--
	<input type="hidden" name="xzssInfo.case_numNum" value="${case_numNum}" />
	-->
	<input type="hidden" name="xzssInfo.case_numType" id="case_numType" value="${case_numType}" />
	<input type="hidden" name="xzssInfo.case_numYear" id="case_numYear" value="${case_numYear}" />
	<input type="hidden" name="xzssInfo.shen_level" value="${shenji}"/>
	<input type="hidden" name="xzssInfo.beigao" value="<#if xzssInfo.beigao?has_content>${xzssInfo.beigao}<#else>${beigao}</#if>"/>
	<input type="hidden" id="userOrg" value="${userOrg}"/>
	<#if shenhe1=="1">
    <input type="hidden" name="xzssInfo.shen1" value="1"/>
    <input type="hidden" name="xzssInfo.shen1_id" value="<#if xzssInfo.id?has_content>${xzssInfo.id}</#if>"/>
    <input type="hidden" name="xzssInfo.shen2" value="0"/>
    <input type="hidden" name="xzssInfo.shen2_id" value=""/>
    <input type="hidden" name="xzssInfo.isFuyi" value="<#if xzssInfo.isFuyi?has_content>${xzssInfo.isFuyi}<#else> 0</#if>"/>
	<input type="hidden" name="xzssInfo.fuyiCaseNum" value="<#if xzssInfo.fuyiCaseNum?has_content>${xzssInfo.fuyiCaseNum}</#if>"/>
    <input type="hidden" name="xzssInfo.fuyi_id" value="<#if xzssInfo.fuyi_id?has_content>${xzssInfo.fuyi_id}</#if>"/>
    </#if>
	<#if shenhe2=="1">
    <input type="hidden" name="xzssInfo.shen1" value="<#if xzssInfo.shen1?has_content>${xzssInfo.shen1}</#if>"/>
    <input type="hidden" name="xzssInfo.shen1_id" value="<#if xzssInfo.shen1_id?has_content>${xzssInfo.shen1_id}</#if>"/>
    <input type="hidden" name="xzssInfo.shen2" value="1"/>
    <input type="hidden" name="xzssInfo.shen2_id" value="<#if xzssInfo.id?has_content>${xzssInfo.id}</#if>"/>
    <input type="hidden" name="xzssInfo.isFuyi" value="<#if xzssInfo.isFuyi?has_content>${xzssInfo.isFuyi}<#else>0</#if>"/>
	<input type="hidden" name="xzssInfo.fuyiCaseNum" value="<#if xzssInfo.fuyiCaseNum?has_content>${xzssInfo.fuyiCaseNum}</#if>"/>
    <input type="hidden" name="xzssInfo.fuyi_id" value="<#if xzssInfo.fuyi_id?has_content>${xzssInfo.fuyi_id}</#if>"/>
    </#if>
    <#if (shenhe1==""&&shenhe2=="")||(shenhe1=="0"&&shenhe2=="")||(shenhe1=="0"&&shenhe2=="0")>
    <input type="hidden" name="xzssInfo.shen1" value="0"/>
    <input type="hidden" name="xzssInfo.shen1_id" value=""/>
    <input type="hidden" name="xzssInfo.shen2" value="0"/>
    <input type="hidden" name="xzssInfo.shen2_id" value=""/>
    <input type="hidden" name="xzssInfo.isFuyi" value="<#if fuyi?has_content>${fuyi} <#elseif xzssInfo.isFuyi?has_content>${xzssInfo.isFuyi}<#else> 0</#if>"/>
	<input type="hidden" name="xzssInfo.fuyiCaseNum" value="<#if xzfyInfo.tjzfzh?has_content>${xzfyInfo.tjzfzh}</#if>"/>
    <input type="hidden" name="xzssInfo.fuyi_id" value="<#if xzfyInfo.id?has_content>${xzfyInfo.id}</#if>"/>
    </#if>
    
    <div class="z_wrap_info ">
	<h2 class="z_title" style="padding:30px 10px 0">
	<strong>北京市人民政府行政应诉案件<br><#if shenji=="1">一<#elseif shenji=="2">二<#elseif shenji=="3">再</#if>审批办单</strong>
	</h2>
	<div class="z_info">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
	<tr>
		<th>案号</th>
		<td colspan=3>${case_numType}〔${case_numYear}〕
	      <select name="xzssInfo.case_numNum" id="case_numNum" onchange="chachongCaseNum(this.id)" class="select-page" style="width:50px">
			   <#list casenumNumList as numList>
			   <option value="${numList}" <#if numList==case_numNum>selected</#if>>${numList}</option>
		   </#list>
		   </select>
		号&nbsp;&nbsp;&nbsp;<span class='valid' style='color:red' id="yicunzai"></span></td>
	</tr>
	<tr>
		<th>应诉通知书</th>
		<td colspan=3>
		<textarea type="text" id="ystz" name="xzssInfo.ystz"  class="inputTextNormal" style="width:96%;font-size:14px;font-family:仿宋" ><#if xzssInfo.ystz?has_content>${xzssInfo.ystz}</#if></textarea>
		</td>
	</tr>
	<tr>
		<th>受理法院</th>
		<td colspan=3>
		<select name="xzssInfo.court" class="select-page" id="fayuan" onchange="setCourt()"  style="width:200px;margin:0px">
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
		<td colspan=3>
		<input type="radio" name="xzssInfo.app_type" value="1" onclick="setapptype('1');" <#if xzfyInfo.app_type?default('')=="1">checked</#if> <#if xzssInfo.app_type?default('')=="1">checked</#if>/>公民&nbsp;&nbsp;
		<input type="radio" name="xzssInfo.app_type" value="2" onclick="setapptype('2');" <#if xzfyInfo.app_type?default('')=="2">checked</#if> <#if xzssInfo.app_type?default('')=="2">checked</#if>/>法人、其他组织
		<br/><br/>
		<textarea type="text" name="xzssInfo.app_name" id="app_name"  class="inputTextNormal" style="width:96%;font-size:14px;font-family:仿宋 ;text-align:left" ><#if xzssInfo.app_name?has_content>${xzssInfo.app_name}</#if><#if xzfyappName?has_content>${xzfyappName}</#if></textarea>
		</td>
	</tr>
	<tr>
		<th>被告</th>
		<td colspan=3><textarea type="text" name="xzssInfo.defendant" id="defendant"  class="inputTextNormal" style="width:96%;font-size:14px;font-family:仿宋" ><#if xzssInfo.defendant?has_content>${xzssInfo.defendant}</#if><#if xzfyInfo.defendant_name?has_content>${xzfyInfo.defendant_name}</#if></textarea></td>
	</tr>
	<tr>
		<th>案由</th>
		<td colspan=3><textarea  type="text" name="xzssInfo.case_cause" id="case_cause" cols="" rows="4" style="width:96%;font-size:14px;font-family:仿宋" value=""  ><#if xzssInfo.case_cause?has_content>${xzssInfo.case_cause}</#if></textarea></td>
	</tr>
	<tr>
		<th>行政赔偿</th>
		<td colspan=3>
		<input type="radio" name="xzssInfo.ismoney" value="1" <#if xzssInfo.ismoney?has_content&&xzssInfo.ismoney=="1">checked</#if> />提起行政赔偿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="xzssInfo.ismoney" value="0" <#if xzssInfo.ismoney?has_content&&(xzssInfo.ismoney=="0"||xzssInfo.ismoney=="")>checked</#if>  />   未提起行政赔偿
		</td>
	</tr>
	<tr>
		<th>应诉通知书<br><br>签收日期</th>
		<td colspan=3>
		<input name="xzssInfo.notice_receiptDate" class="input2"  id="receiptdate" <#if xzssInfo.notice_receiptDate?has_content>value="${xzssInfo.notice_receiptDate}"</#if> readonly  type="text" onClick="getTime();"  >
		</td>
	</tr>
	<tr>
		<th>书面答辩提交<br><br>截止日期</th>
		<td colspan=3>
		<input name="xzssInfo.dabian_endDate" class="input2" <#if xzssInfo.dabian_endDate?has_content>value="${xzssInfo.dabian_endDate}"</#if>  id="endDate"  readonly type="text" onClick="WdatePicker();"  >
		</td>
	</tr>
	<tr>
		<th>案件登记部门<br><br>意见</th>
		<#if userOrg=="0000">
		<td colspan=3>建议批请应诉工作小组
		<select name="xzssInfo.djbmyj" class="select-page" id="djbmyj1" onchange="" style="width:90px">
		<option value="0">----请选择----</option>
		<option value="1"  <#if xzssInfo.djbmyj?default('0')=="1">selected</#if>>伊宏伟</option>
				<option value="2"  <#if xzssInfo.djbmyj?default('0')=="2">selected</#if>>谢波</option>
				<option value="3"  <#if xzssInfo.djbmyj?default('0')=="3">selected</#if>>史静</option>
				<option value="4"  <#if xzssInfo.djbmyj?default('0')=="4">selected</#if>>张童</option>
		</select>
		办理
		<#else>
		<td colspan=3>建议批请<input type="text" style="height:20px;font-size:14px;font-family:仿宋" name="xzssInfo.djbmyj" id="djbmyj" value="<#if xzssInfo.djbmyj?has_content>${xzssInfo.djbmyj}</#if>" class="inputTextNormal"  />办理
		</#if>
		<br/><br/><br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<th>主管领导<br><br>批示</th>
		<td colspan=3>
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
		<td colspan=3>
		<input type="text" style="height:20px;font-size:14px;font-family:仿宋" id="ysundertaker_name" name="xzssInfo.ysundertaker_name" <#if xzssInfo.ysundertaker_name?has_content>value="${xzssInfo.ysundertaker_name}"</#if> class="inputTextNormal"  />
        </td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan=3>
		<input  type="text" name="xzssInfo.beizhu" style="width:400px;height:20px;font-size:14px;font-family:仿宋" value="<#if fuyi=='1'|| fuyi=='2'>此案经过行政复议。案号：<#if xzfyInfo.tjzfzh?has_content>${xzfyInfo.tjzfzh}</#if></#if><#if xzssInfo.beizhu?has_content>${xzssInfo.beizhu}</#if> " />
		</td>
	</tr>
	<tr>
	<th width="">行政类别</th>
	<td width="">
		<select name="xzssInfo.manage_type" class="select-page" id="manage_type" onchange="" style="width:150px">
		<option value="0">----请选择----</option>
		<option value="1" <#if xzfyInfo.manage_type?default('0')=="1">selected</#if> <#if xzssInfo.manage_type?default('0')=="1">selected</#if>>公安</option>
		<option value="2" <#if xzfyInfo.manage_type?default('0')=="2">selected</#if> <#if xzssInfo.manage_type?default('0')=="2">selected</#if>>国家安全</option>
		<option value="3" <#if xzfyInfo.manage_type?default('0')=="3">selected</#if> <#if xzssInfo.manage_type?default('0')=="3">selected</#if>>劳动和社会保障</option>
		<option value="4" <#if xzfyInfo.manage_type?default('0')=="4">selected</#if> <#if xzssInfo.manage_type?default('0')=="4">selected</#if>>司法行政</option>
		<option value="5" <#if xzfyInfo.manage_type?default('0')=="5">selected</#if> <#if xzssInfo.manage_type?default('0')=="5">selected</#if>>民政</option>
		<option value="6" <#if xzfyInfo.manage_type?default('0')=="6">selected</#if> <#if xzssInfo.manage_type?default('0')=="6">selected</#if>>土地</option>
		<option value="7" <#if xzfyInfo.manage_type?default('0')=="7">selected</#if> <#if xzssInfo.manage_type?default('0')=="7">selected</#if>>地矿</option>
		<option value="8" <#if xzfyInfo.manage_type?default('0')=="8">selected</#if> <#if xzssInfo.manage_type?default('0')=="8">selected</#if>>环保</option>
		<option value="9" <#if xzfyInfo.manage_type?default('0')=="9">selected</#if> <#if xzssInfo.manage_type?default('0')=="9">selected</#if>>农业</option>
		<option value="10" <#if xzfyInfo.manage_type?default('0')=="10">selected</#if> <#if xzssInfo.manage_type?default('0')=="10">selected</#if>>水利</option>
		<option value="11" <#if xzfyInfo.manage_type?default('0')=="11">selected</#if> <#if xzssInfo.manage_type?default('0')=="11">selected</#if>>林业</option>
		<option value="12" <#if xzfyInfo.manage_type?default('0')=="12">selected</#if> <#if xzssInfo.manage_type?default('0')=="12">selected</#if>>城市规划</option>
		<option value="13" <#if xzfyInfo.manage_type?default('0')=="13">selected</#if> <#if xzssInfo.manage_type?default('0')=="13">selected</#if>>房屋拆迁</option>
		<option value="14" <#if xzfyInfo.manage_type?default('0')=="14">selected</#if> <#if xzssInfo.manage_type?default('0')=="14">selected</#if>>房屋登记</option>
		<option value="15" <#if xzfyInfo.manage_type?default('0')=="15">selected</#if> <#if xzssInfo.manage_type?default('0')=="15">selected</#if>>工商</option>
		<option value="16" <#if xzfyInfo.manage_type?default('0')=="16">selected</#if> <#if xzssInfo.manage_type?default('0')=="16">selected</#if>>质监</option>
		<option value="17" <#if xzfyInfo.manage_type?default('0')=="17">selected</#if> <#if xzssInfo.manage_type?default('0')=="17">selected</#if>>商务</option>
		<option value="18" <#if xzfyInfo.manage_type?default('0')=="18">selected</#if> <#if xzssInfo.manage_type?default('0')=="18">selected</#if>>物价</option>
		<option value="19" <#if xzfyInfo.manage_type?default('0')=="19">selected</#if> <#if xzssInfo.manage_type?default('0')=="19">selected</#if>>能源</option>
		<option value="20" <#if xzfyInfo.manage_type?default('0')=="20">selected</#if> <#if xzssInfo.manage_type?default('0')=="20">selected</#if>>交通</option>
		<option value="21" <#if xzfyInfo.manage_type?default('0')=="21">selected</#if> <#if xzssInfo.manage_type?default('0')=="21">selected</#if>>信息产业</option>
		<option value="22" <#if xzfyInfo.manage_type?default('0')=="22">selected</#if> <#if xzssInfo.manage_type?default('0')=="22">selected</#if>>邮政</option>
		<option value="23" <#if xzfyInfo.manage_type?default('0')=="23">selected</#if> <#if xzssInfo.manage_type?default('0')=="23">selected</#if>>烟草专卖</option>
		<option value="24" <#if xzfyInfo.manage_type?default('0')=="24">selected</#if> <#if xzssInfo.manage_type?default('0')=="24">selected</#if>>税务</option>
		<option value="25" <#if xzfyInfo.manage_type?default('0')=="25">selected</#if> <#if xzssInfo.manage_type?default('0')=="25">selected</#if>>人民银行</option>
		<option value="26" <#if xzfyInfo.manage_type?default('0')=="26">selected</#if> <#if xzssInfo.manage_type?default('0')=="26">selected</#if>>证监</option>
		<option value="27" <#if xzfyInfo.manage_type?default('0')=="27">selected</#if> <#if xzssInfo.manage_type?default('0')=="27">selected</#if>>保监</option>
		<option value="28" <#if xzfyInfo.manage_type?default('0')=="28">selected</#if> <#if xzssInfo.manage_type?default('0')=="28">selected</#if>>银监</option>
		<option value="29" <#if xzfyInfo.manage_type?default('0')=="29">selected</#if> <#if xzssInfo.manage_type?default('0')=="29">selected</#if>>外汇</option>
		<option value="30" <#if xzfyInfo.manage_type?default('0')=="30">selected</#if> <#if xzssInfo.manage_type?default('0')=="30">selected</#if>>财政</option>
		<option value="31" <#if xzfyInfo.manage_type?default('0')=="31">selected</#if> <#if xzssInfo.manage_type?default('0')=="31">selected</#if>>统计</option>
		<option value="32" <#if xzfyInfo.manage_type?default('0')=="32">selected</#if> <#if xzssInfo.manage_type?default('0')=="32">selected</#if>>审计</option>
		<option value="33" <#if xzfyInfo.manage_type?default('0')=="33">selected</#if> <#if xzssInfo.manage_type?default('0')=="33">selected</#if>>海关</option>
		<option value="34" <#if xzfyInfo.manage_type?default('0')=="34">selected</#if> <#if xzssInfo.manage_type?default('0')=="34">selected</#if>>商检</option>
		<option value="35" <#if xzfyInfo.manage_type?default('0')=="35">selected</#if> <#if xzssInfo.manage_type?default('0')=="35">selected</#if>>药监</option>
		<option value="36" <#if xzfyInfo.manage_type?default('0')=="36">selected</#if> <#if xzssInfo.manage_type?default('0')=="36">selected</#if>>卫生</option>
		<option value="37" <#if xzfyInfo.manage_type?default('0')=="37">selected</#if> <#if xzssInfo.manage_type?default('0')=="37">selected</#if>>计划生育</option>
		<option value="38" <#if xzfyInfo.manage_type?default('0')=="38">selected</#if> <#if xzssInfo.manage_type?default('0')=="38">selected</#if>>教育</option>
		<option value="39" <#if xzfyInfo.manage_type?default('0')=="39">selected</#if> <#if xzssInfo.manage_type?default('0')=="39">selected</#if>>文化</option>
		<option value="40" <#if xzfyInfo.manage_type?default('0')=="40">selected</#if> <#if xzssInfo.manage_type?default('0')=="40">selected</#if>>专利</option>
		<option value="41" <#if xzfyInfo.manage_type?default('0')=="41">selected</#if> <#if xzssInfo.manage_type?default('0')=="41">selected</#if>>商标</option>
		<option value="42" <#if xzfyInfo.manage_type?default('0')=="42">selected</#if> <#if xzssInfo.manage_type?default('0')=="42">selected</#if>>版权</option>	
		<option value="43" <#if xzfyInfo.manage_type?default('0')=="43">selected</#if> <#if xzssInfo.manage_type?default('0')=="43">selected</#if>>旅游</option>	
		<option value="44" <#if xzfyInfo.manage_type?default('0')=="44">selected</#if> <#if xzssInfo.manage_type?default('0')=="44">selected</#if>>其他</option>
    </select>
	</td>
	<th width="">案件类别</th>
	<td width="">
	<select name="xzssInfo.case_type" class="select-page" id="case_type" onchange="" style="width:150px">
	<option value="0">----请选择----</option>
	<option value="1" <#if xzfyInfo.casetype?default('0')=="1">selected</#if> <#if xzssInfo.case_type?default('0')=="1">selected</#if>>行政处罚</option>
	<option value="2" <#if xzfyInfo.casetype?default('0')=="2">selected</#if> <#if xzssInfo.case_type?default('0')=="2">selected</#if>>行政强制措施</option>
	<option value="3" <#if xzfyInfo.casetype?default('0')=="3">selected</#if> <#if xzssInfo.case_type?default('0')=="3">selected</#if>>行政征收</option>
	<option value="4" <#if xzfyInfo.casetype?default('0')=="4">selected</#if> <#if xzssInfo.case_type?default('0')=="4">selected</#if>>行政许可</option>
	<option value="5" <#if xzfyInfo.casetype?default('0')=="5">selected</#if> <#if xzssInfo.case_type?default('0')=="5">selected</#if>>行政确权</option>
	<option value="6" <#if xzfyInfo.casetype?default('0')=="6">selected</#if> <#if xzssInfo.case_type?default('0')=="6">selected</#if>>干预经营自主权</option>
	<option value="7" <#if xzfyInfo.casetype?default('0')=="7">selected</#if> <#if xzssInfo.case_type?default('0')=="7">selected</#if>>信息公开</option>
	<option value="8" <#if xzfyInfo.casetype?default('0')=="8">selected</#if> <#if xzssInfo.case_type?default('0')=="8">selected</#if>>行政不作为</option>
	<option value="9" <#if xzfyInfo.casetype?default('0')=="9">selected</#if> <#if xzssInfo.case_type?default('0')=="9">selected</#if>>其他</option>
	</select>
	</td>
	</tr>
	</table>
	<br>
	<div align="right" class="btnDiv" style="padding-left:300px">
        <input type="button" name="button" class="btn-blue btn" value="保存" onclick="savexzss()" />
    </div>
    <br>
    </div>
	</div>
	</form>
	<script>
	function setCourt(){
    var court=document.getElementById("fayuan");
    var courtText=court.options[court.selectedIndex].text
    if($("#fayuan").val()=="0"){
    parent.document.getElementById("shenlifayuan1").innerHTML="";
    }else{
	parent.document.getElementById("shenlifayuan1").innerHTML=courtText;
	}
	}
	
	</script>
	</body>
</html>
<script>
var buttoncheck1=true;
function chachongCaseNum(id){
		var type="${case_numType}";
		var year="${case_numYear}";
		var num=document.getElementById(id);
    	var casenum=num.options[num.selectedIndex].text;
    	$.ajax({
    		type : 'POST',
			url : '../xzss/chachongCaseNum.action',
			data : {
				caseNumType:type,
				caseNumYear:year,
				caseNumNO:casenum,
				funcCode:${funcCode}
			},
			//dataType : 'json',
			
			success: function(data, status){
				if(data=="true"){
					buttoncheck1=true;
					document.getElementById("yicunzai").innerHTML="";
				}
				if(data=="false"){
					buttoncheck1=false;
					document.getElementById("yicunzai").innerHTML="";
					document.getElementById("yicunzai").innerHTML="该案件号已存在";
				}
			}
		});
	}
function savexzss(){
   // var user=document.getElementById("userOrg");
   if(buttoncheck1==false){
   		alert("案件号已存在");
   		return false;
   }
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
		alert("请填写原告");
		return false;
	}
	if($.trim($("#defendant").val())==""){
		alert("请填写被告");
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
if(confirm("确认提交？")){
	document.Form1.action="../xzss/savexzss.action";
	document.Form1.submit();
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
	//alert(endDateStr);
	if(endDateStr!="NaN-NaN-NaN"){	
	document.getElementById("endDate").value=endDateStr;
	}else{
	document.getElementById("endDate").value="";
	}
}

$(document).ready(function(){
<#if xzssInfo.court?has_content>
var court=document.getElementById("fayuan");
var courtText=court.options[court.selectedIndex].text
parent.document.getElementById("shenlifayuan1").innerHTML=courtText;
<#else>
parent.document.getElementById("shenlifayuan1").innerHTML="";
</#if>
$("#ysundertaker_name").blur(function(){
    if($.trim($(this).val())=="")
   		parent.document.getElementById("yscbr1").innerHTML="无";
    else
		parent.document.getElementById("yscbr1").innerHTML=$(this).val();
});

});

</script>

