<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>典型案例查询</title>


<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css" />

</head>

<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<body>
<form action="../dxal/dxal_SearchList.action" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control>
  <tr>
    <td height="20">您的位置：典型案例 -&gt; 典型案例查询</td>
  </tr>
</table>
<!--标题表格结束-->
<!--主体内容、列表显示区域-->
<input type="hidden" name="funcCode" value="${funcCode}" />
<table width="80%" border="0" align="center" cellpadding="6" cellspacing="0">
		<tr>
			<td>&nbsp;</td>
			<td align="right">
				<input type="button" name="sub" value="查询" id="bs" class="button" onClick="Search()">
			</td>
		</tr>
</table>
<table width="80%" border="0" align="center" cellpadding="4" cellspacing="0" class="tabout">
			<tr class="trcolor">
				<td class="tdListRight">案例标题：</td>
				<td class="tdListLeft"><input type="inputTextNormal" name="title" id="title"></td>	
				
				<td class="tdListRight">关键词：</td>
				<td class="tdListLeft"><input type="inputTextNormal" name="keyword" id="keyword">请输入关键词</td>
				
			</tr>

			<tr class="trwhite">
				<td class="tdListRight">案例类型：</td>
				<td class="tdListLeft">
				<select name="case_type" id="case_type">
    				<option value="">----请选择----</option>
				    <option value="代办理">代办理</option>
    				<option value="已办理">已办理</option>
    				<option value="待结案">待结案</option>
    				<option value="结案">结案</option>
				</select></td>
			</tr>
			<tr class="trcolor">
				<td class="tdListRight">查看次数不少于：</td>
				<td class="tdListLeft"><input type="inputTextNormal" name="read_count" id="read_count"></td>	
				
				<td class="tdListRight">评论次数不少于：</td>
				<td class="tdListLeft"><input type="inputTextNormal" name="comment_count" id="comment_count"></td>
				
			</tr>
			

</table>

</form>
</body>
<script>
function Search(){
if(document.getElementById("title").value==""&&document.getElementById("keyword").value==""&&document.getElementById("case_type").value==""
&&document.getElementById("read_count").value==""&&document.getElementById("comment_count").value==""){
alert("请至少输入一个查询条件")
}else{
document.getElementById("form1").submit();
}


}

</script>
</html>
