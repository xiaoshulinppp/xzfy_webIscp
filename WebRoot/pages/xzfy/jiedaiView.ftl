<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>接待记录查看</title>

<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />

<SCRIPT src="../css/01/setday.js"></SCRIPT>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/function.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/prototype.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>

<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>

<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>

<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 
<#--
<script type="text/javascript" src="../js/effects.js"></script>
<script type="text/javascript" src="../js/validation_cn_utf-8.js"></script>
-->
<style>
</style>

</head>

<script type="text/javascript" src="../js/floder/prototype.js"></script>
<script type="text/javascript" src="../js/floder/effects.js"></script>
<script type="text/javascript" src="../js/floder/validation_cn_utf-8.js"></script>

<body>
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<!--主体内容、列表显示区域-->

<input id="conutAppname" type=hidden name="conutAppname">

<!-- 被申请人部门id -->
<input name="xzfyReceive.TApplicationDeptID" type="hidden" class="inputTextNormal" id="deptid" />
<!-- 状态 -->
<input type="hidden" name="sta" id="sta" value="11" />
<input id="xzfyId" name="xzfyReceive.id" value="${xzfyReceive.id}" type="hidden">
<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" id="require_fy" name="xzfyReceive.require_fy" value="">
<input type="hidden" name="xzfyInfo.caseorg" value="${xzfyInfo.caseorg}" />

<div class="" style="padding-top:0px;">


<!--wal-->

      <div class="formDiv">
      <div class="bg">
<div border="0" >
	<div class="btn" >
	<div class="fl" >
		<#list docList2 as dList2>
		<a href="#" title="接待笔录"  onclick="javascript:callbackfun2();return false;">接待笔录</a>
		</#list>
		<#list docList as dList1>
		<a href="#" title="生成收据"  onclick="javascript:callbackfun1();return false;">生成收据</a>
		</#list>
		<#list docList3 as dList3>
		<a href="#" title="送达地址确认单"  onclick="javascript:callbackfun3();return false;" >地址确认单</a>
		</#list>
	</div>
	</div>
</div>
<script>
function callbackfun2(){
    var locbmtype='${locbm1?default('')}'
    if(locbmtype==${xzfyInfo.caseorg}){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=jiedaibilu";
	}
	else
	{
		var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=jiedaibilu&actiontype=yuedu";
	}
	window.open(url,'mainwindow','location=no,resizable=yes');
}

function callbackfun1(){
    var locbmtype='${locbm1?default('')}'
    if(locbmtype==${xzfyInfo.caseorg}){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=shouju";
	}
	else
	{
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=shouju&actiontype=yuedu";
	}
	window.open(url,'mainwindow','location=no,resizable=yes');
}

function callbackfun3(){
    var locbmtype='${locbm1?default('')}'
    if(locbmtype==${xzfyInfo.caseorg}){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=songdadizhiquerenshu";
	}
	else{
		var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=songdadizhiquerenshu&actiontype=yuedu";	
	}
	window.open(url,'mainwindow','location=no,resizable=yes');
}


</script>
        <table width="100%">
             
<#if xzfyReceive.receive_type == "1">
<tr >
     <th  width="20%">接待日期：</th>
    <td  width="30%">
    ${xzfyReceive.receive_date?default('')}
      </td>
    
    <th  width="22%">接待地点：</th>
	    <td  width="28%">${xzfyReceive.receive_address?default('')}</td>
  </tr>

    <tr >
  	<th >接待人：</th>
    <td >${xzfyReceive.admit1?default('')}   </td>
   <th >第二接待人：</th>
    <td >${xzfyReceive.admit2?default('')}
   </td>   
    </tr>	
<tr >
    <th  >被接待人：</th>
    <td >${xzfyReceive.jddetail?default('')}
    </td>
    <th >接待人数：</th>
    <td >${xzfyReceive.jdRenshu?default('')}</td>  
  </tr>
     <tr  style="display:none">
   <th >多人复议：</th>
    <td >
<input name="xzfyReceive.ismany" id="duoren_y" value="${xzfyReceive.ismany?default('')}">
    </tr>
  <tr >

<#if xzfyReceive.status?exists&&xzfyReceive.status=="1"&&xzfyReceive.app_type1?exists&&xzfyReceive.app_type1=="2"> 
<tr>
	<th>接待目的：</th>
	<td>
	<#if xzfyReceive.keyword=="1">了解情况
	</#if>
	<#if xzfyReceive.keyword=="2">明确有关事项
	</#if>
	<#if xzfyReceive.keyword=="3">补正材料
	</#if>
	</td>
	<th></th>
	<td> 
	</td>
	</tr>
	
	<tr>
	<th>首次收到申请材料时间：</th>
	<td> ${xzfyReceive.menu?default('')}</td>
	<th>首次收到申请材料方式：</th>
	<td>
	<#if xzfyReceive.keyword=="1">当面
	</#if>
	<#if xzfyReceive.keyword=="2">来信
	</#if>
	<#if xzfyReceive.keyword=="3">电子邮件
	</#if>
	<#if xzfyReceive.keyword=="4">其他方式
	</#if>
</td>
	</tr>
  </#if>

	 <th  >涉及安全：</th>
    <td  colspan=3>
    <#if xzfyReceive.issafe?exists && xzfyReceive.issafe == "是">
    &nbsp;&nbsp;是<br>
    <span id="aqspan"  style="display:block">${xzfyReceive.safe_content?default('')}</span>
    <#else> &nbsp;&nbsp;否
    </#if>
    </td>
  </tr>
</#if>
<#if xzfyReceive.receive_type =="2" || xzfyReceive.receive_type=="3">
  <tr >
    <th  width="25%">来信人姓名：</th>
    <td  width="25%">${xzfyReceive.laixin_name?default('')}</td>
    
    <th  width="25%">接收日期：</th>
    <td  width="25%">${xzfyReceive.receive_date?default('')}</td>
  </tr>
  <tr >
    <th >来信人通信地址：</th>
	    <td >${xzfyReceive.laixin_address?default('')}</td>
	    </td>
    <th >来信人邮编：</th>
    <td >${xzfyReceive.laixin_post?default('')}</td>
    </tr>
  <tr >
    <th >来文编号：</th>
    <td >${xzfyReceive.zhize?default('')}</td>
    <th >来信人电话：</th>
    <td >${xzfyReceive.laixin_tel?default('')}</td>
  
  </tr>
</#if>
  
   <tr >
	   <th >申请人类别：</th>
	   <td >
	   <#if xzfyReceive.app_type=="1">公民
	   <#else>法人或其他组织
	   </#if>
	   </td>
	   <th >申请人人数：</th>
    <td >${xzfyReceive.renCount?default('')}</td>
   </tr>
    <tr  id="shenqingren1">
  	<th >申请人：</th>
    <td  colspan=3>
    <#if xzfyReceive.app_type=="1">${xzfyReceive.appdetail?default('')}
    </#if>
    <#if xzfyReceive.app_type=="2">${xzfyReceive.agentDetail?default('')}
    </#if>
   
    </td>
   </tr>
   <#if xzfyReceive.dbrDetail?exists && xzfyReceive.dbrDetail?has_content>
	<tbody id="daibiaorendiv">
	    <tr > 
		    <th >代表人：</th>
		    <td  colspan=3>
    		${xzfyReceive.dbrDetail?default('')}
		    </td>
	    </tr>
   	</tbody> 
   </#if>
   
<#if xzfyReceive.receive_type =="1">
  
  <tr >
   <th >是否有代理人：</th>
    <td >
    <#if xzfyReceive.agent=="1">有
    <#else>无
    </#if>
  </td>
  </th>
   <th  >行政复议请求：
  </th>
   <td  >${xzfyReceive.xzfy_requset_retail?default('')}
  </td>
  </tr>	
  <#if xzfyReceive.agent?exists && xzfyReceive.agent == "1">
  <tr  id="jddlr" >
    <th >委托代理人姓名：</th>
    <td >${xzfyReceive.agent_name?default('')}
    </td>
    <th >是否有授权委托书：</th>
    <td >
    <#if xzfyReceive.proxy?has_content>
    	<#if xzfyReceive.proxy=="1">有
    	<#else>无
    	</#if>
    	</#if>
    </td>
  </tr>
  </#if>
  <#if xzfyReceive.proxy?exists && xzfyReceive.proxy=="3">
  <tr  id="jddlr1">
    <th >委托时间：</th>
    <td >${xzfyReceive.agent_date?default('')}</td>
		
    <th >地点：</th>
    <td >${xzfyReceive.agent_address?default('')}</td>
  </tr>
   </#if> 
</#if>
<#if xzfyReceive.receive_type =="2" || xzfyReceive.receive_type=="3">
 <tr >
    <th >代理人：</th>
	<td >${xzfyReceive.agent_name?default('')}
	<th >&nbsp;</th>
	<td >&nbsp;</td>
   </tr>	
   <tr  id="jddlr2">
    <th >第三人：</th>
    <td >${xzfyReceive.third?default('')}</td>
	<th >第三人代理人：</th>
	<td >${xzfyReceive.third_agent?default('')}</td>
   </tr>
  

</#if>


<tr >
   <th >被申请人种类：</th>
   <td  >
   <#if xzfyReceive.defendant_type=="1">
						乡镇政府
						<#elseif xzfyReceive.defendant_type=="2">
						县级政府部门
						<#elseif xzfyReceive.defendant_type=="3">
						县级政府
						<#elseif xzfyReceive.defendant_type=="4">
						区县政府部门
						<#elseif xzfyReceive.defendant_type=="5">
						区县政府
						<#elseif xzfyReceive.defendant_type=="6">
						省部级行政机关
						<#elseif xzfyReceive.defendant_type=="7">
						省级政府部门
						<#elseif xzfyReceive.defendant_type=="8">
						其他
						<#elseif xzfyReceive.defendant_type=="9">
						区县政府部门派出机构
						</#if>
   
   </td>
   <th>被申请人名称：</th>
   <td>   ${xzfyReceive.defendant_name?default('')} </td>
    
<#if xzfyReceive.receive_type == "1">
  <tr  id="mingan">
    <th >是否行政不作为：</th>
    <td >
    <#if xzfyReceive.ismanage?default('')=="2">是
    <#else>否
    </#if>
	</td>
     <th >要求复议的具体<br>行政行为情况：</th>
	    <td >
		    ${xzfyReceive.require_fy?default('')}
	    </td>
  </tr>
</#if>
<#if xzfyReceive.receive_type =="2" || xzfyReceive.receive_type=="3">
	<tr>
		<th>是否行政不作为：</th>
		<td colspan=3><#if xzfyReceive.ismanage?default('')=="2">是<#else>否</#if></td>
	</tr>
<#if xzfyReceive.ismanage?default('')=="2">
	<tr>
		<th>不作为事项： </th>
		<td colspan=3>${xzfyReceive.matter_detail?default('')}</td>
	</tr>
<#else>
	<tr>
	    <th>被复议的具体行为-名称：</th>
	    <td>${xzfyReceive.xwname?default('')}</td>
	     <th>被复议的具体行为-案号：</th>
	    <td>${xzfyReceive.xwnum?default('')}</td>
	  </tr>
   </#if>
     <tr >
     <th >行政复议请求：</th>
    <td   colspan=3>${xzfyReceive.xzfy_requset_retail?default('')}
    </tr>
</#if>

  <tr >
    <th >是否申请听证：</th>
    <td >${xzfyReceive.istingzheng?default('')}
    </td>
    <th >是否申请行政赔偿：</th>
    <td  >${xzfyReceive.ismoney?default('')}
    </td>
   </tr>
   
  <#if xzfyReceive.isMoney?exists && xzfyReceive.isMoney=="是">
  <tr  id="peichang_div">
	<th >赔偿金额：</th>
	<td >${xzfyReceive.money_Detail?default('')}
	</td>
	<th>受损证明材料：</th>
    <td>${xzfyReceive.money_file?default('')}
    </td>
  </tr>
  </#if>

	<tr >
		<th >复议前置：</th>
	    <td >${xzfyReceive.isfront?default('')}
        </td>
        <th >是否申请对<br>规范性文件审查：</th>
	    <td >${xzfyReceive.ischeck?default('')}
	    <#if xzfyReceive.ischeck?exists && xzfyReceive.ischeck=="是">
	    <br>
		  <span id="shencha">规范文件：
	     &nbsp;${xzfyReceive.check_file?default('')}</span>
	     </#if>
	    </td>
		
	</tr>
  </tr>
 <#if xzfyReceive.receive_type == "1">
  <tr >
  
  		<th >是否愿意接受调解：</th>
    <td >
    <#if xzfyReceive.istiaojie=="1">案前调解
    <#elseif xzfyReceive.istiaojie=="2">调解
    <#elseif xzfyReceive.istiaojie=="3">否
    </#if>
    </td>
    
	<th >其他复议机关、法院&nbsp;&nbsp;&nbsp;&nbsp;<br>是否受理同一复议申请：</th>
    <td >${xzfyReceive.issame?default('')}<br>
    ${xzfyReceive.issame_detail?default('')}
    </td>
</tr>
<#if xzfyReceive.istiaojie?exists && xzfyReceive.istiaojie=="1">
	  <tr  >
	    <td  colspan=4>调解日期自：${xzfyReceive.tiaojie_from?default('')}
	    至：
	    ${xzfyReceive.tiaojie_to?default('')}
	    我们将于收到申请材料后${xzfyReceive.tiaojie_count?default('')}个工作日内尝试案前调解工作，调解期间不计入行政复议受理审查或者行政复议审理期限。
	      </td>
	   
 	 </tr>
</#if>
 <tr>
  <th >接待情况：</th>
  <td>${xzfyReceive.jdFileContent?default('')}</td>
 <th >被接待人意见：</th>
    <td >
    ${xzfyReceive.app_advice_detail?default('')}
    </td>
 </tr>
 	
</#if>	 
</table>

                   <br>
<!--阅卷送达转交材料的接待信息start-->                   
<#list meetList as meet>   

<div class="formTitle2">${meet.meet_type?default('')}</div>
<table width="98%" cellpadding="0" cellspacing="0" border="0">

<tr >
     <th  width="20%">接待日期：</th>
    <td  width="30%">
    ${meet.face_date?default('')}
      </td>
    
    <th  width="22%">接待地点：</th>
	    <td  width="28%">${meet.face_address?default('')}</td>
  </tr>
    <tr >
  	<th >第一接待人：</th>
    <td >${meet.admit1?default('')}   </td>
   <th >第二接待人：</th>
    <td >${meet.admit2?default('')}
   </td>   
    </tr>
  <tr>
    <th >接待人数：</th>
    <td >${meet.face_allnumber?default('')}</td>  
  </tr>	
<tr >
    <th  >被接待人：</th>
    <td  width="75%" colspan=3>
${meet.client_content?default('')} 
    </td>
 </tr>

  <tr >
    <th  width="25%">${meet.meet_type}笔录内容</th>
    <td  width="75%" colspan=8>
${meet.face_content?default('')}
    </td>
  </tr>
			
		</table>
		<br/>
</#list>
<!--阅卷送达转交材料的接待信息end--> 


<!--当面补正的接待信息start-->   
                
<#if buzhengInfo.id?has_content>
<div class="formTitle2">当面补正信息</div>
 <table width="100%">
             
<#if buzhengInfo.receive_type == "1">
<tr >
     <th  width="20%">接待日期：</th>
    <td  width="30%">
    ${buzhengInfo.receive_date?default('')}
      </td>
    
    <th  width="22%">接待地点：</th>
	    <td  width="28%">${buzhengInfo.receive_address?default('')}</td>
  </tr>

    <tr >
  	<th >接待人：</th>
    <td >${buzhengInfo.admit1?default('')}   </td>
   <th >第二接待人：</th>
    <td >${buzhengInfo.admit2?default('')}
   </td>   
    </tr>	
<tr >
    <th  >被接待人：</th>
    <td >${buzhengInfo.jddetail?default('')}
    </td>
    <th >接待人数：</th>
    <td >${buzhengInfo.jdRenshu?default('')}</td>  
  </tr>
  
  <tr>
	<th>首次收到申请材料时间：</th>
	<td>${buzhengInfo.receive_date}</td>
	<th>首次收到申请材料方式：</th>
	<td><#if buzhengInfo.app_type=='1'>当面
		<#elseif buzhengInfo.app_type=='2'>来信
		<#elseif buzhengInfo.app_type=='3'>电子邮件
		<#else>其他方式</#if>
	</td>
	</tr>
  
  
     <tr  style="display:none">
   <th >多人复议：</th>
    <td >
<input name="buzhengInfo.ismany" id="duoren_y" value="${buzhengInfo.ismany?default('')}">
    </tr>
  <tr >

<#if buzhengInfo.status?exists&&buzhengInfo.status=="1"&&buzhengInfo.app_type1?exists&&buzhengInfo.app_type1=="2"> 
<tr>
	<th>接待目的：</th>
	<td>
	<#if buzhengInfo.keyword=="1">了解情况
	</#if>
	<#if buzhengInfo.keyword=="2">明确有关事项
	</#if>
	<#if buzhengInfo.keyword=="3">补正材料
	</#if>
	</td>
	<th></th>
	<td> 
	</td>
	</tr>
	
	<tr>
	<th>首次收到申请材料时间：</th>
	<td> ${buzhengInfo.menu?default('')}</td>
	<th>首次收到申请材料方式：</th>
	<td>
	<#if buzhengInfo.keyword=="1">当面
	</#if>
	<#if buzhengInfo.keyword=="2">来信
	</#if>
	<#if buzhengInfo.keyword=="3">电子邮件
	</#if>
	<#if buzhengInfo.keyword=="4">其他方式
	</#if>
</td>
	</tr>
  </#if>

	 <th  >涉及安全：</th>
    <td  colspan=3>
    <#if buzhengInfo.issafe?exists && buzhengInfo.issafe == "是">
    &nbsp;&nbsp;是<br>
    <span id="aqspan"  style="display:block">${buzhengInfo.safe_content?default('')}</span>
    <#else> &nbsp;&nbsp;否
    </#if>
    </td>
  </tr>
</#if>
<#if buzhengInfo.receive_type =="2" || buzhengInfo.receive_type=="3">
  <tr >
    <th  width="25%">来信人姓名：</th>
    <td  width="25%">${buzhengInfo.laixin_name?default('')}</td>
    
    <th  width="25%">接收日期：</th>
    <td  width="25%">${buzhengInfo.receive_date?default('')}</td>
  </tr>
  <tr >
    <th >来信人通信地址：</th>
	    <td >${buzhengInfo.laixin_address?default('')}</td>
	    </td>
    <th >来信人邮编：</th>
    <td >${buzhengInfo.laixin_post?default('')}</td>
    </tr>
  <tr >
    <th >来文编号：</th>
    <td >${buzhengInfo.zhize?default('')}</td>
    <th >来信人电话：</th>
    <td >${buzhengInfo.laixin_tel?default('')}</td>
  
  </tr>
</#if>
  
   <tr >
	   <th >申请人类别：</th>
	   <td >
	   <#if buzhengInfo.app_type=="1">公民
	   <#else>法人或其他组织
	   </#if>
	   </td>
	   <th >申请人人数：</th>
    <td >${buzhengInfo.renCount?default('')}</td>
   </tr>
    <tr  id="shenqingren1">
  	<th >申请人：</th>
    <td  colspan=3>
    <#if buzhengInfo.app_type=="1">${buzhengInfo.appdetail?default('')}
    </#if>
    <#if buzhengInfo.app_type=="2">${buzhengInfo.agentDetail?default('')}
    </#if>
   
    </td>
   </tr>
   <#if buzhengInfo.dbrDetail?exists && buzhengInfo.dbrDetail?has_content>
	<tbody id="daibiaorendiv">
	    <tr > 
		    <th >代表人：</th>
		    <td  colspan=3>
    		${buzhengInfo.dbrDetail?default('')}
		    </td>
	    </tr>
   	</tbody> 
   </#if>
   
<#if buzhengInfo.receive_type =="1">
  
  <tr >
   <th >是否有代理人：</th>
    <td >
    <#if buzhengInfo.agent=="1">有
    <#else>无
    </#if>
  </td>
  </th>
   <th  >行政复议请求：
  </th>
   <td  >${buzhengInfo.xzfy_requset_retail?default('')}
  </td>
  </tr>	
  <#if buzhengInfo.agent?exists && buzhengInfo.agent == "1">
  <tr  id="jddlr" >
    <th >委托代理人姓名：</th>
    <td >${buzhengInfo.agent_name?default('')}
    </td>
    <th >是否有授权委托书：</th>
    <td >
    <#if buzhengInfo.proxy?has_content>
    	<#if buzhengInfo.proxy=="1">有
    	<#else>无
    	</#if>
    	</#if>
    </td>
  </tr>
  </#if>
  <#if buzhengInfo.proxy?exists && buzhengInfo.proxy=="3">
  <tr  id="jddlr1">
    <th >委托时间：</th>
    <td >${buzhengInfo.agent_date?default('')}</td>
		
    <th >地点：</th>
    <td >${buzhengInfo.agent_address?default('')}</td>
  </tr>
   </#if> 
</#if>
<#if buzhengInfo.receive_type =="2" || buzhengInfo.receive_type=="3">
 <tr >
    <th >代理人：</th>
	<td >${buzhengInfo.agent_name?default('')}
	<th >&nbsp;</th>
	<td >&nbsp;</td>
   </tr>	
   <tr  id="jddlr2">
    <th >第三人：</th>
    <td >${buzhengInfo.third?default('')}</td>
	<th >第三人代理人：</th>
	<td >${buzhengInfo.third_agent?default('')}</td>
   </tr>
  

</#if>


<tr >
   <th >被申请人种类：</th>
   <td  >
   <#if buzhengInfo.defendant_type=="1">
						乡镇政府
						<#elseif buzhengInfo.defendant_type=="2">
						县级政府部门
						<#elseif buzhengInfo.defendant_type=="3">
						县级政府
						<#elseif buzhengInfo.defendant_type=="4">
						区县政府部门
						<#elseif buzhengInfo.defendant_type=="5">
						区县政府
						<#elseif buzhengInfo.defendant_type=="6">
						省部级行政机关
						<#elseif buzhengInfo.defendant_type=="7">
						省级政府部门
						<#elseif buzhengInfo.defendant_type=="8">
						其他
						<#elseif buzhengInfo.defendant_type=="9">
						区县政府部门派出机构
						</#if>
   
   </td>
   <th>被申请人名称：</th>
   <td>   ${buzhengInfo.defendant_name?default('')} </td>
    
<#if buzhengInfo.receive_type == "1">
  <tr  id="mingan">
    <th >是否行政不作为：</th>
    <td >
    <#if buzhengInfo.ismanage?default('')=="0">否
    <#else>是
    </#if>
	</td>
     <th >要求复议的具体<br>行政行为情况：</th>
	    <td >
		    ${buzhengInfo.require_fy?default('')}
	    </td>
  </tr>
</#if>
<#if buzhengInfo.receive_type =="2" || buzhengInfo.receive_type=="3">
	<tr>
    <th>被复议的具体行为-名称：</th>
    <td>${buzhengInfo.xwname?default('')}</td>
     <th>被复议的具体行为-案号：</th>
    <td>${buzhengInfo.xwnum?default('')}</td>
  </tr>
   
     <tr >
     <th >行政复议请求：</th>
    <td   colspan=3>${buzhengInfo.xzfy_requset_retail?default('')}
    </tr>
</#if>

  <tr >
    <th >是否申请听证：</th>
    <td >${buzhengInfo.istingzheng?default('')}
    </td>
    <th >是否申请行政赔偿：</th>
    <td  >${buzhengInfo.ismoney?default('')}
    </td>
   </tr>
   
  <#if buzhengInfo.isMoney?exists && buzhengInfo.isMoney=="是">
  <tr  id="peichang_div">
	<th >赔偿金额：</th>
	<td >${buzhengInfo.money_Detail?default('')}
	</td>
	<th>受损证明材料：</th>
    <td>${buzhengInfo.money_file?default('')}
    </td>
  </tr>
  </#if>

	<tr >
		<th >复议前置：</th>
	    <td >${buzhengInfo.isfront?default('')}
        </td>
        <th >是否申请对<br>规范性文件审查：</th>
	    <td >${buzhengInfo.ischeck?default('')}
	    <#if buzhengInfo.ischeck?exists && buzhengInfo.ischeck=="是">
	    <br>
		  <span id="shencha">规范文件：
	     &nbsp;${buzhengInfo.check_file?default('')}</span>
	     </#if>
	    </td>
		
	</tr>
  </tr>
 <#if buzhengInfo.receive_type == "1">
  <tr >
  
  		<th >是否愿意接受调解：</th>
    <td >
    <#if buzhengInfo.istiaojie=="1">案前调解
    <#elseif buzhengInfo.istiaojie=="2">调解
    <#elseif buzhengInfo.istiaojie=="3">否
    </#if>
    </td>
    
	<th >其他复议机关、法院&nbsp;&nbsp;&nbsp;&nbsp;<br>是否受理同一复议申请：</th>
    <td >${buzhengInfo.issame?default('')}<br>
    ${buzhengInfo.issame_detail?default('')}
    </td>
</tr>
<#if buzhengInfo.istiaojie?exists && buzhengInfo.istiaojie=="1">
	  <tr  >
	    <td  colspan=4>调解日期自：${buzhengInfo.tiaojie_from?default('')}
	    至：
	    ${buzhengInfo.tiaojie_to?default('')}
	    我们将于收到申请材料后${buzhengInfo.tiaojie_count?default('')}个工作日内尝试案前调解工作，调解期间不计入行政复议受理审查或者行政复议审理期限。
	      </td>
	   
 	 </tr>
</#if>
 <tr>
  <th >接待情况：</th>
  <td>${buzhengInfo.jdFileContent?default('')}</td>
 <th >被接待人意见：</th>
    <td >
    ${buzhengInfo.app_advice_detail?default('')}
    </td>
 </tr>
 	
</#if>	 
</table>
		<br/>
</#if>
<!--当面补正的接待信息end-->
 
</div>

</div>
</form>
</body>

<script language="javascript">
 function back(){
 	history.back(-1);
 }

</script>
</html>