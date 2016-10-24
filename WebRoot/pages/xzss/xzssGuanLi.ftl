<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>

<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 
<style>
.btn-blue{display:block; width:107px; height:27px;background: url(../images/sideNavBg.gif);line-height:27px; text-align:center; border:#eeeded solid 1px; margin-left:36px;margin-top:10px;float:left;}
.btn-blue:link,.btn-blue:visited{color:#000;}
</style>

</head>

<body onload="startTime()">
<#include "../website/header.ftl">
<div class="wal">
<div class="pageBg">
<!--wal-->
<div class="fl w198">

      <div class="sideNav">
            <div class="title">请选择栏目</div>
            <ul>
            <#if isxinzeng=="1">
                <li><a href="javascript:divControl('1');" class="aNow" >批办单</a></li>
            <#elseif isxinzeng=="0">
            <li><a href="javascript:divControl('2');" class="aNow" >批办单</a></li>
            <li><a href="javascript:divControl('3');"  >结案情况</a></li>
            <li><a href="javascript:divControl('4');"  >案卷管理</a></li>
            <li><a href="javascript:divControl('5');"  >操作记录</a></li>
            </#if>
            </ul>
      </div>
<div class="sideTip">
    <h1 class="title">相关信息</h1>
    <div class="content">
    <#if isxinzeng=="1">
          审理级别：<!--
          <#if shenji=="1">一审
          <#elseif shenji=="2">二审<#if shenhe1=="1"><br/><a href="javascript:chakanXzss('<#if xzssInfo.id?has_content>${xzssInfo.id}</#if>')">一审</a></#if>
          <#elseif shenji=="3">再审
          <#if shenhe1=="1"><br/><a href="javascript:chakanXzss('<#if xzssInfo.id?has_content>${xzssInfo.id}</#if>')">一审</a></#if>
          <#if shenhe2=="1"><br/>
          <#if xzssInfo.shen1.trim()=="1"><a href="javascript:chakanXzss('<#if xzssInfo.shen1_id?has_content>${xzssInfo.shen1_id}</#if>')">一审</a>&nbsp;&nbsp;</#if>
          <a href="javascript:chakanXzss('<#if xzssInfo.id?has_content>${xzssInfo.id}</#if>')">二审</a>
          </#if>
          </#if><br />-->
          <#if shenji=="1">一审
          <#elseif shenji=="2">二审<#if shenhe1=="1"><br/><a href="javascript:gotoXzss('<#if xzssInfo.id?has_content>${xzssInfo.id}</#if>')">一审</a></#if>
          <#elseif shenji=="3">再审
          <#if shenhe1=="1"><br/><a href="javascript:gotoXzss('<#if xzssInfo.id?has_content>${xzssInfo.id}</#if>')">一审</a></#if>
          <#if shenhe2=="1"><br/>
          <#if xzssInfo.shen1.trim()=="1"><a href="javascript:gotoXzss('<#if xzssInfo.shen1_id?has_content>${xzssInfo.shen1_id}</#if>')">一审</a>&nbsp;&nbsp;</#if>
          <a href="javascript:gotoXzss('<#if xzssInfo.id?has_content>${xzssInfo.id}</#if>')">二审</a>
          </#if>
          </#if><br />
          审理法院：<span id="shenlifayuan1" ></span><br />
          是否经过行政复议 ：
          <!--
          <#if fuyi=="0">否<br/>
          <#elseif fuyi=="1"><br/>是（用户所在单位为复议机关）
          <#if xzfyInfo.tjzfzh?has_content><br/><a href="javascript:chakanXzfy('${xzfyInfo.id}')"><${xzfyInfo.tjzfzh}></a><br /></#if>
          <#elseif fuyi=="2" ><br/>是（用户所在单位为被申请人）
          <#if xzfyInfo.tjzfzh?has_content><br/><a href="javascript:chakanXzfy('${xzfyInfo.id}')"><${xzfyInfo.tjzfzh}></a><br /></#if>
          </#if>
          <#if xzssInfo.isFuyi?has_content&&xzssInfo.isFuyi.trim()=="1"><br/>是（用户所在单位为复议机关）<br/>
           <#if xzssInfo.fuyi_id?has_content&&xzssInfo.fuyiCaseNum?has_content><a href="javascript:chakanXzfy('${xzssInfo.fuyi_id}')"><${xzssInfo.fuyiCaseNum}></a><br /></#if>
           </#if>
          <#if xzssInfo.isFuyi?has_content&&xzssInfo.isFuyi.trim()=="2"><br/>是（用户所在单位为被申请人）<br/>
          <#if xzssInfo.fuyi_id?has_content&&xzssInfo.fuyiCaseNum?has_content><a href="javascript:chakanXzfy('${xzssInfo.fuyi_id}')"><${xzssInfo.fuyiCaseNum}></a><br /></#if>
          </#if>
          <#if xzssInfo.isFuyi?has_content&&xzssInfo.isFuyi.trim()=="0">否<br /></#if>-->
          <#if fuyi=="0">否<br/>
          <#elseif fuyi=="1"><br/>是（用户所在单位为复议机关）
          <#if xzfyInfo.tjzfzh?has_content><br/><a href="javascript:gotoXzfy('${xzfyInfo.id}')"><${xzfyInfo.tjzfzh}></a><br /></#if>
          <#elseif fuyi=="2" ><br/>是（用户所在单位为被申请人）
          <#if xzfyInfo.tjzfzh?has_content><br/><a href="javascript:gotoXzfy('${xzfyInfo.id}')"><${xzfyInfo.tjzfzh}></a><br /></#if>
          </#if>
          <#if xzssInfo.isFuyi?has_content&&xzssInfo.isFuyi.trim()=="1"><br/>是（用户所在单位为复议机关）<br/>
           <#if xzssInfo.fuyi_id?has_content&&xzssInfo.fuyiCaseNum?has_content><a href="javascript:gotoXzfy('${xzssInfo.fuyi_id}')"><${xzssInfo.fuyiCaseNum}></a><br /></#if>
           </#if>
          <#if xzssInfo.isFuyi?has_content&&xzssInfo.isFuyi.trim()=="2"><br/>是（用户所在单位为被申请人）<br/>
          <#if xzssInfo.fuyi_id?has_content&&xzssInfo.fuyiCaseNum?has_content><a href="javascript:gotoXzfy('${xzssInfo.fuyi_id}')"><${xzssInfo.fuyiCaseNum}></a><br /></#if>
          </#if>
          <#if xzssInfo.isFuyi?has_content&&xzssInfo.isFuyi.trim()=="0">否<br /></#if>
           应诉承办人：<span id="yscbr1" >无</span><br />
           <h1 class="fr"></h1>
    <#else>
   	 审理级别：
   	 <!--
   	 <#if xzssInfo.shen_level=="1">一审<#elseif xzssInfo.shen_level=="2">二审<#elseif xzssInfo.shen_level=="3">再审</#if><br />
   	 <#if (xzssInfo.shen1?has_content&&xzssInfo.shen1.trim()=="1")||(xzssInfo.shen2?has_content&&xzssInfo.shen2.trim()=="1")>
   	 <#if xzssInfo.shen1?has_content&&xzssInfo.shen1.trim()=="1"><a href="javascript:chakanXzss('<#if xzssInfo.shen1_id?has_content>${xzssInfo.shen1_id}</#if>')">一审</a>&nbsp;&nbsp;</#if>
   	<#if xzssInfo.shen2?has_content&&xzssInfo.shen2.trim()=="1"><a href="javascript:chakanXzss('<#if xzssInfo.shen2_id?has_content>${xzssInfo.shen2_id}</#if>')">二审</a>&nbsp;&nbsp;</#if> 
   	<br/>
   	</#if>--> 
   	<#if xzssInfo.shen_level=="1">一审<#elseif xzssInfo.shen_level=="2">二审<#elseif xzssInfo.shen_level=="3">再审</#if><br />
   	 <#if (xzssInfo.shen1?has_content&&xzssInfo.shen1.trim()=="1")||(xzssInfo.shen2?has_content&&xzssInfo.shen2.trim()=="1")>
   	 <#if xzssInfo.shen1?has_content&&xzssInfo.shen1.trim()=="1"><a href="javascript:gotoXzss('<#if xzssInfo.shen1_id?has_content>${xzssInfo.shen1_id}</#if>')">一审</a>&nbsp;&nbsp;</#if>
   	<#if xzssInfo.shen2?has_content&&xzssInfo.shen2.trim()=="1"><a href="javascript:gotoXzss('<#if xzssInfo.shen2_id?has_content>${xzssInfo.shen2_id}</#if>')">二审</a>&nbsp;&nbsp;</#if> 
   	<br/>
   	</#if>
   	 审理法院：<span id="shenlifayuan" ><#if xzssInfo.court?has_content>${xzssInfo.court}</#if></span><br/>
   	 是否经过行政复议：
   	 <!--       
	<#if xzssInfo.isFuyi?has_content&&xzssInfo.isFuyi.trim()=="1"><br/>是（用户所在单位为复议机关）<br/><#if xzssInfo.fuyi_id?has_content&&xzssInfo.fuyiCaseNum?has_content><a href="javascript:chakanXzfy('${xzssInfo.fuyi_id}')"><${xzssInfo.fuyiCaseNum}></a><br /></#if>
    <#elseif xzssInfo.isFuyi?has_content&&xzssInfo.isFuyi.trim()=="2"><br/>是（用户所在单位为被申请人）<br/><#if xzssInfo.fuyi_id?has_content&&xzssInfo.fuyiCaseNum?has_content><a href="javascript:chakanXzfy('${xzssInfo.fuyi_id}')"><${xzssInfo.fuyiCaseNum}></a><br /></#if>
    <#else>否<br />
    </#if>-->
    <#if xzssInfo.isFuyi?has_content&&xzssInfo.isFuyi.trim()=="1"><br/>是（用户所在单位为复议机关）<br/><#if xzssInfo.fuyi_id?has_content&&xzssInfo.fuyiCaseNum?has_content><a href="javascript:gotoXzfy('${xzssInfo.fuyi_id}')"><${xzssInfo.fuyiCaseNum}></a><br /></#if>
    <#elseif xzssInfo.isFuyi?has_content&&xzssInfo.isFuyi.trim()=="2"><br/>是（用户所在单位为被申请人）<br/><#if xzssInfo.fuyi_id?has_content&&xzssInfo.fuyiCaseNum?has_content><a href="javascript:gotoXzfy('${xzssInfo.fuyi_id}')"><${xzssInfo.fuyiCaseNum}></a><br /></#if>
    <#else>否<br />
    </#if>
           应诉承办人：<span id="yscbr" ><#if xzssInfo.ysundertaker_name?has_content>${xzssInfo.ysundertaker_name}<#else>无</#if></span><br /> 
    </#if>
    
    </div>
</div>
</div>

<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<div class="fr w739">
      <div class="pageNow">
当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >
    <a href="../xzss/showUndertakerList.action?funcCode=${funcCode}">行政诉讼案件列表</a> >
    <#if isxinzeng=='0'>行政诉讼案件信息 <#elseif isxinzeng=='1'>新增行政诉讼案件</#if> >
      </div>
	<input type="hidden" name="funcCode" value="${funcCode}" />
	    
	<input type="hidden" id="xzpipandan" value="../xzss/xzsspipandan.action?funcCode=${funcCode}&xzfyId=${xzfyId}&shenji=${shenji}&fuyi=${fuyi}&shenhe1=${shenhe1}&shenhe2=${shenhe2}&beigao=${beigao}" />
	<#if isxinzeng=='0'>
	<input type="hidden" id="ckpipandan" value="../xzss/editpipandan.action?funcCode=${funcCode}&xzssId=${xzssInfo.id}&viewxzss=1"/>
	<input type="hidden" id="anjuanguanli" value="../xzss/showXzssFile.action?funcCode=${funcCode}&xzssId=${xzssInfo.id}"/>
	<input type="hidden" id="logDiv" value="../xzss/showLogList.action?funcCode=${funcCode}&xzssId=${xzssInfo.id}"/>
	<input type="hidden" id="jiean" value="../xzss/viewJieAn.action?funcCode=${funcCode}&xzssId=${xzssInfo.id}&viewxzss=1"/>
	</#if>
	<div class="pageDiv" id="iframe" style="display:block">
		<iframe <#if isxinzeng=='1'>src="../xzss/xzsspipandan.action?funcCode=${funcCode}&xzfyId=${xzfyId}&xzssId=${xzssId}&shenji=${shenji}&fuyi=${fuyi}&shenhe1=${shenhe1}&shenhe2=${shenhe2}&beigao=${beigao}"</#if>
		 			<#if isxinzeng=='0'>src="../xzss/editpipandan.action?funcCode=${funcCode}&xzssId=${xzssInfo.id}&viewxzss=1"</#if>
	  	frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" id="ifm0" name="ifm0"  width="100%" height="1200px" ></iframe>
	</div>
	<script>
		var x;
		var a=document.getElementById("xzpipandan").value;
		var b=document.getElementById("ckpipandan").value;
		var c=document.getElementById("anjuanguanli").value;
		var d=document.getElementById("logDiv").value;
		var e=document.getElementById("jiean").value;
		var n=document.getElementById("ifm0");
		//var m=document.getElementById("ifm2");
		function divControl(x){
			if(x=='1')
				n.src=a;
			if(x=='2')
				n.src=b;
			if(x=='4'){
			    n.src=c;
			    document.getElementById("iframe").style.display="block";
			  }
			if(x=='5'){
			    n.src=d;
			    document.getElementById("iframe").style.display="block";
			  }
			if(x=='3'){
			    n.src=e;
			    document.getElementById("iframe").style.display="block";
			  }
		}
		function chakanXzfy(id){
    		opendg("../xzss/chakanXzfy.action?funcCode=${funcCode}&isView=0&xzfyId="+id,700,1000);
        }
        function chakanXzss(id)
        {
        	opendg("../xzss/editpipandan.action?funcCode=${funcCode}&xzssId="+id,700,1000);
        }
        function opendg(dgurl,dgw,dgh)
		{
			//alert(1111);
			$.dialog({ 
			title:'',
			width: dgw,
			height: dgh,
			content:'url:'+ dgurl});
		}
		function gotoXzss(xzssId){
		window.open("../xzss/xzssguanli.action?funcCode=${funcCode}&isxinzeng=0&xzssId="+xzssId);
		}
		function gotoXzfy(xzfyId){
		window.open("../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId="+xzfyId);
		}
		
	</script>
</form>
</div>
<span class="clear_f"></span>
<div class="h50"></div>
<!--walEnd-->
</div>
</div>

<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>

<script language="javascript">
</script>
</html>
