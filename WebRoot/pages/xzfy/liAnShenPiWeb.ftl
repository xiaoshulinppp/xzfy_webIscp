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
</head>

<body>
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
<#assign sdResult=xzfyInfo.stadardResult?default('0')>
      <div class="sideNav">
            <div class="title">请选择栏目</div>
            <ul>
            
                <li><a href="javascript:;">接待信息</a></li>
                
                 <li><a href="javascript:;" >
               	案件信息
               </a></li>
                

                  	<#if xzfyInfo.status=="2">
                  		<li><a href="javascript:;" class="aNow">补正审批</a></li>
                  	</#if>
                  	<#if xzfyInfo.status=="3">
                  		<li><a href="javascript:;" class="aNow">立案审批</a></li>
                  	</#if>    
                  	<#if xzfyInfo.status=="5">
                  		<li><a href="javascript:;" class="aNow">延期审批</a></li>
                  	</#if> 
                  	<#if xzfyInfo.status=="7">
                  		<li><a href="javascript:;" class="aNow">中止审批</a></li>
                  	</#if> 
                  	<#if xzfyInfo.status=="9">
                  		<li><a href="javascript:;" class="aNow">恢复审理审批</a></li>
                  	</#if> 
                  	<#if xzfyInfo.status=="11" && sdResult=='1'>
                  		<li><a href="javascript:;" class="aNow">结案审批</a></li>
                  	</#if>  
                  	<#if xzfyInfo.status=="11" && sdResult=='2'>
                  		<li><a href="javascript:;" class="aNow">告知处理</a></li>
                  	</#if>   
                  	<#if xzfyInfo.status=="11" && sdResult=='3'>
                  		<li><a href="javascript:;" class="aNow">不予受理</a></li>
                  	</#if>   
                  	<#if xzfyInfo.status=="11" && sdResult=='5'>
                  		<li><a href="javascript:;" class="aNow">其他处理</a></li>
                  	</#if> 
                  	<li><a href="javascript:;" >案卷管理</a></li>
                  	  <li><a href="javascript:;" >
               	操作记录
               </a></li>
            </ul>
      </div>

</div>

<script>

	
</script>
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<div class="fr w739">
      <div class="pageNow">
当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;  <a href="../banan/showanjianbanliList.action?listkeyword=${listkeyword}&funcCode=${funcCode}">待办案件</a>  >&nbsp;&nbsp; 案件审批
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="短信平台" onclick="getMsg()" style="display:block; width:77px; height:27px;background: url('../images/sideNavBg.gif');line-height:27px; text-align:center; border:#eeeded solid 1px;float:right;margin-right:16px;"/>
	  
      </div>
	  	  <script>
		function getMsg(){
			window.open('/xzfy/ssoServlet?LinkID=mhsms&LinkType=online')
		}
	  </script>	  
	  
      
<div class="pageDiv" >
		
			<iframe src="../xzfy/viewXzfyInfo.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}" 
  		 	frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" id="ifm1" name="ifm1"  width="100%" height="1200px" ></iframe>
		  	
			
		
	</div>
	

 <div class="pageDiv"  <#if xzfyInfo.status=="1">style="display:block" <#else>style="display:none"</#if>>
      <iframe frameborder="0"  height="1650px"   scrolling="no" 
       width="100%" src="../xzfy/editlian.action?funcCode=${funcCode}&xzfyId=${xzfyId}&listkeyword=${listkeyword}&isView=0"></iframe>
	  </div>	

	  

 
 
   
 

	<#assign sdResult=xzfyInfo.stadardResult?default('0')>
<#if xzfyInfo.status=="2" || xzfyInfo.status=="3" || (xzfyInfo.status=="11" && sdResult?number gt 1)>
<div class="pageDiv" style="display:block">
		
				<iframe src="../xzfy/anjianShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&checkDocType=${xzfyInfo.status}&listkeyword=${listkeyword}&pNum=${pNum}" 
  		 	frameborder="0" scrolling="no" id="ifm1" name="ifm1"  width="100%" height="1590px" ></iframe>
		  	
			
		
	</div>
<#else>
 <div class="pageDiv" style="display:block">
		
			<iframe src="../xzfy/bananShenpi.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&checkDocType=${xzfyInfo.status}&listkeyword=${listkeyword}&pNum=${pNum}" 
  		 	frameborder="0" scrolling="no" id="ifm1" name="ifm1"  width="100%" height="1590px" ></iframe>
		  	
			
		
	</div>
 </#if>
 <div class="pageDiv"  style="display:none">
      <iframe frameborder="0"  height="1650px"   scrolling="no" 
       width="100%" src="../archive/showArchiveList.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}&isView=1&pNum=${pNum}"></iframe>
	  </div>
  <div class="pageDiv"  style="display:none">
      <iframe frameborder="0"  height="1650px"   scrolling="no" 
       width="100%" src="../xzfy/showLogList.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}&listkeyword=${listkeyword}"></iframe>
	  </div>	

            <!---->
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


	}
</script>
</html>
