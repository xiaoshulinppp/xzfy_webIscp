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

<body>
<#include "../website/header.ftl">

<div class="wal">
<div class="pageBg">
<!--wal-->
<div class="fl w198">

      <div class="sideNav">
            <div class="title">请选择栏目</div>
            <ul>
                <li><a href="" class="aNow">修改案件信息</a></li>
          
            </ul>
      </div>
      <div class="sideTip">
           
      </div>
</div>

<div class="fr w739">
      <div class="pageNow">
当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;   案件信息
      
      </div>
<div class="pageDiv" style="display:block">
		
			
		<iframe frameborder="0"  height="1650px"   scrolling="no" id="ifm1"
       width="100%" src="../xzfy/updatelian.action?funcCode=${funcCode}&xzfyId=${xzfyId}&isView=1"></iframe>
		  	
			
	</div>
 
 
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
