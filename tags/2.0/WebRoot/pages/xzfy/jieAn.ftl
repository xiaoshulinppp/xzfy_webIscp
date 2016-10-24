<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>立案审理</title>

<SCRIPT src="../css/01/setday.js"></SCRIPT>
<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/16B/prototype.js"></script>
<SCRIPT language=JavaScript src="../pages/xzfy/js/function.js"></SCRIPT>
<style>
.diva{
BORDER:#bfceff 1px solid;
height:22;
FILTER:progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr='#ddecfb',endColorStr='#ffffff');
PADDING-TOP: 3px; 
}
.divb{
BORDER: #bfceff 1px solid;
PADDING-TOP: 10px; 
PADDING-LEFT: 10px;
FONT-SIZE: 12px;
HEIGHT: 100px;
width:180;
border-top:0;
}
</style>

<SCRIPT language=JavaScript src="../pages/fzb/js/function.js"></SCRIPT>
<!--javascript脚本添加位置。-->
<SCRIPT LANGUAGE="JavaScript">
<!--
function toggle(id) {
theObj = document.getElementById(id).style;
if ( theObj.display == "none" ) theObj.display = "block"; else theObj.display = "none";
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

//-->
function checksqr(){
	if(document.getElementById("applicationtype").value==1){
		document.getElementById("appspan1").style.display="block"
		document.getElementById("appspan2").style.display="none"
	}else{
		document.getElementById("appspan2").style.display="block"
		document.getElementById("appspan1").style.display="none"		
	}
}

function checkdlr(){
	if(document.getElementById("isdlr").value==1){
	
		document.getElementById("jddlr").style.display="block";
	}else{
		document.getElementById("jddlr").style.display="none";
		document.getElementById("jddlr1").style.display="none";
	}
}

function checkdlr1(){

	if(document.getElementById("dlrsq").value==3){
		document.getElementById("jddlr1").style.display="block";
	}else{
		document.getElementById("jddlr1").style.display="none";
	}
}

function check_request(){
	if(document.getElementById("request").value==2){
	alert(123)
		document.getElementById("requesttype").style.display="block";
		document.getElementById("requesttype2").style.display="block";
	}else{
		document.getElementById("requesttype").style.display="none";
		document.getElementById("requesttype2").style.display="none";
	}
}

String.prototype.trim = function() { 
return this.replace(/(^[\uFEFF|\u00A0|\s]*)|([\uFEFF|\u00A0|\s]*$)/g, ""); 
}; 


function check_pc(cv){
	if(cv==1)
	{
		document.getElementById("peichang_div").style.display="block";
	}else{
		document.getElementById("peichang_div").style.display="none";
	}
}

function cal() { 
var ipt1 = document.getElementById("addbegin").value; 
var ipt2 = document.getElementById("addend1").value; 

if (ipt1.trim() == "" || ipt2.trim() == "") { 
return 3; 
} 
var arr1 = ipt1.split("-"); 
var arr2 = ipt2.split("-"); 

var dt1 = new Date(); 
dt1.setFullYear(arr1[0]); 
dt1.setMonth(arr1[1] - 1); 
dt1.setDate(arr1[2]); 

var dt2 = new Date(); 
dt2.setFullYear(arr2[0]); 
dt2.setMonth(arr2[1] - 1); 
dt2.setDate(arr2[2]); 

var dif = dt2.getTime() - dt1.getTime(); 
var days = dif / (24 * 60 * 60 * 1000); 
alert(days);
return  days; 
} 

function checkDr(ck){
	if(ck==1){
		 document.getElementById("duoren3").style.display="block";	
		 document.getElementById("duoren4").style.display="block";	
		 document.getElementById("daibiaorendiv").style.display="block";
	}else{
		 document.getElementById("duoren3").style.display="none";	
		 document.getElementById("duoren4").style.display="none";
		 document.getElementById("daibiaorendiv").style.display="none";
	}
}

</script>
<!--javascript脚本添加位置结束。-->
</head>

<script type="text/javascript" src="../js/floder/prototype.js"></script>
<script type="text/javascript" src="../js/floder/effects.js"></script>
<script type="text/javascript" src="../js/floder/validation_cn_utf-8.js"></script>

<body>
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control>
  <tr>
    <td height="20">您的位置：行政复议案件管理 -&gt; 案件办理</td>
  </tr>
</table>
<!--您的位置表格结束-->
<!--标题表格开始-->
<!--标题表格结束-->
<!--主体内容、列表显示区域-->

<input id="conutAppname" type=hidden name="conutAppname">

<#--
<input name="app_face.TAdd" type="hidden" id="Tadd" value="0"/ >
<input id="appstring" type=hidden name="appString">
<input name="app_face.appType" type="hidden" value="1" id="appType"/ >
<input type="hidden" name="appType" id="appType" value="1" />
<input name="app_face.TId" type="hidden" class="inputTextNormal" title="请输入正确的姓名，格式在20个汉字以内" value="">
<input type="hidden" name="date" value="${date}" id="facedate"/>
<input name="app_face.TAppFyOrg" type="hidden" class="inputTextNormal" value='6' />
-->

<!-- 被申请人部门id -->
<input name="xzfyInfo.TApplicationDeptID" type="hidden" class="inputTextNormal" id="deptid" />
<!-- 状态 -->
<input type="hidden" name="sta" id="sta" value="11" />
<input id="xzfyId" name="xzfyInfo.id" value="${xzfyInfo.id}" type="hidden">
<input type="hidden" name="funcCode" value="${funcCode}" />
   
 <div id="kkk1" style="display:block">
 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td height="24" align="center">案件信息</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">

<tr class="trcolor">
     <td class="tdFormText" width="25%">接待日期：</td>
    <td class="tdFormInput" width="25%">
    <input name="xzfyInfo.receive_date" type="text"
     id="receivedate" class="inputTextNormal" ischeck="y"
    onClick="WdatePicker()" altname="接待日期" value="${xzfyInfo.receive_date?default('')}">
      </td>
    
    <td class="tdFormText">接待地点：</td>
	    <td class="tdFormInput">
	    <input name="xzfyInfo.receive_address" type="text" id="place" class="inputTextNormal" value="${xzfyInfo.receive_address?default('')}" title="请输入正确的姓名，格式在50个汉字以内">
	    </td>
  </tr>
 <#--
<tr class="trcolor" style="display:none">
    <td class="tdFormText" width="25%">接待月：</td>
    <td class="tdFormInput" width="25%">
    <input name="app_face.count_month" id='countMonth' type="text" class="inputTextNormal" ischeck="y" value=${countMonth} onchange='countNum(this.id)' maxlength=5>
    </td>
    
    <td class="tdFormText" width="25%">接待周次：</td>
    <td class="tdFormInput" width="25%">
    <input name="app_face.count_day" type="text" id='countDay' class="inputTextNormal" ischeck="y" value=${countDay} onchange='countNum(this.id)' maxlength=5>
<input name="app_face.count_year" type="hidden" class="inputTextNormal" ischeck="y" value=${countYear}>
    </td>
  </tr>
  -->
    <tr class="trcolor">
  	<td class="tdFormText">接待人：</td>
    <td class="tdFormInput">
    <input name="xzfyInfo.admit1" id="admit" type="text" class="inputTextNormal" value="${xzfyInfo.admit1?default('')}" ischeck="y"  altname="接待人">    
   </td>
   <td class="tdFormText">第二接待人：</td>
    <td class="tdFormInput">
    <input name="xzfyInfo.admit2" id="admit2" type="text" class="inputTextNormal" value="${xzfyInfo.admit2?default('')}" altname="第二接待人" readonly>    
   </td>   
    </tr>	
<tr class="trcolor">
    <td class="tdFormText" width="25%">被接待人：</td>
    <td class="tdFormInput" width="25%">
    <a href="javascript:setUser1()" style="display:block" id="userspan">添加</a>
    <textarea name="xzfyInfo.jd_detail" type="text" class="textarea"  id="user" ischeck="y" altname="被接待人" style="width:300px;overflow-y:visible;">${xzfyInfo.jd_detail?default('')}</textarea>
    </td>
    <td class="tdFormText">接待人数：</td>
    <td class="tdFormInput"><input name="xzfyInfo.applicationsum" type="text"
     id="applicationsum" class="inputTextNormal required validate-digits" altname="接待人数" value="${xzfyInfo.applicationsum?default('')}">
   </td>  
  </tr>
     <tr class="trcolor" style="display:none">
   <td class="tdFormText">多人复议：</td>
    <td class="tdFormInput">
<input name="xzfyInfo.ismany" id="duoren_y" value="${xzfyInfo.ismany?default('')}">
    </tr>
  <tr class="trcolor">

	 <td class="tdFormText" >涉及安全：</td>
    <td class="tdFormInput" colspan=3>
    <#if xzfyInfo.issafe?exists && xzfyInfo.issafe == "是">
    <input name="xzfyInfo.issafe" id="anquany_y"  value="是" onclick="setAqf(1)" type="radio" class="radio" checked>&nbsp;&nbsp;是
    <input name="xzfyInfo.issafe" id="anquany_n"  value="否" onclick="setAqf(2)" type="radio" class="radio">&nbsp;&nbsp;否
    <span id="aqspan"  style="display:block">
	 <a href="javascript:setAqf(1)">添加</a><br>
	    <textarea name="xzfyInfo.safe_content" type="text" class="textarea"  id="aqcontent" altname="安全隐患" style="width:300px;overflow-y:visible;" onchange="textCounter(this.form.comment,1000);">${xzfyInfo.safe_content?default('')}</textarea>
	</span>
    <#else>
    <input name="xzfyInfo.issafe" id="anquany_y"  value="是" onclick="setAqf(1)" type="radio" class="radio">&nbsp;&nbsp;是
    <input name="xzfyInfo.issafe" id="anquany_n"  value="否" onclick="setAqf(2)" type="radio" class="radio" checked>&nbsp;&nbsp;否
    <span id="aqspan"  style="display:none">
	 <a href="javascript:setAqf(1)">添加</a><br>
	    <textarea name="xzfyInfo.safe_content" type="text" class="textarea"  id="aqcontent" altname="安全隐患" style="width:300px;overflow-y:visible;" onchange="textCounter(this.form.comment,1000);">${xzfyInfo.safe_content?default('')}</textarea>
	</span>
    </#if>
    </td>
  </tr>
   <tr class="trcolor">
	   <td class="tdFormText">申请人类别：</td>
	   <td class="tdFormInput">
	   
	   <@ww.select  name="'xzfyInfo.app_type'" id="applicationtype" headerKey="''" headerValue=""  list="getDictMap('sqrlb')" value="'${xzfyInfo.app_type?default('')}'.toString()" onchange="'checksqr()'"/>
	   
	   <#--
	   <select name="app_face.applicationtype" id="applicationtype" class="selectStyleNormal" ischeck="y" altname="申请人类别" onchange="checksqr()">
		   <option value="1" selected>公民</option>
		   <option value="2">法人或其他组织</option>
	   </select>
	   -->
	   </td>
	   <td class="tdFormText">申请人人数：</td>
    <td class="tdFormInput">
      <input name="xzfyInfo.rencount" id="rencount" onBlur="renCount()" onchange="setCountAppname('shenqingren','rencount')"   type="text" class="inputTextNormal" altname="申请人人数"
      value="${xzfyInfo.rencount?default('')}">
    </td>
   </tr>
    <tr class="trcolor" id="shenqingren1">
  	<td class="tdFormText">申请人：</td>
    <td class="tdFormInput" colspan=3>
    <a href="javascript:opendg('../xzfy/addApp.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=1&textId=shenqingren&countId=rencount',900,600)"  style="display:block" id="appspan1">添加</a>
    <a href="javascript:opendg('../xzfy/addLegal.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=2&textId=shenqingren&countId=rencount',900,600)"  style="display:none" id="appspan2">添加</a>
    <textarea name="xzfyInfo.appdetail" type="text" class="textarea" id="shenqingren" ischeck="y" altname="申请人" >${xzfyInfo.appdetail?default('')}</textarea>
    </td>
   </tr>
   <#if xzfyInfo.agentDetail?exists && xzfyInfo.agentDetail?has_content>
	<tbody id="daibiaorendiv">
	    <tr class="trcolor"> 
		    <td class="tdFormText">代表人和联系人：</td>
		    <td class="tdFormInput" colspan=3>
		    <a href="javascript:opendg('../xzfy/addDeputy.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=1&textId=deputy&deputy=1',900,600)"  style="display:block" id="appspan1">添加</a>
    		<textarea name="xzfyInfo.agentDetail" type="text" class="textarea"  id="deputy" ischeck="y" altname="代表人" style="width:300px;overflow-y:visible;">${xzfyInfo.agentDetail?default('')}</textarea>
		    </td>
	    </tr>
   	</tbody> 
   <#else>
   	<tbody id="daibiaorendiv" style="display:none">
	    <tr class="trcolor"> 
		    <td class="tdFormText">代表人和联系人：</td>
		    <td class="tdFormInput" colspan=3>
		    <a href="javascript:opendg('../xzfy/addDeputy.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=1&textId=deputy&deputy=1',900,600)"  style="display:block" id="appspan1">添加</a>
    		<textarea name="xzfyInfo.agentDetail" type="text" class="textarea"  id="deputy" ischeck="y" altname="代表人" style="width:300px;overflow-y:visible;">${xzfyInfo.agentDetail?default('')}</textarea>
		    </td>
	    </tr>
  	 </tbody> 
   </#if>
   
  <tr class="trcolor">
   <td class="tdFormText">是否有代理人：</td>
    <td class="tdFormInput">
    <@ww.select name="'xzfyInfo.agent'" id="isdlr" headerKey="''" headerValue=""  list="getDictMap('sfdlr')" value="'${xzfyInfo.agent?default('')}'.toString()" onchange="'checkdlr()'"/>
    <#--
    <select name="xzfyInfo.agent" id="isdlr" onclick="checkdlr()">
    <option value="0">无</option>
    <option value="1">有</option>
    </select>
    <td class="tdFormText">代理人：</td>
	<td class="tdFormInput"><input name="app_face.TAgent"  type="text" class="inputTextNormal" altname="代理人" maxlength="50" value='无'></td>
  -->
  </td>
   <td class="tdFormText">&nbsp;</td>
	<td class="tdFormInput">&nbsp;</td>
  </tr>	
  <#if xzfyInfo.agent?exists && xzfyInfo.agent == "1">
  <tr class="trwhite" id="jddlr" >
    <td class="tdFormText">委托代理人姓名：</td>
    <td class="tdFormInput">
      <input name="xzfyInfo.agent_name" type="text" id="dlrname" class="inputTextNormal" altname="委托代理人姓名项" value="${xzfyInfo.agent_name?default('')}">
    </td>
    <td class="tdFormText">是否有授权委托书：</td>
    <td class="tdFormInput">
      <@ww.select name="'xzfyInfo.proxy'" id="dlrsq" headerKey="'0'" headerValue="'--请选择--'"  list="getDictMap('sfwtsqs')" value="'${xzfyInfo.proxy?default('')}'.toString()" onchange="'checkdlr1()'"/>
      <#--
	  <select name="xzfyInfo.proxy"  id="dlrsq" onchange="checkdlr1()" retSelect="1">
	    <option value="0">----请选择----</option>
	    <option value="1">无委托</option>
	 	<option value="2">口头委托</option>
	 	<option value="3">特殊情况口头委托</option>
	 	<option value="4">书面委托</option>
	  </select>
	  -->
    </td>
  </tr>
  <#else>
  <tr class="trwhite" id="jddlr" style="display:none">
    <td class="tdFormText">委托代理人姓名：</td>
    <td class="tdFormInput">
      <input name="xzfyInfo.agent_name" type="text" id="dlrname" class="inputTextNormal" altname="委托代理人姓名项" value="${xzfyInfo.agent_name?default('')}">
    </td>
    <td class="tdFormText">是否有授权委托书：</td>
    <td class="tdFormInput">
      <@ww.select name="'xzfyInfo.proxy'" id="dlrsq" headerKey="'0'" headerValue="'--请选择--'"  list="getDictMap('sfwtsqs')" value="'${xzfyInfo.proxy?default('')}'.toString()" onchange="'checkdlr1()'"/>
      <#--
	  <select name="xzfyInfo.proxy"  id="dlrsq" onchange="checkdlr1()" retSelect="1">
	    <option value="0">----请选择----</option>
	    <option value="1">无委托</option>
	 	<option value="2">口头委托</option>
	 	<option value="3">特殊情况口头委托</option>
	 	<option value="4">书面委托</option>
	  </select>
	  -->
    </td>
  </tr>
  </#if>
  <#if xzfyInfo.proxy?exists && xzfyInfo.proxy=="3">
  <tr class="trwhite" id="jddlr1">
    <td class="tdFormText">委托时间：</td>
    <td class="tdFormInput">
     <input name="xzfyInfo.agent_date" type="input" id="wtsj" value="${xzfyInfo.agent_date?default('')}">
     <select name="wtsj1" id="wtsj1" onchange='setWtDate1()' retSelect="1">
	    	<option value="0">选择年</option>
			<option value="1997">1997</option>
	    	<option value="1998">1998</option>
		 	<option value="1999">1999</option>
		 	<option value="2000">2000</option>
		 	<option value="2001">2001</option>
		 	<option value="2002">2002</option>
		 	<option value="2003">2003</option>
		 	<option value="2004">2004</option>
		 	<option value="2005">2005</option>
		 	<option value="2006">2006</option>
		 	<option value="2007">2007</option> 
		 	<option value="2008">2008</option>
		 	<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
	</select>
	<select name="wtsj2" id="wtsj2" onchange='setWtDate1()' retSelect="1">
			<option value="0">选择月</option>
	    	<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
	</select>
	<select name="wtsj3" id="wtsj3" onchange='setWtDate1()' retSelect="1">
			<option value="0">选择日</option>
	    	<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		 	<option value="13">13</option>
		 	<option value="14">14</option>
		 	<option value="15">15</option>
		 	<option value="16">16</option>
		 	<option value="17">17</option>
		 	<option value="18">18</option>
		 	<option value="19">19</option>
		 	<option value="20">20</option>
		 	<option value="21">21</option>
			<option value="22">22</option>
		 	<option value="23">23</option>
		 	<option value="24">24</option>
		 	<option value="25">25</option>
		 	<option value="26">26</option>
		 	<option value="27">27</option>
			<option value="28">28</option>
		 	<option value="29">29</option>
		 	<option value="30">30</option>
			<option value="31">31</option>
		</select></td>
    <td class="tdFormText">地点：</td>
    <td class="tdFormInput">
    <input name="xzfyInfo.agent_address" type="text" id="wtdd"
    class="inputTextNormal" altname="地点" value="${xzfyInfo.agent_address?default('')}"></td>
  </tr>
  <#else>
  <tr class="trwhite" id="jddlr1" style="display:none">
    <td class="tdFormText">委托时间：</td>
    <td class="tdFormInput">
     <select name="wtsj1" id="wtsj1" onchange='setWtDate1()' retSelect="1">
	    	<option value="0">选择年</option>
			<option value="1997">1997</option>
	    	<option value="1998">1998</option>
		 	<option value="1999">1999</option>
		 	<option value="2000">2000</option>
		 	<option value="2001">2001</option>
		 	<option value="2002">2002</option>
		 	<option value="2003">2003</option>
		 	<option value="2004">2004</option>
		 	<option value="2005">2005</option>
		 	<option value="2006">2006</option>
		 	<option value="2007">2007</option> 
		 	<option value="2008">2008</option>
		 	<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
	</select>
	<select name="wtsj2" id="wtsj2" onchange='setWtDate1()' retSelect="1">
			<option value="0">选择月</option>
	    	<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
	</select>
	<select name="wtsj3" id="wtsj3" onchange='setWtDate1()' retSelect="1">
			<option value="0">选择日</option>
	    	<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		 	<option value="13">13</option>
		 	<option value="14">14</option>
		 	<option value="15">15</option>
		 	<option value="16">16</option>
		 	<option value="17">17</option>
		 	<option value="18">18</option>
		 	<option value="19">19</option>
		 	<option value="20">20</option>
		 	<option value="21">21</option>
			<option value="22">22</option>
		 	<option value="23">23</option>
		 	<option value="24">24</option>
		 	<option value="25">25</option>
		 	<option value="26">26</option>
		 	<option value="27">27</option>
			<option value="28">28</option>
		 	<option value="29">29</option>
		 	<option value="30">30</option>
			<option value="31">31</option>
		</select>
    <input name="xzfyInfo.agent_date" type="hidden" id="wtsj"></td>
    <td class="tdFormText">地点：</td>
    <td class="tdFormInput">
    <input name="xzfyInfo.agent_address" type="text" id="wtdd"
    class="inputTextNormal" altname="地点" value=""></td>
  </tr>
  </#if>
<tr class="trcolor">
   <td class="tdFormText" width="25%">被申请人种类：</td>
   <td class="tdFormInput" width="25%">
     <@ww.select name="'xzfyInfo.defendant_type'" id="beapptype"  headerKey="'0'" headerValue="'--请选择--'"  list="getDictMap('bsqrzl')" value="'${xzfyInfo.defendant_type?default('')}'.toString()" onchange="'aaa(document.getElementById('beapptype').options[document.getElementById('beapptype').selectedIndex].value)'"/>
     <#--     
	   <select name="xzfyInfo.defendant_type" id="beapptype" ischeck="y"
	    altname="被申请人种类" class="selectStyleNormal" 
	    onchange="aaa(document.getElementById('beapptype').options[document.getElementById('beapptype').selectedIndex].value)">
	     <option value="0">----请选择----</option>
		 <option value="1">乡镇政府</option>
		 <option value="2">县级政府</option>
		 <option value="3">县级政府部门</option>
		 <option value="6">省部级行政机关</option>
		 <option value="7">省级政府部门</option>
		 <option value="9">市经济技术开发区管委会</option>
		 <option value="8">其他</option>
	   </select>
	  -->
   </td>
   <td class="tdFormText" width="25%">被申请人名称：</td>
   <td class="tdFormInput" style="display:block;" id="beappnametd" width="25%">   
     <input name="ssss" type="text" class="inputTextNormal" id="beappnameinput" altname="被申请人名称" value="${xzfyInfo.defendant_name?default('')}">
  
     <select name="ssss" ischeck="y" id="beappname"
      onchange="beappcode()" altname="被申请人名称" class="selectStyleNormal">
      <option value="0" deptcode="0">----请选择----</option> 	 
     </select>    
   </td>
    
    <td class="tdFormInput" style="display:none;" id="beappnametd">
   <input name="sss" type="text" class="inputTextNormal" id="beappname2" >
    </td>
    </tr>

  <tr class="trcolor" id="mingan">
    <td class="tdFormText">是否行政不作为：</td>
    <td class="tdFormInput">
    <@ww.select  name="'xzfyInfo.ismanage'" id="requestrrr" headerKey="''" headerValue=""  list="getDictMap('sfbzw')" value="'${xzfyInfo.ismanage?default('')}'.toString()" onchange="'szfyqq()'"/>
    <#-- 
     <select name="xzfyInfo.ismanage" onchange="szfyqq()" id="requestrrr">
       <option value="0">否</option>
	   <option value="2">是</option>
  	 </select>
  	-->
	</td>
     <td class="tdFormText">要求复议的具体行政行为情况：</td>
	    <td class="tdFormInput">
	      <a href="javascript:getBzw()" id="getBzw" style="display:none">添加 </a>
  	 	  <a href="javascript:closeBzw()" id="closeBzw" style="display:none">完成 </a>
		  <span id='xwspan'><a href="javascript:openXw()">添加</a></span>
		  <span id="xw_an">
		    ${xzfyInfo.require_fy?default('')}
		    <input type="hidden" id="require_fy" name="xzfyInfo.require_fy" value="">
		  </span>
	    </td>
	   </tr>
  <tr class="trcolor" style="display:none">
    <td class="tdFormText">被复议的具体行为-名称：</td>
    <td class="tdFormInput"><input name="app_face.shenqingrenplace" id="xingwei1" type="text"></td>
     <td class="tdFormText">知道时间：</td>
    <td class="tdFormInput"><input name="app_face.renpost" type="text" id="xingwei2" ></td>
  </tr>

  <tr class="trcolor" style="display:none">
    <td class="tdFormText">被复议的具体行为-名称：</td>
    <td class="tdFormInput"><input name="app_face.TBeName" id="xingwei" type="text"  altname="被复议的具体行为-名称" class="inputTextNormal" title="请输入正确的名称"></td>
     <td class="tdFormText">被复议的具体行为-案号：</td>
    <td class="tdFormInput"><input name="app_face.annum" type="text" id="annum" class="inputTextNormal"   altname="案号" ></td>
  </tr>
  
  <tr class="trcolor" style="display:none">
	<td class="tdFormText" >知道时间：</td>
	    <td class="tdFormInput">
	    	<input name="app_face.zhidaodate" type="text"
		     id="zhidaodate" class="inputTextNormal" 
		      altname="知道时间">
	    </td>
	    <td class="tdFormText">要求被申请人履行日期：</td>
	    <td class="tdFormInput">
		<input name="xzfyInfo.execute_date" type="text"
		     id="usedate" class="inputTextNormal"
		      altname="要求被申请人履行日期">
	   </td>
  </tr>
  
  <tbody id="sendnotuse" style="display:block;">
  <tr class="trcolor" id="requesttype" style="display:none">
     <td class="tdFormText2">行政管理类别：</td>
	    <td class="tdFormInput2"> 
	    <select name="xzfyInfo.manage_type" id="cardnum" >
	    <option value="0">-请选择-</option>
			<option value="公安治安">公安治安</option>
			<option value="公安劳教">公安劳教</option>
			<option value="公安其他">公安其他</option>
	    		<option value="国家安全">国家安全</option>
		 	<option value="劳动和社会保障">劳动和社会保障</option>
		 	<option value="司法行政">司法行政</option>
		 	<option value="民政">民政</option>
		 	<option value="农林环资土地">农林环资土地</option>
		 	<option value="农林环资地矿">农林环资地矿</option>
		 	<option value="农林环资环保">农林环资环保</option>
		 	<option value="农林环资农业">农林环资农业</option>
		 	<option value="农林环资水利">农林环资水利</option>
		 	<option value="农林环资林业">农林环资林业</option>
		 	<option value="农林环资其他">农林环资其他</option>
		 	<option value="城建规划">城建规划</option>
			<option value="城建拆迁">城建拆迁</option>
			<option value="城建房屋登记">城建房屋登记</option>
			<option value="城建其他">城建其他</option>
			<option value="工交商事工商">工交商事工商</option>
			<option value="工交商事质监">工交商事质监</option>
			<option value="工交商事商务">工交商事商务</option>
			<option value="工交商事物价">工交商事物价</option>
			<option value="工交商事能源">工交商事能源</option>
			<option value="工交商事交通">工交商事交通</option>
			<option value="工交商事信息产业">工交商事信息产业</option>
			<option value="工交商事邮政">工交商事邮政</option>
			<option value="工交商事烟草专卖">工交商事烟草专卖</option>
			<option value="财政金融税务">财政金融税务</option>
			<option value="财政金融人民银行">财政金融人民银行</option>
			<option value="财政金融证监">财政金融证监</option>
			<option value="财政金融保监">财政金融保监</option>
			<option value="财政金融银监">财政金融银监</option>
			<option value="工交商事能源">工交商事能源</option>
			<option value="财政金融外汇">财政金融外汇</option>
			<option value="财政金融财政">财政金融财政</option>
			<option value="财政金融统计">财政金融统计</option>
			<option value="财政金融审计">财政金融审计</option>
			<option value="财政金融海关">财政金融海关</option>
			<option value="财政金融商检">财政金融商检</option>
			<option value="教科文卫药监">教科文卫药监</option>
			<option value="教科文卫卫生">教科文卫卫生</option>
			<option value="教科文卫计划生育">教科文卫计划生育</option>
			<option value="财政金融海关">财政金融海关</option>
			<option value="财政金融商检">财政金融商检</option>
			<option value="教科文卫药监">教科文卫药监</option>
			<option value="教科文卫卫生">教科文卫卫生</option>
			<option value="教科文卫计划生育">教科文卫计划生育</option>
			<option value="教科文卫教育">教科文卫教育</option>
			<option value="教科文卫文化">教科文卫文化</option>
			<option value="教科文卫专利">教科文卫专利</option>
			<option value="教科文卫商标">教科文卫商标</option>
			<option value="教科文卫版权">教科文卫版权</option>
			<option value="其他">其他</option>
		</select>
	    </td>
	    <td class="tdFormText2">&nbsp;</td>
   <td  class="tdFormInput2">&nbsp; </td>
	   </tr>

  <tr class="trwhite" id="requesttype2" style="display:none">
   <td class="tdFormText2">不作为事项：</td>
   <td  class="tdFormInput2">

  <select name="xzfyInfo.matter_type" id="use_type"  onchange="setBzw()">
         <option value="">----请选择----</option>
	 <option value="不颁发证照">不颁发证照</option>
	 <option value="不审批登记">不审批登记</option>
	 <option value="不保护人身权">不保护人身权</option>
	 <option value="不保护其他财产权">不保护其他财产权</option>
	 <option value="不保护受教育权">不保护受教育权</option>
	 <option value="不发放抚恤金">不发放抚恤金</option>
	 <option value="不发放社会保险金">不发放社会保险金</option>
	 <option value="不发放最低生活保障费">不发放最低生活保障费</option>
	 <option value="不履行信息公开职责">不履行信息公开职责</option>
	 <option value="其他">其他</option>
  </select>
  <textarea class="textarea" name="xzfyInfo.matter_detail" id="bzwbc" style="width:300px;overflow-y:visible;"></textarea>
  </span>
  </td>
	    <td class="tdFormText2">申请人曾经要求被申请人<br>履行何种法定职责：</td>
	    <td class="tdFormInput2" ><textarea name="xzfyInfo.duty" id="zhize" type="text" class="textarea"  style="width:300px;overflow-y:visible;"></textarea>
	    </td>
	    </tr>    
	    <tr class="trcolor" id="requesttype3" style="display:none">
	    <td class="tdFormText2">要求被申请人履行日期：</td>
	    <td class="tdFormInput2">
	    <select name="knowy" id="knowy1" onchange='setKnowDate1()' retSelect="1">
	   		<option value="0">选择年</option>
			<option value="1997">1997</option>
	    	<option value="1998">1998</option>
		 	<option value="1999">1999</option>
		 	<option value="2000">2000</option>
		 	<option value="2001">2001</option>
		 	<option value="2002">2002</option>
		 	<option value="2003">2003</option>
		 	<option value="2004">2004</option>
		 	<option value="2005">2005</option>
		 	<option value="2006">2006</option>
		 	<option value="2007">2007</option> 
		 	<option value="2008">2008</option>
		 	<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
		</select>
		<select name="knowm" id="knowm1" onchange='setKnowDate1()' retSelect="1">
			<option value="0">选择月</option>
	    		<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		</select>
		<select name="knowd" id="knowd1" onchange='setKnowDate1()' retSelect="1">
			<option value="0">选择日</option>
	    		<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		 	<option value="13">13</option>
		 	<option value="14">14</option>
		 	<option value="15">15</option>
		 	<option value="16">16</option>
		 	<option value="17">17</option>
		 	<option value="18">18</option>
		 	<option value="19">19</option>
		 	<option value="20">20</option>
		 	<option value="21">21</option>
			<option value="22">22</option>
		 	<option value="23">23</option>
		 	<option value="24">24</option>
		 	<option value="25">25</option>
		 	<option value="26">26</option>
		 	<option value="27">27</option>
			<option value="28">28</option>
		 	<option value="29">29</option>
		 	<option value="30">30</option>
			<option value="31">31</option>
		</select>
	    </td>
		<td class="tdFormText2">是否有曾要求履责而<br>未履行的证明材料：</td>
	    <td class="tdFormInput2">
	   <select name="xzfyInfo.is_prof" id="ismingque" onchange="ryq2()">
	    <option value="0">----请选择----</option>
	      <option value="有">有</option>
		 <option value="无">无</option>
	  </select>
	    <textarea name="xzfyInfo.is_prof_detail" id="mingque" class="textarea" ></textarea>
	      </td>
	   </tr>
<tr class="trcolor">
    <td class="tdFormText">该具体行政行为侵害&nbsp;&nbsp;&nbsp;&nbsp;<br>申请人何种合法权益：</td>
	    <td class="tdFormInput"><textarea name="xzfyInfo.break_right" id="quanyi" type="text" class="textarea" rowspan="5" onchange="closeBzw1()">${xzfyInfo.break_right?default('')}</textarea>
	    </td>   
   <td  class="tdFormText">行政复议请求：
  </td>
   <td  class="tdFormInput">
   <@ww.select name="'xzfyInfo.xzfy_requset'" id="request2yiban" headerKey="'0'" headerValue="'--请选择--'" value="'${xzfyInfo.xzfy_requset?default('')}'.toString()" list="getDictMap('xzfyqq')" onchange="'ryq();closeBzw1()'"/>
   <#-- 
  <select name="xzfyInfo.xzfy_requset"
  	altname="行政复议请求" class="selectStyleNormal" id="request2yiban" ishidden="y" onchange="ryq();closeBzw1()">
	 <option value="0">----请选择----</option>
	 <option value="1">撤销该具体行政行为</option>
	 <option value="2">变更该具体行政行为</option>
	 <option value="3">确认该具体行政行为违法</option>
	 <option value="4">责令被申请人履行法定职责</option>
	 <option value="5">确认被申请人不履行法定职责违法</option>
	
   </select>
   -->
    <textarea name="xzfyInfo.xzfy_requset_retail" id="xzfyqq1" type="text"  style="width:300px;overflow-y:visible;" class="textarea" altname="行政复议请求" onchange="closeBzw1()">${xzfyInfo.xzfy_requset_retail?default('')}</textarea>
  </td>
  </tr>
  <tr class="trcolor">
    <td class="tdFormText">是否听证：</td>
    <td class="tdFormInput">
      <#if xzfyInfo.istingzheng?exists && xzfyInfo.istingzheng=="是">
	  <input type="radio" name="xzfyInfo.istingzheng" value="是" id="tingzheng_y" ischeck="y" altname="是否听证" checked> 
	  <label for="isting_y">是</label>
	  <input type="radio" name="xzfyInfo.istingzheng" value="否" id="tingzheng_n" ischeck="y" altname="是否听证">
	  <label for="isting_n">否</label>
      <#else>
	  <input type="radio" name="xzfyInfo.istingzheng" value="是" id="tingzheng_y" ischeck="y" altname="是否听证" checked>
	  <label for="isting_y">是</label>
	  <input type="radio" name="xzfyInfo.istingzheng" value="否" id="tingzheng_n" ischeck="y" altname="是否听证">
	  <label for="isting_n">否</label>
      </#if>
    </td>
    <td class="tdFormText">是否行政赔偿：</td>
    <td  class="tdFormInput">
      <#if xzfyInfo.isMoney?exists && xzfyInfo.isMoney=="是">
	   <input type="radio" name="xzfyInfo.isMoney" value="是" id="peichang_y" ischeck="y" altname="是否行政赔偿" onclick="check_pc(1)" checked>
	   <label for="peichang_y">是</label>
	   <input type="radio" name="xzfyInfo.isMoney" value="否" id="peichang_n" ischeck="y" altname="是否行政赔偿" onclick="check_pc(2)" >
	   <label for="peichang_n">否</label>
	  <#else>
	   <input type="radio" name="xzfyInfo.isMoney" value="是" id="peichang_y" ischeck="y" altname="是否行政赔偿" onclick="check_pc(1)">
	   <label for="peichang_y">是</label>
	   <input type="radio" name="xzfyInfo.isMoney" value="否" id="peichang_n" ischeck="y" altname="是否行政赔偿" onclick="check_pc(2)" checked>
	   <label for="peichang_n">否</label>
	  </#if>
    </td>
   </tr>
   
  <#if xzfyInfo.isMoney?exists && xzfyInfo.isMoney=="是">
  <tr class="trcolor" id="peichang_div">
	<td class="tdFormText">赔偿金额：</td>
	<td class="tdFormInput">
	  <input type="text" name="xzfyInfo.money_Detail" id="peichang_count" value="${xzfyInfo.money_Detail?default('')}">
	</td>
	<td class="tdFormText">受损证明材料：</td>
    <td  class="tdFormInput">
    <textarea name="xzfyInfo.money_file" id="peichang_file" class="textarea" style="width:300px;overflow-y:visible;">${xzfyInfo.money_file?default('')}</textarea>
    </td>
  </tr>
  <#else>
  <tr class="trcolor" style="display:none" id="peichang_div">
	<td class="tdFormText">赔偿金额：</td>
	<td class="tdFormInput">
	  <input type="text" name="xzfyInfo.money_Detail" id="peichang_count" value="">
	</td>
	<td class="tdFormText">受损证明材料：</td>
    <td  class="tdFormInput">
    <textarea name="xzfyInfo.money_file" id="peichang_file" class="textarea" style="width:300px;overflow-y:visible;"></textarea>
    </td>
  </tr>
  </#if>


 <tbody id="check_select" style="display:none">
  <tr class="trcolor">
    <td class="tdFormText">接待类别：</td>
    <td class="tdFormInput">
<select name="app_face.othertype" class="selectStyleNormal" retSelect="1">
      <option value="0">----请选择----</option>
	    <option value="1">无明确申请人及被申请人</option>
	    <option value="2">无厉害关系</option>
	    <option value="3">无具体的行政复议请求和理由</option>
	    <option value="4">没有在法定申请期限内提出</option>
	    <option value="5">不属于行政复议范围</option>
	    <option value="6">不属于职责范围</option>
	    <option value="7">其他机关尚未受理的行政诉讼</option>

    </select>
    </td>
   <td class="tdFormText">处理：</td>
   <td class="tdFormInput">
	   <select name="app_face.otherhandle" class="selectStyleNormal">
	      <option value="0">----请选择----</option>
		    <option value="1">劝解并告知途径</option>
		    <option value="2">劝解</option>
		    <option value="3">其他</option>
	    </select>
    </td>
    <tr>
    	<td class="tdFormText">劝解并告知途径：</td>
   		<td class="tdFormInput">
	   		<select name="app_face.gaozhi" class="selectStyleNormal">
		      <option value="0">----请选择----</option>
			    <option value="1">通过司法途径</option>
			    <option value="2">通过民事诉讼途径</option>
			    <option value="3">通过刑事诉讼途径</option>
			    <option value="4">通过行政诉讼途径</option>
			    <option value="5">通过信访途径</option>
			    <option value="6">通过当地政府反映问题</option>
			    <option value="5">通过有关部门举报问题</option>
			    <option value="5">通过纪检监察反映问题</option>
		    </select>
    	</td>
    	<td class="tdFormText">&nbsp;</td>
  		 <td class="tdFormInput">&nbsp;</td>
    </tr>
  </tr>
</tbody>

	<tr class="trcolor">
		<td class="tdFormText">复议前置：</td>
	    <td class="tdFormInput">
	    <#if xzfyInfo.isfront?exists && xzfyInfo.isfront=="是">
		  <input type="radio" name="xzfyInfo.isfront" value="是" id="fyqz_y" ischeck="y" altname="复议前置" checked>
		  <label for="fyqz_y">是 </label>
		  <input type="radio" name="xzfyInfo.isfront" value="否" id="fyqz_n" ischeck="y" altname="复议前置">
	      <label for="fyqz_n">否</label>
	    <#else>
		  <input type="radio" name="xzfyInfo.isfront" value="是" id="fyqz_y" ischeck="y" altname="复议前置">
		  <label for="fyqz_y">是 </label>
		  <input type="radio" name="xzfyInfo.isfront" value="否" id="fyqz_n" ischeck="y" altname="复议前置" checked>
	      <label for="fyqz_n">否</label>
	    </#if>
        </td>
        
        <td class="tdFormText">对规范性文件审查：</td>
	    <td class="tdFormInput">
	    <#if xzfyInfo.ischeck?exists && xzfyInfo.ischeck=="是">
	      <input type="radio" name="xzfyInfo.ischeck" nbzcheck="y" altname="对规范性文件审查" value="是" id="gfsc_y" onclick="check_shencha('1')" checked>
	      <label for="gfsc_y">是 </label>
	      <input type="radio" name="xzfyInfo.ischeck" altname="对规范性文件审查" value="否" nbzcheck="y" id="gfsc_n"  onclick="check_shencha('2')">
	      <label for="gfsc_n">否</label>
		  <span id="shencha">规范文件：
	      <input name="xzfyInfo.check_file" type="text" id="post2" class="inputTextNormal" value="${xzfyInfo.check_file?default('')}"></span>
	    <#else>
	      <input type="radio" name="xzfyInfo.ischeck" nbzcheck="y" altname="对规范性文件审查" value="是" id="gfsc_y" onclick="check_shencha('1')">
	      <label for="gfsc_y">是 </label>
	      <input type="radio" name="xzfyInfo.ischeck" altname="对规范性文件审查" value="否" nbzcheck="y" id="gfsc_n"  onclick="check_shencha('2')" checked>
	      <label for="gfsc_n">否</label>
		  <span id="shencha" style="display:none">规范文件：
	      <input name="xzfyInfo.check_file" type="text" id="post2" class="inputTextNormal" ></span>
	    </#if>
	    </td>
		
	</tr>
  </tr>
 
  <tr class="trcolor">
  
  		<td class="tdFormText">是否愿意接受调解：</td>
    <td class="tdFormInput">
    <@ww.select name="'xzfyInfo.istiaojie'" id="tiaojie" headerKey="''" headerValue="" value="'${xzfyInfo.istiaojie?default('')}'.toString()" list="getDictMap('sftj')" onchange="'showTiaojie();closeBzw1()'"/>
        <#--
        <select name="xzfyInfo.istiaojie" id="tiaojie"  onChange="showTiaojie();;closeBzw1()">
		    <option value="1">案前调解</option>
		    <option value="2">调解</option>
			<option value="3" selected>否</option>
   	 	</select>
   	 	-->
    </td>
    
	<td class="tdFormText">其他复议机关、法院&nbsp;&nbsp;&nbsp;&nbsp;<br>是否受理同一复议申请：</td>
    <td class="tdFormInput">
    <@ww.select name="'xzfyInfo.issame'" id="isshouli" headerKey="''" headerValue=""  list="getDictMap('sfslfysq')" value="'${xzfyInfo.issame?default('')}'.toString()" />
    <#--
    <select name="xzfyInfo.issame" id="isshouli">
    <option value="否">否</option>
    <option value="是">是</option>
    </select>-->
    <textarea name="xzfyInfo.issame_detail" id="shuoming" style="width:260px;overflow-y:visible;" altname="说明">${xzfyInfo.issame_detail?default('')}</textarea>
    </td>
</tr>
<#if xzfyInfo.istiaojie?exists && xzfyInfo.istiaojie=="1">
  <tbody id="otherDetail">	  
	  <tr class="trcolor" >
	    <td class="tdFormText" colspan=4>调解日期自：
	    <input name="xzfyInfo.tiaojie_from" id="addbegin" type="text" onClick="WdatePicker()" size='10'  value="${xzfyInfo.tiaojie_from?default('')}">
	    至：
	    <input name="xzfyInfo.tiaojie_to" id="addend1" type="text"  onClick="WdatePicker()" size='10' value="${xzfyInfo.tiaojie_to?default('')}">
	    我们将于收到申请材料后<input name="xzfyInfo.tiaojie_count" type="text" id="tiaojieDate" size=2 value="${xzfyInfo.tiaojie_count?default('')}">个工作日内尝试案前调解工作，调解期间不计入行政复议受理审查或者行政复议审理期限。
	      </td>
	   
 	 </tr>
  </tbody>
<#else>
  <tbody id="otherDetail" style="display:none">	  
	  <tr class="trcolor" >
	    <td class="tdFormText" colspan=4>调解日期自：
	    <input name="xzfyInfo.tiaojie_from" id="addbegin" type="text" onClick="WdatePicker()" size='10'  value="">
	    至：
	    <input name="xzfyInfo.tiaojie_to" id="addend1" type="text"  onClick="WdatePicker()" size='10'>
	    我们将于收到申请材料后<input name="xzfyInfo.tiaojie_count" type="text" id="tiaojieDate" size=2>个工作日内尝试案前调解工作，调解期间不计入行政复议受理审查或者行政复议审理期限。
	      </td>
 	 </tr>
  </tbody>
</#if>
 <tbody id="otherDetail2" style="display:none">	

</tbody>
 <tr class="trcolor">
  <td class="tdFormText">接待情况：</td>
    <td class="tdFormInput" >
    <@ww.select name="'xzfyInfo.condition_type'" id="handle" headerKey="'0'" headerValue="'--请选择--'"  list="getDictMap('jdqk')" value="'${xzfyInfo.condition_type?default('')}'.toString()" onchange="'check_remark()'"/>
    <#--
	<select name="xzfyInfo.condition_type" id='handle'  onchange="check_remark()">
        <option value="0">----请选择----</option>
	<option value="3">接收</option>
	<option value="1">告知</option>
	<option value="2">补正</option>
    </select>
    -->
    <#if xzfyInfo.condition_type?exists && xzfyInfo.condition_type=="3">
    <a href="javascript:updateFile()" style="display:none" id="filespan">接收材料</a>
 <textarea name="xzfyInfo.jd_file_content" id="filedetail" type="text" class='textarea' style="width:300px;overflow-y:visible;display:none">${xzfyInfo.jd_file_content?default('')}</textarea>
    <#elseif xzfyInfo.condition_type=="1">
    <textarea name="xzfyInfo.jd_gz_content" id="handle_detail" type="text" class='textarea' style="overflow-y:visible;display:none">${xzfyInfo.jd_gz_content?default('')}</textarea>
    <a href="javascript:setAdvice()" style="display:none" id="advicespan">添加意见</a>
    <#elseif xzfyInfo.condition_type=="2">
    <a href="javascript:setBuzheng()" style="display:none" id="bzspan">添加补正内容</a>
	<textarea name="xzfyInfo.jd_bz_content" id="bznr"  style="display:none;" type="text" class="textarea" style="width:300px;overflow-y:visible;">${xzfyInfo.jd_bz_content?default('')}
	</textarea>
    </#if>
</td> 
 <td class="tdFormText">被接待人意见：<br>(鼠标双击添加对话)</td>
    <td class="tdFormInput">
    <@ww.select name="'xzfyInfo.app_advice_type'" id="beadvice" headerKey="'0'" headerValue="'--请选择--'"  list="getDictMap('bjdryj')" value="'${xzfyInfo.app_advice_type?default('')}'.toString()" onchange="'setbjd()'"/>
    <#--
	<select name="xzfyInfo.app_advice_type" id="beadvice" onchange="setbjd()">
      <option value="0">----请选择----</option>
	   <option value="1">同意</option>
	    <option value="4">知道了</option>
	    <option value="2">坚持申请行政复议</option>
	    <option value="3">其他</option>   
    </select>-->
    <textarea name="xzfyInfo.app_advice_detail" id="otheradvice" class="textarea" style="overflow-y:visible;" altname="意见" ondblclick="getValue1(this)">${xzfyInfo.app_advice_detail?default('')}</textarea>
    </td>
 </tr>
 	<!--
	 <tbody id="sendtbody"  style="display:none;">
	 <tr class="trcolor">
	 <td class="tdFormText">&nbsp;</td>
	 <td class="tdFormText">&nbsp;</td>
	 <td class="tdFormText"><span style="display:none;" id="senddept">转送机构名称：</span></td>
         <td class="tdFormInput"><span style="display:none;" id="senddept1">
         <input name="app_face.TOtherDept" id="senddept3" type="text" class="inputTextNormal" title="请输入正确的姓名，格式在20个汉字以内"></span></td>
	 </tr>
	 </tbody>
	  
	 <tr class="trcolor" style="display:none;">
	 <td class="tdFormText" style="display:none">增加对话：</td>
	 <td class="tdFormInput"> <a href="javascript:getAnswer()" id="answerspan">添加 </a><br>
	 <textarea name="app_face.answer" class='textarea' style="overflow-y:visible;" id="answerValue" type="text" ></textarea></td>
	 </tr>
	  -->
	 
	 <tr class="trcolor">
	 <td class="tdFormText">笔录上传：</td>
	 <td class="tdFormInput" > <input name="file" type="file" class="inputTextNormal" UNSELECTABLE="on"></td>
	  <td class="tdFormText">&nbsp;</td>
	 <td class="tdFormInput" >&nbsp;</td>
	 </tr>
      <tbody id="youxing" style="display:none;">
      <tr class="trcolor">
	 <td class="tdFormText">是否游行示威：</td>
	 <td class="tdFormInput"> 
	 <#if xzfyInfo.TPoliceIsparade?exists && xzfyInfo.TPoliceIsparade == "1">
	  <input type="radio" name="xzfyInfo.TPoliceIsparade"  value="1" id="yxsw_y" altname="是否游行示威" checked>
      <label for="xzpc_y">是 </label>
      <input type="radio" name="xzfyInfo.TPoliceIsparade"  value="0" id="yxsw_n" altname="是否游行示威" >
      <label for="xzpc_n">否</label>
	 <#else>
	  <input type="radio" name="xzfyInfo.TPoliceIsparade"  value="1" id="yxsw_y" altname="是否游行示威" >
      <label for="xzpc_y">是 </label>
      <input type="radio" name="xzfyInfo.TPoliceIsparade"  value="0" id="yxsw_n" altname="是否游行示威" checked>
      <label for="xzpc_n">否</label>
	 </#if>
     </td>
	 <td class="tdFormText">&nbsp;</td>
	 <td class="tdFormText">&nbsp;</td>
	 </tr>
	 </tbody>
	 <tr class="trcolor">
		 <td class="tdFormText">统计关键词：</td>
	     <td class="tdFormInput">
	       <@ww.select name="'xzfyInfo.keyword'" id="keyword" headerKey="'0'" headerValue="'--请选择--'"  list="getDictMap('tjgjc')" value="'${xzfyInfo.keyword?default('')}'.toString()" onchange="'countKey()'" onmouseup="'countKey()'"/>
	       <#--
		     <select name="xzfyInfo.keyword" ischeck="y" altname="统计关键词" class="selectStyleNormal" id="keyword" onchange="countKey()" onmouseup="countKey()">
		        <option value="0">----请选择----</option>
			 	<option value="1" >属于复议范围</option>
			    <option value="2">不属于复议范围</option>
			    <option value="3">复议案件审理</option>
			 </select>	--> 
	    <td class="tdFormInput" colspan=2>
	    <span id="countRs">${xzfyInfo.menu?default('')}</span>
	    </td>
    </tr>
<input name="xzfyInfo.menu" type="hidden" id="menuSave">
<tbody id="jdcl1" style="display:none;">
 <tr class="trcolor">
  	<td class="tdFormText">接待处理：</td>
    <td class="tdFormInput">
	当面及电话接待口头告知&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='1' onclick="dispose()"><br>
	书面告知补正&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='2' onclick="dispose();setJDCL(2)"><br>
	接收复议申请材料&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='3' onclick="dispose();setJDCL(3)"><br>
	
  </td>  
  <td class="tdFormInput" colspan="2">
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

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle" >
  <tr>
    <td height="24" align="center">办案信息</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
  <tr class="trcolor">
    <td class="tdFormText" width="25%">是否提交答复：</td>
    <td class="tdFormInput" width="25%">
     <#if xzfyInfo=="是">
			<input type="radio" name="xzfyInfo.isAnswer" value="是" onClick="answerDiv.style.display='block'" checked> <label for="is2_y">是 </label>
			<input type="radio" name="xzfyInfo.isAnswer" value="否" onClick="answerDiv.style.display='none'" > <label for="is2_n">否</label>
     <#else>
			<input type="radio" name="xzfyInfo.isAnswer" value="是" onClick="answerDiv.style.display='block'" > <label for="is2_y">是 </label>
			<input type="radio" name="xzfyInfo.isAnswer" value="否" onClick="answerDiv.style.display='none'" checked> <label for="is2_n">否</label>
     </#if>
    </td>
    <td class="tdFormText" width="25%">&nbsp;</td>
    <td class="tdFormInput" width="25%">&nbsp;</td>
  </tr>
  
<#if xzfyInfo=="是">
  <tr class="trcolor" id="answerDiv" >
    <td class="tdFormText" width="25%">发出答复日期：</td>
    <td class="tdFormInput" width="25%"><input name="xzfyInfo.TAnswerFrom" id="answerfrom" type="text" onClick="WdatePicker()" class="inputTextNormal" value="${xzfyInfo.TAnswerFrom?default('')}">
      </td>
    <td class="tdFormText" width="25%">答复返回日期：</td>
    <td class="tdFormInput" width="25%"><input name="xzfyInfo.TAnswerTo" id="answerfrom" type="text" onClick="WdatePicker()" class="inputTextNormal" value="${xzfyInfo.TAnswerTo?default('')}">
      </td>
  </tr>
<#else>
  <tr class="trcolor" id="answerDiv" >
    <td class="tdFormText" width="25%">发出答复日期：</td>
    <td class="tdFormInput" width="25%"><input name="xzfyInfo.TAnswerFrom" id="answerfrom" type="text" onClick="WdatePicker()" class="inputTextNormal" value="">
      </td>
    <td class="tdFormText" width="25%">答复返回日期：</td>
    <td class="tdFormInput" width="25%"><input name="xzfyInfo.TAnswerTo" id="answerfrom" type="text" onClick="WdatePicker()" class="inputTextNormal" value="">
      </td>
  </tr>
</#if>

  <tr class="trcolor" id="answerDiv1" >
    <td class="tdFormText" width="25%">答复通知：</td>
    <td class="tdFormInput" width="25%">未上传</td>
    <td class="tdFormText" width="25%">&nbsp;</td>
    <td class="tdFormInput" width="25%">&nbsp;</td>
  </tr>

  <tr class="trcolor">
    <td class="tdFormText">审理方式：</td>
    <td class="tdFormInput">
    <@ww.select  name="'xzfyInfo.trailmode'" id="slfsid" headerKey="''" headerValue=""  list="getDictMap('slfs')" value="'${xzfyInfo.trailmode?default('')}'.toString()" onchange="'slfs()'"/>
    <#--
      <select name="xzfyInfo.TCognizanceType" id="slfsid" class="selectStyleNormal" onchange="slfs()">
		  <option value="0" >无</option>
		  <option value="1" >设置听证</option>
		  <option value="2" >会商</option>
		  <option value="3" >会审</option>
		  <option value="4" >专家论证会</option>
		  <option value="5" >协调会</option>
		  <option value="6" >其他审理方式</option>
      </select>
    -->
    </td>
   <#if xzfyInfo.trailmode?exists && xzfyInfo.trailmode="6">
    <td class="tdFormText"><div id="qtslfslabel">其他审理方式：</div></td>
    <td class="tdFormInput">
	  <div id="qtslfsinput" >
	    <input name="xzfyInfo.othertrailmode" type="text" id ="qtslfs" class="inputTextNormal" value="${xzfyInfo.othertrailmode?default('')}">
	  </div>
	  </td>
   <#else>
    <td class="tdFormText"><div id="qtslfslabel" style="display:none">其他审理方式：</div></td>
    <td class="tdFormInput">
	  <div id="qtslfsinput" style="display: none;"  >
	    <input name="xzfyInfo.othertrailmode" type="text" id ="qtslfs" class="inputTextNormal" value="">
	  </div>
	  </td>
   </#if>
  </tr>  

  <tr class="trcolor">
    <td class="tdFormText">承办人意见：</td>
    <td class="tdFormInput"><input name="xzfyInfo.secondSubmitResult" id="secondsubmitresult" type="text" class="inputTextNormal" value="${xzfyInfo.secondSubmitResult?default('')}"></td>
    <td class="tdFormText">承办人提交时间：</td>
    <td class="tdFormInput"><input name="xzfyInfo.secondSubmitDate" id="secondsubmitdate" type="text" onClick="WdatePicker()" class="inputTextNormal" title="请输入正确的姓名，格式在20个汉字以内" value="${xzfyInfo.secondSubmitDate?default('')}">
    </td>
  </tr>
  
  <tr class="trcolor">
	<td class="tdFormText">是否延期：</td>
	<#if xzfyInfo.isdelay="是">
	<td class="tdFormInput">
	 <input type="radio" name="xzfyInfo.isdelay" value="是" id="BAdelay_y"  onClick="yanqi.style.display='block';delayNotbreak();" checked>
	 <label for="radio">是 </label>
	 <input name="xzfyInfo.isdelay" type="radio" id="BAdelay_n" onClick="yanqi.style.display='none';delaynochecked();" value="否" >
	 <label for="radio2">否</label>
	</td>
	<#else>
	<td class="tdFormInput">
	 <input type="radio" name="xzfyInfo.isdelay" value="是" id="BAdelay_y"  onClick="yanqi.style.display='block';delayNotbreak();">
	 <label for="radio">是 </label>
	 <input name="xzfyInfo.isdelay" type="radio" id="BAdelay_n" checked onClick="yanqi.style.display='none';delaynochecked();" value="否" >
	 <label for="radio2">否</label>
	</td>
	</#if>
	<td class="tdFormText">&nbsp;</td>
	<td class="tdFormInput">&nbsp;</td>
  </tr>
 
 <#if xzfyInfo.isdelay?exists && xzfyInfo.isdelay="是">
  <tbody id="yanqi">
  <tr class="trcolor">
    <td class="tdFormText">报送时间：</td>
    <td class="tdFormInput"><input name="xzfyInfo.delayReport" id="delayreport" type="text" class="inputTextNormal" title="请输入正确的姓名，格式在20个汉字以内" value="${xzfyInfo.delayReport?default('')}" onClick="WdatePicker()">
      </td>
    <td class="tdFormText">决定延期时间：</td>
    <td class="tdFormInput"><input name="xzfyInfo.delayTo" id="delayto" type="text" class="inputTextNormal" title="请输入正确的姓名，格式在20个汉字以内" value="${xzfyInfo.delayTo?default('')}" onClick="WdatePicker()">
      </td>
  </tr>
 <tr class="trcolor">
    <td class="tdFormText">延期意见：</td>
    <td class="tdFormInput">
      <input name="xzfyInfo.delayAdvice" id="TDelayAdvice"  type="text" class="inputTextNormal" value="${xzfyInfo.delayAdvice?default('')}" >
    </td>
  </tr>
  <tr class="trcolor">
	<td class="tdFormText">延期通知书：</td>
	<td class="tdFormInput" colspan=3> <input name="file" type="file" class="inputTextNormal" UNSELECTABLE="on"></td>
  </tr>
  </tbody>
	<#else>
  <tbody id="yanqi" style="display:none;">
  <tr class="trcolor">
    <td class="tdFormText">报送时间：</td>
    <td class="tdFormInput"><input name="xzfyInfo.delayReport" id="delayreport" type="text" class="inputTextNormal" title="请输入正确的姓名，格式在20个汉字以内" value="" onClick="WdatePicker()">
      </td>
    <td class="tdFormText">决定延期时间：</td>
    <td class="tdFormInput"><input name="xzfyInfo.delayTo" id="delayto" type="text" class="inputTextNormal" title="请输入正确的姓名，格式在20个汉字以内" value="" onClick="WdatePicker()">
      </td>
  </tr>
 <tr class="trcolor">
    <td class="tdFormText">延期意见：</td>
    <td class="tdFormInput">
      <input name="xzfyInfo.delayAdvice" id="TDelayAdvice"  type="text" class="inputTextNormal" value="" >
    </td>
  </tr>
  <tr class="trcolor">
	<td class="tdFormText">延期通知书：</td>
	<td class="tdFormInput" colspan=3> <input name="file" type="file" class="inputTextNormal" UNSELECTABLE="on"></td>
  </tr>
  </tbody>
	</#if>
 
 
<tr class="trcolor">
 <#if xzfyInfo.isbreak?exists && xzfyInfo.isbreak="是">
	<td class="tdFormText">是否中止：</td>
	<td class="tdFormInput">
	 <input type="radio" name="xzfyInfo.isbreak" value="是" id="BAbreak_y" checked onClick="zhongzhi.style.display='block';breakNotdelay()">
	 <label for="radio">是 </label>
	 <input name="xzfyInfo.isbreak" type="radio" id="BAbreak_n"  onClick="zhongzhi.style.display='none';breaknochecked();" value="否" >
	 <label for="radio2">否</label></td>
	<td class="tdFormText">&nbsp;</td>
	<td class="tdFormInput">&nbsp;</td>
 <#else>
	<td class="tdFormText">是否中止：</td>
	<td class="tdFormInput">
	 <input type="radio" name="xzfyInfo.isbreak" value="是" id="BAbreak_y"   onClick="zhongzhi.style.display='block';breakNotdelay()">
	 <label for="radio">是 </label>
	 <input name="xzfyInfo.isbreak" type="radio" id="BAbreak_n" checked onClick="zhongzhi.style.display='none';breaknochecked();" value="否" >
	 <label for="radio2">否</label></td>
	<td class="tdFormText">&nbsp;</td>
	<td class="tdFormInput">&nbsp;</td>
 </#if>
</tr>
  
   <#if xzfyInfo.isbreak?exists && xzfyInfo.isbreak="是">
   <tbody id="zhongzhi" >
  <tr class="trcolor">
    <td class="tdFormText">中止时间：</td>
    <td class="tdFormInput">
      <label for="radio2">
        <input name="xzfyInfo.breakReport" id="breakreport" type="text" class="inputTextNormal" value="${xzfyInfo.breakReport?default('')}" onClick="WdatePicker()"> 
      </label>
    </td>
    <td class="tdFormText">恢复时间：</td>
    <td class="tdFormInput">
      <input name="xzfyInfo.breakTo" id="breakto"  type="text" class="inputTextNormal" value="${xzfyInfo.breakTo?default('')}" onClick="WdatePicker()">
    </td>
  </tr>
  
  <tr class="trcolor">
    <td class="tdFormText">中止意见：</td>
    <td class="tdFormInput" colspan="3">
      <input name="xzfyInfo.breakAdvice" id="TBreakAdvice"  type="text" class="inputTextNormal" value="${xzfyInfo.breakAdvice?default('')}" >
    </td>
  </tr>
  
  <tr class="trcolor">
		<td class="tdFormText">中止通知书：</td>
		<td class="tdFormInput" colspan=3> <input name="file" type="file" class="inputTextNormal" UNSELECTABLE="on"></td>
  </tr>
  </tbody>
<#else>
<tbody id="zhongzhi" style="display:none;">
  <tr class="trcolor">
    <td class="tdFormText">中止时间：</td>
    <td class="tdFormInput">
      <label for="radio2">
        <input name="xzfyInfo.breakReport" id="breakreport" type="text" class="inputTextNormal" value="" onClick="WdatePicker()"> 
      </label>
    </td>
    <td class="tdFormText">恢复时间：</td>
    <td class="tdFormInput">
      <input name="xzfyInfo.breakTo" id="breakto"  type="text" class="inputTextNormal" value="" onClick="WdatePicker()">
    </td>
  </tr>
  
  <tr class="trcolor">
    <td class="tdFormText">中止意见：</td>
    <td class="tdFormInput" colspan="3">
      <input name="xzfyInfo.breakAdvice" id="TBreakAdvice"  type="text" class="inputTextNormal" value="" >
    </td>
  </tr>
  
  <tr class="trcolor">
		<td class="tdFormText">中止通知书：</td>
		<td class="tdFormInput" colspan=3> <input name="file" type="file" class="inputTextNormal" UNSELECTABLE="on"></td>
  </tr>
  </tbody>
</#if>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle" >
  <tr>
    <td height="24" align="center">结案信息</td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">

<tr class="trcolor">
   <td class="tdFormText" width="25%">结案方式：</td>
   <td class="tdFormInput" width="25%">
     <select name="app_transaction.TFinishType" id="finishtype1" class="selectStyleNormal" onchange="jafs()">
		  <option value="0">请选择</option> 
		  <option value="1">驳回</option>
		  <option value="2">维持</option>
		  <option value="3">确认违法</option>
		  <option value="4">撤销</option>
		  <option value="5">变更</option>
		  <option value="6">责令履行</option>
		  <option value="7">调解</option>
		  <option value="8">终止</option>
		  <option value="9">其他</option> 
    </select>
    
    <select  name="ss" style="display:none" altname="结案方式" class="selectStyleNormal" id="finishtype2" ishidden="y">
		  <option value="0">----请选择----</option>
		  <option value="1">和解协议</option>
	 	  <option value="2">自愿撤回申请</option>
	 	  <option value="3">被申请人改变后撤回申请</option>
	 	  <option value="4">其他</option>
    </select>
   </td>
   <td class="tdFormText" width="25%">结案时间：</td>
   <td class="tdFormInput" width="25%">
     <input name="app_transaction.TFinishDate" id="finishtime1" onClick="WdatePicker()" value="" type="text" class="inputTextNormal">
   </td>
  </tr>
  
<tbody id="subjectOtherState" style="display:none;">
  <tr class="trcolor">
    <td class="tdFormText" width="25%">时间：</td>
    <td class="tdFormInput" width="25%">
      <input name="app_face.receivedate" type="text" id="receivedate" class="inputTextNormal" ischeck="y" onClick="WdatePicker()" altname="时间" value=''>
    </td>
    
    <td class="tdFormText">地点：</td>
	  <td class="tdFormInput">
	    <input name="app_face.place" type="text" id="place" style="width:300px" class="inputTextNormal" value="" >
	  </td>
  </tr>
  
  <tr class="trcolor">
   <td class ="tdFormText">主持人：</td>
   <td class="tdFormInput" colspan=3>
	    <input type="text"  name="leader.depart" readonly="readonly" tabindex="2" class="inputTextNormal required" style="width:300px"/>
	    <input type="hidden" name="departOrgId"/>
   </td>
  </tr>
    
    <tr class="trcolor">
     <td class ="tdFormText">参加人：</td>
     <td class="tdFormInput" colspan=3>
	     <input type="text" name="leader.depart" readonly="readonly" tabindex="2" class="inputTextNormal required" style="width:300px" />
	     <input type="hidden" name="departOrgId"/>
	   </td>
   	</tr>   
   	
  <tr class="trcolor">
	<td class="tdFormText">调解过程：</td>
		<td class="tdFormInput" colspan=3> <input name="file" type="file" class="inputTextNormal" UNSELECTABLE="on"></td>
	</tr>
	
</tbody>
  
  <tr class="trwhite">
    <td class="tdFormText">国家赔偿：</td>
    <td class="tdFormInput"><input type="radio" name="app_transaction.TNationIscompensate" value="是" id="compensate_y"  onClick="nationcompensate.style.display='block';nationcompensate1.style.display='block'">
        <label for="radio">是 </label>
        <input name="app_transaction.TNationIscompensate" type="radio" id="compensate_n" 
		onClick="nationcompensate.style.display='none';nationcompensate1.style.display='none';" value="否">
        <label for="radio2">否</label></td>
    
    
    <td class="tdFormText"><span style="display:none;" id="nationcompensate1">赔偿数额：</span></td>
    <td class="tdFormInput"><span style="display:none;" id="nationcompensate"><input name="app_transaction.TNationSum" id="countrycompensatenum" value="" type="text" class="inputTextNormal">  </span></td>
  </tr>
 
  

  <tbody id="finishreport" style="display:block;">
 <!-- <tbody id="finishreport" style="display:none;">-->
  <tr class="trcolor">
    <td class="tdFormText">结案文书：</td>
    <td class="tdFormInput"><input name="file2" type="file" class="inputTextNormal" UNSELECTABLE="on">
       </td>
  	<td class="tdFormText">&nbsp;</td>
    <td class="tdFormInput">&nbsp;</td>
  </tr>
  </tr>
  </tbody>

  <tr class="trcolor">
    <td class="tdFormText">市领导批示：</td>
    <td class="tdFormInput" colspan=3>
	<textarea name="app_transaction.pishi" class="textarea"></textarea>
</td>
  </tr>

  <tr class="trcolor">
    <td class="tdFormText">是否上传行政复议意见书：</td>
    <td class="tdFormInput"><input type="radio" name="app_transaction.TOpinion" value="是" id="opinion_y"  onClick="opinion.style.display='block';">
        <label for="radio">是 </label>
        <input name="app_transaction.TOpinion" type="radio" id="opinion_n" 
		onClick="opinion.style.display='none';" value="否" >
        <label for="radio2">否</label></td>
 	<td class="tdFormText">&nbsp;</td>
    <td class="tdFormInput">&nbsp;</td>
  </tr>
  </tr>
  
 <tbody id="opinion" style="display:none;">
  <tr class="trcolor">
    <td class="tdFormText">行政复议意见书：</td>
    <td class="tdFormInput"><input name="file" type="file" class="inputTextNormal" UNSELECTABLE="on">
      </td>
  	<td class="tdFormText">&nbsp;</td>
    <td class="tdFormInput">&nbsp;</td>
  </tr>
  </tbody>
  
  <tr class="trcolor">
    <td class="tdFormText">是否上传行政复议建议书：</td>
    <td class="tdFormInput"><input type="radio" name="app_transaction.TAdvise" value="是" id="advise_y"  onClick="adivse.style.display='block';">
        <label for="radio">是 </label>
        <input name="app_transaction.TAdvise" type="radio" id="advise_n" 
		onClick="adivse.style.display='none';" value="否" >
        <label for="radio2">否</label></td>
 	<td class="tdFormText">&nbsp;</td>
    <td class="tdFormInput">&nbsp;</td>
  </tr>
  </tr>
  
   <tbody id="adivse" style="display:none;">
   <tr class="trcolor">
    <td class="tdFormText">行政复议建议书：</td>
    <td class="tdFormInput"><input name="file1" type="file" class="inputTextNormal" UNSELECTABLE="on">
      </td>
  	<td class="tdFormText">&nbsp;</td>
    <td class="tdFormInput">&nbsp;</td>
    </tdody>
  </tr>

</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td> 
	    <input id="tiaoJieButton" name="Button23" type="button" class="button" value="生成调解笔录" style="display:none;" onclick="getTiaoJie()">
	    <input name="Button23" type="button" class="button" value="结案" onclick="changeSub()">
	    <input name="Button23" type="button" class="button" value="结案审批" onclick="changeSub()">
        <input name="Button42" type="button" class="button" value="返回" onClick = "history.back(-1)">
	 </td>
  </tr>
</table>

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

<div id="frDiv" style="position:absolute;display:none;" class="diva">
<table>
<tr><td align="left" width='100'>
<a href="javascript:addFr()">继续添加</a></td>
<td align="right"  width='100'><a href="javascript:checkFr();closeDivById('frDiv')">完成</a></td>
<td align="right"  width='100'><a href="javascript:closeDivById('frDiv')">关闭</a></td>
</tr>

</table>
<table >
<tr>
<td id="tfaren">
<table  id="appfaren">
<tr>
<td align='right'>
申请人：</td>
<td>
<input name="frsqr" isUser="true"  value=""/>
</td>
<td align='right'>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>

<td align='right'>
代表人名称：
</td>
<td><input name="fuzeren" isUser="true" value=""/>
</td>
<td align='right'>
	代表人类别：</td>
<td>
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
	<tr><td align='right'>
	住所地：</td>
<td colspan=3><input name="fzraddress" isUser="true" value="" size=80/>
	</td>
	
	</tr>
	<tr>
	<td align='right'>
	邮编：</td>
<td><input name="fzrpost" isUser="true" value=""/>
	</td>
	<td align='right'>
	电话：</td>
<td><input name="fzrtele" isUser="true" value=""/>
	</td>
</tr>
<td align='right'>
	其他情形：
	</td>
<td><select name="fzrother" isUser="true" retSelect="1">
	 <option value="0">无</option>
    <option value="由股东代表大会以股份制企业名义提出申请">由股东代表大会以股份制企业名义提出申请</option>
    <option value="由董事会以股份制企业名义提出申请">由董事会以股份制企业名义提出申请</option>
    <option value="其他">其他</option>
	</select>
	
	</td>
<td align='right'><input value="删除" type="button" class="buttonNormal" onclick="deleteFr(this)"></td>
<td>&nbsp;</td>
</tr>
</table>
<table  id="insfaren">
&nbsp;
</table>
</td></tr>
</table>
</div>


<div id="xwDiv" style="position:absolute;display:none;" class="diva">
<table>
<tr><td align="left" width=100>
<a href="javascript:addXw()">继续添加</a></td>
<td align="right" width=100><a href="javascript:closeDivXw()">完成</a></td>
<td align="right" width=100><a href="javascript:closeDivById('xwDiv')">关闭</a></td>
</tr>

</table>
<table >
<tr>
<td id="txw">
<table  id="xwapp"><tr><td>
被复议的具体行为-名称：
</td>
<td>
<input name="xwname" isUser="true"  value=""/>
</td>
</tr>
<tr>
<td>
被复议的具体行为-案号：</td>
<td><input name="xwnum" isUser="true"  value=''  />
</td>
</tr>
<tr>
<td>
(输入年份-案号，如"2011-001")
</td>
<td><input name="anNumYear"  id="anNumYear" class="inputTextSmall" style="WIDTH:70px;" value='' >-<input name="anNumAdd"  id="anNumAdd" class="inputTextSmall" style="WIDTH:70px;" value='' ><input value="检测重复" type="button" class="buttonNormal"  onclick="anNumConfirm()">
</td>
</tr>
<tr>
<td>
知道时间：
</td>
<td>
<select name="zd1" retSelect=1>
			<option value="0">选择年</option>
			<option value="1997">1997</option>
	    	<option value="1998">1998</option>
		 	<option value="1999">1999</option>
		 	<option value="2000">2000</option>
		 	<option value="2001">2001</option>
		 	<option value="2002">2002</option>
		 	<option value="2003">2003</option>
		 	<option value="2004">2004</option>
		 	<option value="2005">2005</option>
		 	<option value="2006">2006</option>
		 	<option value="2007">2007</option> 
		 	<option value="2008">2008</option>
		 	<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2013">2014</option>
			<option value="2013">2015</option>
			<option value="2013">2016</option>
		</select>	
		<select name="zd2" retSelect=1>
			<option value="0">选择月</option>
	    	<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		</select>
		<select name="zd3" retSelect=1>
			<option value="0">选择日</option>
	    		<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		 	<option value="13">13</option>
		 	<option value="14">14</option>
		 	<option value="15">15</option>
		 	<option value="16">16</option>
		 	<option value="17">17</option>
		 	<option value="18">18</option>
		 	<option value="19">19</option>
		 	<option value="20">20</option>
		 	<option value="21">21</option>
			<option value="22">22</option>
		 	<option value="23">23</option>
		 	<option value="24">24</option>
		 	<option value="25">25</option>
		 	<option value="26">26</option>
		 	<option value="27">27</option>
			<option value="28">28</option>
		 	<option value="29">29</option>
		 	<option value="30">30</option>
			<option value="31">31</option>
		</select>
</td>
</tr>
<tr>
<td>
得知该具体行为途径：</td>
<td><input name="tujing" isUser="true" value='' /></td>
</tr>
<tr>
<td align="center" colspan=2>
<input value="删除" type="button" class="buttonNormal" onclick="deleteXw(this)">
</td>
</tr>
</table>
<table  id="insxw">
&nbsp;
</table>
</td></tr>
</table>
</div>

<div id="userDiv" style="position:absolute;display:none;" class="diva">
<table>
<tr><td align="left" width=100>
<a href="javascript:addUser()">继续添加</a></td>
<td align="right" width=100><a href="javascript:addUser:closeDiv1()">完成</a></td>
<td align="right" width=100><a href="javascript:closeDivById('userDiv')">关闭</a></td>
</tr>

</table>
<table >
<tr>
<td id="tuser">
<table  id="app"><tr><td>
被接待人：<input name="bjdr1" isUser="true" size='6' value=""/>
</td>
<td>
	性别：
	<select name="bsex" isUser="true" retSelect="1">
	<option value="男">男</option>
	<option value="女">女</option>
	</select>
	</td>
	<td>
	身份证号：<input name="bnum" isUser="true" value="" size=12/>
	</td>
	<td>
	通信地址：<textarea name="baddress" type="text" isUser="true" style="width:150px;overflow-y:visible;"></textarea>
	</td>
	<td>
	邮编：<input name="bpost" isUser="true" value="" size=4/>
	</td>
	<td>
	电话：<input name="bphone" isUser="true" value='' size=8/>
	<input value="删除" type="button" class="buttonNormal" onclick="deleteUser(this)">
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
<table>
<tr><td align="left" width=100>
<a href="javascript:addApp()">继续添加</a></td>
<td align="right" width=100><a href="javascript:addApp:closeApp()">完成</a></td>
<td align="right" width=100><a href="javascript:addUser:closeDivById('appDiv')">关闭</a></td>
</tr>

</table>
<table >
<tr>
<td id="tapp">
<table  id="appapp"><tr><td>
申请人:<input name="appsqr" isUser="true" size='6' value=""/>
</td>
<td>
	性别：
	<select name="appsex" isUser="true" retSelect="1">
	<option value="男">男</option>
	<option value="女">女</option>
	</select>
	</td>
	<td>
	身份证号：<input name="appnum" isUser="true" value="" size=12/>
	</td>
	<td>
	通信地址：
	<textarea name="appaddress" type="text" isUser="true" style="width:150px;overflow-y:visible;"></textarea>
	</td>
	<td>
	邮编：<input name="apppost" isUser="true" value="" size=4/>
	</td>
	<td>
	电话：<input name="appphone" isUser="true" value='' size=8/>
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
<table  id="dep"><tr><td>
代表人:<input name="depsqr" isUser="true" size='6' value=""/>
</td>
<td>
	性别：
	<select name="depsex" isUser="true" retSelect="1">
	<option value="男">男</option>
	<option value="女">女</option>
	</select>
	</td>
	<td>
	身份证号：<input name="depnum" isUser="true" value="" size=12/>
	</td>
	<td>
	通信地址：<input name="depaddress" isUser="true" value="" size=10/>
	</td>
	<td>
	邮编：<input name="deppost" isUser="true" value="" size=4/>
	</td>
	<td>
	电话：<input name="depphone" isUser="true" value='' size=8/>
	<input value="删除" type="button" class="buttonNormal" onclick="deleteDep(this)">
	</td>
</tr>
</table>
<table  id="insdep">
&nbsp;
</table>
</td></tr>
</table>
</div>

<div id="fileDiv" style="position:absolute;display:none;" class="diva">
<table width="320">
<tr><td align="left">
<a href="javascript:addFile()">继续添加</a></td>
<td align="right"><a href="javascript:closeFile()">完成</a></td>
<td align="right"><a href="javascript:resetFile1()">不添加</a></td>
</tr>

</table>

	<table >
		<tr>
		<td id="tfile">
		<table  id="fileapp" isfilediv="1">
		<tr><td>
		文件名：<input name="filemodel" isUser="true" value="" size=35/>
		</td>
	<td>
	类型：<select name="filetype" isUser="true" retSelect="1">
	<option value="（复印件）" selected>复印件</option>
	<option value="（原件）">原件</option>
	</select>
	</td>
	<td>
	页数：<input name="filepage" isUser="true" value='' size=2/>
	</td>
	<td>
	份数：<input name="filecount" isUser="true" value="" size=2/>
	<input value="删除" type="button" class="buttonNormal" onclick="deleteFile(this)">
	</td></tr>
	</table>
<table  id="infile">
&nbsp;
</table>
</td></tr>
</table>
</div>
<div id="answerDiv" style="position:absolute;display:none;" class="diva">
<table width="320">
<tr><td align="left" width=100>
<a href="javascript:addAnswer()">继续添加</a></td>
<td width=100>注意标点符号</td>
<td align="right"  width=50><a href="javascript:closeAnswer()">完成</a></td>
<td align="right" width=50><a href="javascript:closeDivById('answerDiv')">关闭</a></td>
</tr>

</table>

	<table >
		<tr>
		<td id="tanswer">
		<table  id="answerapp" isfilediv="1">
		<tr>
	<td>
	<input name="answer" isUser="true" value='问：'/>
	</td>
	<td>
	<input name="answerto" isUser="true" value='答：'/>
	<input value="删除" type="button" class="buttonNormal" onclick="deleteAnswer(this)">
	</td></tr>
	</table>
<table  id="inanswer">
&nbsp;
</table>
</td></tr>
</table>
</div>

<div id="adviceDiv" style="position:absolute;display:none;" class="diva">
<table width="300">
<tr>
<td align="left"><a href="javascript:addUser:rechekAadvice()">重填</a></td>
<td align="right"><a href="javascript:addUser:closeAdvice()">完成</a></td>
</tr>

</table>

<table width="600" border='1'>
<tr><td align="left">
（一）该行政复议申请没有明确的申请人，不符合行政复议受理条件。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请没有明确的申请人，不符合行政复议受理条件。')">
</td></tr>
<tr><td align="left">
（二）该行政复议申请没有符合规定的被申请人，不符合行政复议受理条件。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请没有符合规定的被申请人，不符合行政复议受理条件。')">
</td></tr>
<tr><td align="left">
（三）申请人与具体行政行为没有利害关系，不符合行政复议受理条件。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('申请人与具体行政行为没有利害关系，不符合行政复议受理条件。')">
</td></tr>
<tr><td align="left">
（四）该行政复议申请没有具体的行政复议请求和理由，不符合行政复议受理条件。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请没有具体的行政复议请求和理由，不符合行政复议受理条件。')">
</td></tr>
<tr><td align="left">
（五）该行政复议申请未在法定申请期限内提出，不符合行政复议受理条件。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请未在法定申请期限内提出，不符合行政复议受理条件。')">
</td></tr>
<tr><td align="left">
（六）该行政复议申请是——（以下内容），不属于行政复议法规定的行政复议范围。<br>
1、国防、外交等国家行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——国防、外交等国家行为，不属于行政复议法规定的行政复议范围。')">
<br>
2、抽象行政行为（非可附带审查的规范性文件）<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——抽象行政行为（非可附带审查的规范性文件），不属于行政复议法规定的行政复议范围。')">
<br>
3、行政机关的行政处分或者其他人事处理决定<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——行政机关的行政处分或者其他人事处理决定，不属于行政复议法规定的行政复议范围。')">
<br>
 4、法律所确定的终局裁决行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——法律所确定的终局裁决行为，不属于行政复议法规定的行政复议范围。')">
<br>
5、公安、国家安全等机关依照刑事诉讼法的明确授权实施的刑事司法行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——公安、国家安全等机关依照刑事诉讼法的明确授权实施的刑事司法行为，不属于行政复议法规定的行政复议范围。')">
<br>
6、行政机关对民事纠纷作出的调解或其他处理<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——行政机关对民事纠纷作出的调解或其他处理，不属于行政复议法规定的行政复议范围。')">
<br>
7、不具强制力的行政指导行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——不具强制力的行政指导行为，不属于行政复议法规定的行政复议范围。')">
<br>
8、驳回当事人对行政行为提起申诉的重复处理行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——驳回当事人对行政行为提起申诉的重复处理行为，不属于行政复议法规定的行政复议范围。')">
<br>
9、医疗事故鉴定<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——医疗事故鉴定，不属于行政复议法规定的行政复议范围。')">
<br>
10、火灾事故责任认定<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——火灾事故责任认定，不属于行政复议法规定的行政复议范围。')">
<br>
11、交通事故责任认定<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——交通事故责任认定，不属于行政复议法规定的行政复议范围。')">
<br>
12、劳动能力鉴定<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——劳动能力鉴定，不属于行政复议法规定的行政复议范围。')">
<br>
12、劳动能力鉴定<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——劳动能力鉴定，不属于行政复议法规定的行政复议范围。')">
<br>
13、单独对规范性文件提出附带审查的申请<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——单独对规范性文件提出附带审查的申请，不属于行政复议法规定的行政复议范围。')">
<br>
14、司法鉴定行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——司法鉴定行为，不属于行政复议法规定的行政复议范围。')">
<br>
15、历史遗留问题<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——历史遗留问题，不属于行政复议法规定的行政复议范围。')">
<br>
16、司法行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——司法行为，不属于行政复议法规定的行政复议范围。')">
<br>
17、信访行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——信访行为，不属于行政复议法规定的行政复议范围。')">
<br>
18、其他对公民、法人或者其他组织权利义务不产生实际影响的行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——其他对公民、法人或者其他组织权利义务不产生实际影响的行为，不属于行政复议法规定的行政复议范围。')">
<br>
</td></tr>
<tr><td align="left">
（七）该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围。')">
</td></tr>
<tr><td align="left">
（七）该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围。')">
</td></tr>
<tr><td align="left">
（八）其他行政复议机关已经受理同一行政复议申请，人民法院已经受理同一主体就同一事实提起的行政诉讼，该申请不符合行政复议受理条件。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('其他行政复议机关已经受理同一行政复议申请，人民法院已经受理同一主体就同一事实提起的行政诉讼，该申请不符合行政复议受理条件.')">
</td></tr>
<tr><td align="left">
（九）其他<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('其他.')">
</td></tr>
</table>
</div>

<div id="bzDiv" style="position:absolute;display:none;" class="diva">
<table width="300">
<tr>
<td align="left"><a href="javascript:addUser:recheckBz()">重填</a></td>
<td align="right"><a href="javascript:addUser:closeBz()">完成</a></td>
<td align="right"><a href="javascript:xbz()">关闭</a></td>
</tr>

</table>
<table width="600" border='1'>
<tr><td align="left">
（一）申请人是公民，无申请人身份证明；<input value="申请人是公民，无申请人身份证明；" type="checkbox" class="checkbox" onclick="addbz('（一）申请人是公民，无申请人身份证明；')" isbz=1>
</td></tr>
<tr><td align="left">
（二）申请人是法人或者其他组织，无工商营业执照副本复印件或者设立登记证明复印件；<input value="申请人是法人或者其他组织，无工商营业执照副本复印件或者设立登记证明复印件；" type="checkbox" class="checkbox"  onclick="addbz('（二）申请人是法人或者其他组织，无工商营业执照副本复印件或者设立登记证明复印件；')">
</td></tr>
<tr><td align="left">
（三）申请人是法人或者其他组织，无法定代表人或者负责人身份证明；<input value="申请人是法人或者其他组织，无法定代表人或者负责人身份证明；" type="checkbox" class="checkbox"" onclick="addbz('（三）申请人是法人或者其他组织，无法定代表人或者负责人身份证明；')">
</td></tr>
<tr><td align="left">
（四）股份制企业的股东大会、股东代表大会、董事会以企业的名义申请行政复议，无相应的会议决议或其他证明文件材料；<input value="股份制企业的股东大会、股东代表大会、董事会以企业的名义申请行政复议，无相应的会议决议或其他证明文件材料；" type="checkbox" class="checkbox" onclick="addbz('（四）股份制企业的股东大会、股东代表大会、董事会以企业的名义申请行政复议，无相应的会议决议或其他证明文件材料；')">
</td></tr>
<tr><td align="left">
（五）合伙企业申请行政复议，无企业核准登记证明复印件和执行合伙事务的合伙人身份证明；<input value="合伙企业申请行政复议，无企业核准登记证明复印件和执行合伙事务的合伙人身份证明；" type="checkbox" class="checkbox" onclick="addbz('（五）合伙企业申请行政复议，无企业核准登记证明复印件和执行合伙事务的合伙人身份证明；')">
</td></tr>
<tr><td align="left">
（六）其他合伙组织申请行政复议，无全体合伙人身份证明；<input value="其他合伙组织申请行政复议，无全体合伙人身份证明；" type="checkbox" class="checkbox" onclick="addbz('（六）其他合伙组织申请行政复议，无全体合伙人身份证明；')">
</td></tr>
<tr><td align="left">
（七）不具备法人资格的其他组织申请行政复议，无该组织主要负责人身份证明；<input value="不具备法人资格的其他组织申请行政复议，无该组织主要负责人身份证明；" type="checkbox" class="checkbox" onclick="addbz('（七）不具备法人资格的其他组织申请行政复议，无该组织主要负责人身份证明；')">
</td></tr>
<tr><td align="left">
（八）该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围；<input value="该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围；" type="checkbox" class="checkbox" onclick="addbz('（八）该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围；')">
</td></tr>
<tr><td align="left">
（九）不具备法人资格的其他组织申请行政复议，没有主要负责人，由共同推选的其他成员代表该组织参加行政复议，无推选证明文件和被推选者身份证明；<input value="不具备法人资格的其他组织申请行政复议，没有主要负责人，由共同推选的其他成员代表该组织参加行政复议，无推选证明文件和被推选者身份证明；" type="checkbox" class="checkbox" onclick="addbz('（九）不具备法人资格的其他组织申请行政复议，没有主要负责人，由共同推选的其他成员代表该组织参加行政复议，无推选证明文件和被推选者身份证明；')">
</td></tr>
<tr><td align="left">
（十）没有明确的被申请人；<input value="没有明确的被申请人；" type="checkbox" class="checkbox" onclick="addbz('没有明确的被申请人；')">
</td></tr>
<tr><td align="left">
（十一）没有适格的被申请人；<input value="没有适格的被申请人；" type="checkbox" class="checkbox" onclick="addbz('没有适格的被申请人；')">
</td></tr>
<tr><td align="left">
（十二）行政复议请求不明确或者不符合法律规定；<input value="行政复议请求不明确或者不符合法律规定；" type="checkbox" class="checkbox" onclick="addbz('行政复议请求不明确或者不符合法律规定；')">
</td></tr>
<tr><td align="left">
（十三）申请人申请行政复议的具体行政行为不明确；<input value="申请人申请行政复议的具体行政行为不明确；" type="checkbox" class="checkbox" onclick="addbz('申请人申请行政复议的具体行政行为不明确；')">
</td></tr>
<tr><td align="left">
（十四）申请人知道具体行政行为的时间不明确；<input value="申请人知道具体行政行为的时间不明确；" type="checkbox" class="checkbox" onclick="addbz('申请人知道具体行政行为的时间不明确；')">
</td></tr>
<tr><td align="left">
（十五）申请人对规划行政许可、房屋登记、土地登记等具体行政行为不服申请行政复议，无房屋所有权证复印件、土地证书复印件、派出所证明等证明申请人与该具体行政行为有利害关系的证据材料；<input value="申请人对规划行政许可、房屋登记、土地登记等具体行政行为不服申请行政复议，无房屋所有权证复印件、土地证书复印件、派出所证明等证明申请人与该具体行政行为有利害关系的证据材料；" type="checkbox" class="checkbox" onclick="addbz('十五）申请人对规划行政许可、房屋登记、土地登记等具体行政行为不服申请行政复议，无房屋所有权证复印件、土地证书复印件、派出所证明等证明申请人与该具体行政行为有利害关系的证据材料；')">
</td></tr>
<tr><td align="left">
（十六）申请人认为被申请人不履行法定职责，未提供曾经要求被申请人履行法定职责而被申请人未履行的证明材料；<input value="申请人认为被申请人不履行法定职责，未提供曾经要求被申请人履行法定职责而被申请人未履行的证明材料；" type="checkbox" class="checkbox" onclick="addbz('（十六）申请人认为被申请人不履行法定职责，未提供曾经要求被申请人履行法定职责而被申请人未履行的证明材料；')">
</td></tr>
<tr><td align="left">
（十七）申请行政复议时一并提出行政赔偿请求，未提供受具体行政行为侵害而造成损害的证明材料；<input value="申请行政复议时一并提出行政赔偿请求，未提供受具体行政行为侵害而造成损害的证明材料；" type="checkbox" class="checkbox" onclick="addbz('申请行政复议时一并提出行政赔偿请求，未提供受具体行政行为侵害而造成损害的证明材料；')">
</td></tr>
<tr><td align="left">
（十八）委托代理人申请行政复议，无授权委托书；<input value="委托代理人申请行政复议，无授权委托书；" type="checkbox" class="checkbox" onclick="addbz('委托代理人申请行政复议，无授权委托书；')">
</td></tr>
<tr><td align="left">
（十九）委托代理人为公民，无代理人身份证或者户口本复印件；<input value="委托代理人为公民，无代理人身份证或者户口本复印件；" type="checkbox" class="checkbox" onclick="addbz('（十九）委托代理人为公民，无代理人身份证或者户口本复印件；')">
</td></tr>
<tr><td align="left">
（二十）委托代理人为律师，无律师事务所指派函原件和律师执业证复印件；<input value="委托代理人为律师，无律师事务所指派函原件和律师执业证复印件；" type="checkbox" class="checkbox" onclick="addbz('（二十）委托代理人为律师，无律师事务所指派函原件和律师执业证复印件；')">
</td></tr>
<tr><td align="left">
（二十一）申请人为无民事行为能力人或者限制民事行为能力人，无户籍证明复印件、结婚证复印件等法定代理相关证明材料；<input value="申请人为无民事行为能力人或者限制民事行为能力人，无户籍证明复印件、结婚证复印件等法定代理相关证明材料；" type="checkbox" class="checkbox" onclick="addbz('（二十一）申请人为无民事行为能力人或者限制民事行为能力人，无户籍证明复印件、结婚证复印件等法定代理相关证明材料；')">
</td></tr>
<tr><td align="left">
（二十二）同一行政复议案件申请人超过5人，没有推选1至5名代表参加行政复议；<input value="同一行政复议案件申请人超过5人，没有推选1至5名代表参加行政复议；" type="checkbox" class="checkbox" onclick="addbz('（二十二）同一行政复议案件申请人超过5人，没有推选1至5名代表参加行政复议。')">
</td></tr>
<tr><td align="left">
（二十三））同一行政复议案件申请人超过5人，推选1至5名代表参加行政复议，但是缺少有全体申请人签字的推选书；<input value="同一行政复议案件申请人超过5人，推选1至5名代表参加行政复议，但是缺少有全体申请人签字的推选书；" type="checkbox" class="checkbox" onclick="addbz('（二十三）同一行政复议案件申请人超过5人，推选1至5名代表参加行政复议，但是缺少有全体申请人签字的推选书；')">
</td></tr>
<tr><td align="left">
（二十四）申请人对两个和两个以上的具体行政行为不服申请行政复议，没有分别提出行政复议申请；<input value="申请人对两个和两个以上的具体行政行为不服申请行政复议，没有分别提出行政复议申请；" type="checkbox" class="checkbox" onclick="addbz('（二十四）申请人对两个和两个以上的具体行政行为不服申请行政复议，没有分别提出行政复议申请；')">
</td></tr>
<tr><td align="left">
（二十五）其他需要补正的情形。<input value="其他需要补正的情形。" type="checkbox" class="checkbox" onclick="addbz('（二十五）其他需要补正的情形。')">
</td></tr>
</table>
</div>

<div id="aqDiv" style="position:absolute;display:none;" class="diva">
<table width="300">
<tr>
<td align="left"><a href="javascript:addUser:recheckAq()">重填</a></td>
<td align="right"><a href="javascript:addUser:closeAq()">完成</a></td>
</tr>
</table>
<table width="600" border='1'>

<tr><td align="left">
1、当事人扬言去天安门等敏感地区自杀、自焚，扬言暴力报复相关人，或者对接待人员的言辞、行为反应激烈，辱骂接待人员，试图闯入工作区域，以及其他可能构成安全隐患的情况；
<input value="当事人扬言去天安门等敏感地区自杀、自焚，扬言暴力报复相关人，或者对接待人员的言辞、行为反应激烈，辱骂接待人员，试图闯入工作区域，以及其他可能构成安全隐患的情况；" 
type="checkbox" class="checkbox"  onclick="addAq('当事人扬言去天安门等敏感地区自杀、自焚，扬言暴力报复相关人，或者对接待人员的言辞、行为反应激烈，辱骂接待人员，试图闯入工作区域，以及其他可能构成安全隐患的情况；')">
</td></tr>
<tr><td align="left">
2、当事人宣称有精神病史，或者多次来访且精神状态可疑的；<input value="当事人宣称有精神病史，或者多次来访且精神状态可疑的；" 
type="checkbox" class="checkbox"" onclick="addAq('当事人宣称有精神病史，或者多次来访且精神状态可疑的；')">
</td></tr>
<tr><td align="left">
3、遇有大规模群体上访或者群体复议情况；<input value="遇有大规模群体上访或者群体复议情况；" 
type="checkbox" class="checkbox"" onclick="addAq('遇有大规模群体上访或者群体复议情况；')">
</td></tr>
<tr><td align="left">
4、遇有其他安全隐患；<input value="遇有其他安全隐患；" 
type="checkbox" class="checkbox"" onclick="addAq('遇有其他安全隐患；')">
</td></tr>
<tr><td align="left">
5、当事人未经许可闯入工作区域；<input value="当事人未经许可闯入工作区域；" 
type="checkbox" class="checkbox"" onclick="addAq('当事人未经许可闯入工作区域；')">
</td></tr>
<tr><td align="left">
6、当事人在等候、接待区域情绪异常(过于激烈或者沉默，或者有明显精神病症状) ，举止可疑、有寻衅滋事征兆（如试图闯入工作区，敲击门窗、触摸屏、桌椅等未造成损坏的）等行为；
<input value="当事人在等候、接待区域情绪异常(过于激烈或者沉默，或者有明显精神病症状) ，举止可疑、有寻衅滋事征兆（如试图闯入工作区，敲击门窗、触摸屏、桌椅等未造成损坏的）等行为；" 
type="checkbox" class="checkbox"" onclick="addAq('当事人在等候、接待区域情绪异常(过于激烈或者沉默，或者有明显精神病症状) ，举止可疑、有寻衅滋事征兆（如试图闯入工作区，敲击门窗、触摸屏、桌椅等未造成损坏的）等行为；')">
</td></tr>
<tr><td align="left">
7、当事人携带可疑物品（携带棍、条状物品，携带酒瓶或可疑容器，携带可疑包裹）；
<input value="当事人携带可疑物品（携带棍、条状物品，携带酒瓶或可疑容器，携带可疑包裹）；" 
type="checkbox" class="checkbox"" onclick="addAq('当事人携带可疑物品（携带棍、条状物品，携带酒瓶或可疑容器，携带可疑包裹）；')">
</td></tr>
<tr><td align="left">
8、当事人扬言当场自杀、自残、自焚；
<input value="当事人扬言当场自杀、自残、自焚；" 
type="checkbox" class="checkbox"" onclick="addAq('当事人扬言当场自杀、自残、自焚；')">
</td></tr>
<tr><td align="left">
9、事人携带管制刀具、棍棒、有毒有害气体液体等危险物品；
<input value="事人携带管制刀具、棍棒、有毒有害气体液体等危险物品；" 
type="checkbox" class="checkbox"" onclick="addAq('事人携带管制刀具、棍棒、有毒有害气体液体等危险物品；')">
</td></tr>
<tr><td align="left">
10、当事人在等候、接待区域有对接待人员企图进行人身伤害的（亮出棍棒、刀具、可燃气体、液体等凶器；或者扬言伤害，并采取了肢体动作）；
<input value="当事人在等候、接待区域有对接待人员企图进行人身伤害的（亮出棍棒、刀具、可燃气体、液体等凶器；或者扬言伤害，并采取了肢体动作）；" 
type="checkbox" class="checkbox"" onclick="addAq('当事人在等候、接待区域有对接待人员企图进行人身伤害的（亮出棍棒、刀具、可燃气体、液体等凶器；或者扬言伤害，并采取了肢体动作）；')">
</td></tr>
<tr><td align="left">
11、当事人在工作区域有对接待人员企图进行人身伤害的（亮出棍、刀具、可燃液体等凶器；或者扬言伤害，并采取了肢体动作）；
<input value="当事人在工作区域有对接待人员企图进行人身伤害的（亮出棍、刀具、可燃液体等凶器；或者扬言伤害，并采取了肢体动作）；" 
type="checkbox" class="checkbox"" onclick="addAq('当事人在工作区域有对接待人员企图进行人身伤害的（亮出棍、刀具、可燃液体等凶器；或者扬言伤害，并采取了肢体动作）；')">
</td></tr>
<tr><td align="left">
12、出现当事人故意毁坏公私财物事件或者盗窃、抢夺事件；
<input value="出现当事人故意毁坏公私财物事件或者盗窃、抢夺事件；" 
type="checkbox" class="checkbox"" onclick="addAq('出现当事人故意毁坏公私财物事件或者盗窃、抢夺事件；')">
</td></tr>
</table>
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
	

	if(document.getElementById("requestrrr").value=="2"){
		document.getElementById("requesttype").style.display="block";
		document.getElementById("requesttype2").style.display="block";
		document.getElementById("requesttype3").style.display="block";
		document.getElementById("closeBzw").style.display="block";
		document.getElementById("getBzw").style.display="none";
		document.getElementById("xwspan").style.display="none";
		document.getElementById("xw_an").innerHTML="";
	}
	if(document.getElementById("requestrrr").value=="0")
	{
		document.getElementById("requesttype").style.display="none";
		document.getElementById("requesttype2").style.display="none";
		document.getElementById("requesttype3").style.display="none";
		document.getElementById("xwspan").style.display="block";
		document.getElementById("closeBzw").style.display="none";
		document.getElementById("getBzw").style.display="none";
		document.getElementById("xw_an").innerHTML="";
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
   document.getElementById("addend1").value="";
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
<#-- 
<#list deptlist as dl>	
       subcat[${dl_index}]=new Array("${dl.type}","${dl.name}","${dl.locbm}"); 
       count++;    
</#list>
-->
function aaa(ss)
{
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
	document.getElementById("addend1").value="";
	
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
		//document.getElementById("otherAdvice").style.display="none";
		document.getElementById("filedetail").style.display="none";
		document.getElementById("filespan").style.display="none";
		document.getElementById("bznr").style.display="none";
		document.getElementById("bzspan").style.display="none";
		
	}else
	if(document.getElementById("handle").value==1){
		document.getElementById("handle_detail").style.display="block";
		document.getElementById("advicespan").style.display="block";
		//document.getElementById("check_select").style.display="block";
		//document.getElementById("otherAdvice").style.display="block";
		document.getElementById("filedetail").style.display="none";
		document.getElementById("filespan").style.display="none";
		document.getElementById("bznr").style.display="none";
		document.getElementById("bzspan").style.display="none";
		
	}else if(document.getElementById("handle").value==3){
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		//document.getElementById("otherAdvice").style.display="block";
		document.getElementById("filedetail").style.display="block";
		document.getElementById("filespan").style.display="block";
		document.getElementById("bznr").style.display="none";
		document.getElementById("bzspan").style.display="none";
		updateFile();
	}else{
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		//document.getElementById("otherAdvice").style.display="block";
		document.getElementById("filedetail").style.display="none";
		document.getElementById("filespan").style.display="none";
		document.getElementById("bznr").style.display="block";
		document.getElementById("bzspan").style.display="block";
		
	}
}

function checknull()
{	
	if(document.getElementById("user").value==""){alert("请填写被接待人!");return;}
	if(document.getElementById("shenqingren").value==""){alert("请填写申请人!");return;}
	var intReg=/^[0-9]*[1-9][0-9]*$/;
	if(!intReg.test(document.getElementById("applicationsum").value)){alert("请填写接待人人数");return;}
	if(!intReg.test(document.getElementById("rencount").value)){alert("请填写申请人人数");return;}
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
			if(a.item(i).value=="0"){alert("请您填写:"+a.item(i).altname+"!");return false;	}			
		}
	}
	
	if(document.getElementById("requestrrr").value=="0"){
		if(document.getElementById("xingwei1").value==""){alert("要求复议的具体行政行为情况!");return;}
	}
	if(document.getElementById("keyword").value=="1"){
		if(!fysxCheck()){
			alert("请选择申请复议事项!");	
			return;
		}
		if(!xzlbCheck()){
			alert("请选择行政类别!");
			return;
		}
	}
	return true;
}


//申请复议事项非空判断
function fysxCheck(){
    var refer=0;
	var disList2 = document.getElementsByName("xzfyInfo.casetype");
	for(var i=0;i<disList2.length;i++){
		if(disList2.item(i).checked==true){
			refer=disList2.item(i).value;

		}
	}
	if(refer==0){
		return false;
	}
	return true;
}
//行政类别非空判断
function xzlbCheck(){
    var refer=0;
	var disList2 = document.getElementsByName("xzfyInfo.refer");
	for(var i=0;i<disList2.length;i++){
		if(disList2.item(i).checked==true){
			refer=disList2.item(i).value;

		}
	}
	if(refer==0){
		return false;
	}
	return true;
}
<#--
function getUser(){
	var name =encodeURIComponent(document.getElementById("appstring").value);
	if(name==""){
		alert("请填写被接待人！")
	}else{
		window.open ("../jds/checkApplication.action?appString="+name,'newwindow','height=300,width=400,top=300,left=300,toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes'); 
	}
}

function getUser1(){
       
	var name = encodeURIComponent(document.getElementById("app_face.TDeputy").value);	
	if(name==""){
		alert("请填写代表人名称！")
	}else{
	window.open ("../jds/dupdenamecheck.action?TDeputy="+name,'newwindow','height=300,width=400,top=300,left=300,toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes'); 
	}
}
-->

function saveNew(){ 
	setCountAppname('shenqingren','rencount');
	<#-- 
    if(checknull()&&checkKeyWord()){
		listForm_= document.getElementById("form1");	
		document.getElementById("sta").value="11";	
		var ajsjfm1s=document.getElementsByName("xzfyInfo.reception");
		var asl=0;
		for(var i=0;i<ajsjfm1s.length;i++){
				if(ajsjfm1s.item(i).checked)
					asl=ajsjfm1s.item(i).value;
		}
		//if(asl==6)
		//	document.getElementById("appType").value="7";
		//else
		//	document.getElementById("appType").value="1";
			listForm_.action="saveFace.action?funcCode=${funcCode}";
			if(confirm("您确认保存吗?"))
			listForm_.submit();
	}
	-->
	listForm_= document.getElementById("form1");
	listForm_.action="liAn.action?funcCode=${funcCode}";
	if(confirm("您确认保存吗?"))
	listForm_.submit();
}

function saveJD(){ 
    
	listForm_= document.getElementById("form1");	
	document.getElementById("sta").value="11";
	
		listForm_.action="../jds/App_FaceSaveAction.action";
		if(confirm("您确认保存吗?")){
		//	document.getElementById("appType").value="7";
			listForm_.submit();
		}
		
	}
	function subNew(){ 
	    listForm_= document.getElementById("form1");
	    	document.getElementById("sta").value="12";
			listForm_.action="../jds/App_FaceSaveAction.action";
			var valid = new Validation("form1");
	        var result = valid.validate();
	        if(result==true&&confirm("您确认提交为复议申请吗?"))
				
				{		
				listForm_.submit();
				}		
		}
	
	function subjiandu(){ 
    listForm_= document.getElementById("form1");
    	document.getElementById("sta").value="13";
		listForm_.action="../jds/App_FaceSaveAction.action";
		var valid = new Validation("form1");
	        var result = valid.validate();
		
        if(result==true&&confirm("您确认提交为监督案件吗?"))
			
			{		
				listForm_.submit();
			}		
	}
	
function sendchecknull(){
/*
	if(document.getElementById("user").value=="") {alert("请填写申请人!");return false;}
	else if(document.getElementById("receivedate").value=="") {alert("请填写收案日期!");return false;}
	else if(document.getElementById("handlesecond").value=="") {alert("请填写第二承办人姓名!");return false;}
	else if(document.getElementById("applicationtype").value==0) {alert("请填写申请人类别!");return false;}
	
	else if(!document.getElementById("duoren_y").checked&&!document.getElementById("duoren_n").checked) {alert("请填写多人复议!");return false;}
	else if(document.getElementById("beapptype").value==0) {alert("请填写被申请人种类!");return false;}
	else if((document.getElementById("beappname").value==0)&&(document.getElementById("beappname2").value=="")) {alert("请填写被申请人名称!");return false;}
	
	else if(document.getElementById("xzfysx").value==0) {alert("请填写申请复议事项!");return false;}
	else if(!document.getElementById("fyqz_y").checked&&!document.getElementById("fyqz_n").checked) {alert("请填写复议前置!");return false;}
	else if(document.getElementById("senddept3").value=="") {alert("请填写转送机构名称!");return false;}
	*/
	return true;
	
}
<#--
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
-->

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
	var areaObject=document.getElementById("quanyi");
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
	var bzString="该行政复议申请中有如下材料欠缺或表达不清，根据《中华人民共和国行政复议法实施条例》第29条的规定，请申请人于接待之日起5个工作日内补正。无正当理由逾期不补正的，视为放弃行政复议申请。补正申请材料所用时间不计入行政复议案件审理期限。补正内容：\n";
	var count=1;
	for(var j=0;j<filelist.length;j++){
		if(filelist.item(j).type=="checkbox"){
			if(filelist.item(j).checked==true){
				bzString=bzString+"    "+count+"、"+filelist.item(j).value+"\n";
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
	document.getElementById("bznr").value="该行政复议申请中有如下材料欠缺或表达不清，根据《中华人民共和国行政复议法实施条例》第29条的规定，请申请人于接待之日起5个工作日内补正。无正当理由逾期不补正的，视为放弃行政复议申请。补正申请材料所用时间不计入行政复议案件审理期限。补正内容：\n";
}

function rechekAadvice(){
	document.getElementById("handle_detail").value="";

}

function addAdvice(advice){
	document.getElementById("handle_detail").value=advice;
}

function showTiaojie(){
	var tiaojie = document.getElementById("tiaojie").value;
	if(tiaojie=="1"){
		document.getElementById("otherDetail").style.display="block";	
		document.getElementById("otherDetail2").style.display="block";
	}else{
		document.getElementById("otherDetail").style.display="none";
		document.getElementById("otherDetail2").style.display="none";	
	}
}



function key(ev){
	var key1 = document.getElementById("keyword").value;
	if(key1=="1")
	{
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	}
		udiv=document.getElementById("key1Div");
		var areaObject=document.getElementById("keyword");
		if(udiv.style.display!="block"){
			ev = ev || window.event;
			var mousePos = getPosition(areaObject);
			var h=document.body.clientHeight 
			udiv.style.position = "absolute";
			udiv.style.top = mousePos.y-150;
			udiv.style.left = mousePos.x-95;
			udiv.style.display="block";
		}
		document.getElementById("key2Div").style.display="none";
		document.getElementById("key3Div").style.display="none";
	}
	else{
	if(key1=="2"){
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	}
		udiv=document.getElementById("key2Div");
		var areaObject=document.getElementById("keyword");
		if(udiv.style.display!="block"){
			ev = ev || window.event;
			var mousePos = getPosition(areaObject);
			var h=document.body.clientHeight 
			udiv.style.position = "absolute";
			udiv.style.top = mousePos.y-130;
			udiv.style.left = mousePos.x-95;
			udiv.style.display="block";
		}
	document.getElementById("key1Div").style.display="none";
	document.getElementById("key3Div").style.display="none";
	}
		else{
			if(key1=="3"){

			var selectList=document.getElementsByTagName("select");
			for(var i=0;i<selectList.length;i++){
				if(selectList.item(i).retSelect){

				}else{
					selectList.item(i).style.display="none";
				}
			}
			udiv=document.getElementById("key3Div");
			var areaObject=document.getElementById("keyword");
			if(udiv.style.display!="block"){
				ev = ev || window.event;
				var mousePos = getPosition(areaObject);
				var h=document.body.clientHeight 
				udiv.style.position = "absolute";
				udiv.style.top = mousePos.y-105;
				udiv.style.left = mousePos.x-95;
				udiv.style.display="block";
			}

			document.getElementById("key1Div").style.display="none";
			document.getElementById("key2Div").style.display="none";
				}
			else{
			var selectList=document.getElementsByTagName("select");
			for(var i=0;i<selectList.length;i++){
				if(selectList.item(i).retSelect){

				}else{
					selectList.item(i).style.display="block";
				}
			}
				document.getElementById("key1Div").style.display="none";
				document.getElementById("key2Div").style.display="none";
				document.getElementById("key3Div").style.display="none";
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

function checkRefer(refer1Id,refer2Id){
	if(refer2Id!=0){
	document.getElementById(refer2Id).checked=true;
	}
	document.getElementById(refer1Id).checked=true;
	if(document.getElementById(refer1Id).value==1){
	document.getElementById("youxing").style.display="block";
	}else{
	document.getElementById("youxing").style.display="none";
	}
}

function checkRefer1(refer1Id){
	document.getElementById(refer1Id).checked=true;
}


function checkCase(case2Id,caseId){
	document.getElementById(case2Id).checked=true;
	document.getElementById(caseId).checked=true;
}

function checkCase1(caseId){
	document.getElementById(caseId).checked=true;
}

function checkReception(reception2Id,receptionId){
	document.getElementById(reception2Id).checked=true;
	document.getElementById(receptionId).checked=true;
}

function checkReception1(receptionId){
	document.getElementById(receptionId).checked=true;
}

function lian1(){
		if(document.getElementById("kkk1").style.display="block")
		{
		document.getElementById("kkk1").style.display="none";
		document.getElementById("kkk2").style.display="block";
		}
	}
function lian2(){		
		if(document.getElementById("kkk2").style.display="block")
		{
		document.getElementById("kkk2").style.display="none";
		document.getElementById("kkk1").style.display="block";
		
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
function ryq(){
	var request2yiban=document.getElementById("xzfyqq1");
	var requestValue=document.getElementById("request2yiban").value;
				if(requestValue==0){
					request2yiban.value="无";
					request2yiban.innerHTML="";
				}else if(requestValue==1){
					request2yiban.value="请求撤销该具体行政行为";
					request2yiban.innerHTML="请求撤销该具体行政行为";
				}else if(requestValue==2){
					request2yiban.value="请求变更该具体行政行为";
				}else if(requestValue==3){
					request2yiban.value="请求确认该具体行政行为违法";
				}else if(requestValue==4){
					request2yiban.value="请求责令被申请人履行法定职责";
				}else if(requestValue==5){
					request2yiban.value="请求确认被申请人不履行法定职责违法";
				}

}
function ryq2(){
	document.getElementById("mingque").value=document.getElementById("ismingque").value;
}

function closeBzw(){
	document.getElementById("requesttype").style.display="none";
	document.getElementById("requesttype2").style.display="none";
	document.getElementById("requesttype3").style.display="none";
	document.getElementById("closeBzw").style.display="none";
	document.getElementById("getBzw").style.display="block";
	var menuString;
	var use_type=document.getElementById("use_type").value;
	menuString="行政不作为事项："+use_type+"；<br>";
	var zhize=document.getElementById("zhize").value;
	menuString=menuString+"要求履责："+zhize+"；<br>";
	var usedate=document.getElementById("usedate").value;
	menuString=menuString+"履行日期："+usedate+"；<br>";
	var mingque=document.getElementById("mingque").value;
	menuString=menuString+"证明材料："+mingque;
	document.getElementById("xw_an").innerHTML=menuString;
	document.getElementById("require_fy").value=menuString;
}

function closeBzw1(){
	if(document.getElementById("requestrrr").value==2){
	document.getElementById("requesttype").style.display="none";
	document.getElementById("requesttype2").style.display="none";
	document.getElementById("requesttype3").style.display="none";
	document.getElementById("closeBzw").style.display="none";
	document.getElementById("getBzw").style.display="block";
	var menuString;
	var use_type=document.getElementById("use_type").value;
	menuString="行政不作为事项："+use_type+"；<br>";
	var zhize=document.getElementById("zhize").value;
	menuString=menuString+"要求履责："+zhize+"；<br>";
	var usedate=document.getElementById("usedate").value;
	menuString=menuString+"履行日期："+usedate+"；<br>";
	var mingque=document.getElementById("mingque").value;
	menuString=menuString+"证明材料："+mingque;
	document.getElementById("xw_an").innerHTML=menuString;
	document.getElementById("require_fy").value=menuString;
	}
}

function getBzw(){
	document.getElementById("requesttype").style.display="block";
	document.getElementById("requesttype2").style.display="block";
	document.getElementById("requesttype3").style.display="block";
	document.getElementById("closeBzw").style.display="block";
	document.getElementById("getBzw").style.display="none";
}

function setKnowDate(){
	var year=document.getElementById("knowy").value;
	var month=document.getElementById("knowm").value;
	var day=document.getElementById("knowd").value;
	var knowDate="";
	if(year!=0){
		knowDate=year+"年";
		if(month!=0){
			knowDate=knowDate+month+"月";
			if(day!=0){
				knowDate=knowDate+day+"日";
			}
		}
	}
	document.getElementById("zhidaodate").value=knowDate;
}

function setKnowDate1(){
	var year=document.getElementById("knowy1").value;
	var month=document.getElementById("knowm1").value;
	var day=document.getElementById("knowd1").value;
	var knowDate="";
	if(year!=0){
		knowDate=year+"年";
		if(month!=0){
			knowDate=knowDate+month+"月";
			if(day!=0){
				knowDate=knowDate+day+"日";
			}
		}
	}
	document.getElementById("usedate").value=knowDate;
}

function check_shencha(idValue){
	if(idValue==1)
		document.getElementById("shencha").style.display="block";
	else
		document.getElementById("shencha").style.display="none";

}

 function getPosition1(obj){
  //alert(obj.tagName);
  var result = 0;
  if(obj.selectionStart){ //非IE浏览器
   result = obj.selectionStart
  }else{ //IE
   var rng;
   if(obj.tagName == "TEXTAREA"){ //如果是文本域
    rng = event.srcElement.createTextRange();
    rng.moveToPoint(event.x,event.y);
   }else{ //输入框
    rng = document.selection.createRange();
   }
   rng.moveStart("character",-event.srcElement.value.length);
   result = rng.text.length;
  }
  return result;
 }

 function getValue1(obj){
     var pos = getPosition1(obj);
	 var answerValue=document.getElementById("otheradvice");
	 if(answerValue.value.length>0){
		var v1=answerValue.value.substring(0,pos);
		var v2=answerValue.value.substring(pos,answerValue.length);
		if(pos==answerValue.value.length)
			answerValue.value=v1+"\n问：\n答：";
		else
			answerValue.value=v1+"\n问：\n答："+v2;
	 }else{
		answerValue.value="问：\n答：";
	 }
 }

 function setWtDate1(){
	var year=document.getElementById("wtsj1").value;
	var month=document.getElementById("wtsj2").value;
	var day=document.getElementById("wtsj3").value;
	var knowDate="";
	if(year!=0){
		knowDate=year+"年";
		if(month!=0){
			knowDate=knowDate+month+"月";
			if(day!=0){
				knowDate=knowDate+day+"日";
			}
		}
	}
	document.getElementById("wtsj").value=knowDate;
 }
 
 function anNumConfirm(){
 	var anNumYear=document.getElementById("anNumYear").value;
 	var anNum=document.getElementById("anNumAdd").value;
 	var beappname=document.getElementById("beappname").value;
 	if(beappname==""||beappname=="0"){
 		alert("请选择被申请人名称");
 		return false;
 	}
 	if(anNumYear==""){
 		alert("请填写年份");
 		return false;
 	}
 	if(anNum==""){
 		alert("请填写案号");
 		return false;
 	}
 	url="../jds/anNumConfirm.action?funcCode=${funcCode}&anNum="+encodeURI(encodeURI(anNum))+"&anNumYear="+encodeURI(encodeURI(anNumYear))+"&beappname="+encodeURI(encodeURI(beappname));
                  var myAjax = 	new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: anNumConfirmReturn // 指定请求成功完成时需要执行的方法
                }
            );
 }
 

//查询
function anNumConfirmReturn(response) {
   var recoredList=response.responseText.split(",");
   if(recoredList!="无相关记录"){
   		alert(recoredList);
   }else{
	   alert(recoredList);
   }
}

function slfs(){
    if(document.getElementById("slfsid").value==6){
	document.getElementById("qtslfslabel").style.display="block";
	document.getElementById("qtslfsinput").style.display="block";
	}
	else{
	document.getElementById("qtslfslabel").style.display="none";
	document.getElementById("qtslfsinput").style.display="none";
	}
}

function delayNotbreak()
{
	document.getElementById("BAbreak_y").checked=false;
	document.getElementById("BAbreak_n").checked=true;
	//breaknochecked();
	window.zhongzhi.style.display='none';
    
}

function delaynochecked(){
	document.getElementById("delayreport").value="";
	document.getElementById("delayto").value="";
}

function breakNotdelay()
{
	document.getElementById("BAdelay_y").checked=false;
	document.getElementById("BAdelay_n").checked=true;
	//delaynochecked();
	window.yanqi.style.display='none';
    
}

function breaknochecked(){
	document.getElementById("breakreport").value="";
	document.getElementById("breakto").value="";
}

function jafs(){
	if(document.getElementById("finishtype1").value==7){
		document.getElementById('tiaoJieButton').style.display="inline";
		document.getElementById('subjectOtherState').style.display="block";
		document.getElementById("finishtype2").style.display="none";	
		document.getElementById("finishtype2").name="ss";
		return;
	}
	if(document.getElementById("finishtype1").value==8){
		document.getElementById('tiaoJieButton').style.display="none";
		document.getElementById('subjectOtherState').style.display="none";
		document.getElementById("finishtype2").style.display="block";	
		document.getElementById("finishtype2").name="app_transaction.TFinishBreakType";
		return;
	}
	document.getElementById('tiaoJieButton').style.display="none";
	document.getElementById('subjectOtherState').style.display="none";
	document.getElementById("finishtype2").style.display="none";	
	document.getElementById("finishtype2").name="ss";
}

function changeSub(){ 

}
</script>
</html>