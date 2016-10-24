<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title></title>
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
      <h2 class="ui-title-cnt fn-left">我的工作提醒</h2>  
       <span class="ui-searchbar-btn" id="search-box-btn">
    <a href="javascript:slideToggle('#search-general')" id="searchbar-icon" class="show-search"  ></a></span></div>  
<form name="form" id="form" method="post" ENCTYPE="multipart/form-data">
<div class="ui-search fn-clear" >
		    <div class="ui-search-general fn-clear  fn-hide" id="search-general">
		    <table id=""class="ui-table ui-table-search  "  summary="这是一个1行4列的表格样式模板">
		        <tbody class="">
		        <tr>
		          <td >日期</td>
		          <td><input class="ui-input-wdm" type="text" onClick="WdatePicker()" name="scheduleDate" id="scheduleDate" /></td>
		         <td >标题</td>
		          <td ><input class="ui-input-wdm" type="text"  name="title" id="title" /></td>		         
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
<input type="hidden" name="funcCode" value="${funcCode}" />
<span class="x-line fn-clear"><img src="../sys_theme/images/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
<input type="button" value="添加" class="ui-btn ui-btn-yellow" onClick="gotoCreate()"/>
<!--主体内容、列表显示区域。注意上边的区域定义必须保持-->
<div class="ui-list-nobtnbar fn-clear ">
	<table class="ui-table  ui-table-list  list-fixed " >
	<thead class=""  id="" name="" >
	<tr>  
	<th >序号</th>
	<th >日期</th>
	<th >标题</th>
	<th >查看/修改</th>
	<th >删除</th>
	</tr>
	</thead>
	<tbody class="discolor">
	<#list scheduleList as info>
	<tr>
		<td>&nbsp;${info_index+1}</td>
    	<td>&nbsp;${info.scheduleDate?default('')}</td>
		<td>&nbsp;${info.title?default('')}</td>
		<td><a href="../schedule/modifySchedule.action?funcCode=${funcCode}&id=${info.id}"><img src="../images/15B/sicons/file_modf.gif"  width="16" height="16" border="0"></a></td>
		<td><a href="../schedule/deleteSchedule.action?funcCode=${funcCode}&id=${info.id}"><img src="../images/15B/sicons/file_del.gif"  width="16" height="16" border="0"></a></td>
	</tr>
</#list>
</tbody>

</table>

</div>

</form>
</body>
<script language="javascript">
			function opendg(dgurl,dgw,dgh)
			{
  				$.dialog({ 
    			title:'行程',
    			width: dgw,
    			height: dgh,
    			content:'url:'+ dgurl});
			}
			function search(){
				document.form.action="showScheduleList.action"
				document.form.submit();
			}
			function gotoCreate(){
				document.form.action="gotoCreate.action"
				document.form.submit();
			}
</script>
<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
</html>