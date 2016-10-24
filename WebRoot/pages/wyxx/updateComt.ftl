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
	    <input type="hidden" name="member.locbm" value="${member.locbm}"/>
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="ui-table  ui-table-list  list-fixed">
			<tr class="trwhite">
				<td class="tdFormText">姓名</td>
				<td class="tdFormInput">
					<input type="text" name="member.memName" value="${member.memName?default('')}" class="inputTextNormal" />
				</td>
				
				<td class="tdFormText">性别</td>
				<td class="tdFormInput">
					<select name="member.sexy">
					<#assign sex="${member.sexy?default('')}"/>
					<option value="" <#if sex=="" >selected</#if>>选择</option>
					<option value="1"<#if sex=="1">selected</#if>>男</option>
					<option value="2"<#if sex=="2">selected</#if>>女</option>
					</select>
				</td>
			</tr>
			
			<tr class="trwhite">
			    <td class="tdFormText">工作单位</td>
				<td class="tdFormInput">
					<input type="text" name="member.workName" value="${member.workName?default('')}" class="inputTextNormal" />
				</td>
				
				<td class="tdFormText">学历</td>
				<td class="tdFormInput">
				    <select name="member.education">
				    <#assign edu="${member.education?default('')}"/>
					<option value=""<#if edu=="">selected</#if>>选择</option>
					<option value="小学" <#if edu=="小学">selected</#if>>小学</option>
					<option value="初中" <#if edu=="初中">selected</#if>>初中</option>
					<option value="高中" <#if edu=="高中">selected</#if>>高中</option>
					<option value="本科" <#if edu=="本科">selected</#if>>本科</option>
					<option value="硕士" <#if edu=="硕士">selected</#if>>硕士</option>
					<option value="博士" <#if edu=="博士">selected</#if>>博士</option>
					</select>
				</td>
			</tr>
			
			<tr class="trwhite">
			    <td class="tdFormText">类别</td>
				<td class="tdFormInput">
				    <select name="member.type">
				    <#assign type="${member.type?default('')}"/>
					<option value=""  <#if type=="">selected</#if>>选择</option>
					<option value="1" <#if type=="1">selected</#if>>主任委员</option>
					<option value="2" <#if type=="2">selected</#if>>常务副主任委员</option>
					<option value="3" <#if type=="3">selected</#if>>副主任委员</option>
					<option value="4" <#if type=="4">selected</#if>>常任委员</option>
					<option value="5" <#if type=="5">selected</#if>>非常任委员</option>
					</select>
				</td>
				
				<td class="tdFormText">职务</td>
				<td class="tdFormInput">
					<input type="text" name="member.position" value="${member.position?default('')}" class="inputTextNormal" />
				</td>
		    </tr>
		    
			<tr class="trwhite">
				<td class="tdFormText">电话号码</td>
				<td class="tdFormInput">
					<input type="text" name="member.phone" value="${member.phone?default('')}" class="inputTextNormal" />
				</td>
				
				<td class="tdFormText">填写日期</td>
				<td class="tdFormInput">
					<input type="text" name="member.recordDate" value="${member.recordDate}" class="inputTextNormal" />
				</td>
			</tr>		
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="ui-table  ui-table-list  list-fixed">
			<tr>
				<td>
					<input type="button" id="sunbt" class="ui-btn ui-btn-yellow" value="提 交" onclick="createApp();" />
					<input type="button" class="ui-btn ui-btn-normal" value="返 回" onclick="gotoBack();" />
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