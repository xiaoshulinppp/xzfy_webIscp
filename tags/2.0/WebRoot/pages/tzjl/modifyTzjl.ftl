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
      <h2 class="ui-title-cnt fn-left">修改听证记录</h2></span></div> 
<div class="z_info"> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
			<tr>
				<th>时间</th>
				<td class="tdFormInput">
					<input type="text" name="tzjlInfo.time" value="<#if tzjlInfo.time?has_content>${tzjlInfo.time}</#if>" class="inputTextNormal" id="time" onClick="WdatePicker()"/>
				</td>
				<th>地点</th>
				<td class="tdFormInput">
					<input type="text" name="tzjlInfo.location"  class="inputTextNormal" value="<#if tzjlInfo.location?has_content>${tzjlInfo.location}</#if>"/>
				</td>
			</tr>
			<tr class="trwhite">
				<th>主持人</th>
				<td class="tdFormInput">
					<input type="text" name="tzjlInfo.host" class="inputTextNormal" 
					value="<#if tzjlInfo.host?has_content>${tzjlInfo.host}</#if>"/>
				</td>
				<th>参加人</th>
				<td class="tdFormInput">
				<input type="text" name="tzjlInfo.attendant" id="address" class="inputTextNormal" 
				value="<#if tzjlInfo.attendant?has_content>${tzjlInfo.attendant}</#if>"/>
				</td>
				
			</tr>
        <tr>
		<th>上传听证记录：</th>
	    <td class="tdFormInput">
	    <input name="upFile" type="file" id="upFile" class="inputTextFile">
	    </td>
	    </tr>
	    	<input type="hidden" name="xzfyId" value="${xzfyId}" />
	    	<input type="hidden" name="tzjlInfo.id" value="${tzjlInfo.id}" />
			<input type="hidden" name="funcCode" value="${funcCode}"/>
			<input type="hidden" name="tzjlInfo.filePath" value="<#if tzjlInfo.filePath?has_content>${tzjlInfo.filePath}</#if>" />
			<input type="hidden" name="tzjlInfo.realFilePath" value="<#if tzjlInfo.realFilePath?has_content>${tzjlInfo.realFilePath}</#if>" />
			<input type="hidden" name="tzjlInfo.fileName" value="<#if tzjlInfo.fileName?has_content>${tzjlInfo.fileName}</#if>" />
			<input type="hidden" name="tzjlInfo.hasAttachment" value="${tzjlInfo.hasAttachment}" />
			<input type="hidden" name="hasAttachment" value="${tzjlInfo.hasAttachment}" />
			<input type="hidden" name="tzjlInfo.xzfyId" value="${tzjlInfo.xzfyId}" />
		</table>
		</div>
		<div class="align-center">
		<a href="#" class="btn-blue btn" onClick="checkForm()" />修改</a>
	    <a href="#" class="btn-blue btn" onClick="gotoList()">返回</a>
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