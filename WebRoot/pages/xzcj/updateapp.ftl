<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>行政复议信息管理系统</title>
		<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
		<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
		<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
		<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 	
		<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
	</head>
	<body>
	
	
	
		<form id="createForm" action="../xzcj/saveNewApp.action" method="post" ENCTYPE="multipart/form-data">
			<input type="hidden" name="xzcjId" value="${xzcjId}" />
			<input type="hidden" name="textId" value="${textId}" />
			<input type="hidden" name="countId" value="${countId}">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="xzcjApp.proxytype" value="1" />
			<input type="hidden" name="xzcjApp.xzcj_id" value="${xzcjApp.xzcj_id?default('')}" />
			<input type="hidden" name="xzcjApp.id" value="${xzcjApp.id?default('')}" />
		
	<div class="formDiv" id="banan" >	
		<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
		
			<tr>      
	     		<th width="20%" >姓名</th>
			    <td width="30%" >
				    <input type="text" name="xzcjApp.app_name" value="<#if xzcjApp.app_name?has_content>${xzcjApp.app_name}</#if>" class="inputTextNormal" />&nbsp;&nbsp;&nbsp;&nbsp;*必填项
			    </td>
			    <th width="20%">性别</th>
				<td width="30%">
					<select name="xzcjApp.sexy">
						<option value="1" <#if xzcjApp.sexy == "1" >selected</#if> >男</option>
						<option value="2" <#if xzcjApp.sexy == "2" >selected</#if> >女</option>
					</select>
				</td>
	  		</tr>
			<tr>      
	     		<th width="20%" >身份证号码</th>
			    <td width="30%" >
				    <input type="text" name="xzcjApp.app_id" value="<#if xzcjApp.app_id?has_content>${xzcjApp.app_id}</#if>" class="inputTextNormal" />
			    </td>
			    <th width="20%">住所地</th>
				<td width="30%">
					<input type="text" name="xzcjApp.address" value="<#if xzcjApp.address?has_content>${xzcjApp.address}</#if>" class="inputTextNormal" />
	  		</tr>
			<tr>      
	     		<th width="20%" >通邮地址</th>
			    <td width="30%" >
				    <input type="text" name="xzcjApp.mail_address" value="<#if xzcjApp.mail_address?has_content>${xzcjApp.mail_address}</#if>" class="inputTextNormal" />
			    </td>
			    <th width="20%">电话号码</th>
				<td width="30%">
					<input type="text" name="xzcjApp.telephone" value="<#if xzcjApp.telephone?has_content>${xzcjApp.telephone}</#if>" class="inputTextNormal" />
	  		</tr>
			<tr>      
	     		<th width="20%" >手机号码</th>
			    <td width="30%" >
				    <input type="text" name="xzcjApp.mobile" value="<#if xzcjApp.mobile?has_content>${xzcjApp.mobile}</#if>" class="inputTextNormal" />
			    </td>
			    <th width="20%">邮政编码</th>
				<td width="30%">
					<input type="text" name="xzcjApp.postcode" value="<#if xzcjApp.postcode?has_content>${xzcjApp.postcode}</#if>" class="inputTextNormal" />
	  		</tr>
			

	
		</table>
		<br/>
			<div align="center" class="btnDiv" style="padding-left:300px">
			<#if isView==1>
                <input type="button" id="sunbt" class="btn1" value="修改" onclick="updateApp();" />
                </#if>
					<input type="button" class="btn1" value="返 回" onclick="gotoBack();" />
            </div>
        <br/> 
                 
		
	</div>
	</form>

	</body>
</html>


<script type="text/javascript">
	function updateApp(){
		if(confirm("确认修改？")){
			window.document.getElementById("sunbt").disabled=true;
			window.document.getElementById("createForm").submit();
		}
	}
	
	function gotoBack(){
		window.history.back();
	}
</script>




