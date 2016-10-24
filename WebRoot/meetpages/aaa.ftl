<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
	</head>
	<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
	
	
	<body>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>添加</td>
			</tr>
		</table>
		
		
		<form id="createForm" action="" method="post" >
		<input type="hidden" name="term.termId" value="${tempid}" />
		
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr class="trwhite">
				<td class="tdFormText">当前届数</td>
				<td class="tdFormInput">
					<input type="text" name="term.currentTermNo" value="" class="inputTextNormal" />
				</td>
				
				<td class="tdFormText"> 创建时间</td>
			
				
				<td class="tdFormInput" width="25%">
			    <input name="term.createTime" type="text" class="inputTextNormal"  value="${todate}"
			    			onClick="WdatePicker()"  >
			      </td>
				
			</tr>	
		</table>
		
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" id="sunbt" class="button" value="提 交" onclick="createTerm();" />
				
				</td>
			</tr>

			<input type="hidden" name="funcCode" value="${funcCode}" />

		</form>
		</table>
		
	</body>
</html>
<script type="text/javascript">
	function createTerm(){
		if(confirm("确认提交？")){
			window.createForm.action="saveTerm.action";
		
			window.createForm.submit();
		}
	}
	
	function gotoBack(){
		window.history.back();
	}
</script>