<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>案件办理</title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/base.css" rel="stylesheet" type="text/css" />
		<link href="../${Session['_USER_STYLE_'].cssPath}/main_style.css" rel="stylesheet" type="text/css" />
		<link href="../css/style_form.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/16B/prototype.js"></script>
		<script type="text/javascript" src="../js/16B/funcCode.js"></script>		
			<!--                       Javascripts 注意不要改变顺序                      -->
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
		<!-- 组件template -->
		<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
		<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
		<style>
			.diva{
			BORDER:#bfceff 1px solid;
			height:22;
			FILTER:progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr='#ddecfb',endColorStr='#ffffff');
			PADDING-TOP: 3px; 
			}
			.divb{
			BORDER: #bfceff 1px solid;
			PADDING-TOP: 10px; 
			PADDING-LEFT: 10px;
			FONT-SIZE: 12px;
			HEIGHT: 100px;
			width:180;
			border-top:0;
			}
		</style>
		<SCRIPT language=JavaScript src="../pages/xzfy/js/funcCode.js"></SCRIPT>
	</head>
	<body>
		<div class="ui-form fn-clear">
			<table class="ui-table ui-table-form">
			<tr>
				<td align="center">案件办理通道</td><td align="center">您所在复议机关名称：<font color="red"> ${bumen} </font></td>
			</tr>
			<tr>
				<td align="center" colspan=2>
					<p align=left>&nbsp;&nbsp;&nbsp;
						您单位目前有<a href="../banan/showanjianbanliList.action?listkeyword=1&funcCode=${funcCode}"> <font color="red"> ${weibanjieList.size()} </font> </a> 件行政复议案件未办结，
						其中：审理期限不满20天的有<a href="../banan/showanjianbanliList.action?listkeyword=2&funcCode=${funcCode}"><font color="red">${shenliqixian_20_List.size()}</font></a>件，
						不满10天的有<a href="../banan/showanjianbanliList.action?listkeyword=3&funcCode=${funcCode}"><font color="red">${shenliqixian_10_List.size()}</font></a>件，
						<a href="../banan/showanjianbanliList.action?listkeyword=4&funcCode=${funcCode}"><font color="red">${shenliqixian_chaoqi_List.size()}</font></a>件案件已超期，
						<a href="../banan/showanjianbanliList.action?listkeyword=5&funcCode=${funcCode}"><font color="red">${zhongzhiList.size()}</font></a>件案件处于中止状态。</p>
					<p align=left>&nbsp;&nbsp;&nbsp;
						您单位有<a href="../banan/showanjianbanliList.action?listkeyword=6&funcCode=${funcCode}"><font color="red">${newdaifenpeiList.size()}</font></a>件新收案件待分配，
						有<a href="../banan/showanjianbanliList.action?listkeyword=7&funcCode=${funcCode}"><font color="red">${weizhidingList.size()}</font></a>件已受理案件未指定承办人</p>
					<p align=left>&nbsp;&nbsp;&nbsp;
						您目前有<a href="../banan/showanjianbanliList.action?listkeyword=8&funcCode=${funcCode}"><font color="red"> ${dailianshenchaList.size()}</font></a>件案件待立案审查，
						<a href="../banan/showanjianbanliList.action?listkeyword=9&funcCode=${funcCode}"><font color="red"> ${daibanliList.size()}</font></a>件案件待办理</p>
					<p align=left>&nbsp;&nbsp;&nbsp;
						您目前有<a href="../banan/showanjianbanliList.action?listkeyword=10&funcCode=${funcCode}"><font color="red"> ${daishenpiList.size()}</font></a>件案件待审批，
						有<a href="../banan/showanjianbanliList.action?listkeyword=11&funcCode=${funcCode}"><font color="red"> ${dailianshenpiList.size()} </font></a>件案件待立案审批（动态获取）</p>
					<p align=left>&nbsp;&nbsp;&nbsp;
						<font color="red"> ${subbumen} </font>
						目前有 <a href="../banan/showanjianbanliList.action?listkeyword=12&funcCode=${funcCode}"> <font color="red"> ${weibanjie_sub_List.size()} </font></a> 件行政复议案件未办结，
						其中：<a href="../banan/showanjianbanliList.action?listkeyword=13&funcCode=${funcCode}"><font color="red"> ${shenliqixian_sub40_List.size()} </font></a>件审理时间已满40天，
						<a href="../banan/showanjianbanliList.action?listkeyword=14&funcCode=${funcCode}"><font color="red"> ${shenliqixian_sub50_List.size()} </font></a>件审理时间已满50天，
						<a href="../banan/showanjianbanliList.action?listkeyword=15&funcCode=${funcCode}"><font color="red"> ${shenliqixian_subchaoqi_List.size()} </font></a>件案件已超期。</p>
				</td>
			</tr>
			</table>
		</div>
	
	
	
	</body>
</html>