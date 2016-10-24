<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>信息采集报送平台</title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" style="width:98%;">
			<tr>
				<td height="20">信息采集报送平台 > 用户管理 > 组织管理</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>组织列表</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
			<tr>
				<td width="100" class="cardNormal"><a href="../newUser/showOrgInfo.action?funcCode=${funcCode}&orgId=${orgId}" class="cardLink">组织信息</a></td>
				<td width="100" class="cardActive">组织子项</td>
				<td class="cardThZf">&nbsp;</td>
				<td align="right">
					<input type="button" value="新 增" class="button" onclick="gotoCreateChildOrg();" />
					<input type="button" value="删 除" class="button" onclick="deleteOrgBatch();" />
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabout">
			<tr>
				<th class="thListNormal">
					<input type="checkbox" id="checkAll" onclick="checkAll();" />
				</th>
				<th class="thListNormal">组织名称</th>
				<th class="thListNormal">组织编码</th>
				<th class="thListNormal">组织缩写</th>
			</tr>
			<#assign index = 1>
			<#list orgList as data>
			<tr class="trColor">
				<td class="tdlistCenter">
					<input type="checkbox" name="orgIds" value="${data.id}" />
				</td>
				<td class="tdlistCenter">${data.name}</td>
				<td class="tdlistCenter">${data.bm}</td>
				<td class="tdlistCenter">${data.locbm?default('')}</td>
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
				window.location = "../newUser/getChildOrgList.action?funcCode=${funcCode}&pageNum=" + mpage  + "&orgId=${orgId}";
			}
			
			function keyUpFunc(oEvent){
				if(oEvent.keyCode == 13 || oEvent.keyCode == 108){
					oEvent.keyCode=0;
					gotoPage();
				}
			}
		
			function gotoPage(){
				var inputPage = window.document.getElementById("gotoPageNum").value;
				if(!inputPage.match("^\\d+$")){
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
					window.location = "../newUser/getChildOrgList.action?funcCode=${funcCode}&pageNum=" + inputPage + "&orgId=${orgId}";
				}
				return;
			}
		</script>
		<form id="deleteForm" action="../newUser/deleteOrgBatch.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" id="orgIdsHidden" name="orgIds" value="" />
			<input type="hidden" name="orgId" value="${orgId}" />
		</form>
	</body>
</html>
<script type="text/javascript">
	
	window.onload = function(){
		window.parent.expandTree('${orgId}');
	}
	
	function gotoCreateChildOrg(){
		window.location.href = "../newUser/gotoCreateChildOrg.action?funcCode=${funcCode}&orgId=${orgId}";
	}
	
	function deleteOrgBatch(){
		var orgIds = "";
		var trueIndex = 0;
		var index = 0;
		var checkBoxes = window.document.getElementsByName("orgIds");
		for(var i = 0; i < checkBoxes.length; i++){
			if(checkBoxes[i].checked == true){
				trueIndex = i;
			}
		}
		for(var i = 0; i < checkBoxes.length; i++){
			if(checkBoxes[i].checked == true){
				orgIds += checkBoxes[i].value;
				if(index != trueIndex){
					orgIds += ",";
				}
			}
			index++;
		}
		window.document.getElementById("orgIdsHidden").value = orgIds;
		window.document.getElementById("deleteForm").submit();
	}
	
	function checkAll(){
		var checkBoxes = window.document.getElementsByName("orgIds");
		if(!judgeCheckAll()){
			for(var i = 0; i < checkBoxes.length; i++){
				checkBoxes[i].checked = false;
			}
		}else{
			for(var i = 0; i < checkBoxes.length; i++){
				checkBoxes[i].checked = true;
			}
		}
	}
	
	function judgeCheckAll(){
		var isCheckAll = window.document.getElementById("checkAll");
		if(isCheckAll.checked == true){
			return true;
		}else{
			return false;
		}
	}
</script>