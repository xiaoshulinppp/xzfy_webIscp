<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>监督案件</title>
<link href="../css/style_form.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>

</head>

<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<body>
<form action="../jdaj/updateInfo.action" name="form" id="form" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->
<div class="ui-title fn-clear">
      <h1 class="ui-title-cnt fn-left">录入典型案例</h1></div> 
<!--您的位置表格结束-->
<!--标题表格开始-->
<!--标题表格结束-->
<!--主体内容、列表显示区域-->

<input type="hidden" name="funcCode" value="${funcCode}" />
<input id="jdajId" name="jdajInfo.id" value="${jdajId}" type="hidden">
<input id="jdajId" name="jdajId" value="${jdajId}" type="hidden">
<input id="filePath" name="jdajInfo.filePath" value="<#if jdajInfo.filePath?has_content>${jdajInfo.filePath}</#if>" type="hidden">
<input id="realFilePath" name="jdajInfo.realFilePath" value="<#if jdajInfo.realFilePath?has_content>${jdajInfo.realFilePath}</#if>" type="hidden">
<input id="fileName" name="jdajInfo.fileName" value="<#if jdajInfo.fileName?has_content>${jdajInfo.fileName}</#if>" type="hidden">
<input type="hidden" name="isModify" value="${isModify}">
<input type="hidden" name="jdajInfo.state" value="<#if jdajInfo.state?has_content>${jdajInfo.state}</#if>">
<div class="z_info"> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
<tr>
    <th>接收日期：</th>
    <td>
    <input name="jdajInfo.receiveDate" type="text"
     class="inputTextNormal" id="date" value="${jdajInfo.receiveDate}" onClick="WdatePicker()" >
    </td>
    
    <th>监督案件文号：</th>
	    <td>
	    <input name="jdajInfo.documentNumber" type="text" id="documentNumber" class="inputTextNormal"
	    value="<#if jdajInfo.documentNumber?has_content>${jdajInfo.documentNumber}</#if>">
	    </td>
</tr>


<tr>
  	<th>接收材料方式：</th>
    <td>
    <select name="jdajInfo.method">
    <option value="0" <#if jdajInfo.method=="0">selected</#if>>--请选择--</option>
    <option value="1" <#if jdajInfo.method=="1">selected</#if>>当面接收</option>
    <option value="2" <#if jdajInfo.method=="2">selected</#if>>来信接收</option>
    </select>
    </td>
    <th>申请人基本信息：</th>
    <td>
    <a href="javascript:opendg('jdaj/addApp.action?jdajId=${jdajId}&funcCode=${funcCode}&textId=apps&isModify=${isModify}',900,600)"  style="display:block" id="modifyApp">修改</a>
    <textarea name="sendValue" type="text" class="textarea" id="apps" style="width:300px;overflow-y:visible;"><#if sendValue?has_content>${sendValue}</#if></textarea>
    </td>
    </tr>	
  <tr>
    <th>反映内容：</th>
    <td>
    <input name="jdajInfo.feedback" type="text"
     class="inputTextNormal" id="feedback" value="<#if jdajInfo.feedback?has_content>${jdajInfo.feedback}</#if>">
    </td>
    <th>建议：</th>
	    <td>
	    <input name="jdajInfo.proposal" type="text" id="proposal" class="inputTextNormal" 
	    value="<#if jdajInfo.proposal?has_content>${jdajInfo.proposal}</#if>">
	    </td>
  </tr>
  <tr>
    <th>承办人：</th>
    <td>
    <input name="jdajInfo.undertaker" type="text"
     class="inputTextNormal" id="undertaker" value="<#if jdajInfo.undertaker?has_content>${jdajInfo.undertaker}</#if>">
    </td>
    <th>附件：</th>
	    <td>
	    <input name="upFile" type="file" id="upFile" class="inputTextFile" >
	    <a href="<#if jdajInfo.realFilePath?has_content>${jdajInfo.realFilePath}</#if>">
	    <#if jdajInfo.fileName?has_content>${jdajInfo.fileName}</#if></a>
	    </td>
  </tr>
</table>
</div>

	   
	   <div class="align-center">	   
	   <input name="Button23" id="bs" type="button" class="button" value="修改" onClick="checkForm()" >
	   <input name="Button23" type="reset" class="button" value="返回" onClick="history.back(-1)" >
		</div>

</form>
</body>

<script>
function opendg(dgurl,dgw,dgh)
{
  $.dialog({ 
    title:'申请人管理',
    width: dgw,
    height: dgh,
    content:'url:'+ dgurl});
}
function checkForm(){
	if(confirm("确定要修改吗?")){
	document.getElementById("bs").disabled=true;
		document.form.submit();
		}
}
</script>

<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>

</html>