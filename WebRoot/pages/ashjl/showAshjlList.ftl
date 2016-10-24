<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>案审会记录</title>
<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>
</head>
<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../sys_theme/images/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">案审会记录管理</h2>  
       <span class="ui-searchbar-btn" id="search-box-btn">
    <a href="javascript:slideToggle('#search-general')" id="searchbar-icon" class="show-search"  ></a></span></div>
<body>
<form name="form" id="form" method="post" >
<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="xzfyId" id="xzfyId" value="${xzfyId}">
	<div class="ui-search fn-clear" >
		    <div class="ui-search-general fn-clear  fn-hide" id="search-general">
		    <table id=""class="ui-table ui-table-search  "  summary="这是一个1行4列的表格样式模板">
		        <tbody class="">
		        <tr>
		          <td >时间</td>
		          <td><input class="ui-input-wdm" type="text" onClick="WdatePicker()" name="time" value="${time?default('')}"/></td>
		         <td >地点</td>
		          <td ><input class="ui-input-wdm" type="text"  name="location" value="${location?default('')}" /></td>
		         
		        </tr>
		        <tr>
		          <td >听证主持人</td>
		          <td ><input class="ui-input-wdm" type="text" name="ashHost" value="${ashHost?default('')}"  /></td>
		          <td >委员</td>
		          <td  ><input class="ui-input-wdm" type="text"  name="attendant" value="${attendant?default('')}" /></td>
		         </tr>
		          </tbody>
		         <tfoot><!--可以让按钮居中-->
		            <tr>
		           <td colspan="4"><input  class="ui-btn ui-btn-yellow" type="button" name="button" id=""  value="搜索"  title="搜索" onclick="search()"/><input class="ui-btn ui-btn-normal" type="reset" value="重置" title="重新填写"/></td>
		         </tr>
		        </tfoot>  		        
		    </table>
  		</div>  
	</div>


<span class="x-line fn-clear"><img src="../sys_theme/images/pic_search_line.png"/></span>
<input type="button" value="添加" class="ui-btn ui-btn-normal" onClick="addAshjl()"/>
<div class="ui-list-nobtnbar fn-clear ">
	<table class="ui-table  ui-table-list  list-fixed " >
	<thead class=""  id="" name="" >
<tr>  
<th>序号</th>
<th>时间</th>
<th>地点</th>
<th>听证主持人</th>
<th>委员</th>
<th>审议报告</th>
<th>评价</th>
<th>修改</th>
</tr>
</thead>
<tbody class="discolor">
<#list ashjlList as info>
<tr>
<td>&nbsp;${info_index+1}</td>
<td>&nbsp;<#if info.time?has_content>${info.time}</#if></td>
<td>&nbsp;<#if info.location?has_content>${info.location}</#if></td>
<td>&nbsp;<#if info.host?has_content>${info.host}</#if></td>
<td >&nbsp;<#if info.attendant?has_content>${info.attendant}</#if></td>
<td>&nbsp;<#if info.fileName?has_content>已上传<#else>未上传</#if></td>
<td>&nbsp;<#if info.graded=="0">未评价<#else>已评价</#if></td>
<td><a href="../ashjl/modifyAshjl.action?ashjlId=${info.id}&xzfyId=${xzfyId}&funcCode=${funcCode}"><img src="../images/15B/sicons/file_modf.gif"  width="16" height="16" border="0"></a></td>
</tr>
</#list>
</tbody>
</table>
</div>
<div class="ui-page">
<span class="ui-page-item ui-page-item-info">第${pNum}/${totalPage}页   共 ${allList.size()}条 </span>
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
        <a href ="../ashjl/showAshjlList.action?xzfyId=${xzfyId}&pNum=1&funcCode=${funcCode}" class="ui-page-item ui-page-item-first">首页</a>
        <a href ="../ashjl/showAshjlList.action?xzfyId=${xzfyId}&pNum=${upPage}&funcCode=${funcCode}" class="ui-page-item ui-page-item-prev">上一页</a>	
        <a href ="../ashjl/showAshjlList.action?xzfyId=${xzfyId}&pNum=${downPage}&funcCode=${funcCode}" class="ui-page-item ui-page-next">下一页</a>
        <a href ="../ashjl/showAshjlList.action?xzfyId=${xzfyId}&pNum=${totalPage}&funcCode=${funcCode}" class="ui-page-item ui-page-last">末页</a></span>
</div>

</form>
</body>
</html>
<script language="javascript">
			function addAshjl(){
			    document.form.action="addAshjl.action";
			    document.form.submit();               
			}
			function addTzjl(){
			    document.form.action="addTzjl.action";
			    document.form.submit();               
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
					window.location = "../ashjl/showAshjlList.action?funcCode=${funcCode}&pNum=" + inputPage + "&xzfyId=${xzfyId}";
				}
				return;
			}
			function search(){
				document.form.action="showAshjlList.action";
				document.form.submit();
			}
</script>