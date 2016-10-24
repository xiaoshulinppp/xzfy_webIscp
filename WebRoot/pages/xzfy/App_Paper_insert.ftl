<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<title>来信申请行政复议</title>

<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/prototype.js"></script>
<script type="text/javascript" src="../sys_theme/js/function.js"></script>

<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>

<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>

<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<SCRIPT src="../css/01/setday.js"></SCRIPT>
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 
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
<#include "../website/header.ftl">
<form action="../jds/xzfyInfoInsertSub.action" name="form1" id="form1" method="post" >


<!--标题表格结束-->
<!--主体内容、列表显示区域-->
<#-- 
<input name="xzfyInfo.TAdd" type="hidden" id="Tadd" value="0"/ >
<input name="xzfyInfo.TId" type="hidden" class="input2" title="请输入正确的姓名，格式在20个汉字以内" value="">
<input id="appstring" type=hidden name="appString">
 <input name="xzfyInfo.appType" type="hidden" value=2>
-->

<input id="xzfyId" name="xzfyInfo.id" value="${xzfyId}" type="hidden">
<input name="xzfyInfo.applicationsum" value=1 type='hidden'>
<input name="xzfyInfo.tAppDeptId" type="hidden" class="input2" id="deptid" />
<input name="xzfyInfo.admit1" value="${admit_name}" type='hidden'>
<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="sta" id="sta" value="" />
<input id="conutAppname" type=hidden name="">
<input type="hidden" name="xzfyInfo.receive_type" value="2" />

<div class="wal pageNow2">
      <div class="fl">当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;  <a href="../xzfy/openReceive.action?funcCode=${funcCode}">接收/新增案件</a>  >&nbsp;&nbsp; 来信接收复议申请</div>

</div>


<div class="" style="padding-top:0px;">

<div class="wal">
<!--wal-->

 <div class="formTitle2">来信接收复议申请</div>

      <div class="form2">
      <div class="bg">
              <div border="0" >
	<div class="btn" >
	<div class="fl" >
		<a href="../xzfy/tiquPaperList.action?funcCode=${funcCode}" title="案件提取"  >案件提取</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<th>外网接入案件查询(请输入案件码)：</th>
			<td>
				<input name="anjianma" id="anjianma" type="text" value="" altname="第二接待人"  >    
			</td>  
			<td>
			
			<input  type="button"  onclick="anjiancx()"   value="查询">
			
			</td>
		
		
		
		
	</div>
	</div>
</div>
       <table width="95%">
                  <tr >
    <th  width="20%">来信人姓名：</th>
    <td  width="30%">
    <input name="xzfyInfo.laixin_name" type="text" class="input2" 
    id="user" ischeck="y" altname="来信人姓名" >
    
    <th  width="20%">接收日期：</th>
    <td  width="30%">
    <input name="xzfyInfo.receive_date" type="text"
     id="receivedate" class="input2" ischeck="y"
      onClick="WdatePicker()" altname="接收日期" value="${todate[0..9]}">
      </td>
  </tr>
  <tr class="trwhite">
    <th >来信人通信地址：</th>
	    <td >
	    <input name="xzfyInfo.laixin_address" type="text" id="dlr1" class="input2" title="请输入正确的姓名，格式在50个汉字以内"></td>
	    </td>
    <th >来信人邮编：</th>
    <td ><input name="xzfyInfo.laixin_post" type="text" id="handlesecond" ischeck="y" class="input2" altname="邮编"></td>
    </tr>
  <tr class="trwhite">
    <th >来文编号：</th>
    <td ><input name="xzfyInfo.zhize" type="text" id="zhize" class="input2" altname="来文编号" ></td>
    <th >来信人电话：</th>
    <td ><input name="xzfyInfo.laixin_tel" type="text" id="phone" ischeck="y" class="input2" altname="被接待人电话" ></td>
  
  </tr>
  
  <tr class="trwhite">
      <th><font color="red">*</font>申请人类别：</th>
	   <td>
	   <@ww.select  name="'xzfyInfo.app_type'" id="applicationtype" headerKey="''" headerValue=""  list="getDictMap('sqrlb')" value="" onchange="'checksqr()'"/>
	   </td>
	   <th><font color="red">*</font>申请人人数：</th>
    <td><input name="xzfyInfo.renCount" id="rencount" onBlur="renCount()" onchange="setCountAppname('shenqingren','rencount')"   type="text" class="input2" altname="申请人人数"></td>
   </tr>
   <tr  id="shenqingren1">
  	<th ><font color="red">*</font>申请人：</th>
    <td  colspan=3>
    <a href="javascript:setApp('#appDiv',2)" style="display:block" id="appspan">添加</a>
    <textarea name="xzfyInfo.appdetail" readonly type="text" class="textarea" onchange="setCountAppname('shenqingren','rencount')" id="shenqingren" ischeck="y" altname="申请人" style="overflow-y:visible;"  ></textarea>
    </td>
   </tr>
   <tr class="trwhite" id="sqr" style="display:none">
    <th><font color="red">*</font>申请人名称：</th>
    <td colspan=3>
	<a href="javascript:setFr('#frDiv',2)" id="frspan" >添加</a><br>
    <textarea name="xzfyInfo.agentDetail" type="text" id="appname" class="textarea" ischeck="y" altname="法人" style="overflow-y:visible;" readonly></textarea>
    </td>
   </tr>
    <input type="hidden" id="tiqu" value="0">
   <tr id="daibiaorendiv" style="display:none"> 
	<th>代表人：</th>
	<td  colspan=3>
		    <a href="javascript:setDeputy('#deputyDiv',2)" style="display:block" id="deputyspan">添加</a>
		<#--<a href="javascript:opendg('xzfy/addDeputy.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=1&textId=deputy&deputy=1',900,600)"  style="display:block" id="appspan1">添加</a>
		-->
    	<textarea name="xzfyInfo.dbrDetail" type="text" readonly class="textarea"  id="deputy" ischeck="y" altname="代表人" style="overflow-y:visible;"></textarea>
	</td>	    
   </tr>
  <tr >
    <th >代理人：</th>
	<td ><input name="xzfyInfo.agent_name"  type="text" class="input2" altname="代理人" maxlength="50"></td>
	<th >&nbsp;</th>
	<td >&nbsp;</td>
   </tr>	
   <tr  id="jddlr2">
    <th >第三人：</th>
    <td ><input name="xzfyInfo.third" id="dsdlr1" type="text" class="input2"  altname="第三人" maxlength="50" value="无"></td>
	<th >第三人代理人：</th>
	<td ><input name="xzfyInfo.third_agent" type="text" class="input2"  altname="第三人代理人" maxlength="50" value="无"></td>
   </tr>
 <!-- 
  <tr >
   <th >多人复议：</th>
   <td > 
   <input type="radio" name="xzfyInfo.isMany" value="是" id="duoren_y" ischeck="y" altname="多人复议">
   <label for="duoren_y">是 </label>
   <input type="radio" name="xzfyInfo.isMany" value="否" id="duoren_n" ischeck="y" altname="多人复议" checked>
   <label for="duoren_n">否</label></td>
   
   <th >复议机关：</th>
 
    <td >
	    <select name="xzfyInfo.xzfy_org"  altname="复议机关" class="selectStyleNormal" >
			
		  <option value="0">----请选择----</option>	  
		  <option value="2">县级政府</option>		  
		  <option value="3">县级政府的部门</option>	 
		  <option value="6">省部级行政机关</option>
		  <option value="7">省级政府的部门</option>
	    </select>
    </td>
  </tr>
  -->
  <tr >
  <th><font color="red">*</font>被申请人种类：</th>
   <td >
  	<select name="xzfyInfo.defendant_type" id="beapptype" onchange="aaa()">
	    <option value="0">--请选择--</option>
		<#list zlList as zl>
		<option value="${zl.value}" >${zl.name}</option>
	    </#list>
	</select>      
    </td>
     <th ><font color="red">*</font>被申请人名称：</th>
     <td  style="display:none;" id="beappnametd">   
     <input name="ssss" type="text" class="input2" id="beappnameinput" altname="被申请人名称">
    </td> 
    <td  style="display:block;" id="beappnamesel">  
    <select name="xzfyInfo.defendant_name" ischeck="y" id="beappname"
     onchange="beappcode()" altname="被申请人名称" class="selectStyleNormal">
      <option value="0" deptcode="">----请选择----</option>     	 
    </select>    
    </td>
    
    <td  style="display:none;" id="beappnametd">
   <input name="sss" type="text" class="input2" id="beappname2" >
    </td>
    </tr>
   <tr id="jutixingwei">
    <th >被复议的具体行为-名称：</th>
    <td ><input name="xzfyInfo.xwname" id="xingwei" type="text" ischeck="y" altname="被复议的具体行为-名称" class="input2" title="请输入正确的名称"></td>
     <th >被复议的具体行为-文号：</th>
    <td ><input name="xzfyInfo.xwnum" type="text" id="annum" class="input2" ischeck="y" altname="文号"></td>
  </tr>
   
   
   
   
   <tr  id="mingan">
    	<th><font color="red">*</font>是否行政不作为：</th>
	    <td>
	     <input name="xzfyInfo.ismanage" id="requestrrr_y"  value="2" onclick="szfyqq(2)" type="radio" ><label for="requestrrr_y">是</label>
	        <input name="xzfyInfo.ismanage" id="requestrrr_n"  value="0" onclick="szfyqq(0)" type="radio"  checked><label for="requestrrr_n">否</label>
	        <input type="hidden" id="requestrrr" value="0">
		</td>
     
	    <th><div id="bzwshixiang" style="display:none">不作为事项：</div></td>
   		<td>
	   		<div id="bzwshixiang1" style="display:none">
			  <select name="xzfyInfo.matter_type" id="use_type"  onchange="setBzw()">
			     <option value="0">----请选择----</option>
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
			  <textarea class="textarea" name="xzfyInfo.matter_detail" id="bzwbc" style="overflow-y:visible;"></textarea>
			  </span>
		  </div>
	  	</td>   
   	</tr>
   <script>
   	function szfyqq(a){
   		if(a=="2"){
			document.getElementById("bzwshixiang").style.display="block";
			document.getElementById("bzwshixiang1").style.display="block";
			document.getElementById("jutixingwei").style.display="none";
		}
		if(a=="0")
		{
			document.getElementById("bzwshixiang").style.display="none";
			document.getElementById("bzwshixiang1").style.display="none";
			document.getElementById("jutixingwei").style.display="block";
			document.getElementById("use_type").value="0";
		}
   	}
   </script>
   
   
   
   
   
   
   
   
   
   
   
   
   
     <tr >
     <th ><font color="red">*</font>行政复议请求：</th>
    <td   colspan=3>
      <textarea name="xzfyInfo.xzfy_requset_retail" id="xzfyqq1" type="text"  class="textarea"   rowspan="5" altname="行政复议请求"></textarea></td>
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
		     <input type="radio" name="xzfyInfo.isfront" value="否" id="fyqz_n" ischeck="y" checked altname="复议前置" checked>
	        <label for="fyqz_n">否</label>
        </td>
        <th >是否申请对规范性文件审查：</th>
	    <td ><input type="radio" name="xzfyInfo.ischeck" nbzcheck="y" altname="对规范性文件审查" value="是" id="gfsc_y" onclick="check_shencha('1')">
	        <label for="gfsc_y">是 </label>
	        <input type="radio" name="xzfyInfo.ischeck" altname="对规范性文件审查" value="否" nbzcheck="y"  id="gfsc_n" onclick="check_shencha('2')" checked>
	        <label for="gfsc_n">否</label>
		<span id="shencha" style="display:none">规范文件：
			<textarea name="xzfyInfo.check_file"  id="post2" class="textarea"></textarea></span>
	    </td>
	</tr>
	 <tr >
  <th>受理机关：</td>
    <td><select name="sljg" id="sljg" >
	   <option value="${localBm}" selected>${localName}</option>
	    <#if localBm != "0000" && localBm[0..1]?number<19>
	    <option value="${upBm}">${upName}</option>
	    </#if>
    	</select>
    </td> 
    <th></th>
    <td></td>
 </tr>
	<!--
	 <tr>
 <th>上传申请书、申请人身份证明、委托手续</th>
 <td><input name="upFile1" type="file" id="upFile1" /></td>
 <th>上传其他证据材料</th>
 <td>
     <a href="#" onclick="addattachment()" >添加</a>
 	 <div id="newdiv" >
 	 	<div id="firstDiv">    			
	    		<input name="upFile2" type="file" id="upFile2" class="inputTextFile" />
	    		<a href="#" onClick="delFile('firstDiv')" >删除</a>
	    </div>    			
 	 </div>
 </td>
 </tr>
 -->
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
		     <select name="xzfyInfo.keyword" ischeck="y" altname="统计关键词" class="selectStyleNormal" id="keyword" onchange="countKey()">
		        <option value="0">----请选择----</option>
			 	<option value="1">属于复议范围</option>
			    <option value="2">不属于复议范围</option>
			 </select>	 
	    <td  colspan=2>
	    <span id="countRs"></span>
	    </td>
    </tr>
    -->
<input name="xzfyInfo.menu" type="hidden" id="menuSave">


<tbody id="jdcl1" style="display:none;">
 <tr >
  	<th >接待处理：</th>
    <td >
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
  <div align="center" border="0">
 <div class="btn">
                       <div class="fl">
<a href="#" title="提交" onclick="javascript:saveNew('${xzfyId}')">提交</a>
<a href="#" title="返回" onclick="javascript:back()">返回</a>
                       </div>
                  </div>
      </div>
      </div>
 
</div>
</div>


<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>

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
	<td >
	.接收复议申请材料&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='5'><br>
	.接收行政复议监督案件&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='6'><br>
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


<div id="frDiv" style="position:absolute;display:none;" class="formDiv">
 <div class="btn">
                       <div class="fl">
<a href="javascript:addFr()">继续添加</a>
</div>
<div class="fr">
<a href="javascript:checkFr();closeDivById('frDiv')">完成</a>
<a href="javascript:closeDivById('frDiv')">关闭</a>
                       </div>
                  </div>
</table>
<table width="90%">
<tr>
<td id="tfaren">
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="appfaren">
<tr>
<th >
申请人：</th>
<td colspan=3>
<input name="frsqr" onchange="checkComma(this)" isUser="true" size="50" value=""/>
</td>
</tr>
<tr>
<th>
	代表人类别：</th>
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
<th width="18%">
代表人姓名：
</th>
<td width="32%"><input onchange="checkComma(this)" name="fuzeren" isUser="true" value=""/>
</td>

</tr>
	<tr>
	<th width="18%">
	送达地址：</th>
<td width="32%">
<textarea name="fzraddress" onchange="checkComma(this)" isUser="true" ></textarea>
<!--<input name="fzraddress" isUser="true" value="" size=30/>-->
	</td>
	<th>
	邮编：</th>
<td><input name="fzrpost" onchange="checkComma(this)" isUser="true" value=""/>
	</td>	
	</tr>
	<tr>
	<th>
	电话：</th>
<td><input name="fzrtele" onchange="checkComma(this)" isUser="true" value=""/>
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
<td align='left'><input value="删除" type="button" class="btn1" onclick="deleteFr(this)"></td>

</tr>
</table>
<table  id="insfaren">
&nbsp;
</table>
</td></tr>
</table>
</div>

<div id="userDiv" style="position:absolute;display:none;" class="formDiv" >

 <div class="btn">
                       <div class="fl">
<a href="javascript:addUser()" title="继续添加"  >继续添加</a>
</div>
<div class="fr">
<a href="javascript:addUser:closeDiv1()" title="完成"  >完成</a>
<a href="javascript:closeDivById('userDiv')" title="关闭"  >关闭</a>

                       </div>
                  </div>

<table  width="90%">
   <tr >
  	<td id="tuser">
  	<table width="100%" border="0" cellspacing="0" cellpadding="0"  id="app">
<tr>
<th width="15%">被接待人：</th>
<td width="35%"><input name="bjdr1" isUser="true" value=""/></td>
<th width="15%">性别：</th>
<td width="35%"><select name="bsex" isUser="true" retSelect="1" >
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

<div id="appDiv" style="position:absolute;display:none;" class="formDiv">
<div class="btn">
<div class="fl">
<a href="javascript:addApp()">继续添加</a>
</div>
<div class="fr">
<a href="javascript:closeApp()" id="appEnd">完成</a>
<a href="javascript:closeDivById('appDiv')">关闭</a>
</div>
</div>

<table width="90%">
<tr>
<td id="tapp">
<table width="100%" border="0" cellspacing="0" cellpadding="0"  id="appapp">
<tr>
<th>申请人：</th>
<td><input name="appsqr" onchange="checkComma(this)" isUser="true" value=""/></td>
<th>性别：</th>
<td><select name="appsex" isUser="true" retSelect="1">
	<option value="男">男</option>
	<option value="女">女</option>
	</select></td>
	</tr>
<tr>
	<th>身份证号：</th>
	<td><input name="appnum" onchange="checkComma(this)" isUser="true" value="" />
	</td>
	<th>
	送达地址：
	</th>
	<td>
	<textarea name="appaddress" onchange="checkComma(this)" type="text" isUser="true"></textarea>
	</td>
</tr>
<tr>
	<th>
	邮编：
	</th>
	<td><input name="apppost" onchange="checkComma(this)" isUser="true" value=""/>
	</td>
	<th>
	电话：
	</th>
	<td><input name="appphone" onchange="checkComma(this)" isUser="true" value='' />
	<a href="#" onclick="deleteApp(this);return false;" title="删除"  >删除</a>
	</td>
</tr>
</table>
<table  id="insapp">
&nbsp;
</table>
</td></tr>
</table>
</div>

<div id="deputyDiv" style="width:610px;position:absolute;display:none;" class="formDiv">
	<div class="btn">
		<div class="fr">
			<a href="javascript:addApp:closeDep()">完成</a>
			<a href="javascript:addUser:closeDivById('deputyDiv')">关闭</a>
		</div>
	</div>
</tr>
<table   id="dep" style="width:600px;">
	<tr style="width:600px;">
		<th style="width:25%">
		请选择代表人：
		</th>
		<td id="xuandbr">

		</td>
	</tr>
</table>
</div>

<div id="fileDiv" style="position:absolute;display:none;" class="formDiv">
 <div class="btn">
                       <div class="fl">
<a href="javascript:addFile()">继续添加</a>
</div>
<div class="fr">
<a href="javascript:closeFile()">完成</a>
<a href="javascript:resetFile1()">不添加</a>
                       </div>
                  </div>

	<table width="90%">
		<tr>
		<td id="tfile">
		<table  id="fileapp" isfilediv="1" class="">
		<tr><th>
		文件名：
		</th>
		<td><input name="filemodel" isUser="true" value=""/>
		</td>
	<th>
	类型：
	</th>
	<td><select name="filetype" isUser="true" retSelect="1">
	<option value="（复印件）" selected>复印件</option>
	<option value="（原件）">原件</option>
	</select>
	</td>
	</tr>
	<tr>
	<th>
	页数：
	</th>
	<td><input name="filepage" isUser="true" value='' size=2/>
	</td>
	<th>
	份数：
	</th>
	<td><input name="filecount" isUser="true" value="" size=2/>
	<input value="删除" type="button" class="buttonNormal" onclick="deleteFile(this)">
	</td></tr>
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
由于申请人今天补齐申请材料或者明确有关内容，我们从今日起计算行政复议受理审查和案件审理期限，并将依法处理。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('由于申请人今天补齐申请材料或者明确有关内容，我们从今日起计算行政复议受理审查和案件审理期限，并将依法处理。')">
</td></tr>
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
（五）合伙企业申请行政复议，无企业核准登记证明复印件和执行合伙事务的合伙人身份证明；<input value="合伙企业申请行政复议，无企业核准登记证明复印件和执行合伙事务的合伙人身份证明" type="checkbox" class="checkbox" onclick="addbz('（五）合伙企业申请行政复议，无企业核准登记证明复印件和执行合伙事务的合伙人身份证明；')">
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
function anjiancx(){
//alert("12332");
       var aa=document.getElementById("anjianma").value;
        listForm_= document.getElementById("form1");
		listForm_.action="../gjcx/anjiancx.action?name1=2&&g_caseorg=${localBm}&&w_queryType=1";
	
	//	alert(aa);
			
    	listForm_.submit();
   

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
	//document.getElementById("divxzgllbinput").innerHTML='<input name="xzfyInfo.TReferOther" type="text" altname="行政管理类别" id="xzgllbinput" class="input2">';
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

<#list bList as dl>	
       subcat[${dl_index}]=new Array("${dl.type}","${dl.name}","${dl.value}"); 
       count++;    
</#list>


function aaa() {
	var aaa = document.getElementById('beapptype').value;
	if(aaa==8){
		document.getElementById("beappnameinput").setAttribute("ischeck","y");
		document.getElementById("beappnametd").style.display="block";
		document.getElementById("beappnamesel").style.display="none";
		document.getElementById("beappnameinput").name="xzfyInfo.defendant_name";
		document.getElementById("beappname").name="ssss";
		document.getElementById("beappname").removeAttribute("ischeck");
	} else {
		document.getElementById("beappname").setAttribute("ischeck","y");
	    document.getElementById("beappnamesel").style.display="block";
		document.getElementById("beappnametd").style.display="none";
		document.getElementById("beappname").name="xzfyInfo.defendant_name";
		document.getElementById("beappnameinput").name="ssss";
		document.getElementById("beappnameinput").removeAttribute("ischeck");
		document.getElementById('beappname').length = 0; 
		document.getElementById('beappname').options[document.getElementById('beappname').length] = new Option("----请选择-----", "0");
       var x;
        for (x=0; x < count; x++)
         {
            if (subcat[x][0] == aaa)

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
	if (document.getElementById("applicationtype").value=="1") {
		if(document.getElementById("shenqingren").value==""){
			alert("请填写申请人！");
			return false;
		}
	} else {
		if(document.getElementById("appname").value==""){
			alert("请填写申请人！");
			return false;
		} 
	}
	
	if (document.getElementById("beapptype").value=="0") {
		alert("请填写被申请人种类！");
			return false;
	}
	if(document.getElementById('beapptype').value==8){
		if(document.getElementById('beappnameinput').value==""){
			alert("请填写被申请人名称！");
			return false;
		}
	} else {
		if(document.getElementById('beappname').value=="0"){
			alert("请填写被申请人名称！");
			return false;
		}
	}

	if (document.getElementById("xzfyqq1").value==""){
		alert("请填写行政复议请求！");
			return false;
	}

	listForm_= document.getElementById("form1");	
	listForm_.action="savePaper.action?xzfyId=" + id;
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

	function dangmian(){
		window.location.href("../xzfy/appFYfaceInsert.action?funcCode=${funcCode}");
	}
	
	function laixin() {
		window.location.href("../xzfy/appPaperInsert.action?funcCode=${funcCode}");
	}
	
	function addattachment(){
		var a=document.createElement('div');
		a.id="div"+count;
		a.innerHTML="<input type=\"file\" name=\"upFile2\" id=\"upFile2\" class=\"inputTextFile\" />"+"&nbsp<a href=\"#\" onClick=\"del(\'"+a.id+"\')\">删除</a>";
		document.getElementById("newdiv").appendChild(a);
		count++;
	}
	
	function delFile(id){
		var e = document.getElementById(id);
		document.getElementById("newdiv").removeChild(e);
		count--;
 
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

			}
		}


}

</script>
</html>
