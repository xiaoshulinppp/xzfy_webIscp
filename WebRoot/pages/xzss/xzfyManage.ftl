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
	<body>

	<form name="Form1" id="Form1" action="" method="post" >
	<#if panduanGL != "1" && panduanGL != "2"  >
	<#include "../website/header.ftl">
	</#if>
		<div class="wal pageNow2">
	      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a>> 行政复议案件列表</div>
	      <div class="fr"></div>
		</div>
	
	<div class="pageBg1">
<div class="wal">

		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" name="pNum" value="${pNum}" id="pageNum">
		<input type="hidden" name="respondent" value="${respondent}" id="">
		<input type="hidden" name="caseNameBFY" value="${caseNameBFY}" id="">
		<input type="hidden" name="caseNumBFY" value="${caseNumBFY}" id="">
		<input type="hidden" name="representative" value="${representative}" id="">
		<input type="hidden" name="caseNo" value="${caseNo}" id="pageNum">
		<input type="hidden" name="undertakerSecond" value="${undertakerSecond}" id="">
		<input type="hidden" name="undertakerName" value="${undertakerName}" id="">
		<input type="hidden" name="applicant" value="${applicant}" id="">
      <div class="pageBox">
            <div class="searchList">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
					<tr>  
					<th width="4%">序号</th>
					<th width="8%">收案日期</th>
					<th width="15%">案件号</th>
					<th width="24%">被诉具体行政行为名称</th>
					<th width="25%">被诉行政行为文号</th>
					<th width="8%">复议案件承办人</th>
					<th width="8%">项目状态</th>
					<th width="8%">操作</th>
					</tr>
					<#assign account=pNum*pageSize-pageSize+1>
					<#list xzfyList as xzfyInfo>
					<tr>
					<td>${account}</td>				
					<td >&nbsp;<#if xzfyInfo.receive_date?has_content>${xzfyInfo.receive_date}</#if></td>
					<td >&nbsp;<#if xzfyInfo.tjzfzh?has_content>${xzfyInfo.tjzfzh}</#if></td>
					<td >&nbsp;<#if xzfyInfo.xwname?has_content>${xzfyInfo.xwname}</#if></td>
					<td >&nbsp;<#if xzfyInfo.xwnum?has_content>${xzfyInfo.xwnum}</#if></td>
					<td >&nbsp;<#if xzfyInfo.user2_name?has_content>${xzfyInfo.user2_name}</#if></td>
					<td >&nbsp;
					<#if xzfyInfo.status=="1">
					         立案审查
					<#elseif xzfyInfo.status=="2">
					        补正审批
					<#elseif xzfyInfo.status=="3">
					        立案审查
                    <#elseif xzfyInfo.status=="4">
						案件办理
					<#elseif xzfyInfo.status=="5">
						延期审批
					<#elseif xzfyInfo.status=="6">
						案件延期
					<#elseif xzfyInfo.status=="7">
						中止审批
					<#elseif xzfyInfo.status=="8">
						案件中止
					<#elseif xzfyInfo.status=="9">
						恢复审理审批
					<#elseif xzfyInfo.status=="10">
						恢复审理
					<#elseif xzfyInfo.status=="11">
						结案审批
					<#elseif xzfyInfo.status=="12">
						已结案
					</#if>
                    </td>
					<td >&nbsp;
					<a href="../xzss/XzssAction.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}">关联</a>
					</td>
					</tr>
					<#assign account=account+1>
					</#list>
		</table>
		            <div class="pageNum">
               第${pNum}/${totalPage}页   共${totalCount}条
					<#assign upPage = pNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>　
				<a href="javascript:goThePage(1)" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="javascript:goThePage(${upPage})" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="javascript:goThePage(${downPage})" class="ui-page-item ui-page-next">下一页</a>
			    <a href="javascript:goThePage(${totalPage})" class="ui-page-item ui-page-last">尾页</a>　
				<span>到<input class="input1"  name="gotoPageNum" id="gotoPageNum" />页</span>　<a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a>
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
	function goThePage(pNums){
	    document.getElementById("pageNum").value=pNums;
	    document.Form1.action="../xzss/dosearchxzfy.action";
		document.Form1.submit();
	}
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
				    document.getElementById("pageNum").value=inputPage;
				    document.Form1.action="../xzss/dosearchxzfy.action";
					document.Form1.submit();
					//window.location = "../xzss/dosearchxzfy.action?funcCode=${funcCode}&pNum=" + inputPage;
				}
				return;
			}
	</script>
	