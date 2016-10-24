<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>信息系统构架平台V2.0</title>
<link href="../css/style_form.css" rel="stylesheet" type="text/css">
</head>
<!--javascript脚本添加位置。-->
<!--javascript脚本添加位置结束。-->
<body>

<!--您的位置表格开始-->


<input type="hidden" name="funcCode" value="${funcCode}" />

<div class="z_info">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">

<tr>
    <th>案例标题：</th>
    <td>
    <input name="dxalInfo.title" type="text" value="${dxalInfo.title}"
     class="inputTextNormal" id="title" title="请输入标题" >
      </td>
    
    <th>报送时间：</th>
	    <td>
	    <input name="dxalInfo.submit_date" type="text" id="time" class="inputTextNormal" value="${dxalInfo.submit_date}">
	    </td>
  </tr>
    <tr>
    <th>第一执笔人：</th>
    <td>
    <input name="dxalInfo.firstAuthor" type="text"
     class="inputTextNormal" id="first" value="<#if dxalInfo.firstAuthor?has_content>${dxalInfo.firstAuthor}</#if>" readonly>
      </td>
    <th>第二执笔人：</th>
	    <td>
	    <input name="dxalInfo.secondAuthor" type="text" id="second" value="<#if dxalInfo.secondAuthor?has_content>${dxalInfo.secondAuthor}</#if>"class="inputTextNormal" readonly>
	    </td>
  </tr>


    <tr class="trcolor">
  	<th>关键词：</th>
    <td>
    <#if dxalInfo.keyword?has_content><input name="dxalInfo.keyword" value="${dxalInfo.keyword}" type="text" class="inputTextNormal"  altname="关键词" readonly></#if>
   </td>
    <th>备注：</th>
    <td>
    <input name="dxalInfo.remarks" type="text" value="<#if dxalInfo.remarks?has_content>${dxalInfo.remarks}</#if>" class="inputTextNormal"  >
    </td>
    </tr>	

  <tr>
    <th>报送人：</th>
    <td>
    <input name="dxalInfo.submitter" type="text"
     class="inputTextNormal" id="submitter" value="${dxalInfo.submitter}" readonly>
      </td>
    <th>报送单位：</th>
	    <td>
	    <input name="dxalInfo.department" type="text" id="department" value="<#if dxalInfo.department?has_content>${dxalInfo.department}</#if>"class="inputTextNormal" readonly>
	    </td>
  </tr>
 <tr>

    <th>附件：</th>
    <td>
    <a href="<#if dxalInfo.realFilePath?has_content>${dxalInfo.realFilePath}</#if>"><#if dxalInfo.fileName?has_content>${dxalInfo.fileName}</#if></a>
    </td>
 
  </tr>

</table>
</div>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td> 	   
	   <input name="Button23" type="button" class="button" value="返回" onClick="history.back(-1)" >
	</td>
  </tr>
</table>

</form>
</body>
</html>