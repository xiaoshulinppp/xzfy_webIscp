<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>典型案例列表</title>


<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css" />

</head>

<body>
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control>
  <tr>
    <td height="20">您的位置：典型案例 -&gt; 典型案例列表</td>
  </tr>
</table>
<input type="hidden" name="funcCode" value="${funcCode}" />
<!--主体内容、列表显示区域。注意上边的区域定义必须保持-->

<table width="98%" border="0" cellpadding="0" cellspacing="0" align="center" class="tabMainTop">
<tr><td class="tdFormInput">
&nbsp;&nbsp;&nbsp;&nbsp;共计:${allList.size()}条</td></tr> 
<tr><td>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
<tr>  
<th class="thListNormal">序号</th>
<th class="thListNormal">案例标题</th>
<th class="thListNormal">案例类型</th>
<th class="thListNormal">报送人</th>
<th class="thListNormal">报送单位</th>
<th class="thListNormal">报送时间</th>
<th class="thListNormal">点击次数</th>
<th class="thListNormal">评论次数</th>
<th class="thListNormal">查看</th>

</tr>
<#list dxalList as dxal>
<tr class="trcolor">
<td class="tdlistCenter" >&nbsp;${dxal_index+1}</td>
<td class="tdlistCenter" >&nbsp;<#if dxal.title?has_content>${dxal.title}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if dxal.case_type?has_content>${dxal.case_type}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if dxal.submitter?has_content>${dxal.submitter}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if dxal.department?has_content>${dxal.department}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if dxal.submit_date?has_content>${dxal.submit_date}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if dxal.submit_date?has_content>${dxal.read_count}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if dxal.submit_date?has_content>${dxal.comment_count}</#if></td>
<td class="tdlistCenter"><a href="../dxal/dxal_Detail.action?id=${dxal.id}&funcCode=${funcCode}"><img src="../images/15B/sicons/search.gif"  width="16" height="16" border="0"></a></td>
</tr>
</#list>


</table>
  </td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr >
    <td>
         第${pNum}/${totalPage}页
         			<#assign upPage = pNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>
        <a href ="../dxal/${action}.action?pNum=1&funcCode=${funcCode}">首页</a>
        <a href ="../dxal/${action}.action?pNum=${upPage}&funcCode=${funcCode}">上一页</a>	
        <a href ="../dxal/${action}.action?pNum=${downPage}&funcCode=${funcCode}">下一页</a>
        <a href ="../dxal/${action}.action?pNum=${totalPage}&funcCode=${funcCode}">末页</a>
        第
        <input name="gotoPageNum" id="gotoPageNum" type="text" class="inputTextSmall" maxlength="3">
        页
        <a href="#" onclick="gotoPage()">跳转</a>
     </td>
  </tr>
</table>

</form>
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
</script> 



