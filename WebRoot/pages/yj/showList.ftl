<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>


<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css" />

</head>

<body>
<form action="''" name="form" id="form" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->

<input type="hidden" name="funcCode" value="${funcCode}" />
<!--主体内容、列表显示区域。注意上边的区域定义必须保持-->

<table width="98%" border="0" cellpadding="0" cellspacing="0" align="center" class="tabMainTop">
<tr><td class="tdFormInput">
&nbsp;&nbsp;&nbsp;&nbsp;共计:${pageList.getTotalCount()}条</td></tr> 
<tr><td>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
<tr>  
<th class="thListNormal">序号</th>
<th class="thListNormal">立案日期</th>
<th class="thListNormal">申请人</th>
<th class="thListNormal">案号</th>
<th class="thListNormal">承办人</th>
<th class="thListNormal">案件状态</th>
<th class="thListNormal">提取</th>


</tr>
<#list infoList as info>
<tr class="trcolor">
<td class="tdlistCenter" >&nbsp;${info_index+1}</td>
<td class="tdlistCenter" >&nbsp;<#if info.lian_date?has_content>${info.lian_date}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if info.app_show?has_content>${info.app_show}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if info.tjzfzh?has_content>${info.tjzfzh}</#if></td>
<td class="tdlistCenter" >&nbsp;<#if info.admit1?has_content>${info.admit1}、</#if><#if info.admit2?has_content>${info.admit2}</#if></td>
<td class="tdlistCenter" >&nbsp;未办理</td>
<td class="tdlistCenter"><a href="#"><img src="../images/15B/sicons/file_modf.gif"  width="16" height="16" border="0"></a></td>

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
        <a href ="../yj/showList.action?pNum=1&funcCode=${funcCode}">首页</a>
        <a href ="../yj/showList.action?pNum=${upPage}&funcCode=${funcCode}">上一页</a>	
        <a href ="../yj/showList.action?pNum=${downPage}&funcCode=${funcCode}">下一页</a>
        <a href ="../yj/showList.action?pNum=${totalPage}&funcCode=${funcCode}">末页</a>
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
					window.location = "../bsqr/showList.action?funcCode=${funcCode}&pNum=" + inputPage + "";
				}
				return;
			}
</script>