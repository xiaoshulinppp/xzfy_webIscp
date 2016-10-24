<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../css/style_form.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
	</head>
	<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
	<body>
		<form id="form" name="form" method="post" ENCTYPE="multipart/form-data">
		<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../sys_theme/images/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">添加听证记录</h2></span></div> 
<div class="z_info">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
			<tr>
				<th>时间</th>
				<td class="tdFormInput">
					<input type="text" name="tzjlInfo.time" class="inputTextNormal" id="time" onClick="WdatePicker()"/>
				</td>
				<th>地点</th>
				<td class="tdFormInput">
					<input type="text" name="tzjlInfo.location"  class="inputTextNormal" id="location"/>
				</td>
			</tr>
			<tr class="trwhite">
				<th>主持人</th>
				<td class="tdFormInput">
					<input type="text" name="tzjlInfo.host" class="inputTextNormal" />
				</td>
				<th>参加人</th>
				<td class="tdFormInput">
				<input type="text" name="tzjlInfo.attendant" id="address" class="inputTextNormal" />
				</td>
				
			</tr>
        <tr>
		<th>上传听证记录：</th>
	    <td class="tdFormInput">
	    <input name="upFile" type="file" id="upFile" class="inputTextFile">
	    </td>
	    <th></th>
	    <td></td>
	    </tr>
</table>
</div>
	<div class="align-center">
		<a href="#" class="btn-blue btn" onClick="checkForm()" />提交</a>
	    <a href="#" class="btn-blue btn" onClick="gotoList()">返回</a>
			<input type="hidden" name="xzfyId" value="${xzfyId}" />
			<input type="hidden" name="tzjlInfo.xzfyId" value="${xzfyId}" />
			<input type="hidden" name="funcCode" value="${funcCode}"/>
</div>
		</form>
	</body>
</html>
<script type="text/javascript">
	function checkForm(){
	    if(confirm("确认提交？")){
	    	document.form.action="saveTzjlInfo.action";
			document.form.submit();
		}
	}
	function gotoList(){
		document.form.action="tzjlInfoList.action";
		document.form.submit();
	}
</script>