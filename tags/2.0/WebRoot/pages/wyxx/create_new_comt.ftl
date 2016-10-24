<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
		<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
	
	<!--                       Javascripts 注意不要改变顺序                      -->
<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>
	</head>
	<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
	
	<body>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
			<tr>
				<td>添加</td>
			</tr>
		</table>
		<form id="createForm" action="../wyxx/saveNewComt.action" method="post" >
		<input type="hidden" name="funcCode" value="${funcCode}" />
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
			<tr class="trwhite">
				<td class="tdFormText">姓名</td>
				<td class="tdFormInput">
					<input type="text" name="member.memName" value="" class="inputTextNormal" />
				</td>
				
				<td class="tdFormText">性别</td>
				<td class="tdFormInput">
					<select name="member.sexy">
					<option value="">选择</option>
					<option value="1" >男</option>
					<option value="2" >女</option>
					</select>
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">身份证号</td>
				<td class="tdFormInput">
					<input type="text" name="member.certId" value="" class="inputTextNormal" />
				</td>
				
				<td class="tdFormText">出生日期</td>
				<td class="tdFormInput">
					<input type="text" name="member.born" value="${toDate}" class="inputTextNormal" onClick="WdatePicker()">
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">年龄</td>
				<td class="tdFormInput">
					<input type="text" name="member.age" value="" class="inputTextNormal" />
				</td>
				
				<td class="tdFormText">电话号码</td>
				<td class="tdFormInput">
					<input type="text" name="member.phone" value="" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">学历</td>
				<td class="tdFormInput">
				    <select name="member.education">
					<option value="">选择</option>
					<option value="小学" >小学</option>
					<option value="初中" >初中</option>
					<option value="高中" >高中</option>
					<option value="本科" >本科</option>
					<option value="硕士" >硕士</option>
					<option value="博士" >博士</option>
					</select>
				</td>
				
				<td class="tdFormText">技术职称</td>
				<td class="tdFormInput">
				    <select name="member.techType">
					<option value="">选择</option>
					<option value="初级" >初级</option>
					<option value="中级" >中级</option>
					<option value="副高" >副高</option>
					<option value="正高" >正高</option>
					<option value="硕导" >硕导</option>
					<option value="博导" >博导</option>
					</select>
				
					
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">工作单位</td>
				<td class="tdFormInput">
					<input type="text" name="member.workName" value="" class="inputTextNormal" />
				</td>
				
				<td class="tdFormText">邮箱</td>
				<td class="tdFormInput">
					<input type="text" name="member.email" value="" class="inputTextNormal" />
				</td>
			</tr>
			
			
			
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
			<tr>
				<td>
					<input type="button" id="sunbt" class="buttonNormal" value="提 交" onclick="createApp();" />
					<input type="button" class="buttonNormal" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>

			
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
		window.history.back();
	}
</script>