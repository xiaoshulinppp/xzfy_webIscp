<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>监督案件查询</title>


<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css" />

</head>

<body>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!--您的位置表格开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control>
  <tr>
    <td height="20">您的位置：监督案件 -&gt; 监督案件查询</td>
  </tr>
</table>
<form action="''" name="searchform" id="searchform" method="post" ENCTYPE="multipart/form-data">
<input type="hidden" name="funcCode" value="${funcCode}">
<input type="hidden" name="initSearch" value="${initSearch}">
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
			<tr>

				<td align="right">
					<input type="button" value="查询" class="button" onclick="gotoSearch();" />
					<input type="reset" value="清空" class="button" >
				</td>
			</tr>
		</table>
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
	<tr class="trcolor">
    <td class="tdFormText" width="25%">接收日期：</td>
    <td class="tdFormInput" width="30%">
    <input name="todate" type="text"
     class="inputTextNormal" id="todate" value="<#if todate?has_content>${todate}</#if>" onClick="WdatePicker()">
    </td>
    
    <td class="tdFormText">监督案件文号：</td>
	    <td class="tdFormInput">
	    <input name="documentNumber" type="text" id="documentNumber" value="<#if documentNumber?has_content>${documentNumber}</#if>" class="inputTextNormal">
	    </td>
	</tr>
	<tr class="trcolor">
    <td class="tdFormText" width="25%">申请人：</td>
    <td class="tdFormInput" width="30%">
    <input name="appName" type="text" value="<#if appName?has_content>${appName}</#if>"
     class="inputTextNormal" id="appName" >
    </td>
    
    <td class="tdFormText">承办人：</td>
	    <td class="tdFormInput">
	    <input name="undertaker" type="text" id="undertaker" value="<#if undertaker?has_content>${undertaker}</#if>" class="inputTextNormal">
	    </td>
	</tr>
	
	</table>

</form>
<br>
<div style="display:<#if isFirst==0||jdajListAll.size()==0>none<#else>block</#if>">
<form action="''" name="form" id="form" method="post" ENCTYPE="multipart/form-data">
<input type="hidden" name="funcCode" value="${funcCode}" />
<!--主体内容、列表显示区域。注意上边的区域定义必须保持-->
<table width="98%" border="0" cellpadding="0" cellspacing="0" align="center" class="tabMainTop">
<tr><td class="tdFormInput">
&nbsp;&nbsp;&nbsp;&nbsp;共计:${jdajListAll.size()}条</td></tr> 
<tr><td>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
<tr>  
<th class="thListNormal">序号</th>
<th class="thListNormal">收案日期</th>
<th class="thListNormal">案件文号</th>
<th class="thListNormal">申请人</th>
<th class="thListNormal">承办人</th>
<th class="thListNormal">案件状态</th>
<th class="thListNormal">查看</th>

</tr>
<#list jdajListAll as jdaj>
<tr class="trcolor">
<td class="tdlistCenter" >&nbsp;${jdaj_index+1}</td>
<td class="tdlistCenter" >&nbsp;<#if jdaj.receiveDate?has_content>${jdaj.receiveDate}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if jdaj.documentNumber?has_content>${jdaj.documentNumber}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if jdaj.appNames?has_content>${jdaj.appNames}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if jdaj.undertaker?has_content>${jdaj.undertaker}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if jdaj.state=="0">代办理<#else>已结案</#if></td>
<td class="tdlistCenter"><a href="../jdaj/modifyInfo.action?jdajId=${jdaj.id}&funcCode=${funcCode}"><img src="../images/15B/sicons/search.gif"  width="16" height="16" border="0"></a></td>
</tr>
</#list>
</table>
  </td>
  </tr>
</table>
</form>
</div>
<div style="display:<#if isFirst==1&&jdajListAll.size()==0>block<#else>none</#if>">
&nbsp;&nbsp;&nbsp;&nbsp;没有相关查询结果，请重试！
</div>
</body>
</html>
<script language="javascript">
			function gotoPage(){
				var inputPage = window.document.getElementById("gotoPageNum").value;
				if(!inputPage.match("[\\d+]+")){
					alert("页数必须为整数！");
					return;
				}else{
					for(var i=0;i<inputPage.length;i++){
						if(inputPage.charCodeAt(i)>57 || inputPage.charCodeAt(i)<48){
							alert("页数必须为整数！");
							return;
						}
					}
				}
				if(inputPage > ${totalPage}){
					alert("输入的页数不能超过总页数！");
				}else if(inputPage < 1){
					alert("输入的页数不能少于1页！");
				}else{
					window.location = "../dxal/dxal_List.action?funcCode=${funcCode}&pNum=" + inputPage + "";
				}
				return;
			}
			function gotoSearch(){
			if(document.getElementById("todate").value==""&&document.getElementById("documentNumber").value==""&&
			document.getElementById("appName").value==""&&document.getElementById("undertaker").value==""){
			alert("请输入查询条件！")
			}else{
			  document.searchform.action="jdajSearch.action"
			  document.searchform.submit();
			}
			
			}
</script>