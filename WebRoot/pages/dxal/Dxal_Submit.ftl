<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
		<link href="../css/style_form.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>

</head>

<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<body>
<form name="form" id="form" method="post" ENCTYPE="multipart/form-data">
<div class="ui-title fn-clear">
      <h1 class="ui-title-cnt fn-left">录入典型案例</h1></div> 

<input type="hidden" name="funcCode" value="${funcCode}" />
<div class="z_info"> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">

	<tr>
    	<th>案例标题：</th>
    	<td><input name="dxalInfo.title" type="text"
     	class="inputTextNormal" id="title" title="请输入标题" >
      	</td>
    	<th>报送时间：</th>
	    <td>
	    <input name="dxalInfo.submit_date" type="text" id="time" class="inputTextNormal" value="${todate}" onClick="WdatePicker()" >
	    </td>
 	</tr>
	<tr>
  		<th>关键词：</th>
    	<td>
    	<input name="dxalInfo.keyword" id="keyword" type="text" class="inputTextNormal"  altname="关键词">请输入1-5个关键词，以“;”隔开
   		</td>
    	<th>备注：</th>
    	<td>
    	<input name="dxalInfo.remarks" type="text" id="remarks" class="inputTextNormal"  >
    	</td>
    </tr>	
	<tr>
    	<th>第一执笔人：</th>
    	<td>
    	<input name="dxalInfo.firstAuthor" type="text"
     	class="inputTextNormal" id="first" >
      	</td>
    	<th>第二执笔人：</th>
	    <td>
	    <input name="dxalInfo.secondAuthor" type="text" id="second" class="inputTextNormal">
	    </td>
 	</tr>
 	<tr>
    	<th>报送人：</th>
    	<td>
    	<input name="dxalInfo.submitter" type="text"
     	class="inputTextNormal" id="submitter" value="${name}" readonly>
        </td>
    <input id="dxalId" name="dxalInfo.id" value="${dxalId}" type="hidden">
    <input id="dxallocbm" name="dxalInfo.org_locbm" value="<#if org_locbm?has_content>${org_locbm}</#if>" type="hidden">
    	<th>报送单位：</th>
	    <td>
	    <input name="dxalInfo.department" type="text" id="department" value="<#if department?has_content>${department}</#if>" class="inputTextNormal" readonly>
	    </td>
    </tr>
    <tr>
  		<td>附件：</td>
    	<td>
    	<input name="upFile" type="file" id="upFile" class="inputTextFile">文件类型限word和pdf
    	</td>
 	</tr>
	</table>
</div>


<div class="align-center">	   
	   <input name="Button23" id="bs" type="button" class="button" value="报送" onClick="checkForm()" >
	   <input name="Button23" type="reset" class="button" value="清空" >
</div>
</form>
</body>

<script>
function checkForm(){
    var file=document.getElementById("upFile").value;
    var type= file.slice(file.lastIndexOf(".")).toLowerCase();
	if(document.getElementById("title").value==""){
		alert("请填写标题")
	}else if(file==""){
		alert("请上传附件")
	}else if(type!=".doc"&&type!=".pdf"&&type!=".docx"){
	    alert("请上传word或pdf格式的附件")
	
	}else{
	if(confirm("确定要报送吗?")){
		document.form.action="dxal_Save.action"
		document.form.submit();

		}
	}
}
</script>

<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>

</html>