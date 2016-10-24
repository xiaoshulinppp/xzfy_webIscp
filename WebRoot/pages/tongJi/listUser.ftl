<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
		<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
		<!-- 组件template -->
		<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>
	</head>
	<body>
		<span class="x-line fn-clear">
			<img src="../sys_theme/images/pic_search_line.png">
		</span>
		<div class="ui-list-nobtnbar fn-clear ">
			<table class="ui-table ui-table-list list-fixed ">
				<thead class=""  id="" name="" >
					<tr>
						<th width="10%">序号</th>
						<th>姓名</th>
						<th>电话</th>
					<tr>
				</thead>
				<tbody class="discolor">
					<#list userList as user>
					<tr>
						<td>${user_index+1}</td>
						<td>${user.name?default("")}</td>
						<td>${user.phone?default("")}</td>
					</tr>
					</#list>
				</tbody>
			</table>
		</div>
	</body>	
</html>
