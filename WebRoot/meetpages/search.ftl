<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>接待信息查询</title>


<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css" />

</head>

<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<body>
<form action="../meet/meet_SearchList.action" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control>
  <tr>
    <td height="20">您的位置：接待信息查询</td>
  </tr>
</table>
<!--标题表格结束-->
<!--主体内容、列表显示区域-->
<input type="hidden" name="funcCode" value="${funcCode}" />
<table width="80%" border="0" align="center" cellpadding="6" cellspacing="0">
		<tr>
			<td>&nbsp;</td>
			<td align="right">
				<input type="button" onclick="checkForm1()" name="sub" value="查询" id="bs" class="button">
			</td>
		</tr>
</table>
<table width="80%" border="0" align="center" cellpadding="4" cellspacing="0" class="tabout">
			<tr class="trcolor">
				<td class="tdListRight">案例标题：</td>
				<td class="tdListLeft"><input type="inputTextNormal" name="stitle" id="title"></td>	
				
				<td class="tdListRight">第一接待人：</td>
				<td class="tdListLeft"><input type="inputTextNormal" name="admit1" id="Admit1" title="请输入关键词，可为空">
				</td>
				
			</tr>

			<tr class="trwhite">
				<td class="tdListRight">接待类型：</td>
				<td class="tdListLeft">
				<select name="sMeet_type" >
    			<option value="0">----请选择----</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				</select>
			</td>
				
				
					
			</tr>
			

</table>

</form>
</body>
<script language="javascript">
function checkForm1(){
window.form1.submit();

}

</script>
</html>