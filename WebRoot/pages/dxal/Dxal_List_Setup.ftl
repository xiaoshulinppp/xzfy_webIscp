<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>典型案例列表</title>
<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>
</head>
<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../sys_theme/images/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">待设置典型案例列表</h2>  
       <span class="ui-searchbar-btn" id="search-box-btn">
    <a href="javascript:slideToggle('#search-general')" id="searchbar-icon" class="show-search"  ></a></span></div>
<body>
<form name="form" id="form" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->
<input type="hidden" name="funcCode" value="${funcCode}" />
<!--主体内容、列表显示区域。注意上边的区域定义必须保持-->
<input type="hidden" name="pNum" id="pNum" value="${pNum}" />
<div class="ui-search fn-clear" >
		    <div class="ui-search-general fn-clear  fn-hide" id="search-general">
		    <table id=""class="ui-table ui-table-search  "  summary="这是一个1行4列的表格样式模板">
		        <tbody class="">
		        <tr>
		          <td >案例标题</td>
		          <td><input class="ui-input-wdm" type="text" name="title" value="${title?default('')}"/></td>
		          <td >报送人</td>
		          <td ><input class="ui-input-wdm" type="text" name="name" value="${name?default('')}"  /></td>
		        <tr>
		          <td >报送单位</td>
		          <td  ><input class="ui-input-wdm" type="text" name="department" value="${department?default('')}" /></td>
		          <td >报送时间</td>
		          <td ><input class="ui-input-wdm" type="text" name="todate" onClick="WdatePicker()" value="${todate?default('')}"  /></td>
		         </tr>
		          </tbody>
		         <tfoot><!--可以让按钮居中-->
		            <tr>
		           <td colspan="4"><input  class="ui-btn ui-btn-yellow" type="button" name="button" id=""  value="搜索"  title="搜索" onclick="search(1)"/><input class="ui-btn ui-btn-normal" type="reset" value="重置" title="重新填写"/></td>
		         </tr>
		        </tfoot>  		        
		    </table>
  		</div>  
	</div>
<span class="x-line fn-clear"><img src="../sys_theme/images/pic_search_line.png"/></span>
<div class="ui-list-nobtnbar fn-clear ">
<table class="ui-table  ui-table-list  list-fixed " >
<tr>  
<th class="thListNormal">序号</th>
<th class="thListNormal">案例标题</th>
<th class="thListNormal">案例类型</th>
<th class="thListNormal">报送人</th>
<th class="thListNormal">报送单位</th>
<th class="thListNormal">报送时间</th>
<th class="thListNormal">查看</th>
<th class="thListNormal">设置</th>
</tr>
<#list dxalList as dxal>
<tr class="trcolor">
<td class="tdlistCenter" >&nbsp;${dxal_index+1}</td>
<td class="tdlistCenter" >&nbsp;<#if dxal.title?has_content>${dxal.title}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if dxal.case_type?has_content>${dxal.case_type}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if dxal.submitter?has_content>${dxal.submitter}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if dxal.department?has_content>${dxal.department}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if dxal.submit_date?has_content>${dxal.submit_date}</#if></td>

<td class="tdlistCenter"><a href="../dxal/dxal_ViewSetup.action?id=${dxal.id}&funcCode=${funcCode}"><img src="../images/15B/sicons/search.gif"  width="16" height="16" border="0"></a></td>
<td class="tdlistCenter"><a href="../dxal/dxal_Setupdate.action?id=${dxal.id}&funcCode=${funcCode}"><img src="../images/15B/sicons/file_modf.gif"  width="16" height="16" border="0"></a></td>
</tr>
</#list>
</table>
</div>
<div class="ui-page">
	<span class="ui-page-item ui-page-item-info">第${pNum}/${totalPage}页   共 ${pageList.getTotalCount()}条 </span>
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
				document.form.action="dxal_Setup.action"
				document.form.submit();
			}
</script> 



