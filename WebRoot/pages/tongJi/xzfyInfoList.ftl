<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
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
<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>

<body   onload="startTime()">

<form name="Form1" id="Form1" action="../tongJi/xzfyInfoList.action" method="post">

<#include "../website/header.ftl">

<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a>--统计查询</div>
      <div class="fr"></div>
</div>

<div class="pageBg1">
	<div class="wal">
	<input type="hidden" name="funcCode" value="${funcCode}">
	<input type="hidden" name="pageNum" value="${pageNum}" id="pageNum">
	<#--<input type="hidden" name="appName" value="${appName}" id="appName">-->
	<input type="hidden" name="xwName" value="${xwName}" id="xwName">
	<input type="hidden" name="xwNum" value="${xwNum}" id="xwNum">
	<input type="hidden" name="defendantName" value="${defendantName}" id="defendantName">
    <div class="pageBox">
    	<div class="searchList">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
            	<tr>
                	<th width="5%">序号</th>
                     <th width="10%">复议机关</th>
                    <th width="8%">收案日期</th>
                    <th width="10%">申请人名称</th>
                    <th width="15%">具体行政行为名称</th>
                    <th width="15%">具体行政行为文号</th>
                    <th width="15%">被申请人名称</th>
                    <th width="6%">案件状态</th>
                    <th width="5%">查看</th>
                </tr>
				<#assign account=1>
				<#list xzfyInfoList as xzfyInfo>
				<tr>
					<td>${account}</td><#assign account= account+1>
					<td>&nbsp;${xzfyInfo.break_right?default('')}</td>
					<td>&nbsp;${xzfyInfo.receive_date?default('')}</td>
					<td>&nbsp;${xzfyInfo.app_show?default('')}</td>
					<td>&nbsp;${xzfyInfo.xwname?default('')}</td>
					<td>&nbsp;${xzfyInfo.xwnum?default('')}</td>
					<td>&nbsp;${xzfyInfo.defendant_name?default('')}</td>
					<td>&nbsp;<#if xzfyInfo.status?number<12>未办结<#else>已结案</#if></td>
					
					<td><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${xzfyInfo.id}" target="_blank">查看</a></td>
				</tr>
				</#list>
			</table>
      <div class="pageNum">
           共${xzfyInfoList.size()}条
	
            </div>
            </div>
      </div>
      <div class="pageBoxBg"></div>
</div>
</div>
</form>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>
</html>

<script>	
	function goPage(pNum){		
		document.getElementById("pageNum").value=pNum;
		document.Form1.submit();
	}
		
	function gotoPage(){
		var inputPage = window.document.getElementById("gotoPageNum").value;
		if(!inputPage.match("[\\d+]+")){
			alert("页数必须为整数！");
			return;
		}else{
			for(var i=0;i<inputPage.length;i++){
				if(inputPage.charCodeAt(i)>57 || inputPage.charCodeAt(i)<48){
					alert("页数必须为整数！");
					return;
				}
			}
		}
		if(inputPage > ${totalPage}){
			alert("输入的页数不能超过总页数！");
		}else if(inputPage < 1){
			alert("输入的页数不能少于1页！");
		}else{
			
		}
		return;
	}
	</script>