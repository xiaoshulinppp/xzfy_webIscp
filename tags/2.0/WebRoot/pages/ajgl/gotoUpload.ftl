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
<body>
	<form name="form" id="form" method="post" ENCTYPE="multipart/form-data">
	<input type="hidden" name="funcCode" value="${funcCode}" />
	<input name="xzfyId" value="${xzfyId}" type="hidden" />
	
	
	<div class="z_wrap_info">
<div class="align-right"><a href="#" title="案件信息" class="btn-blue btn">案件信息</a></div>
      <h2 class="z_title">上传案卷</h2>
      
<div class="z_info"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">	
		<tr>
    		<th width="25%" >添加案卷：</th>
    		<td width="75%" class="tdFormInput">
    		<a href="#" onclick="addattachment()" >+添加</a>
    		<div id="newdiv">
    			
    			<div id="firstDiv">
    			附件名称：<input name="inputFileName" type="text" />
	    		<input name="upFile" type="file" id="upFile" class="inputTextFile" />
	    		<a href="#" onClick="del('firstDiv')" >删除</a>
	    		</div>
	    	</div>
	    	
    		</td>
		</tr>
</table>
</div>
<br>
<div class="align-center">	   
	   <a href="#" class="btn-blue btn" onClick="checkForm()" />提交</a>
	   <a href="#" class="btn-blue btn" onClick="gotoList()">返回</a>
</div>

</form>

</body>

<script type="text/javascript">
	var count = 1;
	function checkForm(){
		if(count<1){
			alert("请至少上传一个案卷!");
		}else{
			if(confirm("确定上传?")){
				document.form.action="saveAttachment.action";
				document.form.submit();
			}
		}
	}
	function gotoList(){
		document.form.action="showList1.action";
		document.form.submit();
	}
	
	function addattachment(){
		var a=document.createElement('div');
		a.id="div"+count;
		a.innerHTML="附件名称：<input name=\"inputFileName\" type=\"text\" />"+"&nbsp<input type=\"file\" name=\"upFile\" class=\"inputTextFile\" />"+"&nbsp<a href=\"#\" onClick=\"del(\'"+a.id+"\')\">删除</a>";
		document.getElementById("newdiv").appendChild(a);
		count++;
	}
	function del(id){
		var e = document.getElementById(id);
		document.getElementById("newdiv").removeChild(e);
		count--;
 
	}
	
</script>
</html>
