<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>代办理案件列表</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
<!-- 组件template -->
</head>

<body onload="startTime()">
<#include "../website/header.ftl">
<form action="''" name="form" id="form" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->
<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="userLocbm" value="${userLocbm}" />
<input type="hidden" name="pNum" id="pNum"/>
<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="">待办理案件查询</a></div>
</div>
<div class="pageBg1">
	<div class="wal">
    	<div id="searchForm">
    		<div class="pageBox">
            	<div class="searchForm">
            		<ul>
		            	<li>
				        	<div class="name">立案日期</div>
				          	<input class="input1" type="text" onClick="WdatePicker()" name="liAnDate" value="${liAnDate?default('')}"/>
				        </li>
				        <li>
				        	<div class="name">申请人</div>
				            <input class="input1" type="text"  name="appName" value="${appName?default('')}" />
				        </li>
				        <li>
				        	<div class="name">被申请人</div>
				        	<input class="input1" type="text"  name="defendant" value="${defendant?default('')}" />
				        </li>
				        <li>
				          <div class="name">案号</div>
				          <input class="input1" type="text" name="tjzfzh" value="${tjzfzh?default('')}"  />
				        </li>
				        <li>
				        	<div class="name">承办人</div>
				            <input class="input1" type="text"  name="admit" value="${admit?default('')}" />
				        </li>
		        	</ul>
		    		<span class="clear_f"></span>
                    <div class="btnDiv">
                    	<input type="button" class="btn1" / value="搜索">
                    	<input type="button" class="btn1 btn2" / value="重置">
                    </div>
				</div>
      		</div>
			<div class="pageBoxBg"></div>
		</div>
        <div class="pageBox">
        	<div class="searchList">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>  
						<th width="5%">序号</th>
						<th width="12%">复议机关</th>
						<th width="8%">立案日期</th>
						<th width="15%">申请人</th>
						<th width="15%">被申请人</th>
						<th width="15%">具体行政行为</th>
						<th width="12%">文号</th>
						<th width="8%">承办人</th>
						<th width="5%">查看</th>
						<th width="5%">办理</th>
					</tr>
					<#list infoList as info>
					<tr>
						<td>&nbsp;${info_index+1}</td>
						<td>&nbsp;<#if info.break_right?has_content>${info.break_right}</#if></td>
						<td>&nbsp;<#if info.lian_date?has_content>${info.lian_date}</#if></td>
						<td>&nbsp;<#if info.app_show?has_content>${info.app_show}</#if></td>
						<td>&nbsp;<#if info.defendant_name?has_content>${info.defendant_name}</#if></td>
						<td>&nbsp;<#if info.xwname?has_content>${info.xwname}</#if></td>
						<td>&nbsp;<#if info.xwnum?has_content>${info.xwnum}</#if></td>
						<td>&nbsp;<#if info.user2_name?has_content>${info.user2_name}</#if><#if info.user3_name?has_content>、${info.user3_name}</#if></td>
						<td><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${info.id}" target="_blank" ><font color="green">查看</font></a></td>
						<td><a href="../bsqr/showXzfyInfo.action?funcCode=${funcCode}&xzfyId=${info.id}&userLocbm=${userLocbm}" target="_blank"><img src="../images/15B/sicons/file_modf.gif"  width="16" height="16" border="0"></a></td>
					</tr>
					</#list>
				</table>
				<div class="pageNum">
					<#assign upPage = pNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>
					共有${pageList.getTotalCount()}条<a href ="javascript:search(${upPage})" class="ui-page-item ui-page-item-prev">上一页</a>
					<a href ="javascript:search(${downPage})" class="ui-page-item ui-page-next">下一页</a>
					<span>第<input class="input1"   name="gotoPageNum" id="gotoPageNum" />页<a href="#" onclick="gotoPage()">跳转</a></span>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>
</html>
<script language="javascript">
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
					search(inputPage);
				}
				return;
			}
			function search(pNum){
				document.getElementById("pNum").value=pNum;
				document.form.action="showList.action"
				document.form.submit();
			}
			function clear(){
				document.getElementById("liAnDate").value="";
				document.getElementById("appName").value="";
				document.getElementById("defendant").value="";
				document.getElementById("tjzfzh").value="";
				document.getElementById("admit").value="";
			}
</script>