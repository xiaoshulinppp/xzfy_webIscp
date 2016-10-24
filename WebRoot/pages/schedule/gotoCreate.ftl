<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
		<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<form id="form" action="../schedule/saveSchedule.action" name="form" method="post" ENCTYPE="multipart/form-data">
		<input type="hidden" name="scheduleInfo.recorder" value="${userName}">
		<input type="hidden" name="scheduleInfo.recorderId" value="${userId}">
		<input type="hidden" name="funcCode" value="${funcCode}">
		<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../sys_theme/images/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">个人工作管理</h2>  </div>       
<!--标题结束-->
<span class="x-line fn-clear"><img src="../sys_theme/images/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
<div class="ui-form fn-clear">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="ui-table ui-table-form ">
			<tr>
				<th>日期</th>
				<td>
					<input type="text" name="scheduleInfo.scheduleDate" onClick="WdatePicker();" class="inputTextNormal"/>
				</td>
				<th>标题</th>
				<td>
					<input type="text"  name="scheduleInfo.title" width="90%"/>
				</td>
			</tr>
			<tr>

				<th >内容</th>
				<td colspan=3>
					<textarea name="scheduleInfo.content" ></textarea>
				</td>
				
			</tr>
<tfoot>
      <tr>
        <td colspan="4"  >
        <input   class="ui-btn ui-btn-yellow" type="submit" name="button" id="" value="提交"  title="提交" />
        
        <input   class="ui-btn ui-btn-normal" type="button" name="button" onclick="window.location='showScheduleList.action?funcCode=${funcCode}'" value="返回"  title="返回" />
        </td>
      </tr>
    </tfoot>			
			
		</table>
		</div>
	
		</form>
		</table>
	</body>
</html>