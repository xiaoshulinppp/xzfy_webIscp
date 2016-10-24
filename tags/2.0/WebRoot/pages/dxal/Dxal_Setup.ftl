<html>
<head>
<title>典型案例设置</title>        

<link href="../css/15B/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

  <form method="POST" action="../dxal/dxal_Update.action" ENCTYPE="multipart/form-data" name="form" id="form">
  <input type="hidden" name="funcCode" value="${funcCode}" />
  <table width="85%" border="0" cellpadding="0" cellspacing="0" align="center">
  
	<tr>
		 <td align="center">典型案例设置</td><br>
	</tr>
	<tr><td align="right">
  <input type="hidden" name="dxalInfo.id" value="${id}">
  <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">

<tr class="trcolor">
    <td class="tdFormText" width="25%">案例标题：</td>
    <td class="tdFormInput" width="25%">
    <input name="dxalInfo.title" type="text" value="${dxalInfo.title}"
     class="inputTextNormal" id="title" readonly>
      </td>
    
    <td class="tdFormText">报送时间：</td>
	    <td class="tdFormInput">
	    <input name="dxalInfo.submit_date" type="text" id="time" class="inputTextNormal" value="${dxalInfo.submit_date}" readonly>
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
    <input name="dxalInfo.remarks" type="text" value="<#if dxalInfo.remarks?has_content>${dxalInfo.remarks}</#if>" class="inputTextNormal" readonly >
    </td>
    </tr>	
<tr class="trcolor">

    
 
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
    <td class="tdFormText" width="25%">案件类型：</td>
    <td class="tdFormInput" width="25%">
    <select name="dxalInfo.case_type" class="selectStyleNormal" id="case_type">
    <option value="">---请选择案件类型---</option>
    <option value="代办理">代办理</option>
    <option value="已办理">已办理</option>
    <option value="待结案">待结案</option>
    <option value="结案">结案</option>
    </select>
    </td>
</table>

<table width="80%" border="0" align="center" cellpadding="6" cellspacing="0">
		<tr>
			<td>&nbsp;</td>
			<td align="center"> 
				<input type="button" onclick="checkForm()" id="sbt"  value="确定" class="button">&nbsp;&nbsp;<input type="button" name="ret" value="返回"  class="button" onclick="history.back(-1)">
			</td>
		</tr>
	 </table>
    </td>
   </tr>
</table>
</form>
<script>
function changeValue(){
document.getElementById("abs").value=document.getElementById("titi").innerHTML;
//document.getElementById("titi").style.fontSize="11px";

}
function checkForm(){
    if(document.getElementById("case_type").value==""){
		alert("请选择案件类型");
		return false;
	}else{
	if(confirm("确定要提交吗？")){
		document.getElementById("sbt").disabled=true;
		listForm_= document.getElementById("form");	
		listForm_.submit();
		}
	}
}


</script>

</body>				  
</html>
