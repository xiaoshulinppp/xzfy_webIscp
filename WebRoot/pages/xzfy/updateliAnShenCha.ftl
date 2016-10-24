<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title></title>
<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]><link href="../sys_theme/css/ie7hack.css" rel="stylesheet" type="text/css" media="screen"/><![endif]--><!--不可删--->
<link href="../css/style_form.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

	<!--                       Javascripts 注意不要改变顺序                      -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/function.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
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

<!--javascript脚本添加位置。-->

<!--javascript脚本添加位置结束。-->
</head>
<body>

<script>
function closeApp1(){
//	openSelect();
	document.getElementById("appDiv").style.display="none";
	var tuser=document.getElementById("tapp");
	var userString="";
	var bjdr1=document.getElementsByName("appsqr");
	var bsex=document.getElementsByName("appsex");
	var bnum=document.getElementsByName("appnum");
	var baddress=document.getElementsByName("appaddress");
	var bpost=document.getElementsByName("apppost");
	var bphone=document.getElementsByName("appphone");
	for(var i=0;i<bjdr1.length;i++){
		userString=userString+bjdr1.item(i).value+"，"+bsex.item(i).value;
		if(bnum.item(i).value!="")
			userString=userString+"，身份证号"+bnum.item(i).value;
		if(baddress.item(i).value!="")
			userString=userString+"，送达地址"+baddress.item(i).value;
		if(bpost.item(i).value!="")
			userString=userString+"，邮编"+bpost.item(i).value;
		if(bphone.item(i).value!="")
			userString=userString+"，电话"+bphone.item(i).value;
		userString=userString+"；"
	}

	document.getElementById("rencount").value=bjdr1.length;
	//userString=userString+"共计"+applicationsum+"人。";
	document.getElementById("user").value=userString;
}
	
	function finishLian(xzfyCheckList_la){
		if(!checknull()){return ;}

	if(document.getElementById("scresult").value==0){
			alert("请选择立案审查意见！"); 
			return ;
	}  	if(document.getElementById("user").value==""){
			alert("请填写申请人");
			return ;
		}

		if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	
		
		if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}	
		/*
		if(document.getElementById("annum").value==""){
			alert("请填写被复议的具体行政行为案号");
			return ;
		}		
		*/
		
	
			if(confirm("提交后将进入办理接待，您确认要提交吗？")){
				document.getElementById("checkStatus").value=0;
				document.getElementById("xzfyStatus").value=4;
				document.getElementById("sdResult").value=1;	
				document.getElementById("check_id").value=0;
				
				document.getElementById("form1").action="../xzfy/finishLianCase.action";
				document.getElementById("form1").submit();
			}	

	}
	
	function finishJiean(){
		if(!checknull()){return ;}

	if(document.getElementById("scresult").value==0){
			alert("请选择立案审查意见！"); 
			return ;
	} else if(document.getElementById("scresult").value==2||document.getElementById("scresult").value==3||document.getElementById("scresult").value==5){
		if (document.getElementById("finish_date").value==""){
			alert("请填写结案日期！"); 
			return ;
		}
	}
		if(document.getElementById("user").value==""){
			alert("请填写申请人");
			return ;
		}

		if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	
		
		if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}	
		/*
		if(document.getElementById("annum").value==""){
			alert("请填写被复议的具体行政行为案号");
			return ;
		}
		*/		
		if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return ;
		}		
			if(document.getElementById("finishtype1").value==0){alert("请选择结案方式!");return ;}
	if(document.getElementById("finishtype1").value==8){if(document.getElementById("finishtype2").value==0){alert("请选择结案方式!");return ;}}
		
	
			if(confirm("提交后将结案，您确认要提交吗？")){
				document.getElementById("checkStatus").value=0;
				document.getElementById("xzfyStatus").value=12;
				document.getElementById("sdResult").value=document.getElementById("scresult").value;				
				document.getElementById("form1").action="../xzfy/finishJieanCase.action";
				document.getElementById("form1").submit();
			}		
	
	}
	
	
</script>
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<div class="ui-form fn-clear">

<#assign sdResult=xzfyInfo.stadardResult?default('0')>

<!--主体内容、列表显示区域-->


<input name="xzfyInfo.caseorg" type="hidden" id="caseorg" value="${xzfyInfo.caseorg?default('')}">
<input name="isView" type="hidden" value="${isView?default('0')}">
<input name="xzfyInfo.status" type="hidden" value="${xzfyInfo.status?default('')}" id="xzfyStatus">
<input id="xzfyId" name="xzfyInfo.id" value="${xzfyInfo.id}" type="hidden">


<input id="xzfyshow" name="xzfyInfo.app_show" value="${xzfyInfo.app_show?default('')}" type="hidden">
<input type="hidden" name="funcCode" value="${funcCode}" >

<input type="hidden" id="isShenpi" >
<input type="hidden" id="checkStatus" name="xzfyInfo.check_status"  <#if xzfyInfo.check_status?has_content> 
value="${xzfyInfo.check_status}" <#else>value="0"</#if> />


<input name="xzfyInfo.tAppDeptId" type="hidden" value="${xzfyInfo.tAppDeptId?default('')}" class="inputTextNormal" id="deptid" />

		<#assign currentStatus=xzfyInfo.status?number  >
 <table  id="" class="ui-table ui-table-form "  ><!--表单填写项文字居右样式由 fn-text-right控制。td宽度在第一行标记 不要每行都标记-->

    <tr>
    <td align="center" colspan=4>案件信息
    </td>
    </tr>

   <tr id="shenqingren1" <#if xzfyInfo.app_type=='2'>style="display:none"<#else>style="display:''"</#if>>
    <th  width="15%"><font color="red">*</font>申请人：</td>
    <td width="35%" colspan=3>
    <#if xzfyInfo.id.length() gt 10>
    <a href="javascript:setApp1('#appDiv',1)" id="appspan">添加</a><br>
    </#if>
    <textarea name="xzfyInfo.appdetail" id="user" ischeck="y" <#if xzfyInfo.id?length gt 10>readonly</#if>>${xzfyInfo.appdetail?default('')}</textarea></td>
  </tr>

   <tr  id="sqr" <#if xzfyInfo.app_type=='1'>style="display:none"<#else>style="display:''"</#if>>
    <th  width="18%"><font color="red">*</font>申请人：</td>
    <td width="32%" colspan=3>
    <#if xzfyInfo.id.length() gt 10>
    <a href="javascript:setFr1('#frDiv',1)" id="frspan" >添加</a><br>
    </#if>
    <textarea name="xzfyInfo.agentDetail" id="appname" ischeck="y" <#if xzfyInfo.id?length gt 10>readonly</#if>>${xzfyInfo.agentDetail?default('')}</textarea></td>
  </tr>
  
   <script>
   function checksqr(){
	if(document.getElementById("applicationtype").value==2){
		document.getElementById("sqr").style.display="block";
		document.getElementById("shenqingren1").style.display="none";
	}else{
		document.getElementById("sqr").style.display="none";
		document.getElementById("shenqingren1").style.display="block";
	}
}

function checkFr(){
	var tuser=document.getElementById("tfaren");
	var userString="";
	var frsqr=document.getElementsByName("frsqr");
	var fuzeren=document.getElementsByName("fuzeren");
	var fzrlb=document.getElementsByName("fzrlb");
	var fzraddress=document.getElementsByName("fzraddress");
	var fzrpost=document.getElementsByName("fzrpost");
	var fzrtele=document.getElementsByName("fzrtele");
	var fzrother=document.getElementsByName("fzrother");
	for(var i=0;i<frsqr.length;i++){
		userString=userString+frsqr.item(i).value;
		if(fzrother.item(i).value!=0)
			userString=userString+"（"+fzrother.item(i).value+"）";
		if(fuzeren.item(i).value!="")
			userString=userString+"，"+fzrlb.item(i).value+"是："+fuzeren.item(i).value;
		if(fzraddress.item(i).value!="")
			userString=userString+"，送达地址"+fzraddress.item(i).value;
		if(fzrpost.item(i).value!="")
			userString=userString+"，邮编"+fzrpost.item(i).value;
		if(fzrtele.item(i).value!="")
			userString=userString+"，电话"+fzrtele.item(i).value;

		userString=userString+"；"
	}
	document.getElementById("rencount").value=frsqr.length;
	document.getElementById("appname").value=userString;
	//renCount();
	setAppname();
}

function setAppname(){
	document.getElementById("user").value=document.getElementById("appname").value;
}
   </script>

   <tr class="trwhite">
    <th><font color="red">*</font>申请人总数：</td>
    <td><input name="xzfyInfo.renCount" type="text" id="rencount" ischeck="y"  class="inputTextNormal" altname="申请人总数" <#if xzfyInfo.renCount?has_content>value="${xzfyInfo.renCount}"</#if>></td>
    <th><font color="red">*</font>申请人类别： </th>
    <td >
     <@ww.select  name="'xzfyInfo.app_type'" id="applicationtype" headerKey="''" headerValue=""  list="getDictMap('sqrlb')" value="'${xzfyInfo.app_type?default('')}'.toString()" onchange="'checksqr()'"/>
     <#--
    <select name="app_face.applicationtype" id="applicationtype" 
    class="selectStyleNormal"
      altname="申请人类别">
     <#if app_face.applicationtype?has_content>
     <option value="0">----请选择----</option>
     <option value="1" <#if app_face.applicationtype=="1">selected</#if>公民</option>
	    <option value="2" <#if app_face.applicationtype=="2">selected</#if>法人或其他组织</option>
    <#else>
	    <option value="0">----请选择----</option>
	    <option value="1">公民</option>
	    <option value="2">法人或其他组织</option>
    </#if>
 
    </select>
    -->
    </td>
   </tr>

   
     <tr class="trcolor">
 <th>立案审查人：</th>
    <td ><input name="xzfyInfo.user1_name"  type="text"  readonly    
    <#if xzfyInfo.user1_name?has_content>value="${xzfyInfo.user1_name}"</#if>></td>
<th  width="18%"><font color="red">*</font>收案日期：</td>
    <td width="32%">
    <input name="xzfyInfo.receive_date" id="receivedate"  readonly  altname="收案日期"  readonly
    type="text" onClick="WdatePicker()"  <#if xzfyInfo.receive_date?has_content>value="${xzfyInfo.receive_date}"</#if>>
      </td>
    
  </tr>  

 <#if xzfyInfo.user2_name?has_content>
   <tr class="trcolor">
 <th>承办人：</th>
    <td class="tdFormInput">
   <input name="xzfyInfo.user2_name"  type="text" 
     readonly   <#if xzfyInfo.user2_name?has_content>value="${xzfyInfo.user2_name}"</#if>>
</td>
    
     <th><font color="red">*</font>第二承办人：</td>
    <td class="tdFormInput"><input name="xzfyInfo.user3_name"  type="text" 
         <#if xzfyInfo.user3_name?has_content>value="${xzfyInfo.user3_name}"</#if>></td>
    
  </tr>  
  </#if>
 <input type="hidden" id="tiqu" value="0">
     <tr class="trwhite">
    <th>代表人：</td>
    <td class="tdFormInput">
    <#if xzfyInfo.id.length() gt 10>
<a href="javascript:setDeputy1('#deputyDiv',1,0)" style="display:block" id="deputyspan">添加</a>
</#if>
    	<textarea name="xzfyInfo.dbrDetail" type="text" class="textarea"  id="deputy"  altname="代表人" style="overflow-y:visible;" <#if xzfyInfo.id?length gt 10>readonly</#if>>${xzfyInfo.dbrDetail?default('')}</textarea>
	    
</td>
   <th>第三人：</td>
    <td class="tdFormInput">
    <textarea name="xzfyInfo.third" type="text" class="textarea"  ><#if xzfyInfo.third?has_content>${xzfyInfo.third}<#else>无</#if></textarea>
    </td>
   </tr>   
   
   <tr class="trwhite">
    <th>代理人：</td>
    <td class="tdFormInput"><input name="xzfyInfo.agent_name" type="text" id="wtdlr" class="inputTextNormal"  <#if xzfyInfo.agent_name?has_content>value="${xzfyInfo.agent_name}"<#else>value="无"</#if>></td>
   <th>第三人代理人：</td>
    <td class="tdFormInput"><input name="xzfyInfo.third_agent" type="text" class="inputTextNormal"  <#if xzfyInfo.third_agent?has_content>value="${xzfyInfo.third_agent}"<#else>value="无"</#if>></td>
   </tr>
<#assign rencount=xzfyInfo.renCount?number>
   <tr class="trwhite">
    <th>多人复议：</td>
    <td class="tdFormInput">
    <input type="radio" name="xzfyInfo.isMany" value="是" id="duoren_y"
    	<#if rencount gt 1>
    		checked
    	</#if>
    altname="多人复议" >
      <label for="xzpc_y">是 </label>
      <input type="radio" name="xzfyInfo.isMany" value="否" id="duoren_n"
      <#if rencount<2 >checked</#if>
       altname="多人复议" >
      <label for="xzpc_n">否</label>
    </td>
        <th>复议前置：</th>
    <td >
	    <input type="radio" name="xzfyInfo.isfront" value="是"
    	<#if xzfyInfo.isfront?has_content&&xzfyInfo.isfront=="是">checked</#if>
    altname="复议前置" >
      <label for="xzpc_y">是 </label>
      <input type="radio" name="xzfyInfo.isfront" value="否"
      <#if xzfyInfo.isfront?has_content&&xzfyInfo.isfront=="否">checked</#if>
       altname="复议前置" >
      <label for="xzpc_n">否</label>
    </td>
   </tr>
  
  <tr class="trcolor">
  <input type="hidden" value="0" id="aac">
   <th><font color="red">*</font>被申请人种类：</th>
   <!--onchange="aaa(document.getElementById('beapptype').options[document.getElementById('beapptype').selectedIndex].value)"-->
    <td >
  <select name="xzfyInfo.defendant_type" id="beapptype" onchange="aaa()" >
    <option value="0">--请选择--</option>
	<#list zlList as zl>
	<option value="${zl.value}" <#if zl.value==xzfyInfo.defendant_type>selected</#if>>${zl.name}</option>
    </#list>
</select>        
    
</td>

      <th>被申请人名称：</th>
     <td  style="display:block;" id="beappnametd" >   
      <input name="xzfyInfo.defendant_name" type="text" class="input2"" id="beappnameinput" ischeck="y" altname="被申请人名称" value="${xzfyInfo.defendant_name?default('')}">
     </td> 
    <td  style="display:none" id="beappnamesel">  
    <select name="ssss"  id="beappname"
     onchange="beappcode()" altname="被申请人名称" class="selectStyleNormal">
      <option value="0" deptcode="0">----请选择----</option>     	 
    </select>    
    </td>
    
    <td  style="display:none;" id="beappnametd">
   <input name="sss" type="text"  id="beappname2" >
    </td>
	 
    </tr>
   
  
      <tr class="trwhite">
<th><font color="red">*</font>被复议的具体<br>行政行为名称：</th>
	    <td>
	    <textarea  name="xzfyInfo.xwname" id="TBeName" value="${xzfyInfo.xwname?default('')}">${xzfyInfo.xwname?default('')}</textarea>

	    </td>
	    <th>具体行政行为<br>文号：</th>
	    <td>
	    <textarea  name="xzfyInfo.xwnum" id="annum" value="${xzfyInfo.xwnum?default('')}">${xzfyInfo.xwnum?default('')}</textarea>
	    </td>
    </tr> 
    
  <tr class="trwhite" id="requesttype2" style="display:none">
   <th>不作为事项：</td>
   <td>

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
  <textarea class="textarea" name="xzfyInfo.matter_detail" id="bzwbc" style="overflow-y:visible;"></textarea>
  </span>
  </td>
	    <th>申请人曾经要求被申<br>请人履行何种法定职责：</th>
	    <td  ><textarea name="xzfyInfo.duty" id="zhize" type="text" class="textarea"  style="overflow-y:visible;"></textarea>
	    </td>
	    </tr>    
	    <tr  id="requesttype3" style="display:none">
	    <th>要求被申请人履行日期：</th>
	    <td>
	    <select name="knowy" id="knowy1" onchange='setKnowDate1()' retSelect="1">
	   		<option value="0">选择年</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
			<option value="2016">2016</option>
			<option value="2017">2017</option>
			<option value="2018">2018</option>
			<option value="2019">2019</option>
			<option value="2020">2020</option>
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
		<th>是否有曾要求履责而<br>未履行的证明材料：</th>
	    <td>
	   <select name="xzfyInfo.is_prof" id="ismingque" onchange="ryq2()">
	    <option value="0">----请选择----</option>
	      <option value="有">有</option>
		 <option value="无">无</option>
	  </select>
	    <textarea name="xzfyInfo.is_prof_detail" id="mingque" class="textarea" ></textarea>
	      </td>
	   </tr>
	   <#assign caseNum=''>
	   <#if xzfyInfo.tjzfzh?has_content>
	   		<#assign caseNum=xzfyInfo.tjzfzh>
	   	<#else>
	   		<#assign caseNum=xzfyCom.caseNum?default('')+'['+year+']'>
	   	</#if>
	   
   <tr class="trcolor">
 <th>案号：</th>
	 <td ><input type="text" name="xzfyInfo.tjzfzh" value="${caseNum?default('')}" id="tjzfzh"></td>
     <th><font color="red">*</font>行政复议请求：</th>
    <td >
    
    <#assign qingqiu=xzfyInfo.xzfy_requset_retail?default('')>
    <#assign neirong=''>
    <textarea name="xzfy_requset_retail" id="xzfyqq1" type="text" 
     altname="行政复议请求">${qingqiu}</textarea></td>
    
    
 
    </tr>	   
	   
	   
	  <#if xzfyInfo.istiaojie?default('0')='1'>
     <tr class="trcolor">
		    <th>案前调解：</th>
		    <td>是</td>
			<th>调解结果：</th>
			<td>
    <select name="tiaojie_result" id="tiaojie" onchange="checkTiaojie();checkLian()"
    <#if (xzfyInfo.status=="1" || xzfyInfo.status=="3" || (xzfyInfo.status=="11" && sdResult?number>1)) && xzfyInfo.check_status=='0' >

	<#if xzfyInfo.buzhengDelay?default('0')=='1'>disabled</#if>
<#else>disabled</#if>
    >
    <option value="3"  <#if xzfyInfo.tiaojie_result?has_content&&xzfyInfo.tiaojie_result=="3">selected</#if>>不成功</option>
	<option value="2"  <#if xzfyInfo.tiaojie_result?has_content&&xzfyInfo.tiaojie_result=="2">selected</#if>>成功</option>	
    </select>
    <input type='hidden' name='xzfyInfo.tiaojie_result' id="tiaojie_result" value="${xzfyInfo.tiaojie_result?default('0')}">
				</td>  	  
				</tr> 
	<script>
	function checkTiaojie(){
		document.getElementById("tiaojie_result").value=document.getElementById("tiaojie").value;
		if(document.getElementById("tiaojie").value=="2"){
			document.getElementById("stadardResult").value=5;
			document.getElementById("sdResult").value=5;
		}
	}
	</script>			
				
	   </#if>
     <tr class="trcolor">
		    
 		    <th><font color="red">*</font>是否经过补正：</th>
		    <td>
		    <input type="hidden"  name="xzfyInfo.isBuzheng" id="isBuzheng"  value="${xzfyInfo.isBuzheng}" >
    		<input type="radio"  
    		disabled name="buzhengType" value="1" <#if xzfyInfo.isBuzheng=="1">checked</#if>>是
    		<input type="radio"
    		 disabled name="buzhengType" value="0" <#if xzfyInfo.isBuzheng?default('0')=="0">checked</#if>>否
		    </td>
			<th><span id="buzhengguoqi1" <#if xzfyInfo.isBuzheng=="1">style="display:''"<#else>style="display:none"</#if>>补正过期：</span></th>
			<td><span id="buzhengguoqi2" <#if xzfyInfo.isBuzheng=="1">style="display:''"<#else>style="display:none"</#if>>
				<input type="hidden"  name="xzfyInfo.buzhengDelay" id="buzhengDelay"  value="${xzfyInfo.buzhengDelay?default('0')}" >
    		<input type="radio"    <#if xzfyInfo.buzhengDelay?default('0')=="1">checked</#if>>是
    		<input type="radio"    <#if xzfyInfo.buzhengDelay?default('0')=="0">checked</#if>>否
			</span></td>
		    </tr>
	<tbody <#if xzfyInfo.isBuzheng=="1">style="display:''"<#else>style="display:none"</#if> id="buzhengBody">

	 <tr  style="display:none">
	<th>知道时间：</td>
	    <td>
	    	<input name="app_face.zhidaodate" type="text"
		     id="zhidaodate"  
		      altname="知道时间" class="input2">
	    </td>
	    <th>要求被申请人履行日期：</th>
	    <td>
		<input name="xzfyInfo.execute_date" type="text"
		     id="usedate" 
		      altname="要求被申请人履行日期" class="input2">
	   </td>
  </tr>
	<tr>
	 <th>通知补正日期：</th>
	<td ><input type="text"  disabled  value="${xzfyInfo.bzTongzhiriqi?default('')}" id="bzTongzhiriqi"></td>
 	<th>补齐材料日期：</th>
	<td ><input type="text" disabled value="${xzfyInfo.bzBuqiriqi?default('')}" id="bzBuqiriqi"></td>
	</tr>
	</tbody>	
	<script>
	function checkBuzheng(type){
		if(type==1){
			document.getElementById("isBuzheng").value=1;
			document.getElementById("buzhengBody").style.display="block";
			document.getElementById("buzhengguoqi1").style.display="block";
			document.getElementById("buzhengguoqi2").style.display="block";
		}else{
			document.getElementById("isBuzheng").value=0;
			document.getElementById("buzhengBody").style.display="none";
			document.getElementById("buzhengguoqi1").style.display="none";
			document.getElementById("buzhengguoqi2").style.display="none";
		}
	}
	
	function checkBuzhengDelay(type){
		if(type==1){
			document.getElementById("buzhengDelay").value=1;
			document.getElementById("sdResult").value=5;
			document.getElementById("stadardResult").value=5;			
			document.getElementById("sdResult").disabled=true;
			//document.getElementById("banli").style.display="none";
			//document.getElementById("jiean_info").style.display="block";

		}else{
			document.getElementById("buzhengDelay").value=0;
			document.getElementById("sdResult").value=0;
			document.getElementById("stadardResult").value=0;
			document.getElementById("sdResult").disabled=false;
			//document.getElementById("banli").style.display="none";
			//document.getElementById("jiean_info").style.display="none";
		}	
	}
	
	function setBzDate(){
		//if(document.getElementById("bzBuqiriqi").value!="")
			//document.getElementById("receivedate").value=document.getElementById("bzBuqiriqi").value;
	}
	
	</script>	
	<#assign content_abstract=''>
	<#if xzfyInfo.content_abstract?has_content>
		<#assign content_abstract=xzfyInfo.content_abstract>
	<#else>
		<#assign content_abstract='申请人不服'+xzfyInfo.defendant_name+xzfyInfo.xwname?default('')+'('+xzfyInfo.xwnum?default('')+')'+xzfyInfo.xzfy_requset_retail?default('')+"。">
	</#if>
<!--    
  <tr class="trcolor">
    <th>简要内容：</td>
    <td ><textarea class="textarea" name="xzfyInfo.content_abstract" id="content" class="textarea" 
     >${content_abstract}</textarea></td>
     <th>备注：</td>
    <td ><textarea class="textarea" name="xzfyInfo.remark" id="remark" class="textarea" 
     altname="">${xzfyInfo.remark?default('')}</textarea></td>   
  </tr>	
  -->

		    
<#assign handleReason=xzfyInfo.handleReason?default('0')>  
    <tr class="trcolor" >

	<th ><font color="red">*</font>立案审查意见：</td>
	    <td >
<input type="hidden" name="xzfyInfo.stadardResult" id="stadardResult"  value="${xzfyInfo.stadardResult?default('0')}">
<select    
disabled
id="sdResult" nbzcheck="y" >
	      <option value="0" <#if sdResult=='0'>selected</#if>>----请选择----</option>
		  <option value="1" <#if sdResult=='1'>selected</#if>>受理</option>
		  <option value="2" <#if sdResult=='2'>selected</#if>>告知</option>
		  <option value="3" <#if sdResult=='3'>selected</#if>>不予受理</option>
		  <option value="5" <#if sdResult=='5'>selected</#if>>其他处理</option>
	    </select></td>
	   <th><span id="lianSpan" <#if sdResult=='1'>style="display:block"<#else>style="display:none"</#if>><font color="red">*</font>立案日期</span>
	    <span id="weishouli" <#if (sdResult=='2' || sdResult=='3' || sdResult=='5')&&xzfyInfo.caseorg =="0000">style="display:block"
	      <#else>  style="display:none"</#if>>未受理原因：</span>
	   </th>
	     
	      <td >
    <input name="xzfyInfo.lian_date" id="lian_date" ischeck="y"    
    <#if sdResult=='1'>style="display:block"<#else>style="display:none"</#if>
    type="text" onClick="WdatePicker()"  <#if xzfyInfo.lian_date?has_content>value="${xzfyInfo.lian_date}"</#if>>
    
   
		 <select name="xzfyInfo.handleReason" <#if (sdResult=='2' || sdResult=='3' || sdResult=='5')&&xzfyInfo.caseorg =="0000">style="display:block"<#else>style="display:none"</#if> id="handleReason" >
		 	<option value="0">请选择未受理原因</option>
		 	<option value="1" <#if handleReason=="1">selected</#if>>抽象行政行为</option>
		 	<option value="2" <#if handleReason=="2">selected</#if>>行政处分、人事处理决定</option>
		 	<option value="3" <#if handleReason=="3">selected</#if>>行政机关对民事纠纷调解、处理</option>
		 	<option value="4" <#if handleReason=="4">selected</#if>>国防、外交行为</option>
		 	<option value="5" <#if handleReason=="5">selected</#if>>交通医疗事故责任认定</option>
		 	<option value="6" <#if handleReason=="6">selected</#if>>司法鉴定</option>
		 	<option value="7" <#if handleReason=="7">selected</#if>>刑事司法行为</option>
		 	<option value="8" <#if handleReason=="8">selected</#if>>民事行为</option>
		 	<option value="9" <#if handleReason=="9">selected</#if>>信访行为</option>
		 	<option value="10" <#if handleReason=="10">selected</#if>>行政机关内部行为</option>
		 	<option value="11" <#if handleReason=="11">selected</#if>>不具有强制力的行政指导</option>
		 	<option value="12" <#if handleReason=="12">selected</#if>>其他复议机关对复议申请的处理</option>
		 	<option value="13" <#if handleReason=="13">selected</#if>>其他</option>
		 </select>    
      </td>
</tr>
<#if xzfyInfo.caseorg =="0000"> 
<tr id="banlichushi" <#if sdResult=='1'> <#else>style="display:none"</#if>>
	<th><font color="red">*</font>案件办理处室：
	</th>
	<td>
	 <select name="xzfyInfo.app_type2" id="apptype2" >
	  <option value="0">--请选择--</option>
    <option value="224" <#if xzfyInfo.app_type2?default(0)==224>selected</#if>>行政复议案件办理一处</option>
    <option value="1613" <#if xzfyInfo.app_type2?default(0)==1613>selected</#if>>行政复议案件办理二处</option>
	</td>
	
	<th>&nbsp;</th>
	<td>&nbsp;</td>
</tr>
<#else >
<tr id="banlichushi" style="display:none">
</tr>
</#if>
    <tr>
    <td align="center" colspan=4>案件统计信息
    </td>
    </tr>
<tr>
 <th><font color="red">*</font>案件类型：</th>
    <td title="该信息由立案审查人填写，请根据实际情况慎重修改">
   <#assign caseType=xzfyInfo.casetype?default('0')>
    <select name="xzfyInfo.casetype" ischeck="y" altname="案件类型" title="该信息由立案审查人填写，请根据实际情况慎重修改"
     class="selectStyleNormal" id="xzfysx" onchange="sqfysx()">

     <option value="0">----请选择----</option>
     <option value="1" <#if caseType=="1">selected</#if>>行政处罚</option>
	 <option value="2" <#if caseType=="2">selected</#if>>行政强制措施</option>
	 <option value="3" <#if caseType=="3">selected</#if>>行政征收</option>
	 <option value="4" <#if caseType=="4">selected</#if>>行政许可</option>
	 <option value="5" <#if caseType=="5">selected</#if>>行政确权</option>
	 <option value="6" <#if caseType=="6">selected</#if>>干预经营自主权</option>
     <option value="7" <#if caseType=="7">selected</#if>>信息公开</option>
	 <option value="8" <#if caseType=="8">selected</#if>>行政不作为</option>
	 <option value="9" <#if caseType=="9">selected</#if>>其他</option>
	<option value="10" <#if caseType=="10">selected</#if>>行政确认</option>
	 <option value="11" <#if caseType=="11">selected</#if>>举报投诉处理</option>
    </select>
 
     <select title="该信息由立案审查人填写，请根据实际情况慎重修改"  <#if caseType=="1"> name="xzfyInfo.casetype2" 
      style="display:block"<#else>name="ss" style="display:none"</#if>
       altname="案件类型" class="selectStyleNormal" id="xzfysx2xzcf"
        ishidden="y" onchange="">
      <option value="0">----请选择----</option>
 	 <option value="1" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="1">selected</#if>>拘留</option>
	 <option value="2" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="2">selected</#if>>没收</option>
	 <option value="3" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="3">selected</#if>>罚款</option>
	 <option value="4" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="4">selected</#if>>其他</option>
	
  </select>
   <select title="该信息由立案审查人填写，请根据实际情况慎重修改" <#if caseType=="2">
   name="xzfyInfo.casetype2" style="display:block"<#else>name="ss" 
   style="display:none"</#if> altname="案件类型" class="selectStyleNormal"
    id="xzfysx2xzqzcs" ishidden="y" onchange="">
      <option value="0">----请选择----</option>

	 <option value="5" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="5">selected</#if>>对人身的强制措施</option>
	 <option value="6" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="6">selected</#if>>对不动产的强制措施</option>
	 <option value="7" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="7">selected</#if>>对其它财产的强制措施</option>

  </select>
   <select title="该信息由立案审查人填写，请根据实际情况慎重修改" <#if caseType=="3">name="xzfyInfo.casetype2" 
   style="display:block"<#else>name="ss" style="display:none"</#if> 
   altname="案件类型" class="selectStyleNormal" id="xzfysx2xzsx"
    ishidden="y" onchange="">
      <option value="0">----请选择----</option>

	 <option value="8" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="8">selected</#if>>征收土地</option>
	 <option value="9" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="9">selected</#if>>版税</option>
	 <option value="10" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="10">selected</#if>>收费</option>
	 <option value="11" <#if xzfyInfo.casetype2?has_content&&xzfyInfo.casetype2=="11">selected</#if>>要求履行其他义务</option>	 
  </select>
     
    </td>
   <th><font color="red">*</font>行政管理类别：</td>
    <td class="tdFormInput">   
     <select name="xzfyInfo.refer" title="该信息由立案审查人填写，请根据实际情况慎重修改"  id="ajsjfm1" ischeck="y" altname="行政管理类别"
      >
        
	<option value="0">----请选择----</option>
	<option value="1" <#if xzfyInfo.refer?default('0')=="1">selected</#if>>公安</option>
	<option value="2" <#if xzfyInfo.refer?default('0')=="2">selected</#if>>国家安全</option>
	<option value="3" <#if xzfyInfo.refer?default('0')=="3">selected</#if>>劳动和社会保障</option>
	<option value="4" <#if xzfyInfo.refer?default('0')=="4">selected</#if>>司法行政</option>
	<option value="5" <#if xzfyInfo.refer?default('0')=="5">selected</#if>>民政</option>
	<option value="6" <#if xzfyInfo.refer?default('0')=="6">selected</#if>>土地</option>
	<option value="7" <#if xzfyInfo.refer?default('0')=="7">selected</#if>>地矿</option>
	<option value="8" <#if xzfyInfo.refer?default('0')=="8">selected</#if>>环保</option>
	<option value="9" <#if xzfyInfo.refer?default('0')=="9">selected</#if>>农业</option>
	<option value="10" <#if xzfyInfo.refer?default('0')=="10">selected</#if>>水利</option>
	<option value="11" <#if xzfyInfo.refer?default('0')=="11">selected</#if>>林业</option>
	<option value="12" <#if xzfyInfo.refer?default('0')=="12">selected</#if>>城市规划</option>
	<option value="13" <#if xzfyInfo.refer?default('0')=="13">selected</#if>>房屋拆迁</option>
	<option value="14" <#if xzfyInfo.refer?default('0')=="14">selected</#if>>房屋登记</option>
	<option value="15" <#if xzfyInfo.refer?default('0')=="15">selected</#if>>工商</option>
	<option value="16" <#if xzfyInfo.refer?default('0')=="16">selected</#if>>质监</option>
	<option value="17" <#if xzfyInfo.refer?default('0')=="17">selected</#if>>商务</option>
	<option value="18" <#if xzfyInfo.refer?default('0')=="18">selected</#if>>物价</option>
	<option value="19" <#if xzfyInfo.refer?default('0')=="19">selected</#if>>能源</option>
	<option value="20" <#if xzfyInfo.refer?default('0')=="20">selected</#if>>交通</option>
	<option value="21" <#if xzfyInfo.refer?default('0')=="21">selected</#if>>信息产业</option>
	<option value="22" <#if xzfyInfo.refer?default('0')=="22">selected</#if>>邮政</option>
	<option value="23" <#if xzfyInfo.refer?default('0')=="23">selected</#if>>烟草专卖</option>
	<option value="24" <#if xzfyInfo.refer?default('0')=="24">selected</#if>>税务</option>
	<option value="25" <#if xzfyInfo.refer?default('0')=="25">selected</#if>>人民银行</option>
	<option value="26" <#if xzfyInfo.refer?default('0')=="26">selected</#if>>证监</option>
	<option value="27" <#if xzfyInfo.refer?default('0')=="27">selected</#if>>保监</option>
	<option value="28" <#if xzfyInfo.refer?default('0')=="28">selected</#if>>银监</option>
	<option value="29" <#if xzfyInfo.refer?default('0')=="29">selected</#if>>外汇</option>
	<option value="30" <#if xzfyInfo.refer?default('0')=="30">selected</#if>>财政</option>
	<option value="31" <#if xzfyInfo.refer?default('0')=="31">selected</#if>>统计</option>
	<option value="32" <#if xzfyInfo.refer?default('0')=="32">selected</#if>>审计</option>
	<option value="33" <#if xzfyInfo.refer?default('0')=="33">selected</#if>>海关</option>
	<option value="34" <#if xzfyInfo.refer?default('0')=="34">selected</#if>>商检</option>
	<option value="35" <#if xzfyInfo.refer?default('0')=="35">selected</#if>>药监</option>
	<option value="36" <#if xzfyInfo.refer?default('0')=="36">selected</#if>>卫生</option>
	<option value="37" <#if xzfyInfo.refer?default('0')=="37">selected</#if>>计划生育</option>
	<option value="38" <#if xzfyInfo.refer?default('0')=="38">selected</#if>>教育</option>
	<option value="39" <#if xzfyInfo.refer?default('0')=="39">selected</#if>>文化</option>
	<option value="40" <#if xzfyInfo.refer?default('0')=="40">selected</#if>>专利</option>
	<option value="41" <#if xzfyInfo.refer?default('0')=="41">selected</#if>>商标</option>
	<option value="42" <#if xzfyInfo.refer?default('0')=="42">selected</#if>>版权</option>	
	<option value="43" <#if xzfyInfo.refer?default('0')=="43">selected</#if>>旅游</option>	
	<option value="44" <#if xzfyInfo.refer?default('0')=="44">selected</#if>>其他</option>			
  </select>    
    

    </td>
 
</tr>

              	<tr <#if keywordList.size() gt 0>style="display:''"<#else>style="display:none"</#if>>      
		     		<th  colspan=2><font color="red">*</font>本单位自定义统计关键词：</th>
				    <td  colspan=2>
					  	 <select name="keyword" id="dept_keyword" title="该信息由立案审查人填写，请根据实际情况慎重修改">
					  	 <option value="0">-请选择-</option>
					  	 <#list keywordList as xzfyKeyword>
					  	 <option value="${xzfyKeyword.keyword}" 
					  	 <#if xzfyKeyword.keyword==keywordChecked>
					  	  selected
					  	  </#if>
					  	 >${xzfyKeyword.keyword}</option>
					  	 </#list>
					  	 <option value="其他">其他</option>
					  	 </select>
				    </td>					
		  		</tr>
		  	
    <tr>
    <td align="center" colspan=4 title="请根据本单位实际工作要求操作">申请材料电子版上传
    </td>
    </tr>
 <tr>
 <th>上传申请书、申请人身份证明、委托手续：</th>
 <td><input name="upFile0" type="file" class="file" id="upFile0" />
 <#list fileList as fList>
 	<#if fList.type=='1'>
 		<br>已上传：<a href="..${fList.storedLocation?default('')}${fList.storedName?default('')}">下载</a>
 	</#if>
 </#list>
 </td>
 <th>上传其他证据<br>材料：</th>
 <td>
	<a href="#" onclick="addattachment(this.form);return false;" title="添加">添加</a>
	<table id="upFile2T" class="upLoadTable" >
		<tr >
			<td  >
				<input style='width:170px' name="upFile02" type="file" class="file" id="upFile02" />
			</td>
		</tr>
	</table>	
	 <#list fileList as fList>
 	<#if fList.type=='2'>
 		<a href="..${fList.storedLocation?default('')}${fList.storedName?default('')}">${fList.fileName?default('')}</a>
 		<#if isView?default('0')=='1'><a href="../xzfy/deleteFile.action?fileId=${fList.id}&funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=1"><font color="red">删除</font></a></#if>
 		<br>
 	</#if>
 </#list> 
 			</td>
		</tr> 	
<script>
	function addattachment(){

		
		var tabObj = document.getElementById("upFile2T");//获取表格对象
		var newRow = tabObj.insertRow(tabObj.rows.length);//插入行对象
		newRow.width='100%';
		//行数据
		var valueArr = new Array("<input style='width:170px' name='upFile02' type='file' class='file' id='upFile02'  /><a href='#' onclick='del(this);return false;' title='删除'>删除</a>" )
		var tempCell = new Array();
		for (var i = 0; i < valueArr.length; i++) {
			tempCell[i] = newRow.insertCell(i);//插入单元格
			tempCell[i].innerHTML = valueArr[i];//插入内容
		}
		tempCell[0].className="upLoad";//设置单元格class
		tempCell[0].width = "50%";//设置单元格width
		
	}
	
	function del(obj) {
	<#--
		var e = document.getElementById(id.id);
		document.getElementById("newdiv").removeChild(e);
		count11--;
	-->
	//if (confirm("\u786e\u8ba4\u5220\u9664\uff1f")) {
		obj.parentNode.parentNode.removeNode(true);
	//}
}
</script>		

<script>
function checkLian(){
	if(document.getElementById("sdResult").value==1){
		document.getElementById("lianSpan").style.display="block";
		document.getElementById("lian_date").style.display="block";
		document.getElementById("banlichushi").style.display="block";
		document.getElementById("weishouli").style.display="none";
		document.getElementById("handleReason").style.display="none";	
		//document.getElementById("banli").style.display="block";
		//document.getElementById("jiean_info").style.display="block";
		document.getElementById("stadardResult").value=document.getElementById("sdResult").value;
		//document.getElementById("lian1Btn").type='button';
		//document.getElementById("lian2Btn").type='button';
		//document.getElementById("lian3Btn").type='button';
		
document.getElementById("lianSaveSpan").style.display="block";
document.getElementById("lianSaveSpan1").style.display="block";
		document.getElementById("jiean_info").style.display="none";
		
	}else if(document.getElementById("sdResult").value==0){
		document.getElementById("lianSpan").style.display="none";
		document.getElementById("lian_date").style.display="none";	
		document.getElementById("banlichushi").style.display="none";
		document.getElementById("weishouli").style.display="none";
		document.getElementById("handleReason").style.display="none";	
		//document.getElementById("banli").style.display="none";
		document.getElementById("stadardResult").value=document.getElementById("sdResult").value;
		document.getElementById("jiean_info").style.display="none";
		document.getElementById("lianSaveSpan").style.display="none";
		document.getElementById("lianSaveSpan1").style.display="block";
		//if(document.getElementById("sdResult").value==0)
			//document.getElementById("jiean_info").style.display="none";
		//else
		
		//document.getElementById("lian1Btn").type='hidden';
		//document.getElementById("lian2Btn").type='hidden';
		//document.getElementById("lian3Btn").type='button';
		document.getElementById("jiean_info").style.display="none";
		
	}else{
		document.getElementById("lianSpan").style.display="none";
		document.getElementById("lian_date").style.display="none";		
		document.getElementById("banlichushi").style.display="none";
		if(document.getElementById("caseorg").value=="0000") {
			document.getElementById("weishouli").style.display="block";
			document.getElementById("handleReason").style.display="block";	
		}

		//document.getElementById("banli").style.display="none";
		document.getElementById("stadardResult").value=document.getElementById("sdResult").value;
		//if(document.getElementById("sdResult").value==0)
			//document.getElementById("jiean_info").style.display="none";
		//else
		
		//document.getElementById("lian1Btn").type='hidden';
		//document.getElementById("lian2Btn").type='hidden';
		//document.getElementById("lian3Btn").type='hidden';
		document.getElementById("jiean_info").style.display="block";
		document.getElementById("lianSaveSpan").style.display="none";
		document.getElementById("lianSaveSpan1").style.display="none";
		
	}
}
</script>



  </table>
      <#assign status=xzfyInfo.status?number>
  <table  id=""class="ui-table  "   width="50%">
  <#if xzfyInfo.check_status=='0'>
  <tfoot>
      <tr>
            <td>
            <#if isView?has_content>
            	<#if isView=='1'>
		
            	<#if status<4 || (status==11 && sdResult?number gt 1)>
            	<span id="lianSaveSpan1" <#if sdResult=="1" ||sdResult=="0">style="display:block"<#else>style="display:none"</#if>>
		<input class="ui-btn ui-btn-normal"	
		 title="阶段性保存所填案件信息" type="button" id="lian3Btn"   value="保存" onClick="saveShencha()">
		</span>

            	</#if>
            	</#if>
             </#if>
            </td>
      </tr>
    </tfoot>
    </#if>
    </table>

    
 <table  id="banli" 
  <#if (status>3 && status<11) || (status>10 && sdResult=='1') > style="display:''"<#else>style="display:none"</#if>
 class="ui-table ui-table-form "  ><!--表单填写项文字居右样式由 fn-text-right控制。td宽度在第一行标记 不要每行都标记-->

    <tr>
    <td align="center" colspan=4>审理程序
    </td>
    </tr>
<#assign isdelay=xzfyInfo.isdelay?default('0')>
<#assign isstop=xzfyInfo.isstop?default('0')>
 <tr class="trcolor">

	<th width="15%">是否延期：</td>
	    <td width="35%">
<input type="radio" name="xzfyInfo.isdelay" <#if isdelay=="1">checked</#if> value="1">是  
<input type="radio" name="xzfyInfo.isdelay" <#if isdelay=="0">checked</#if> value="0">否
</td>
	       
	<th width="18%">是否中止：</td>
	    <td width="32%">
<input type="radio" name="isstop1" onclick="setBreak(1)" <#if isstop=="1">checked</#if> value=1">是
<input type="radio" name="isstop1" onclick="setBreak(0)" <#if isstop=="0">checked</#if> value=0">否
<input type="hidden" name="xzfyInfo.isstop" id="isstop" value="${isstop}">
<input type="hidden" name="listkeyword" id="listkeyword" value="${listkeyword?default('8')}">

</td>
  </tr>
  <script>
  	function setBreak(type){
  		if(type==1){
  			document.getElementById("breakType").style.display="block";
  			document.getElementById("isstop").value=1;
  		}else{
  			document.getElementById("breakType").style.display="none";
  			document.getElementById("isstop").value=0;
  		}
  	}
  </script>
 <tbody <#if isstop=="1">style="display:''"<#else>style="display:none"</#if> id="breakType">
 <tr class="trcolor" >

	<th >中止日期：</td>
	    <td >
		<input name="xzfyInfo.isstop_from" type="text" id="isstop_from" 
		onClick="WdatePicker()"  value="${xzfyInfo.isstop_from?default('')}">
</td>
	       
	<th >恢复审理日期：</td>
	    <td w>
<input name="xzfyInfo.breakTo" type="text" id="breakTo" onClick="WdatePicker()"  value="${xzfyInfo.breakTo?default('')}">
</td>
  </tr>
</tbody> 
  
  <tr  style="display:none">
<#assign hastingzheng=xzfyInfo.hastingzheng?default('0')>
<#assign hasdiaocha=xzfyInfo.hasdiaocha?default('0')>
<#assign hasanshen=xzfyInfo.hasanshen?default('0')>
<#assign hastiaojie=xzfyInfo.hastiaojie?default('0')>
	<th >是否听证：</td>
	    <td >
<input type="radio" name="xzfyInfo.hastingzheng" <#if hastingzheng=="1">checked</#if> value=1>是
<input type="radio" name="xzfyInfo.hastingzheng" <#if hastingzheng=="0">checked</#if> value=0>否

</td>
	       
	<th>是否现场调查：</td>
	    <td>
<input type="radio" name="xzfyInfo.hasdiaocha" <#if hasdiaocha=="1">checked</#if> value=1>是
<input type="radio" name="xzfyInfo.hasdiaocha" <#if hasdiaocha=="0">checked</#if> value=0>否
</td>
  </tr>
  
 <tr class="trcolor" style="display:none">

	<th >复议委员会：</td>
	    <td >
<input type="radio" name="xzfyInfo.hasanshen" <#if hasanshen=="1">checked</#if> value=1>是
<input type="radio" name="xzfyInfo.hasanshen" <#if hasanshen=="0">checked</#if> value=0>否
</td>
	       
	<th>是否调解：</td>
	    <td >
<input type="radio" name="xzfyInfo.hastiaojie" <#if hastiaojie=="1">checked</#if> value=1>是
<input type="radio" name="xzfyInfo.hastiaojie" <#if hastiaojie=="0">checked</#if> value=0>否
</td>
  </tr>
  </table>

 <table  id="jiean_info" class="ui-table ui-table-form " 
 <#if status gt 3 || sdResult=="2" || sdResult=="3" || sdResult=="5"> style="display:''"
 
 <#else>style="display:none"</#if>
  ><!--表单填写项文字居右样式由 fn-text-right控制。td宽度在第一行标记 不要每行都标记-->

    <tr>
    <td align="center" colspan=4>结案信息
    </td>
    </tr>

<#assign finish_type=xzfyInfo.finish_type?default('0')>
<#assign finishBreakType=xzfyInfo.finishBreakType?default('0')>
  <tr class="trcolor" id="handleCase">

 <th>结案日期：</td>
    <td class="tdFormInput">
	   <input name="xzfyInfo.finish_date" class="text"  id="jieandate" type="text"
					     	   value="<#if xzfyInfo.finish_date?has_content>${xzfyInfo.finish_date}</#if>" onClick="WdatePicker()" >
	
    </td>
	       
<th width="20%">结案方式：</th>
<td width="30%">
						<select name="xzfyInfo.finish_type" id="jafs"  onchange="jafss()">
						  <option value="0" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="0">selected</#if> >----请选择----</option>
						  <option value="1" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="1">selected</#if> >驳回</option>
						  <option value="2" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="2">selected</#if> >维持</option>
						  <option value="3" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="3">selected</#if> >确认违法</option>
						  <option value="4" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="4">selected</#if> >撤销</option>
						  <option value="5" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="5">selected</#if> >变更</option>
						  <option value="6" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="6">selected</#if> >责令履行</option>
						  <option value="7" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="7">selected</#if> >调解</option>
						  <option value="8" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="8">selected</#if> >终止</option>
						  <option value="9" <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="9">selected</#if> >其他</option>		 
					    </select>
					    <select  id="jafs1"  
					    <#if finish_type=="8"> style="display:block" name="xzfyInfo.finishBreakType"<#else>
					    style="display:none" name="xzfyfb"</#if>>
						  <option value="0" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="0">selected</#if> >----请选择----</option>
						  <option value="1" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="1">selected</#if> >和解协议</option>
						  <option value="5" <#if xzfyInfo.finishBreakType?exists && (xzfyInfo.finishBreakType=="5" || xzfyInfo.finishBreakType=="2" || xzfyInfo.finishBreakType=="3" )>selected</#if> >撤回申请 </option>
						 <#-- <option value="3" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="3">selected</#if> >被申请人改变后撤回申请</option>-->
						  <option value="4" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="4">selected</#if> >其他</option>		 
					    </select>
					    
			    <select  id="jafs2" 
			     <#if xzfyInfo.finish_type?exists && xzfyInfo.finish_type=="1">
			     name="xzfyInfo.finishBreakType" style="display:''" <#else>
			     name="xzfyFb" style="display:none"</#if>>
				  <option value="0" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="0">selected</#if> >----请选择----</option>
				  <option value="5" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="5">selected</#if> >已经履行法定职责</option>
				  <option value="6" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="6">selected</#if> >不应当受理 </option>
				  <option value="7" <#if xzfyInfo.finishBreakType?exists && xzfyInfo.finishBreakType=="7">selected</#if> >其他</option>	 
			    </select>
</td>
  </tr>
  <#assign nationMoney=xzfyInfo.nationMoney?default('0')>
       <tr >
 <th>国家赔偿：</td>
    <td >
        <input type="radio" name="xzfyInfo.nationMoney" value="1"  
        <#if  nationMoney == "1" >checked</#if> onclick="gjpcc(1)" />  是
	   <input type="radio" name="xzfyInfo.nationMoney" value="0" 
	   <#if nationMoney == "0" >checked</#if> onclick="gjpcc(0)" />  否
				    	
    </td>
       <th>&nbsp;<#if xzfyInfo.jieanwenshu?has_content>结案文书已上传:</#if></td>
    <td class="tdFormInput">
    <!--
			 	<input name="upFile1" type="file" id="jiean_file" 
			 	 altname="" >
	-->		 	 
		<#if xzfyInfo.jieanwenshu?has_content>
		&nbsp;&nbsp;&nbsp;&nbsp;<a href="${xzfyInfo.jieanwenshu}">下载</a>
		</#if>
		<input type="hidden" name="xzfyInfo.jieanwenshu" id="jieanwenshu"
		<#if xzfyInfo.jieanwenshu?has_content> value="${ xzfyInfo.jieanwenshu}"</#if>>
    </td>
    </tr>  
    <script>
    	function gjpcc(type){
  			if(type==1)
  				document.getElementById("peichang").style.display="block";
  			else
  				document.getElementById("peichang").style.display="none";
    	}
    </script>
 <tbody <#if nationMoney=="1">style="display:''"<#else>style="display:none"</#if> id="peichang">
  				<tr>      
				    <th>赔偿金额</th>
					<td>
						<input type="text" name="xzfyInfo.nationMoneyDetail" value="<#if xzfyInfo.nationMoneyDetail?has_content>${xzfyInfo.nationMoneyDetail}</#if>" id="pcje" />
					</td>
		     		<th></th>
				    <td >
				    	</td>
		  		</tr>  
 
 </tbody>
 
    <#if currentStatus<12 && xzfyInfo.check_status=='0'>
  <tfoot>
      <tr>
            <td colspan=4>

           		<input class="ui-btn ui-btn-normal" type="button"   value="保存" onClick="saveJiean()">
   
            </td>
      </tr>
    </tfoot>
    </#if>
  </table>
 
</div>	 

  </div>


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
<table width="90%">
<tr>
<td id="tfaren">
<#if xzfyInfo.app_type == "2"  && xzfyInfo.id?length gt 10>
<#list xzfyInfo.xzfyApps as app>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="appfaren" >
<tr>
<th stlye="align:right">
申请人：</th>
<td colspan=3>
<input name="frsqr" type="text" isUser="true" size="50" value="${app.app_name?default('')}"/>
</td>
</tr>
<tr>

<th width="18%"  stlye="align:right">
&nbsp;&nbsp;代表人名称：
</th>
<td width="32%"><input name="fuzeren" type="text" isUser="true" value="${app.deputyName?default('')}"/>
</td>
<th width="18%"  stlye="align:right">
	&nbsp;&nbsp;送达地址：</th>
<td width="32%">
<textarea name="fzraddress" isUser="true" >${app.mail_address?default('')}</textarea>
<!--<input name="fzraddress" isUser="true" value="" size=30/>-->
	</td>
</tr>
	<tr><th>
	&nbsp;&nbsp;代表人类别：</th>
<td colspan=3>
<select name="fzrlb" isUser="true" retSelect="1">
<option value="法定代表人">法定代表人</option>
	<option value="负责人" <#if app.deputyType?default('')=="负责人">selected</#if>>负责人</option>
    <option value="执行合伙事务的合伙人" <#if app.deputyType?default('')=="执行合伙事务的合伙人">selected</#if>>执行合伙事务的合伙人</option>
    <option value="合伙人" <#if app.deputyType?default('')=="合伙人">selected</#if>>合伙人</option>
    <option value="主要负责人" <#if app.deputyType?default('')=="主要负责人">selected</#if>>主要负责人</option>
    <option value="被共同推选的非法人组织其他成员" <#if app.deputyType?default('')=="被共同推选的非法人组织其他成员">selected</#if>>被共同推选的非法人组织其他成员</option>
	</select>

	</td>
	
	</tr>
	<tr>
	<th>
	&nbsp;&nbsp;邮编：</th>
<td><input name="fzrpost" isUser="true"  type="text"  value="${app.postcode?default('')}"/>
	</td>
	<th>
	&nbsp;&nbsp;电话：</th>
<td><input name="fzrtele" isUser="true"  type="text"  value="${app.telephone?default('')}"/>
	</td>
</tr>
<tr>
<th>
	&nbsp;&nbsp;其他情形：
	</th>
<td colspan=2><select name="fzrother" isUser="true" retSelect="1">
	 <option value="0">无</option>
    <option value="由股东代表大会以股份制企业名义提出申请"  <#if app.otherType?exists && app.otherType=="由股东代表大会以股份制企业名义提出申请">selected</#if>>由股东代表大会以股份制企业名义提出申请</option>
    <option value="由董事会以股份制企业名义提出申请" <#if app.otherType?exists && app.otherType=="由董事会以股份制企业名义提出申请">selected</#if>>由董事会以股份制企业名义提出申请</option>
    <option value="其他" <#if app.otherType?exists && app.otherType=="其他">selected</#if>>其他</option>
	</select>
	
	</td>
<td align='left'><input value="删除" type="button" class="btn1" onclick="deleteFr(this)"></td>
</tr>
</table>
</#list>
<#else>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="appfaren" >
<tr>
<th align="right">
&nbsp;&nbsp;申请人：</th>
<td colspan=3>
<input name="frsqr" isUser="true" size="50" value="" type="text"/>
</td>
</tr>
<tr>

<th width="18%" stlye="align:right">
&nbsp;&nbsp;代表人名称：
</th>
<td width="32%"><input name="fuzeren" isUser="true" value="" type="text"/>
</td>
<th width="15%">
	&nbsp;&nbsp;送达地址：</th>
<td width="35%">
<textarea name="fzraddress" isUser="true" ></textarea>
<!--<input name="fzraddress" isUser="true" value="" size=30/>-->
	</td>
</tr>
	<tr><th>
	&nbsp;&nbsp;代表人类别：</th>
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
	&nbsp;&nbsp;邮编：</th>
<td><input name="fzrpost" isUser="true" value="" type="text"/>
	</td>
	<th>
	&nbsp;&nbsp;电话：</th>
<td><input name="fzrtele" isUser="true" value="" type="text"/>
	</td>
</tr>
<tr>
<th>
	&nbsp;&nbsp;其他情形：
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
</#if>
<table  id="insfaren">
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
<a href="javascript:addApp:closeApp1()" id="appEnd">完成</a>
<a href="javascript:addUser:closeDivById('appDiv')">关闭</a>
</div>
</div>

<table width="90%" >
<tr>
<td id="tapp">
<#if xzfyInfo.app_type == "1" && xzfyInfo.id?length gt 10>
<#list xzfyInfo.xzfyApps as app>
<table   width="100%"  id="appapp">
<tr>
<th>&nbsp;&nbsp;申请人：</th>
<td><input name="appsqr" type="text"  isUser="true" value="${app.app_name?default('')}"/></td>
<th>&nbsp;&nbsp;性别：</th>
<td><select name="appsex" isUser="true" retSelect="1" style="display:block">
	<option value="男" <#if app.sexy?default('')=="男">selected</#if>>男</option>
	<option value="女" <#if app.sexy?default('')=="女">selected</#if>>女</option>
	</select></td>
	</tr>
<tr>
	<th>&nbsp;&nbsp;身份证号：</th>
	<td><input name="appnum" type="text" isUser="true" value="${app.app_id?default('')}" />
	</td>
	<th>
	&nbsp;&nbsp;送达地址：
	</th>
	<td>
	<textarea name="appaddress" type="text" isUser="true">${app.mail_address?default('')}</textarea>
	</td>
</tr>
<tr>
	<th>
	&nbsp;&nbsp;邮编：
	</th>
	<td><input name="apppost" type="text" isUser="true" value="${app.postcode?default('')}"/>
	</td>
	<th>
	&nbsp;&nbsp;电话：
	</th>
	<td><input name="appphone" type="text" isUser="true" value="${app.telephone?default('')}" />
	<a href="#" onclick="deleteApp(this);return false;" title="删除"  >删除</a>
	</td>
</tr>
</table>
</#list>
<#else>
<table   width="100%"  id="appapp">
<tr>
<th>&nbsp;&nbsp;申请人：</th>
<td><input name="appsqr" type="text" isUser="true" value=""/></td>
<th>&nbsp;&nbsp;性别：</th>
<td><select name="appsex" isUser="true" retSelect="1" style="display:block">
	<option value="男">男</option>
	<option value="女">女</option>
	</select></td>
	</tr>
<tr>
	<th>&nbsp;&nbsp;身份证号：</th>
	<td><input name="appnum" type="text" isUser="true" value="" />
	</td>
	<th>
	&nbsp;&nbsp;送达地址：
	</th>
	<td>
	<textarea name="appaddress"  type="text" isUser="true"></textarea>
	</td>
</tr>
<tr>
	<th>
	&nbsp;&nbsp;邮编：
	</th>
	<td><input name="apppost" type="text" isUser="true" value=""/>
	</td>
	<th>
	&nbsp;&nbsp;电话：
	</th>
	<td><input name="appphone" type="text" isUser="true" value='' />
	<a href="#" onclick="deleteApp(this);return false;" title="删除"  >删除</a>
	</td>
</tr>
</table>
</#if>
<table  id="insapp">
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



</form>
</body>

<script language="javascript">

	function jafss(){
		if(document.getElementById("jafs").value==8){
			document.getElementById("jafs1").style.display="block";
			document.getElementById("jafs2").style.display="none";
			document.getElementById("jafs1").name="xzfyInfo.finishBreakType"
			document.getElementById("jafs2").name="xzfyfb";
			
		}else if(document.getElementById("jafs").value==1){
			document.getElementById("jafs2").style.display="block";
			document.getElementById("jafs1").style.display="none";
			document.getElementById("jafs2").name="xzfyInfo.finishBreakType"
			document.getElementById("jafs1").name="xzfyfb";
			
		}
		else{
			document.getElementById("jafs1").style.display="none";
			document.getElementById("jafs2").style.display="none";
		}
	}

function addnotchecked(){

	document.getElementById("addbegin").value="";
	document.getElementById("addend").value="";
	document.getElementById("buzheng").style.display='none';
	document.getElementById("scresult").value="0";
	document.getElementById("buzheng").style.display="none";
	document.getElementById("yaobuzheng5").style.display="none";
	document.getElementById("bzfs").value="";
	document.getElementById("shenpiBtn").style.display="none";
	document.getElementById("buzhengshenpi").style.display="none";
}

function ajgllb(){
	
	if(document.getElementById("ajsjfm1").value==1){		
		
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
	//document.getElementById("divxzgllbinput").innerHTML='<input name="app_face.TReferOther" type="text" altname="行政管理类别" id="xzgllbinput" class="inputTextNormal">';
}



function sqfysx(){
	if(document.getElementById("xzfysx").value==1){
	document.getElementById("xzfysx2xzcf").style.display="block";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	document.getElementById("xzfysx2xzcf").name="xzfyInfo.casetype2";
	}
	if(document.getElementById("xzfysx").value==2){	
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="block";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzqzcs").name="xzfyInfo.casetype2";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	}
	if(document.getElementById("xzfysx").value==3){
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="block";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	document.getElementById("xzfysx2xzsx").name="xzfyInfo.casetype2";
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

   
   
}
function test(){
//alert(document.getElementById("deptid").value);
}



function setYJ(){
  <#--
	if(document.getElementById("scresult").value==1){
		document.getElementById("cbryj").value="　　建议立案，请    并灵雁同志阅示。"
	}else if(document.getElementById("scresult").value==2){
		document.getElementById("cbryj").value="　　不符合市政府行政复议受理条件，建议告知处理，请    并灵雁同志阅示。"
	}else if(document.getElementById("scresult").value==3){
		document.getElementById("cbryj").value="　　不符合市政府行政复议受理条件，建议不予受理，请    并灵雁同志阅示。"
	}else if(document.getElementById("scresult").value==5){
		document.getElementById("cbryj").value="　　建议不予立案，结案方式按照其他处理，请    并灵雁同志阅示。"
	}-->
}


subcat = new Array();
var count=0;

<#list bList as dl>	
       subcat[${dl_index}]=new Array("${dl.type}","${dl.name}","${dl.value}"); 
       count++;    
</#list>


function aaa() {
	document.getElementById("aac").value="1";
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
	if(document.getElementById('beappname').value!=''){
	//var code=document.getElementById('beappname').deptcode;
	document.getElementById('deptid').value=code;	}
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
	if(document.getElementById("xzfysx").value==0){
		return false;
	}


	return true;
}
function checkajgllb(){
	if(document.getElementById("ajsjfm1").value==0)
	
	{return false;}
	
	else{

	return true;
	}
}
function check_remark(){
	if(document.getElementById("handle").value==2){
		document.getElementById("handle_detail").style.display="block";
		document.getElementById("advicespan").style.display="block";
		document.getElementById("check_select").style.display="block";
		document.getElementById("otherAdvice").style.display="block";
	}else if(document.getElementById("handle").value==3){
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		document.getElementById("otherAdvice").style.display="none";
	}else{
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		document.getElementById("otherAdvice").style.display="block";
	}
}

function getUser(){
	var name =encodeURIComponent(document.getElementById("appstring").value);
	if(name==""){
		alert("请填写被接待人名称！")
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

function sendchecknull(){
	/*
	if(document.getElementById("user").value=="") {alert("请填写申请人!");return ;}
	else if(document.getElementById("receivedate").value=="") {alert("请填写收案日期!");return ;}
	else if(document.getElementById("applicationtype").value==0) {alert("请填写申请人类别!");return ;}
	
	else if(!document.getElementById("duoren_y").checked&&!document.getElementById("duoren_n").checked) {alert("请填写多人复议!");return ;}
	else if(document.getElementById("beapptype").value==0) {alert("请填写被申请人种类!");return ;}
	else if((document.getElementById("beappname").value==0)&&(document.getElementById("beappname2").value=="")) {alert("请填写被申请人名称!");return ;}
	
	else if(document.getElementById("xzfysx").value==0) {alert("请填写案件类型!");return ;}
	else if(document.getElementById("senddept3").value=="") {alert("请填写转送机构名称!");return ;}
	*/
	return true;
}

function jashow(){
	
	if(document.getElementById("isShenpi").value==1 || document.getElementById("checkStatus").value==1){
		document.getElementById("scresult").value==0;
		alert("审批中！无法选择！");
		return ;
	}
	
    if(document.getElementById("scresult").value==2||document.getElementById("scresult").value==3||document.getElementById("scresult").value==5){
      document.getElementById("laBtn").style.display="none";
      document.getElementById("isShoulishenpi").style.display="none";
      document.getElementById("lianshenpi1").style.display="none";
	   // senddept.style.display='block';
	   // senddept1.style.display='block';
	    document.getElementById("jatbody").style.display="block";
	    document.getElementById("jzfz").style.display="none";
	    //document.getElementById("filegz").style.display="none";
      	//结案审批区域
	    document.getElementById("isjashenpi").style.display="block";
	    document.getElementById("bujieanshenpi").style.display="none";
	    document.getElementById("jaBtn").style.display="block";
	    document.getElementById("yaojieanshenpi1").style.display="block";
	    document.getElementById("yaojieanshenpi2").style.display="block";
	    document.getElementById("yaojieanshenpi3").style.display="none";
	    document.getElementById("yaojieanshenpi4").style.display="none";
	    document.getElementById("jieannBtn").style.display="block";
	    document.getElementById("isJieanshenpi").value = "1";
	    
	    
	} <#--else if(document.getElementById("scresult").value==10){
		 document.getElementById("jatbody").style.display="none";
	    document.getElementById("jzfz").style.display="block";
	    //document.getElementById("buzheng").style.display="block";
	    //document.getElementById("filegz").style.display="block";

		
	
		if(document.getElementById("isBuzheng").value==0){
				alert("补证审批才可以选择此项！");
				document.getElementById("scresult").value=0;
				return ;
		}
	}-->
	else if(document.getElementById("scresult").value==1){
		document.getElementById("jatbody").style.display="none";
	    document.getElementById("jzfz").style.display="block";
	    //立案审批区域   
	    document.getElementById("laBtn").style.display="block";
      	document.getElementById("isShoulishenpi").style.display="block";
      	document.getElementById("isLianshenpi").value="1";
      	document.getElementById("lianxuanze1").style.display="block";
      	document.getElementById("lianxuanze2").style.display="block";
      	document.getElementById("lianxuanze3").style.display="none";
      	document.getElementById("lianxuanze4").style.display="none";
      	document.getElementById("lianBtn").style.display="block";
      	//结案审批区域
	    document.getElementById("isjashenpi").style.display="none";
	    document.getElementById("bujieanshenpi").style.display="none";
	    document.getElementById("jaBtn").style.display="none";
	} else{
	    //senddept.style.display='none';
	    //senddept1.style.display='none';
	   // document.getElementById("filegz").style.display="none";
	    document.getElementById("jatbody").style.display="none";
	    document.getElementById("jzfz").style.display="block";
	    //document.getElementById("senddept3").value="";   
	    //立案审批区域   
	    document.getElementById("laBtn").style.display="none";
      document.getElementById("isShoulishenpi").style.display="none";
      document.getElementById("lianshenpi1").style.display="none";
      	//结案审批区域
	    document.getElementById("isjashenpi").style.display="none";
	    document.getElementById("bujieanshenpi").style.display="none";
	    document.getElementById("jaBtn").style.display="none";
	}
	
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

function update(){
		var aaid = document.getElementById("Aid").value;
		
	    if(confirm("确定要修改吗？"))
	    {
		listForm_= document.getElementById("form1");
		
		listForm_.action="../jds/App_FaceUpdateAction.action?funcCode=${funcCode}&&id="+aaid;
		listForm_.submit();
	   }

}

function finishShencha(){
	
	
	if(!checknull()){return ;}

	var status;
	if(document.getElementById("scresult").value==0){
			alert("请选择立案审查意见！"); 
			return ;
	} else if(document.getElementById("scresult").value==2||document.getElementById("scresult").value==3||document.getElementById("scresult").value==5){
		if (document.getElementById("finish_date").value==""){
			alert("请填写结案日期！"); 
			return ;
		}
		status=12;
	} else if(document.getElementById("scresult").value==1){
		if (document.getElementById("lian_date").value==""){
			alert("请填写立案日期！"); 
			return ;
		}
		status=4;
	}
	
	
	if(confirm("确定要提交吗？")){
			listForm_= document.getElementById("form1");
			listForm_.action="../xzfy/finishLianshencha.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&status="+status;
			listForm_.submit();
	}

}
/*************************保存结案信息-begin**********************************************/
	function saveJiean(){
		if(checkKeyWord==1){
			if(document.getElementById("dept_keyword").value==0){
				alert("请选择统计关键词！");
				return;
			}
		}
		if(!checknull()){return ;}
		if(document.getElementById("user").value==""){
			alert("请填写申请人");
			return ;
		}

		if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	
		
		if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}	
		/*
		if(document.getElementById("annum").value==""){
			alert("请填写被复议的具体行政行为案号");
			return ;
		}
				
		if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return ;
		}	
		*/
	if(document.getElementById("sdResult").value=="1"){
			if(document.getElementById("tjzfzh").value==""){
				alert("请填写案号");
				return ;
			}
			if(document.getElementById("lian_date").value==""){
				alert("请填写立案日期");
				return ;
			}	
	} 	
	
			if(document.getElementById("isstop").value=="1"){
				if(document.getElementById("isstop_from").value==""){
					alert("请填写中止日期")
					return ;
				}
			}	
	/*
	if(document.getElementById("isBuzheng").value==1){
		if(document.getElementById("bzTongzhiriqi").value==""){
			alert("请填写通知补正日期")
			return;
		}
		
	}	
	*/


	if(confirm("确定要保存吗？"))
	    {
	    
	    if(document.getElementById("xzfyStatus").value<4){
	    	if(document.getElementById("sdResult").value=="1")
	    		document.getElementById("xzfyStatus")=4
	    	
	    }

		listForm_= document.getElementById("form1");
		
		listForm_.action="../xzfy/saveJiean.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isGaojijiansuo=${1}";
		
		listForm_.submit();
		}
	}
/*************************保存结案信息-end**********************************************/

/*************************完成结案信息-begin**********************************************/
	function submitJiean(){
		if(checkKeyWord==1){
			if(document.getElementById("dept_keyword").value==0){
				alert("请选择统计关键词！");
				return;
			}
		}	
		if(!checknull()){return ;}
		if(document.getElementById("user").value==""){
			alert("请填写申请人");
			return ;
		}

		if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	
		
		if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}	
		/*
		if(document.getElementById("annum").value==""){
			alert("请填写被复议的具体行政行为案号");
			return ;
		}
				
		if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return ;
		}	
		*/
	if(document.getElementById("sdResult").value=="1"){
			if(document.getElementById("tjzfzh").value==""){
				alert("请填写案号");
				return ;
			}
			if(document.getElementById("lian_date").value==""){
				alert("请填写立案日期");
				return ;
			}	
	}else{
		if(document.getElementById("handleReason").value=="0" && document.getElementById("sdResult").value!=5){
			if(document.getElementById("caseorg").value=="0000"){
				alert("请填写未受理原因");
				return ;	
			}
		}
	} 	
	
			if(document.getElementById("isstop").value=="1"){
				if(document.getElementById("isstop_from").value==""){
					alert("请填写中止日期")
					return ;
				}
				if(document.getElementById("breakTo").value==""){
					alert("请填写恢复审理日期")
					return ;
				}				
				
			}	
			
			if(document.getElementById("jieandate").value==""){
				alert("请填写结案日期")
				return ;
			}
			
			if(document.getElementById("jafs").value=="0"){
				alert("请填写结案方式")
				return ;
			}else if(document.getElementById("jafs").value=="8"){
				if(document.getElementById("jafs1").value=="0"){
					alert("请填写结案方式")
					return ;
				}
			}			
	/*
	if(document.getElementById("jiean_file").value=="" && document.getElementById("jieanwenshu").value==""  && document.getElementById("xzfyStatus").value<11){
			alert("请上传结案文书")
			return ;	
	
	}
	
	
	
	
	if(document.getElementById("isBuzheng").value==1){
		if(document.getElementById("bzTongzhiriqi").value==""){
			alert("请填写通知补正日期")
			return;
		}
	
	}	
	*/
	

	if(confirm("结案后信息将不能再做任何修改，您确认要结案吗？"))
	    {
	    document.getElementById("xzfyStatus").value=12;
		listForm_= document.getElementById("form1");
		
		listForm_.action="../xzfy/saveJiean_finish.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}";
		
		listForm_.submit();
		}
	}
/*************************完成结案信息-end**********************************************/
	function submitShencha1(){
		if(checkKeyWord==1){
			if(document.getElementById("dept_keyword").value==0){
				alert("请选择统计关键词！");
				return;
			}
		}		
		if(!checknull()){return ;}
		if(document.getElementById("user").value==""){
			alert("请填写申请人");
			return ;
		}

		if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	
		
		if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}	
		/*
		if(document.getElementById("annum").value==""){
			alert("请填写被复议的具体行政行为案号");
			return ;
		}
				
		if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return ;
		}	
		*/
	if(document.getElementById("sdResult").value=="1"){
			if(document.getElementById("tjzfzh").value==""){
				alert("请填写案号");
				return ;
			}
			if(document.getElementById("lian_date").value==""){
				alert("请填写立案日期");
				return ;
			}	
	} 		
/*	
	if(document.getElementById("isBuzheng").value==1){
		if(document.getElementById("bzTongzhiriqi").value==""){
			alert("请填写通知补正日期")
			return;
		}

	}	
*/
	if(confirm("确定要完成吗？"))
	    {
	    
		listForm_= document.getElementById("form1");
		
		listForm_.action="../xzfy/finishLianInfo1.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}";
		
		listForm_.submit();
	}
	}


var checkKeyWord=0;
<#if keywordList.size() gt 0>	
checkKeyWord=1
</#if>
	function submitShencha(){
		if(checkKeyWord==1){
			if(document.getElementById("dept_keyword").value==0){
				alert("请选择统计关键词！");
				return;
			}
		}
	
		if(!checknull()){return ;}
		if(document.getElementById("user").value==""){
			alert("请填写申请人");
			return ;
		}

		if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	
		
		if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}	
		/*
		if(document.getElementById("annum").value==""){
			alert("请填写被复议的具体行政行为案号");
			return ;
		}
				
		if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return ;
		}	
		*/

	if(document.getElementById("sdResult").value=="1"){
			if(document.getElementById("tjzfzh").value==""){
				alert("请填写案号");
				return ;
			}
			if(document.getElementById("lian_date").value==""){
				alert("请填写立案日期");
				return ;
			}	
	} 		
/*	
	if(document.getElementById("isBuzheng").value==1){
		if(document.getElementById("bzTongzhiriqi").value==""){
			alert("请填写通知补正日期")
			return;
		}

	}	
*/
	if(confirm("确定要完成吗？"))
	    {
	    
		listForm_= document.getElementById("form1");
		
		listForm_.action="../xzfy/finishLianInfo.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}";
		
		listForm_.submit();
	}
	}


function saveShencha(){
	if(!checknull()){return ;}
		if(document.getElementById("user").value==""){
			alert("请填写申请人");
			return ;
		}

		if(document.getElementById("xzfyqq1").value==""){
			alert("请填写行政复议请求");
			return ;
		}	
		
		if(document.getElementById("TBeName").value==""){
			alert("请填写被复议的具体行政行为名称");
			return ;
		}		
		/*
		if(document.getElementById("annum").value==""){
			alert("请填写被复议的具体行政行为案号");
			return ;
		}
				
		if(document.getElementById("content").value==""){
			alert("请填写简要内容");
			return ;
		}	
		*/
	if(document.getElementById("sdResult").value=="1"){
			if(document.getElementById("tjzfzh").value==""){
				alert("请填写案号");
				return ;
			}
			/*
			if(document.getElementById("lian_date").value==""){
				alert("请填写立案日期");
				return ;
			}
			*/	
			//document.getElementById("xzfyStatus").value=4;
	} 	

	/*
	if(document.getElementById("isBuzheng").value==1){
		if(document.getElementById("bzTongzhiriqi").value==""){
			alert("请填写通知补正日期")
			return;
		}

	}	
*/
	if(confirm("确定要保存吗？"))
	    {
	    
		listForm_= document.getElementById("form1");
		
		listForm_.action="../xzfy/saveLianInfo.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isGaojijiansuo=${1}";
		
		listForm_.submit();
	}

}

function subDJA(){ 
	listForm_= document.getElementById("form1");
	if(document.getElementById("finishtype1").value==0){alert("请选择结案方式!");return;}
	if(document.getElementById("finishtype1").value==8){if(document.getElementById("finishtype2").value==0){alert("请选择结案方式!");return;}}
	if(!document.getElementById("compensate_y").checked&&!document.getElementById("compensate_n").checked){alert("请选择国家赔偿!");return;}
	var doubleReg=/^\d+(\.?\d{2})?$/;	
	if(document.getElementById("compensate_y").checked&&(!doubleReg.test(document.getElementById("countrycompensatenum").value))){alert("请输入赔偿数额!");return;}
	//if(!document.getElementById("finishreport_y").checked&&!document.getElementById("finishreport_n").checked){alert("请选择是否上传结案文书!");return;}
	//if(listForm_.file2.value==""&&document.getElementById("finishreport_y").checked){
	if(listForm_.file2.value==""){
		alert("请上传结案文书!");return;
		}
	//if(listForm_.file2.value!=""&&document.getElementById("finishreport_y").checked){
	if(listForm_.file2.value!=""){
		if(!(listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="doc"||listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="xls"||listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="rar"||listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="pdf"||listForm_.file2.value.substring(listForm_.file2.value.length-3,listForm_.file2.value.length)=="ppt"))
		{alert("请确认结案文书文件格式!");return;}
		}
	if(!document.getElementById("opinion_y").checked&&!document.getElementById("opinion_n").checked){alert("请选择是否上传行政复议意见书!");return;}
	if(listForm_.file.value==""&&document.getElementById("opinion_y").checked){alert("请上传行政复议意见书!");return;}
	if(listForm_.file.value!=""&&document.getElementById("opinion_y").checked){
		if(!(listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="doc"||listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="xls"||listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="rar"||listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="pdf"||listForm_.file.value.substring(listForm_.file.value.length-3,listForm_.file.value.length)=="ppt"))
		{alert("请确认行政复议意见书文件格式!");return;}
		}
	if(!document.getElementById("advise_y").checked&&!document.getElementById("advise_n").checked){alert("请选择是否上传行政复议建议书!");return;}
	if(listForm_.file1.value==""&&document.getElementById("advise_y").checked){alert("请上传行政复议建议书!");return;}
	if(listForm_.file1.value!=""&&document.getElementById("opinion_y").checked){
	if(!(listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="doc"||listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="xls"||listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="rar"||listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="pdf"||listForm_.file1.value.substring(listForm_.file1.value.length-3,listForm_.file1.value.length)=="ppt"))
		{alert("请确认行政复议建议书文件格式!");return;}
	}
	
	
	return true;
	
	
}


function checknull()
{
	/*
	var intReg=/^[0-9]*[1-9][0-9]*$/;
	var a=document.getElementsByTagName("input");
	
	for(var i=0;i<a.length;i++)
	{
		if(a.item(i).ischeck){
		    if(a.item(i).type=="radio")
			{
			if(!(((document.getElementsByName(a.item(i).name)[0]).checked)||((document.getElementsByName(a.item(i).name)[1]).checked)))
				{
				alert("请填写:"+document.getElementsByName(a.item(i).name)[0].altname+"!");return false;}			
			}
			else if(a.item(i).value==""){
			alert("请填写:"+a.item(i).altname+"!");return false;
			}
		}	

	}
	
	var a=document.getElementsByTagName("select");
	for(var i=0;i<a.length;i++)
	{
		if(a.item(i).ischeck){
			if(a.item(i).value=="0"){
			alert("请填写:"+a.item(i).altname+"!");return false;
			}			
		}
		
	}
	*/
	if(document.getElementById("beapptype").value=="0"){
		alert("请填写被申请人类别");return false;
	}
	if(!checkfysx()){alert("请填写案件类型!");return false;}
	if(!checkajgllb()){alert("请填写行政管理类别!");return false;}
	return true;
}

function setAdvice(ev){
	var udiv=document.getElementById("adviceDiv");
	var userspan=document.getElementById("advicespan");
	var areaObject=document.getElementById("handle_detail");
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

function closeAdvice(){
	var userspan=document.getElementById("advicespan");
	userspan.style.display="block";
	document.getElementById("adviceDiv").style.display="none";
	openSelect();
}

function rechekAadvice(){
	document.getElementById("handle_detail").value="";

}

function addAdvice(advice){
	document.getElementById("handle_detail").value=advice;
}

function showTiaojie(){
	var tiaojie = document.getElementById("xzpc_y").value;
	
	if(tiaojie=="是"){
		document.getElementById("otherDetail").style.display="block";	
	}
	
}
function showTiaojie2(){

	var tiaojie2 = document.getElementById("xzpc_n").value;
	if(tiaojie2=="否"){
		document.getElementById("otherDetail").style.display="none";
	}
}

 var xmlHttp;
        function createXMLHttpRequest() {
            if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            } 
            else if (window.XMLHttpRequest) {
                xmlHttp = new XMLHttpRequest();                
            }
        }


	function getTitleList(){
		createXMLHttpRequest();
		var tjzfzh=encodeURIComponent(document.getElementById("tjzfzh").value);
		var url = "../jds/chengJzfz.action?appname="+tjzfzh;
		xmlHttp.onreadystatechange = stringCallback;
		xmlHttp.open("GET", url, true);
		xmlHttp.setRequestHeader("contentType","text/html;charset=UTF-8");
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xmlHttp.send(null);
		
	}

	function stringCallback(){		
		if (xmlHttp.readyState == 4) {
				  if (xmlHttp.status == 200) { 		  
					var titleList=document.getElementById("checkJzfz");
					titleList.value=xmlHttp.responseText;		
					if(titleList.value==1){
						alert("案号重复，请重新输入！");
						document.getElementById("tjzfzh").value="京政复字[200]号";
						
					}

				}
			}
	}
	
	function shifoubuzheng(){
		if(document.getElementById("isBuzheng").value=="1"){
			document.getElementById("buzhengshenpi").style.display="none";
			document.getElementById("bzfs").value = "书面通知";
			document.getElementById("scresult").value = "10";
			document.getElementById("yaobuzheng1").style.display="block";
			document.getElementById("yaobuzheng2").style.display="block";
			document.getElementById("yaobuzheng3").style.display="none";
			document.getElementById("yaobuzheng4").style.display="none";
			document.getElementById("yaobuzheng5").style.display="block";
			document.getElementById("spBtn").style.display="block";
		} else {
			document.getElementById("buzhengshenpi").style.display="block";
			document.getElementById("yaobuzheng1").style.display="none";
			document.getElementById("yaobuzheng2").style.display="none";
			document.getElementById("yaobuzheng3").style.display="block";
			document.getElementById("yaobuzheng4").style.display="block";
			document.getElementById("yaobuzheng5").style.display="block";
			document.getElementById("spBtn").style.display="none";
		}
	}
	
	function jieanshenpi1(){
		if(document.getElementById("isJieanshenpi").value=="1"){
			document.getElementById("bujieanshenpi").style.display="none";
			document.getElementById("yaojieanshenpi1").style.display="block";
			document.getElementById("yaojieanshenpi2").style.display="block";
			document.getElementById("yaojieanshenpi3").style.display="none";
			document.getElementById("yaojieanshenpi4").style.display="none";
			document.getElementById("jieannBtn").style.display="block";
		} else {
			document.getElementById("bujieanshenpi").style.display="block";
			document.getElementById("yaojieanshenpi1").style.display="none";
			document.getElementById("yaojieanshenpi2").style.display="none";
			document.getElementById("yaojieanshenpi3").style.display="block";
			document.getElementById("yaojieanshenpi4").style.display="block";
			document.getElementById("jieannBtn").style.display="none";
		}
	}
	

	
	
	function getShouLi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131019091018&d_username=panglei&caseId=${xzfyId}";
		window.open(url);
	}
	
	function getRefuse(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131019091855&d_username=panglei&caseId=${xzfyId}";
		window.open(url);	
	}
	
	function getYijian(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131017113148&d_username=panglei&caseId=${xzfyId}";
		window.open(url);	
	}
	

	function tijiaoLian(){
		if(document.getElementById("lianSpr").value==""){
			alert("请选择审批人！");return ;
		}
		var shenpiren = document.getElementById("lianSpr").value;
		url="../other/tijiaoShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&shenpiren1="+encodeURI(shenpiren)+"&status=3";
		alert(url);
       var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: tijiaoLianReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function tijiaoLianReturn(response) {
		document.getElementById("isShenpi").value = 1;
		document.getElementById("lianBtn").style.display = "none";
		alert("审批已经提交！");
	}
	
	function tijiaoJiean(){
		if(document.getElementById("jieanSpr").value==""){
			alert("请选择审批人！");return ;
		}
		var shenpiren = document.getElementById("jieanSpr").value;
		url="../other/tijiaoShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&shenpiren1="+encodeURI(shenpiren)+"&status=11";
		alert(url);
       var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: tijiaoJieanReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function tijiaoJieanReturn(response) {
		document.getElementById("isShenpi").value = 1;
		document.getElementById("jieannBtn").style.display = "none";
		alert("审批已经提交！");
	}
	
    function fBuzheng(){
	    if(document.getElementById("isShenpi").value==1 || document.getElementById("checkStatus").value==1){
			alert("审批中！无法完成！");
			return ;
		}
	  
	  if(document.getElementById("isBuzheng").value=="0"){

	  	if(document.getElementById("shenpiren").value==""){
			alert("请填写补证批准人！");
			return ;
	  	}
	  	if(document.getElementById("shenpishijian").value==""){
			alert("请填写批准时间！");
			return ;
	  	}
	  	if(document.getElementById("shenpiyijian").value==""){
			alert("请填写批准意见！");
			return ;
	  	}
	  }
	  
	  
      var isShenpi;
		if (document.getElementById("isBuzheng").value=="1"){
			isShenpi = 1;
		} else {
			isShenpi = 0;
		}	
		var spr = document.getElementById("shenpiren").value;
		var spDate = document.getElementById("shenpishijian").value;
		var spYijian = document.getElementById("shenpiyijian").value;
		url="../other/wanchengShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isShenpi="+isShenpi+"&spr="+encodeURI(spr)+"&spDate="+spDate+"&spYijian="+encodeURI(spYijian)+"&status=2";
		//alert(url);
			 var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: wanchengBuzhengReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function wanchengBuzhengReturn(response) {
		document.getElementById("yishenpiren").innerHTML=response.responseText;
		document.getElementById("seshenpiren").innerHTML=response.responseText;
		alert("审批完成！");
	}
	
	function fLian(){
      if(document.getElementById("isShenpi").value==1 || document.getElementById("checkStatus").value==1){
			alert("审批中！无法完成！");
			return ;
		}
	  
	  if(document.getElementById("isLianshenpi").value=="0"){

	  	if(document.getElementById("lashenpiren").value==""){
			alert("请填写立案批准人！");
			return ;
	  	}
	  	if(document.getElementById("lashenpishijian").value==""){
			alert("请填写批准时间！");
			return ;
	  	}
	  	if(document.getElementById("lashenpiyijian").value==""){
			alert("请填写批准意见！");
			return ;
	  	}
	  }
	  
	  
      var isShenpi;
		if (document.getElementById("isLianshenpi").value=="1"){
			isShenpi = 1;
		} else {
			isShenpi = 0;
		}	
		var spr = document.getElementById("lashenpiren").value;
		var spDate = document.getElementById("lashenpishijian").value;
		var spYijian = document.getElementById("lashenpiyijian").value;
		url="../other/wanchengShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isShenpi="+isShenpi+"&spr="+encodeURI(spr)+"&spDate="+spDate+"&spYijian="+encodeURI(spYijian)+"&status=3";
		alert(url);
			 var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: wanchengLianReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function wanchengLianReturn(response) {
		document.getElementById("lianSprShow1").innerHTML=response.responseText;
		document.getElementById("lianSprShow2").innerHTML=response.responseText;
		alert("审批完成！");
	}
	
	function fjiean(){
      if(document.getElementById("isShenpi").value==1 || document.getElementById("checkStatus").value==1){
			alert("审批中！无法完成！");
			return ;
		}
	  
	  if(document.getElementById("isJieanshenpi").value=="0"){

	  	if(document.getElementById("jaShenpiren").value==""){
			alert("请填写立案批准人！");
			return ;
	  	}
	  	if(document.getElementById("jaShenpishijian").value==""){
			alert("请填写批准时间！");
			return ;
	  	}
	  	if(document.getElementById("jaShenpiyijian").value==""){
			alert("请填写批准意见！");
			return ;
	  	}
	  }
	  
	  
      var isShenpi;
		if (document.getElementById("isJieanshenpi").value=="1"){
			isShenpi = 1;
		} else {
			isShenpi = 0;
		}	
		var spr = document.getElementById("jaShenpiren").value;
		var spDate = document.getElementById("jaShenpishijian").value;
		var spYijian = document.getElementById("jaShenpiyijian").value;
		url="../other/wanchengShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&isShenpi="+isShenpi+"&spr="+encodeURI(spr)+"&spDate="+spDate+"&spYijian="+encodeURI(spYijian)+"&status=3";
		alert(url);
			 var myAjax = new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: wanchengJieanReturn // 指定请求成功完成时需要执行的方法
                }
            );
	}
	
	function wanchengJieanReturn(response) {
		document.getElementById("jieanSprShow1").innerHTML=response.responseText;
		document.getElementById("jieanSprShow2").innerHTML=response.responseText;
		alert("审批完成！");
	}
	
	function shifouLianShenpi() {
		if (document.getElementById("isLianshenpi").value=="1"){
			document.getElementById("lianshenpi1").style.display="none";
			document.getElementById("lianBtn").style.display="block";
			document.getElementById("lianSpr").style.display="block";
			document.getElementById("lianxuanze1").style.display="block";
			document.getElementById("lianxuanze2").style.display="block";
			document.getElementById("lianxuanze3").style.display="none";
			document.getElementById("lianxuanze4").style.display="none";
		} else {
			document.getElementById("lianshenpi1").style.display="block";
			document.getElementById("lianBtn").style.display="none";
			document.getElementById("lianSpr").style.display="none";
			document.getElementById("lianxuanze1").style.display="none";
			document.getElementById("lianxuanze2").style.display="none";
			document.getElementById("lianxuanze3").style.display="block";
			document.getElementById("lianxuanze4").style.display="block";
		}
	}
	function getBzw(){
		document.getElementById("requesttype2").style.display="block";
		document.getElementById("requesttype3").style.display="block";
		document.getElementById("closeBzw").style.display="block";
		document.getElementById("getBzw").style.display="none";
}
function closeBzw(){
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

</script>
</html>
