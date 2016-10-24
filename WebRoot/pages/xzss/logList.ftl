<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>已办理案件列表</title>


<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>
</head>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<body>
<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../sys_theme/images/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">修改日志 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        -- 共${totalCount}条</h2>  
 

<span class="x-line fn-clear"><img src="../sys_theme/images/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->

<!--主体内容、列表显示区域。注意上边的区域定义必须保持-->
<div class="ui-list-nobtnbar fn-clear ">
	<table class="ui-table  ui-table-list  list-fixed " >
	<thead class=""  id="" name="" >
	<tr>  
	<th width="10%">序号</th>
	<th width="20%">修改日期</th>
	<th width="20%">修改人</th>
	<th width="45%">修改内容</th>
	</tr>
	</thead>
	<#assign info_index=0>
	<tbody class="discolor">
	<#list logList as info>
	<tr>
		<td>&nbsp;${info_index+1}</td>
    	<td>&nbsp;<#if info.getLog_time()?has_content>${info.getLog_time()}</#if></td>
		<td>&nbsp;<#if info.getUpdate_name()?has_content>${info.getUpdate_name()}</#if></td>
		<td>&nbsp;<#if info.getLog_info()?has_content>${info.getLog_info()}</#if></td>
	</tr>
</#list>
</tbody>

</table>

</div>

<div class="ui-page">
		
		<span class="ui-page-item ui-item-link">
		<!--
		 <a href ="javascript:history.back()" class="ui-page-item ui-page-item-prev">返回</a>	
		 -->
		 </span>

</div>

</form>
</body>
</html>
