<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../css/style_form.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<body>
<!--您的位置表格开始-->

<input type="hidden" name="funcCode" value="${funcCode}" />
<!--您的位置表格结束-->
<!--标题表格开始-->
<div class="z_wrap_info"><div>典型案例信息</div>
<div class="z_info">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
	<tr>
	  <th>案例标题:</th>
	  <td><input type="inputTextNormal" name="dxalInfo.title" value="${dxalInfo.title}" readonly></td>	
	  <th>报送单位：</th>
	  <td><input type="inputTextNormal" name="dxal.department" readonly="true" value="<#if dxalInfo.department?has_content>${dxalInfo.department}</#if>" id="department" readonly></td>
	</tr>
	<tr>
	  <th>报送人:</th>
	  <td><input type="inputTextNormal" name="dxalInfo.submitter" value="${dxalInfo.submitter}" readonly></td>	
	  <th>报送时间：</th>
	  <td><input type="inputTextNormal" name="dxalInfo.submit_date" readonly="true" value="${dxalInfo.submit_date}" id="authortwo" readonly></td>
	</tr></table></div>
	<div class="z_info">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
	<tr>
      <th width="16%">备注:</th>
	  <td>
	  <#if dxalInfo.remarks?has_content>${dxalInfo.remarks}</#if>
	  </td>
    </tr>
    </table></div>
    <div class="z_info">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
	<tr>
	  <th>案例类型：</th>
	  <td><#if dxalInfo.case_type?has_content>${dxalInfo.case_type}</#if></td>				
	  <th>案例相关附件下载:</th>
	  <td><a href="<#if dxalInfo.realFilePath?has_content>${dxalInfo.realFilePath}</#if>"><#if dxalInfo.fileName?has_content>${dxalInfo.fileName}</#if></a></td>				
	</tr>					
  </table>
 </div>
<form  action ="../dxal/dxal_SubmitComment.action" validate="true" method="post">
 <input type="hidden" name="funcCode" value="${funcCode}" />	
  <div class="z_info">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
    <tr>
      <td height="24" align="center">留言信息</td>
    </tr>
  </table>   
  </div>
 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">	
<#list allCommentsList as com>
  <tr>
    <td>
    &nbsp; (&nbsp;<#if com.commenter_name?has_content>${com.commenter_name}</#if>&nbsp;&nbsp;,&nbsp;&nbsp;<#if com.time?has_content>${com.time}</#if>&nbsp;)&nbsp;:&nbsp;<#if com.comment?has_content>${com.comment}</#if><br>
	</td>
  </tr>	

</#list>
</table>
 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">	
  <tr>
    <td>留言版</td>
  </tr>
  <tr>
    
    <td><textarea name="dxalComment.comment" class="textarea"></textarea></td>
    <input type="hidden" name="id" value="${id}" />
  </tr>
  <tr>
    <td align=center><input type="submit" name="submit" value="提交" onClick="add()" class="btn-blue btn" /></td>
  </tr>
</table>
</form>
<table width="98%" border="0" align="center" cellpadding="6" cellspacing="0">
	<tr>
		<td align="center"> 
			<input type="button" name="back" value="返回"  class="btn-blue btn" onclick="history.back(-1)">
		</td>
	</tr>
</table>
</div>
</body>
</html>
