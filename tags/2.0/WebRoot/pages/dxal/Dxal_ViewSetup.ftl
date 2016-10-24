<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>信息系统构架平台V2.0</title>
<link href="../css/15B/style.css" rel="stylesheet" type="text/css">
</head>
<!--javascript脚本添加位置。-->
<!--javascript脚本添加位置结束。-->
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
    <td class="tdFormInput" width="25%">
    <input name="dxalInfo.title" type="text" value="${dxalInfo.title}"
     class="inputTextNormal" id="title" title="请输入标题" >
      </td>
    
    <td class="tdFormText">报送时间：</td>
	    <td class="tdFormInput">
	    <input name="dxalInfo.submit_date" type="text" id="time" class="inputTextNormal" value="${dxalInfo.submit_date}">
	    </td>
  </tr>
    <tr class="trcolor">
    <td class="tdFormText" width="25%">第一执笔人：</td>
    <td class="tdFormInput" width="25%">
    <input name="dxalInfo.firstAuthor" type="text"
     class="inputTextNormal" id="first" value="<#if dxalInfo.firstAuthor?has_content>${dxalInfo.firstAuthor}</#if>" readonly>
      </td>
    <td class="tdFormText">第二执笔人：</td>
	    <td class="tdFormInput">
	    <input name="dxalInfo.secondAuthor" type="text" id="second" value="<#if dxalInfo.secondAuthor?has_content>${dxalInfo.secondAuthor}</#if>"class="inputTextNormal" readonly>
	    </td>
  </tr>


    <tr class="trcolor">
  	<td class="tdFormText">关键词：</td>
    <td class="tdFormInput">
    <#if dxalInfo.keyword?has_content><input name="dxalInfo.keyword" value="${dxalInfo.keyword}" type="text" class="inputTextNormal"  altname="关键词" readonly></#if>
   </td>
    <td class="tdFormText" width="25%">备注：</td>
    <td class="tdFormInput" width="25%">
    <input name="dxalInfo.remarks" type="text" value="<#if dxalInfo.remarks?has_content>${dxalInfo.remarks}</#if>" class="inputTextNormal"  >
    </td>
    </tr>	

  <tr class="trcolor">
    <td class="tdFormText" width="25%">报送人：</td>
    <td class="tdFormInput" width="25%">
    <input name="dxalInfo.submitter" type="text"
     class="inputTextNormal" id="submitter" value="${dxalInfo.submitter}" readonly>
      </td>
    <td class="tdFormText">报送单位：</td>
	    <td class="tdFormInput">
	    <input name="dxalInfo.department" type="text" id="department" value="<#if dxalInfo.department?has_content>${dxalInfo.department}</#if>"class="inputTextNormal" readonly>
	    </td>
  </tr>
 <tr class="trcolor">

    <td class="tdFormText" width="25%">附件：</td>
    <td class="tdFormInput" width="25%">
    <a href="<#if dxalInfo.realFilePath?has_content>${dxalInfo.realFilePath}</#if>"><#if dxalInfo.fileName?has_content>${dxalInfo.fileName}</#if></a>
    </td>
 
  </tr>

</table>


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