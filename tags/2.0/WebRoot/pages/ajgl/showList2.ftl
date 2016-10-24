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
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../sys_theme/images/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">已上传案卷信息案件列表</h2>  
       <span class="ui-searchbar-btn" id="search-box-btn">
    <a href="javascript:slideToggle('#search-general')" id="searchbar-icon" class="show-search"  ></a></span></div>  
<form name="form" id="form" method="post" ENCTYPE="multipart/form-data">
<div class="ui-search fn-clear" >
		    <div class="ui-search-general fn-clear  fn-hide" id="search-general">
		    <table id=""class="ui-table ui-table-search  "  summary="这是一个1行4列的表格样式模板">
		        <tbody class="">
		        <tr>
		          <td align="right">立案日期</td>
		          <td><input class="ui-input-wdm" type="text" onClick="WdatePicker()" name="liAnDate" id="liAnDate" value="${liAnDate?default('')}"/></td>
		         <td align="right">申请人</td>
		          <td ><input class="ui-input-wdm" type="text"  name="appName" id="appName" value="${appName?default('')}" /></td>
		         
		        </tr>
		        <tr>
		        <td align="right">被申请人</td>
		        <td ><input class="ui-input-wdm" type="text" name="defendant" id="defendant" value="${defendant?default('')}"  /></td>
		          <td align="right">案号</td>
		          <td ><input class="ui-input-wdm" type="text" name="tjzfzh" id="tjzfzh" value="${tjzfzh?default('')}"  /></td>
		          </tr>
		          <tr>
		          <td align="right">承办人</td>
		          <td  ><input class="ui-input-wdm" type="text"  name="admit" id="admit" value="${admit?default('')}" /></td>
		        <td align="right">案卷状态</td>
		        <td ><select name="xzfyInfo.status">
		        <option nalue=12 >未上传</option>
		        <option nalue=13>已上传</option></select></td>
		         </tr>
		          </tbody>
		         <tfoot><!--可以让按钮居中-->
		            <tr>
		           <td colspan="4"><input  class="ui-btn ui-btn-yellow" type="button" name="button" id=""  value="搜索"  title="搜索" onclick="search(1)"/><input class="ui-btn ui-btn-normal" type="button" value="重置" title="重新填写" onClick="clear()"/></td>
		         </tr>
		        </tfoot>  		        
		    </table>
  		</div>  
	</div>


<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="pNum" id="pNum" value="${pNum}" />
<span class="x-line fn-clear"><img src="../sys_theme/images/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->



<div class="ui-list-nobtnbar fn-clear ">
	<table class="ui-table  ui-table-list  list-fixed " >
	<thead class=""  id="" name="" >
<tr>  
<th >序号</th>
<th>立案日期</th>
<th>申请人</th>
<th>被申请人</th>
<th>案号</th>
<th>承办人</th>
<th>案件状态</th>
<th>案卷维护</th>
<th>查看</th>
</tr>
</thead>
	<tbody class="discolor">
<#list infoList as info>
<tr>
<td >&nbsp;${info_index+1}</td>
<td>&nbsp;<#if info.lian_date?has_content>${info.lian_date}<#else>${info.receive_date?default('')}</#if></td>
<td >&nbsp;<#if info.app_show?has_content>${info.app_show}</#if></td>
<td >&nbsp;<#if info.defendant_name?has_content>${info.defendant_name}</#if></td>
<td>&nbsp;<#if info.tjzfzh?has_content>${info.tjzfzh}</#if></td>
<td>&nbsp;<#if info.user2_name?has_content>${info.user2_name}<#else>${info.user1_name?default('')}</#if></td>
<td>&nbsp;案卷已上传</td>
<td><a href="../ajgl/viewAttachment.action?funcCode=${funcCode}&xzfyId=${info.id}"><img src="../images/15B/sicons/file_modf.gif"  width="16" height="16" border="0"></a></td>
<td><a href="../ajgl/appAnjuView.action?funcCode=${funcCode}&xzfyId=${info.id}">查看案件</a></td>
</tr>
</#list>
</tbody>
</table>
</div>

<div class="ui-page">

        <span class="ui-page-item ui-page-item-info">第${pNum}/${totalPage}页    共${allList.size()}条 </span>
         			<#assign upPage = pNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>
		<span class="ui-page-item ui-page-item-go"> <h4>到</h4><input class="input-page"   name="gotoPageNum" id="gotoPageNum" /><a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a></span>			
		<span class="ui-page-item ui-item-link">
       <a href ="javascript:search(1)" class="ui-page-item ui-page-item-first">首页</a>
        <a href ="javascript:search(${upPage})" class="ui-page-item ui-page-item-prev">上一页</a>	
        <a href ="javascript:search(${downPage})" class="ui-page-item ui-page-next" >下一页</a>
        <a href ="javascript:search(${totalPage})" class="ui-page-item ui-page-last">末页</a></span>
</div>

</form>
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
				document.form.action="showList2.action"
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