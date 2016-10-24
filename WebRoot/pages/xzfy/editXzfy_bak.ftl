<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>当面接待</title>


<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css" />

</head>

<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
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
<body>
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control>
  <tr>
    <td height="20">您的位置：行政复议案件管理 -&gt; 当面接待案件登记</td>
  </tr>
</table>
<!--您的位置表格结束-->
<!--标题表格开始-->
<!--标题表格结束-->
<!--主体内容、列表显示区域-->
<input type="hidden" name="funcCode" value="${funcCode}" />

 <div id="kkk1" style="display:block">
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">

<tr class="trcolor">
     <td class="tdFormText" width="25%">接待日期：</td>
    <td class="tdFormInput" width="25%">
    <input name="xzfyInfo.receive_date" type="text"
     class="inputTextNormal"  value="${xzfyInfo.receive_date}"
    onClick="WdatePicker()" altname="接待日期" >
      </td>
    
 <td class="tdFormText">申请人类别：</td>
	   <td class="tdFormInput">
	   <@ww.select  name="'xzfyInfo.app_type'" id="applicationtype" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('sqrlb')" value="'${xzfyInfo.app_type?default('')}'.toString()" onchange="'checksqr()'"/>
	   <#--
	   <select name="xzfyInfo.app_type" id="applicationtype"  ischeck="y" altname="申请人类别" 
	   	onchange="checksqr()">
		   <option value="1" selected>公民</option>
		   <option value="2">法人或其他组织</option>
	   </select>
	   -->
	   </td>
  </tr>

  <input id="xzfyId" name="xzfyInfo.id" value="${xzfyId}" type="hidden">
   <tr class="trcolor">
	<td class="tdFormText">申请人人数：</td>
    <td class="tdFormInput"><input name="" id="rencount" onBlur="renCount()" onpropertychange="isDeputy()" type="text" class="inputTextNormal" altname="申请人人数"></td>
  	<td class="tdFormText">申请人：</td>
    <td class="tdFormInput" colspan=3>
    <#if xzfyInfo.app_type?exists && xzfyInfo.app_type='1'>
    <a href="javascript:opendg('../xzfy/addApp.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=1&textId=shenqingren&countId=rencount',900,600)"  style="display:block" id="appspan1">添加</a>
    <#elseif xzfyInfo.app_type?exists && xzfyInfo.app_type='2'>
    <a href="javascript:opendg('../xzfy/addLegal.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=2&textId=shenqingren&countId=rencount',900,600)"  style="display:none" id="appspan2">添加</a>
    </#if>
    <textarea name="xzfyInfo.appdetail" type="text" class="textarea" id="shenqingren" ischeck="y" altname="申请人" >${xzfyInfo.appdetail?default('')}</textarea>
    </td>
   </tr>
   <tbody id="daibiaorendiv" style="display:none">
	    <tr class="trcolor"> 
		    <td class="tdFormText">代表人和联系人：</td>
		    <td class="tdFormInput" colspan=3>
		    <a href="javascript:opendg('../xzfy/addDeputy.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=1&textId=deputy&deputy=1',900,600)"  style="display:block" id="appspan1">添加</a>
    		<textarea name="" type="text" class="textarea"  id="deputy" ischeck="y" altname="代表人" style="width:300px;overflow-y:visible;"></textarea>
		    </td>
	    </tr>
   </tbody> 
  
  <tr class="trcolor">
   <td class="tdFormText">是否有代理人：</td>
    <td class="tdFormInput">
    <@ww.select  name="'xzfyInfo.agent'" id="isdlr" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('sfdlr')" value="'${xzfyInfo.agent?default('')}'.toString()" onchange="'checkdlr()'"/>
    <#--
    <select name="xzfyInfo.agent" id="isdlr" onclick="checkdlr()" >
    <option value="0">无</option>
    <option value="1">有</option>
    </select>
    -->
    </td>

   <td class="tdFormText">&nbsp;</td>
	<td class="tdFormInput">&nbsp;</td>
	
	
  </tr>	
  <#if xzfyInfo.agent?exists && xzfyInfo.agent='1'>
  <tbody id="dailiren">
	<tr class="trcolor">
		<td class="tdFormText">代理人人数：</td>
	    <td class="tdFormInput"><input name="" id="agentCount" type="text" class="inputTextNormal" altname="代理人人数"></td>
	    <td class="tdFormText" id="agent3">代理人：</td>
    <td class="tdFormInput" colspan=3 id="agent4">
    <a href="javascript:setAgent()"  style="display:block">添加</a>
    <textarea name="xzfyInfo.agent_name" type="text" class="textarea" id="agent" ischeck="y" altname="代理人" >${xzfyInfo.agent_name?default('')}</textarea>
    </td>
	</tr>
  </tbody>
  
   <tr class="trwhite" id="jddlr" >
    <td class="tdFormText">代理人类别：</td>
    <td class="tdFormInput">
      
    <@ww.select  name="'agType'" id="agType" headerKey="''" headerValue="'--请选择--'" value="" list="getDictMap('dlrlb')" onchange="'checkdlr1()'"/>
   <#--
    <select name="agType" id="agType" onchange="checkdlr1()" retSelect="1">
	 <option value="0">----请选择----</option>
	 <option value="1">委托代理</option>
	 <option value="2">法定代理</option>
	</select>
	-->
	</td>
    
     <td class="tdFormText" id="weituoType1" ></td>
    <td class="tdFormInput" id="weituoType2"></td>
    
    <td class="tdFormText" id="weituoType3" style="display:none">委托代理类别：</td>
    <td class="tdFormInput" id="weituoType4" style="display:none">
    <@ww.select  name="'weituoType'" id="weituoType" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('wtdllb')" value=""/>
    <#--
	<select name="weituoType" id="weituoType" retSelect="1">
	 <option value="0">----请选择----</option>
	 <option value="1">委托律师</option>
	 <option value="2">委托其他公民</option>
	</select>
	-->
	</td>
   </tr>
  </#if>
  
<tr class="trcolor">
  <td class="tdFormText">行政复议机关</td>
  <td class="tdFormInput">
    <input name="xzfyInfo.xzfy_org" id="jiguan" type="text" class="inputTextNormal" altname="复议机关" value="${xzfyInfo.xzfy_org?default('')}"> &nbsp; 
  	<input type="button" class="button" value="改变名称" onclick="gaibianyuanyin();">						
  </td>
  <td class="tdFormText"></td>
  <td class="tdFormInput"></td>
</tr>

<tbody id="jiguangaibian" style="display:none"> 
<tr class="trcolor">
  <td class="tdFormText">改变原因：</td>
  <td class="tdFormInput">
    <@ww.select  name="'xzfyInfo.changeorg_reason'" id="reason" headerKey="''" headerValue="'--请选择--'" value="'${xzfyInfo.changeorg_reason?default('')}'.toString()" list="getDictMap('gbyy')" />
  <#--
   <select name="xzfyInfo.changeorg_reason" id="reason" retSelect="1" ischeck="y">
	 <option value="0">----请选择----</option>
	 <option value="1">向区县政府申请行政复议，请求转送。</option>
	 <option value="2">经上级行政复议机关授权，代为接收案件。</option>
	 <option value="3">本级政府法制机构作为行政复议机关。</option>
	</select>
 -->				
  </td>
  <td class="tdFormText">复议机关：</td>
  <td class="tdFormInput">
    <@ww.select  id="gaibianjiguan" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('fjjg')" onchange="'jiguanmingcheng()'" />
  <#--
    <select id="gaibianjiguan" ischeck="y" altname="复议机关"  onchange="jiguanmingcheng();">
	 <option value="0">----请选择----</option>
	 <option value="县级政府">县级政府</option>
	 <option value="县级政府的部门">县级政府的部门</option>	 
	 <option value="省部级行政机关">省部级行政机关</option>
	 <option value="省级政府的部门">省级政府的部门</option>
    </select>
   --> 
   </td>
</tr>
</tbody>

<tr class="trcolor">
  
   <td class="tdFormText" width="25%">被申请人种类：</td>
   <td class="tdFormInput" width="25%"><select name="xzfyInfo.defendant_type" id="beapptype" ischeck="y" altname="被申请人种类" 
    onchange="aaa(document.getElementById('beapptype').options[document.getElementById('beapptype').selectedIndex].value)">
     <option value="0">----请选择----</option>
	 <option value="1">乡镇政府</option>
	 <option value="2">县级政府</option>
	 <option value="3">县级政府部门</option>
	 <option value="6">省部级行政机关</option>
	 <option value="7">省级政府部门</option>
	 <option value="9">市经济技术开发区管委会</option>
	 <option value="8">其他</option>

    </select></td>
    <td class="tdFormText" width="25%">被申请人名称：</td>
    <td class="tdFormInput" style="display:none;" id="beappnametd" width="25%">   
     <input name="xzfyInfo.defendant_real_name" type="text"  id="beappnameinput" >
    </td> 
    <td class="tdFormInput" style="display:block;" id="beappnamesel">  
    <select name="xzfyInfo.defendant_name" ischeck="y" id="beappname" onchange="beappcode()" altname="被申请人名称" >
      <option value="0" deptcode="0">----请选择----</option>     	 
    </select>    
    </td>
  </tr>

  <tr class="trcolor" >
   <td class="tdFormText">行政复议事项：</td>
    <td class="tdFormInput">
    <@ww.select  name="'xzfyInfo.app_tpye1'" id="xzfysx" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('xjfysx')" value="'${xzfyInfo.app_tpye1?default('')}'.toString()" onchange="'sqfysx()'"/>
    <#--
    <select name="xzfyInfo.app_tpye1" ischeck="y" altname="申请复议事项" id="xzfysx" onchange="sqfysx()">
      <option value="0">----请选择----</option>
		 <option value="1">行政处罚</option>
		 <option value="2">行政强制措施</option>
		 <option value="3">行政征收</option>
		 <option value="4">行政许可</option>
		 <option value="5">行政确权</option>
		 <option value="6">干预经营自主权</option>
	     <option value="7">信息公开</option>
		 <option value="8">行政不作为</option>
		 <option value="9">其他</option>
      </select>
      -->
      <#if xzfyInfo.app_tpye1?exists && xzfyInfo.app_tpye1='1'>
      <@ww.select  name="'xzfyInfo.app_tpye2'" id="xzfysx2xzcf" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('xzcf')" cssStyle="'display:none'" value="'${xzfyInfo.app_tpye2?default('')}'.toString()"/>
      <#--
      <select name="xzfyInfo.app_tpye2" style="display:none" altname="申请复议事项"  id="xzfysx2xzcf" ishidden="y">
      	 <option value="0">----请选择----</option>
		 <option value="1">拘留</option>
		 <option value="2">没收</option>
		 <option value="3">罚款</option>
		 <option value="4">其他</option>
 	   </select>
      -->
      </#if>
      <#if xzfyInfo.app_tpye1?exists && xzfyInfo.app_tpye1='2'>
      <@ww.select  name="'xzfyInfo.app_tpye2'" id="xzfysx2xzqzcs" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('xzqzcs')" cssStyle="'display:none'" value="'${xzfyInfo.app_tpye2?default('')}'.toString()"/>
       <#--
	   <select name="xzfyInfo.app_tpye2" style="display:none" altname="申请复议事项" id="xzfysx2xzqzcs" ishidden="y">
	     <option value="0">----请选择----</option>
		 <option value="5">对人身的强制措施</option>
		 <option value="6">对不动产的强制措施</option>
		 <option value="7">对其它财产的强制措施</option>
	   </select>
	    -->
      </#if>
      <#if xzfyInfo.app_tpye1?exists && xzfyInfo.app_tpye1='3'>
      <@ww.select  name="'xzfyInfo.app_tpye2'" id="xzfysx2xzsx" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('xzzs')" cssStyle="'display:none'" value="'${xzfyInfo.app_tpye2?default('')}'.toString()"/>
       
	    <#--
	   <select name="xzfyInfo.app_tpye2" style="display:none" altname="申请复议事项" id="xzfysx2xzsx" ishidden="y">
	      <option value="0">----请选择----</option>
		 <option value="8">征收土地</option>
		 <option value="9">版税</option>
		 <option value="10">收费</option>
		 <option value="11">要求履行其他义务</option>	 
	   </select>
	    -->
      </#if>
    </td>
    
    <td class="tdFormText">行政管理类别：</td>
    
     <td class="tdFormInput">
      
     <@ww.select  name="'xzfyInfo.guanli1'" id="ajsjfm1" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('xzgllb')" onchange="'ajgllb()'" value="'${xzfyInfo.guanli1?default('')}'.toString()"/>
       <#-- 
       <select name="xzfyInfo.guanli1" ischeck="y"  id="ajsjfm1" altname="行政管理类别" onchange="ajgllb()">
        <option value="0">----请选择----</option>
		<option value="1">公安</option>
		<option value="2">国家安全</option>
		<option value="3">劳动和社会保障</option>
		<option value="4">司法行政</option>
		<option value="5">民政</option>
		<option value="6">农林环资</option>
		<option value="7">城建</option>
		<option value="8">工交商事</option>
		<option value="9">财政金融</option>
		<option value="10">教科文卫</option>
		<option value="11">其他</option>
       </select>
       -->
	 <!--公安-->
      <#if xzfyInfo.guanli1?exists && xzfyInfo.guanli1='1'>
       <@ww.select  name="'xzfyInfo.guanli2'" id="ajgllbga" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('ga')" cssStyle="'display:none'" value="'${xzfyInfo.guanli2?default('')}'.toString()"/>
       <#--
       <select name="xzfyInfo.guanli2" style="display:none"  id="ajgllbga" altname="行政管理类别" ishidden="y">
        <option value="0">----请选择----</option>
		<option value="1">治安</option>
		<option value="2">劳教</option>
		<option value="3">其他</option>
	   </select>
       -->
      </#if>
      <#if xzfyInfo.guanli1?exists && xzfyInfo.guanli1='6'>
	 <!--农林环资-->
	 <@ww.select  name="'xzfyInfo.guanli2'" id="ajgllbnlhz" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('nlzy')" cssStyle="'display:none'" value="'${xzfyInfo.guanli2?default('')}'.toString()"/>
	 <#--
	   <select name="xzfyInfo.guanli2" style="display:none"  id="ajgllbnlhz" altname="行政管理类别" ishidden="y">
	  	<option value="0">----请选择----</option>
		<option value="9">土地</option>
		<option value="10">地矿</option>
		<option value="11">环保</option>
		<option value="12">农业</option>
		<option value="13">水利</option>
		<option value="14">林业</option>
		<option value="15">其他</option>
       </select>
       -->
      </#if>
      <#if xzfyInfo.guanli1?exists && xzfyInfo.guanli1='7'>
	 <!--城建-->
	 <@ww.select  name="'xzfyInfo.guanli2'" id="ajgllbcj" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('cj')" cssStyle="'display:none'" value="'${xzfyInfo.guanli2?default('')}'.toString()"/>
	 <#--
	 <select name="xzfyInfo.guanli2" style="display:none" id="ajgllbcj" altname="行政管理类别" ishidden="y">
	    <option value="0">----请选择----</option>
		<option value="17">规划</option>
		<option value="18">拆迁</option>
		<option value="19">房屋登记</option>
		<option value="20">其他</option>
	  </select>
	 -->
      </#if>
      <#if xzfyInfo.guanli1?exists && xzfyInfo.guanli1='8'>
	 <!--工交商事-->
	 <@ww.select  name="'xzfyInfo.guanli2'" id="ajgllbgjss" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('gjss')" cssStyle="'display:none'" value="'${xzfyInfo.guanli2?default('')}'.toString()"/>
	 <#--
	 <select name="xzfyInfo.guanli2" style="display:none" id="ajgllbgjss" altname="行政管理类别" ishidden="y">
	    <option value="0">----请选择----</option>
		<option value="22">工商</option>
		<option value="23">质监</option>
		<option value="24">商务</option>
		<option value="25">物价</option>
		<option value="26">能源</option>
		<option value="27">交通</option>
		<option value="28">信息产业</option>
		<option value="29">邮政</option>
		<option value="30">烟草专买</option>
	</select>
	-->
      </#if>
      <#if xzfyInfo.guanli1?exists && xzfyInfo.guanli1='9'>
	 <!--财政金融-->
	 <@ww.select  name="'xzfyInfo.guanli2'" id="ajgllbczjr" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('czjr')" cssStyle="'display:none'" value="'${xzfyInfo.guanli2?default('')}'.toString()"/>
	 <#--
	 <select name="xzfyInfo.guanli2" style="display:none" id="ajgllbczjr" altname="行政管理类别" ishidden="y">
	    <option value="0">----请选择----</option>
		<option value="32">税务</option>
		<option value="33">人民银行</option>
		<option value="34">证监</option>
		<option value="35">保监</option>
		<option value="36">银监</option>
		<option value="37">外汇</option>
		<option value="38">财政</option>
		<option value="39">统计</option>
		<option value="40">审计</option>
		<option value="41">海关</option>
		<option value="42">商检</option>
	</select>
	-->
      </#if>
      <#if xzfyInfo.guanli1?exists && xzfyInfo.guanli1='10'>
	 <!--教科文卫-->
	 <@ww.select  name="'xzfyInfo.guanli2'" id="ajgllbjkww" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('kjww')" cssStyle="'display:none'" value="'${xzfyInfo.guanli2?default('')}'.toString()"/>
	 <#--
	 <select name="xzfyInfo.guanli2" style="display:none" id="ajgllbjkww" altname="行政管理类别" ishidden="y">
	    <option value="0">----请选择----</option>
		<option value="44">药监</option>
		<option value="45">卫生</option>
		<option value="46">计划生育</option>
		<option value="47">教育</option>
		<option value="48">文化</option>
		<option value="49">专利</option>
		<option value="50">商标</option>
		<option value="51">版权</option>
		<option value="52">旅游</option>
     </select>
     -->
      </#if>
     <div id="divxzgllbinput">
    	<input name="xzfyInfo.guanli3" type="text" altname="行政管理类别" id="xzgllbinput" class="inputTextNormal" value="${xzfyInfo.guanli3?default('')}">
     </div>
    </td>
  </tr>
  
   <tbody id="sendnotuse" style="display:block;">
  <#--
  <tr class="trcolor" id="requesttype" style="display:none">
     <td class="tdFormText">行政管理类别：</td>
	    <td class="tdFormInput"> 
	    <select name="app_face.cardnum" id="cardnum" >
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
	    <td class="tdFormText">&nbsp;</td>
   <td  class="tdFormInput">&nbsp; </td>
	   </tr>
  -->
  <tr class="trwhite" id="requesttype2" style="display:none">
   <td class="tdFormText">不作为事项：</td>
   <td  class="tdFormInput">
   <@ww.select  name="'xzfyInfo.matter_type'" id="use_type" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('bzwsx')" onchange="'setBzw()'" value="'${xzfyInfo.matter_type?default('')}'.toString()"/>
  <#--
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
  -->
  <textarea class="textarea" name="xzfyInfo.matter_detail" id="bzwbc" style="width:300px;overflow-y:visible;"></textarea>
  </span>
  </td>
	    <td class="tdFormText">申请人曾经要求被申请人<br>履行何种法定职责：</td>
	    <td class="tdFormInput" ><textarea name="xzfyInfo.duty" id="zhize" type="text" class="textarea"  style="width:300px;overflow-y:visible;"></textarea>
	    </td>
	    </tr>    
	    <tr class="trcolor" id="requesttype3" style="display:none">
	    <td class="tdFormText">要求被申请人履行日期：</td>
	    <td class="tdFormInput">
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
		<td class="tdFormText">是否有曾要求履责而<br>未履行的证明材料：</td>
	    <td class="tdFormInput">
	    <@ww.select  name="'xzfyInfo.is_prof'" id="ismingque" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('wlxzm')" onchange="'ryq2()'" value="'${xzfyInfo.is_prof?default('')}'.toString()"/>
	    <#--
	   <select name="xzfyInfo.is_prof" id="ismingque" onchange="ryq2()">
	    <option value="0">----请选择----</option>
	      <option value="有">有</option>
		 <option value="无">无</option>
	  </select>
	  -->
	    <textarea name="xzfyInfo.is_prof_detail" id="mingque" class="textarea" ></textarea>
	      </td>
	   </tr>
	</tbody>
  
  <tr class="trcolor"> 
    <td class="tdFormText">要求复议的具体行政行为情况：</td>
    <td class="tdFormInput">
      <a href="javascript:getBzw()" id="getBzw" style="display:none">添加 </a>
      <a href="javascript:closeBzw()" id="closeBzw" style="display:none">完成 </a>
      <span id='xwspan'><a href="javascript:openXw()">添加</a></span>
      <span id="xw_an"> 
      <#if xzfyInfo.require_fy?exists && xzfyInfo.require_fy?has_content>
      ${xzfyInfo.require_fy}
      </#if>
      </span>
    </td>
    <td class="tdFormText">复议前置：</td>
    <td class="tdFormInput"><input type="radio" name="xzfyInfo.isfront" value="是" id="fyqz_y" ischeck="y" altname="复议前置">
        <label for="fyqz_y">是 </label>
        <input type="radio" name="xzfyInfo.isfront" value="否" id="fyqz_n" ischeck="y" altname="复议前置" checked>
        <label for="fyqz_n">否</label></td>
  </tr>
  
  <tr class="trcolor">
     <td  class="tdFormText">行政复议请求：
  </td>
   <td  class="tdFormInput">
   <@ww.select  name="'xzfyInfo.xzfy_requset'" id="request2yiban" headerKey="''" headerValue="'--请选择--'"  list="getDictMap('xzfyqq')" onchange="'ryq();closeBzw1()'" />
   <#-- 
  <select name="xzfyInfo.xzfy_requset"
  	altname="行政复议请求" id="request2yiban" ishidden="y" onchange="ryq();closeBzw1()">
	 <option value="0">----请选择----</option>
	 <option value="1">撤销该具体行政行为</option>
	 <option value="2">变更该具体行政行为</option>
	 <option value="3">确认该具体行政行为违法</option>
	 <option value="4">责令被申请人履行法定职责</option>
	 <option value="5">确认被申请人不履行法定职责违法</option>
	-->
	
   </select>
    <textarea name="xzfyInfo.xzfy_requset_retail" id="xzfyqq1" type="text"  style="width:300px;overflow-y:visible;" class="textarea" altname="行政复议请求" onchange="closeBzw1()"></textarea>
  </td>
    <td class="tdFormText"></td>
    <td class="tdFormInput"></td>
  </tr>
     
  <tr class="trcolor">
    <td class="tdFormText">申请对规范性文件进行审查</td>
    <td class="tdFormInput">
      <input type="radio" name="xzfyInfo.ischeck" nbzcheck="y" altname="对规范性文件审查" value="是" id="gfsc_y" onclick="check_shencha('1')">
	  <label for="gfsc_y">是 </label>
	  <input type="radio" name="xzfyInfo.ischeck" altname="对规范性文件审查" value="否" nbzcheck="y"  id="gfsc_n" checked onclick="check_shencha('2')">
	  <label for="gfsc_n">否</label>
	  <span id="shencha" style="display:none">规范文件：
	  <input name="xzfyInfo.check_file" type="file" id="post2" class="inputTextNormal" ></span>
	</td>
    <td class="tdFormText">申请行政赔偿</td>
    <td class="tdFormInput">
      <input type="radio" name="xzfyInfo.ismoney" value="是" id="peichang_y" ischeck="y" altname="是否行政赔偿" onclick="check_pc(1)">
	  <label for="peichang_y">是</label>
	  <input type="radio" checked name="xzfyInfo.ismoney" value="否" id="peichang_n" ischeck="y" altname="是否行政赔偿" onclick="check_pc(2)">
	  <label for="peichang_n">否</label>
    </td>
  </tr>   
  <tr class="trcolor" style="display:none" id="peichang_div">
	<td class="tdFormText">赔偿金额：</td>
	<td class="tdFormInput">
	  <input type="text" class="inputTextNormal" name="xzfyInfo.money_Detail" id="peichang_count">
	</td>
	<td class="tdFormText">受损证明材料：</td>
    <td class="tdFormInput">
      <textarea name="xzfyInfo.money_file" id="peichang_file" class="textarea" style="width:300px;overflow-y:visible;"></textarea>
    </td>
  </tr>   

</table>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td> 
	   <input name="Button23" type="button" class="button" value="生成接待笔录" onclick="getWord()">
	   <input name="Button23" type="button" class="button" value="生成收据" onclick="getFile()">
	   <input name="Button23" type="button" class="button" value="补正通知书" onclick="getBz()">
	   <input name="Button23" type="button" class="button" value="保   存"  onclick="saveNew()">
	   <input name="Button23" type="button" class="button" value="返 回"  onclick="back()">
	</td>
  </tr>
</table>

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

<script>
	function saveNew(){
		window.form1.action="saveFace.action?funcCode=${funcCode}";
		window.form1.submit();
	
	}
</script>






</form>
</body>

<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>

<script type="text/javascript" src="../js/16B/tpl.base.js"></script>

<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<!--javascript脚本添加位置。-->
<script type="text/javascript" >
function opendg(dgurl,dgw,dgh)
{
  $.dialog({ 
    title:'申请人管理',
    width: dgw,
    height: dgh,
    content:'url:'+ dgurl});
}

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
		document.getElementById("dailiren").style.display="block";
	}else{
		document.getElementById("jddlr").style.display="none";
		document.getElementById("dailiren").style.display="none";
	}
}

function checkdlr1(){
	if(document.getElementById("agType").value==1){
		document.getElementById("weituoType1").style.display="none";
		document.getElementById("weituoType2").style.display="none";
		document.getElementById("weituoType3").style.display="block";
		document.getElementById("weituoType4").style.display="block";
	} else {
		document.getElementById("weituoType1").style.display="block";
		document.getElementById("weituoType2").style.display="block";
		document.getElementById("weituoType3").style.display="none";
		document.getElementById("weituoType4").style.display="none";
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

function closeBzw(){
	//document.getElementById("requesttype").style.display="none";
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
}

function getBzw(){
	//document.getElementById("requesttype").style.display="block";
	document.getElementById("requesttype2").style.display="block";
	document.getElementById("requesttype3").style.display="block";
	document.getElementById("closeBzw").style.display="block";
	document.getElementById("getBzw").style.display="none";
}

function setBzw(){
	var bzw=document.getElementById("use_type").value;
	if(bzw==""){
		document.getElementById("bzwbc").value="";
	}else{
		document.getElementById("bzwbc").value=bzw;
	}
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

function ryq2(){
	document.getElementById("mingque").value=document.getElementById("ismingque").value;
}

function closeBzw1(){
	if(document.getElementById("xzfysx").value==8){
	//document.getElementById("requesttype").style.display="none";
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
					if (document.getElementById("applicationtype").value==1 &&cc>=5) {
						document.getElementById("daibiaorendiv").style.display="block";
					}
					else
					{
						document.getElementById("daibiaorendiv").style.display="none";
					}
			}
		}
}

function check_pc(cv){
	if(cv==1)
	{
		document.getElementById("peichang_div").style.display="block";
	}else{
		document.getElementById("peichang_div").style.display="none";
	}
}

function check_shencha(idValue){
	if(idValue==1)
		document.getElementById("shencha").style.display="block";
	else
		document.getElementById("shencha").style.display="none";

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

function check_remark(){
	if(document.getElementById("handle").value==0){
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		document.getElementById("otherAdvice").style.display="none";
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
		document.getElementById("otherAdvice").style.display="block";
		document.getElementById("filedetail").style.display="block";
		document.getElementById("filespan").style.display="block";
		document.getElementById("bznr").style.display="none";
		document.getElementById("bzspan").style.display="none";
		updateFile();
	}else{
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		document.getElementById("otherAdvice").style.display="block";
		document.getElementById("filedetail").style.display="none";
		document.getElementById("filespan").style.display="none";
		document.getElementById("bznr").style.display="block";
		document.getElementById("bzspan").style.display="block";
		
	}
}

function setbjd(){
	var bjd=document.getElementById("beadvice").value;
	var otheradvice=document.getElementById("otheradvice");
	var ov=document.getElementById("otheradvice").value;
	if(bjd==1){
		otheradvice.value=ov+"答：同意。";
	}else if(bjd==2){
		otheradvice.value=ov+"答：坚持申请行政复议。";
	}else if(bjd==3){
		otheradvice.value=ov+"答：其他。";
	}else if(bjd==4){
		otheradvice.value=ov+"答：知道了。";
	}
}

function setAgent(){
	var agType = document.getElementById("agType").value;
	var weituoType = document.getElementById("weituoType").value;

	if (agType == 2) {
		openAgent('../xzfy/addAgent.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=3&textId=agent&countId=agentCount',900,600)
	} else if (agType == 1) {
		if (weituoType == 0) {
			alert("请选择委托类型！");
		} else if (weituoType == 1){
			openAgent('../xzfy/addAgent.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=1&textId=agent&countId=agentCount',900,600)
		} else if (weituoType == 2){
			openAgent('../xzfy/addAgent.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=2&textId=agent&countId=agentCount',900,600)
		} 
	} else {
		alert("请选择代理人类别！");
	}
}

function openAgent(dgurl,dgw,dgh){
  $.dialog({ 
    title:'代理人管理',
    width: dgw,
    height: dgh,
    content:'url:'+ dgurl});
}

function gaibianyuanyin(){
	document.getElementById("jiguangaibian").style.display="block";
}

function jiguanmingcheng(){
	document.getElementById("jiguan").value=document.getElementById("gaibianjiguan").value;
}

function sqfysx(){
	if(document.getElementById("xzfysx").value==1){
	document.getElementById("xzfysx2xzcf").style.display="block";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	document.getElementById("xzfysx2xzcf").name="app_transaction.TCaseType2";
	}
	if(document.getElementById("xzfysx").value==2){	
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="block";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzqzcs").name="app_transaction.TCaseType2";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	}
	if(document.getElementById("xzfysx").value==3){
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="block";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	document.getElementById("xzfysx2xzsx").name="app_transaction.TCaseType2";
	}
	if(!(document.getElementById("xzfysx").value==1||document.getElementById("xzfysx").value==2||document.getElementById("xzfysx").value==3))
	{
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	}
	if(document.getElementById("xzfysx").value==8){
		// document.getElementById("requesttype").style.display="block";
		document.getElementById("requesttype2").style.display="block";
		document.getElementById("requesttype3").style.display="block";
		document.getElementById("closeBzw").style.display="block";
		document.getElementById("getBzw").style.display="none";
		document.getElementById("xwspan").style.display="none";
		document.getElementById("xw_an").innerHTML="";
	} else {
		//document.getElementById("requesttype").style.display="none";
		document.getElementById("requesttype2").style.display="none";
		document.getElementById("requesttype3").style.display="none";
		document.getElementById("xwspan").style.display="block";
		document.getElementById("closeBzw").style.display="none";
		document.getElementById("getBzw").style.display="none";
		document.getElementById("xw_an").innerHTML="";
	}
}

function ajgllb(){

	if(document.getElementById("ajsjfm1").value==1){
		document.getElementById("ajgllbga").style.display="block";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="app_transaction.TRefer2";
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
		document.getElementById("ajgllbnlhz").name="app_transaction.TRefer2";
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
		document.getElementById("ajgllbcj").name="app_transaction.TRefer2";
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
		document.getElementById("ajgllbgjss").name="app_transaction.TRefer2";
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
		document.getElementById("ajgllbczjr").name="app_transaction.TRefer2";
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
		document.getElementById("ajgllbjkww").name="app_transaction.TRefer2";
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
	//document.getElementById("divxzgllbinput").innerHTML='<input name="app_transaction.TReferOther" type="text" altname="行政管理类别" id="xzgllbinput" class="inputTextNormal">';
}

function openXw(ev){
	/*
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	} */
	var udiv=document.getElementById("xwDiv");
	var userspan=document.getElementById("xwspan");
	var areaObject=document.getElementById("jiguan");
	if(udiv.style.display!="block"){
	ev = ev || window.event;
	var mousePos = getPosition(areaObject);
	udiv.style.position = "absolute";
	udiv.style.top      = mousePos.y+20;
	udiv.style.left     = mousePos.x+10;
	udiv.style.display="block";
	}
}

/***********************************以下为计算坐标用，不需要理解***********************************/
Number.prototype.NaN0=function(){return isNaN(this)?0:this;}
function getMouseOffset(target, ev){
ev = ev || window.event;
var docPos    = getPosition(target);
var mousePos  = mouseCoords(ev);
return {x:mousePos.x - docPos.x, y:mousePos.y - docPos.y};
}
function getPosition(e){
var left = 0;
var top  = 0;
while (e.offsetParent){
left += e.offsetLeft + (e.currentStyle?(parseInt(e.currentStyle.borderLeftWidth)).NaN0():0);
top  += e.offsetTop  + (e.currentStyle?(parseInt(e.currentStyle.borderTopWidth)).NaN0():0);
e     = e.offsetParent;
}
left += e.offsetLeft + (e.currentStyle?(parseInt(e.currentStyle.borderLeftWidth)).NaN0():0);
top  += e.offsetTop  + (e.currentStyle?(parseInt(e.currentStyle.borderTopWidth)).NaN0():0);
return {x:left, y:top};
}
function mouseCoords(ev){
if(ev.pageX || ev.pageY){
return {x:ev.pageX, y:ev.pageY};
}
return {
x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,
y:ev.clientY + document.body.scrollTop  - document.body.clientTop
};
} 

function closeDivXw(){
	checkXw();
	closeDivById('xwDiv');
}

function closeDivById(divId){
	/*
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="block";
		}
	}
	*/
	document.getElementById(divId).style.display="none";
}

function checkXw(){
	var tuser=document.getElementById("txw");
	var userString="";
	var userStringAll="";
	var frsqr=document.getElementsByName("xwname");
	var fuzeren=document.getElementsByName("xwnum");
	var zd1=document.getElementsByName("zd1");
	var zd2=document.getElementsByName("zd2");
	var zd3=document.getElementsByName("zd3");
	var tujing=document.getElementsByName("tujing");

	var userString1="";
	var userString2="";
	var xingwei1="";
	var xingwei2="";
	for(var i=0;i<frsqr.length;i++){
		var n=i+1;
		if(frsqr.length==1){
			userString=userString+frsqr.item(i).value;
			userString1=userString1+frsqr.item(i).value+"；";
			userStringAll=userStringAll+frsqr.item(i).value;
			if(fuzeren.item(i).value!=""){
				userString=userString+"（"+fuzeren.item(i).value+"）";
				userStringAll=userStringAll+"（"+fuzeren.item(i).value+"）；";
				userString2=userString2+fuzeren.item(i).value+"；";
			}
			var zdate="";
			if(zd1.item(i).value!=0){
			zdate=zd1.item(i).value+"年";
			if(zd2.item(i).value!=0){
				zdate=zdate+zd2.item(i).value+"月";
				if(zd3.item(i).value!=0){
					zdate=zdate+zd3.item(i).value+"日";
				}	
			}
			}
			if(zdate!=""){
				userStringAll=userStringAll+"知道时间："+zdate;
			}
			if(tujing.item(i).value!=""){
				userStringAll=userStringAll+"（"+tujing.item(i).value+"）；";
			}else{
				userStringAll=userStringAll+"；";
			}
		}else{
			userString=userString+"（"+n+"）"+frsqr.item(i).value;
			userString1=userString1+"（"+n+"）"+frsqr.item(i).value+"；";
			userStringAll=userStringAll+"（"+n+"）"+frsqr.item(i).value+"；";
			if(fuzeren.item(i).value!=""){
				userString=userString+"（"+fuzeren.item(i).value+"）";
				userString2=userString2+n+fuzeren.item(i).value+"；";
				userStringAll=userStringAll+fuzeren.item(i).value+"；";
			}
			var zdate="";
			if(zd1.item(i).value!=0){
			zdate=zd1.item(i).value+"年";
			if(zd2.item(i).value!=0){
				zdate=zdate+zd2.item(i).value+"月";
				if(zd3.item(i).value!=0){
					zdate=zdate+zd3.item(i).value+"日";
				}	
			}
			}
			if(zdate!=""){
				userStringAll=userStringAll+"知道时间："+zdate;
			}
			if(tujing.item(i).value!=""){
				userStringAll=userStringAll+"（"+tujing.item(i).value+"）；";
			}else{
				userStringAll=userStringAll+"；";
			}
		}
		if(i<frsqr.length-1)
			userString=userString+"；";
		else
			userString=userString+"。";
	}
	//document.getElementById("xingwei1").value=userString;
	
	//document.getElementById("xingwei").value=userString1;
	//document.getElementById("annum").value=userString2;

	for(var j=0;j<tujing.length;j++){
		var n=j+1;
		var zdate="";
		if(zd1.item(j).value!=0){
			zdate=zd1.item(j).value+"年";
			if(zd2.item(j).value!=0){
				zdate=zdate+zd2.item(j).value+"月";
				if(zd3.item(j).value!=0){
					zdate=zdate+zd3.item(j).value+"日";
				}	
			}
		}
		if(tujing.length==1){
			xingwei2=xingwei2+zdate;
			if(tujing.item(j).value!=""){
				xingwei2=xingwei2+"（"+tujing.item(j).value+"）";
			}
		}else{
			xingwei2=xingwei2+"（"+n+"）"+zdate;
			if(tujing.item(j).value!=""){
				xingwei2=xingwei2+"（"+tujing.item(j).value+"）";
			}
		}
		if(j<tujing.length-1)
			xingwei2=xingwei2+"；";
		else
			xingwei2=xingwei2+"。";
	}
	//document.getElementById("xingwei2").value=xingwei2;
	userString=userString+"<br>"+xingwei2;
	document.getElementById("xw_an").innerHTML=userStringAll;
	document.getElementById("xw_an").name="xzfyInfo.require_fy";
	document.getElementById("xw_an").value=userStringAll;
}

function addXw(){
	var ob1=document.getElementById("xwapp");
	var ins=document.getElementById("insxw");
	var tuser=document.getElementById("txw");
	ob1=ob1.cloneNode(true);
	var handleList=ob1.getElementsByTagName("input");
	for(var i=0;i<handleList.length;i++){
		if(handleList.item(i).isUser)
		handleList.item(i).value="";
	}
	tuser.insertBefore(ob1,ins);
}

function deleteXw(e){
	var tuser=document.getElementById("txw");
	if(tuser.childNodes.length>2){
	var deleteObject=e.parentNode.parentNode.parentNode.parentNode;
	tuser.removeChild(deleteObject);
	}
}

function check_pc(cv){
	if(cv==1)
	{
		document.getElementById("peichang_div").style.display="block";
	}else{
		document.getElementById("peichang_div").style.display="none";
	}
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
    if( document.getElementById('beapptype').value==9){
    document.getElementById("beappname").setAttribute("ischeck","y");
    document.getElementById("beappnamesel").style.display="block";
	document.getElementById("beappnametd").style.display="none";
	//document.getElementById("beappname").name="app_face.beappname";
	//document.getElementById("beappnameinput").name="ssss";
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
	//document.getElementById("beappnameinput").name="app_face.beappname";
	//document.getElementById("beappname").name="ssss";
	document.getElementById("beappname").removeAttribute("ischeck");
   
   }
    else{
   	document.getElementById("beappname").setAttribute("ischeck","y");
    document.getElementById("beappnamesel").style.display="block";
	document.getElementById("beappnametd").style.display="none";
	//document.getElementById("beappname").name="app_face.beappname";
	//document.getElementById("beappnameinput").name="ssss";
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
	//document.getElementById('deptid').value=code;	
	}
}
function isDeputy(){
	if (document.getElementById("applicationtype").value==1 
	    && document.getElementById("rencount").value>4) {
			document.getElementById("daibiaorendiv").style.display="block";
	} else {
			document.getElementById("daibiaorendiv").style.display="none";
	}
}
</script>

<!--javascript脚本添加位置结束。-->

</html>