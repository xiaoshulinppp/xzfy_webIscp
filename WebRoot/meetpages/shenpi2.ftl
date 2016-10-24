<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
	</head>
	<body>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>审批</td>
			</tr>
		</table>
		<form id="createForm" action="../xzfy/showshenpilist.action" method="post" >
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr class="trwhite">
				<td class="tdFormText">申请人</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.app_name" value="${xzfy.app_name}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">代表人</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.Deputy_name" value="${xzfy.Deputy_name}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">代理人</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.Agent_name" value="${xzfy.Agent_name}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">被申请人</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.Defendant_real_name" value="${Defendant_real_name}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">第三人</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.Third" value="${Third}" class="inputTextNormal" />
				</td>
				<td class="tdFormText">代理人</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.Third_agent" value="${Third_agent}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">案件类型</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.CaseType" value="${CaseType}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">收案日期</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.Receive_date" value="${Receive_date}" class="inputTextNormal" />
				</td>
				<td class="tdFormText">立案日期</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.Lian_date" value="${Lian_date}" class="inputTextNormal" />
				</td>
			</tr>
			 <tr class="trcolor">
	 <td  class="tdFormText">承办人意见</td>
	 <td class="tdFormInput" colspan=3>
	  <textarea name="xzfy.SecondSubmitResult" style="overflow-y:visible;" rows="10" id="answerValue" type="text" class='textarea' >

</textarea>
</td>
	 <td  class="tdFormText">领导意见</td>
	 <td class="tdFormInput" colspan=3>
	  <textarea name="xzfy.FirstSubmitResult" style="overflow-y:visible;" rows="10" id="answerValue" type="text" class='textarea' >

</textarea>
</td>
	 </tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="提 交" onclick="createApp();" />
					<input type="button" class="button" value="查看结案文书" onclick="gotoBack();" />
				</td>
			</tr>
			<input type="hidden" name="xzfyId" value="${xzfyId}" />
			<input type="hidden" name="funcCode" value="${funcCode}" />
		</form>
		</table>
	</body>
</html>
<script type="text/javascript">
	function createApp(){
		if(confirm("确认提交？")){
			window.document.getElementById("sunbt").disabled=true;;
			window.document.getElementById("createForm").submit();
		}
	}
	
	function gotoBack(){
		window.open("http://localhost:8080/webIscp/bac_default_jieanwenshu");
	}
</script>