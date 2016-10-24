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

<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>


</head>

<body>
<#include "../website/header.ftl">
<#assign isShowBtn=xzfyInfo.check_status?default('0')>
<#assign sdResult=xzfyInfo.stadardResult?default('0')>
<div class="wal">
<div class="pageBg">
<!--wal-->
<div class="fl w198">
      <div class="sideNav">
            <div class="title">请选择栏目</div>
            <ul>
            <#if xzfyInfo.xzfyInfo2id?exists>
                <li><a href="javascript:checkIframe('waitianxie','ifm1');" >外网信息</a></li>
                  </#if>
            <#if xzfyInfo.id.length() gt 10>
            <li><a href="javascript:checkIframe('jiedaiUrl','ifm1')">接待信息</a></li>
            </#if>
            
            <li><a href="javascript:checkIframe('lianUrl','ifm1')" class="aNow" >案件信息</a></li>
            <#if xzfyInfo.id.length() gt 10>
                  <#if xzfyInfo.isBuzhengshenpi?default('0')=="1">
                  	<#if xzfyInfo.status=="2">
                  		<li><a href="javascript:checkIframe('buzhengShenpiRul','ifm1');" >补正审批</a></li>
                  	<#else>
                  		<li><a href="javascript:checkIframe('buzhengRul','ifm1')" >已通知补正</a></li>
                  	</#if>
                  </#if>
                  <#if <#--xzfyInfo.status=="1" && -->xzfyInfo.isBuzhengshenpi?default('0')=="0">
                  	<li><a href="javascript:checkIframe('buzhengTo','ifm1');" >书面通知补正</a></li>
                  </#if>  
		
                <#if sdResult=="1" && xzfyInfo.status!='2'>
                <li><a href="javascript:checkIframe('sdResult1','ifm1');">立案受理</a></li>
                </#if>
                <#if sdResult=="2" && xzfyInfo.status!='2'>
                <li><a href="javascript:checkIframe('sdResult2','ifm1');" >告知处理</a></li>
                </#if>
                <#if sdResult=="3" && xzfyInfo.status!='2'>
                <li><a href="javascript:checkIframe('sdResult3','ifm1');">不予受理</a></li>
                </#if>
                <#if sdResult=="5" && xzfyInfo.status!='2'>
                <li><a href="javascript:checkIframe('sdResult4','ifm1');" >其他处理</a></li>
                </#if>
                <#if sdResult=="0" && xzfyInfo.status!='2'>
                <li><a href="javascript:checkIframe('sdResult1_sta0','ifm1');" >立案受理</a></li>
                <li><a href="javascript:checkIframe('sdResult2_sta0','ifm1');" >告知处理</a></li>
                <li><a href="javascript:checkIframe('sdResult3_sta0','ifm1');" >不予受理</a></li>
                <li><a href="javascript:checkIframe('sdResult4_sta0','ifm1');" >其他处理</a></li>
                </#if>
                <li><a href="javascript:checkIframe('archive','ifm1');" >案卷管理</a></li>
                <li><a href="javascript:checkIframe('logDiv','ifm1');" >操作记录</a></li>
</#if>

              
            </ul>
      </div>

</div>
<input type="hidden" id="waitianxie" value="../xzfy/viewCase_w2_x.action?funcCode=${funcCode}&xzfyId_w=${xzfyInfo.xzfyInfo2id?default('')}&listkeyword=${listkeyword}&isView=1">


 <input type="hidden" id="lianUrl" value="../xzfy/editlian.action?funcCode=${funcCode}&xzfyId=${xzfyId}&listkeyword=${listkeyword}&isView=0&pNum=${pNum}">
<input type="hidden" id="buzhengShenpiRul" value="../xzfy/buzhengFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=2&listkeyword=${listkeyword}&resultType=0&isView=1&pNum=${pNum}">
<input type="hidden" id="buzhengRul" value="../xzfy/buzhengFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=2&listkeyword=${listkeyword}&resultType=0&isView=1&pNum=${pNum}">
<input type="hidden" id="buzhengTo" value="../xzfy/buzhengFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=2&listkeyword=${listkeyword}&resultType=0&isView=1&pNum=${pNum}">
<input type="hidden" id="sdResult1" value="../xzfy/shenpiFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=3&listkeyword=${listkeyword}&resultType=1&isView=1&pNum=${pNum}">
<input type="hidden" id="sdResult2" value="../xzfy/shenpiFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=11&listkeyword=${listkeyword}&resultType=2&isView=1&pNum=${pNum}">
<input type="hidden" id="sdResult3" value="../xzfy/shenpiFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=11&listkeyword=${listkeyword}&resultType=3&isView=1&pNum=${pNum}">
<input type="hidden" id="sdResult4" value="../xzfy/shenpiFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=11&listkeyword=${listkeyword}&resultType=3&isView=1&pNum=${pNum}">

<input type="hidden" id="sdResult1_sta0" value="../xzfy/shenpiFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=3&listkeyword=${listkeyword}&resultType=1&isView=1&pNum=${pNum}">
<input type="hidden" id="sdResult2_sta0" value="../xzfy/shenpiFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=11&listkeyword=${listkeyword}&resultType=2&isView=1&pNum=${pNum}">
<input type="hidden" id="sdResult3_sta0" value="../xzfy/shenpiFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=11&listkeyword=${listkeyword}&resultType=3&isView=1&pNum=${pNum}">
<input type="hidden" id="sdResult4_sta0" value="../xzfy/shenpiFormInfo.action?funcCode=${funcCode}&xzfyId=${xzfyId}&checkDocType=11&listkeyword=${listkeyword}&resultType=5&isView=1&pNum=${pNum}">
<input type="hidden" id="archive" value="../archive/showArchiveList.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=1&pNum=${pNum}" />
<input type="hidden" id="logDiv" value="../xzfy/showLogList.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}">


<script>

</script>
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<div class="fr w739">
      <div class="pageNow">
当前位置&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;  <a href="../banan/showanjianbanliList.action?listkeyword=${listkeyword}&funcCode=${funcCode}">待办案件</a>  >&nbsp;&nbsp; 案件办理
&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
	当前状态:&nbsp;&nbsp;
	<font color="red">
	<#if xzfyInfo.status=="2">补正
	<#elseif xzfyInfo.status=="1">待立案审查
	<#elseif xzfyInfo.status=="3">立案审批
	<#elseif xzfyInfo.status=="11">结案审批
	</#if>
	</font>
	<#assign todate="5">
	<#list xzfyCheckList_la as list>
		<#assign todate=list>
	</#list>
      &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 距立案审查期限届满还有 <font style="font-size:24px;color:red">${todate}</font> 天
	  <input type="button" value="短信平台" onclick="getMsg()" style="display:block; width:77px; height:27px;background: url('../images/sideNavBg.gif');line-height:27px; text-align:center; border:#eeeded solid 1px;float:right;margin-right:16px;"/>
	  </div>
	  	  <script>
		function getMsg(){
			window.open('/xzfy/ssoServlet?LinkID=mhsms&LinkType=online')
		}
	  </script>
   <#assign checkUserId=xzfyInfo.check_id?default('0')>
   
  <div class="pageDiv" style="display:block">
		
			<iframe src="../xzfy/editlian.action?funcCode=${funcCode}&xzfyId=${xzfyId}&listkeyword=${listkeyword}&isView=0" 
  		 	frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="yse" id="ifm1" name="ifm1"  width="100%" height="1500px" ></iframe>
		  	<input type="hidden" id="jiedaiUrl" value="../xzfy/viewXzfyInfo.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}">
		
	</div> 

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
</script>
</html>
