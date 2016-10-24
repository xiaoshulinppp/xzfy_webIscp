<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>电子邮件申请行政复议</title>

<link href="../css/style_form.css" rel="stylesheet" type="text/css">

<SCRIPT src="../css/01/setday.js"></SCRIPT>
<script type="text/javascript" src="../js/16B/prototype.js"></script>
<script type="text/javascript" src="../js/16B/function.js"></script>
<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

<style>
.diva{
BORDER:#dcdcdc 1px solid;
height:22;
FILTER:progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr='#ddecfb',endColorStr='#ffffff');
PADDING-TOP: 3px; 
width:600px;
}
.divb{
BORDER: #dcdcdc 1px solid;
PADDING-TOP: 10px; 
PADDING-LEFT: 10px;
FONT-SIZE: 12px;
HEIGHT: 100px;
width:180;
border-top:0;
}
</style>


<!--javascript脚本添加位置。-->
<SCRIPT LANGUAGE="JavaScript">
<!--
function toggle(id) {
theObj = document.getElementById(id).style;
if ( theObj.display == "none" ) theObj.display = "block"; else theObj.display = "none";
}
//-->
</SCRIPT>

<!--javascript脚本添加位置结束。-->
</head>


<body>
<form action="../jds/xzfyInfoInsertSub.action" name="form1" id="form1" method="post" >

<!--标题表格开始-->
<div class="z_wrap_info">

   <h2 class="z_title">电子邮件接待案件信息</h2>
<div class="z_info">
<!--标题表格结束-->
<!--主体内容、列表显示区域-->
<#-- 
<input name="xzfyInfo.TAdd" type="hidden" id="Tadd" value="0"/ >
<input name="xzfyInfo.TId" type="hidden" class="inputTextNormal" title="请输入正确的姓名，格式在20个汉字以内" value="">
<input id="appstring" type=hidden name="appString">
 <input name="xzfyInfo.appType" type="hidden" value=2>
-->

<input id="xzfyId" name="xzfyInfo.id" value="${xzfyId}" type="hidden">
<input name="xzfyInfo.applicationsum" value=1 type='hidden'>
<input name="xzfyInfo.tAppDeptId" type="hidden" class="inputTextNormal" id="deptid" />
<input name="xzfyInfo.admit1" value="${admit_name}" type='hidden'>
<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="sta" id="sta" value="" />
<input id="conutAppname" type=hidden name="">
<input type="hidden" name="xzfyInfo.receive_type" value="3" />

 
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="z_info_table">
<#--
<tr  style="display:none">
    <td  width="25%">接待月：</td>
    <td  width="25%">
    <input name="xzfyInfo.count_month" id='countMonth' type="text" class="inputTextNormal" ischeck="y" value=${countMonth} onchange='countNum(this.id)' maxlength=5>
    </td>
    
    <td  width="25%">接待周次：</td>
    <td  width="25%">
    <input name="xzfyInfo.count_day" type="text" id='countDay' class="inputTextNormal" ischeck="y" value=${countDay} onchange='countNum(this.id)' maxlength=5>
<input name="xzfyInfo.count_year" type="hidden" class="inputTextNormal" ischeck="y" value=${countYear}>
    </td>
  </tr>
  -->
  <tr >
    <th  width="20%">来信人姓名：</th>
    <td  width="30%">
    <input name="xzfyInfo.laixin_name" type="text" class="inputTextNormal" 
    id="user" ischeck="y" altname="来信人姓名">
    
    <th  width="20%">接收日期：</th>
    <td  width="30%">
    <input name="xzfyInfo.receive_date" type="text"
     id="receivedate" class="inputTextNormal" ischeck="y"
      onClick="WdatePicker()" altname="接收日期" value="${todate}">
      </td>
  </tr>
  
  <tr class="trwhite">
    <th >来信人通信地址：</th>
	    <td >
	    <input name="xzfyInfo.laixin_address" type="text" id="dlr1" class="inputTextNormal" title="请输入正确的姓名，格式在50个汉字以内"></td>
	    </td>
    <th >来信人邮编：</th>
    <td ><input name="xzfyInfo.laixin_post" type="text" id="handlesecond" ischeck="y" class="inputTextNormal" altname="邮编"></td>
    </tr>
  <tr class="trwhite">
   <th >来信人电话：</th>
    <td ><input name="xzfyInfo.laixin_tel" type="text" id="phone" ischeck="y" class="inputTextNormal" altname="被接待人电话" ></td>
     <th ></th>
     <td ></td>
  </tr>
  <tr class="trwhite">
      <th>申请人类别：</th>
	   <td>
	   <@ww.select  name="'xzfyInfo.app_type'" id="applicationtype" headerKey="''" headerValue=""  list="getDictMap('sqrlb')" value="" onchange="'checksqr()'"/>
	   </td>
	   <th>申请人人数：</th>
    <td><input name="xzfyInfo.renCount" id="rencount" onBlur="renCount()" onchange="setCountAppname('shenqingren','rencount')"   type="text" class="inputTextNormal" altname="申请人人数"></td>
   </tr>
   <tr  id="shenqingren1">
  	<th >申请人：</th>
    <td  colspan=3>
    <a href="javascript:setApp()" style="display:block" id="appspan">添加</a>
    <textarea name="xzfyInfo.appdetail" type="text" class="textarea" onchange="setCountAppname('shenqingren','rencount')" id="shenqingren" ischeck="y" altname="申请人" style="overflow-y:visible;"  ></textarea>
    </td>
   </tr>
   <tr class="trwhite" id="sqr" style="display:none">
    <th>申请人名称：</th>
    <td colspan=3>
	<a href="javascript:setFr()" id="frspan" >添加</a><br>
    <textarea name="xzfyInfo.agentDetail" type="text" id="appname" class="textarea" ischeck="y" altname="法人" style="overflow-y:visible;" ></textarea>
    </td>
   </tr>
   <tr id="daibiaorendiv" style="display:none"> 
	<th>代表人：</th>
	<td  colspan=3>
		    <a href="javascript:setDeputy()" style="display:block" id="deputyspan">添加</a>
		<#--<a href="javascript:opendg('xzfy/addDeputy.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=1&textId=deputy&deputy=1',900,600)"  style="display:block" id="appspan1">添加</a>
		-->
    	<textarea name="xzfyInfo.dbrDetail" type="text" class="textarea"  id="deputy" ischeck="y" altname="代表人" style="overflow-y:visible;"></textarea>
	</td>	    
   </tr>
    <th >第三人：</th>
    <td ><input name="xzfyInfo.third" id="dsdlr1" type="text" class="inputTextNormal"  altname="第三人" maxlength="50"></td>
         <th ></th>
     <td ></td>
  </tr>	
   <tr  id="jddlr2">
	<th >代理人：</th>
	<td ><input name="xzfyInfo.agent_name"  type="text" class="inputTextNormal" altname="代理人" maxlength="50"></td>
	<th >第三人代理人：</th>
	<td ><input name="xzfyInfo.third_agent" type="text" class="inputTextNormal"  altname="第三人代理人" maxlength="50"></td>
   </tr>
  
  <tr >
   <th >多人复议：</th>
   <td > 
   <input type="radio" name="xzfyInfo.isMany" value="是" id="duoren_y" ischeck="y" altname="多人复议">
   <label for="duoren_y">是 </label>
   <input type="radio" name="xzfyInfo.isMany" value="否" id="duoren_n" ischeck="y" altname="多人复议" checked>
   <label for="duoren_n">否</label></td>
   
   <th >复议机关：</th>
 
    <td >
	    <select name="xzfyInfo.xzfy_org" ischeck="y" altname="复议机关" class="selectStyleNormal" >
			
		  <option value="0">----请选择----</option>	  
		  <option value="2">县级政府</option>		  
		  <option value="3">县级政府的部门</option>	 
		  <option value="6">省部级行政机关</option>
		  <option value="7">省级政府的部门</option>
	    </select>
    </td>
  </tr>
  
  <tr >
  
   <th >被申请人种类：</th>
   <td >
      <@ww.select name="'xzfyInfo.defendant_type'" id="beapptype"  headerKey="'0'" headerValue="'--请选择--'"  list="getDictMap('bsqrzl')" 
    onchange="'aaa()'"/>
   </td>
     <th >被申请人名称：</th>
     <td  style="display:none;" id="beappnametd">   
     <input name="ssss" type="text" class="inputTextNormal" id="beappnameinput" altname="被申请人名称">
    </td> 
    <td  style="display:block;" id="beappnamesel">  
    <select name="xzfyInfo.defendant_name" ischeck="y" id="beappname"
     onchange="beappcode()" altname="被申请人名称" class="selectStyleNormal">
      <option value="" deptcode="">----请选择----</option>     	 
    </select>    
    </td>
    
    <td  style="display:none;" id="beappnametd">
   <input name="sss" type="text" class="inputTextNormal" id="beappname2" >
    </td>
    </tr>
   <tr >
    <th >被复议的具体行为-名称：</th>
    <td ><input name="xzfyInfo.xwname" id="xingwei" type="text" ischeck="y" altname="被复议的具体行为-名称" class="inputTextNormal" title="请输入正确的名称"></td>
     <th >被复议的具体行为-案号：</th>
    <td ><input name="xzfyInfo.xwnum" type="text" id="annum" class="inputTextNormal" ischeck="y" altname="案号"></td>
  </tr>
   
     <tr >
     <th >行政复议请求：</th>
    <td   colspan=3>
      <textarea name="xzfyInfo.xzfy_requset_retail" id="xzfyqq1" type="text" class="textarea"   rowspan="5" altname="行政复议请求"></textarea></td>
    </tr>

	 <tr >
	  <th >是否申请听证：</th>
	    <td >
	    	  <input type="radio" checked name="xzfyInfo.istingzheng" value="是" id="isting_y" ischeck="y" altname="是否听证">
		      <label for="isting_y">是</label>
		      <input type="radio" name="xzfyInfo.istingzheng" value="否" id="isting_n" ischeck="y" altname="是否听证" checked>
		      <label for="isting_n">否</label>
	    </td>
	   <th >是否申请行政赔偿：</th>
  <td  >
   <input type="radio" checked name="xzfyInfo.ismoney" value="是" id="peichangy" ischeck="y" altname="是否行政赔偿">
		      <label for="isting_y">是</label>
		      <input type="radio" name="xzfyInfo.ismoney" value="否" id="peichangn" ischeck="y" altname="是否行政赔偿" checked>
		      <label for="isting_n">否</label>
  </td>
    </tr>
	<tr >
		<th >复议前置：</th>
	    <td >
		    <input type="radio" name="xzfyInfo.isfront" value="是" id="fyqz_y" ischeck="y" altname="复议前置">
		        <label for="fyqz_y">是 </label>
		     <input type="radio" name="xzfyInfo.isfront" value="否" id="fyqz_n" ischeck="y" checked altname="复议前置">
	        <label for="fyqz_n">否</label>
        </td>
        <th >是否申请对规范性文件审查：</th>
	<td ><input type="radio" name="xzfyInfo.ischeck" nbzcheck="y" altname="对规范性文件审查" value="是" id="gfsc_y" onclick="check_shencha('1')">
	        <label for="gfsc_y">是 </label>
	        <input type="radio" name="xzfyInfo.ischeck" altname="对规范性文件审查" value="否" nbzcheck="y"  id="gfsc_n" onclick="check_shencha('2')" checked>
	        <label for="gfsc_n">否</label>
		<span id="shencha" style="display:none">规范文件：
			<input name="xzfyInfo.post2" type="text" id="post2" class="inputTextNormal" ></span>
	    </td>
	</tr>
	  <tbody id="youxing" style="display:none;">
      <tr >
	 <th >是否游行示威：</th>
	 <td > <input type="radio" name="xzfyInfo.tPoliceIsparade"  value="1" id="yxsw_y" altname="是否游行示威" ischeck="y">
      <label for="xzpc_y">是 </label>
      <input type="radio" name="xzfyInfo.tPoliceIsparade"  value="0" id="yxsw_n" altname="是否游行示威" ischeck="y">
      <label for="xzpc_n">否</label></td>
		 <td >&nbsp;</td>
	 <td >&nbsp;</td>
	 </tr>
	 </tbody>
	 <#--
	 <tr >
		 <td >统计关键词：</td>
	     <td >
		     <select name="xzfyInfo.keyword" ischeck="y" altname="统计关键词" class="selectStyleNormal" id="keyword" onchange="countKey()" onclick="countKey()">
		        <option value="0">----请选择----</option>
			 	<option value="1">属于复议范围</option>
			    <option value="2">不属于复议范围</option>
			    <option value="3">复议案件审理</option>
			 </select>	 
	    <td  colspan=2>
	    <span id="countRs"></span>
	    </td>
    </tr>-->
<input name="xzfyInfo.menu" type="hidden" id="menuSave">
<tbody id="jdcl1" style="display:none;">
 <tr >
  	<td >接待处理：</td>
    <td >
	当面及电话接待口头告知&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='1' onclick="dispose()"><br>
	书面告知补正&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='2' onclick="dispose();setJDCL(2)"><br>
	接收复议申请材料&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='3' onclick="dispose();setJDCL(3)"><br>
	
  </td>  
  <td  colspan="2">
  <span style="display:none" id="reception1">
  &nbsp告知、解释规定（申请复议有关知识）&nbsp<input name="xzfyInfo.reception2"  type="radio" altname="接待处理" value='1' onclick="setJDCL(21)"><br>
&nbsp告知补正（明确表述，补齐材料）&nbsp<input name="xzfyInfo.reception2"  type="radio" altname="接待处理" value='2'  onclick="setJDCL(22)"><br>
&nbsp告知因没有利害关系，不符合受理条件&nbsp<input name="xzfyInfo.reception2"  type="radio" altname="接待处理" value='3'  onclick="setJDCL(23)"><br>
&nbsp因其他机关已受理，或法院已受理，不符合受理条件&nbsp<input name="xzfyInfo.reception2"  type="radio" altname="接待处理" value='4'  onclick="setJDCL(24)"><br>
  &nbsp超过复议期限,不符合受理条件&nbsp<input name="xzfyInfo.reception2"  type="radio" altname="接待处理" value='5'  onclick="setJDCL(25)"><br>
  &nbsp不属于市政府职责范围，不符合受理条件&nbsp<input name="xzfyInfo.reception2"  type="radio" altname="接待处理" value='6'  onclick="setJDCL(26)"><br>
  &nbsp告知其他事项&nbsp<input name="xzfyInfo.reception2"  type="radio" altname="接待处理" value='7'  onclick="setJDCL(27)"><br>
  </span>
	  </td>
	</tr>
</tbody>
</table>
<br>
<div id="count1Div1" style="position:absolute;display:none;" class="diva">
	<table  border="1px solid #999999'" align="center" cellpadding="1" cellspacing="1" id="keyword1">
	<tr onclick="javascript:closeKey1Div('count1Div1')">完成</tr>
 <tr>
 <td>
 <table  border="1px solid #999999'" align="center" cellpadding="0" cellspacing="1">
  <tr>
  <td onmouseover="leibieClose()" height=40>
 申请复议事项：
</td>
 </tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(1)"  height=40 onmouseout="this.style.backgroundColor='#ddecfb'">行政处罚&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='1' onclick="sqfysx(1)" id='sqfysx1'>
	<img src="../images/icon_work/icon_nextpage.gif" /></td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(2)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'">
	行政强制措施&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='2' onclick="sqfysx(2)" id='sqfysx2'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(3)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'">
	行政征收&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='3' onclick="sqfysx(3)" id='sqfysx3'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(0);checkFysx(4)" height=40   onmouseout="this.style.backgroundColor='#ddecfb'">
	行政许可&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='4' onclick="sqfysx(0)" id='sqfysx4'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(0);checkFysx(5)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'">
	行政确权&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='5' onclick="sqfysx(0)" id='sqfysx5'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(0);checkFysx(6)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'">
	干预经营自主权&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='6' onclick="sqfysx(0)" id='sqfysx6'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(0);checkFysx(7)" height=40   onmouseout="this.style.backgroundColor='#ddecfb'">
	信息公开&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='7' onclick="sqfysx(0)" id='sqfysx7'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(0);checkFysx(8)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'">
	行政不作为&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='8' onclick="sqfysx(0)" id='sqfysx8'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(0);checkFysx(9)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'">
	其他&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='9' onclick="sqfysx(0)" id='sqfysx9'><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
	</td>
</table>
</td>
<td>
<table  border="1px solid #999999'" align="center" cellpadding="0" cellspacing="1">
<tbody id="xzfysx2xzcf" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(1)" height=40   onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(1)">
	拘留&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='1' onclick="setSqfy2(1)" ><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(2)" height=40   onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(2)">
	没收&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='2' onclick="setSqfy2(2)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(3)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(3)">
	罚款&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='3' onclick="setSqfy2(3)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(4)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(4)">
	其他&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='4' onclick="setSqfy2(4)"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
	</tbody>
<tbody id="xzfysx2xzqzcs" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(5)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(5)">
	对人身的强制措施&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='5' onclick="setSqfy2(5)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(6)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(6)">
	对不动产的强制措施&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='6' onclick="setSqfy2(6)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(7)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(7)">
	对其它财产的强制措施&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='7' onclick="setSqfy2(7)"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
</tbody>
<tbody id="xzfysx2xzsx" style="display:none">
<tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(8)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(8)">
	征收土地&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='8' onclick="setSqfy2(8)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(9)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(9)">
	版税&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='9' onclick="setSqfy2(9)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(10)" height=40   onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(10)">
	收费&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='10' onclick="setSqfy2(10)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(11)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(11)">
	要求履行其他义务&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='11' onclick="setSqfy2(11)"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
</tbody>
	</table>
	</td>
 <td>
 <table  border="1px solid #999999'" align="center" cellpadding="0" cellspacing="1" id="leibieTable" style="display:none">
 行政管理类别：
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(1)" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" >公安&nbsp
	<input type="radio" name="xzfyInfo.refer" value="1"  id="1refer"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(0);checkxz('2refer')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="closeKey1Div('count1Div1')">国家安全&nbsp
	<input type="radio" name="xzfyInfo.refer" value="2"  id="2refer" onclick="closeKey1Div('count1Div1')">
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(0);checkxz('3refer')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="closeKey1Div('count1Div1')">劳动和社会保障&nbsp
	<input type="radio" name="xzfyInfo.refer" value="3"  id="3refer">
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(0);checkxz('4refer')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="closeKey1Div('count1Div1')">司法行政&nbsp
	<input type="radio" name="xzfyInfo.refer" value="4"  id="4refer" onclick="closeKey1Div('count1Div1')">
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(0);checkxz('5refer')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="closeKey1Div('count1Div1')">民政&nbsp
	<input type="radio" name="xzfyInfo.refer" value="5"  id="5refer" onclick="closeKey1Div('count1Div1')">
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(6)" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" >农林环资&nbsp
	<input type="radio" name="xzfyInfo.refer" value="6"  id="6refer"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(7)" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" >城建&nbsp
	<input type="radio" name="xzfyInfo.refer" value="7"  id="7refer"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(8)" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" >工交商事&nbsp
	<input type="radio" name="xzfyInfo.refer" value="8"  id="8refer"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(9)" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" >财政金融&nbsp
	<input type="radio" name="xzfyInfo.refer" value="9"  id="9refer"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(10)" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" >教科文卫&nbsp
	<input type="radio" name="xzfyInfo.refer" value="10"  id="10refer"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(0);checkxz('11refer')" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="closeKey1Div('count1Div1')">其他&nbsp
	<input type="radio" name="xzfyInfo.refer" value="11"  id="11refer" onclick="closeKey1Div('count1Div1')">
	</td>
</tr>
</table>
</td>
<td>
<table  border="1px solid #999999'" align="center" cellpadding="0" cellspacing="1" id="leibie2Table" style="display:none">
<tbody id="ajgllbga" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('1refer','refer21')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('1refer','refer21')">
	治安<input type="radio" name="xzfyInfo.refer2" value="1" id="refer21" onclick="checkRefer2('1refer','refer21')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('1refer','refer22')" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('1refer','refer22')">
	劳教<input type="radio" name="xzfyInfo.refer2" value="2" id="refer22" onclick="checkRefer2('1refer','refer22')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('1refer','refer23')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('1refer','refer23')">
	其他<input type="radio" name="xzfyInfo.refer2" value="3" id="refer23" onclick="checkRefer2('1refer','refer23')">
</td>
</tr>
</tbody>
<tbody id="ajgllbnlhz" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer29')" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer29')">
	土地<input type="radio" name="xzfyInfo.refer2" value="9" id="refer29" onclick="checkRefer2('6refer','refer29')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer210')" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer210')">
	地矿<input type="radio" name="xzfyInfo.refer2" value="10" id="refer210" onclick="checkRefer2('6refer','refer210')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer211')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer211')">
	环保<input type="radio" name="xzfyInfo.refer2" value="11" id="refer211" onclick="checkRefer2('6refer','refer211')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer212')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer212')">
	农业<input type="radio" name="xzfyInfo.refer2" value="12" id="refer212" onclick="checkRefer2('6refer','refer212')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer213')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer213')">
	水利<input type="radio" name="xzfyInfo.refer2" value="13" id="refer213" onclick="checkRefer2('6refer','refer213')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer214')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer214')">
	林业<input type="radio" name="xzfyInfo.refer2" value="14" id="refer214" onclick="checkRefer2('6refer','refer214')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer215')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer215')">
	其他<input type="radio" name="xzfyInfo.refer2" value="15" id="refer215" onclick="checkRefer2('6refer','refer215')">
</td>
</tr>
</tbody>

<tbody id="ajgllbcj" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('7refer','refer217')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('7refer','refer217')">
	规划<input type="radio" name="xzfyInfo.refer2" value="17" id="refer217" onclick="checkRefer2('7refer','refer217')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('7refer','refer218')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('7refer','refer218')">
	拆迁<input type="radio" name="xzfyInfo.refer2" value="18" id="refer218" onclick="checkRefer2('7refer','refer218')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('7refer','refer219')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('7refer','refer219')">
	房屋登记<input type="radio" name="xzfyInfo.refer2" value="19" id="refer219" onclick="checkRefer2('7refer','refer219')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('7refer','refer220')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('7refer','refer220')">
	其他<input type="radio" name="xzfyInfo.refer2" value="20" id="refer220" onclick="checkRefer2('7refer','refer220')">
</td>
</tr>
</tbody>

<tbody id="ajgllbgjss" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer222')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer222')">
	工商<input type="radio" name="xzfyInfo.refer2" value="22" id="refer222" onclick="checkRefer2('8refer','refer222')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer223')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer223')">
	质监<input type="radio" name="xzfyInfo.refer2" value="23" id="refer223" onclick="checkRefer2('8refer','refer223')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer224')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer224')">
	商务<input type="radio" name="xzfyInfo.refer2" value="24" id="refer224" onclick="checkRefer2('8refer','refer224')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer225')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer225')">
	物价<input type="radio" name="xzfyInfo.refer2" value="25" id="refer225" onclick="checkRefer2('8refer','refer225')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer226')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer226')">
	能源<input type="radio" name="xzfyInfo.refer2" value="26" id="refer226" onclick="checkRefer2('8refer','refer226')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer227')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer227')">
	交通<input type="radio" name="xzfyInfo.refer2" value="27" id="refer227" onclick="checkRefer2('8refer','refer227')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer228')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer228')">
	信息产业<input type="radio" name="xzfyInfo.refer2" value="28" id="refer228" onclick="checkRefer2('8refer','refer228')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer229')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer229')">
	邮政<input type="radio" name="xzfyInfo.refer2" value="29" id="refer229" onclick="checkRefer2('8refer','refer229')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer230')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer230')">
	烟草专买<input type="radio" name="xzfyInfo.refer2" value="30" id="refer230" onclick="checkRefer2('8refer','refer230')">
</td>
</tr>
</tbody>

<tbody id="ajgllbczjr" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer232')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer232')">
	税务<input type="radio" name="xzfyInfo.refer2" value="32" id="refer232" onclick="checkRefer2('9refer','refer232')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer233')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer233')">
	人民银行<input type="radio" name="xzfyInfo.refer2" value="33" id="refer233" onclick="checkRefer2('9refer','refer233')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer234')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer234')">
	证监<input type="radio" name="xzfyInfo.refer2" value="34" id="refer234" onclick="checkRefer2('9refer','refer234')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer235')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer235')">
	保监<input type="radio" name="xzfyInfo.refer2" value="35" id="refer235" onclick="checkRefer2('9refer','refer235')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer236')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer236')">
	银监<input type="radio" name="xzfyInfo.refer2" value="36" id="refer236" onclick="checkRefer2('9refer','refer236')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer237')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer237')">
	外汇<input type="radio" name="xzfyInfo.refer2" value="37" id="refer237" onclick="checkRefer2('9refer','refer237')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer238')" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer238')">
	财政<input type="radio" name="xzfyInfo.refer2" value="38" id="refer238" onclick="checkRefer2('9refer','refer238')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer239')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer239')">
	统计<input type="radio" name="xzfyInfo.refer2" value="39" id="refer239" onclick="checkRefer2('9refer','refer239')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer240')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer240')">
	审计<input type="radio" name="xzfyInfo.refer2" value="40" id="refer240" onclick="checkRefer2('9refer','refer240')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer241')" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer241')">
	海关<input type="radio" name="xzfyInfo.refer2" value="41" id="refer241" onclick="checkRefer2('9refer','refer241')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer242')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer242')">
	商检<input type="radio" name="xzfyInfo.refer2" value="42" id="refer242" onclick="checkRefer2('9refer','refer242')">
</td>
</tr>
</tbody>

<tbody id="ajgllbjkww" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer244')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer244')">
	药监<input type="radio" name="xzfyInfo.refer2" value="44" id="refer244" onclick="checkRefer2('10refer','refer244')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer245')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer245')">
	卫生<input type="radio" name="xzfyInfo.refer2" value="45" id="refer245" onclick="checkRefer2('10refer','refer245')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer246')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer246')">
	计划生育<input type="radio" name="xzfyInfo.refer2" value="46" id="refer246" onclick="checkRefer2('10refer','refer246')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer247')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer247')">
	教育<input type="radio" name="xzfyInfo.refer2" value="47" id="refer247" onclick="checkRefer2('10refer','refer247')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer248')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer248')">
	文化<input type="radio" name="xzfyInfo.refer2" value="48" id="refer248" onclick="checkRefer2('10refer','refer248')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer249')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer249')">
	专利<input type="radio" name="xzfyInfo.refer2" value="49" id="refer249" onclick="checkRefer2('10refer','refer249')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer250')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer250')">
	商标<input type="radio" name="xzfyInfo.refer2" value="50" id="refer250" onclick="checkRefer2('10refer','refer250')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer251')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer251')">
	版权<input type="radio" name="xzfyInfo.refer2" value="51" id="refer251" onclick="checkRefer2('10refer','refer251')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer252')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer252')">
	旅游<input type="radio" name="xzfyInfo.refer2" value="52" id="refer252" onclick="checkRefer2('10refer','refer252')">
</td>
</tr>

</tbody>
</table>
</td>
	</tr>
	</table>
</div>

<div id="count2Div1" style="position:absolute;display:none;" class="diva">
 <table  border="1px solid #999999'" align="center" cellpadding="0" cellspacing="1">
 <tr onclick="javascript:closeKey1Div('count2Div1')">完成</tr>
 <tr>
	<td>申请复议事项：</td>
	<td >
	.抽象行政行为&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='1'><br>
	.行政处分、人事处理决定&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='2'><br>
	.行政机关对民事纠纷作出的调解、处理&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='3'><br>
	.国防、外交等国家行为&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='4'><br>
	.交通、医疗、火灾事故责任认定&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='5'><br>
	.司法鉴定&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='6'><br>
	.涉及刑事行为&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='7'><br>
	.民事行为&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='8'><br>
	.司法行为&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='9'><br>
	.对当事人权利不产生影响的信访行为&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='10'><br>
	.不具有强制力的行政指导&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='11'><br>
	.其他行政复议机关对复议申请的处理&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='12'><br>
	.涉及市政府行政复议工作的来信&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='13'><br>
	.其他&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='14'><br>
	</td>
	</tr>
 <tr>
	<td >接待处理：</td>
	<td >口头告知&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='4'><br>
	.接收复议申请材料&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='5'><br>
	.接收行政复议监督案件&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='6'><br>
	.接收其他来信、电子邮件&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='7'><br>
	</td>
	</tr>
</table>

</div>

<div id="count3Div1" style="position:absolute;display:none;" class="diva">
 <table  border="1px solid #999999'" align="center" cellpadding="0" cellspacing="1">
 <tr onclick="javascript:closeKey1Div('count3Div1')">完成</tr>
 <tr>
	<td>复议审理方式：</td>
	<td>送达&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='1'><br>
	询问案件进展情况&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='2'><br>
	阅卷&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='3'><br>
	谈话、调查&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='4'><br>
	当面补交申请材料、明确有关事项&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='5'><br>
	来信补交申请材料&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='6'><br>
	当面代为接转其他材料&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='7'><br>
	来信、邮件提交其他材料&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='8'><br>
	其他涉及案件审理的事项&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='9'><br>
	</td>
	</tr>
</table>

</div>


<div id="userDiv" style="position:absolute;display:none;" class="diva" >
<table width="90%">
<tr><td >
<a href="javascript:addUser()">继续添加</a></td>
<td align="right" width=100><a href="javascript:addUser:closeDiv1()">完成</a></td>
<td align="right" width=100><a href="javascript:closeDivById('userDiv')">关闭</a></td>
</tr>

</table>


<table  width="90%">
   <tr >
  	<td id="tuser">
  	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table" id="app">
<tr>
<th>被接待人：</th>
<td><input name="bjdr1" isUser="true" value=""/></td>
<th>性别：</th>
<td><select name="bsex" isUser="true" retSelect="1">
	<option value="男">男</option>
	<option value="女">女</option>
	</select></td>
</tr>
<tr>
<th>身份证号：</th>
<td><input name="bnum" isUser="true" value="" /></td>
<th>通信地址：</th>
<td><textarea name="baddress" type="text" isUser="true" ></textarea>
</td>	
</tr>
<tr>
	<th>
	邮编：
	</th>
	<td><input name="bpost" isUser="true" value="" />
	</td>
	<th>
	电话：
	</th>
	<td><input name="bphone" isUser="true" value='' />
	&nbsp;&nbsp;
	<input value="删除" type="button" class="button" onclick="deleteUser(this)">
	</td>
</tr>
</table>
<table  id="ins">
&nbsp;
</table>
</td></tr>
</table>
</div>

<div id="appDiv" style="position:absolute;display:none;" class="diva">
<table width="95%">
<tr><td align="left" >
<a href="javascript:addApp()">继续添加</a></td>
<td align="right" width=100><a href="javascript:addApp:closeApp()" id="appEnd">完成</a></td>
<td align="right" width=100><a href="javascript:addUser:closeDivById('appDiv')">关闭</a></td>
</tr>

</table>
<table width="90%">
<tr>
<td id="tapp">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table" id="appapp">
<tr>
<th>申请人：</th>
<td><input name="appsqr" isUser="true" value=""/></td>
<th>性别：</th>
<td><select name="appsex" isUser="true" retSelect="1">
	<option value="男">男</option>
	<option value="女">女</option>
	</select></td>
	</tr>
<tr>
	<th>身份证号：</th>
	<td><input name="appnum" isUser="true" value="" />
	</td>
	<th>
	送达地址：
	</th>
	<td>
	<textarea name="appaddress" type="text" isUser="true"></textarea>
	</td>
</tr>
<tr>
	<th>
	邮编：
	</th>
	<td><input name="apppost" isUser="true" value=""/>
	</td>
	<th>
	电话：
	</th>
	<td><input name="appphone" isUser="true" value='' />
	<input value="删除" type="button" class="buttonNormal" onclick="deleteApp(this)">
	</td>
</tr>
</table>
<table  id="insapp">
&nbsp;
</table>
</td></tr>
</table>
</div>

<div id="deputyDiv" style="position:absolute;display:none;" class="diva">
<table>
<tr><td align="left">
<a href="javascript:addDep()" width=100>继续添加</a></td>
<td align="right" width=100><a href="javascript:addApp:closeDep()">完成</a></td>
<td align="right" width=100><a href="javascript:addUser:closeDivById('deputyDiv')">关闭</a></td>
</tr>

</table>
<table >
<tr>
<td id="tdep">
<table  id="dep"><tr>
<td>
请选择代表人：
</td>
<td>
<select name="depsqr" id="deputySqr" isUser="true" retSelect="1" >
</select>
</td>
<td>
	&nbsp;&nbsp;<input value="删除" type="button" class="buttonNormal" onclick="deleteDep(this)">
</td>
</tr>
</table>
<table  id="insdep">
&nbsp;
</table>
</td></tr>
</table>
</div>

<div id="frDiv" style="position:absolute;display:none;" class="diva">
<table width="95%">
<tr><td align="left" >
<a href="javascript:addFr()">继续添加</a></td>
<td align="right"  width='100'><a href="javascript:checkFr();closeDivById('frDiv')">完成</a></td>
<td align="right"  width='100'><a href="javascript:closeDivById('frDiv')">关闭</a></td>
</tr>

</table>
<table width="95%">
<tr>
<td id="tfaren">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table" id="appfaren">
<tr>
<th >
申请人：</th>
<td colspan=3>
<input name="frsqr" isUser="true" size="50" value=""/>
</td>
</tr>
<tr>

<th width="18%">
代表人名称：
</th>
<td width="32%"><input name="fuzeren" isUser="true" value=""/>
</td>
<th width="18%">
	送达地址：</th>
<td width="32%">
<textarea name="fzraddress" isUser="true" ></textarea>
<!--<input name="fzraddress" isUser="true" value="" size=30/>-->
	</td>
</tr>
	<tr><th>
	代表人类别：</th>
<td colspan=3>
<select name="fzrlb" isUser="true" retSelect="1">
<option value="法定代表人">法定代表人</option>
	<option value="负责人">负责人</option>
    <option value="执行合伙事务的合伙人">执行合伙事务的合伙人</option>
    <option value="合伙人">合伙人</option>
    <option value="主要负责人">主要负责人</option>
    <option value="被共同推选的非法人组织其他成员">被共同推选的非法人组织其他成员</option>
	</select>

	</td>
	
	</tr>
	<tr>
	<th>
	邮编：</th>
<td><input name="fzrpost" isUser="true" value=""/>
	</td>
	<th>
	电话：</th>
<td><input name="fzrtele" isUser="true" value=""/>
	</td>
</tr>
<tr>
<th>
	其他情形：
	</th>
<td colspan=2><select name="fzrother" isUser="true" retSelect="1">
	 <option value="0">无</option>
    <option value="由股东代表大会以股份制企业名义提出申请">由股东代表大会以股份制企业名义提出申请</option>
    <option value="由董事会以股份制企业名义提出申请">由董事会以股份制企业名义提出申请</option>
    <option value="其他">其他</option>
	</select>
	
	</td>
<td align='left'><input value="删除" type="button" class="buttonNormal" onclick="deleteFr(this)"></td>

</tr>
</table>
<table  id="insfaren">
&nbsp;
</table>
</td></tr>
</table>
</div>

<div class="align-center">
<a href="#" title="提交" class="btn-blue btn" onclick="javascript:saveNew('${xzfyId}')">提交</a>
<a href="#" title="返回" class="btn-blue btn" onclick="javascript:back()">返回</a>
</div>

</form>
</body>

<script language="javascript">
function opendg(dgurl,dgw,dgh)
{
  $.dialog({ 
    title:'申请人管理',
    width: dgw,
    height: dgh,
    content:'url:'+ dgurl});
}

function ajgllb(){
	document.getElementById("yxsw_n").checked=true;
	//document.getElementById("yxswlabel").style.display="none";
	document.getElementById("yxswinput").style.display="none";
	if(document.getElementById("ajsjfm1").value==1){		
		//document.getElementById("yxswlabel").style.display="block";
		document.getElementById("yxswinput").style.display="block";
		document.getElementById("ajgllbga").style.display="block";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="xzfyInfo.refer2";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";

		
	}
	if(document.getElementById("ajsjfm1").value==6){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="block";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="xzfyInfo.refer2";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";



	}
	if(document.getElementById("ajsjfm1").value==7){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="block";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="xzfyInfo.refer2";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";
	}

	if(document.getElementById("ajsjfm1").value==8){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="block";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="xzfyInfo.refer2";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";
	}
	if(document.getElementById("ajsjfm1").value==9){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="block";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="xzfyInfo.refer2";
		document.getElementById("ajgllbjkww").name="sss";
	}
	if(document.getElementById("ajsjfm1").value==10){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="block";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="xzfyInfo.refer2";
	}

	if(!(document.getElementById("ajsjfm1").value==1||document.getElementById("ajsjfm1").value==6||document.getElementById("ajsjfm1").value==7||document.getElementById("ajsjfm1").value==8||document.getElementById("ajsjfm1").value==9||document.getElementById("ajsjfm1").value==10))
	{
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="ss";
	}
	//document.getElementById("divxzgllbinput").innerHTML='<input name="xzfyInfo.TReferOther" type="text" altname="行政管理类别" id="xzgllbinput" class="inputTextNormal">';
}

	function xbz(){
		var selectList=document.getElementsByTagName("select");
		for(var i=0;i<selectList.length;i++){
			if(selectList.item(i).retSelect){

			}else{
				selectList.item(i).style.display="block";
			}
		}
		document.getElementById("bzDiv").style.display="none";	
		var userspan=document.getElementById("bzspan");
		userspan.style.display="block";
		document.getElementById("bzDiv").style.display="none";
	}


function szfyqq(){
	

	if(document.getElementById("request").value==2){
		document.getElementById("requesttype").style.display="block";
		document.getElementById("requesttype2").style.display="block";
		document.getElementById("requesttype3").style.display="block";
	}else{
		document.getElementById("requesttype").style.display="none";
		document.getElementById("requesttype2").style.display="none";
		document.getElementById("requesttype3").style.display="none";
	}
	
}


function setNotsend_n(){
	document.getElementById("scresult").value=0;
}
function setNotsend(){
   //document.getElementById("scresult").value=5;
   document.getElementById("ajsjfm1").value=0;
   document.getElementById("dlr1").value="";
   document.getElementById("dsdlr1").value="";
   document.getElementById("bfyjtxwah1").value="";
   document.getElementById("xzfyqq1").value="";
   document.getElementById("bfyjtxwmc1").value="";
   document.getElementById("addbegin").value="";
   document.getElementById("addend").value="";
   document.getElementById("cbrsubdate").value="";
   document.getElementById("cbropinion").value="";
   
   
   //document.getElementById("di3ren_y").checked=false;
  // document.getElementById("di3ren_n").checked=false;
   document.getElementById("xzpc_y").checked=false;
   document.getElementById("xzpc_n").checked=false;
   document.getElementById("TIsadd_y").checked=false;
   document.getElementById("TIsadd_n").checked=false;
   document.getElementById("gfsc_n").checked=false;
   document.getElementById("gfsc_n").checked=false;
   
}
function test(){
	//alert(document.getElementById("deptid").value);
}

subcat = new Array();
var count=0;

   subcat[0]=new Array("6","北京市人民政府","0000"); 
       count++;    
       subcat[1]=new Array("2","东城区人民政府","0100"); 
       count++;    
       subcat[2]=new Array("2","西城区人民政府","0200"); 
       count++;    
       subcat[3]=new Array("2","崇文区人民政府","0300"); 
       count++;    
       subcat[4]=new Array("2","宣武区人民政府","0400"); 
       count++;    
       subcat[5]=new Array("2","朝阳区人民政府","0500"); 
       count++;    
       subcat[6]=new Array("2","海淀区人民政府","0600"); 
       count++;    
       subcat[7]=new Array("2","丰台区人民政府","0700"); 
       count++;    
       subcat[8]=new Array("2","石景山区人民政府","0800"); 
       count++;    
       subcat[9]=new Array("2","门头沟区人民政府","0900"); 
       count++;    
       subcat[10]=new Array("2","房山区人民政府","1000"); 
       count++;    
       subcat[11]=new Array("2","通州区人民政府","1100"); 
       count++;    
       subcat[12]=new Array("2","顺义区人民政府","1200"); 
       count++;    
       subcat[13]=new Array("2","大兴区人民政府","1300"); 
       count++;    
       subcat[14]=new Array("2","昌平区人民政府","1400"); 
       count++;    
       subcat[15]=new Array("2","平谷区人民政府","1500"); 
       count++;    
       subcat[16]=new Array("2","怀柔区人民政府","1600"); 
       count++;    
       subcat[17]=new Array("2","密云县人民政府","1700"); 
       count++;    
       subcat[18]=new Array("2","延庆县人民政府","1800"); 
       count++;    
       subcat[19]=new Array("7","市发展和改革委员会","1900"); 
       count++;    
       subcat[20]=new Array("7","市教育委员会","2000"); 
       count++;    
       subcat[21]=new Array("7","市科学技术委员会","2100"); 
       count++;    
       subcat[22]=new Array("7","市民族事务委员会","2200"); 
       count++;    
       subcat[23]=new Array("7","市公安局","2300"); 
       count++;    
       subcat[24]=new Array("7","市监察局","2400"); 
       count++;    
       subcat[25]=new Array("7","市民政局","2500"); 
       count++;    
       subcat[26]=new Array("7","市司法局","2600"); 
       count++;    
       subcat[27]=new Array("7","市财政局","2700"); 
       count++;    
       subcat[28]=new Array("7","市人力资源和社会保障局","2900"); 
       count++;    
       subcat[29]=new Array("7","市国土资源局","3000"); 
       count++;    
       subcat[30]=new Array("7","市规划委员会","3100"); 
       count++;    
       subcat[31]=new Array("7","市住房和城乡建设委员会","3200"); 
       count++;    
       subcat[32]=new Array("7","市市政市容管理委员会","3300"); 
       count++;    
       subcat[33]=new Array("7","市交通委员会","3400"); 
       count++;    
       subcat[34]=new Array("7","市水务局","3500"); 
       count++;    
       subcat[35]=new Array("7","市农村工作委员会","3600"); 
       count++;    
       subcat[36]=new Array("7","北京市商务局","3700"); 
       count++;    
       subcat[37]=new Array("7","市文化局","3800"); 
       count++;    
       subcat[38]=new Array("7","市卫生局","3900"); 
       count++;    
       subcat[39]=new Array("7","市人口和计划生育委员会","4000"); 
       count++;    
       subcat[40]=new Array("7","市审计局","4100"); 
       count++;    
       subcat[41]=new Array("7","市人民政府外事办公室","4200"); 
       count++;    
       subcat[42]=new Array("7","市国有资产监督管理委员会","4300"); 
       count++;    
       subcat[43]=new Array("7","市地方税务局","4400"); 
       count++;    
       subcat[44]=new Array("7","市工商行政管理局","4500"); 
       count++;    
       subcat[45]=new Array("7","市质量技术监督局","4600"); 
       count++;    
       subcat[46]=new Array("7","市环境保护局","4700"); 
       count++;    
       subcat[47]=new Array("7","北京市工业促进局","4800"); 
       count++;    
       subcat[48]=new Array("7","市农业局","4900"); 
       count++;    
       subcat[49]=new Array("7","市广播电影电视局","5000"); 
       count++;    
       subcat[50]=new Array("7","市新闻出版局","5100"); 
       count++;    
       subcat[51]=new Array("7","市文物局","5200"); 
       count++;    
       subcat[52]=new Array("7","市体育局","5300"); 
       count++;    
       subcat[53]=new Array("7","市统计局","5400"); 
       count++;    
       subcat[54]=new Array("7","市园林绿化局","5500"); 
       count++;    
       subcat[55]=new Array("7","市药品监督管理局","5600"); 
       count++;    
       subcat[56]=new Array("7","市安全生产监督管理局","5700"); 
       count++;    
       subcat[57]=new Array("7","市旅游局","5800"); 
       count++;    
       subcat[58]=new Array("7","市人民政府侨务办公室","5900"); 
       count++;    
       subcat[59]=new Array("7","市民防局","6000"); 
       count++;    
       subcat[60]=new Array("7","北京市信息化工作办公室","6100"); 
       count++;    
       subcat[61]=new Array("7","市城市管理综合行政执法局","6200"); 
       count++;    
       subcat[62]=new Array("7","市运输管理局","6300"); 
       count++;    
       subcat[63]=new Array("7","北京市交通执法总队","6400"); 
       count++;    
       subcat[64]=new Array("7","路政局","6500"); 
       count++;    
       subcat[65]=new Array("7","北京市乡镇企业局","6600"); 
       count++;    
       subcat[66]=new Array("7","市粮食局","6700"); 
       count++;    
       subcat[67]=new Array("7","市中医管理局","6800"); 
       count++;    
       subcat[68]=new Array("7","北京市地方海事局","6900"); 
       count++;    
       subcat[69]=new Array("7","市文化执法总队","6900"); 
       count++;    
       subcat[70]=new Array("7","市档案局","7000"); 
       count++;    
       subcat[71]=new Array("7","市国家保密局","7100"); 
       count++;    
       subcat[72]=new Array("7","市知识产权局","7200"); 
       count++;    
       subcat[73]=new Array("7","北京市投资促进局","7300"); 
       count++;    
       subcat[74]=new Array("7","市住房公积金管理中心","7400"); 
       count++;    
       subcat[75]=new Array("7","公安交通管理局","7500"); 
       count++;    
       subcat[76]=new Array("7","消防局","7600"); 
       count++;    
       subcat[77]=new Array("7","市地震局","7700"); 
       count++;    
       subcat[78]=new Array("7","北京市气象局","7800"); 
       count++;    
       subcat[79]=new Array("7","北京市通信管理局","7900"); 
       count++;    
       subcat[80]=new Array("7","市邮政管理局","8000"); 
       count++;    
       subcat[81]=new Array("7","市无线电管理局","8100"); 
       count++;    
       subcat[82]=new Array("7","市劳动教养工作管理局","8200"); 
       count++;    
       subcat[83]=new Array("8","市经济技术开发区管委会","8300"); 
       count++;    
       subcat[84]=new Array("7","市烟草专卖局","8400"); 
       count++;    
       subcat[85]=new Array("7","市爱国卫生运动委员会办公室","8400"); 
       count++;    
       subcat[86]=new Array("7","市政府台湾事务办公室","8500"); 
       count++;    
       subcat[87]=new Array("7","市人民政府新闻办公室","8600"); 
       count++;    
       subcat[88]=new Array("7","市商务委员会","8700"); 
       count++;    
       subcat[89]=new Array("7","中关村科技园区管理委员会","8800"); 
       count++;    
       subcat[90]=new Array("7","市社会建设工作办公室","8900"); 
       count++;    
       subcat[91]=new Array("7","市经济信息化委","9007"); 
       count++;    
       subcat[92]=new Array("7","市劳动教养管理委员会","9008"); 
       count++;    
       subcat[93]=new Array("7","市医院管理局","9009"); 
       count++;    
       
function aaa(ss)
{
	var ss = document.getElementById('beapptype').options[document.getElementById('beapptype').selectedIndex].value;
    if( document.getElementById('beapptype').value==9){
    document.getElementById("beappname").setAttribute("ischeck","y");
    document.getElementById("beappnamesel").style.display="block";
	document.getElementById("beappnametd").style.display="none";
	document.getElementById("beappname").name="xzfyInfo.defendant_name";
	document.getElementById("beappnameinput").name="ssss";
	document.getElementById("beappnameinput").removeAttribute("ischeck");	
	
     document.getElementById('beappname').length=0;
    var tempOption=new Option("市经济技术开发区管委会","市经济技术开发区管委会");
    document.getElementById('beappname').options[0] = new Option("----请选择-----", "0");
    document.getElementById('beappname').options[1] = tempOption;
  
   }
    else if(document.getElementById('beapptype').value==1||document.getElementById('beapptype').value==3||document.getElementById('beapptype').value==8){
	document.getElementById("beappnameinput").setAttribute("ischeck","y");
	
	document.getElementById("beappnametd").style.display="block";
	document.getElementById("beappnamesel").style.display="none";
	document.getElementById("beappnameinput").name="xzfyInfo.defendant_name";
	document.getElementById("beappname").name="ssss";
	document.getElementById("beappname").removeAttribute("ischeck");
   
   }
   else{
    document.getElementById("beappname").setAttribute("ischeck","y");
    document.getElementById("beappnamesel").style.display="block";
	document.getElementById("beappnametd").style.display="none";
	document.getElementById("beappname").name="xzfyInfo.defendant_name";
	document.getElementById("beappnameinput").name="ssss";
	document.getElementById("beappnameinput").removeAttribute("ischeck");
	 document.getElementById('beappname').length = 0; 
		document.getElementById('beappname').options[document.getElementById('beappname').length] = new Option("----请选择-----", "0");
        var locationid=locationid;
		var x;
        for (x=0; x < count; x++)
         {
            if (subcat[x][0] == ss)

               {   var tempOption=new Option(subcat[x][1], subcat[x][1]);
               	   tempOption.deptcode=subcat[x][2];
                   document.getElementById('beappname').options[document.getElementById('beappname').length] = tempOption;
                } 
           }
	}
}

function beappcode(){
	var code=document.getElementById('beappname').options[document.getElementById('beappname').selectedIndex].deptcode;	
	//alert(document.getElementById('beappname').value)
	if(document.getElementById('beappname').value!=''){
	//var code=document.getElementById('beappname').deptcode;
	document.getElementById('deptid').value=code;	}
}


function addchecked(){
	document.getElementById("scresult").value="0";
	document.getElementById("cbrsubdate").value="";
	document.getElementById("cbropinion").value="";
	//document.getElementById("caseyj").value="";
	//document.getElementById("casebrief").value="";
	document.getElementById("gfsc_y").checked=false;
	document.getElementById("gfsc_n").checked=false;
}
function addnotchecked(){

	document.getElementById("addbegin").value="";
	document.getElementById("addend").value="";
	
}

function checkfysx(){
	if(document.getElementById("xzfysx").value==1){
	if(document.getElementById("xzfysx2xzcf").value==0)
	return false;
	}
	if(document.getElementById("xzfysx").value==2){
	if(document.getElementById("xzfysx2xzqzcs").value==0)
	return false;
	}
	if(document.getElementById("xzfysx").value==3){
	if(document.getElementById("xzfysx2xzsx").value==0)
	return false;
	}


	return true;
}
function checkajgllb(){
	if((document.getElementById("ajsjfm1").value==1&&document.getElementById("ajgllbga").value==0)||(document.getElementById("ajsjfm1").value==6&&document.getElementById("ajgllbnlhz").value==0)||(document.getElementById("ajsjfm1").value==7&&document.getElementById("ajgllbcj").value==0)||(document.getElementById("ajsjfm1").value==8&&document.getElementById("ajgllbgjss").value==0)||(document.getElementById("ajsjfm1").value==9&&document.getElementById("ajgllbczjr").value==0)||(document.getElementById("ajsjfm1").value==10&&document.getElementById("ajgllbjkww").value==0))
	
	{return false;}
	
	else{

	return true;
	}
}


function check_remark(){
	if(document.getElementById("handle").value==0){
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		document.getElementById("otherAdvice").style.display="none";
		document.getElementById("filedetail").style.display="none";
		document.getElementById("filespan").style.display="none";
		document.getElementById("buzheng").style.display="none";
		document.getElementById("bzspan").style.display="none";
		
	}else
	if(document.getElementById("handle").value==1){
		document.getElementById("handle_detail").style.display="block";
		document.getElementById("advicespan").style.display="block";
		document.getElementById("check_select").style.display="block";
		document.getElementById("otherAdvice").style.display="block";
		document.getElementById("filedetail").style.display="none";
		document.getElementById("filespan").style.display="none";
		document.getElementById("buzheng").style.display="none";
		document.getElementById("bzspan").style.display="none";
		
	}else if(document.getElementById("handle").value==3){
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		document.getElementById("otherAdvice").style.display="block";
		document.getElementById("filedetail").style.display="block";
		document.getElementById("filespan").style.display="block";
		document.getElementById("buzheng").style.display="none";
		document.getElementById("bzspan").style.display="none";
	}else{
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		document.getElementById("otherAdvice").style.display="block";
		document.getElementById("filedetail").style.display="none";
		document.getElementById("filespan").style.display="none";
		document.getElementById("buzheng").style.display="block";
		document.getElementById("bzspan").style.display="block";
		
	}
}

function checknull()
{
	if(document.getElementById("user").value==""){alert("请填写被接待人!");return;}
	var intReg=/^[0-9]*[1-9][0-9]*$/;
	if(!intReg.test(document.getElementById("applicationsum").value)){alert("请填写申请人总数");return;}
	
	var a=document.getElementsByTagName("input");	
	for(var i=0;i<a.length;i++)
		if(a.item(i).ischeck)
		{
		    if(a.item(i).type=="radio")
			{
			if(!(((document.getElementsByName(a.item(i).name)[0]).checked)||((document.getElementsByName(a.item(i).name)[1]).checked)))
				{
					alert("请填写:"+document.getElementsByName(a.item(i).name)[0].altname+"!");return false;
				}			
			}
			else if(a.item(i).value=="")
				{
					alert("请填写:"+a.item(i).altname+"!");return false;
				}
		}	

	var a=document.getElementsByTagName("select");
	for(var i=0;i<a.length;i++)
	{
		if(a.item(i).ischeck)
		{
			if(a.item(i).value=="0"){alert("请填写:"+a.item(i).altname+"!");return false;	}			
		}
	}
	if(!checkfysx()){alert("请填写申请复议事项!");return false;}
	if(!checkajgllb()){alert("请填写行政管理类别!");return false;}
	return true;
}
function getUser(){
	var name =encodeURIComponent(document.getElementById("appstring").value);
	if(name==""){
		alert("请填写被接待人！")
	}else{
		window.open ("../jds/checkApplication.action?appString="+name,'newwindow','height=300,width=400,top=300,left=300,toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes'); 
	}
}


function saveNew(id){ 
	listForm_= document.getElementById("form1");	
	listForm_.action="saveEmail.action?xzfyId=" + id;
	if(confirm("您确认保存吗?"))
	listForm_.submit();
		
	}
	
function scjlchange(){
	if(document.getElementById("scresult").value==4){
	senddept.style.display='block';
	senddept1.style.display='block';
	document.getElementById("sendtbody").style.display="block";
	//sendnotuse.style.display='none';
	//shencha.style.display='none';
	//buzheng.style.display='none';
	//setNotsend();
	}
	else{
	senddept.style.display='none';
	senddept1.style.display='none';
	document.getElementById("sendtbody").style.display="none";
	document.getElementById("senddept3").value="";
	//sendnotuse.style.display='block';
	//shencha.style.display='block';
	//setNotsend_n();
	}
}


function setBuzheng(ev){
	var udiv=document.getElementById("bzDiv");
	var userspan=document.getElementById("bzspan");
	var areaObject=document.getElementById("bznr");
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	}
	if(udiv.style.display!="block"){
		ev = ev || window.event;
		var mousePos = getPosition(areaObject);
		udiv.style.position = "absolute";
		udiv.style.top      = mousePos.y+20;
		udiv.style.left     = mousePos.x+20;
		udiv.style.display="block";
		userspan.style.display="none";
		closeSelect();
	}
}



function setAdvice(ev){
	var udiv=document.getElementById("adviceDiv");
	var userspan=document.getElementById("advicespan");
	var areaObject=document.getElementById("handle_detail");
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	}
	if(udiv.style.display!="block"){
	ev = ev || window.event;
	var mousePos = getPosition(areaObject);
	udiv.style.position = "absolute";
	udiv.style.top      = mousePos.y+20;
	udiv.style.left     = mousePos.x+180;
	udiv.style.display="block";
	userspan.style.display="none";
	closeSelect();
	}
}

function addbz(advice){
	var bzDiv=document.getElementById("bzDiv");
	var filelist=bzDiv.getElementsByTagName("input");
	var bzString="";
	var count=1;
	for(var j=0;j<filelist.length;j++){
		if(filelist.item(j).type=="checkbox"){
			if(filelist.item(j).checked==true){
				bzString=bzString+count+"、"+filelist.item(j).value+"\n";
				count++;
			}
		}
	}
	document.getElementById("bznr").value=bzString;
	//document.getElementById("bznr").value=document.getElementById("bznr").value+advice+"\n";
}

function closeAdvice(){
	var userspan=document.getElementById("advicespan");
	userspan.style.display="block";
	document.getElementById("adviceDiv").style.display="none";
	openSelect();
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="block";
		}
	}
}

function closeBz(){
	var userspan=document.getElementById("bzspan");
	userspan.style.display="block";
	document.getElementById("bzDiv").style.display="none";
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="block";
		}
	}
	openSelect();
}
function recheckBz(){
	document.getElementById("bznr").value="";
}

function rechekAadvice(){
	document.getElementById("handle_detail").value="";

}

function addAdvice(advice){
	document.getElementById("handle_detail").value=advice;
}
function showTiaojie(){
	var tiaojie = document.getElementById("tiaojie").value;
	if(tiaojie=="1"||tiaojie=="2"){
		document.getElementById("otherDetail").style.display="block";	
		document.getElementById("otherDetail2").style.display="block";
	}else{
		document.getElementById("otherDetail").style.display="none";
		document.getElementById("otherDetail2").style.display="none";	
	}
}

function key(){
	var key1 = document.getElementById("keyword").value;
	if(key1=="1")
	{
		document.getElementById("keyword1").style.display="block";
		document.getElementById("key2").style.display="none";
		document.getElementById("key3").style.display="none";
		//document.getElementById("jiedai").style.display="none";
	}
	else{
	if(key1=="2"){
	document.getElementById("keyword1").style.display="none";
	document.getElementById("key2").style.display="block";
	document.getElementById("key3").style.display="none";
	//document.getElementById("jiedai").style.display="block";
	}
		else{
			if(key1=="3"){
			document.getElementById("keyword1").style.display="none";
			document.getElementById("key2").style.display="none";
			document.getElementById("key3").style.display="block";
			//document.getElementById("jiedai").style.display="none";
				}
			else{
				document.getElementById("keyword1").style.display="none";
				document.getElementById("key2").style.display="none";
				document.getElementById("key3").style.display="none";
				//document.getElementById("jiedai").style.display="none";
			}
			}
	}
}
function dispose()
{
	var disList = document.getElementsByName("xzfyInfo.reception");
	for(var i=0;i<disList.length;i++){
		if(disList.item(i).checked==true){
			if(disList.item(i).value=="1"){
				document.getElementById("reception1").style.display="block";
			}else{
				document.getElementById("reception1").style.display="none";
			}
		}
	}
}

function check_shencha(idValue){
	if(idValue==1)
		document.getElementById("shencha").style.display="block";
	else
		document.getElementById("shencha").style.display="none";

}
function checksqr(){
	if(document.getElementById("applicationtype").value==2){
		document.getElementById("sqr").style.display="block";
		document.getElementById("shenqingren1").style.display="none";
		document.getElementById("daibiaorendiv").style.display="none";
	}else{
		document.getElementById("sqr").style.display="none";
		document.getElementById("shenqingren1").style.display="block";
		renCount();
	}
}

function renCount()
{

	var cc = document.getElementById("rencount").value;
		for(var j=0; j<cc.length; j++)
		{
			if(cc.charAt(j)<'0' || cc.charAt(j)>'9')
			{
				alert("请输入数字");
				document.getElementById("rencount").value=1;
				return false;
			}else{
					if(cc>=6)
					{	
						document.getElementById("duoren_y").value="是";
						document.getElementById("daibiaorendiv").style.display="block";
					}
					else
					{
						document.getElementById("duoren_y").value="否";
						document.getElementById("daibiaorendiv").style.display="none";
					}
			}
		}


}
</script>
</html>
