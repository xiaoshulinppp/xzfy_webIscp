<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="textml; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>案件办理</title>
		

		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
		<link href="../css/style_form.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/16B/prototype.js"></script>
		<script type="text/javascript" src="../js/16B/function.js"></script>
		
			<!--                       Javascripts 注意不要改变顺序                      -->
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
		<!-- 组件template -->
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}l.base.js"></script>
		<script type="text/javascript" src="../jsgdialoggdialog.min.js"></script>

		<style>
			.diva{
			BORDER:#bfceff 1px solid;
			height:22;
			FILTER:progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr='#ddecfb',endColorStr='#ffffff');
			PADDING-TOP: 3px; 
			}
			.divb{
			BORDER: #bfceff 1px solid;
			PADDING-TOP: 10px; 
			PADDING-LEFT: 10px;
			FONT-SIZE: 12px;
			HEIGHT: 100px;
			width:180;
			border-top:0;
			}
		</style>
		<SCRIPT language=JavaScript src="../pages/xzfy/js/function.js"></SCRIPT>
	</head>

<body>
	<form name="form" id="form" method="post" ENCTYPE="multipart/form-data">
	<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../sys_theme/images/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">案件信息</h2></span></div> 

<!--您的位置表格结束-->
<!--标题表格开始-->
<!--标题表格结束-->
<!--主体内容、列表显示区域-->
	<div class="z_info"> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
		<input type="hidden" name="funcCode" value="${funcCode}" />
		<input name="userLocbm" value="${userLocbm}" type="hidden" />
		<input name="xzfyId" value="${xzfyId}" type="hidden" />
		<input name="dftzId" value="${dftzId}" type="hidden" />

		<tr>
    		<th>立案日期：</th>
    		<td>
    			<input name="lian_date" type="text"
     			class="inputTextNormal" id="date" value="${xzfyInfo.lian_date?default('')}"/>
    		</td>
    
    		<th>申请人：</th>
	    	<td>
	    		<input name="app_show" type="text" class="inputTextNormal" value="<#if xzfyInfo.app_show?has_content>${xzfyInfo.app_show}</#if>" />
	    		</td>
		</tr>


		<tr>
  			<th>案号：</th>
    		<td class="tdFormInput">
    			<input type="text" name="tjzfzh" value="${xzfyInfo.tjzfzh?default('')}"/>
    		</td>
    		<th>承办人：</th>
    		<td class="tdFormInput" width="25%">
    			<input type="text" name="adimt" value="<#if xzfyInfo.admit1?has_content>${xzfyInfo.admit1}、</#if><#if xzfyInfo.admit2?has_content>${xzfyInfo.admit2}</#if>" />
    		</td>
    	</tr>	
  		<tr>
    		<th>生成答复：</th>
    		<td class="tdFormInput" width="25%">
    			<textarea name="content1" type="text"></textarea>
    			<input name="reply" type="button" class="button" value="生成答复" onClick="savaToLaDoc()" />
    		</td>
    		<th>上传证据</th>
	    	<td class="tdFormInput">
	    	<div id="newdiv">
	    	<input name="upFile" type="file" id="upFile" class="inputTextFile" />
	    	</div>
	    	<a href="#" onclick="addattachment()">+添加</a>
	    	</td>
  		</tr>
 
	</table>


<div class="align-center">	   
	   <a href="#" class="btn-blue btn" onClick="checkForm()" />提交</a>
	   <a href="#" class="btn-blue btn" onClick="gotoList()">返回</a>
</div>

</form>

</body>

<script type="text/javascript">
	var count = 1;
	function checkForm(){
			if(confirm("确定要修改吗?")){
				document.form.action="saveInfo.action";
				
				document.form.submit();
				}
	}
	function gotoList(){
		window.history.back();
	}

	
	function addattachment(){
		if(count<3){
			var a=document.createElement('div');
			a.id="div"+count;
			a.innerHTML="<input type=\"file\" name=\"upFile\" class=\"inputTextFile\" />"+"<a href=\"#\" onClick=\"del(\'"+a.id+"\')\">删除</a>";
			document.getElementById("newdiv").appendChild(a);
			count++;
		}else{
			alert("最多三个附件！");
		}
		
	}
	function del(id){
		var e = document.getElementById(id);
		document.getElementById("newdiv").removeChild(e);
 		count--;
	}
	function savaToLaDoc(){
		var options = { 
			url:'updateDftz_content.action', //提交给哪个执行 
			type:'POST', 
			success: getLiantongzhi //显示操作提示 
			}; 
		$('#form').ajaxSubmit(options); 
		return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
				

	}
	
	function getLiantongzhi(){
		var url="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=panglei&caseId=${xzfyInfo.id}";
		window.open(url);
	}
	
</script>
</html>
