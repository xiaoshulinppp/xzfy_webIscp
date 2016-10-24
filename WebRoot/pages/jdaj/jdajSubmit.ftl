<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>监督案件</title>
<link href="../css/style_form.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
</head>

<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<body>
<form name="form1" id="form" method="post" ENCTYPE="multipart/form-data">
<input type="hidden" name="funcCode" value="${funcCode}" />
<input id="jdajId" name="jdajInfo.id" value="${jdajId}" type="hidden">
<input id="jdajId" name="jdajId" value="${jdajId}" type="hidden">
<input type="hidden" name="isModify" value="${isModify}">
<input type="hidden" name="jdajInfo.state" value=${state?default('')}>
<div class="ui-title fn-clear">
      <h1 class="ui-title-cnt fn-left">监督案件信息录入</h1></div>  
<div class="z_info"> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
	<tr>
    <th>接收日期：</th>
    <td>
    <input name="jdajInfo.receiveDate" type="text"
     class="inputTextNormal" id="date" value="${todate}" onClick="WdatePicker()" >
    </td>
    
    <th>监督案件文号：</th>
	    <td>
	    <input name="jdajInfo.documentNumber" type="text" id="documentNumber" class="inputTextNormal">
	    </td>
</tr>


<tr>
  	<th>接收材料方式：</th>
    <td>
    <select name="jdajInfo.method">
    <option value="0">--请选择--</option>
    <option value="1">当面接收</option>
    <option value="2">来信接收</option>
    </select>
    </td>
    <th>申请人基本信息：</th>
    <td>
    <a href="javascript:opendg('jdaj/addApp.action?jdajId=${jdajId}&funcCode=${funcCode}&textId=apps&isModify=${isModify}',900,600)"  style="display:block" id="addApp">添加</a>
    <textarea name="sendValue" type="text" class="textarea" id="apps" style="width:300px;overflow-y:visible;"></textarea>
    </td>
  </tr>	
  <tr>
    <th>反映内容：</th>
    <td>
    <input name="jdajInfo.feedback" type="text"
     class="inputTextNormal" id="feedback" style="width:300px;overflow-y:visible;">
    </td>
    <th>建议：</th>
	    <td>
	    <input name="jdajInfo.proposal" type="text" id="proposal" class="inputTextNormal" style="width:300px;overflow-y:visible;">
	    </td>
  </tr>
  <tr>
    <th>承办人：</th>
    <td>
    <input name="jdajInfo.undertaker" type="text"
     class="inputTextNormal" id="undertaker" >
    </td>
    <th>附件：</th>
	    <td>
	    <input name="upFile" type="file" id="upFile" class="inputTextFile">
	    </td>
  </tr>
</table>
</div>

<div class="align-center">   
	   <input name="Button23" id="bs" type="button" class="button" value="提交" onClick="checkForm()" >
	   <input name="Button23" type="reset" class="button" value="清空" >
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
	if(confirm("确定要提交吗?")){
	document.getElementById("bs").disabled=true;
		var form=document.getElementById("form");
		form.action="jdajSave.action"
		form.submit();
		}
}
</script>

<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>

</html>