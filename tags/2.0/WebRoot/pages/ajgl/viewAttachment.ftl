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
	<input name="attachid" id="attachid" type="hidden" value="" />
	<input id="count" value="${attachmentList.size()}" type="hidden"/>
<div class="z_wrap_info">
 <h2 class="z_title">案卷管理</h2>
	<div class="z_info"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">	

		<tr class="trcolor">
    		<th width="25%">当前已上传：${attachmentList.size()}个附件：</th>
    		<td width="75%">
    		<div id="div">
    		<#list attachmentList as a>
    			<div id="div${a_index}">
	    		<a href="${a.realFilePath}" target="_blank"><#if a.inputFileName?has_content>${a.inputFileName}<#else>${a.fileName}</#if></a>&nbsp&nbsp&nbsp
	    		<a href="javascript:del1('div${a_index}','${a.id}')">--删除--</a>
	    		</div>
	    	</#list>
	    	</div>
    		</td>
    	</tr>
    	<tr>
		<th width="25%" align="right">添加案卷：</th>
		<td class="tdFormInput" width="75%">
				<a href="#" onclick="addattachment()">+添加</a>
		<div id="newdiv">
		
		</div>

		</td>
		</tr>
	</table>
</div>

<div class="align-center">	   
	   <a href="#" class="btn-blue btn" onClick="checkForm()" />提交</a>
	   <a href="#" class="btn-blue btn" onClick="gotoList()">返回</a>
</div>

</form>

</body>

<script type="text/javascript">
	var count = document.getElementById("count").value;
	function checkForm(){
		if(count<1){
			alert("请至少上传一个案卷!");
		}else{
			if(confirm("确定上传?")){
				document.form.action="updateAttachment.action";
				document.form.submit();
			}
		}
	}
	function gotoList(){
		window.history.back();
	}
	
	function addattachment(){
		var a=document.createElement('div');
		a.id="div"+count;
		a.innerHTML="<input name=\"inputFileName\" type=\"text\" />"+"&nbsp<input type=\"file\" name=\"upFile\" class=\"inputTextFile\" />"+"&nbsp<a href=\"#\" onClick=\"del(\'"+a.id+"\')\">删除</a>";
		document.getElementById("newdiv").appendChild(a);
		count++;
	}
	function del(id){
		var e = document.getElementById(id);
		document.getElementById("newdiv").removeChild(e);
		count--;
	}
	function del1(id,attchmenid){
		if(confirm("确定删除？")){
			var e = document.getElementById(id);
			document.getElementById("div").removeChild(e);
			if(document.getElementById("attachid").value!="")
			document.getElementById("attachid").value+=";"+attchmenid;
			else
			document.getElementById("attachid").value+=attchmenid;
			count--;
		}
	}
	
</script>
</html>
