<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
		<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
		<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
		<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
		<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<!-- 组件template -->
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
		<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
	</head>
	<body>
	<#include "../website/header.ftl">
	<div class="wal pageNow2">
      <div class="fl">当前位置：行程管理--查看行程</div>
	</div>
	<div class="pageBg1">
		<div class="wal">
			<form id="form" action="../schedule/saveSchedule.action" name="form" method="post" ENCTYPE="multipart/form-data">
			<input type="hidden" name="funcCode" value="${funcCode}">
				<div class="pageBox">
        			<div class="searchList">
            			<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<th>日期</th>
								<td>
									${scheduleInfo.scheduleDate}
								</td>
								<th>标题</th>
								<td>
									${scheduleInfo.title}
								</td>
							</tr>
						
							<tr>
								<th width="12%">内容</th>
								<td colspan='3' align="left">
									${scheduleInfo.content?default('')}
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
			</div>
		</div>
		<div class="foot">
		版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
		电话：65193431
		</div>
	</body>
</html>