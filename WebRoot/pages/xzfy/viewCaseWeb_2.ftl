<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/banli.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>

<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>


<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 
</head>

<body  onload="remove_loading()" style="margin:0 0;padding:0 0" scroll="no">
<#include "../website/header.ftl">
<#assign isShowBtn=xzfyInfo.check_status?default('0')>
<#assign sdResult=xzfyInfo.stadardResult?default('0')>
<div class="wal">
<div class="pageBg">
<!--wal-->
<div class="fl w198">
<#assign currentStatus=xzfyInfo.status?number  >
<#assign isde=xzfyInfo.isdelay?default('0')>
<#assign isst=xzfyInfo.isstop?default('0')>	
<#assign stadardResult=xzfyInfo.stadardResult?default('0')>
<#assign isBuzheng=xzfyInfo.isBuzhengshenpi?default('0')>
      <div class="sideNav">
            <div class="title">请选择栏目</div>
            <ul>
             <#if xzfyInfo.id.length() gt 10>
                <li><a href="javascript:checkIframe('jiedaiUrl','ifm1');" >接待信息</a></li>
               </#if>
            <#if buzhengId != "">
            	<li><a href="javascript:checkIframe('buzhengUrl','ifm1')">补正信息</a></li>
            </#if>
                 <li><a href="javascript:checkIframe('lianUrl','ifm1');" class="aNow">
               	案件信息
               </a></li>
           <#if xzfyInfo.caseorg?default('')==localBm?default('0')>
               <!-- <li><a href="javascript:checkIframe('cailiaoUrl','ifm1');">
               	电子材料上传
               </a></li>       -->   	
           </#if>		
    <#if xzfyInfo.id.length() gt 10>
                   	<#if isBuzheng=="1">
                  	<li><a href="javascript:checkIframe('buzhengShenpiRul','ifm1');" >补正信息</a></li>
                  	</#if>     
              <#assign sdResult=xzfyInfo.stadardResult?default('0')>    	
                  	<#if sdResult=='1'>
                  		<li><a href="javascript:checkIframe('sdResult1','ifm1');" >受理</a></li>
                  	</#if>
                  	<#if sdResult=='2'>
                  		<li><a href="javascript:checkIframe('sdResult2','ifm1');" >告知处理</a></li>
                  	</#if>
                  	<#if sdResult=='3'>
                  		<li><a href="javascript:checkIframe('sdResult3','ifm1');" >不予受理</a></li>
                  	</#if>
                  	<#if sdResult=='5'>
                  		<li><a href="javascript:checkIframe('sdResult5','ifm1');" >其他处理</a></li>
                  	</#if>

           		<#if currentStatus gt 3 && stadardResult=="1">
               		<!--<li><a href="javascript:;checkIframe('banli1','ifm1')" >案件审理</a></li>-->
               </#if>                  	
                  	
                  	<#if currentStatus==5 || isde=="1">
                  	<li><a href="javascript:;checkIframe('banli2','ifm1')" >延期信息</a></li>
                  	</#if>   
                  
                  	<#if currentStatus==7 ||  isst=="1">
                  	<li><a href="javascript:;checkIframe('banli3','ifm1')" >中止信息</a></li>
                  	</#if>  
                  	
                  	<#if currentStatus==9 || isst=="1">
                  	<li><a href="javascript:;checkIframe('banli4','ifm1')" >恢复审理信息</a></li>
                  	</#if> 
                  	
                  	<#if  currentStatus gt 10 && stadardResult=="1">
                  	<li><a href="javascript:;checkIframe('banli5','ifm1')" >结案信息</a></li>
                  	</#if> 
                  	<#if sdResult=='1' && currentStatus gt 2>
                  	<li><a href="javascript:checkIframe('dafutongzhi','ifm1');" >答复通知</a></li>
                  	</#if>
                  	<li><a href="javascript:checkIframe('archive','ifm1');" >案卷管理</a></li>
                  	 <li><a href="javascript:;checkIframe('logDiv','ifm1')" >操作记录</a></li>
                  </#if>
            </ul>
      </div>
      <div class="sideTip">
          <h1 class="title">相关应诉案件信息</h1>
          <div class="content"><#--
          <#if xzssInfoShen1.id?has_content>
          <a href="javascript:gotoXzss('${xzssInfoShen1.id}')">一审</a>&nbsp;&nbsp;
          </#if>
          <#if xzssInfoShen2.id?has_content>
          <a href="javascript:gotoXzss('${xzssInfoShen2.id}')">二审</a>&nbsp;&nbsp;
          </#if>
          <#if xzssInfoShen3.id?has_content>
          <a href="javascript:gotoXzss('${xzssInfoShen3.id}')">再审</a>
          </#if>
          </div>-->
      </div>
</div>
<input type="hidden" id="cailiaoUrl" value="../xzfy/editCailiao.action?funcCode=${funcCode}&xzfyId=${xzfyId}&listkeyword=${listkeyword}&isView=1">
<input type="hidden" id="jiedaiUrl" value="../xzfy/viewXzfyInfo.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}">
<input type="hidden" id="buzhengUrl" value="../xzfy/viewXzfyInfo.action?funcCode=${funcCode}&xzfyId=${buzhengId?default('')}">
<input type="hidden" id="lianUrl" value="../xzfy/editlian.action?funcCode=${funcCode}&xzfyId=${xzfyId}&listkeyword=${listkeyword}&isView=0">
<input type="hidden" id="buzhengShenpiRul" value="../xzfy/buzhengFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=2&listkeyword=${listkeyword}&resultType=0&isView=0">
<input type="hidden" id="sdResult1" value="../xzfy/shenpiFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=3&listkeyword=${listkeyword}&resultType=1&isView=0">
<input type="hidden" id="sdResult2" value="../xzfy/shenpiFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=11&listkeyword=${listkeyword}&resultType=2&isView=0">
<input type="hidden" id="sdResult3" value="../xzfy/shenpiFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=11&listkeyword=${listkeyword}&resultType=3&isView=0">
<input type="hidden" id="sdResult5" value="../xzfy/shenpiFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=11&listkeyword=${listkeyword}&resultType=5&isView=0">

<input type="hidden" id="banli1" value="../banan/anjianbanliform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=0">
<input type="hidden" id="banli2" value="../banan/yanqiform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}}&isView=0">
<input type="hidden" id="banli3" value="../banan/zhongzhiform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=0">
<input type="hidden" id="banli4" value="../banan/huifuform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=0">
<input type="hidden" id="banli5" value="../banan/jieanform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=0">
<input type="hidden" id="archive" value="../archive/showArchiveList.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=1&pNum=${pNum}" />
<input type="hidden" id="logDiv" value="../xzfy/showLogList.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}">

<input type="hidden" id="dafutongzhi" value="../banan/dftzform.action?funcCode=${funcCode}&tempid=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=1" />

<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<div class="fr w739">
      <div class="pageNow">
当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;   案件信息
      
      </div>

 
 
      </div>

 
</div>
<div class="pageDiv fl" style="display:block;width:792px;">
		
			
		<iframe frameborder="0"  height="1650px"   scrolling="no" id="ifm1"
       width="100%" src="../xzfy/editlian.action?funcCode=${funcCode}&xzfyId=${xzfyId}&listkeyword=${listkeyword}&isView=0"></iframe>
		  	
			
	</div>
<span class="clear_f"></span>
<div class="h50"></div>
<!--walEnd-->
</div>
</div>
 
</div>
</form>
</body>

<script language="javascript">
	function checkIframe(typeId,iframeId){
		document.getElementById(iframeId).src=document.getElementById(typeId).value;
	}
	function gotoXzss(xzssId){
	window.open("../xzss/xzssguanli.action?funcCode=${funcCode}&isxinzeng=0&xzssId="+xzssId);
	}
</script>
</html>
