<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>典型案例报送</title>


<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css" />

</head>

<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<body>
<form action="../dxal/dxal_Save.action" name="form1" id="form" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control>
  <tr>
    <td height="20">您的位置：典型案例 -&gt; 典型案例报送</td>
  </tr>
</table>
<!--您的位置表格结束-->
<!--标题表格开始-->
<!--标题表格结束-->
<!--主体内容、列表显示区域-->

<input type="hidden" name="funcCode" value="${funcCode}" />

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">

<tr class="trcolor">
    <td class="tdFormText" width="25%">案例标题：</td>
    <td class="tdFormInput" width="30%">
    <input name="dxalInfo.title" type="text"
     class="inputTextNormal" id="title" title="请输入标题" >
      </td>
    
    <td class="tdFormText">报送时间：</td>
	    <td class="tdFormInput">
	    <input name="dxalInfo.submit_date" type="text" id="time" class="inputTextNormal" value="${todate}" onClick="WdatePicker()" >
	    </td>
  </tr>


    <tr class="trcolor">
  	<td class="tdFormText">关键词：</td>
    <td class="tdFormInput">
    <input name="dxalInfo.keyword" id="keyword" type="text" class="inputTextNormal"  altname="关键词">请输入1-5个关键词，以“;”隔开
   </td>
    <td class="tdFormText" width="25%">备注：</td>
    <td class="tdFormInput" width="25%">
    <input name="dxalInfo.remarks" type="text" id="remarks" class="inputTextNormal"  >
    </td>
    </tr>	
  <tr class="trcolor">
    <td class="tdFormText" width="25%">第一执笔人：</td>
    <td class="tdFormInput" width="25%">
    <input name="dxalInfo.firstAuthor" type="text"
     class="inputTextNormal" id="first" >
      </td>
    <td class="tdFormText">第二执笔人：</td>
	    <td class="tdFormInput">
	    <input name="dxalInfo.secondAuthor" type="text" id="second" class="inputTextNormal">
	    </td>
  </tr>
  <tr class="trcolor">
    <td class="tdFormText" width="25%">报送人：</td>
    <td class="tdFormInput" width="25%">
    <input name="dxalInfo.submitter" type="text"
     class="inputTextNormal" id="submitter" value="${name}" readonly>
      </td>
    <input id="dxalId" name="dxalInfo.id" value="${dxalId}" type="hidden">
    <input id="dxallocbm" name="dxalInfo.org_locbm" value="<#if org_locbm?has_content>${org_locbm}</#if>" type="hidden">
    <td class="tdFormText">报送单位：</td>
	    <td class="tdFormInput">
	    <input name="dxalInfo.department" type="text" id="department" value="<#if department?has_content>${department}</#if>" class="inputTextNormal" readonly>
	    </td>
  </tr>
 <tr class="trcolor">

    <td class="tdFormText" width="25%">附件：</td>
    <td class="tdFormInput" width="25%">
    <input name="upFile" type="file" id="upFile" class="inputTextFile">文件类型限word和pdf
    </td>
 
  </tr>

</table>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td> 	   
	   <input name="Button23" id="bs" type="button" class="button" value="报送" onClick="checkForm()" >
	   <input name="Button23" type="reset" class="button" value="清空" >
	</td>
  </tr>
</table>







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
	document.getElementById("bs").disabled=true;
		var fileform=document.getElementById("form");
		fileform.submit();

		}
	}
}
</script>

<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>

</html>