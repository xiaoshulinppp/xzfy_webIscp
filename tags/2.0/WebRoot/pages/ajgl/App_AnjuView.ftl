<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		
		<link rel="stylesheet" type="text/css" href="../css/style1.css">
<script type="text/javascript" src="../js/html5.js"></script>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/treeJs.js"></script>
		
<title></title>		
<style type="text/css">z_wrap_bg,.z_wrap_bg{behavior: url(../css/ie-css3.htc);} </style> 
	</head>
	<body>
	<div class="z_wrap_bg relative">
		<h2 class="z_title"><a href="../ajgl/xzfy_mulu.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}">${xzfyInfo.tjzfzh?default('进入案件')}</a></h2>
		<ul class="z_index_c">
			<li class="clearfix"><div class="fl w01">申请人：</div><div class="fl w02">${xzfyInfo.app_show?default('')}</div></li>
			<li class="clearfix"><div class="fl w01">被申请人：</div><div class="fl w02">${xzfyInfo.defendant_name?default('')}</div></li>
			<li class="clearfix"><div class="fl w01">简要内容：</div><div class="fl w02">${xzfyInfo.content_abstract?default('')}</div></li>
		</ul>
	<a href="../ajgl/xzfy_mulu.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}" title="进入案件"  class="i-r-link"><i class="righg-icon nonea"></i></a>
	</div>
	
	</body>
</html>