<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html  xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>待立案案件列表</td>
			</tr>
	</table>
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabout">
		<tr>
			<th class="thListNormal" width="5%">序号</th>
			<th class="thListNormal" width="13%">案件编号</th>
			<th class="thListNormal" width="30%">申请人</th>
			<th class="thListNormal" width="8%">收案日期</th>
			<th class="thListNormal" width="10%">被申请人种类</th>
			<th class="thListNormal" width="15%">被申请人名称</th>
			<th class="thListNormal" width="8%">立案审查人</th>
			<th class="thListNormal" width="6%">案件状态</th>
			<th class="thListNormal" width="5%">查看</th>
		</tr>
			<#assign index = 1>
			<#list xzfyList as data>
			<tr class="trColor">
				<td class="tdlistCenter">${index?default("")}</td>
				<td class="tdlistCenter">${data.id?default("")}</td>
				<td class="tdlistCenter">${data.app_show?default("")}</td>
				<td class="tdlistCenter">${data.receive_date?default("")}</td>
				<td class="tdlistCenter">
				<#if data.defendant_type?has_content>
						<#if data.defendant_type=='1'>
						乡镇政府
						<#elseif data.defendant_type=='2'>
						县级政府
						<#elseif data.defendant_type=='3'>
						县级政府部门
						<#elseif data.defendant_type=='6'>
						省部级行政机关
						<#elseif data.defendant_type=='7'>
						省级政府部门
						<#elseif data.defendant_type=='8'>
						其他
						<#elseif data.defendant_type=='9'>
						市经济技术开发区管委会
						</#if>
				<#else>
				&nbsp;
				</#if>
				</td>
				<td class="tdlistCenter">${data.defendant_name?default("")}</td>
				<td class="tdlistCenter"><input type="button" id="tiqu" class="button" value="提取" onClick="tiqu('${data.id}')"></td>
				<#if data.status=='1'>
				<td class="tdlistCenter">待立案</td>
				<#else>
				<td class="tdlistCenter">&nbsp;</td>
				</#if>
				
				<td class="tdlistCenter">
					<a href="#" onclick="editXzfy('${data.id}');">
						查看
					</a>
				</td>
			</tr>
			<#assign index = index + 1>
			</#list>
			<#assign countNum = 16>
			<#if index lt countNum>
			<#assign temp = countNum - index>
			<#list 1..temp as x>
			<tr class="trColor">
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
			</tr>
			</#list>
			</#if>
	</table>
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr align="center">
				<td>第${pageNum}/${totalPage}页 
					<a onclick="gopage('1')"  href ="#">首页</a>
					<#assign upPage = pageNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<a onclick="gopage('${upPage}')"  href ="#">上一页</a>
					<#assign downPage = pageNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>
					<a onclick="gopage('${downPage}')"  href ="#">下一页</a>
					<a onclick="gopage('${totalPage}')" href ="#">末页</a>
					第 <input id="gotoPageNum" name="gotoPageNum" type="text" class="inputTextSmall" maxlength="4" onkeypress="keyUpFunc(event);"> 页
					<a href="#" onclick="gotoPage()">跳转</a>
				</td>
			</tr>
	</table>
	<script type="text/javascript">
			function gopage(mpage){
				window.location = "../xzfy/daibanList.action?funcCode=${funcCode}&pageNum=" + mpage  + "&status=0";
			}
			
			function keyUpFunc(oEvent){
				if(oEvent.keyCode == 13 || oEvent.keyCode == 108){
					oEvent.keyCode=0;
					gotoPage();
				}
			}
		
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
					window.location = "../xzfy/daibanList.action?funcCode=${funcCode}&pageNum=" + inputPage + "&status=0";
				}
				return;
			}
		</script>

	</body>
</html>
<script type="text/javascript">
	function editXzfy(id){
		window.location.href = "../xzfy/viewXzfyInfo.action?funcCode=${funcCode}&xzfyId=" + id;
	}
	
	function tiqu(id){
		window.location.href = "../xzfy/getlian.action?funcCode=${funcCode}&xzfyId=" + id;
	}
</script>