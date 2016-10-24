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
				<td class="tdFormText"> 委托代理人</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.Agent_name" value="${xzfy.Agent_name}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">被申请人</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.Defendant_real_name" value="${Defendant_real_name}" class="inputTextNormal" />
				</td>
				<td class="tdFormText">收案时间</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.Receive_date" value="${Receive_date}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">收案方式</td>
				<td class="tdFormInput">
					<input type="text" name="" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">是否提出听证申请</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.Istingzheng" value="${Istingzheng}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">补正期限</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.Buzheng_from" value="${Buzheng_from}" class="inputTextNormal" />
				</td>
				<td class="tdFormText">办理文号</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.caseNum" value="${caseNum}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">立案审查人</td>
				<td class="tdFormInput">
					<input type="text" name="xzfy.User1_name" value="${User1_name}" class="inputTextNormal" />
				</td>
				<td class="tdFormText">案前调解</td>
				<td class="tdFormInput">
					<select name="xzfy.Istiaojie" >
					<option value="1" <#if xzfy.Istiaojie=='0'>selectd</#if>>未调解</option>
					<option value="2" <#if xzfy.Istiaojie=='1'||xzfy.Istiaojie=='2'>selectd</#if>>${tiaojie_result}</option>
					</select>
				</td>
			</tr>
			<tr class="trwhite">
			<td  class="tdFormText">简要内容</td>
		 <td class="tdFormInput" colspan=3>
	  <textarea name="xzfy.content_abstract" style="overflow-y:visible;" rows="10" id="answerValue" type="text" class='textarea' >
			</textarea>
		</tr>
			<tr class="trwhite">
			<td  class="tdFormText">审查人意见</td>
		 <td class="tdFormInput" colspan=3>
	  <textarea name="xzfy.FirstSubmitResult" style="overflow-y:visible;" rows="10" id="answerValue" type="text" class='textarea' >
			</textarea>
		</tr>

					<tr class="trwhite">
			<td  class="tdFormText">领导批示</td>
    <td class="tdFormInput">
        <select name="xzfy.pifuyijian" style="overflow-y:visible;" rows="10" id="answerValue" type="text" class='textarea'>
		    <option value="1">同意</option>
		    <option value="2">不同意</option>
    </select></td>
		</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="提 交" onclick="createApp();" />
					<input type="button" class="button" value="查看答复通知" onclick="gotoBack();" />
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
		window.open("http://localhost:8080/webIscp/bac_document_edit.jsp?action=read&d_templateid=20131014150926&d_username=panglei&d_recordid=20131019011214&caseId=1");
	}
</script>