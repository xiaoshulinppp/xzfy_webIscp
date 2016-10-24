<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>行政复议信息管理系统</title>
		<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
		<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../plugs/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/16B/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="../js/16B/tpl.base.js"></script>
		<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
		<style type="text/css">img,formDiv,.formDiv{behavior: url(../webstyle/style/ie-css3.htc);} </style> 	
		<style type="text/css">img,z_wrap_info,.z_wrap_info{behavior: url(../css/ie-css3.htc);} </style> 
	</head>
	<body>
			<#include "../website/header.ftl">
	
		<div class="wal pageNow2">
	      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> > 
	      <a href="../xzss/showUndertakerList.action?funcCode=${funcCode}">行政诉讼案件列表</a> >查看诉讼案件</div>
	      <div class="fr"></div>
		</div>
		
		
		
		<form id="form1" name="form1" action="''" method="post">
		
		<input type="hidden" name="funcCode" value="${funcCode}" />

	<div class="formDiv" id="banan" >	
		<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
		
			<tr>      
	     		<th>收案日期：</th>
			    <td>
				    <#if xzssInfo.receive_date?has_content>${xzssInfo.receive_date}</#if>
			    </td>
			    <th>承办人</th>
				<td>
					<#if xzssInfo.undertaker_name?has_content>${xzssInfo.undertaker_name}</#if>
				</td>
	  		</tr>
			
			<tr>
				
				<th>复议承办人</th>
				<td>
					<#if xzssInfo.fyundertaker_name?has_content>${xzssInfo.fyundertaker_name}</#if>
				</td>
				<th>原告姓名</th>
				<td>
					<#if xzssInfo.app_name?has_content>${xzssInfo.app_name}</#if>
				</td>
			</tr>
		
			<tr>
				
				<th>原告总数</th>
				<td>
					<#if xzssInfo.app_num?has_content>${xzssInfo.app_num}</#if>
				</td>
				<th>原告类别</th>
				<td>
					<#if xzssInfo.app_type?has_content>${xzssInfo.app_type}</#if>
				</td>
			</tr>

			
			<tr>
				<th>被告姓名</th>
				<td>
					<#if xzssInfo.defendant?has_content>${xzssInfo.defendant}</#if>
				</td>
				<th>代理人</th>
				<td>
					<#if xzssInfo.agent?has_content>${xzssInfo.agent}</#if>
				</td>
			</tr>
			
			<tr>
				<th>应诉机关类别</th>
				<td>
					<#if xzssInfo.jiguan_type?has_content>${xzssInfo.jiguan_type}</#if>
				</td>
				<th>应诉机关级别</th>
				<td>
					<#if xzssInfo.jiguan_level?has_content>${xzssInfo.jiguan_level}</#if>
				</td>
			</tr>
			<tr>	
				<th>应诉机关</th>
				<td>
					<#if xzssInfo.jiguan?has_content>${xzssInfo.jiguan}</#if>
				</td>
				<th>诉讼请求</th>
				<td>
					<#if xzssInfo.request?has_content>${xzssInfo.request}</#if>
				</td>
			</tr>
			
			<tr>
				
				<th>行政管理类别</th>
				<td>
					<#if xzssInfo.manage_type?has_content>${xzssInfo.manage_type}</#if>
				</td>
				<th>是否行政赔偿</th>
				<td>
					<#if xzssInfo.ismoney?has_content>${xzssInfo.ismoney}</#if>
				</td>
			</tr>

			
			<tr>
				<th>被诉具体行政行为名称</th>
				<td>
					<#if xzssInfo.action_name?has_content>${xzssInfo.action_name}</#if>
				</td>
				<th>被诉具体行政行为案号</th>
				<td>
					<#if xzssInfo.action_id?has_content>${xzssInfo.action_id}</#if>
				</td>
			</tr>
			<tr>
				<th>司法建议</th>
				<td>
					<#if xzssInfo.issifajianyi?has_content>${xzssInfo.issifajianyi}</#if>
				</td>
				<th>应诉通知</th>
				<td>
					<#if xzssInfo.yingsutongzhi?has_content>${xzssInfo.yingsutongzhi}</#if>
				</td>
			</tr>
			
			<tr>
				<th>结案文书</th>
				<td>
					<#if xzssInfo.jieanwenshu?has_content>${xzssInfo.jieanwenshu}</#if>
				</td>
				<th>结案日期</th>
				<td>
					<#if xzssInfo.jieandate?has_content>${xzssInfo.jieandate}</#if>
				</td>
			</tr>
			
			<tr>
				<th style="display:none">是否复议</th>
				<td style="display:none">
					<#if xzssInfo.fuyi_id?has_content>${xzssInfo.fuyi_id}</#if>
				</td>
				<th>是否一审</th>
				<td>
					<#if xzssInfo.shen1?has_content>${xzssInfo.shen1}</#if>
				</td>
				<th>是否二审</th>
				<td>
					<#if xzssInfo.shen2?has_content>${xzssInfo.shen2}</#if>
				</td>
			</tr>
			
			
			<tr style="display:none">
				<th>是否三审</th>
				<td>
					<#if xzssInfo.shen3?has_content>${xzssInfo.shen3}</#if>
				</td>
			</tr>
		
		</table>
		</div>
		</form>
	<div class="foot">
			版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
			电话：65193431
		</div>
	</body>
</html>


<script type="text/javascript">
	function createXzss(){
		if(confirm("确认提交？")){
			window.form1.action="saveXzss.action";
			window.form1.submit();
		}
	}
	function gotoBack(){
		window.history.back();
	}
</script>