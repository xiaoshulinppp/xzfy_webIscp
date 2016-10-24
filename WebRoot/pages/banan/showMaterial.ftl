<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
<link href="../css/style_form.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>


<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 
</head>

<body>




    <form id="form1" name="form1" action="''" method="post" ENCTYPE="multipart/form-data">

			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="materialSharing.id" value="${materialSharing.id}" />
			<input type="hidden" name="materialSharing.filepath" value="${materialSharing.filepath}" />

<!--=============================================================================================================================================-->				
<!--========-- start---资料上传---start ======================-- start---资料上传---start --======================-- start---资料上传---start --=========================================================================================-->
  	<div class="ui-form fn-clear"><br/><br/>
			<table id="banan" width="100%" border="0" cellpadding="0" cellspacing="0" class="ui-table ui-table-form" >			  						
				<tr>
					<th width="15%">资料名</th>
					<td width="45%"><#if ViewOrModify==0>
							<#if materialSharing.name?has_content>${materialSharing.name}</#if>
						<#else>
							<input type="text" name="materialSharing.name" value="<#if materialSharing.name?has_content>${materialSharing.name}</#if>"  />
						</#if>
					</td>
					<th width="15%">关键词</th>
					<td width="25%">
						<#if ViewOrModify==0>
							<#if materialSharing.keyword?has_content>${materialSharing.keyword}</#if>
						<#else>
							<input type="text" name="materialSharing.keyword" value="<#if materialSharing.keyword?has_content>${materialSharing.keyword}</#if>"  />
						</#if>
					</td>
				</tr>
				<!--
				<tr>
					<th>类目</th>
					<td colspan=3>&nbsp;
					<#if ViewOrModify==1>
						<select name="materialSharing.category1" id="" onchange="">
							<option value="文学"  <#if materialSharing.category1?exists && materialSharing.category1=="1">selected</#if> >文学</option>
							<option value="科技"  <#if materialSharing.category1?exists && materialSharing.category1=="2">selected</#if> >科技</option>
							<option value="财经"  <#if materialSharing.category1?exists && materialSharing.category1=="3">selected</#if> >财经</option>
							<option value="军事"  <#if materialSharing.category1?exists && materialSharing.category1=="4">selected</#if> >军事</option>
							<option value="旅游"  <#if materialSharing.category1?exists && materialSharing.category1=="5">selected</#if> >旅游</option>
							<option value="娱乐"  <#if materialSharing.category1?exists && materialSharing.category1=="6">selected</#if> >娱乐</option>
							<option value="其他"  <#if materialSharing.category1?exists && materialSharing.category1=="7">selected</#if> >其他</option>
						</select>
					<#else>
						<#if materialSharing.category1?exists>${materialSharing.category1}</#if>
					</#if>
					</td>
				</tr>
				-->
				<tr>
					<th>简介</th>
					<td colspan=3>
						<#if ViewOrModify==0>
							<#if materialSharing.summary?has_content>${materialSharing.summary}</#if>
						<#else>
							<textarea type="text" name="materialSharing.summary" style="width:600px;height:40px;" ><#if materialSharing.summary?has_content>${materialSharing.summary}</#if></textarea>
						</#if>
					</td>
				</tr>
				<tr>
					<th>是否公开</th>
					<td>
						<#if ViewOrModify==0>
							<#if materialSharing.isshare=='1'>是<#else>否</#if>
						<#else>
							<input type="radio" name="materialSharing.isshare" value="0" <#if materialSharing.isshare=='0'>checked</#if>  />否
							<input type="radio" name="materialSharing.isshare" value="1" <#if materialSharing.isshare=='1'>checked</#if>  />是
						</#if>
					</td>
					<#if ViewOrModify==0>
						<th>附件</th>
						<td>
							<#if materialSharing.filepath?has_content> <a href="${materialSharing.filepath}">下载</a> </#if>
						</td>
					<#else>
						<th>附件上传</th>
						<td>
							<input type="file" name="upFile" id="file" />
							<#if materialSharing.filepath?has_content> <a href="${materialSharing.filepath}">下载</a> </#if>
						</td>
					</#if>
					<input type="hidden" name="materialpath" value="<#if materialSharing.filepath?has_content>${materialSharing.filepath}</#if>" />
				</tr>  		
		  	</table><br/>
        	<div align="center">
        		<#if ViewOrModify==1>
			  	<input type="button" value="保存"  class="ui-btn ui-btn-normal" onclick="save()" >
			  	</#if>
			
       		</div>
  	</div>    
	
  </form>



</body>
</html>


<script >	
	function gotoBack(){
		window.history.back();
	}	
	function opendg(dgurl,dgw,dgh)
	{
	//alert(1111);
	  $.dialog({ 
	    title:'',
	    width: dgw,
	    height: dgh,
	    content:'url:'+ dgurl});
	}	
</script>
<script>
	function save(){
	//var api = frameElement.api, W = api.opener, D = W.document; // api.opener 为载加lhgdialog.min.js文件的页面的window对象
			//if(document.getElementById("file").value==""){
			//	alert("请选择文件")
			//	return
			//}	
			window.form1.action="saveMaterial.action";
			window.form1.submit();
			alert("操作成功！");
			window.parent.location="../website/zlk.action?funcCode=${funcCode}&key=1";
			//api.close();
		
	}		
</script>

