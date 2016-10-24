<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>典型案例设置</title>        
<link href="../css/style_form.css" rel="stylesheet" type="text/css">

</head>

<body>
  <form method="POST" action="../dxal/dxal_Update.action" ENCTYPE="multipart/form-data" name="form" id="form">
  <input type="hidden" name="funcCode" value="${funcCode}" />

  <input type="hidden" name="dxalInfo.id" value="${id}">
 <div class="z_info">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">

<thr>
    <th>案例标题：</th>
    <td>
    <input name="dxalInfo.title" type="text" value="${dxalInfo.title}"
     class="inputTextNormal" id="title" readonly>
      </td>
    
    <th>报送时间：</th>
	    <td>
	    <input name="dxalInfo.submit_date" type="text" id="time" class="inputTextNormal" value="${dxalInfo.submit_date}" readonly>
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


    <tr>
  	<th>关键词：</th>
    <td>
    <#if dxalInfo.keyword?has_content><input name="dxalInfo.keyword" value="${dxalInfo.keyword}" type="text" class="inputTextNormal"  altname="关键词" readonly></#if>
   	</td>
    <th>备注：</th>
    <td>
    <input name="dxalInfo.remarks" type="text" value="<#if dxalInfo.remarks?has_content>${dxalInfo.remarks}</#if>" class="inputTextNormal" readonly >
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
    <th>案件类型：</th>
    <td>
    <select name="dxalInfo.case_type" class="selectStyleNormal" id="case_type">
    <option value="">---请选择案件类型---</option>
    <option value="代办理">代办理</option>
    <option value="已办理">已办理</option>
    <option value="待结案">待结案</option>
    <option value="结案">结案</option>
    </select>
    </td>
</table>
</div>
 <div class="z_info">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
<tr>
	<td></td>
    <td> 
	<input type="button" onclick="checkForm()" id="sbt"  value="确定" class="button">&nbsp;<input type="button" name="ret" value="返回"  class="button" onclick="history.back(-1)">
	</td>
</tr>
</table>
</div>
</form>

</body>	
<script>
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
</html>
