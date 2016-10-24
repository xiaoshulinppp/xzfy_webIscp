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
			

<!--=============================================================================================================================================-->				
<!--========-- start---资料上传---start ======================-- start---资料上传---start --======================-- start---资料上传---start --=========================================================================================-->
  	<div class="ui-form fn-clear"><br/><br/>
			<table id="banan" width="100%" border="0" cellpadding="0" cellspacing="0" class="ui-table ui-table-form">			  						
				<tr>
					<th>资料名</th>
					<td>&nbsp;
						<input type="text" name="materialSharing.name" value="" />
					</td>
					<th>关键词</th>
					<td>&nbsp;
						<input type="text" name="materialSharing.keyword" value="" />
					</td>
				</tr>
				<!--
				<tr>
					<th>类目</th>
					<td colspan=3>&nbsp;
						<select name="materialSharing.category1" id="" onchange="">
							<option value="文学" >文学</option>
							<option value="科技" >科技</option>
							<option value="财经" >财经</option>
							<option value="军事" >军事</option>
							<option value="旅游" >旅游</option>
							<option value="娱乐" >娱乐</option>
							<option value="其他" >其他</option>
						</select>
					
					
					
					</td> 
				</tr>
				-->
				<tr>
					<th>简介</th>
					<td colspan=3>&nbsp;
						<textarea type="text" name="materialSharing.summary" style="width:600px;height:40px;"></textarea>
					</td>
				</tr>
				<tr>
					<th>是否公开</th>
					<td>&nbsp;
						<input type="radio" name="materialSharing.isshare" value="0" />否
						<input type="radio" name="materialSharing.isshare" value="1" checked />是
					</td>
					<th>附件上传</th>
					<td>&nbsp;
						<input type="file" name="upFile" id="file" />
					</td>
				</tr>  		
		  	</table><br/>
		  	<div align="center">
			  	<input type="button" value="保存" class="ui-btn ui-btn-normal" onclick="save()" >
			  	<!--
				<input type="button" value="返 回" class="ui-btn ui-btn-normal" onclick="gotoBack()" >
				-->
				<#if materialSharing.filepath?has_content> <a href="${materialSharing.isshare}">下载</a> </#if>
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
			if(document.getElementById("file").value==""){
				alert("请选择文件")
				return
			}		
			window.form1.action="saveMaterial.action";
			window.form1.submit();
			alert("操作成功！");
			window.parent.location="../website/zlk.action?funcCode=${funcCode}&key=1";
			//api.close();
		
	}		
</script>

