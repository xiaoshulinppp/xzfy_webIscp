<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>监督案件</title>


<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css" />

</head>

<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<body>
<form action="../jdaj/updateInfo.action" name="form" id="form" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control>
  <tr>
    <td height="20">您的位置：监督案件 -&gt; 监督案件管理-&gt;监督案件修改</td>
  </tr>
</table>
<!--您的位置表格结束-->
<!--标题表格开始-->
<!--标题表格结束-->
<!--主体内容、列表显示区域-->

<input type="hidden" name="funcCode" value="${funcCode}" />
<table name="form" width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
<input id="jdajId" name="jdajInfo.id" value="${jdajId}" type="hidden">
<input id="jdajId" name="jdajId" value="${jdajId}" type="hidden">
<input id="filePath" name="jdajInfo.filePath" value="<#if jdajInfo.filePath?has_content>${jdajInfo.filePath}</#if>" type="hidden">
<input id="realFilePath" name="jdajInfo.realFilePath" value="<#if jdajInfo.realFilePath?has_content>${jdajInfo.realFilePath}</#if>" type="hidden">
<input id="fileName" name="jdajInfo.fileName" value="<#if jdajInfo.fileName?has_content>${jdajInfo.fileName}</#if>" type="hidden">
<input type="hidden" name="isModify" value="${isModify}">
<input type="hidden" name="jdajInfo.state" value="<#if jdajInfo.state?has_content>${jdajInfo.state}</#if>">
<tr class="trcolor">
    <td class="tdFormText" width="25%">接收日期：</td>
    <td class="tdFormInput" width="30%">
    <input name="jdajInfo.receiveDate" type="text"
     class="inputTextNormal" id="date" value="${jdajInfo.receiveDate}" onClick="WdatePicker()" >
    </td>
    
    <td class="tdFormText">监督案件文号：</td>
	    <td class="tdFormInput">
	    <input name="jdajInfo.documentNumber" type="text" id="documentNumber" class="inputTextNormal"
	    value="<#if jdajInfo.documentNumber?has_content>${jdajInfo.documentNumber}</#if>">
	    </td>
</tr>


<tr class="trcolor">
  	<td class="tdFormText">接收材料方式：</td>
    <td class="tdFormInput">
    <select name="jdajInfo.method">
    <option value="0" <#if jdajInfo.method=="0">selected</#if>>--请选择--</option>
    <option value="1" <#if jdajInfo.method=="1">selected</#if>>当面接收</option>
    <option value="2" <#if jdajInfo.method=="2">selected</#if>>来信接收</option>
    </select>
    </td>
    <td class="tdFormText" width="25%">申请人基本信息：</td>
    <td class="tdFormInput" width="25%">
    <a href="javascript:opendg('jdaj/addApp.action?jdajId=${jdajId}&funcCode=${funcCode}&textId=apps&isModify=${isModify}',900,600)"  style="display:block" id="modifyApp">修改</a>
    <textarea name="sendValue" type="text" class="textarea" id="apps" style="width:300px;overflow-y:visible;"><#if sendValue?has_content>${sendValue}</#if></textarea>
    </td>
    </tr>	
  <tr class="trcolor">
    <td class="tdFormText" width="25%">反映内容：</td>
    <td class="tdFormInput" width="25%">
    <input name="jdajInfo.feedback" type="text"
     class="inputTextNormal" id="feedback" value="<#if jdajInfo.feedback?has_content>${jdajInfo.feedback}</#if>">
    </td>
    <td class="tdFormText">建议：</td>
	    <td class="tdFormInput">
	    <input name="jdajInfo.proposal" type="text" id="proposal" class="inputTextNormal" 
	    value="<#if jdajInfo.proposal?has_content>${jdajInfo.proposal}</#if>">
	    </td>
  </tr>
  <tr class="trcolor">
    <td class="tdFormText" width="25%">承办人：</td>
    <td class="tdFormInput" width="25%">
    <input name="jdajInfo.undertaker" type="text"
     class="inputTextNormal" id="undertaker" value="<#if jdajInfo.undertaker?has_content>${jdajInfo.undertaker}</#if>">
    </td>
    <td class="tdFormText">附件：</td>
	    <td class="tdFormInput">
	    <input name="upFile" type="file" id="upFile" class="inputTextFile" >
	    <a href="<#if jdajInfo.realFilePath?has_content>${jdajInfo.realFilePath}</#if>">
	    <#if jdajInfo.fileName?has_content>${jdajInfo.fileName}</#if></a>
	    </td>
  </tr>
</table>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td> 	   
	   <input name="Button23" id="bs" type="button" class="button" value="修改" onClick="checkForm()" >
	   <input name="Button23" type="reset" class="button" value="返回" onClick="history.back(-1)" >
	</td>
  </tr>
</table>

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