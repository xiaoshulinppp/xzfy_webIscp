<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

	
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/style_anju.css">
	<script type="text/javascript" src="../js/html5.js"></script>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/treeJs.js"></script>	
		<style type="text/css">z_wrap_ml,.z_wrap_ml{behavior: url(../css/ie-css3.htc);}</style> 
	</head>
	<body>
	<div class="z_wrap_ml">
		<h2 class="z_title">案卷目录</h2>
		<dl class="z_ml_cont jsMlCont">
			<dt><span class="z_ml_text fl"><a href="#" class="z_jian"></a><a href="../xzfy/editXzfy.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}" >接待阶段</a></span><span class="z_ml_num fr">1</span></dt>
			<dd><span class="z_ml_text fl"><a href="../xzfy/editXzfy.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}" >接待信息</a></span><span class="z_ml_num fr">2</span></dd>
			<dd><span class="z_ml_text fl">
			<a href="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131021070651&d_username=${Session['_USER_STYLE_'].name&caseId=${xzfyId}">接待笔录</a>
			</span><span class="z_ml_num fr">3</span></dd>
		</dl>
		<dl class="z_ml_cont jsMlCont">
			<dt><span class="z_ml_text fl"><a href="#" class="z_jian"></a><a  href="../xzfy/lianTiqu.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}">立案阶段</a></span><span class="z_ml_num fr">4</span></dt>
			<dd><span class="z_ml_text fl"><a  href="../xzfy/lianTiqu.action?xzfyId=${xzfyInfo.id}&funcCode=${funcCode}">立案信息</a></span><span class="z_ml_num fr">5</span></dd>
			<dd><span class="z_ml_text fl"><a href="http://localhost:8080/webIscp/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20131014150926&d_username=panglei&caseId=${xzfyId}" target="_blank">补正审批</a></span><span class="z_ml_num fr">6</span></dd>
			<dd><span class="z_ml_text fl">立案审批</span><span class="z_ml_num fr">7</span></dd>
		</dl>

		<dl class="z_ml_cont jsMlCont">
			<dt><span class="z_ml_text fl"><a href="#" class="z_jian"></a>办案接待</span><span class="z_ml_num fr">8</span></dt>
			<dd><span class="z_ml_text fl">办案信息</span><span class="z_ml_num fr">9</span></dd>
			<dd><span class="z_ml_text fl">延期审批</span><span class="z_ml_num fr">10</span></dd>
			<dd><span class="z_ml_text fl">结案审批</span><span class="z_ml_num fr">11</span></dd>
		</dl>

		<dl class="z_ml_cont jsMlCont">
			<dt><span class="z_ml_text fl">操作日志</span><span class="z_ml_num fr">12</span></dt>
		</dl>
	</div>
	</body>
</html>
