<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>监督案件</title>


<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<form action="" name="form" id="form" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->
<!--您的位置表格结束-->
<!--标题表格开始-->
<!--标题表格结束-->
<!--主体内容、列表显示区域-->

<input type="hidden" name="funcCode" value="${funcCode}" />
<input name="xzfyId" type="hidden" id="xzfyId" value="${xzfyId}">
<table name="form" width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">

<tr class="trcolor">
    <td class="tdFormText" width="25%">行政复议ID：</td>
    <td class="tdFormInput" width="30%">
    
     <input name="button" id="button" type="Button" value="继续"
     class="button" onClick="checkForm();">
    </td>
</tr>	
</table>
</form>
</body>

<script>
function checkForm(){
		document.form.action="tzjlInfoList.action"
		document.form.submit();
}
</script>

<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>

</html>