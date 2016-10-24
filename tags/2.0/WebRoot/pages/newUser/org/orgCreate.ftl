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
				<td>创建组织</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr>
				<th class="thListNormal">&nbsp;</th>
				<th class="thListNormal">&nbsp;</th>
				<th class="thListNormal">&nbsp;</th>
				<th class="thListNormal">&nbsp;</th>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">组织名称</td>
				<td class="tdFormInput">
					<input type="text" id="orgName" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">组织编码</td>
				<td class="tdFormInput">
					<input type="text" id="orgBm" value="" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trcolor">
				<td class="tdFormText">组织缩写</td>
				<td class="tdFormInput">
					<input type="text" id="orgLocbm" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">组织状态</td>
				<td class="tdFormInput">
					<select id="orgState" class="selectStyleNormal">
						<option value="1">启动</option>
						<option value="0">禁用</option>
					</select>
				</td>
			</tr>
			<tr class="trcolor">
				<td class="tdFormText">组织顺序</td>
				<td class="tdFormInput">
					<input type="text" id="orgSeq" value="${orgSeq}" class="inputTextNormal" />
				</td>
				<td class="tdFormText">&nbsp;</td>
				<td class="tdFormInput">&nbsp;</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" class="button" value="提 交" onclick="createChildOrg();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>
		</table>
		<form id="createForm" action="../newUser/createChildOrg.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="orgId" value="${orgId}" />
			<input type="hidden" id="nameHidden" name="org.name" value="" />
			<input type="hidden" id="bmHidden" name="org.bm" value="" />
			<input type="hidden" id="locbmHidden" name="org.locbm" value="" />
			<input type="hidden" id="stateHidden" name="org.state" value="" />
			<input type="hidden" id="seqHidden" name="org.seq" value="" />
		</form>
	</body>
</html>
<script type="text/javascript">
	function createChildOrg(){
		var name = window.document.getElementById("orgName").value;
		var bm = window.document.getElementById("orgBm").value;
		var locbm = window.document.getElementById("orgLocbm").value;
		var state = window.document.getElementById("orgState").value;
		var seq = window.document.getElementById("orgSeq").value;
		if("" == name){
			alert("组织名称不能为空！");
			return;
		}
		if("" == bm){
			alert("组织编码不能为空！");
			return;
		}
		var regex = "^\\d+$";
		if(!seq.match(regex)){
			alert("组织顺序不能为空！");
			return;
		}
		if(confirm("确认提交？")){
			window.document.getElementById("nameHidden").value = name;
			window.document.getElementById("bmHidden").value = bm;
			window.document.getElementById("locbmHidden").value = locbm;
			window.document.getElementById("stateHidden").value = state;
			window.document.getElementById("seqHidden").value = seq;
			window.document.getElementById("createForm").submit();
		}
	}
	
	function gotoBack(){
		window.history.back();
	}
</script>