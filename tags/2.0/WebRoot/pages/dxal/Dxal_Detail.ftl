<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>案例信息</title>
<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<body>
<!--您的位置表格开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control>
  <tr>
    <td height="20">您的位置：典型案例 -&gt; 案例信息</td>
  </tr>
</table>

<input type="hidden" name="funcCode" value="${funcCode}" />
<!--您的位置表格结束-->
<!--标题表格开始-->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td height="24" align="center">案例信息</td>
  </tr>
</table>
<!--标题表格结束-->
<!--主体内容、列表显示区域-->

  <table width="80%" border="0" align="center" cellpadding="4" cellspacing="0" class="tabout">
	<tr class="trcolor">
	  <td class="tdListCenter" width="25%">案例标题:</td>
	  <td class="tdListLeft"><input type="inputTextNormal" name="dxalInfo.title" value="${dxalInfo.title}" readonly></td>	
	  <td class="tdListCenter" width="25%">报送单位：</td>
	  <td class="tdListLeft" width="25%"><input type="inputTextNormal" name="dxal.department" readonly="true" value="<#if dxalInfo.department?has_content>${dxalInfo.department}</#if>" id="department" readonly></td>
	</tr>
	<tr class="trcolor">
	  <td class="tdListCenter" width="25%">报送人:</td>
	  <td class="tdListLeft"><input type="inputTextNormal" name="dxalInfo.submitter" value="${dxalInfo.submitter}" readonly></td>	
	  <td class="tdListCenter">报送时间：</td>
	  <td class="tdListLeft"><input type="inputTextNormal" name="dxalInfo.submit_date" readonly="true" value="${dxalInfo.submit_date}" id="authortwo" readonly></td>
	</tr>
	<tr class="trwhite">
      <td class="tdListLeft" colspan=4>备注:</td>
	  
    </tr>
    <tr class="trwhite">
    	<td colspan=4 class="tdListLeft">
	  <#if dxalInfo.remarks?has_content>${dxalInfo.remarks}</#if>
	  </td>
    </tr>
	<tr class="trcolor">
	  <td class="tdListCenter">案例类型：</td>
	  <td class="tdListLeft"><#if dxalInfo.case_type?has_content>${dxalInfo.case_type}</#if></td>				
	  <td class="tdListCenter">案例相关附件下载:</td>
	  <td class="tdListLeft"><a href="<#if dxalInfo.realFilePath?has_content>${dxalInfo.realFilePath}</#if>"><#if dxalInfo.fileName?has_content>${dxalInfo.fileName}</#if></a></td>				
	</tr>					
  </table>
 
<form  action ="../dxal/dxal_SubmitComment.action" validate="true" method="post">
 <input type="hidden" name="funcCode" value="${funcCode}" />	
  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
    <tr>
      <td height="24" align="center">留言信息</td>
    </tr>
  </table>
  <div id="addComments">
    
  </div>	
<#list allCommentsList as com>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">	
  <tr>
    <td class="tdListLeft">
    &nbsp; (&nbsp;<#if com.commenter_name?has_content>${com.commenter_name}</#if>&nbsp;&nbsp;,&nbsp;&nbsp;<#if com.time?has_content>${com.time}</#if>&nbsp;)&nbsp;:&nbsp;<#if com.comment?has_content>${com.comment}</#if><br>
	</td>
  </tr>	
</table>
</#list>

<table width="98%" border="0" align="center" cellpadding="4" cellspacing="0" class="tabout">	
  <tr class="trcolor">
    <td colspan=2 class="tdListCenter">留言版</td>
  </tr>
  <tr class="trwhite">
    
    <td class="tdListCenter" ><textarea name="dxalComment.comment" rows="10" cols="" class="textarea"></textarea></td>
    <input type="hidden" name="id" value="${id}" />
  </tr>
  <tr>
    <td align=center colspan=2><input type="submit" name="submit" value="提交" onClick="add()" class="button" /></td>
  </tr>
</table>
</form>
<table width="98%" border="0" align="center" cellpadding="6" cellspacing="0">
	<tr>
		<td align="center"> 
			<input type="button" name="back" value="返回"  class="button" onclick="history.back(-1)">
		</td>
	</tr>
</table>

</body>
</html>
