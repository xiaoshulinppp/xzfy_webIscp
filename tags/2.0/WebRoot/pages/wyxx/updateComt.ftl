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
	<body>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="ui-table  ui-table-list  list-fixed">
			<tr>
				<td>委员信息修改</td>
			</tr>
		</table>
		<form id="createForm" action="../wyxx/updateCommittee.action" method="post">
		<input type="hidden" name="funcCode" value="${funcCode}" />
	    <input type="hidden" name="member.memId" value="${member.memId}"/>
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed">
			<tr class="trwhite">
				<td class="tdFormText">姓名</td>
				<td class="tdFormInput">
					<input type="text" name="member.memName" value="${member.memName}" class="inputTextNormal" />
				</td>
				
				<td class="tdFormText">性别</td>
				<td class="tdFormInput">
					<select name="member.sexy">
					<option value="" <#if member.sexy=="">selected</#if>>选择</option>
					<option value="1" <#if member.sexy=="1">selected</#if>>男</option>
					<option value="2" <#if member.sexy=="2">selected</#if>>女</option>
					</select>
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">身份证号</td>
				<td class="tdFormInput">
					<input type="text" name="member.certId" value="${member.certId}" class="inputTextNormal" />
				</td>
				
				<td class="tdFormText">出生日期</td>
				<td class="tdFormInput">
					<input type="text" name="member.born" value="${member.born}" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">年龄</td>
				<td class="tdFormInput">
					<input type="text" name="member.age" value="${member.age}" class="inputTextNormal" />
				</td>
				
				<td class="tdFormText">电话号码</td>
				<td class="tdFormInput">
					<input type="text" name="member.phone" value="${member.phone}" class="inputTextNormal" />
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">学历</td>
				<td class="tdFormInput">
				    <select name="member.education">
					<option value="" <#if member.education=="">selected</#if>>选择</option>
					<option value="小学" <#if member.education=="小学">selected</#if>>小学</option>
					<option value="初中" <#if member.education=="初中">selected</#if>>初中</option>
					<option value="高中" <#if member.education=="高中">selected</#if>>高中</option>
					<option value="本科" <#if member.education=="本科">selected</#if>>本科</option>
					<option value="硕士" <#if member.education=="硕士">selected</#if>>硕士</option>
					<option value="博士" <#if member.education=="博士">selected</#if>>博士</option>
					</select>
				</td>
				
				<td class="tdFormText">技术职称</td>
				<td class="tdFormInput">
					<select name="member.techType">
					<option value="" <#if member.techType=="">selected</#if>>选择</option>
					<option value="初级" <#if member.techType=="初级">selected</#if>>初级</option>
					<option value="中级" <#if member.techType=="中级">selected</#if>>中级</option>
					<option value="副高" <#if member.techType=="副高">selected</#if>>副高</option>
					<option value="正高" <#if member.techType=="正高">selected</#if>>正高</option>
					<option value="硕导" <#if member.techType=="硕导">selected</#if>>硕导</option>
					<option value="博导" <#if member.techType=="博导">selected</#if>>博导</option>
					</select>
				</td>
			</tr>
			
			<tr class="trwhite">
				<td class="tdFormText">工作单位</td>
				<td class="tdFormInput">
					<input type="text" name="member.workName" value="${member.workName}" class="inputTextNormal" />
				</td>
				
				<td class="tdFormText">邮箱</td>
				<td class="tdFormInput">
					<input type="text" name="member.email" value="${member.email}" class="inputTextNormal" />
				</td>
			</tr>
			
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="ui-table  ui-table-list  list-fixed">
			<tr>
				<td>
					<input type="button" id="sunbt" class=""ui-btn ui-btn-yellow" value="提 交" onclick="createApp();" />
					<input type="button" class=""ui-btn ui-btn-yellow" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>

			
		</form>
		</table>
	</body>
</html>
<script type="text/javascript">
	function createApp(){
		if(confirm("确认提交？")){
			window.document.getElementById("sunbt").disabled=true;
			window.document.getElementById("createForm").submit();
		}
	}
	
	function gotoBack(){
		window.history.back();
	}
</script>