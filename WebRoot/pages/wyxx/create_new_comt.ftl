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
		<input type="hidden" name="member.locbm" value="${locbm}" />
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
			    <td class="tdFormText">工作单位</td>
				<td class="tdFormInput">
					<input type="text" name="member.workName" value="" class="inputTextNormal" />
				</td>
			   
			    <td class="tdFormText">学历</td>
				<td class="tdFormInput">
				    <select name="member.education">
					<option value="">选择</option>
					<option value="小学">小学</option>
					<option value="初中">初中</option>
					<option value="高中">高中</option>
					<option value="本科">本科</option>
					<option value="硕士">硕士</option>
					<option value="博士">博士</option>
					</select>
				</td>			
			</tr>

			
			<tr class="trwhite">
				<td class="tdFormText">类别</td>
				<td class="tdFormInput">					
					<select name="member.type">
					<option value="">选择</option>
					<option value="1">主任委员</option>
					<option value="2">常务副主任委员</option>
					<option value="3">副主任委员</option>
					<option value="4">常任委员</option>
					<option value="5">非常任委员</option>
					</select>
				</td>
				
				<td class="tdFormText">职务</td>
				<td class="tdFormInput">
					<input type="text" name="member.position" value="" class="inputTextNormal" />
				</td>
		    </tr>
		    
			<tr class="trwhite">
				<td class="tdFormText">电话号码</td>
				<td class="tdFormInput">
					<input type="text" name="member.phone" value="" class="inputTextNormal" />
				</td>
				
				<td class="tdFormText">填写日期</td>
				<td class="tdFormInput">
					<input type="text" name="member.recordDate" value="${toDate}" class="inputTextNormal" onClick="WdatePicker()">
				</td>
			</tr>	
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="ui-table  ui-table-list  list-fixed ">
			<tr>
				<td>
				<input   class="ui-btn ui-btn-yellow" type="button" name="button" onclick="createApp();"  value="提交"  />
				<input class="ui-btn ui-btn-normal" onclick="gotoBack();" type="button" value="返回" title="取消并返回"/>

				</td>
			</tr>

			
		</form>
		</table>
	</body>
</html>
<script type="text/javascript">
	function createApp(){
		if(confirm("确认提交？")){
			window.document.getElementById("createForm").submit();
		}
	}
	
	function gotoBack(){
		window.history.back();
	}
</script>