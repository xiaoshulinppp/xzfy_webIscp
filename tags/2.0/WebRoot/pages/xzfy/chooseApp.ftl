<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>选择申请人</title>
		<link href="../css/style_form.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="z_info_table">
		<tr>
		  <th>选择要确认申请人</td>
		  <td> 
		    <select name="app"  id="app"  retSelect="1">
			  <option value="0">----请选择----</option>
			  <#list appList as data>
	    	  <option value="${data.id}">${data.app_name}</option>
			  </#list>	
	  		</select>
	     </td>
		<tr>
		</table>
		<br>
		<div class="align-center">
<a href="#" title="送达地址确认单" class="btn-blue btn" onclick="javascript:save()">生成</a>
<a href="#" title="返回" class="btn-blue btn" onclick="javascript:close1()">关闭</a>
</div>
</form>
</body>

	<SCRIPT LANGUAGE="JavaScript">
	function save(){
	
	}
	
	function close1(){
	if  (confirm("您确定要关闭本页吗？")){
		parent.window.opener = null;  

    parent.window.open("", "_self");  

     parent.window.close();  

		}
	}
	</script>
	